package spmv

import chisel3._
import chisel3.util._

import mi._
import pe._
import controller._

/*
class RoCCInstruction extends Bundle {
  val funct = Bits(width = 7)
  val rs2 = Bits(width = 5)
  val rs1 = Bits(width = 5)
  val xd = Bool()
  val xs1 = Bool()
  val xs2 = Bool()
  val rd = Bits(width = 5)
  val opcode = Bits(width = 7)
}

class RoCCCommand(implicit p: Parameters) extends CoreBundle()(p) {
  val inst = new RoCCInstruction
  val rs1 = Bits(width = xLen)
  val rs2 = Bits(width = xLen)
  val status = new MStatus
}

class RoCCResponse(implicit p: Parameters) extends CoreBundle()(p) {
  val rd = Bits(width = 5)
  val data = Bits(width = xLen)
}

 SPMV INSTRUCTION INTERFACE

 | FUNCT | RS1 | RS2 | XD | XS1 |  XS2 |  RD   | OPCODE  |
 |0     6|7  11|12 16| 17 | 18  |  19  |20  24 |25     31|
WRITE_CONFIG_REG
 |cr_addr| val |  pe  | 1  | 1   |  1   |ack_reg| CUSTOM_0 |
<----- OPTIONAL ----->
WRITE_MEM_[32|64]_2
 |lmem_id| val1| val2| 1  | 1   |  1   |ack_reg| CUSTOM_1 |
<-------------------->
WRITE_MEM_[32|64]_1
 |lmem_id| addr| val | 1  | 1   |  1   |ack_reg| CUSTOM_1 |
READ_MEM_[32|64]_1
 |lmem_id| addr| -   | 1  | 1   |  0   |  res  | CUSTOM_2 |
COMPUTE
 |   -   |  -  | -   | 1  | 0   |  0   |ack_reg| CUSTOM_3 |

---------------------------------------------------------

cr_addr mapping:
    0000000 -> in_A
    0000001 -> in_col
    0000010 -> in_x_addr
    0000011 -> in_row_ptr
    0000100 -> in_nrows
    0000101 -> in_xlen_pow2
    0000110 -> in_y_addr
    0000111 -> in_row_start

lmem_id:
-- SpMV:    0 only
-- SpMVVB:  0       -> x_vb
            1-127   -> local PE mem
*/

object SpMVOpcode extends Enumeration {
  val WCREG = Value(11)
  val WMEM32_1 = Value(43)
  val RMEM32_1 = Value(91)
  val EXEC = Value(123)
}

object CRAddress extends Enumeration {
  val A_ADDR_REG = Value(0)
  val COL_ADDR_REG = Value(1)
  val X_ADDR_REG = Value(2)
  val ROW_ADDR_REG = Value(3)
  val N_ROWS_REG = Value(4)
  val X_LEN_REG = Value(5)
  val Y_ADDR_REG = Value(6)
  val ROW_START_REG = Value(7)
}

class SpMVControllerMemIO(addr_width: Int, p_width: Int) extends Bundle {
    val request = Decoupled(new MemRequestIO(p_width, addr_width))
    val response = Flipped(Decoupled(UInt(p_width.W)))
    val busy = Input(Bool())
}

/*
  PE(Flipped) interface
    in_A = Input(UInt((addr_width+get_bank_bits(n_banks)).W))
    in_col_idx = Input(UInt((addr_width+get_bank_bits(n_banks)).W))
    in_row_ptr = Input(UInt((addr_width+get_bank_bits(n_banks)).W))
    in_x_addr = Input(UInt((addr_width+get_bank_bits(n_banks)).W))
    in_y_addr = Input(UInt((addr_width+get_bank_bits(n_banks)).W))
    in_nrows = Input(UInt((addr_width+get_bank_bits(n_banks)).W))
    in_row_start = Input(UInt((addr_width+get_bank_bits(n_banks)).W))

    in_xlen_pow2 = Input(UInt((addr_width+get_bank_bits(n_banks)).W))
    reset_setup = Input(Bool())
*/

class SpMVCommand(xLen: Int = 64) extends Bundle {
  val inst = new RoCCInstruction()
  val rs1 = Bits(xLen.W)
  val rs2 = Bits(xLen.W)
}
class SpMVResponse(xLen: Int = 64) extends Bundle {
  val resp_data = Bits(xLen.W)
}

