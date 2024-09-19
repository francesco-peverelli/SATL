package YoseUe_SATL

import chisel3._
import chisel3.util._
import chisel3.experimental._
import chisel3.stage.ChiselStage
import scala.math._
import spatial_templates._

class TreePEsWrapper(n_trees: Int, max_depth: Int, n_attr: Int, n_classes: Int, n_depths: Int, info_bit: Int, tree_bit: Int, attr_bit: Int, bram_size: Int = 36864, structure_list: List[List[Int]], synthesis: Boolean = false) extends Module{
    
    var total_trees = 0
    var n_pes = 0
    for(i <- 0 until structure_list.length){
        n_pes = n_pes + structure_list(i)(0)
        total_trees = total_trees + structure_list(i)(1)
    }

    println("N_PES", n_pes)

    var rounded_info_bit = 0
    if (info_bit%8==0){
        rounded_info_bit = info_bit
    }else{
        rounded_info_bit = info_bit + 8 - info_bit%8
    }
    var rounded_tree_bit = 0
    if (tree_bit%8==0){
        rounded_tree_bit = tree_bit
    }else{
        rounded_tree_bit = tree_bit + 8 - tree_bit%8
    }
    val compensation = 16
    
    
    val wrapper_io = IO(new Bundle{
        val sample_in = new AxiSample(n_attr,n_classes,n_depths,rounded_info_bit,rounded_tree_bit,compensation)
        val sample_out = Flipped(new AxiSample(n_attr,n_classes,n_depths,rounded_info_bit,rounded_tree_bit,compensation))
    })
    val width = if(synthesis) 32 else 64 
    val brams_io = Seq.fill(n_pes)(IO(new BRAMLikeVivadoIO(width,13,synthesis)))
    
