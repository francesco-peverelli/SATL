package spatialtemplates

import chisel3._
import chisel3.util._
import freechips.rocketchip.tile._
import freechips.rocketchip._
import freechips.rocketchip.system._
import freechips.rocketchip.config._
import freechips.rocketchip.subsystem._
import freechips.rocketchip.diplomacy._
import freechips.rocketchip.rocket._
import freechips.rocketchip.util._
import template._
import spmv._
import spmvvb._
import spmvdma._
import dma._

class WithRoCCAccumulator extends Config((site, here, up) => {
  case BuildRoCC => List(
    (p: Parameters) => {
        val accumulator = LazyModule(new AccumulatorExample(OpcodeSet.custom0, n = 4)(p))
        accumulator
    })
})

class WithRoCCCharacterCount extends Config((site, here, up) => {
  case BuildRoCC => List(
    (p: Parameters) => {
        val counter = LazyModule(new CharacterCountExample(OpcodeSet.custom2)(p))
        counter
    })
})

class WithDummyTemplate extends Config((site, here, up) => {
    case BuildRoCC => List(
    (p: Parameters) => {
        val dummy_template = LazyModule.apply(new DummyTemplate(OpcodeSet.custom0)(p))
        dummy_template
    })
  }
)

class WithSpMVTemplate(
    n_banks: Int,
    n_queues: Int,
    n_pe: Int,
    resp_q_size: Int,
    req_q_size: Int,
    bank_size: Int,
    data_size: Int,
    dfe_q_size: Int
) extends Config((site, here, up) => {
    case BuildRoCC => List(
    (p: Parameters) => {
        val spmv_template = LazyModule.apply(
            new SpMVTemplateRoCC(OpcodeSet.custom0 | OpcodeSet.custom1 | OpcodeSet.custom2 | OpcodeSet.custom3,
                n_banks, n_queues, n_pe, resp_q_size, req_q_size, bank_size, data_size, dfe_q_size)(p))
        spmv_template
    })
  }
)

class WithSpMVVBTemplate(
    local_n_banks: Int,
    v_n_banks: Int,
    n_queues: Int,
    n_pe: Int,
    resp_q_size: Int,
    local_req_q_size: Int,
    v_req_q_size: Int,
    local_bank_size: Int,
    v_bank_size: Int,
    data_size: Int,
    dfe_q_size: Int
) extends Config((site, here, up) => {
    case BuildRoCC => List(
    (p: Parameters) => {
        val spmv_template = LazyModule.apply(
            new SpMVVBTemplateRoCC(OpcodeSet.custom0 | OpcodeSet.custom1 | OpcodeSet.custom2 | OpcodeSet.custom3,
                local_n_banks, v_n_banks, n_queues, n_pe, 
                resp_q_size, local_req_q_size, v_req_q_size, 
                local_bank_size, v_bank_size, data_size, dfe_q_size)(p))
        spmv_template
    })
  }
)

class WithDMADeviceTemplate(
) extends Config((site, here, up) => {
    case BuildRoCC => List(
    (p: Parameters) => {
        val damd_template = LazyModule.apply(
            new DMADeviceTemplateRoCC(OpcodeSet.custom0 | OpcodeSet.custom1 | OpcodeSet.custom2)(p))
        damd_template
    })
  }
)
//class WithControlledTemplateNPEs(n: Int) extends Config((site, here, up) => {
//    case BuildRoCC => List(
//    (p: Parameters) => {
//        val dummy_template = LazyModule.apply(new ControlledBlinkTemplate(OpcodeSet.custom0, n)(p))
//        dummy_template
//    })
//  }
//)

//class ControlledTemplateNDefaultConfig(n: Int) extends Config(
//    new WithControlledTemplateNPEs(n) ++
//    new freechips.rocketchip.subsystem.WithNBigCores(1)
//)

class DummyTemplateDefaultConfig extends Config(
    new WithDummyTemplate ++
    new WithNBigCores(1)
)

class DummyAccDefaultConfig extends Config(
    new WithRoCCAccumulator ++
    new WithNBigCores(1)
)

class DummyCountDefaultConfig extends Config(
    new WithRoCCCharacterCount ++
    new WithNBigCores(1)
)