class SpMVController(creg_width : Int, data_width: Int, n_pe: Int) extends RoCCPEController(n_pe) {
  // IO broadcasting commands to the PE array
  val pe_regs = IO(Flipped(Vec(n_pe, new SpMVAddrGenPassthroughIO(creg_width, data_width, n_pe))))
  val pe_ctrl = IO(Flipped(Vec(n_pe, new CtrlInterfaceIO())))
  // IO reading and writing to local memory
  val mem_io = IO(new SpMVControllerMemIO(creg_width, data_width))
  // Memory holding the current PE configuration values 
  val config_reg = Mem(8*n_pe, UInt(creg_width.W))

  val cmd_queue = Module(new Queue(new SpMVCommand(data_width), 2))
  val resp_queue = Module(new Queue(new SpMVResponse(data_width), 2))
  val reset_setup_reg = Reg(Bool())
  val exe_inflight_reg = RegInit(false.B)
  val last_opcode = RegInit(0.U(13.W))
  val iteration_count = RegInit(0.U(64.W))

  // Count exec iterations
  when(exe_inflight_reg){
    iteration_count := iteration_count + 1.U
  }

  // Hard-wired PE output mapping
  pe_regs.map( _.reset_setup := reset_setup_reg )
  pe_ctrl.map( _.ctrl_cmd.bits := DontCare )
  pe_ctrl.map( _.ctrl_cmd.valid := false.B )

  // PE or mem interface can be busy
  val pe_busy = !(pe_ctrl.map( _.idle).reduce(_ & _)) || mem_io.busy
  io.rocc_cmd.busy := pe_busy || exe_inflight_reg
  // No interrupts ever
  io.rocc_cmd.interrupt := false.B

  // When enqueue is ready, interface is ready, unless exec is in progress
  when(cmd_queue.io.enq.ready && !exe_inflight_reg) {
    io.rocc_cmd.cmd_rdy := true.B
  }.otherwise{
    io.rocc_cmd.cmd_rdy := false.B
  } 
  // When PEs are no loger busy and we have been inflight at leas one cycle,
  // set inflight reg to false and send the valid response
  when(!pe_busy && RegNext(exe_inflight_reg)){
    exe_inflight_reg := false.B
  }
  // Command enqueue fire condition
  when(io.rocc_cmd.cmd_rdy && io.rocc_cmd.cmd_valid) {
    io.rocc_cmd.cmd_inst <> cmd_queue.io.enq.bits.inst 
    cmd_queue.io.enq.bits.rs1 <> io.rocc_cmd.cmd_rs1
    cmd_queue.io.enq.bits.rs2 <> io.rocc_cmd.cmd_rs2
    cmd_queue.io.enq.valid := true.B
  }.otherwise{
    cmd_queue.io.enq.bits := DontCare
    cmd_queue.io.enq.valid := false.B
  }

  // Command dequeue can always be done if mem is ready
  when((io.rocc_cmd.cmd_inst.opcode =/= SpMVOpcode.WMEM32_1.id.U &&
       io.rocc_cmd.cmd_inst.opcode =/= SpMVOpcode.RMEM32_1.id.U) || 
       mem_io.request.ready) {
    cmd_queue.io.deq.ready := true.B
  }.otherwise{
    cmd_queue.io.deq.ready := false.B
  }
  // Dequeue commands fire condition
  val cmd_fire = cmd_queue.io.deq.ready && cmd_queue.io.deq.valid
  // Valid command dequeued with EXEC opcode means we should toggle the setup reg
  when((cmd_queue.io.deq.bits.inst.opcode === SpMVOpcode.EXEC.id.U) && cmd_fire){
    reset_setup_reg := true.B
    exe_inflight_reg := true.B
    iteration_count := 0.U
  }.otherwise{
    reset_setup_reg := false.B
  }
  // Hold response for 1 cycle in case of non-memory operation
  val resp_reg = Reg(UInt(data_width.W))
  // Hold if there was a valid operation last cycle
  val resp_no_mem_valid = Reg(Bool()) 

