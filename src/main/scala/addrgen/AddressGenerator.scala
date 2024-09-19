package addrgen

import chisel3._
import chisel3.util._

/**
 * Abstract address generator module. Any address generator extends this class with different traits.
 */
abstract class AbstractAddressGenerator extends Module {}

/** This abstract bundle defines a passthrough IO designed to be handled outside
  * of the PE instantiating an address generator
  */
abstract class AddressGeneratorPassthroughIO() extends Bundle {}

/**
 * Trait defining an addresss generator with some passthrough IO
 * @attribute pe_ctrl_io is the AddressGeneratorPassthroughIO bundle
 */
trait AddrGenWithPassthrough extends AbstractAddressGenerator {
    val pe_ctrl_io: AddressGeneratorPassthroughIO
}

abstract class AddressGeneratorDMAReadIO extends Bundle {}

trait AddrGetWithDMARead extends AbstractAddressGenerator {
    val dma_get_req_io: AddressGeneratorDMAReadIO
}

abstract class AddressGeneratorDMAWriteIO extends Bundle {}

trait AddrGetWithDMAWrite extends AbstractAddressGenerator {
    val dma_put_req_io: AddressGeneratorDMAWriteIO
}


/**
 * Specialization of an address generator having a passthrough IO
 */
//abstract class PassthroughAddressGenerator extends AbstractAddressGenerator
// with AddrGenWithPassthrough {}

 /**
  * Specialization of an address generator connected to a DFE
 */
trait AddrGenWithDFE extends AbstractAddressGenerator {}

/**
 * Specialization of an address generator connecting to a memory interface
 */
trait AddrGenWithME extends AbstractAddressGenerator {}


class WriteRequest(addr_width: Int, data_width: Int) extends Bundle {
    val address = UInt(addr_width.W)
    val data = UInt(data_width.W)
}

/**
 * IO bundle for a queue-based address generator
*/
class AddressGeneratorIO(nReq: Int, wReq: Int, addr_width: Int, data_width: Int, n_banks: Int) extends Bundle {
    def get_bank_bits(n_banks: Int) : Int = {
        if(n_banks > 1)
            return log2Ceil(n_banks) 
        else 
            return 0
    }
    // Make sure that data width can hold addresses for all banks
    assert(data_width >= addr_width+get_bank_bits(n_banks))
    val addressRequests = Vec(nReq, Decoupled(UInt((addr_width+get_bank_bits(n_banks)).W)))
    val dataResponses = Vec(nReq, Flipped(Decoupled(UInt(data_width.W))))
    val writeRequests = Vec(wReq, Decoupled(new WriteRequest((addr_width+get_bank_bits(n_banks)), data_width)))
    val generatingRequests = Output(Bool())
}

/**
 * Specialization of an address generator having queue-based memory IO
 */
abstract class QueueAddressGenerator(nIO: Int, nWrite: Int, addr_width: Int, data_width: Int, n_banks: Int, bank: Int) extends AbstractAddressGenerator {
  val mem_io = IO(new AddressGeneratorIO(nIO, nWrite, addr_width, data_width, n_banks))
}