    if (synthesis){
        val cycles_counter = RegInit(0.U.asTypeOf(UInt(32.W)))
        val counting = RegInit(false.B)
        val stop_count = RegInit(false.B)

        val forward_converter = Module(new ForwardConverter(n_attr,n_classes,n_depths,info_bit,tree_bit,rounded_info_bit,rounded_tree_bit,compensation))
        val backward_converter = Module(new BackwardConverter(n_attr,n_classes,n_depths,info_bit,tree_bit,rounded_info_bit,rounded_tree_bit,compensation))
        
        var counter = 0
        
        for(i <- 0 until structure_list.length){
            val pes = Seq.tabulate(structure_list(i)(0))(j => Module(new TreePEwithBRAM(new ElemId(2,i,j,0), n_attr,n_classes,n_depths,info_bit,tree_bit,attr_bit,j%max_depth==0,structure_list(i)(1))))
            val brams = Seq.tabulate(structure_list(i)(0))(j => Module(new BRAMBlackBoxAsymm(32,64,13))) 
            val first_interconnect = Module(new FirstInterconnectPE(new ElemId(2,i,1,0),n_attr,n_classes,n_depths,info_bit,tree_bit))
            val last_interconnect = Module(new LastInterconnectPE(new ElemId(2,i,structure_list(i)(0)+2,0),n_attr,n_classes,n_depths,info_bit,tree_bit))
            val increment = Module(new IncrementTreePE(new ElemId(2,i,structure_list(i)(0)+3,0),n_attr,n_classes,n_depths,info_bit,tree_bit))
            //brams link
            for(j <- 0 until structure_list(i)(0)){

                brams(j).io.b_en := pes(j).pe_io.mem.enable_1
                brams(j).io.b_wr := pes(j).pe_io.mem.write_1
                brams(j).io.b_addr := pes(j).pe_io.mem.addr_1
                brams(j).io.b_din := pes(j).pe_io.mem.dataIn_1
                pes(j).pe_io.mem.dataOut_1 := brams(j).io.b_dout

                brams(j).io.a_en := brams_io(counter).bram_en_a
                brams(j).io.a_wr := brams_io(counter).bram_we_a(0)
                brams(j).io.a_addr := brams_io(counter).bram_addr_a
                brams(j).io.a_din := brams_io(counter).bram_wrdata_a
                brams_io(counter).bram_rddata_a := brams(j).io.a_dout
                brams(j).io.clk := brams_io(counter).bram_clk_a

                pes(j).pe_io.mem.dataOut_2 := DontCare                
                counter = counter + 1
            }

            first_interconnect.linkToDest(pes(0))

            if(i==0){
                forward_converter.linkToDest(first_interconnect)
                when(wrapper_io.sample_in.TVALID & !counting & !stop_count){
                    counting := true.B
                }.elsewhen(last_interconnect.io.sample_leaving.valid & last_interconnect.io.sample_leaving.bits.last){
                    counting := false.B
                    stop_count := true.B
                }.otherwise{
                    counting := counting
                }
            }

            for(j <- 0 until structure_list(i)(0)){
                if(j == structure_list(i)(0)-1){
                    pes(j).linkToDest(last_interconnect)
                }else{
                    pes(j).linkToDest(pes(j+1))
                }
            }
            last_interconnect.linkToDest(increment) 
            increment.linkToDest(first_interconnect)
            backward_converter.linkToDest(last_interconnect)
            backward_converter.addCyclesCounter(cycles_counter)
        }
    
        wrapper_io.sample_in <> forward_converter.io.sample_in
        wrapper_io.sample_out <> backward_converter.io.sample_out

        cycles_counter := Mux(counting,cycles_counter+1.U,cycles_counter)

        
        println("END SYNTHESIS PREPARATION")

    }else{
        val cycles_counter = RegInit(1.U.asTypeOf(UInt(32.W)))
        val counting = RegInit(false.B)
        val stop_count = RegInit(false.B)

        val forward_converter = Module(new ForwardConverter(n_attr,n_classes,n_depths,info_bit,tree_bit,rounded_info_bit,rounded_tree_bit,compensation))
        val backward_converter = Module(new BackwardConverter(n_attr,n_classes,n_depths,info_bit,tree_bit,rounded_info_bit,rounded_tree_bit,compensation))

        val total_pes = 0 

        for(i <- 0 until structure_list.length){
            val num_pes = structure_list(i)(0)
            val pes = Seq.tabulate(num_pes)(j => Module(new TreePEwithBRAM(new ElemId(2,i,j,0), n_attr,n_classes,n_depths,info_bit,tree_bit,attr_bit,j==0,structure_list(i)(1))))
            val brams = Seq.tabulate(num_pes)(j => Module(new BRAMLikeMem1(new ElemId(2,i,j,0),64,13)))
            val first_interconnect = Module(new FirstInterconnectPE(new ElemId(2,i,1,0),n_attr,n_classes,n_depths,info_bit,tree_bit))
            val last_interconnect = Module(new LastInterconnectPE(new ElemId(2,i,num_pes+2,0),n_attr,n_classes,n_depths,info_bit,tree_bit))
            val increment = Module(new IncrementTreePE(new ElemId(2,i,num_pes+3,0),n_attr,n_classes,n_depths,info_bit,tree_bit))
            //brams link
            Seq.tabulate(num_pes)( j => brams(j).connect(pes(j).pe_io.mem, 0, 0))
            Seq.tabulaten(num_pes)( j => brams(j).connect(brams_io(j+total_pes), 1))

            pes.map( _.pe_io.mem.dataOut_2 := DontCare )
            first_interconnect.linkToDest(pes(0))
            total_pes += num_pes

            if(i==0){
                forward_converter.linkToDest(first_interconnect)
                when(wrapper_io.sample_in.TVALID & !counting & !stop_count){
                    counting := true.B
                }.elsewhen(last_interconnect.io.sample_leaving.valid & last_interconnect.io.sample_leaving.bits.last){
                    counting := false.B
                    stop_count := true.B
                }.otherwise{
                    counting := counting
                }
            }

            for(j <- 0 until structure_list(i)(0)){
                if(j == structure_list(i)(0)-1){
                    pes(j).linkToDest(last_interconnect)
                }else{
                    pes(j).linkToDest(pes(j+1))
                }
            }
            last_interconnect.linkToDest(increment) 
            increment.linkToDest(first_interconnect)
            backward_converter.linkToDest(last_interconnect)
            backward_converter.addCyclesCounter(cycles_counter)
        }
        cycles_counter := Mux(counting,cycles_counter+1.U,cycles_counter)
    
        wrapper_io.sample_in <> forward_converter.io.sample_in
        wrapper_io.sample_out <> backward_converter.io.sample_out
        
        println("END SIMULATION PREPARATION")
    }
    
}