  // If we are ready to read a new command, and a valid command arrives...
  // Write config register
  when(cmd_fire && cmd_queue.io.deq.bits.inst.opcode === SpMVOpcode.WCREG.id.U) {
    config_reg.write(cmd_queue.io.deq.bits.inst.funct | (cmd_queue.io.deq.bits.rs2 << 3), cmd_queue.io.deq.bits.rs1)

    mem_io.request.bits.write := false.B
    mem_io.request.bits.addr := DontCare
    mem_io.request.bits.dataIn := DontCare
    mem_io.request.valid := false.B

    // Pipe ack response
    resp_reg := 4.U
    resp_no_mem_valid := true.B
    last_opcode := SpMVOpcode.WCREG.id.U
    
  // Write to local memory
  }.elsewhen(cmd_fire && (cmd_queue.io.deq.bits.inst.opcode === SpMVOpcode.WMEM32_1.id.U)) {
    mem_io.request.bits.write := true.B
    mem_io.request.bits.addr := cmd_queue.io.deq.bits.rs1
    mem_io.request.bits.dataIn := cmd_queue.io.deq.bits.rs2
    mem_io.request.valid := true.B
    // Pipe ack response
    resp_reg := 3.U
    resp_no_mem_valid := true.B
    last_opcode := SpMVOpcode.WMEM32_1.id.U

  }.elsewhen(cmd_fire && (cmd_queue.io.deq.bits.inst.opcode === SpMVOpcode.RMEM32_1.id.U)) {

    mem_io.request.bits.write := false.B
    mem_io.request.bits.addr := cmd_queue.io.deq.bits.rs1
    mem_io.request.bits.dataIn := 0.U
    mem_io.request.valid := true.B
    // Ack response is sent next cycle by memory
    resp_reg := 10.U
    resp_no_mem_valid := false.B
    last_opcode := SpMVOpcode.RMEM32_1.id.U

  }.elsewhen(cmd_fire && (cmd_queue.io.deq.bits.inst.opcode === SpMVOpcode.EXEC.id.U)) {
    mem_io.request.bits.write := false.B
    mem_io.request.bits.addr := DontCare
    mem_io.request.bits.dataIn := DontCare
    mem_io.request.valid := false.B
    // Pipe ack response
    resp_reg := 11.U
    resp_no_mem_valid := false.B
    last_opcode := SpMVOpcode.EXEC.id.U

    // When the inflight reg is set to false we need to send a valid response for the Exe instruction
  }.elsewhen(!cmd_fire && (last_opcode === SpMVOpcode.EXEC.id.U) && !exe_inflight_reg) {
    mem_io.request.bits.write := false.B
    mem_io.request.bits.addr := DontCare
    mem_io.request.bits.dataIn := DontCare
    mem_io.request.valid := false.B
    // Pipe ack response
    resp_reg := iteration_count
    resp_no_mem_valid := true.B
    last_opcode := 0.U

  }.otherwise {
    mem_io.request.bits.write := false.B
    mem_io.request.bits.addr := DontCare
    mem_io.request.bits.dataIn := DontCare
    mem_io.request.valid := false.B
    // No valid instruction this cycle
    // Pipe ack response
    resp_reg := 2.U  
    resp_no_mem_valid := false.B
    last_opcode := last_opcode
  }

  val resp_val = Wire(UInt(data_width.W))
  when(mem_io.response.valid && mem_io.response.ready) {
    resp_val := mem_io.response.bits
  }.otherwise{
    resp_val := resp_reg
  }
  
  /*when(!resp_no_mem_valid){
    mem_io.response.ready := true.B
  }.otherwise{
    mem_io.response.ready := false.B
  }*/

  mem_io.response.ready := true.B

  // Enqueue response
  when((resp_no_mem_valid || (mem_io.response.valid && mem_io.response.ready)) && resp_queue.io.enq.ready) {
    resp_queue.io.enq.bits.resp_data := resp_val
    resp_queue.io.enq.valid := true.B
  }.otherwise{
    resp_queue.io.enq.bits.resp_data := DontCare
    resp_queue.io.enq.valid := false.B
  }

  // Connect dequeue response
  io.rocc_cmd.resp_data := resp_queue.io.deq.bits.resp_data
  io.rocc_cmd.resp_valid := resp_queue.io.deq.valid
  resp_queue.io.deq.ready := io.rocc_cmd.resp_rdy  //&& !io.rocc_cmd.busy

  // Send current configuration values to the PEs
  for(i <- 0 until n_pe) {
    pe_regs(i).in_A := config_reg.read(0.U | (i << 3).U)
    pe_regs(i).in_col_idx := config_reg.read(1.U | (i << 3).U)
    pe_regs(i).in_x_addr := config_reg.read(2.U | (i << 3).U)
    pe_regs(i).in_row_ptr := config_reg.read(3.U | (i << 3).U)
    pe_regs(i).in_nrows := config_reg.read(4.U | (i << 3).U)
    pe_regs(i).in_xlen_pow2 := config_reg.read(5.U | (i << 3).U)
    pe_regs(i).in_y_addr := config_reg.read(6.U | (i << 3).U)
    pe_regs(i).in_row_start := config_reg.read(7.U | (i << 3).U)
    
  }
}
