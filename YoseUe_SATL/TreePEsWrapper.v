module ForwardConverter(
  input  [511:0] io_sample_in_TDATA,
  input          io_sample_in_TLAST,
  output         io_sample_in_TREADY,
  input          io_sample_in_TVALID,
  input          io_sample_out_ready,
  output         io_sample_out_valid,
  output [31:0]  io_sample_out_bits_features_0,
  output [31:0]  io_sample_out_bits_features_1,
  output [31:0]  io_sample_out_bits_features_2,
  output [31:0]  io_sample_out_bits_features_3,
  output [31:0]  io_sample_out_bits_features_4,
  output [9:0]   io_sample_out_bits_offset,
  output         io_sample_out_bits_search_for_root,
  output [7:0]   io_sample_out_bits_tree_to_exec,
  output [31:0]  io_sample_out_bits_scores_0,
  output [31:0]  io_sample_out_bits_scores_1,
  output [31:0]  io_sample_out_bits_scores_2,
  output [31:0]  io_sample_out_bits_scores_3,
  output [31:0]  io_sample_out_bits_weights_0,
  output [31:0]  io_sample_out_bits_weights_1,
  output [31:0]  io_sample_out_bits_weights_2,
  output [31:0]  io_sample_out_bits_weights_3,
  output [31:0]  io_sample_out_bits_weights_4,
  output         io_sample_out_bits_last
);
  wire [31:0] _io_sample_out_bits_scores_0_T_1 = io_sample_in_TDATA[239:208]; // @[Converter.scala 21:115]
  wire [31:0] _io_sample_out_bits_scores_1_T_1 = io_sample_in_TDATA[271:240]; // @[Converter.scala 21:115]
  wire [31:0] _io_sample_out_bits_scores_2_T_1 = io_sample_in_TDATA[303:272]; // @[Converter.scala 21:115]
  wire [31:0] _io_sample_out_bits_scores_3_T_1 = io_sample_in_TDATA[335:304]; // @[Converter.scala 21:115]
  wire [31:0] _io_sample_out_bits_weights_0_T_1 = io_sample_in_TDATA[367:336]; // @[Converter.scala 24:142]
  wire [31:0] _io_sample_out_bits_weights_1_T_1 = io_sample_in_TDATA[399:368]; // @[Converter.scala 24:142]
  wire [31:0] _io_sample_out_bits_weights_2_T_1 = io_sample_in_TDATA[431:400]; // @[Converter.scala 24:142]
  wire [31:0] _io_sample_out_bits_weights_3_T_1 = io_sample_in_TDATA[463:432]; // @[Converter.scala 24:142]
  wire [31:0] _io_sample_out_bits_weights_4_T_1 = io_sample_in_TDATA[495:464]; // @[Converter.scala 24:142]
  wire [39:0] _GEN_0 = {$signed(_io_sample_out_bits_scores_0_T_1), 8'h0}; // @[Converter.scala 21:38]
  wire [39:0] _GEN_2 = {$signed(_io_sample_out_bits_scores_1_T_1), 8'h0}; // @[Converter.scala 21:38]
  wire [39:0] _GEN_4 = {$signed(_io_sample_out_bits_scores_2_T_1), 8'h0}; // @[Converter.scala 21:38]
  wire [39:0] _GEN_6 = {$signed(_io_sample_out_bits_scores_3_T_1), 8'h0}; // @[Converter.scala 21:38]
  wire [39:0] _GEN_8 = {$signed(_io_sample_out_bits_weights_0_T_1), 8'h0}; // @[Converter.scala 24:39]
  wire [39:0] _GEN_10 = {$signed(_io_sample_out_bits_weights_1_T_1), 8'h0}; // @[Converter.scala 24:39]
  wire [39:0] _GEN_12 = {$signed(_io_sample_out_bits_weights_2_T_1), 8'h0}; // @[Converter.scala 24:39]
  wire [39:0] _GEN_14 = {$signed(_io_sample_out_bits_weights_3_T_1), 8'h0}; // @[Converter.scala 24:39]
  wire [39:0] _GEN_16 = {$signed(_io_sample_out_bits_weights_4_T_1), 8'h0}; // @[Converter.scala 24:39]
  assign io_sample_in_TREADY = io_sample_out_ready; // @[Converter.scala 30:25]
  assign io_sample_out_valid = io_sample_in_TVALID; // @[Converter.scala 26:25]
  assign io_sample_out_bits_features_0 = io_sample_in_TDATA[31:0]; // @[Converter.scala 14:91]
  assign io_sample_out_bits_features_1 = io_sample_in_TDATA[63:32]; // @[Converter.scala 14:91]
  assign io_sample_out_bits_features_2 = io_sample_in_TDATA[95:64]; // @[Converter.scala 14:91]
  assign io_sample_out_bits_features_3 = io_sample_in_TDATA[127:96]; // @[Converter.scala 14:91]
  assign io_sample_out_bits_features_4 = io_sample_in_TDATA[159:128]; // @[Converter.scala 14:91]
  assign io_sample_out_bits_offset = io_sample_in_TDATA[169:160]; // @[Converter.scala 16:31]
  assign io_sample_out_bits_search_for_root = io_sample_in_TDATA[184]; // @[Converter.scala 18:40]
  assign io_sample_out_bits_tree_to_exec = io_sample_in_TDATA[199:192]; // @[Converter.scala 19:58]
  assign io_sample_out_bits_scores_0 = _GEN_0[31:0]; // @[Converter.scala 21:38]
  assign io_sample_out_bits_scores_1 = _GEN_2[31:0]; // @[Converter.scala 21:38]
  assign io_sample_out_bits_scores_2 = _GEN_4[31:0]; // @[Converter.scala 21:38]
  assign io_sample_out_bits_scores_3 = _GEN_6[31:0]; // @[Converter.scala 21:38]
  assign io_sample_out_bits_weights_0 = _GEN_8[31:0]; // @[Converter.scala 24:39]
  assign io_sample_out_bits_weights_1 = _GEN_10[31:0]; // @[Converter.scala 24:39]
  assign io_sample_out_bits_weights_2 = _GEN_12[31:0]; // @[Converter.scala 24:39]
  assign io_sample_out_bits_weights_3 = _GEN_14[31:0]; // @[Converter.scala 24:39]
  assign io_sample_out_bits_weights_4 = _GEN_16[31:0]; // @[Converter.scala 24:39]
  assign io_sample_out_bits_last = io_sample_in_TLAST; // @[Converter.scala 28:29]
endmodule
module Queue(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [31:0] io_enq_bits_features_0,
  input  [31:0] io_enq_bits_features_1,
  input  [31:0] io_enq_bits_features_2,
  input  [31:0] io_enq_bits_features_3,
  input  [31:0] io_enq_bits_features_4,
  input  [9:0]  io_enq_bits_offset,
  input         io_enq_bits_shift,
  input         io_enq_bits_search_for_root,
  input  [7:0]  io_enq_bits_tree_to_exec,
  input  [31:0] io_enq_bits_scores_0,
  input  [31:0] io_enq_bits_scores_1,
  input  [31:0] io_enq_bits_scores_2,
  input  [31:0] io_enq_bits_scores_3,
  input         io_enq_bits_last,
  input  [31:0] io_enq_bits_clock_cycles,
  input         io_deq_ready,
  output        io_deq_valid,
  output [31:0] io_deq_bits_features_0,
  output [31:0] io_deq_bits_features_1,
  output [31:0] io_deq_bits_features_2,
  output [31:0] io_deq_bits_features_3,
  output [31:0] io_deq_bits_features_4,
  output [9:0]  io_deq_bits_offset,
  output        io_deq_bits_shift,
  output        io_deq_bits_search_for_root,
  output [7:0]  io_deq_bits_tree_to_exec,
  output [31:0] io_deq_bits_scores_0,
  output [31:0] io_deq_bits_scores_1,
  output [31:0] io_deq_bits_scores_2,
  output [31:0] io_deq_bits_scores_3,
  output        io_deq_bits_last,
  output [31:0] io_deq_bits_clock_cycles
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] ram_features_0 [0:127]; // @[Decoupled.scala 275:95]
  wire  ram_features_0_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [6:0] ram_features_0_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_features_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_features_0_MPORT_data; // @[Decoupled.scala 275:95]
  wire [6:0] ram_features_0_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_features_0_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_features_0_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_features_1 [0:127]; // @[Decoupled.scala 275:95]
  wire  ram_features_1_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [6:0] ram_features_1_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_features_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_features_1_MPORT_data; // @[Decoupled.scala 275:95]
  wire [6:0] ram_features_1_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_features_1_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_features_1_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_features_2 [0:127]; // @[Decoupled.scala 275:95]
  wire  ram_features_2_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [6:0] ram_features_2_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_features_2_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_features_2_MPORT_data; // @[Decoupled.scala 275:95]
  wire [6:0] ram_features_2_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_features_2_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_features_2_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_features_3 [0:127]; // @[Decoupled.scala 275:95]
  wire  ram_features_3_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [6:0] ram_features_3_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_features_3_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_features_3_MPORT_data; // @[Decoupled.scala 275:95]
  wire [6:0] ram_features_3_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_features_3_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_features_3_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_features_4 [0:127]; // @[Decoupled.scala 275:95]
  wire  ram_features_4_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [6:0] ram_features_4_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_features_4_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_features_4_MPORT_data; // @[Decoupled.scala 275:95]
  wire [6:0] ram_features_4_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_features_4_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_features_4_MPORT_en; // @[Decoupled.scala 275:95]
  reg [9:0] ram_offset [0:127]; // @[Decoupled.scala 275:95]
  wire  ram_offset_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [6:0] ram_offset_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [9:0] ram_offset_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [9:0] ram_offset_MPORT_data; // @[Decoupled.scala 275:95]
  wire [6:0] ram_offset_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_offset_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_offset_MPORT_en; // @[Decoupled.scala 275:95]
  reg  ram_shift [0:127]; // @[Decoupled.scala 275:95]
  wire  ram_shift_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [6:0] ram_shift_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_shift_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire  ram_shift_MPORT_data; // @[Decoupled.scala 275:95]
  wire [6:0] ram_shift_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_shift_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_shift_MPORT_en; // @[Decoupled.scala 275:95]
  reg  ram_search_for_root [0:127]; // @[Decoupled.scala 275:95]
  wire  ram_search_for_root_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [6:0] ram_search_for_root_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_search_for_root_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire  ram_search_for_root_MPORT_data; // @[Decoupled.scala 275:95]
  wire [6:0] ram_search_for_root_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_search_for_root_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_search_for_root_MPORT_en; // @[Decoupled.scala 275:95]
  reg [7:0] ram_tree_to_exec [0:127]; // @[Decoupled.scala 275:95]
  wire  ram_tree_to_exec_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [6:0] ram_tree_to_exec_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [7:0] ram_tree_to_exec_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [7:0] ram_tree_to_exec_MPORT_data; // @[Decoupled.scala 275:95]
  wire [6:0] ram_tree_to_exec_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_tree_to_exec_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_tree_to_exec_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_scores_0 [0:127]; // @[Decoupled.scala 275:95]
  wire  ram_scores_0_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [6:0] ram_scores_0_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_scores_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_scores_0_MPORT_data; // @[Decoupled.scala 275:95]
  wire [6:0] ram_scores_0_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_scores_0_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_scores_0_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_scores_1 [0:127]; // @[Decoupled.scala 275:95]
  wire  ram_scores_1_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [6:0] ram_scores_1_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_scores_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_scores_1_MPORT_data; // @[Decoupled.scala 275:95]
  wire [6:0] ram_scores_1_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_scores_1_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_scores_1_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_scores_2 [0:127]; // @[Decoupled.scala 275:95]
  wire  ram_scores_2_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [6:0] ram_scores_2_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_scores_2_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_scores_2_MPORT_data; // @[Decoupled.scala 275:95]
  wire [6:0] ram_scores_2_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_scores_2_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_scores_2_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_scores_3 [0:127]; // @[Decoupled.scala 275:95]
  wire  ram_scores_3_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [6:0] ram_scores_3_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_scores_3_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_scores_3_MPORT_data; // @[Decoupled.scala 275:95]
  wire [6:0] ram_scores_3_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_scores_3_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_scores_3_MPORT_en; // @[Decoupled.scala 275:95]
  reg  ram_last [0:127]; // @[Decoupled.scala 275:95]
  wire  ram_last_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [6:0] ram_last_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_last_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire  ram_last_MPORT_data; // @[Decoupled.scala 275:95]
  wire [6:0] ram_last_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_last_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_last_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_clock_cycles [0:127]; // @[Decoupled.scala 275:95]
  wire  ram_clock_cycles_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [6:0] ram_clock_cycles_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_clock_cycles_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_clock_cycles_MPORT_data; // @[Decoupled.scala 275:95]
  wire [6:0] ram_clock_cycles_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_clock_cycles_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_clock_cycles_MPORT_en; // @[Decoupled.scala 275:95]
  reg [6:0] enq_ptr_value; // @[Counter.scala 61:40]
  reg [6:0] deq_ptr_value; // @[Counter.scala 61:40]
  reg  maybe_full; // @[Decoupled.scala 278:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[Decoupled.scala 279:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 280:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 281:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 52:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 52:35]
  wire [6:0] _value_T_1 = enq_ptr_value + 7'h1; // @[Counter.scala 77:24]
  wire [6:0] _value_T_3 = deq_ptr_value + 7'h1; // @[Counter.scala 77:24]
  assign ram_features_0_io_deq_bits_MPORT_en = 1'h1;
  assign ram_features_0_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_features_0_io_deq_bits_MPORT_data = ram_features_0[ram_features_0_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_features_0_MPORT_data = io_enq_bits_features_0;
  assign ram_features_0_MPORT_addr = enq_ptr_value;
  assign ram_features_0_MPORT_mask = 1'h1;
  assign ram_features_0_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_features_1_io_deq_bits_MPORT_en = 1'h1;
  assign ram_features_1_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_features_1_io_deq_bits_MPORT_data = ram_features_1[ram_features_1_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_features_1_MPORT_data = io_enq_bits_features_1;
  assign ram_features_1_MPORT_addr = enq_ptr_value;
  assign ram_features_1_MPORT_mask = 1'h1;
  assign ram_features_1_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_features_2_io_deq_bits_MPORT_en = 1'h1;
  assign ram_features_2_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_features_2_io_deq_bits_MPORT_data = ram_features_2[ram_features_2_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_features_2_MPORT_data = io_enq_bits_features_2;
  assign ram_features_2_MPORT_addr = enq_ptr_value;
  assign ram_features_2_MPORT_mask = 1'h1;
  assign ram_features_2_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_features_3_io_deq_bits_MPORT_en = 1'h1;
  assign ram_features_3_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_features_3_io_deq_bits_MPORT_data = ram_features_3[ram_features_3_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_features_3_MPORT_data = io_enq_bits_features_3;
  assign ram_features_3_MPORT_addr = enq_ptr_value;
  assign ram_features_3_MPORT_mask = 1'h1;
  assign ram_features_3_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_features_4_io_deq_bits_MPORT_en = 1'h1;
  assign ram_features_4_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_features_4_io_deq_bits_MPORT_data = ram_features_4[ram_features_4_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_features_4_MPORT_data = io_enq_bits_features_4;
  assign ram_features_4_MPORT_addr = enq_ptr_value;
  assign ram_features_4_MPORT_mask = 1'h1;
  assign ram_features_4_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_offset_io_deq_bits_MPORT_en = 1'h1;
  assign ram_offset_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_offset_io_deq_bits_MPORT_data = ram_offset[ram_offset_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_offset_MPORT_data = io_enq_bits_offset;
  assign ram_offset_MPORT_addr = enq_ptr_value;
  assign ram_offset_MPORT_mask = 1'h1;
  assign ram_offset_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_shift_io_deq_bits_MPORT_en = 1'h1;
  assign ram_shift_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_shift_io_deq_bits_MPORT_data = ram_shift[ram_shift_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_shift_MPORT_data = io_enq_bits_shift;
  assign ram_shift_MPORT_addr = enq_ptr_value;
  assign ram_shift_MPORT_mask = 1'h1;
  assign ram_shift_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_search_for_root_io_deq_bits_MPORT_en = 1'h1;
  assign ram_search_for_root_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_search_for_root_io_deq_bits_MPORT_data = ram_search_for_root[ram_search_for_root_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_search_for_root_MPORT_data = io_enq_bits_search_for_root;
  assign ram_search_for_root_MPORT_addr = enq_ptr_value;
  assign ram_search_for_root_MPORT_mask = 1'h1;
  assign ram_search_for_root_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_tree_to_exec_io_deq_bits_MPORT_en = 1'h1;
  assign ram_tree_to_exec_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_tree_to_exec_io_deq_bits_MPORT_data = ram_tree_to_exec[ram_tree_to_exec_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_tree_to_exec_MPORT_data = io_enq_bits_tree_to_exec;
  assign ram_tree_to_exec_MPORT_addr = enq_ptr_value;
  assign ram_tree_to_exec_MPORT_mask = 1'h1;
  assign ram_tree_to_exec_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_scores_0_io_deq_bits_MPORT_en = 1'h1;
  assign ram_scores_0_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_scores_0_io_deq_bits_MPORT_data = ram_scores_0[ram_scores_0_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_scores_0_MPORT_data = io_enq_bits_scores_0;
  assign ram_scores_0_MPORT_addr = enq_ptr_value;
  assign ram_scores_0_MPORT_mask = 1'h1;
  assign ram_scores_0_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_scores_1_io_deq_bits_MPORT_en = 1'h1;
  assign ram_scores_1_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_scores_1_io_deq_bits_MPORT_data = ram_scores_1[ram_scores_1_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_scores_1_MPORT_data = io_enq_bits_scores_1;
  assign ram_scores_1_MPORT_addr = enq_ptr_value;
  assign ram_scores_1_MPORT_mask = 1'h1;
  assign ram_scores_1_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_scores_2_io_deq_bits_MPORT_en = 1'h1;
  assign ram_scores_2_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_scores_2_io_deq_bits_MPORT_data = ram_scores_2[ram_scores_2_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_scores_2_MPORT_data = io_enq_bits_scores_2;
  assign ram_scores_2_MPORT_addr = enq_ptr_value;
  assign ram_scores_2_MPORT_mask = 1'h1;
  assign ram_scores_2_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_scores_3_io_deq_bits_MPORT_en = 1'h1;
  assign ram_scores_3_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_scores_3_io_deq_bits_MPORT_data = ram_scores_3[ram_scores_3_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_scores_3_MPORT_data = io_enq_bits_scores_3;
  assign ram_scores_3_MPORT_addr = enq_ptr_value;
  assign ram_scores_3_MPORT_mask = 1'h1;
  assign ram_scores_3_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_last_io_deq_bits_MPORT_en = 1'h1;
  assign ram_last_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_last_io_deq_bits_MPORT_data = ram_last[ram_last_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_last_MPORT_data = io_enq_bits_last;
  assign ram_last_MPORT_addr = enq_ptr_value;
  assign ram_last_MPORT_mask = 1'h1;
  assign ram_last_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_clock_cycles_io_deq_bits_MPORT_en = 1'h1;
  assign ram_clock_cycles_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_clock_cycles_io_deq_bits_MPORT_data = ram_clock_cycles[ram_clock_cycles_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_clock_cycles_MPORT_data = io_enq_bits_clock_cycles;
  assign ram_clock_cycles_MPORT_addr = enq_ptr_value;
  assign ram_clock_cycles_MPORT_mask = 1'h1;
  assign ram_clock_cycles_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 305:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 304:19]
  assign io_deq_bits_features_0 = ram_features_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_features_1 = ram_features_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_features_2 = ram_features_2_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_features_3 = ram_features_3_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_features_4 = ram_features_4_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_offset = ram_offset_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_shift = ram_shift_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_search_for_root = ram_search_for_root_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_tree_to_exec = ram_tree_to_exec_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_scores_0 = ram_scores_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_scores_1 = ram_scores_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_scores_2 = ram_scores_2_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_scores_3 = ram_scores_3_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_last = ram_last_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_clock_cycles = ram_clock_cycles_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  always @(posedge clock) begin
    if (ram_features_0_MPORT_en & ram_features_0_MPORT_mask) begin
      ram_features_0[ram_features_0_MPORT_addr] <= ram_features_0_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_features_1_MPORT_en & ram_features_1_MPORT_mask) begin
      ram_features_1[ram_features_1_MPORT_addr] <= ram_features_1_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_features_2_MPORT_en & ram_features_2_MPORT_mask) begin
      ram_features_2[ram_features_2_MPORT_addr] <= ram_features_2_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_features_3_MPORT_en & ram_features_3_MPORT_mask) begin
      ram_features_3[ram_features_3_MPORT_addr] <= ram_features_3_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_features_4_MPORT_en & ram_features_4_MPORT_mask) begin
      ram_features_4[ram_features_4_MPORT_addr] <= ram_features_4_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_offset_MPORT_en & ram_offset_MPORT_mask) begin
      ram_offset[ram_offset_MPORT_addr] <= ram_offset_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_shift_MPORT_en & ram_shift_MPORT_mask) begin
      ram_shift[ram_shift_MPORT_addr] <= ram_shift_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_search_for_root_MPORT_en & ram_search_for_root_MPORT_mask) begin
      ram_search_for_root[ram_search_for_root_MPORT_addr] <= ram_search_for_root_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_tree_to_exec_MPORT_en & ram_tree_to_exec_MPORT_mask) begin
      ram_tree_to_exec[ram_tree_to_exec_MPORT_addr] <= ram_tree_to_exec_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_scores_0_MPORT_en & ram_scores_0_MPORT_mask) begin
      ram_scores_0[ram_scores_0_MPORT_addr] <= ram_scores_0_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_scores_1_MPORT_en & ram_scores_1_MPORT_mask) begin
      ram_scores_1[ram_scores_1_MPORT_addr] <= ram_scores_1_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_scores_2_MPORT_en & ram_scores_2_MPORT_mask) begin
      ram_scores_2[ram_scores_2_MPORT_addr] <= ram_scores_2_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_scores_3_MPORT_en & ram_scores_3_MPORT_mask) begin
      ram_scores_3[ram_scores_3_MPORT_addr] <= ram_scores_3_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_last_MPORT_en & ram_last_MPORT_mask) begin
      ram_last[ram_last_MPORT_addr] <= ram_last_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_clock_cycles_MPORT_en & ram_clock_cycles_MPORT_mask) begin
      ram_clock_cycles[ram_clock_cycles_MPORT_addr] <= ram_clock_cycles_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (reset) begin // @[Counter.scala 61:40]
      enq_ptr_value <= 7'h0; // @[Counter.scala 61:40]
    end else if (do_enq) begin // @[Decoupled.scala 288:16]
      enq_ptr_value <= _value_T_1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Counter.scala 61:40]
      deq_ptr_value <= 7'h0; // @[Counter.scala 61:40]
    end else if (do_deq) begin // @[Decoupled.scala 292:16]
      deq_ptr_value <= _value_T_3; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Decoupled.scala 278:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 278:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 295:27]
      maybe_full <= do_enq; // @[Decoupled.scala 296:16]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    ram_features_0[initvar] = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    ram_features_1[initvar] = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    ram_features_2[initvar] = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    ram_features_3[initvar] = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    ram_features_4[initvar] = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    ram_offset[initvar] = _RAND_5[9:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    ram_shift[initvar] = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    ram_search_for_root[initvar] = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    ram_tree_to_exec[initvar] = _RAND_8[7:0];
  _RAND_9 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    ram_scores_0[initvar] = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    ram_scores_1[initvar] = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    ram_scores_2[initvar] = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    ram_scores_3[initvar] = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    ram_last[initvar] = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    ram_clock_cycles[initvar] = _RAND_14[31:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  enq_ptr_value = _RAND_15[6:0];
  _RAND_16 = {1{`RANDOM}};
  deq_ptr_value = _RAND_16[6:0];
  _RAND_17 = {1{`RANDOM}};
  maybe_full = _RAND_17[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module BackwardConverter(
  input          clock,
  input          reset,
  output         io_sample_in_ready,
  input          io_sample_in_valid,
  input  [31:0]  io_sample_in_bits_features_0,
  input  [31:0]  io_sample_in_bits_features_1,
  input  [31:0]  io_sample_in_bits_features_2,
  input  [31:0]  io_sample_in_bits_features_3,
  input  [31:0]  io_sample_in_bits_features_4,
  input  [9:0]   io_sample_in_bits_offset,
  input          io_sample_in_bits_shift,
  input          io_sample_in_bits_search_for_root,
  input  [7:0]   io_sample_in_bits_tree_to_exec,
  input  [31:0]  io_sample_in_bits_scores_0,
  input  [31:0]  io_sample_in_bits_scores_1,
  input  [31:0]  io_sample_in_bits_scores_2,
  input  [31:0]  io_sample_in_bits_scores_3,
  input          io_sample_in_bits_last,
  input  [31:0]  io_sample_in_bits_clock_cycles,
  output [511:0] io_sample_out_TDATA,
  output         io_sample_out_TLAST,
  input          io_sample_out_TREADY,
  output         io_sample_out_TVALID
);
  wire  queue_clock; // @[Decoupled.scala 377:21]
  wire  queue_reset; // @[Decoupled.scala 377:21]
  wire  queue_io_enq_ready; // @[Decoupled.scala 377:21]
  wire  queue_io_enq_valid; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_features_0; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_features_1; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_features_2; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_features_3; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_features_4; // @[Decoupled.scala 377:21]
  wire [9:0] queue_io_enq_bits_offset; // @[Decoupled.scala 377:21]
  wire  queue_io_enq_bits_shift; // @[Decoupled.scala 377:21]
  wire  queue_io_enq_bits_search_for_root; // @[Decoupled.scala 377:21]
  wire [7:0] queue_io_enq_bits_tree_to_exec; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_scores_0; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_scores_1; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_scores_2; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_scores_3; // @[Decoupled.scala 377:21]
  wire  queue_io_enq_bits_last; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_clock_cycles; // @[Decoupled.scala 377:21]
  wire  queue_io_deq_ready; // @[Decoupled.scala 377:21]
  wire  queue_io_deq_valid; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_features_0; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_features_1; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_features_2; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_features_3; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_features_4; // @[Decoupled.scala 377:21]
  wire [9:0] queue_io_deq_bits_offset; // @[Decoupled.scala 377:21]
  wire  queue_io_deq_bits_shift; // @[Decoupled.scala 377:21]
  wire  queue_io_deq_bits_search_for_root; // @[Decoupled.scala 377:21]
  wire [7:0] queue_io_deq_bits_tree_to_exec; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_scores_0; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_scores_1; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_scores_2; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_scores_3; // @[Decoupled.scala 377:21]
  wire  queue_io_deq_bits_last; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_clock_cycles; // @[Decoupled.scala 377:21]
  wire [183:0] io_sample_out_TDATA_lo_2 = {7'h0,queue_io_deq_bits_shift,6'h0,queue_io_deq_bits_offset,
    queue_io_deq_bits_features_4,queue_io_deq_bits_features_3,queue_io_deq_bits_features_2,queue_io_deq_bits_features_1,
    queue_io_deq_bits_features_0}; // @[Cat.scala 33:92]
  wire [367:0] _io_sample_out_TDATA_T_10 = {queue_io_deq_bits_clock_cycles,queue_io_deq_bits_scores_3,
    queue_io_deq_bits_scores_2,queue_io_deq_bits_scores_1,queue_io_deq_bits_scores_0,8'h0,queue_io_deq_bits_tree_to_exec
    ,7'h0,queue_io_deq_bits_search_for_root,io_sample_out_TDATA_lo_2}; // @[Cat.scala 33:92]
  Queue queue ( // @[Decoupled.scala 377:21]
    .clock(queue_clock),
    .reset(queue_reset),
    .io_enq_ready(queue_io_enq_ready),
    .io_enq_valid(queue_io_enq_valid),
    .io_enq_bits_features_0(queue_io_enq_bits_features_0),
    .io_enq_bits_features_1(queue_io_enq_bits_features_1),
    .io_enq_bits_features_2(queue_io_enq_bits_features_2),
    .io_enq_bits_features_3(queue_io_enq_bits_features_3),
    .io_enq_bits_features_4(queue_io_enq_bits_features_4),
    .io_enq_bits_offset(queue_io_enq_bits_offset),
    .io_enq_bits_shift(queue_io_enq_bits_shift),
    .io_enq_bits_search_for_root(queue_io_enq_bits_search_for_root),
    .io_enq_bits_tree_to_exec(queue_io_enq_bits_tree_to_exec),
    .io_enq_bits_scores_0(queue_io_enq_bits_scores_0),
    .io_enq_bits_scores_1(queue_io_enq_bits_scores_1),
    .io_enq_bits_scores_2(queue_io_enq_bits_scores_2),
    .io_enq_bits_scores_3(queue_io_enq_bits_scores_3),
    .io_enq_bits_last(queue_io_enq_bits_last),
    .io_enq_bits_clock_cycles(queue_io_enq_bits_clock_cycles),
    .io_deq_ready(queue_io_deq_ready),
    .io_deq_valid(queue_io_deq_valid),
    .io_deq_bits_features_0(queue_io_deq_bits_features_0),
    .io_deq_bits_features_1(queue_io_deq_bits_features_1),
    .io_deq_bits_features_2(queue_io_deq_bits_features_2),
    .io_deq_bits_features_3(queue_io_deq_bits_features_3),
    .io_deq_bits_features_4(queue_io_deq_bits_features_4),
    .io_deq_bits_offset(queue_io_deq_bits_offset),
    .io_deq_bits_shift(queue_io_deq_bits_shift),
    .io_deq_bits_search_for_root(queue_io_deq_bits_search_for_root),
    .io_deq_bits_tree_to_exec(queue_io_deq_bits_tree_to_exec),
    .io_deq_bits_scores_0(queue_io_deq_bits_scores_0),
    .io_deq_bits_scores_1(queue_io_deq_bits_scores_1),
    .io_deq_bits_scores_2(queue_io_deq_bits_scores_2),
    .io_deq_bits_scores_3(queue_io_deq_bits_scores_3),
    .io_deq_bits_last(queue_io_deq_bits_last),
    .io_deq_bits_clock_cycles(queue_io_deq_bits_clock_cycles)
  );
  assign io_sample_in_ready = queue_io_enq_ready; // @[Decoupled.scala 381:17]
  assign io_sample_out_TDATA = {{144'd0}, _io_sample_out_TDATA_T_10}; // @[Converter.scala 52:25]
  assign io_sample_out_TLAST = queue_io_deq_bits_last; // @[Converter.scala 44:25]
  assign io_sample_out_TVALID = queue_io_deq_valid; // @[Converter.scala 45:26]
  assign queue_clock = clock;
  assign queue_reset = reset;
  assign queue_io_enq_valid = io_sample_in_valid; // @[Decoupled.scala 379:22]
  assign queue_io_enq_bits_features_0 = io_sample_in_bits_features_0; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_features_1 = io_sample_in_bits_features_1; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_features_2 = io_sample_in_bits_features_2; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_features_3 = io_sample_in_bits_features_3; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_features_4 = io_sample_in_bits_features_4; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_offset = io_sample_in_bits_offset; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_shift = io_sample_in_bits_shift; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_search_for_root = io_sample_in_bits_search_for_root; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_tree_to_exec = io_sample_in_bits_tree_to_exec; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_scores_0 = io_sample_in_bits_scores_0; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_scores_1 = io_sample_in_bits_scores_1; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_scores_2 = io_sample_in_bits_scores_2; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_scores_3 = io_sample_in_bits_scores_3; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_last = io_sample_in_bits_last; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_clock_cycles = io_sample_in_bits_clock_cycles; // @[Decoupled.scala 380:21]
  assign queue_io_deq_ready = io_sample_out_TREADY; // @[Converter.scala 41:17]
endmodule
module Queue_1(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [31:0] io_enq_bits_features_0,
  input  [31:0] io_enq_bits_features_1,
  input  [31:0] io_enq_bits_features_2,
  input  [31:0] io_enq_bits_features_3,
  input  [31:0] io_enq_bits_features_4,
  input  [9:0]  io_enq_bits_offset,
  input         io_enq_bits_search_for_root,
  input  [7:0]  io_enq_bits_tree_to_exec,
  input  [31:0] io_enq_bits_scores_0,
  input  [31:0] io_enq_bits_scores_1,
  input  [31:0] io_enq_bits_scores_2,
  input  [31:0] io_enq_bits_scores_3,
  input  [31:0] io_enq_bits_weights_0,
  input  [31:0] io_enq_bits_weights_1,
  input  [31:0] io_enq_bits_weights_2,
  input  [31:0] io_enq_bits_weights_3,
  input  [31:0] io_enq_bits_weights_4,
  input         io_enq_bits_last,
  input         io_deq_ready,
  output        io_deq_valid,
  output [31:0] io_deq_bits_features_0,
  output [31:0] io_deq_bits_features_1,
  output [31:0] io_deq_bits_features_2,
  output [31:0] io_deq_bits_features_3,
  output [31:0] io_deq_bits_features_4,
  output [9:0]  io_deq_bits_offset,
  output        io_deq_bits_search_for_root,
  output [7:0]  io_deq_bits_tree_to_exec,
  output [31:0] io_deq_bits_scores_0,
  output [31:0] io_deq_bits_scores_1,
  output [31:0] io_deq_bits_scores_2,
  output [31:0] io_deq_bits_scores_3,
  output [31:0] io_deq_bits_weights_0,
  output [31:0] io_deq_bits_weights_1,
  output [31:0] io_deq_bits_weights_2,
  output [31:0] io_deq_bits_weights_3,
  output [31:0] io_deq_bits_weights_4,
  output        io_deq_bits_last
);
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_35;
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_34;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_36;
  reg [31:0] _RAND_37;
  reg [31:0] _RAND_38;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] ram_features_0 [0:2]; // @[Decoupled.scala 275:95]
  wire  ram_features_0_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [1:0] ram_features_0_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_features_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_features_0_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_features_0_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_features_0_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_features_0_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_features_1 [0:2]; // @[Decoupled.scala 275:95]
  wire  ram_features_1_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [1:0] ram_features_1_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_features_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_features_1_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_features_1_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_features_1_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_features_1_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_features_2 [0:2]; // @[Decoupled.scala 275:95]
  wire  ram_features_2_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [1:0] ram_features_2_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_features_2_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_features_2_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_features_2_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_features_2_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_features_2_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_features_3 [0:2]; // @[Decoupled.scala 275:95]
  wire  ram_features_3_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [1:0] ram_features_3_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_features_3_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_features_3_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_features_3_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_features_3_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_features_3_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_features_4 [0:2]; // @[Decoupled.scala 275:95]
  wire  ram_features_4_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [1:0] ram_features_4_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_features_4_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_features_4_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_features_4_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_features_4_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_features_4_MPORT_en; // @[Decoupled.scala 275:95]
  reg [9:0] ram_offset [0:2]; // @[Decoupled.scala 275:95]
  wire  ram_offset_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [1:0] ram_offset_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [9:0] ram_offset_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [9:0] ram_offset_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_offset_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_offset_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_offset_MPORT_en; // @[Decoupled.scala 275:95]
  reg  ram_search_for_root [0:2]; // @[Decoupled.scala 275:95]
  wire  ram_search_for_root_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [1:0] ram_search_for_root_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_search_for_root_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire  ram_search_for_root_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_search_for_root_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_search_for_root_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_search_for_root_MPORT_en; // @[Decoupled.scala 275:95]
  reg [7:0] ram_tree_to_exec [0:2]; // @[Decoupled.scala 275:95]
  wire  ram_tree_to_exec_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [1:0] ram_tree_to_exec_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [7:0] ram_tree_to_exec_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [7:0] ram_tree_to_exec_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_tree_to_exec_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_tree_to_exec_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_tree_to_exec_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_scores_0 [0:2]; // @[Decoupled.scala 275:95]
  wire  ram_scores_0_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [1:0] ram_scores_0_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_scores_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_scores_0_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_scores_0_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_scores_0_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_scores_0_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_scores_1 [0:2]; // @[Decoupled.scala 275:95]
  wire  ram_scores_1_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [1:0] ram_scores_1_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_scores_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_scores_1_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_scores_1_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_scores_1_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_scores_1_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_scores_2 [0:2]; // @[Decoupled.scala 275:95]
  wire  ram_scores_2_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [1:0] ram_scores_2_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_scores_2_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_scores_2_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_scores_2_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_scores_2_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_scores_2_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_scores_3 [0:2]; // @[Decoupled.scala 275:95]
  wire  ram_scores_3_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [1:0] ram_scores_3_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_scores_3_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_scores_3_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_scores_3_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_scores_3_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_scores_3_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_weights_0 [0:2]; // @[Decoupled.scala 275:95]
  wire  ram_weights_0_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [1:0] ram_weights_0_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_weights_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_weights_0_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_weights_0_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_weights_0_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_weights_0_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_weights_1 [0:2]; // @[Decoupled.scala 275:95]
  wire  ram_weights_1_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [1:0] ram_weights_1_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_weights_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_weights_1_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_weights_1_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_weights_1_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_weights_1_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_weights_2 [0:2]; // @[Decoupled.scala 275:95]
  wire  ram_weights_2_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [1:0] ram_weights_2_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_weights_2_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_weights_2_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_weights_2_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_weights_2_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_weights_2_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_weights_3 [0:2]; // @[Decoupled.scala 275:95]
  wire  ram_weights_3_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [1:0] ram_weights_3_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_weights_3_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_weights_3_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_weights_3_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_weights_3_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_weights_3_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_weights_4 [0:2]; // @[Decoupled.scala 275:95]
  wire  ram_weights_4_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [1:0] ram_weights_4_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_weights_4_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_weights_4_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_weights_4_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_weights_4_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_weights_4_MPORT_en; // @[Decoupled.scala 275:95]
  reg  ram_last [0:2]; // @[Decoupled.scala 275:95]
  wire  ram_last_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [1:0] ram_last_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_last_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire  ram_last_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_last_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_last_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_last_MPORT_en; // @[Decoupled.scala 275:95]
  reg [1:0] enq_ptr_value; // @[Counter.scala 61:40]
  reg [1:0] deq_ptr_value; // @[Counter.scala 61:40]
  reg  maybe_full; // @[Decoupled.scala 278:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[Decoupled.scala 279:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 280:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 281:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 52:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 52:35]
  wire  wrap = enq_ptr_value == 2'h2; // @[Counter.scala 73:24]
  wire [1:0] _value_T_1 = enq_ptr_value + 2'h1; // @[Counter.scala 77:24]
  wire  wrap_1 = deq_ptr_value == 2'h2; // @[Counter.scala 73:24]
  wire [1:0] _value_T_3 = deq_ptr_value + 2'h1; // @[Counter.scala 77:24]
  assign ram_features_0_io_deq_bits_MPORT_en = 1'h1;
  assign ram_features_0_io_deq_bits_MPORT_addr = deq_ptr_value;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_features_0_io_deq_bits_MPORT_data = ram_features_0[ram_features_0_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  `else
  assign ram_features_0_io_deq_bits_MPORT_data = ram_features_0_io_deq_bits_MPORT_addr >= 2'h3 ? _RAND_1[31:0] :
    ram_features_0[ram_features_0_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_features_0_MPORT_data = io_enq_bits_features_0;
  assign ram_features_0_MPORT_addr = enq_ptr_value;
  assign ram_features_0_MPORT_mask = 1'h1;
  assign ram_features_0_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_features_1_io_deq_bits_MPORT_en = 1'h1;
  assign ram_features_1_io_deq_bits_MPORT_addr = deq_ptr_value;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_features_1_io_deq_bits_MPORT_data = ram_features_1[ram_features_1_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  `else
  assign ram_features_1_io_deq_bits_MPORT_data = ram_features_1_io_deq_bits_MPORT_addr >= 2'h3 ? _RAND_3[31:0] :
    ram_features_1[ram_features_1_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_features_1_MPORT_data = io_enq_bits_features_1;
  assign ram_features_1_MPORT_addr = enq_ptr_value;
  assign ram_features_1_MPORT_mask = 1'h1;
  assign ram_features_1_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_features_2_io_deq_bits_MPORT_en = 1'h1;
  assign ram_features_2_io_deq_bits_MPORT_addr = deq_ptr_value;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_features_2_io_deq_bits_MPORT_data = ram_features_2[ram_features_2_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  `else
  assign ram_features_2_io_deq_bits_MPORT_data = ram_features_2_io_deq_bits_MPORT_addr >= 2'h3 ? _RAND_5[31:0] :
    ram_features_2[ram_features_2_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_features_2_MPORT_data = io_enq_bits_features_2;
  assign ram_features_2_MPORT_addr = enq_ptr_value;
  assign ram_features_2_MPORT_mask = 1'h1;
  assign ram_features_2_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_features_3_io_deq_bits_MPORT_en = 1'h1;
  assign ram_features_3_io_deq_bits_MPORT_addr = deq_ptr_value;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_features_3_io_deq_bits_MPORT_data = ram_features_3[ram_features_3_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  `else
  assign ram_features_3_io_deq_bits_MPORT_data = ram_features_3_io_deq_bits_MPORT_addr >= 2'h3 ? _RAND_7[31:0] :
    ram_features_3[ram_features_3_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_features_3_MPORT_data = io_enq_bits_features_3;
  assign ram_features_3_MPORT_addr = enq_ptr_value;
  assign ram_features_3_MPORT_mask = 1'h1;
  assign ram_features_3_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_features_4_io_deq_bits_MPORT_en = 1'h1;
  assign ram_features_4_io_deq_bits_MPORT_addr = deq_ptr_value;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_features_4_io_deq_bits_MPORT_data = ram_features_4[ram_features_4_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  `else
  assign ram_features_4_io_deq_bits_MPORT_data = ram_features_4_io_deq_bits_MPORT_addr >= 2'h3 ? _RAND_9[31:0] :
    ram_features_4[ram_features_4_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_features_4_MPORT_data = io_enq_bits_features_4;
  assign ram_features_4_MPORT_addr = enq_ptr_value;
  assign ram_features_4_MPORT_mask = 1'h1;
  assign ram_features_4_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_offset_io_deq_bits_MPORT_en = 1'h1;
  assign ram_offset_io_deq_bits_MPORT_addr = deq_ptr_value;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_offset_io_deq_bits_MPORT_data = ram_offset[ram_offset_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  `else
  assign ram_offset_io_deq_bits_MPORT_data = ram_offset_io_deq_bits_MPORT_addr >= 2'h3 ? _RAND_11[9:0] :
    ram_offset[ram_offset_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_offset_MPORT_data = io_enq_bits_offset;
  assign ram_offset_MPORT_addr = enq_ptr_value;
  assign ram_offset_MPORT_mask = 1'h1;
  assign ram_offset_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_search_for_root_io_deq_bits_MPORT_en = 1'h1;
  assign ram_search_for_root_io_deq_bits_MPORT_addr = deq_ptr_value;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_search_for_root_io_deq_bits_MPORT_data = ram_search_for_root[ram_search_for_root_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  `else
  assign ram_search_for_root_io_deq_bits_MPORT_data = ram_search_for_root_io_deq_bits_MPORT_addr >= 2'h3 ? _RAND_13[0:0]
     : ram_search_for_root[ram_search_for_root_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_search_for_root_MPORT_data = io_enq_bits_search_for_root;
  assign ram_search_for_root_MPORT_addr = enq_ptr_value;
  assign ram_search_for_root_MPORT_mask = 1'h1;
  assign ram_search_for_root_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_tree_to_exec_io_deq_bits_MPORT_en = 1'h1;
  assign ram_tree_to_exec_io_deq_bits_MPORT_addr = deq_ptr_value;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_tree_to_exec_io_deq_bits_MPORT_data = ram_tree_to_exec[ram_tree_to_exec_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  `else
  assign ram_tree_to_exec_io_deq_bits_MPORT_data = ram_tree_to_exec_io_deq_bits_MPORT_addr >= 2'h3 ? _RAND_15[7:0] :
    ram_tree_to_exec[ram_tree_to_exec_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_tree_to_exec_MPORT_data = io_enq_bits_tree_to_exec;
  assign ram_tree_to_exec_MPORT_addr = enq_ptr_value;
  assign ram_tree_to_exec_MPORT_mask = 1'h1;
  assign ram_tree_to_exec_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_scores_0_io_deq_bits_MPORT_en = 1'h1;
  assign ram_scores_0_io_deq_bits_MPORT_addr = deq_ptr_value;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_scores_0_io_deq_bits_MPORT_data = ram_scores_0[ram_scores_0_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  `else
  assign ram_scores_0_io_deq_bits_MPORT_data = ram_scores_0_io_deq_bits_MPORT_addr >= 2'h3 ? _RAND_17[31:0] :
    ram_scores_0[ram_scores_0_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_scores_0_MPORT_data = io_enq_bits_scores_0;
  assign ram_scores_0_MPORT_addr = enq_ptr_value;
  assign ram_scores_0_MPORT_mask = 1'h1;
  assign ram_scores_0_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_scores_1_io_deq_bits_MPORT_en = 1'h1;
  assign ram_scores_1_io_deq_bits_MPORT_addr = deq_ptr_value;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_scores_1_io_deq_bits_MPORT_data = ram_scores_1[ram_scores_1_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  `else
  assign ram_scores_1_io_deq_bits_MPORT_data = ram_scores_1_io_deq_bits_MPORT_addr >= 2'h3 ? _RAND_19[31:0] :
    ram_scores_1[ram_scores_1_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_scores_1_MPORT_data = io_enq_bits_scores_1;
  assign ram_scores_1_MPORT_addr = enq_ptr_value;
  assign ram_scores_1_MPORT_mask = 1'h1;
  assign ram_scores_1_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_scores_2_io_deq_bits_MPORT_en = 1'h1;
  assign ram_scores_2_io_deq_bits_MPORT_addr = deq_ptr_value;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_scores_2_io_deq_bits_MPORT_data = ram_scores_2[ram_scores_2_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  `else
  assign ram_scores_2_io_deq_bits_MPORT_data = ram_scores_2_io_deq_bits_MPORT_addr >= 2'h3 ? _RAND_21[31:0] :
    ram_scores_2[ram_scores_2_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_scores_2_MPORT_data = io_enq_bits_scores_2;
  assign ram_scores_2_MPORT_addr = enq_ptr_value;
  assign ram_scores_2_MPORT_mask = 1'h1;
  assign ram_scores_2_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_scores_3_io_deq_bits_MPORT_en = 1'h1;
  assign ram_scores_3_io_deq_bits_MPORT_addr = deq_ptr_value;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_scores_3_io_deq_bits_MPORT_data = ram_scores_3[ram_scores_3_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  `else
  assign ram_scores_3_io_deq_bits_MPORT_data = ram_scores_3_io_deq_bits_MPORT_addr >= 2'h3 ? _RAND_23[31:0] :
    ram_scores_3[ram_scores_3_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_scores_3_MPORT_data = io_enq_bits_scores_3;
  assign ram_scores_3_MPORT_addr = enq_ptr_value;
  assign ram_scores_3_MPORT_mask = 1'h1;
  assign ram_scores_3_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_weights_0_io_deq_bits_MPORT_en = 1'h1;
  assign ram_weights_0_io_deq_bits_MPORT_addr = deq_ptr_value;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_weights_0_io_deq_bits_MPORT_data = ram_weights_0[ram_weights_0_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  `else
  assign ram_weights_0_io_deq_bits_MPORT_data = ram_weights_0_io_deq_bits_MPORT_addr >= 2'h3 ? _RAND_25[31:0] :
    ram_weights_0[ram_weights_0_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_weights_0_MPORT_data = io_enq_bits_weights_0;
  assign ram_weights_0_MPORT_addr = enq_ptr_value;
  assign ram_weights_0_MPORT_mask = 1'h1;
  assign ram_weights_0_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_weights_1_io_deq_bits_MPORT_en = 1'h1;
  assign ram_weights_1_io_deq_bits_MPORT_addr = deq_ptr_value;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_weights_1_io_deq_bits_MPORT_data = ram_weights_1[ram_weights_1_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  `else
  assign ram_weights_1_io_deq_bits_MPORT_data = ram_weights_1_io_deq_bits_MPORT_addr >= 2'h3 ? _RAND_27[31:0] :
    ram_weights_1[ram_weights_1_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_weights_1_MPORT_data = io_enq_bits_weights_1;
  assign ram_weights_1_MPORT_addr = enq_ptr_value;
  assign ram_weights_1_MPORT_mask = 1'h1;
  assign ram_weights_1_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_weights_2_io_deq_bits_MPORT_en = 1'h1;
  assign ram_weights_2_io_deq_bits_MPORT_addr = deq_ptr_value;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_weights_2_io_deq_bits_MPORT_data = ram_weights_2[ram_weights_2_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  `else
  assign ram_weights_2_io_deq_bits_MPORT_data = ram_weights_2_io_deq_bits_MPORT_addr >= 2'h3 ? _RAND_29[31:0] :
    ram_weights_2[ram_weights_2_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_weights_2_MPORT_data = io_enq_bits_weights_2;
  assign ram_weights_2_MPORT_addr = enq_ptr_value;
  assign ram_weights_2_MPORT_mask = 1'h1;
  assign ram_weights_2_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_weights_3_io_deq_bits_MPORT_en = 1'h1;
  assign ram_weights_3_io_deq_bits_MPORT_addr = deq_ptr_value;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_weights_3_io_deq_bits_MPORT_data = ram_weights_3[ram_weights_3_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  `else
  assign ram_weights_3_io_deq_bits_MPORT_data = ram_weights_3_io_deq_bits_MPORT_addr >= 2'h3 ? _RAND_31[31:0] :
    ram_weights_3[ram_weights_3_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_weights_3_MPORT_data = io_enq_bits_weights_3;
  assign ram_weights_3_MPORT_addr = enq_ptr_value;
  assign ram_weights_3_MPORT_mask = 1'h1;
  assign ram_weights_3_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_weights_4_io_deq_bits_MPORT_en = 1'h1;
  assign ram_weights_4_io_deq_bits_MPORT_addr = deq_ptr_value;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_weights_4_io_deq_bits_MPORT_data = ram_weights_4[ram_weights_4_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  `else
  assign ram_weights_4_io_deq_bits_MPORT_data = ram_weights_4_io_deq_bits_MPORT_addr >= 2'h3 ? _RAND_33[31:0] :
    ram_weights_4[ram_weights_4_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_weights_4_MPORT_data = io_enq_bits_weights_4;
  assign ram_weights_4_MPORT_addr = enq_ptr_value;
  assign ram_weights_4_MPORT_mask = 1'h1;
  assign ram_weights_4_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_last_io_deq_bits_MPORT_en = 1'h1;
  assign ram_last_io_deq_bits_MPORT_addr = deq_ptr_value;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign ram_last_io_deq_bits_MPORT_data = ram_last[ram_last_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  `else
  assign ram_last_io_deq_bits_MPORT_data = ram_last_io_deq_bits_MPORT_addr >= 2'h3 ? _RAND_35[0:0] :
    ram_last[ram_last_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign ram_last_MPORT_data = io_enq_bits_last;
  assign ram_last_MPORT_addr = enq_ptr_value;
  assign ram_last_MPORT_mask = 1'h1;
  assign ram_last_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 305:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 304:19]
  assign io_deq_bits_features_0 = ram_features_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_features_1 = ram_features_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_features_2 = ram_features_2_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_features_3 = ram_features_3_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_features_4 = ram_features_4_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_offset = ram_offset_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_search_for_root = ram_search_for_root_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_tree_to_exec = ram_tree_to_exec_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_scores_0 = ram_scores_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_scores_1 = ram_scores_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_scores_2 = ram_scores_2_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_scores_3 = ram_scores_3_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_weights_0 = ram_weights_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_weights_1 = ram_weights_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_weights_2 = ram_weights_2_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_weights_3 = ram_weights_3_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_weights_4 = ram_weights_4_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_last = ram_last_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  always @(posedge clock) begin
    if (ram_features_0_MPORT_en & ram_features_0_MPORT_mask) begin
      ram_features_0[ram_features_0_MPORT_addr] <= ram_features_0_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_features_1_MPORT_en & ram_features_1_MPORT_mask) begin
      ram_features_1[ram_features_1_MPORT_addr] <= ram_features_1_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_features_2_MPORT_en & ram_features_2_MPORT_mask) begin
      ram_features_2[ram_features_2_MPORT_addr] <= ram_features_2_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_features_3_MPORT_en & ram_features_3_MPORT_mask) begin
      ram_features_3[ram_features_3_MPORT_addr] <= ram_features_3_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_features_4_MPORT_en & ram_features_4_MPORT_mask) begin
      ram_features_4[ram_features_4_MPORT_addr] <= ram_features_4_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_offset_MPORT_en & ram_offset_MPORT_mask) begin
      ram_offset[ram_offset_MPORT_addr] <= ram_offset_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_search_for_root_MPORT_en & ram_search_for_root_MPORT_mask) begin
      ram_search_for_root[ram_search_for_root_MPORT_addr] <= ram_search_for_root_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_tree_to_exec_MPORT_en & ram_tree_to_exec_MPORT_mask) begin
      ram_tree_to_exec[ram_tree_to_exec_MPORT_addr] <= ram_tree_to_exec_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_scores_0_MPORT_en & ram_scores_0_MPORT_mask) begin
      ram_scores_0[ram_scores_0_MPORT_addr] <= ram_scores_0_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_scores_1_MPORT_en & ram_scores_1_MPORT_mask) begin
      ram_scores_1[ram_scores_1_MPORT_addr] <= ram_scores_1_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_scores_2_MPORT_en & ram_scores_2_MPORT_mask) begin
      ram_scores_2[ram_scores_2_MPORT_addr] <= ram_scores_2_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_scores_3_MPORT_en & ram_scores_3_MPORT_mask) begin
      ram_scores_3[ram_scores_3_MPORT_addr] <= ram_scores_3_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_weights_0_MPORT_en & ram_weights_0_MPORT_mask) begin
      ram_weights_0[ram_weights_0_MPORT_addr] <= ram_weights_0_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_weights_1_MPORT_en & ram_weights_1_MPORT_mask) begin
      ram_weights_1[ram_weights_1_MPORT_addr] <= ram_weights_1_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_weights_2_MPORT_en & ram_weights_2_MPORT_mask) begin
      ram_weights_2[ram_weights_2_MPORT_addr] <= ram_weights_2_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_weights_3_MPORT_en & ram_weights_3_MPORT_mask) begin
      ram_weights_3[ram_weights_3_MPORT_addr] <= ram_weights_3_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_weights_4_MPORT_en & ram_weights_4_MPORT_mask) begin
      ram_weights_4[ram_weights_4_MPORT_addr] <= ram_weights_4_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_last_MPORT_en & ram_last_MPORT_mask) begin
      ram_last[ram_last_MPORT_addr] <= ram_last_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (reset) begin // @[Counter.scala 61:40]
      enq_ptr_value <= 2'h0; // @[Counter.scala 61:40]
    end else if (do_enq) begin // @[Decoupled.scala 288:16]
      if (wrap) begin // @[Counter.scala 87:20]
        enq_ptr_value <= 2'h0; // @[Counter.scala 87:28]
      end else begin
        enq_ptr_value <= _value_T_1; // @[Counter.scala 77:15]
      end
    end
    if (reset) begin // @[Counter.scala 61:40]
      deq_ptr_value <= 2'h0; // @[Counter.scala 61:40]
    end else if (do_deq) begin // @[Decoupled.scala 292:16]
      if (wrap_1) begin // @[Counter.scala 87:20]
        deq_ptr_value <= 2'h0; // @[Counter.scala 87:28]
      end else begin
        deq_ptr_value <= _value_T_3; // @[Counter.scala 77:15]
      end
    end
    if (reset) begin // @[Decoupled.scala 278:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 278:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 295:27]
      maybe_full <= do_enq; // @[Decoupled.scala 296:16]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_GARBAGE_ASSIGN
  _RAND_1 = {1{`RANDOM}};
  _RAND_3 = {1{`RANDOM}};
  _RAND_5 = {1{`RANDOM}};
  _RAND_7 = {1{`RANDOM}};
  _RAND_9 = {1{`RANDOM}};
  _RAND_11 = {1{`RANDOM}};
  _RAND_13 = {1{`RANDOM}};
  _RAND_15 = {1{`RANDOM}};
  _RAND_17 = {1{`RANDOM}};
  _RAND_19 = {1{`RANDOM}};
  _RAND_21 = {1{`RANDOM}};
  _RAND_23 = {1{`RANDOM}};
  _RAND_25 = {1{`RANDOM}};
  _RAND_27 = {1{`RANDOM}};
  _RAND_29 = {1{`RANDOM}};
  _RAND_31 = {1{`RANDOM}};
  _RAND_33 = {1{`RANDOM}};
  _RAND_35 = {1{`RANDOM}};
`endif // RANDOMIZE_GARBAGE_ASSIGN
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 3; initvar = initvar+1)
    ram_features_0[initvar] = _RAND_0[31:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 3; initvar = initvar+1)
    ram_features_1[initvar] = _RAND_2[31:0];
  _RAND_4 = {1{`RANDOM}};
  for (initvar = 0; initvar < 3; initvar = initvar+1)
    ram_features_2[initvar] = _RAND_4[31:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 3; initvar = initvar+1)
    ram_features_3[initvar] = _RAND_6[31:0];
  _RAND_8 = {1{`RANDOM}};
  for (initvar = 0; initvar < 3; initvar = initvar+1)
    ram_features_4[initvar] = _RAND_8[31:0];
  _RAND_10 = {1{`RANDOM}};
  for (initvar = 0; initvar < 3; initvar = initvar+1)
    ram_offset[initvar] = _RAND_10[9:0];
  _RAND_12 = {1{`RANDOM}};
  for (initvar = 0; initvar < 3; initvar = initvar+1)
    ram_search_for_root[initvar] = _RAND_12[0:0];
  _RAND_14 = {1{`RANDOM}};
  for (initvar = 0; initvar < 3; initvar = initvar+1)
    ram_tree_to_exec[initvar] = _RAND_14[7:0];
  _RAND_16 = {1{`RANDOM}};
  for (initvar = 0; initvar < 3; initvar = initvar+1)
    ram_scores_0[initvar] = _RAND_16[31:0];
  _RAND_18 = {1{`RANDOM}};
  for (initvar = 0; initvar < 3; initvar = initvar+1)
    ram_scores_1[initvar] = _RAND_18[31:0];
  _RAND_20 = {1{`RANDOM}};
  for (initvar = 0; initvar < 3; initvar = initvar+1)
    ram_scores_2[initvar] = _RAND_20[31:0];
  _RAND_22 = {1{`RANDOM}};
  for (initvar = 0; initvar < 3; initvar = initvar+1)
    ram_scores_3[initvar] = _RAND_22[31:0];
  _RAND_24 = {1{`RANDOM}};
  for (initvar = 0; initvar < 3; initvar = initvar+1)
    ram_weights_0[initvar] = _RAND_24[31:0];
  _RAND_26 = {1{`RANDOM}};
  for (initvar = 0; initvar < 3; initvar = initvar+1)
    ram_weights_1[initvar] = _RAND_26[31:0];
  _RAND_28 = {1{`RANDOM}};
  for (initvar = 0; initvar < 3; initvar = initvar+1)
    ram_weights_2[initvar] = _RAND_28[31:0];
  _RAND_30 = {1{`RANDOM}};
  for (initvar = 0; initvar < 3; initvar = initvar+1)
    ram_weights_3[initvar] = _RAND_30[31:0];
  _RAND_32 = {1{`RANDOM}};
  for (initvar = 0; initvar < 3; initvar = initvar+1)
    ram_weights_4[initvar] = _RAND_32[31:0];
  _RAND_34 = {1{`RANDOM}};
  for (initvar = 0; initvar < 3; initvar = initvar+1)
    ram_last[initvar] = _RAND_34[0:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_36 = {1{`RANDOM}};
  enq_ptr_value = _RAND_36[1:0];
  _RAND_37 = {1{`RANDOM}};
  deq_ptr_value = _RAND_37[1:0];
  _RAND_38 = {1{`RANDOM}};
  maybe_full = _RAND_38[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module TreePE(
  input         clock,
  input         reset,
  output        io_sample_in_ready,
  input         io_sample_in_valid,
  input  [31:0] io_sample_in_bits_features_0,
  input  [31:0] io_sample_in_bits_features_1,
  input  [31:0] io_sample_in_bits_features_2,
  input  [31:0] io_sample_in_bits_features_3,
  input  [31:0] io_sample_in_bits_features_4,
  input  [9:0]  io_sample_in_bits_offset,
  input         io_sample_in_bits_search_for_root,
  input  [7:0]  io_sample_in_bits_tree_to_exec,
  input  [31:0] io_sample_in_bits_scores_0,
  input  [31:0] io_sample_in_bits_scores_1,
  input  [31:0] io_sample_in_bits_scores_2,
  input  [31:0] io_sample_in_bits_scores_3,
  input  [31:0] io_sample_in_bits_weights_0,
  input  [31:0] io_sample_in_bits_weights_1,
  input  [31:0] io_sample_in_bits_weights_2,
  input  [31:0] io_sample_in_bits_weights_3,
  input  [31:0] io_sample_in_bits_weights_4,
  input         io_sample_in_bits_last,
  output [12:0] io_mem_addr_1,
  input  [63:0] io_mem_dataOut_1,
  input         io_sample_out_ready,
  output        io_sample_out_valid,
  output [31:0] io_sample_out_bits_features_0,
  output [31:0] io_sample_out_bits_features_1,
  output [31:0] io_sample_out_bits_features_2,
  output [31:0] io_sample_out_bits_features_3,
  output [31:0] io_sample_out_bits_features_4,
  output [9:0]  io_sample_out_bits_offset,
  output        io_sample_out_bits_search_for_root,
  output [7:0]  io_sample_out_bits_tree_to_exec,
  output [31:0] io_sample_out_bits_scores_0,
  output [31:0] io_sample_out_bits_scores_1,
  output [31:0] io_sample_out_bits_scores_2,
  output [31:0] io_sample_out_bits_scores_3,
  output [31:0] io_sample_out_bits_weights_0,
  output [31:0] io_sample_out_bits_weights_1,
  output [31:0] io_sample_out_bits_weights_2,
  output [31:0] io_sample_out_bits_weights_3,
  output [31:0] io_sample_out_bits_weights_4,
  output        io_sample_out_bits_last
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
`endif // RANDOMIZE_REG_INIT
  wire  queue_clock; // @[Decoupled.scala 377:21]
  wire  queue_reset; // @[Decoupled.scala 377:21]
  wire  queue_io_enq_ready; // @[Decoupled.scala 377:21]
  wire  queue_io_enq_valid; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_features_0; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_features_1; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_features_2; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_features_3; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_features_4; // @[Decoupled.scala 377:21]
  wire [9:0] queue_io_enq_bits_offset; // @[Decoupled.scala 377:21]
  wire  queue_io_enq_bits_search_for_root; // @[Decoupled.scala 377:21]
  wire [7:0] queue_io_enq_bits_tree_to_exec; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_scores_0; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_scores_1; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_scores_2; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_scores_3; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_weights_0; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_weights_1; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_weights_2; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_weights_3; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_weights_4; // @[Decoupled.scala 377:21]
  wire  queue_io_enq_bits_last; // @[Decoupled.scala 377:21]
  wire  queue_io_deq_ready; // @[Decoupled.scala 377:21]
  wire  queue_io_deq_valid; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_features_0; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_features_1; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_features_2; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_features_3; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_features_4; // @[Decoupled.scala 377:21]
  wire [9:0] queue_io_deq_bits_offset; // @[Decoupled.scala 377:21]
  wire  queue_io_deq_bits_search_for_root; // @[Decoupled.scala 377:21]
  wire [7:0] queue_io_deq_bits_tree_to_exec; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_scores_0; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_scores_1; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_scores_2; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_scores_3; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_weights_0; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_weights_1; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_weights_2; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_weights_3; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_weights_4; // @[Decoupled.scala 377:21]
  wire  queue_io_deq_bits_last; // @[Decoupled.scala 377:21]
  reg  REG; // @[TreePE.scala 29:17]
  wire [2:0] attr_id = io_mem_dataOut_1[34:32]; // @[TreePE.scala 31:37]
  wire [9:0] leftChildInfo = io_mem_dataOut_1[44:35]; // @[TreePE.scala 34:43]
  wire [9:0] rightChildInfo = io_mem_dataOut_1[54:45]; // @[TreePE.scala 35:44]
  wire  leftChildType = io_mem_dataOut_1[55]; // @[TreePE.scala 36:43]
  wire  rightChildType = io_mem_dataOut_1[56]; // @[TreePE.scala 37:44]
  wire  is_valid = io_mem_dataOut_1[57]; // @[TreePE.scala 38:38]
  wire [2:0] depth_indicator = io_mem_dataOut_1[60:58]; // @[TreePE.scala 39:45]
  reg [31:0] REG_1_0; // @[TreePE.scala 41:45]
  reg [31:0] REG_1_1; // @[TreePE.scala 41:45]
  reg [31:0] REG_1_2; // @[TreePE.scala 41:45]
  reg [31:0] REG_1_3; // @[TreePE.scala 41:45]
  reg [31:0] REG_1_4; // @[TreePE.scala 41:45]
  reg [31:0] REG_2_0; // @[TreePE.scala 42:44]
  reg [31:0] REG_2_1; // @[TreePE.scala 42:44]
  reg [31:0] REG_2_2; // @[TreePE.scala 42:44]
  reg [31:0] REG_2_3; // @[TreePE.scala 42:44]
  reg [31:0] REG_2_4; // @[TreePE.scala 42:44]
  reg [7:0] io_sample_out_bits_tree_to_exec_REG; // @[TreePE.scala 43:49]
  reg [31:0] features_bits_0; // @[TreePE.scala 51:36]
  reg [31:0] features_bits_1; // @[TreePE.scala 51:36]
  reg [31:0] features_bits_2; // @[TreePE.scala 51:36]
  reg [31:0] features_bits_3; // @[TreePE.scala 51:36]
  reg [31:0] features_bits_4; // @[TreePE.scala 51:36]
  reg [31:0] scores_bits_0; // @[TreePE.scala 52:34]
  reg [31:0] scores_bits_1; // @[TreePE.scala 52:34]
  reg [31:0] scores_bits_2; // @[TreePE.scala 52:34]
  reg [31:0] scores_bits_3; // @[TreePE.scala 52:34]
  reg [31:0] weights_bits_0; // @[TreePE.scala 53:35]
  reg [31:0] weights_bits_1; // @[TreePE.scala 53:35]
  reg [31:0] weights_bits_2; // @[TreePE.scala 53:35]
  reg [31:0] weights_bits_3; // @[TreePE.scala 53:35]
  reg [31:0] weights_bits_4; // @[TreePE.scala 53:35]
  wire [15:0] _shift_T = io_mem_dataOut_1[15:0]; // @[TreePE.scala 54:69]
  wire [31:0] _GEN_1 = 3'h1 == attr_id ? $signed(features_bits_1) : $signed(features_bits_0); // @[TreePE.scala 54:{45,45}]
  wire [31:0] _GEN_2 = 3'h2 == attr_id ? $signed(features_bits_2) : $signed(_GEN_1); // @[TreePE.scala 54:{45,45}]
  wire [31:0] _GEN_3 = 3'h3 == attr_id ? $signed(features_bits_3) : $signed(_GEN_2); // @[TreePE.scala 54:{45,45}]
  wire [31:0] _GEN_4 = 3'h4 == attr_id ? $signed(features_bits_4) : $signed(_GEN_3); // @[TreePE.scala 54:{45,45}]
  wire [23:0] _GEN_26 = {$signed(_shift_T), 8'h0}; // @[TreePE.scala 54:45]
  wire [31:0] _GEN_28 = {{8{_GEN_26[23]}},_GEN_26}; // @[TreePE.scala 54:45]
  wire  _shift_T_1 = $signed(_GEN_4) < $signed(_GEN_28); // @[TreePE.scala 54:45]
  wire  shift = $signed(_GEN_4) < $signed(_GEN_28) ? leftChildType : rightChildType; // @[TreePE.scala 54:21]
  wire [9:0] offset = _shift_T_1 ? leftChildInfo : rightChildInfo; // @[TreePE.scala 55:22]
  wire  _io_sample_out_bits_offset_T = ~shift; // @[TreePE.scala 56:48]
  reg [7:0] io_sample_out_bits_offset_REG; // @[TreePE.scala 56:67]
  wire [31:0] _GEN_6 = 3'h1 == depth_indicator ? $signed(weights_bits_1) : $signed(weights_bits_0); // @[TreePE.scala 60:{97,97}]
  wire [31:0] _GEN_7 = 3'h2 == depth_indicator ? $signed(weights_bits_2) : $signed(_GEN_6); // @[TreePE.scala 60:{97,97}]
  wire [31:0] _GEN_8 = 3'h3 == depth_indicator ? $signed(weights_bits_3) : $signed(_GEN_7); // @[TreePE.scala 60:{97,97}]
  wire [31:0] _io_sample_out_bits_scores_0_T = 3'h4 == depth_indicator ? $signed(weights_bits_4) : $signed(_GEN_8); // @[TreePE.scala 60:97]
  wire [15:0] _io_sample_out_bits_scores_0_T_5 = _io_sample_out_bits_offset_T & is_valid & 10'h0 == offset ? 16'hffff : 16'h0
    ; // @[TreePE.scala 60:105]
  wire [31:0] _GEN_33 = {{16'd0}, _io_sample_out_bits_scores_0_T_5}; // @[TreePE.scala 60:100]
  wire [31:0] _io_sample_out_bits_scores_0_T_7 = _io_sample_out_bits_scores_0_T & _GEN_33; // @[TreePE.scala 60:195]
  wire [39:0] _GEN_34 = {{8{scores_bits_0[31]}},scores_bits_0}; // @[TreePE.scala 60:58]
  wire [39:0] _GEN_35 = {$signed(_io_sample_out_bits_scores_0_T_7), 8'h0}; // @[TreePE.scala 60:58]
  wire [39:0] _io_sample_out_bits_scores_0_T_10 = $signed(_GEN_34) + $signed(_GEN_35); // @[TreePE.scala 60:58]
  wire [15:0] _io_sample_out_bits_scores_1_T_5 = _io_sample_out_bits_offset_T & is_valid & 10'h1 == offset ? 16'hffff : 16'h0
    ; // @[TreePE.scala 60:105]
  wire [31:0] _GEN_36 = {{16'd0}, _io_sample_out_bits_scores_1_T_5}; // @[TreePE.scala 60:100]
  wire [31:0] _io_sample_out_bits_scores_1_T_7 = _io_sample_out_bits_scores_0_T & _GEN_36; // @[TreePE.scala 60:195]
  wire [39:0] _GEN_37 = {{8{scores_bits_1[31]}},scores_bits_1}; // @[TreePE.scala 60:58]
  wire [39:0] _GEN_38 = {$signed(_io_sample_out_bits_scores_1_T_7), 8'h0}; // @[TreePE.scala 60:58]
  wire [39:0] _io_sample_out_bits_scores_1_T_10 = $signed(_GEN_37) + $signed(_GEN_38); // @[TreePE.scala 60:58]
  wire [15:0] _io_sample_out_bits_scores_2_T_5 = _io_sample_out_bits_offset_T & is_valid & 10'h2 == offset ? 16'hffff : 16'h0
    ; // @[TreePE.scala 60:105]
  wire [31:0] _GEN_39 = {{16'd0}, _io_sample_out_bits_scores_2_T_5}; // @[TreePE.scala 60:100]
  wire [31:0] _io_sample_out_bits_scores_2_T_7 = _io_sample_out_bits_scores_0_T & _GEN_39; // @[TreePE.scala 60:195]
  wire [39:0] _GEN_40 = {{8{scores_bits_2[31]}},scores_bits_2}; // @[TreePE.scala 60:58]
  wire [39:0] _GEN_41 = {$signed(_io_sample_out_bits_scores_2_T_7), 8'h0}; // @[TreePE.scala 60:58]
  wire [39:0] _io_sample_out_bits_scores_2_T_10 = $signed(_GEN_40) + $signed(_GEN_41); // @[TreePE.scala 60:58]
  wire [15:0] _io_sample_out_bits_scores_3_T_5 = _io_sample_out_bits_offset_T & is_valid & 10'h3 == offset ? 16'hffff : 16'h0
    ; // @[TreePE.scala 60:105]
  wire [31:0] _GEN_42 = {{16'd0}, _io_sample_out_bits_scores_3_T_5}; // @[TreePE.scala 60:100]
  wire [31:0] _io_sample_out_bits_scores_3_T_7 = _io_sample_out_bits_scores_0_T & _GEN_42; // @[TreePE.scala 60:195]
  wire [39:0] _GEN_43 = {{8{scores_bits_3[31]}},scores_bits_3}; // @[TreePE.scala 60:58]
  wire [39:0] _GEN_44 = {$signed(_io_sample_out_bits_scores_3_T_7), 8'h0}; // @[TreePE.scala 60:58]
  wire [39:0] _io_sample_out_bits_scores_3_T_10 = $signed(_GEN_43) + $signed(_GEN_44); // @[TreePE.scala 60:58]
  reg  io_sample_out_bits_last_REG; // @[TreePE.scala 63:43]
  Queue_1 queue ( // @[Decoupled.scala 377:21]
    .clock(queue_clock),
    .reset(queue_reset),
    .io_enq_ready(queue_io_enq_ready),
    .io_enq_valid(queue_io_enq_valid),
    .io_enq_bits_features_0(queue_io_enq_bits_features_0),
    .io_enq_bits_features_1(queue_io_enq_bits_features_1),
    .io_enq_bits_features_2(queue_io_enq_bits_features_2),
    .io_enq_bits_features_3(queue_io_enq_bits_features_3),
    .io_enq_bits_features_4(queue_io_enq_bits_features_4),
    .io_enq_bits_offset(queue_io_enq_bits_offset),
    .io_enq_bits_search_for_root(queue_io_enq_bits_search_for_root),
    .io_enq_bits_tree_to_exec(queue_io_enq_bits_tree_to_exec),
    .io_enq_bits_scores_0(queue_io_enq_bits_scores_0),
    .io_enq_bits_scores_1(queue_io_enq_bits_scores_1),
    .io_enq_bits_scores_2(queue_io_enq_bits_scores_2),
    .io_enq_bits_scores_3(queue_io_enq_bits_scores_3),
    .io_enq_bits_weights_0(queue_io_enq_bits_weights_0),
    .io_enq_bits_weights_1(queue_io_enq_bits_weights_1),
    .io_enq_bits_weights_2(queue_io_enq_bits_weights_2),
    .io_enq_bits_weights_3(queue_io_enq_bits_weights_3),
    .io_enq_bits_weights_4(queue_io_enq_bits_weights_4),
    .io_enq_bits_last(queue_io_enq_bits_last),
    .io_deq_ready(queue_io_deq_ready),
    .io_deq_valid(queue_io_deq_valid),
    .io_deq_bits_features_0(queue_io_deq_bits_features_0),
    .io_deq_bits_features_1(queue_io_deq_bits_features_1),
    .io_deq_bits_features_2(queue_io_deq_bits_features_2),
    .io_deq_bits_features_3(queue_io_deq_bits_features_3),
    .io_deq_bits_features_4(queue_io_deq_bits_features_4),
    .io_deq_bits_offset(queue_io_deq_bits_offset),
    .io_deq_bits_search_for_root(queue_io_deq_bits_search_for_root),
    .io_deq_bits_tree_to_exec(queue_io_deq_bits_tree_to_exec),
    .io_deq_bits_scores_0(queue_io_deq_bits_scores_0),
    .io_deq_bits_scores_1(queue_io_deq_bits_scores_1),
    .io_deq_bits_scores_2(queue_io_deq_bits_scores_2),
    .io_deq_bits_scores_3(queue_io_deq_bits_scores_3),
    .io_deq_bits_weights_0(queue_io_deq_bits_weights_0),
    .io_deq_bits_weights_1(queue_io_deq_bits_weights_1),
    .io_deq_bits_weights_2(queue_io_deq_bits_weights_2),
    .io_deq_bits_weights_3(queue_io_deq_bits_weights_3),
    .io_deq_bits_weights_4(queue_io_deq_bits_weights_4),
    .io_deq_bits_last(queue_io_deq_bits_last)
  );
  assign io_sample_in_ready = queue_io_enq_ready; // @[Decoupled.scala 381:17]
  assign io_mem_addr_1 = {{3'd0}, queue_io_deq_bits_offset}; // @[TreePE.scala 18:19]
  assign io_sample_out_valid = REG; // @[TreePE.scala 29:31 45:27 83:27]
  assign io_sample_out_bits_features_0 = REG_1_0; // @[TreePE.scala 29:31 41:35]
  assign io_sample_out_bits_features_1 = REG_1_1; // @[TreePE.scala 29:31 41:35]
  assign io_sample_out_bits_features_2 = REG_1_2; // @[TreePE.scala 29:31 41:35]
  assign io_sample_out_bits_features_3 = REG_1_3; // @[TreePE.scala 29:31 41:35]
  assign io_sample_out_bits_features_4 = REG_1_4; // @[TreePE.scala 29:31 41:35]
  assign io_sample_out_bits_offset = ~shift ? {{2'd0}, io_sample_out_bits_offset_REG} : offset; // @[TreePE.scala 56:41]
  assign io_sample_out_bits_search_for_root = ~shift; // @[TreePE.scala 58:47]
  assign io_sample_out_bits_tree_to_exec = io_sample_out_bits_tree_to_exec_REG; // @[TreePE.scala 29:31 43:39]
  assign io_sample_out_bits_scores_0 = _io_sample_out_bits_scores_0_T_10[31:0];
  assign io_sample_out_bits_scores_1 = _io_sample_out_bits_scores_1_T_10[31:0];
  assign io_sample_out_bits_scores_2 = _io_sample_out_bits_scores_2_T_10[31:0];
  assign io_sample_out_bits_scores_3 = _io_sample_out_bits_scores_3_T_10[31:0];
  assign io_sample_out_bits_weights_0 = REG_2_0; // @[TreePE.scala 29:31 42:34]
  assign io_sample_out_bits_weights_1 = REG_2_1; // @[TreePE.scala 29:31 42:34]
  assign io_sample_out_bits_weights_2 = REG_2_2; // @[TreePE.scala 29:31 42:34]
  assign io_sample_out_bits_weights_3 = REG_2_3; // @[TreePE.scala 29:31 42:34]
  assign io_sample_out_bits_weights_4 = REG_2_4; // @[TreePE.scala 29:31 42:34]
  assign io_sample_out_bits_last = io_sample_out_bits_last_REG; // @[TreePE.scala 29:31 63:33]
  assign queue_clock = clock;
  assign queue_reset = reset;
  assign queue_io_enq_valid = io_sample_in_valid; // @[Decoupled.scala 379:22]
  assign queue_io_enq_bits_features_0 = io_sample_in_bits_features_0; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_features_1 = io_sample_in_bits_features_1; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_features_2 = io_sample_in_bits_features_2; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_features_3 = io_sample_in_bits_features_3; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_features_4 = io_sample_in_bits_features_4; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_offset = io_sample_in_bits_offset; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_search_for_root = io_sample_in_bits_search_for_root; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_tree_to_exec = io_sample_in_bits_tree_to_exec; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_scores_0 = io_sample_in_bits_scores_0; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_scores_1 = io_sample_in_bits_scores_1; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_scores_2 = io_sample_in_bits_scores_2; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_scores_3 = io_sample_in_bits_scores_3; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_weights_0 = io_sample_in_bits_weights_0; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_weights_1 = io_sample_in_bits_weights_1; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_weights_2 = io_sample_in_bits_weights_2; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_weights_3 = io_sample_in_bits_weights_3; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_weights_4 = io_sample_in_bits_weights_4; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_last = io_sample_in_bits_last; // @[Decoupled.scala 380:21]
  assign queue_io_deq_ready = io_sample_out_ready; // @[TreePE.scala 86:17]
  always @(posedge clock) begin
    REG <= queue_io_deq_valid; // @[TreePE.scala 29:17]
    REG_1_0 <= queue_io_deq_bits_features_0; // @[TreePE.scala 41:45]
    REG_1_1 <= queue_io_deq_bits_features_1; // @[TreePE.scala 41:45]
    REG_1_2 <= queue_io_deq_bits_features_2; // @[TreePE.scala 41:45]
    REG_1_3 <= queue_io_deq_bits_features_3; // @[TreePE.scala 41:45]
    REG_1_4 <= queue_io_deq_bits_features_4; // @[TreePE.scala 41:45]
    REG_2_0 <= queue_io_deq_bits_weights_0; // @[TreePE.scala 42:44]
    REG_2_1 <= queue_io_deq_bits_weights_1; // @[TreePE.scala 42:44]
    REG_2_2 <= queue_io_deq_bits_weights_2; // @[TreePE.scala 42:44]
    REG_2_3 <= queue_io_deq_bits_weights_3; // @[TreePE.scala 42:44]
    REG_2_4 <= queue_io_deq_bits_weights_4; // @[TreePE.scala 42:44]
    io_sample_out_bits_tree_to_exec_REG <= queue_io_deq_bits_tree_to_exec; // @[TreePE.scala 43:49]
    features_bits_0 <= queue_io_deq_bits_features_0; // @[TreePE.scala 51:36]
    features_bits_1 <= queue_io_deq_bits_features_1; // @[TreePE.scala 51:36]
    features_bits_2 <= queue_io_deq_bits_features_2; // @[TreePE.scala 51:36]
    features_bits_3 <= queue_io_deq_bits_features_3; // @[TreePE.scala 51:36]
    features_bits_4 <= queue_io_deq_bits_features_4; // @[TreePE.scala 51:36]
    scores_bits_0 <= queue_io_deq_bits_scores_0; // @[TreePE.scala 52:34]
    scores_bits_1 <= queue_io_deq_bits_scores_1; // @[TreePE.scala 52:34]
    scores_bits_2 <= queue_io_deq_bits_scores_2; // @[TreePE.scala 52:34]
    scores_bits_3 <= queue_io_deq_bits_scores_3; // @[TreePE.scala 52:34]
    weights_bits_0 <= queue_io_deq_bits_weights_0; // @[TreePE.scala 53:35]
    weights_bits_1 <= queue_io_deq_bits_weights_1; // @[TreePE.scala 53:35]
    weights_bits_2 <= queue_io_deq_bits_weights_2; // @[TreePE.scala 53:35]
    weights_bits_3 <= queue_io_deq_bits_weights_3; // @[TreePE.scala 53:35]
    weights_bits_4 <= queue_io_deq_bits_weights_4; // @[TreePE.scala 53:35]
    io_sample_out_bits_offset_REG <= queue_io_deq_bits_tree_to_exec; // @[TreePE.scala 56:67]
    io_sample_out_bits_last_REG <= queue_io_deq_bits_last; // @[TreePE.scala 63:43]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  REG = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  REG_1_0 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  REG_1_1 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  REG_1_2 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  REG_1_3 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  REG_1_4 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  REG_2_0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  REG_2_1 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  REG_2_2 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  REG_2_3 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  REG_2_4 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  io_sample_out_bits_tree_to_exec_REG = _RAND_11[7:0];
  _RAND_12 = {1{`RANDOM}};
  features_bits_0 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  features_bits_1 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  features_bits_2 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  features_bits_3 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  features_bits_4 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  scores_bits_0 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  scores_bits_1 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  scores_bits_2 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  scores_bits_3 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  weights_bits_0 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  weights_bits_1 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  weights_bits_2 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  weights_bits_3 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  weights_bits_4 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  io_sample_out_bits_offset_REG = _RAND_26[7:0];
  _RAND_27 = {1{`RANDOM}};
  io_sample_out_bits_last_REG = _RAND_27[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module TreePEwithBRAM(
  input         clock,
  input         reset,
  output        pe_io_sample_in_ready,
  input         pe_io_sample_in_valid,
  input  [31:0] pe_io_sample_in_bits_features_0,
  input  [31:0] pe_io_sample_in_bits_features_1,
  input  [31:0] pe_io_sample_in_bits_features_2,
  input  [31:0] pe_io_sample_in_bits_features_3,
  input  [31:0] pe_io_sample_in_bits_features_4,
  input  [9:0]  pe_io_sample_in_bits_offset,
  input         pe_io_sample_in_bits_search_for_root,
  input  [7:0]  pe_io_sample_in_bits_tree_to_exec,
  input  [31:0] pe_io_sample_in_bits_scores_0,
  input  [31:0] pe_io_sample_in_bits_scores_1,
  input  [31:0] pe_io_sample_in_bits_scores_2,
  input  [31:0] pe_io_sample_in_bits_scores_3,
  input  [31:0] pe_io_sample_in_bits_weights_0,
  input  [31:0] pe_io_sample_in_bits_weights_1,
  input  [31:0] pe_io_sample_in_bits_weights_2,
  input  [31:0] pe_io_sample_in_bits_weights_3,
  input  [31:0] pe_io_sample_in_bits_weights_4,
  input         pe_io_sample_in_bits_last,
  output [12:0] pe_io_mem_addr_1,
  input  [63:0] pe_io_mem_dataOut_1,
  input         pe_io_sample_out_ready,
  output        pe_io_sample_out_valid,
  output [31:0] pe_io_sample_out_bits_features_0,
  output [31:0] pe_io_sample_out_bits_features_1,
  output [31:0] pe_io_sample_out_bits_features_2,
  output [31:0] pe_io_sample_out_bits_features_3,
  output [31:0] pe_io_sample_out_bits_features_4,
  output [9:0]  pe_io_sample_out_bits_offset,
  output        pe_io_sample_out_bits_search_for_root,
  output [7:0]  pe_io_sample_out_bits_tree_to_exec,
  output [31:0] pe_io_sample_out_bits_scores_0,
  output [31:0] pe_io_sample_out_bits_scores_1,
  output [31:0] pe_io_sample_out_bits_scores_2,
  output [31:0] pe_io_sample_out_bits_scores_3,
  output [31:0] pe_io_sample_out_bits_weights_0,
  output [31:0] pe_io_sample_out_bits_weights_1,
  output [31:0] pe_io_sample_out_bits_weights_2,
  output [31:0] pe_io_sample_out_bits_weights_3,
  output [31:0] pe_io_sample_out_bits_weights_4,
  output        pe_io_sample_out_bits_last
);
  wire  pe__clock; // @[TreePE.scala 117:18]
  wire  pe__reset; // @[TreePE.scala 117:18]
  wire  pe__io_sample_in_ready; // @[TreePE.scala 117:18]
  wire  pe__io_sample_in_valid; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_in_bits_features_0; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_in_bits_features_1; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_in_bits_features_2; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_in_bits_features_3; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_in_bits_features_4; // @[TreePE.scala 117:18]
  wire [9:0] pe__io_sample_in_bits_offset; // @[TreePE.scala 117:18]
  wire  pe__io_sample_in_bits_search_for_root; // @[TreePE.scala 117:18]
  wire [7:0] pe__io_sample_in_bits_tree_to_exec; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_in_bits_scores_0; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_in_bits_scores_1; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_in_bits_scores_2; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_in_bits_scores_3; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_in_bits_weights_0; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_in_bits_weights_1; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_in_bits_weights_2; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_in_bits_weights_3; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_in_bits_weights_4; // @[TreePE.scala 117:18]
  wire  pe__io_sample_in_bits_last; // @[TreePE.scala 117:18]
  wire [12:0] pe__io_mem_addr_1; // @[TreePE.scala 117:18]
  wire [63:0] pe__io_mem_dataOut_1; // @[TreePE.scala 117:18]
  wire  pe__io_sample_out_ready; // @[TreePE.scala 117:18]
  wire  pe__io_sample_out_valid; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_out_bits_features_0; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_out_bits_features_1; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_out_bits_features_2; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_out_bits_features_3; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_out_bits_features_4; // @[TreePE.scala 117:18]
  wire [9:0] pe__io_sample_out_bits_offset; // @[TreePE.scala 117:18]
  wire  pe__io_sample_out_bits_search_for_root; // @[TreePE.scala 117:18]
  wire [7:0] pe__io_sample_out_bits_tree_to_exec; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_out_bits_scores_0; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_out_bits_scores_1; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_out_bits_scores_2; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_out_bits_scores_3; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_out_bits_weights_0; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_out_bits_weights_1; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_out_bits_weights_2; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_out_bits_weights_3; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_out_bits_weights_4; // @[TreePE.scala 117:18]
  wire  pe__io_sample_out_bits_last; // @[TreePE.scala 117:18]
  TreePE pe_ ( // @[TreePE.scala 117:18]
    .clock(pe__clock),
    .reset(pe__reset),
    .io_sample_in_ready(pe__io_sample_in_ready),
    .io_sample_in_valid(pe__io_sample_in_valid),
    .io_sample_in_bits_features_0(pe__io_sample_in_bits_features_0),
    .io_sample_in_bits_features_1(pe__io_sample_in_bits_features_1),
    .io_sample_in_bits_features_2(pe__io_sample_in_bits_features_2),
    .io_sample_in_bits_features_3(pe__io_sample_in_bits_features_3),
    .io_sample_in_bits_features_4(pe__io_sample_in_bits_features_4),
    .io_sample_in_bits_offset(pe__io_sample_in_bits_offset),
    .io_sample_in_bits_search_for_root(pe__io_sample_in_bits_search_for_root),
    .io_sample_in_bits_tree_to_exec(pe__io_sample_in_bits_tree_to_exec),
    .io_sample_in_bits_scores_0(pe__io_sample_in_bits_scores_0),
    .io_sample_in_bits_scores_1(pe__io_sample_in_bits_scores_1),
    .io_sample_in_bits_scores_2(pe__io_sample_in_bits_scores_2),
    .io_sample_in_bits_scores_3(pe__io_sample_in_bits_scores_3),
    .io_sample_in_bits_weights_0(pe__io_sample_in_bits_weights_0),
    .io_sample_in_bits_weights_1(pe__io_sample_in_bits_weights_1),
    .io_sample_in_bits_weights_2(pe__io_sample_in_bits_weights_2),
    .io_sample_in_bits_weights_3(pe__io_sample_in_bits_weights_3),
    .io_sample_in_bits_weights_4(pe__io_sample_in_bits_weights_4),
    .io_sample_in_bits_last(pe__io_sample_in_bits_last),
    .io_mem_addr_1(pe__io_mem_addr_1),
    .io_mem_dataOut_1(pe__io_mem_dataOut_1),
    .io_sample_out_ready(pe__io_sample_out_ready),
    .io_sample_out_valid(pe__io_sample_out_valid),
    .io_sample_out_bits_features_0(pe__io_sample_out_bits_features_0),
    .io_sample_out_bits_features_1(pe__io_sample_out_bits_features_1),
    .io_sample_out_bits_features_2(pe__io_sample_out_bits_features_2),
    .io_sample_out_bits_features_3(pe__io_sample_out_bits_features_3),
    .io_sample_out_bits_features_4(pe__io_sample_out_bits_features_4),
    .io_sample_out_bits_offset(pe__io_sample_out_bits_offset),
    .io_sample_out_bits_search_for_root(pe__io_sample_out_bits_search_for_root),
    .io_sample_out_bits_tree_to_exec(pe__io_sample_out_bits_tree_to_exec),
    .io_sample_out_bits_scores_0(pe__io_sample_out_bits_scores_0),
    .io_sample_out_bits_scores_1(pe__io_sample_out_bits_scores_1),
    .io_sample_out_bits_scores_2(pe__io_sample_out_bits_scores_2),
    .io_sample_out_bits_scores_3(pe__io_sample_out_bits_scores_3),
    .io_sample_out_bits_weights_0(pe__io_sample_out_bits_weights_0),
    .io_sample_out_bits_weights_1(pe__io_sample_out_bits_weights_1),
    .io_sample_out_bits_weights_2(pe__io_sample_out_bits_weights_2),
    .io_sample_out_bits_weights_3(pe__io_sample_out_bits_weights_3),
    .io_sample_out_bits_weights_4(pe__io_sample_out_bits_weights_4),
    .io_sample_out_bits_last(pe__io_sample_out_bits_last)
  );
  assign pe_io_sample_in_ready = pe__io_sample_in_ready; // @[TreePE.scala 119:9]
  assign pe_io_mem_addr_1 = pe__io_mem_addr_1; // @[TreePE.scala 119:9]
  assign pe_io_sample_out_valid = pe__io_sample_out_valid; // @[TreePE.scala 119:9]
  assign pe_io_sample_out_bits_features_0 = pe__io_sample_out_bits_features_0; // @[TreePE.scala 119:9]
  assign pe_io_sample_out_bits_features_1 = pe__io_sample_out_bits_features_1; // @[TreePE.scala 119:9]
  assign pe_io_sample_out_bits_features_2 = pe__io_sample_out_bits_features_2; // @[TreePE.scala 119:9]
  assign pe_io_sample_out_bits_features_3 = pe__io_sample_out_bits_features_3; // @[TreePE.scala 119:9]
  assign pe_io_sample_out_bits_features_4 = pe__io_sample_out_bits_features_4; // @[TreePE.scala 119:9]
  assign pe_io_sample_out_bits_offset = pe__io_sample_out_bits_offset; // @[TreePE.scala 119:9]
  assign pe_io_sample_out_bits_search_for_root = pe__io_sample_out_bits_search_for_root; // @[TreePE.scala 119:9]
  assign pe_io_sample_out_bits_tree_to_exec = pe__io_sample_out_bits_tree_to_exec; // @[TreePE.scala 119:9]
  assign pe_io_sample_out_bits_scores_0 = pe__io_sample_out_bits_scores_0; // @[TreePE.scala 119:9]
  assign pe_io_sample_out_bits_scores_1 = pe__io_sample_out_bits_scores_1; // @[TreePE.scala 119:9]
  assign pe_io_sample_out_bits_scores_2 = pe__io_sample_out_bits_scores_2; // @[TreePE.scala 119:9]
  assign pe_io_sample_out_bits_scores_3 = pe__io_sample_out_bits_scores_3; // @[TreePE.scala 119:9]
  assign pe_io_sample_out_bits_weights_0 = pe__io_sample_out_bits_weights_0; // @[TreePE.scala 119:9]
  assign pe_io_sample_out_bits_weights_1 = pe__io_sample_out_bits_weights_1; // @[TreePE.scala 119:9]
  assign pe_io_sample_out_bits_weights_2 = pe__io_sample_out_bits_weights_2; // @[TreePE.scala 119:9]
  assign pe_io_sample_out_bits_weights_3 = pe__io_sample_out_bits_weights_3; // @[TreePE.scala 119:9]
  assign pe_io_sample_out_bits_weights_4 = pe__io_sample_out_bits_weights_4; // @[TreePE.scala 119:9]
  assign pe_io_sample_out_bits_last = pe__io_sample_out_bits_last; // @[TreePE.scala 119:9]
  assign pe__clock = clock;
  assign pe__reset = reset;
  assign pe__io_sample_in_valid = pe_io_sample_in_valid; // @[TreePE.scala 119:9]
  assign pe__io_sample_in_bits_features_0 = pe_io_sample_in_bits_features_0; // @[TreePE.scala 119:9]
  assign pe__io_sample_in_bits_features_1 = pe_io_sample_in_bits_features_1; // @[TreePE.scala 119:9]
  assign pe__io_sample_in_bits_features_2 = pe_io_sample_in_bits_features_2; // @[TreePE.scala 119:9]
  assign pe__io_sample_in_bits_features_3 = pe_io_sample_in_bits_features_3; // @[TreePE.scala 119:9]
  assign pe__io_sample_in_bits_features_4 = pe_io_sample_in_bits_features_4; // @[TreePE.scala 119:9]
  assign pe__io_sample_in_bits_offset = pe_io_sample_in_bits_offset; // @[TreePE.scala 119:9]
  assign pe__io_sample_in_bits_search_for_root = pe_io_sample_in_bits_search_for_root; // @[TreePE.scala 119:9]
  assign pe__io_sample_in_bits_tree_to_exec = pe_io_sample_in_bits_tree_to_exec; // @[TreePE.scala 119:9]
  assign pe__io_sample_in_bits_scores_0 = pe_io_sample_in_bits_scores_0; // @[TreePE.scala 119:9]
  assign pe__io_sample_in_bits_scores_1 = pe_io_sample_in_bits_scores_1; // @[TreePE.scala 119:9]
  assign pe__io_sample_in_bits_scores_2 = pe_io_sample_in_bits_scores_2; // @[TreePE.scala 119:9]
  assign pe__io_sample_in_bits_scores_3 = pe_io_sample_in_bits_scores_3; // @[TreePE.scala 119:9]
  assign pe__io_sample_in_bits_weights_0 = pe_io_sample_in_bits_weights_0; // @[TreePE.scala 119:9]
  assign pe__io_sample_in_bits_weights_1 = pe_io_sample_in_bits_weights_1; // @[TreePE.scala 119:9]
  assign pe__io_sample_in_bits_weights_2 = pe_io_sample_in_bits_weights_2; // @[TreePE.scala 119:9]
  assign pe__io_sample_in_bits_weights_3 = pe_io_sample_in_bits_weights_3; // @[TreePE.scala 119:9]
  assign pe__io_sample_in_bits_weights_4 = pe_io_sample_in_bits_weights_4; // @[TreePE.scala 119:9]
  assign pe__io_sample_in_bits_last = pe_io_sample_in_bits_last; // @[TreePE.scala 119:9]
  assign pe__io_mem_dataOut_1 = pe_io_mem_dataOut_1; // @[TreePE.scala 119:9]
  assign pe__io_sample_out_ready = pe_io_sample_out_ready; // @[TreePE.scala 119:9]
endmodule
module TreePE_1(
  input         clock,
  input         reset,
  output        io_sample_in_ready,
  input         io_sample_in_valid,
  input  [31:0] io_sample_in_bits_features_0,
  input  [31:0] io_sample_in_bits_features_1,
  input  [31:0] io_sample_in_bits_features_2,
  input  [31:0] io_sample_in_bits_features_3,
  input  [31:0] io_sample_in_bits_features_4,
  input  [9:0]  io_sample_in_bits_offset,
  input         io_sample_in_bits_search_for_root,
  input  [7:0]  io_sample_in_bits_tree_to_exec,
  input  [31:0] io_sample_in_bits_scores_0,
  input  [31:0] io_sample_in_bits_scores_1,
  input  [31:0] io_sample_in_bits_scores_2,
  input  [31:0] io_sample_in_bits_scores_3,
  input  [31:0] io_sample_in_bits_weights_0,
  input  [31:0] io_sample_in_bits_weights_1,
  input  [31:0] io_sample_in_bits_weights_2,
  input  [31:0] io_sample_in_bits_weights_3,
  input  [31:0] io_sample_in_bits_weights_4,
  input         io_sample_in_bits_last,
  output [12:0] io_mem_addr_1,
  input  [63:0] io_mem_dataOut_1,
  input         io_sample_out_ready,
  output        io_sample_out_valid,
  output [31:0] io_sample_out_bits_features_0,
  output [31:0] io_sample_out_bits_features_1,
  output [31:0] io_sample_out_bits_features_2,
  output [31:0] io_sample_out_bits_features_3,
  output [31:0] io_sample_out_bits_features_4,
  output [9:0]  io_sample_out_bits_offset,
  output        io_sample_out_bits_search_for_root,
  output [7:0]  io_sample_out_bits_tree_to_exec,
  output [31:0] io_sample_out_bits_scores_0,
  output [31:0] io_sample_out_bits_scores_1,
  output [31:0] io_sample_out_bits_scores_2,
  output [31:0] io_sample_out_bits_scores_3,
  output [31:0] io_sample_out_bits_weights_0,
  output [31:0] io_sample_out_bits_weights_1,
  output [31:0] io_sample_out_bits_weights_2,
  output [31:0] io_sample_out_bits_weights_3,
  output [31:0] io_sample_out_bits_weights_4,
  output        io_sample_out_bits_dest,
  output        io_sample_out_bits_last
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
`endif // RANDOMIZE_REG_INIT
  wire  queue_clock; // @[Decoupled.scala 377:21]
  wire  queue_reset; // @[Decoupled.scala 377:21]
  wire  queue_io_enq_ready; // @[Decoupled.scala 377:21]
  wire  queue_io_enq_valid; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_features_0; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_features_1; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_features_2; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_features_3; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_features_4; // @[Decoupled.scala 377:21]
  wire [9:0] queue_io_enq_bits_offset; // @[Decoupled.scala 377:21]
  wire  queue_io_enq_bits_search_for_root; // @[Decoupled.scala 377:21]
  wire [7:0] queue_io_enq_bits_tree_to_exec; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_scores_0; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_scores_1; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_scores_2; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_scores_3; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_weights_0; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_weights_1; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_weights_2; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_weights_3; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_weights_4; // @[Decoupled.scala 377:21]
  wire  queue_io_enq_bits_last; // @[Decoupled.scala 377:21]
  wire  queue_io_deq_ready; // @[Decoupled.scala 377:21]
  wire  queue_io_deq_valid; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_features_0; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_features_1; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_features_2; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_features_3; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_features_4; // @[Decoupled.scala 377:21]
  wire [9:0] queue_io_deq_bits_offset; // @[Decoupled.scala 377:21]
  wire  queue_io_deq_bits_search_for_root; // @[Decoupled.scala 377:21]
  wire [7:0] queue_io_deq_bits_tree_to_exec; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_scores_0; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_scores_1; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_scores_2; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_scores_3; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_weights_0; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_weights_1; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_weights_2; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_weights_3; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_weights_4; // @[Decoupled.scala 377:21]
  wire  queue_io_deq_bits_last; // @[Decoupled.scala 377:21]
  reg  REG; // @[TreePE.scala 29:17]
  wire [2:0] attr_id = io_mem_dataOut_1[34:32]; // @[TreePE.scala 31:37]
  wire [9:0] leftChildInfo = io_mem_dataOut_1[44:35]; // @[TreePE.scala 34:43]
  wire [9:0] rightChildInfo = io_mem_dataOut_1[54:45]; // @[TreePE.scala 35:44]
  wire  leftChildType = io_mem_dataOut_1[55]; // @[TreePE.scala 36:43]
  wire  rightChildType = io_mem_dataOut_1[56]; // @[TreePE.scala 37:44]
  wire  is_valid = io_mem_dataOut_1[57]; // @[TreePE.scala 38:38]
  wire [2:0] depth_indicator = io_mem_dataOut_1[60:58]; // @[TreePE.scala 39:45]
  reg [31:0] REG_1_0; // @[TreePE.scala 41:45]
  reg [31:0] REG_1_1; // @[TreePE.scala 41:45]
  reg [31:0] REG_1_2; // @[TreePE.scala 41:45]
  reg [31:0] REG_1_3; // @[TreePE.scala 41:45]
  reg [31:0] REG_1_4; // @[TreePE.scala 41:45]
  reg [31:0] REG_2_0; // @[TreePE.scala 42:44]
  reg [31:0] REG_2_1; // @[TreePE.scala 42:44]
  reg [31:0] REG_2_2; // @[TreePE.scala 42:44]
  reg [31:0] REG_2_3; // @[TreePE.scala 42:44]
  reg [31:0] REG_2_4; // @[TreePE.scala 42:44]
  reg [7:0] io_sample_out_bits_tree_to_exec_REG; // @[TreePE.scala 43:49]
  reg [31:0] features_bits_0; // @[TreePE.scala 67:36]
  reg [31:0] features_bits_1; // @[TreePE.scala 67:36]
  reg [31:0] features_bits_2; // @[TreePE.scala 67:36]
  reg [31:0] features_bits_3; // @[TreePE.scala 67:36]
  reg [31:0] features_bits_4; // @[TreePE.scala 67:36]
  reg [31:0] scores_bits_0; // @[TreePE.scala 68:34]
  reg [31:0] scores_bits_1; // @[TreePE.scala 68:34]
  reg [31:0] scores_bits_2; // @[TreePE.scala 68:34]
  reg [31:0] scores_bits_3; // @[TreePE.scala 68:34]
  reg [31:0] weights_bits_0; // @[TreePE.scala 69:35]
  reg [31:0] weights_bits_1; // @[TreePE.scala 69:35]
  reg [31:0] weights_bits_2; // @[TreePE.scala 69:35]
  reg [31:0] weights_bits_3; // @[TreePE.scala 69:35]
  reg [31:0] weights_bits_4; // @[TreePE.scala 69:35]
  wire [15:0] _shift_T = io_mem_dataOut_1[15:0]; // @[TreePE.scala 70:69]
  wire [31:0] _GEN_1 = 3'h1 == attr_id ? $signed(features_bits_1) : $signed(features_bits_0); // @[TreePE.scala 70:{45,45}]
  wire [31:0] _GEN_2 = 3'h2 == attr_id ? $signed(features_bits_2) : $signed(_GEN_1); // @[TreePE.scala 70:{45,45}]
  wire [31:0] _GEN_3 = 3'h3 == attr_id ? $signed(features_bits_3) : $signed(_GEN_2); // @[TreePE.scala 70:{45,45}]
  wire [31:0] _GEN_4 = 3'h4 == attr_id ? $signed(features_bits_4) : $signed(_GEN_3); // @[TreePE.scala 70:{45,45}]
  wire [23:0] _GEN_26 = {$signed(_shift_T), 8'h0}; // @[TreePE.scala 70:45]
  wire [31:0] _GEN_32 = {{8{_GEN_26[23]}},_GEN_26}; // @[TreePE.scala 70:45]
  wire  _shift_T_1 = $signed(_GEN_4) < $signed(_GEN_32); // @[TreePE.scala 70:45]
  wire  shift = $signed(_GEN_4) < $signed(_GEN_32) ? leftChildType : rightChildType; // @[TreePE.scala 70:21]
  wire [9:0] offset = _shift_T_1 ? leftChildInfo : rightChildInfo; // @[TreePE.scala 71:22]
  wire  _io_sample_out_bits_offset_T = ~shift; // @[TreePE.scala 72:48]
  reg  io_sample_out_bits_offset_REG; // @[TreePE.scala 72:70]
  reg [7:0] io_sample_out_bits_offset_REG_1; // @[TreePE.scala 72:106]
  reg  io_sample_out_bits_search_for_root_REG; // @[TreePE.scala 74:64]
  wire [31:0] _GEN_6 = 3'h1 == depth_indicator ? $signed(weights_bits_1) : $signed(weights_bits_0); // @[TreePE.scala 76:{97,97}]
  wire [31:0] _GEN_7 = 3'h2 == depth_indicator ? $signed(weights_bits_2) : $signed(_GEN_6); // @[TreePE.scala 76:{97,97}]
  wire [31:0] _GEN_8 = 3'h3 == depth_indicator ? $signed(weights_bits_3) : $signed(_GEN_7); // @[TreePE.scala 76:{97,97}]
  wire [31:0] _io_sample_out_bits_scores_0_T = 3'h4 == depth_indicator ? $signed(weights_bits_4) : $signed(_GEN_8); // @[TreePE.scala 76:97]
  reg  io_sample_out_bits_scores_0_REG; // @[TreePE.scala 76:115]
  wire [15:0] _io_sample_out_bits_scores_0_T_7 = ~io_sample_out_bits_scores_0_REG & _io_sample_out_bits_offset_T &
    is_valid & 10'h0 == offset ? 16'hffff : 16'h0; // @[TreePE.scala 76:105]
  wire [31:0] _GEN_35 = {{16'd0}, _io_sample_out_bits_scores_0_T_7}; // @[TreePE.scala 76:100]
  wire [31:0] _io_sample_out_bits_scores_0_T_9 = _io_sample_out_bits_scores_0_T & _GEN_35; // @[TreePE.scala 76:234]
  wire [39:0] _GEN_36 = {{8{scores_bits_0[31]}},scores_bits_0}; // @[TreePE.scala 76:58]
  wire [39:0] _GEN_37 = {$signed(_io_sample_out_bits_scores_0_T_9), 8'h0}; // @[TreePE.scala 76:58]
  wire [39:0] _io_sample_out_bits_scores_0_T_12 = $signed(_GEN_36) + $signed(_GEN_37); // @[TreePE.scala 76:58]
  reg  io_sample_out_bits_scores_1_REG; // @[TreePE.scala 76:115]
  wire [15:0] _io_sample_out_bits_scores_1_T_7 = ~io_sample_out_bits_scores_1_REG & _io_sample_out_bits_offset_T &
    is_valid & 10'h1 == offset ? 16'hffff : 16'h0; // @[TreePE.scala 76:105]
  wire [31:0] _GEN_38 = {{16'd0}, _io_sample_out_bits_scores_1_T_7}; // @[TreePE.scala 76:100]
  wire [31:0] _io_sample_out_bits_scores_1_T_9 = _io_sample_out_bits_scores_0_T & _GEN_38; // @[TreePE.scala 76:234]
  wire [39:0] _GEN_39 = {{8{scores_bits_1[31]}},scores_bits_1}; // @[TreePE.scala 76:58]
  wire [39:0] _GEN_40 = {$signed(_io_sample_out_bits_scores_1_T_9), 8'h0}; // @[TreePE.scala 76:58]
  wire [39:0] _io_sample_out_bits_scores_1_T_12 = $signed(_GEN_39) + $signed(_GEN_40); // @[TreePE.scala 76:58]
  reg  io_sample_out_bits_scores_2_REG; // @[TreePE.scala 76:115]
  wire [15:0] _io_sample_out_bits_scores_2_T_7 = ~io_sample_out_bits_scores_2_REG & _io_sample_out_bits_offset_T &
    is_valid & 10'h2 == offset ? 16'hffff : 16'h0; // @[TreePE.scala 76:105]
  wire [31:0] _GEN_41 = {{16'd0}, _io_sample_out_bits_scores_2_T_7}; // @[TreePE.scala 76:100]
  wire [31:0] _io_sample_out_bits_scores_2_T_9 = _io_sample_out_bits_scores_0_T & _GEN_41; // @[TreePE.scala 76:234]
  wire [39:0] _GEN_42 = {{8{scores_bits_2[31]}},scores_bits_2}; // @[TreePE.scala 76:58]
  wire [39:0] _GEN_43 = {$signed(_io_sample_out_bits_scores_2_T_9), 8'h0}; // @[TreePE.scala 76:58]
  wire [39:0] _io_sample_out_bits_scores_2_T_12 = $signed(_GEN_42) + $signed(_GEN_43); // @[TreePE.scala 76:58]
  reg  io_sample_out_bits_scores_3_REG; // @[TreePE.scala 76:115]
  wire [15:0] _io_sample_out_bits_scores_3_T_7 = ~io_sample_out_bits_scores_3_REG & _io_sample_out_bits_offset_T &
    is_valid & 10'h3 == offset ? 16'hffff : 16'h0; // @[TreePE.scala 76:105]
  wire [31:0] _GEN_44 = {{16'd0}, _io_sample_out_bits_scores_3_T_7}; // @[TreePE.scala 76:100]
  wire [31:0] _io_sample_out_bits_scores_3_T_9 = _io_sample_out_bits_scores_0_T & _GEN_44; // @[TreePE.scala 76:234]
  wire [39:0] _GEN_45 = {{8{scores_bits_3[31]}},scores_bits_3}; // @[TreePE.scala 76:58]
  wire [39:0] _GEN_46 = {$signed(_io_sample_out_bits_scores_3_T_9), 8'h0}; // @[TreePE.scala 76:58]
  wire [39:0] _io_sample_out_bits_scores_3_T_12 = $signed(_GEN_45) + $signed(_GEN_46); // @[TreePE.scala 76:58]
  reg [7:0] io_sample_out_bits_dest_REG; // @[TreePE.scala 78:43]
  reg  io_sample_out_bits_last_REG; // @[TreePE.scala 79:43]
  Queue_1 queue ( // @[Decoupled.scala 377:21]
    .clock(queue_clock),
    .reset(queue_reset),
    .io_enq_ready(queue_io_enq_ready),
    .io_enq_valid(queue_io_enq_valid),
    .io_enq_bits_features_0(queue_io_enq_bits_features_0),
    .io_enq_bits_features_1(queue_io_enq_bits_features_1),
    .io_enq_bits_features_2(queue_io_enq_bits_features_2),
    .io_enq_bits_features_3(queue_io_enq_bits_features_3),
    .io_enq_bits_features_4(queue_io_enq_bits_features_4),
    .io_enq_bits_offset(queue_io_enq_bits_offset),
    .io_enq_bits_search_for_root(queue_io_enq_bits_search_for_root),
    .io_enq_bits_tree_to_exec(queue_io_enq_bits_tree_to_exec),
    .io_enq_bits_scores_0(queue_io_enq_bits_scores_0),
    .io_enq_bits_scores_1(queue_io_enq_bits_scores_1),
    .io_enq_bits_scores_2(queue_io_enq_bits_scores_2),
    .io_enq_bits_scores_3(queue_io_enq_bits_scores_3),
    .io_enq_bits_weights_0(queue_io_enq_bits_weights_0),
    .io_enq_bits_weights_1(queue_io_enq_bits_weights_1),
    .io_enq_bits_weights_2(queue_io_enq_bits_weights_2),
    .io_enq_bits_weights_3(queue_io_enq_bits_weights_3),
    .io_enq_bits_weights_4(queue_io_enq_bits_weights_4),
    .io_enq_bits_last(queue_io_enq_bits_last),
    .io_deq_ready(queue_io_deq_ready),
    .io_deq_valid(queue_io_deq_valid),
    .io_deq_bits_features_0(queue_io_deq_bits_features_0),
    .io_deq_bits_features_1(queue_io_deq_bits_features_1),
    .io_deq_bits_features_2(queue_io_deq_bits_features_2),
    .io_deq_bits_features_3(queue_io_deq_bits_features_3),
    .io_deq_bits_features_4(queue_io_deq_bits_features_4),
    .io_deq_bits_offset(queue_io_deq_bits_offset),
    .io_deq_bits_search_for_root(queue_io_deq_bits_search_for_root),
    .io_deq_bits_tree_to_exec(queue_io_deq_bits_tree_to_exec),
    .io_deq_bits_scores_0(queue_io_deq_bits_scores_0),
    .io_deq_bits_scores_1(queue_io_deq_bits_scores_1),
    .io_deq_bits_scores_2(queue_io_deq_bits_scores_2),
    .io_deq_bits_scores_3(queue_io_deq_bits_scores_3),
    .io_deq_bits_weights_0(queue_io_deq_bits_weights_0),
    .io_deq_bits_weights_1(queue_io_deq_bits_weights_1),
    .io_deq_bits_weights_2(queue_io_deq_bits_weights_2),
    .io_deq_bits_weights_3(queue_io_deq_bits_weights_3),
    .io_deq_bits_weights_4(queue_io_deq_bits_weights_4),
    .io_deq_bits_last(queue_io_deq_bits_last)
  );
  assign io_sample_in_ready = queue_io_enq_ready; // @[Decoupled.scala 381:17]
  assign io_mem_addr_1 = {{3'd0}, queue_io_deq_bits_offset}; // @[TreePE.scala 18:19]
  assign io_sample_out_valid = REG; // @[TreePE.scala 29:31 45:27 83:27]
  assign io_sample_out_bits_features_0 = REG_1_0; // @[TreePE.scala 29:31 41:35]
  assign io_sample_out_bits_features_1 = REG_1_1; // @[TreePE.scala 29:31 41:35]
  assign io_sample_out_bits_features_2 = REG_1_2; // @[TreePE.scala 29:31 41:35]
  assign io_sample_out_bits_features_3 = REG_1_3; // @[TreePE.scala 29:31 41:35]
  assign io_sample_out_bits_features_4 = REG_1_4; // @[TreePE.scala 29:31 41:35]
  assign io_sample_out_bits_offset = ~shift | io_sample_out_bits_offset_REG ? {{2'd0}, io_sample_out_bits_offset_REG_1}
     : offset; // @[TreePE.scala 72:41]
  assign io_sample_out_bits_search_for_root = _io_sample_out_bits_offset_T | io_sample_out_bits_search_for_root_REG; // @[TreePE.scala 74:54]
  assign io_sample_out_bits_tree_to_exec = io_sample_out_bits_tree_to_exec_REG; // @[TreePE.scala 29:31 43:39]
  assign io_sample_out_bits_scores_0 = _io_sample_out_bits_scores_0_T_12[31:0];
  assign io_sample_out_bits_scores_1 = _io_sample_out_bits_scores_1_T_12[31:0];
  assign io_sample_out_bits_scores_2 = _io_sample_out_bits_scores_2_T_12[31:0];
  assign io_sample_out_bits_scores_3 = _io_sample_out_bits_scores_3_T_12[31:0];
  assign io_sample_out_bits_weights_0 = REG_2_0; // @[TreePE.scala 29:31 42:34]
  assign io_sample_out_bits_weights_1 = REG_2_1; // @[TreePE.scala 29:31 42:34]
  assign io_sample_out_bits_weights_2 = REG_2_2; // @[TreePE.scala 29:31 42:34]
  assign io_sample_out_bits_weights_3 = REG_2_3; // @[TreePE.scala 29:31 42:34]
  assign io_sample_out_bits_weights_4 = REG_2_4; // @[TreePE.scala 29:31 42:34]
  assign io_sample_out_bits_dest = io_sample_out_bits_dest_REG == 8'hb3; // @[TreePE.scala 78:69]
  assign io_sample_out_bits_last = io_sample_out_bits_last_REG; // @[TreePE.scala 29:31 79:33]
  assign queue_clock = clock;
  assign queue_reset = reset;
  assign queue_io_enq_valid = io_sample_in_valid; // @[Decoupled.scala 379:22]
  assign queue_io_enq_bits_features_0 = io_sample_in_bits_features_0; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_features_1 = io_sample_in_bits_features_1; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_features_2 = io_sample_in_bits_features_2; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_features_3 = io_sample_in_bits_features_3; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_features_4 = io_sample_in_bits_features_4; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_offset = io_sample_in_bits_offset; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_search_for_root = io_sample_in_bits_search_for_root; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_tree_to_exec = io_sample_in_bits_tree_to_exec; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_scores_0 = io_sample_in_bits_scores_0; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_scores_1 = io_sample_in_bits_scores_1; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_scores_2 = io_sample_in_bits_scores_2; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_scores_3 = io_sample_in_bits_scores_3; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_weights_0 = io_sample_in_bits_weights_0; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_weights_1 = io_sample_in_bits_weights_1; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_weights_2 = io_sample_in_bits_weights_2; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_weights_3 = io_sample_in_bits_weights_3; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_weights_4 = io_sample_in_bits_weights_4; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_last = io_sample_in_bits_last; // @[Decoupled.scala 380:21]
  assign queue_io_deq_ready = io_sample_out_ready; // @[TreePE.scala 86:17]
  always @(posedge clock) begin
    REG <= queue_io_deq_valid; // @[TreePE.scala 29:17]
    REG_1_0 <= queue_io_deq_bits_features_0; // @[TreePE.scala 41:45]
    REG_1_1 <= queue_io_deq_bits_features_1; // @[TreePE.scala 41:45]
    REG_1_2 <= queue_io_deq_bits_features_2; // @[TreePE.scala 41:45]
    REG_1_3 <= queue_io_deq_bits_features_3; // @[TreePE.scala 41:45]
    REG_1_4 <= queue_io_deq_bits_features_4; // @[TreePE.scala 41:45]
    REG_2_0 <= queue_io_deq_bits_weights_0; // @[TreePE.scala 42:44]
    REG_2_1 <= queue_io_deq_bits_weights_1; // @[TreePE.scala 42:44]
    REG_2_2 <= queue_io_deq_bits_weights_2; // @[TreePE.scala 42:44]
    REG_2_3 <= queue_io_deq_bits_weights_3; // @[TreePE.scala 42:44]
    REG_2_4 <= queue_io_deq_bits_weights_4; // @[TreePE.scala 42:44]
    io_sample_out_bits_tree_to_exec_REG <= queue_io_deq_bits_tree_to_exec; // @[TreePE.scala 43:49]
    features_bits_0 <= queue_io_deq_bits_features_0; // @[TreePE.scala 67:36]
    features_bits_1 <= queue_io_deq_bits_features_1; // @[TreePE.scala 67:36]
    features_bits_2 <= queue_io_deq_bits_features_2; // @[TreePE.scala 67:36]
    features_bits_3 <= queue_io_deq_bits_features_3; // @[TreePE.scala 67:36]
    features_bits_4 <= queue_io_deq_bits_features_4; // @[TreePE.scala 67:36]
    scores_bits_0 <= queue_io_deq_bits_scores_0; // @[TreePE.scala 68:34]
    scores_bits_1 <= queue_io_deq_bits_scores_1; // @[TreePE.scala 68:34]
    scores_bits_2 <= queue_io_deq_bits_scores_2; // @[TreePE.scala 68:34]
    scores_bits_3 <= queue_io_deq_bits_scores_3; // @[TreePE.scala 68:34]
    weights_bits_0 <= queue_io_deq_bits_weights_0; // @[TreePE.scala 69:35]
    weights_bits_1 <= queue_io_deq_bits_weights_1; // @[TreePE.scala 69:35]
    weights_bits_2 <= queue_io_deq_bits_weights_2; // @[TreePE.scala 69:35]
    weights_bits_3 <= queue_io_deq_bits_weights_3; // @[TreePE.scala 69:35]
    weights_bits_4 <= queue_io_deq_bits_weights_4; // @[TreePE.scala 69:35]
    io_sample_out_bits_offset_REG <= queue_io_deq_bits_search_for_root; // @[TreePE.scala 72:70]
    io_sample_out_bits_offset_REG_1 <= queue_io_deq_bits_tree_to_exec; // @[TreePE.scala 72:106]
    io_sample_out_bits_search_for_root_REG <= queue_io_deq_bits_search_for_root; // @[TreePE.scala 74:64]
    io_sample_out_bits_scores_0_REG <= queue_io_deq_bits_search_for_root; // @[TreePE.scala 76:115]
    io_sample_out_bits_scores_1_REG <= queue_io_deq_bits_search_for_root; // @[TreePE.scala 76:115]
    io_sample_out_bits_scores_2_REG <= queue_io_deq_bits_search_for_root; // @[TreePE.scala 76:115]
    io_sample_out_bits_scores_3_REG <= queue_io_deq_bits_search_for_root; // @[TreePE.scala 76:115]
    io_sample_out_bits_dest_REG <= queue_io_deq_bits_tree_to_exec; // @[TreePE.scala 78:43]
    io_sample_out_bits_last_REG <= queue_io_deq_bits_last; // @[TreePE.scala 79:43]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  REG = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  REG_1_0 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  REG_1_1 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  REG_1_2 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  REG_1_3 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  REG_1_4 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  REG_2_0 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  REG_2_1 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  REG_2_2 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  REG_2_3 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  REG_2_4 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  io_sample_out_bits_tree_to_exec_REG = _RAND_11[7:0];
  _RAND_12 = {1{`RANDOM}};
  features_bits_0 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  features_bits_1 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  features_bits_2 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  features_bits_3 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  features_bits_4 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  scores_bits_0 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  scores_bits_1 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  scores_bits_2 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  scores_bits_3 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  weights_bits_0 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  weights_bits_1 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  weights_bits_2 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  weights_bits_3 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  weights_bits_4 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  io_sample_out_bits_offset_REG = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  io_sample_out_bits_offset_REG_1 = _RAND_27[7:0];
  _RAND_28 = {1{`RANDOM}};
  io_sample_out_bits_search_for_root_REG = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  io_sample_out_bits_scores_0_REG = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  io_sample_out_bits_scores_1_REG = _RAND_30[0:0];
  _RAND_31 = {1{`RANDOM}};
  io_sample_out_bits_scores_2_REG = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  io_sample_out_bits_scores_3_REG = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  io_sample_out_bits_dest_REG = _RAND_33[7:0];
  _RAND_34 = {1{`RANDOM}};
  io_sample_out_bits_last_REG = _RAND_34[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module TreePEwithBRAM_1(
  input         clock,
  input         reset,
  output        pe_io_sample_in_ready,
  input         pe_io_sample_in_valid,
  input  [31:0] pe_io_sample_in_bits_features_0,
  input  [31:0] pe_io_sample_in_bits_features_1,
  input  [31:0] pe_io_sample_in_bits_features_2,
  input  [31:0] pe_io_sample_in_bits_features_3,
  input  [31:0] pe_io_sample_in_bits_features_4,
  input  [9:0]  pe_io_sample_in_bits_offset,
  input         pe_io_sample_in_bits_search_for_root,
  input  [7:0]  pe_io_sample_in_bits_tree_to_exec,
  input  [31:0] pe_io_sample_in_bits_scores_0,
  input  [31:0] pe_io_sample_in_bits_scores_1,
  input  [31:0] pe_io_sample_in_bits_scores_2,
  input  [31:0] pe_io_sample_in_bits_scores_3,
  input  [31:0] pe_io_sample_in_bits_weights_0,
  input  [31:0] pe_io_sample_in_bits_weights_1,
  input  [31:0] pe_io_sample_in_bits_weights_2,
  input  [31:0] pe_io_sample_in_bits_weights_3,
  input  [31:0] pe_io_sample_in_bits_weights_4,
  input         pe_io_sample_in_bits_last,
  output [12:0] pe_io_mem_addr_1,
  input  [63:0] pe_io_mem_dataOut_1,
  input         pe_io_sample_out_ready,
  output        pe_io_sample_out_valid,
  output [31:0] pe_io_sample_out_bits_features_0,
  output [31:0] pe_io_sample_out_bits_features_1,
  output [31:0] pe_io_sample_out_bits_features_2,
  output [31:0] pe_io_sample_out_bits_features_3,
  output [31:0] pe_io_sample_out_bits_features_4,
  output [9:0]  pe_io_sample_out_bits_offset,
  output        pe_io_sample_out_bits_search_for_root,
  output [7:0]  pe_io_sample_out_bits_tree_to_exec,
  output [31:0] pe_io_sample_out_bits_scores_0,
  output [31:0] pe_io_sample_out_bits_scores_1,
  output [31:0] pe_io_sample_out_bits_scores_2,
  output [31:0] pe_io_sample_out_bits_scores_3,
  output [31:0] pe_io_sample_out_bits_weights_0,
  output [31:0] pe_io_sample_out_bits_weights_1,
  output [31:0] pe_io_sample_out_bits_weights_2,
  output [31:0] pe_io_sample_out_bits_weights_3,
  output [31:0] pe_io_sample_out_bits_weights_4,
  output        pe_io_sample_out_bits_dest,
  output        pe_io_sample_out_bits_last
);
  wire  pe__clock; // @[TreePE.scala 117:18]
  wire  pe__reset; // @[TreePE.scala 117:18]
  wire  pe__io_sample_in_ready; // @[TreePE.scala 117:18]
  wire  pe__io_sample_in_valid; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_in_bits_features_0; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_in_bits_features_1; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_in_bits_features_2; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_in_bits_features_3; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_in_bits_features_4; // @[TreePE.scala 117:18]
  wire [9:0] pe__io_sample_in_bits_offset; // @[TreePE.scala 117:18]
  wire  pe__io_sample_in_bits_search_for_root; // @[TreePE.scala 117:18]
  wire [7:0] pe__io_sample_in_bits_tree_to_exec; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_in_bits_scores_0; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_in_bits_scores_1; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_in_bits_scores_2; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_in_bits_scores_3; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_in_bits_weights_0; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_in_bits_weights_1; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_in_bits_weights_2; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_in_bits_weights_3; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_in_bits_weights_4; // @[TreePE.scala 117:18]
  wire  pe__io_sample_in_bits_last; // @[TreePE.scala 117:18]
  wire [12:0] pe__io_mem_addr_1; // @[TreePE.scala 117:18]
  wire [63:0] pe__io_mem_dataOut_1; // @[TreePE.scala 117:18]
  wire  pe__io_sample_out_ready; // @[TreePE.scala 117:18]
  wire  pe__io_sample_out_valid; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_out_bits_features_0; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_out_bits_features_1; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_out_bits_features_2; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_out_bits_features_3; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_out_bits_features_4; // @[TreePE.scala 117:18]
  wire [9:0] pe__io_sample_out_bits_offset; // @[TreePE.scala 117:18]
  wire  pe__io_sample_out_bits_search_for_root; // @[TreePE.scala 117:18]
  wire [7:0] pe__io_sample_out_bits_tree_to_exec; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_out_bits_scores_0; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_out_bits_scores_1; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_out_bits_scores_2; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_out_bits_scores_3; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_out_bits_weights_0; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_out_bits_weights_1; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_out_bits_weights_2; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_out_bits_weights_3; // @[TreePE.scala 117:18]
  wire [31:0] pe__io_sample_out_bits_weights_4; // @[TreePE.scala 117:18]
  wire  pe__io_sample_out_bits_dest; // @[TreePE.scala 117:18]
  wire  pe__io_sample_out_bits_last; // @[TreePE.scala 117:18]
  TreePE_1 pe_ ( // @[TreePE.scala 117:18]
    .clock(pe__clock),
    .reset(pe__reset),
    .io_sample_in_ready(pe__io_sample_in_ready),
    .io_sample_in_valid(pe__io_sample_in_valid),
    .io_sample_in_bits_features_0(pe__io_sample_in_bits_features_0),
    .io_sample_in_bits_features_1(pe__io_sample_in_bits_features_1),
    .io_sample_in_bits_features_2(pe__io_sample_in_bits_features_2),
    .io_sample_in_bits_features_3(pe__io_sample_in_bits_features_3),
    .io_sample_in_bits_features_4(pe__io_sample_in_bits_features_4),
    .io_sample_in_bits_offset(pe__io_sample_in_bits_offset),
    .io_sample_in_bits_search_for_root(pe__io_sample_in_bits_search_for_root),
    .io_sample_in_bits_tree_to_exec(pe__io_sample_in_bits_tree_to_exec),
    .io_sample_in_bits_scores_0(pe__io_sample_in_bits_scores_0),
    .io_sample_in_bits_scores_1(pe__io_sample_in_bits_scores_1),
    .io_sample_in_bits_scores_2(pe__io_sample_in_bits_scores_2),
    .io_sample_in_bits_scores_3(pe__io_sample_in_bits_scores_3),
    .io_sample_in_bits_weights_0(pe__io_sample_in_bits_weights_0),
    .io_sample_in_bits_weights_1(pe__io_sample_in_bits_weights_1),
    .io_sample_in_bits_weights_2(pe__io_sample_in_bits_weights_2),
    .io_sample_in_bits_weights_3(pe__io_sample_in_bits_weights_3),
    .io_sample_in_bits_weights_4(pe__io_sample_in_bits_weights_4),
    .io_sample_in_bits_last(pe__io_sample_in_bits_last),
    .io_mem_addr_1(pe__io_mem_addr_1),
    .io_mem_dataOut_1(pe__io_mem_dataOut_1),
    .io_sample_out_ready(pe__io_sample_out_ready),
    .io_sample_out_valid(pe__io_sample_out_valid),
    .io_sample_out_bits_features_0(pe__io_sample_out_bits_features_0),
    .io_sample_out_bits_features_1(pe__io_sample_out_bits_features_1),
    .io_sample_out_bits_features_2(pe__io_sample_out_bits_features_2),
    .io_sample_out_bits_features_3(pe__io_sample_out_bits_features_3),
    .io_sample_out_bits_features_4(pe__io_sample_out_bits_features_4),
    .io_sample_out_bits_offset(pe__io_sample_out_bits_offset),
    .io_sample_out_bits_search_for_root(pe__io_sample_out_bits_search_for_root),
    .io_sample_out_bits_tree_to_exec(pe__io_sample_out_bits_tree_to_exec),
    .io_sample_out_bits_scores_0(pe__io_sample_out_bits_scores_0),
    .io_sample_out_bits_scores_1(pe__io_sample_out_bits_scores_1),
    .io_sample_out_bits_scores_2(pe__io_sample_out_bits_scores_2),
    .io_sample_out_bits_scores_3(pe__io_sample_out_bits_scores_3),
    .io_sample_out_bits_weights_0(pe__io_sample_out_bits_weights_0),
    .io_sample_out_bits_weights_1(pe__io_sample_out_bits_weights_1),
    .io_sample_out_bits_weights_2(pe__io_sample_out_bits_weights_2),
    .io_sample_out_bits_weights_3(pe__io_sample_out_bits_weights_3),
    .io_sample_out_bits_weights_4(pe__io_sample_out_bits_weights_4),
    .io_sample_out_bits_dest(pe__io_sample_out_bits_dest),
    .io_sample_out_bits_last(pe__io_sample_out_bits_last)
  );
  assign pe_io_sample_in_ready = pe__io_sample_in_ready; // @[TreePE.scala 119:9]
  assign pe_io_mem_addr_1 = pe__io_mem_addr_1; // @[TreePE.scala 119:9]
  assign pe_io_sample_out_valid = pe__io_sample_out_valid; // @[TreePE.scala 119:9]
  assign pe_io_sample_out_bits_features_0 = pe__io_sample_out_bits_features_0; // @[TreePE.scala 119:9]
  assign pe_io_sample_out_bits_features_1 = pe__io_sample_out_bits_features_1; // @[TreePE.scala 119:9]
  assign pe_io_sample_out_bits_features_2 = pe__io_sample_out_bits_features_2; // @[TreePE.scala 119:9]
  assign pe_io_sample_out_bits_features_3 = pe__io_sample_out_bits_features_3; // @[TreePE.scala 119:9]
  assign pe_io_sample_out_bits_features_4 = pe__io_sample_out_bits_features_4; // @[TreePE.scala 119:9]
  assign pe_io_sample_out_bits_offset = pe__io_sample_out_bits_offset; // @[TreePE.scala 119:9]
  assign pe_io_sample_out_bits_search_for_root = pe__io_sample_out_bits_search_for_root; // @[TreePE.scala 119:9]
  assign pe_io_sample_out_bits_tree_to_exec = pe__io_sample_out_bits_tree_to_exec; // @[TreePE.scala 119:9]
  assign pe_io_sample_out_bits_scores_0 = pe__io_sample_out_bits_scores_0; // @[TreePE.scala 119:9]
  assign pe_io_sample_out_bits_scores_1 = pe__io_sample_out_bits_scores_1; // @[TreePE.scala 119:9]
  assign pe_io_sample_out_bits_scores_2 = pe__io_sample_out_bits_scores_2; // @[TreePE.scala 119:9]
  assign pe_io_sample_out_bits_scores_3 = pe__io_sample_out_bits_scores_3; // @[TreePE.scala 119:9]
  assign pe_io_sample_out_bits_weights_0 = pe__io_sample_out_bits_weights_0; // @[TreePE.scala 119:9]
  assign pe_io_sample_out_bits_weights_1 = pe__io_sample_out_bits_weights_1; // @[TreePE.scala 119:9]
  assign pe_io_sample_out_bits_weights_2 = pe__io_sample_out_bits_weights_2; // @[TreePE.scala 119:9]
  assign pe_io_sample_out_bits_weights_3 = pe__io_sample_out_bits_weights_3; // @[TreePE.scala 119:9]
  assign pe_io_sample_out_bits_weights_4 = pe__io_sample_out_bits_weights_4; // @[TreePE.scala 119:9]
  assign pe_io_sample_out_bits_dest = pe__io_sample_out_bits_dest; // @[TreePE.scala 119:9]
  assign pe_io_sample_out_bits_last = pe__io_sample_out_bits_last; // @[TreePE.scala 119:9]
  assign pe__clock = clock;
  assign pe__reset = reset;
  assign pe__io_sample_in_valid = pe_io_sample_in_valid; // @[TreePE.scala 119:9]
  assign pe__io_sample_in_bits_features_0 = pe_io_sample_in_bits_features_0; // @[TreePE.scala 119:9]
  assign pe__io_sample_in_bits_features_1 = pe_io_sample_in_bits_features_1; // @[TreePE.scala 119:9]
  assign pe__io_sample_in_bits_features_2 = pe_io_sample_in_bits_features_2; // @[TreePE.scala 119:9]
  assign pe__io_sample_in_bits_features_3 = pe_io_sample_in_bits_features_3; // @[TreePE.scala 119:9]
  assign pe__io_sample_in_bits_features_4 = pe_io_sample_in_bits_features_4; // @[TreePE.scala 119:9]
  assign pe__io_sample_in_bits_offset = pe_io_sample_in_bits_offset; // @[TreePE.scala 119:9]
  assign pe__io_sample_in_bits_search_for_root = pe_io_sample_in_bits_search_for_root; // @[TreePE.scala 119:9]
  assign pe__io_sample_in_bits_tree_to_exec = pe_io_sample_in_bits_tree_to_exec; // @[TreePE.scala 119:9]
  assign pe__io_sample_in_bits_scores_0 = pe_io_sample_in_bits_scores_0; // @[TreePE.scala 119:9]
  assign pe__io_sample_in_bits_scores_1 = pe_io_sample_in_bits_scores_1; // @[TreePE.scala 119:9]
  assign pe__io_sample_in_bits_scores_2 = pe_io_sample_in_bits_scores_2; // @[TreePE.scala 119:9]
  assign pe__io_sample_in_bits_scores_3 = pe_io_sample_in_bits_scores_3; // @[TreePE.scala 119:9]
  assign pe__io_sample_in_bits_weights_0 = pe_io_sample_in_bits_weights_0; // @[TreePE.scala 119:9]
  assign pe__io_sample_in_bits_weights_1 = pe_io_sample_in_bits_weights_1; // @[TreePE.scala 119:9]
  assign pe__io_sample_in_bits_weights_2 = pe_io_sample_in_bits_weights_2; // @[TreePE.scala 119:9]
  assign pe__io_sample_in_bits_weights_3 = pe_io_sample_in_bits_weights_3; // @[TreePE.scala 119:9]
  assign pe__io_sample_in_bits_weights_4 = pe_io_sample_in_bits_weights_4; // @[TreePE.scala 119:9]
  assign pe__io_sample_in_bits_last = pe_io_sample_in_bits_last; // @[TreePE.scala 119:9]
  assign pe__io_mem_dataOut_1 = pe_io_mem_dataOut_1; // @[TreePE.scala 119:9]
  assign pe__io_sample_out_ready = pe_io_sample_out_ready; // @[TreePE.scala 119:9]
endmodule
module BRAMBlackBox(
  input         io_clk,
  input         io_a_en,
  input         io_a_wr,
  input  [12:0] io_a_addr,
  input  [31:0] io_a_din,
  output [31:0] io_a_dout,
  input  [10:0] io_b_addr,
  output [63:0] io_b_dout
);
  wire  bram_1_clk; // @[ME.scala 87:24]
  wire  bram_1_a_wr; // @[ME.scala 87:24]
  wire [10:0] bram_1_a_addr; // @[ME.scala 87:24]
  wire [31:0] bram_1_a_din; // @[ME.scala 87:24]
  wire [31:0] bram_1_a_dout; // @[ME.scala 87:24]
  wire  bram_1_b_wr; // @[ME.scala 87:24]
  wire [10:0] bram_1_b_addr; // @[ME.scala 87:24]
  wire [31:0] bram_1_b_din; // @[ME.scala 87:24]
  wire [31:0] bram_1_b_dout; // @[ME.scala 87:24]
  wire [11:0] _bram_1_io_a_addr_T_1 = {io_b_addr, 1'h0}; // @[ME.scala 90:67]
  wire [11:0] _bram_1_io_a_addr_T_2 = io_a_en ? {{1'd0}, io_a_addr[12:2]} : _bram_1_io_a_addr_T_1; // @[ME.scala 90:28]
  wire [11:0] _bram_1_io_b_addr_T_2 = _bram_1_io_a_addr_T_1 + 12'h1; // @[ME.scala 94:42]
  BRAMBlackBoxSingle #(.DATA(32), .ADDR(11)) bram_1 ( // @[ME.scala 87:24]
    .clk(bram_1_clk),
    .a_wr(bram_1_a_wr),
    .a_addr(bram_1_a_addr),
    .a_din(bram_1_a_din),
    .a_dout(bram_1_a_dout),
    .b_wr(bram_1_b_wr),
    .b_addr(bram_1_b_addr),
    .b_din(bram_1_b_din),
    .b_dout(bram_1_b_dout)
  );
  assign io_a_dout = bram_1_a_dout; // @[ME.scala 96:15]
  assign io_b_dout = {bram_1_b_dout,bram_1_a_dout}; // @[Cat.scala 33:92]
  assign bram_1_clk = io_clk; // @[ME.scala 97:19]
  assign bram_1_a_wr = io_a_en & io_a_wr; // @[ME.scala 89:26]
  assign bram_1_a_addr = _bram_1_io_a_addr_T_2[10:0]; // @[ME.scala 90:22]
  assign bram_1_a_din = io_a_en ? io_a_din : 32'h0; // @[ME.scala 91:27]
  assign bram_1_b_wr = 1'h0; // @[ME.scala 93:26]
  assign bram_1_b_addr = _bram_1_io_b_addr_T_2[10:0]; // @[ME.scala 94:22]
  assign bram_1_b_din = 32'h0; // @[ME.scala 95:32]
endmodule
module Queue_31(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [31:0] io_enq_bits_features_0,
  input  [31:0] io_enq_bits_features_1,
  input  [31:0] io_enq_bits_features_2,
  input  [31:0] io_enq_bits_features_3,
  input  [31:0] io_enq_bits_features_4,
  input  [9:0]  io_enq_bits_offset,
  input         io_enq_bits_search_for_root,
  input  [7:0]  io_enq_bits_tree_to_exec,
  input  [31:0] io_enq_bits_scores_0,
  input  [31:0] io_enq_bits_scores_1,
  input  [31:0] io_enq_bits_scores_2,
  input  [31:0] io_enq_bits_scores_3,
  input  [31:0] io_enq_bits_weights_0,
  input  [31:0] io_enq_bits_weights_1,
  input  [31:0] io_enq_bits_weights_2,
  input  [31:0] io_enq_bits_weights_3,
  input  [31:0] io_enq_bits_weights_4,
  input         io_enq_bits_last,
  input         io_deq_ready,
  output        io_deq_valid,
  output [31:0] io_deq_bits_features_0,
  output [31:0] io_deq_bits_features_1,
  output [31:0] io_deq_bits_features_2,
  output [31:0] io_deq_bits_features_3,
  output [31:0] io_deq_bits_features_4,
  output [9:0]  io_deq_bits_offset,
  output        io_deq_bits_search_for_root,
  output [7:0]  io_deq_bits_tree_to_exec,
  output [31:0] io_deq_bits_scores_0,
  output [31:0] io_deq_bits_scores_1,
  output [31:0] io_deq_bits_scores_2,
  output [31:0] io_deq_bits_scores_3,
  output [31:0] io_deq_bits_weights_0,
  output [31:0] io_deq_bits_weights_1,
  output [31:0] io_deq_bits_weights_2,
  output [31:0] io_deq_bits_weights_3,
  output [31:0] io_deq_bits_weights_4,
  output        io_deq_bits_last
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] ram_features_0 [0:127]; // @[Decoupled.scala 275:95]
  wire  ram_features_0_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [6:0] ram_features_0_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_features_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_features_0_MPORT_data; // @[Decoupled.scala 275:95]
  wire [6:0] ram_features_0_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_features_0_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_features_0_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_features_1 [0:127]; // @[Decoupled.scala 275:95]
  wire  ram_features_1_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [6:0] ram_features_1_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_features_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_features_1_MPORT_data; // @[Decoupled.scala 275:95]
  wire [6:0] ram_features_1_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_features_1_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_features_1_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_features_2 [0:127]; // @[Decoupled.scala 275:95]
  wire  ram_features_2_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [6:0] ram_features_2_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_features_2_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_features_2_MPORT_data; // @[Decoupled.scala 275:95]
  wire [6:0] ram_features_2_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_features_2_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_features_2_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_features_3 [0:127]; // @[Decoupled.scala 275:95]
  wire  ram_features_3_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [6:0] ram_features_3_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_features_3_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_features_3_MPORT_data; // @[Decoupled.scala 275:95]
  wire [6:0] ram_features_3_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_features_3_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_features_3_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_features_4 [0:127]; // @[Decoupled.scala 275:95]
  wire  ram_features_4_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [6:0] ram_features_4_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_features_4_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_features_4_MPORT_data; // @[Decoupled.scala 275:95]
  wire [6:0] ram_features_4_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_features_4_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_features_4_MPORT_en; // @[Decoupled.scala 275:95]
  reg [9:0] ram_offset [0:127]; // @[Decoupled.scala 275:95]
  wire  ram_offset_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [6:0] ram_offset_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [9:0] ram_offset_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [9:0] ram_offset_MPORT_data; // @[Decoupled.scala 275:95]
  wire [6:0] ram_offset_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_offset_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_offset_MPORT_en; // @[Decoupled.scala 275:95]
  reg  ram_search_for_root [0:127]; // @[Decoupled.scala 275:95]
  wire  ram_search_for_root_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [6:0] ram_search_for_root_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_search_for_root_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire  ram_search_for_root_MPORT_data; // @[Decoupled.scala 275:95]
  wire [6:0] ram_search_for_root_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_search_for_root_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_search_for_root_MPORT_en; // @[Decoupled.scala 275:95]
  reg [7:0] ram_tree_to_exec [0:127]; // @[Decoupled.scala 275:95]
  wire  ram_tree_to_exec_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [6:0] ram_tree_to_exec_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [7:0] ram_tree_to_exec_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [7:0] ram_tree_to_exec_MPORT_data; // @[Decoupled.scala 275:95]
  wire [6:0] ram_tree_to_exec_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_tree_to_exec_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_tree_to_exec_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_scores_0 [0:127]; // @[Decoupled.scala 275:95]
  wire  ram_scores_0_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [6:0] ram_scores_0_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_scores_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_scores_0_MPORT_data; // @[Decoupled.scala 275:95]
  wire [6:0] ram_scores_0_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_scores_0_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_scores_0_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_scores_1 [0:127]; // @[Decoupled.scala 275:95]
  wire  ram_scores_1_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [6:0] ram_scores_1_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_scores_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_scores_1_MPORT_data; // @[Decoupled.scala 275:95]
  wire [6:0] ram_scores_1_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_scores_1_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_scores_1_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_scores_2 [0:127]; // @[Decoupled.scala 275:95]
  wire  ram_scores_2_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [6:0] ram_scores_2_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_scores_2_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_scores_2_MPORT_data; // @[Decoupled.scala 275:95]
  wire [6:0] ram_scores_2_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_scores_2_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_scores_2_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_scores_3 [0:127]; // @[Decoupled.scala 275:95]
  wire  ram_scores_3_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [6:0] ram_scores_3_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_scores_3_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_scores_3_MPORT_data; // @[Decoupled.scala 275:95]
  wire [6:0] ram_scores_3_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_scores_3_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_scores_3_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_weights_0 [0:127]; // @[Decoupled.scala 275:95]
  wire  ram_weights_0_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [6:0] ram_weights_0_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_weights_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_weights_0_MPORT_data; // @[Decoupled.scala 275:95]
  wire [6:0] ram_weights_0_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_weights_0_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_weights_0_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_weights_1 [0:127]; // @[Decoupled.scala 275:95]
  wire  ram_weights_1_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [6:0] ram_weights_1_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_weights_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_weights_1_MPORT_data; // @[Decoupled.scala 275:95]
  wire [6:0] ram_weights_1_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_weights_1_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_weights_1_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_weights_2 [0:127]; // @[Decoupled.scala 275:95]
  wire  ram_weights_2_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [6:0] ram_weights_2_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_weights_2_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_weights_2_MPORT_data; // @[Decoupled.scala 275:95]
  wire [6:0] ram_weights_2_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_weights_2_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_weights_2_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_weights_3 [0:127]; // @[Decoupled.scala 275:95]
  wire  ram_weights_3_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [6:0] ram_weights_3_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_weights_3_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_weights_3_MPORT_data; // @[Decoupled.scala 275:95]
  wire [6:0] ram_weights_3_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_weights_3_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_weights_3_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_weights_4 [0:127]; // @[Decoupled.scala 275:95]
  wire  ram_weights_4_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [6:0] ram_weights_4_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_weights_4_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_weights_4_MPORT_data; // @[Decoupled.scala 275:95]
  wire [6:0] ram_weights_4_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_weights_4_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_weights_4_MPORT_en; // @[Decoupled.scala 275:95]
  reg  ram_last [0:127]; // @[Decoupled.scala 275:95]
  wire  ram_last_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [6:0] ram_last_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_last_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire  ram_last_MPORT_data; // @[Decoupled.scala 275:95]
  wire [6:0] ram_last_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_last_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_last_MPORT_en; // @[Decoupled.scala 275:95]
  reg [6:0] enq_ptr_value; // @[Counter.scala 61:40]
  reg [6:0] deq_ptr_value; // @[Counter.scala 61:40]
  reg  maybe_full; // @[Decoupled.scala 278:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[Decoupled.scala 279:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 280:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 281:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 52:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 52:35]
  wire [6:0] _value_T_1 = enq_ptr_value + 7'h1; // @[Counter.scala 77:24]
  wire [6:0] _value_T_3 = deq_ptr_value + 7'h1; // @[Counter.scala 77:24]
  assign ram_features_0_io_deq_bits_MPORT_en = 1'h1;
  assign ram_features_0_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_features_0_io_deq_bits_MPORT_data = ram_features_0[ram_features_0_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_features_0_MPORT_data = io_enq_bits_features_0;
  assign ram_features_0_MPORT_addr = enq_ptr_value;
  assign ram_features_0_MPORT_mask = 1'h1;
  assign ram_features_0_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_features_1_io_deq_bits_MPORT_en = 1'h1;
  assign ram_features_1_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_features_1_io_deq_bits_MPORT_data = ram_features_1[ram_features_1_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_features_1_MPORT_data = io_enq_bits_features_1;
  assign ram_features_1_MPORT_addr = enq_ptr_value;
  assign ram_features_1_MPORT_mask = 1'h1;
  assign ram_features_1_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_features_2_io_deq_bits_MPORT_en = 1'h1;
  assign ram_features_2_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_features_2_io_deq_bits_MPORT_data = ram_features_2[ram_features_2_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_features_2_MPORT_data = io_enq_bits_features_2;
  assign ram_features_2_MPORT_addr = enq_ptr_value;
  assign ram_features_2_MPORT_mask = 1'h1;
  assign ram_features_2_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_features_3_io_deq_bits_MPORT_en = 1'h1;
  assign ram_features_3_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_features_3_io_deq_bits_MPORT_data = ram_features_3[ram_features_3_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_features_3_MPORT_data = io_enq_bits_features_3;
  assign ram_features_3_MPORT_addr = enq_ptr_value;
  assign ram_features_3_MPORT_mask = 1'h1;
  assign ram_features_3_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_features_4_io_deq_bits_MPORT_en = 1'h1;
  assign ram_features_4_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_features_4_io_deq_bits_MPORT_data = ram_features_4[ram_features_4_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_features_4_MPORT_data = io_enq_bits_features_4;
  assign ram_features_4_MPORT_addr = enq_ptr_value;
  assign ram_features_4_MPORT_mask = 1'h1;
  assign ram_features_4_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_offset_io_deq_bits_MPORT_en = 1'h1;
  assign ram_offset_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_offset_io_deq_bits_MPORT_data = ram_offset[ram_offset_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_offset_MPORT_data = io_enq_bits_offset;
  assign ram_offset_MPORT_addr = enq_ptr_value;
  assign ram_offset_MPORT_mask = 1'h1;
  assign ram_offset_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_search_for_root_io_deq_bits_MPORT_en = 1'h1;
  assign ram_search_for_root_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_search_for_root_io_deq_bits_MPORT_data = ram_search_for_root[ram_search_for_root_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_search_for_root_MPORT_data = io_enq_bits_search_for_root;
  assign ram_search_for_root_MPORT_addr = enq_ptr_value;
  assign ram_search_for_root_MPORT_mask = 1'h1;
  assign ram_search_for_root_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_tree_to_exec_io_deq_bits_MPORT_en = 1'h1;
  assign ram_tree_to_exec_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_tree_to_exec_io_deq_bits_MPORT_data = ram_tree_to_exec[ram_tree_to_exec_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_tree_to_exec_MPORT_data = io_enq_bits_tree_to_exec;
  assign ram_tree_to_exec_MPORT_addr = enq_ptr_value;
  assign ram_tree_to_exec_MPORT_mask = 1'h1;
  assign ram_tree_to_exec_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_scores_0_io_deq_bits_MPORT_en = 1'h1;
  assign ram_scores_0_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_scores_0_io_deq_bits_MPORT_data = ram_scores_0[ram_scores_0_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_scores_0_MPORT_data = io_enq_bits_scores_0;
  assign ram_scores_0_MPORT_addr = enq_ptr_value;
  assign ram_scores_0_MPORT_mask = 1'h1;
  assign ram_scores_0_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_scores_1_io_deq_bits_MPORT_en = 1'h1;
  assign ram_scores_1_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_scores_1_io_deq_bits_MPORT_data = ram_scores_1[ram_scores_1_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_scores_1_MPORT_data = io_enq_bits_scores_1;
  assign ram_scores_1_MPORT_addr = enq_ptr_value;
  assign ram_scores_1_MPORT_mask = 1'h1;
  assign ram_scores_1_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_scores_2_io_deq_bits_MPORT_en = 1'h1;
  assign ram_scores_2_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_scores_2_io_deq_bits_MPORT_data = ram_scores_2[ram_scores_2_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_scores_2_MPORT_data = io_enq_bits_scores_2;
  assign ram_scores_2_MPORT_addr = enq_ptr_value;
  assign ram_scores_2_MPORT_mask = 1'h1;
  assign ram_scores_2_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_scores_3_io_deq_bits_MPORT_en = 1'h1;
  assign ram_scores_3_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_scores_3_io_deq_bits_MPORT_data = ram_scores_3[ram_scores_3_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_scores_3_MPORT_data = io_enq_bits_scores_3;
  assign ram_scores_3_MPORT_addr = enq_ptr_value;
  assign ram_scores_3_MPORT_mask = 1'h1;
  assign ram_scores_3_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_weights_0_io_deq_bits_MPORT_en = 1'h1;
  assign ram_weights_0_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_weights_0_io_deq_bits_MPORT_data = ram_weights_0[ram_weights_0_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_weights_0_MPORT_data = io_enq_bits_weights_0;
  assign ram_weights_0_MPORT_addr = enq_ptr_value;
  assign ram_weights_0_MPORT_mask = 1'h1;
  assign ram_weights_0_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_weights_1_io_deq_bits_MPORT_en = 1'h1;
  assign ram_weights_1_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_weights_1_io_deq_bits_MPORT_data = ram_weights_1[ram_weights_1_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_weights_1_MPORT_data = io_enq_bits_weights_1;
  assign ram_weights_1_MPORT_addr = enq_ptr_value;
  assign ram_weights_1_MPORT_mask = 1'h1;
  assign ram_weights_1_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_weights_2_io_deq_bits_MPORT_en = 1'h1;
  assign ram_weights_2_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_weights_2_io_deq_bits_MPORT_data = ram_weights_2[ram_weights_2_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_weights_2_MPORT_data = io_enq_bits_weights_2;
  assign ram_weights_2_MPORT_addr = enq_ptr_value;
  assign ram_weights_2_MPORT_mask = 1'h1;
  assign ram_weights_2_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_weights_3_io_deq_bits_MPORT_en = 1'h1;
  assign ram_weights_3_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_weights_3_io_deq_bits_MPORT_data = ram_weights_3[ram_weights_3_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_weights_3_MPORT_data = io_enq_bits_weights_3;
  assign ram_weights_3_MPORT_addr = enq_ptr_value;
  assign ram_weights_3_MPORT_mask = 1'h1;
  assign ram_weights_3_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_weights_4_io_deq_bits_MPORT_en = 1'h1;
  assign ram_weights_4_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_weights_4_io_deq_bits_MPORT_data = ram_weights_4[ram_weights_4_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_weights_4_MPORT_data = io_enq_bits_weights_4;
  assign ram_weights_4_MPORT_addr = enq_ptr_value;
  assign ram_weights_4_MPORT_mask = 1'h1;
  assign ram_weights_4_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_last_io_deq_bits_MPORT_en = 1'h1;
  assign ram_last_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_last_io_deq_bits_MPORT_data = ram_last[ram_last_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_last_MPORT_data = io_enq_bits_last;
  assign ram_last_MPORT_addr = enq_ptr_value;
  assign ram_last_MPORT_mask = 1'h1;
  assign ram_last_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 305:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 304:19]
  assign io_deq_bits_features_0 = ram_features_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_features_1 = ram_features_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_features_2 = ram_features_2_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_features_3 = ram_features_3_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_features_4 = ram_features_4_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_offset = ram_offset_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_search_for_root = ram_search_for_root_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_tree_to_exec = ram_tree_to_exec_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_scores_0 = ram_scores_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_scores_1 = ram_scores_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_scores_2 = ram_scores_2_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_scores_3 = ram_scores_3_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_weights_0 = ram_weights_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_weights_1 = ram_weights_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_weights_2 = ram_weights_2_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_weights_3 = ram_weights_3_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_weights_4 = ram_weights_4_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_last = ram_last_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  always @(posedge clock) begin
    if (ram_features_0_MPORT_en & ram_features_0_MPORT_mask) begin
      ram_features_0[ram_features_0_MPORT_addr] <= ram_features_0_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_features_1_MPORT_en & ram_features_1_MPORT_mask) begin
      ram_features_1[ram_features_1_MPORT_addr] <= ram_features_1_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_features_2_MPORT_en & ram_features_2_MPORT_mask) begin
      ram_features_2[ram_features_2_MPORT_addr] <= ram_features_2_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_features_3_MPORT_en & ram_features_3_MPORT_mask) begin
      ram_features_3[ram_features_3_MPORT_addr] <= ram_features_3_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_features_4_MPORT_en & ram_features_4_MPORT_mask) begin
      ram_features_4[ram_features_4_MPORT_addr] <= ram_features_4_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_offset_MPORT_en & ram_offset_MPORT_mask) begin
      ram_offset[ram_offset_MPORT_addr] <= ram_offset_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_search_for_root_MPORT_en & ram_search_for_root_MPORT_mask) begin
      ram_search_for_root[ram_search_for_root_MPORT_addr] <= ram_search_for_root_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_tree_to_exec_MPORT_en & ram_tree_to_exec_MPORT_mask) begin
      ram_tree_to_exec[ram_tree_to_exec_MPORT_addr] <= ram_tree_to_exec_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_scores_0_MPORT_en & ram_scores_0_MPORT_mask) begin
      ram_scores_0[ram_scores_0_MPORT_addr] <= ram_scores_0_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_scores_1_MPORT_en & ram_scores_1_MPORT_mask) begin
      ram_scores_1[ram_scores_1_MPORT_addr] <= ram_scores_1_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_scores_2_MPORT_en & ram_scores_2_MPORT_mask) begin
      ram_scores_2[ram_scores_2_MPORT_addr] <= ram_scores_2_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_scores_3_MPORT_en & ram_scores_3_MPORT_mask) begin
      ram_scores_3[ram_scores_3_MPORT_addr] <= ram_scores_3_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_weights_0_MPORT_en & ram_weights_0_MPORT_mask) begin
      ram_weights_0[ram_weights_0_MPORT_addr] <= ram_weights_0_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_weights_1_MPORT_en & ram_weights_1_MPORT_mask) begin
      ram_weights_1[ram_weights_1_MPORT_addr] <= ram_weights_1_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_weights_2_MPORT_en & ram_weights_2_MPORT_mask) begin
      ram_weights_2[ram_weights_2_MPORT_addr] <= ram_weights_2_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_weights_3_MPORT_en & ram_weights_3_MPORT_mask) begin
      ram_weights_3[ram_weights_3_MPORT_addr] <= ram_weights_3_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_weights_4_MPORT_en & ram_weights_4_MPORT_mask) begin
      ram_weights_4[ram_weights_4_MPORT_addr] <= ram_weights_4_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_last_MPORT_en & ram_last_MPORT_mask) begin
      ram_last[ram_last_MPORT_addr] <= ram_last_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (reset) begin // @[Counter.scala 61:40]
      enq_ptr_value <= 7'h0; // @[Counter.scala 61:40]
    end else if (do_enq) begin // @[Decoupled.scala 288:16]
      enq_ptr_value <= _value_T_1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Counter.scala 61:40]
      deq_ptr_value <= 7'h0; // @[Counter.scala 61:40]
    end else if (do_deq) begin // @[Decoupled.scala 292:16]
      deq_ptr_value <= _value_T_3; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Decoupled.scala 278:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 278:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 295:27]
      maybe_full <= do_enq; // @[Decoupled.scala 296:16]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    ram_features_0[initvar] = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    ram_features_1[initvar] = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    ram_features_2[initvar] = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    ram_features_3[initvar] = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    ram_features_4[initvar] = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    ram_offset[initvar] = _RAND_5[9:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    ram_search_for_root[initvar] = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    ram_tree_to_exec[initvar] = _RAND_7[7:0];
  _RAND_8 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    ram_scores_0[initvar] = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    ram_scores_1[initvar] = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    ram_scores_2[initvar] = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    ram_scores_3[initvar] = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    ram_weights_0[initvar] = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    ram_weights_1[initvar] = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    ram_weights_2[initvar] = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    ram_weights_3[initvar] = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    ram_weights_4[initvar] = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    ram_last[initvar] = _RAND_17[0:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  enq_ptr_value = _RAND_18[6:0];
  _RAND_19 = {1{`RANDOM}};
  deq_ptr_value = _RAND_19[6:0];
  _RAND_20 = {1{`RANDOM}};
  maybe_full = _RAND_20[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module RRArbiter(
  input         clock,
  output        io_in_0_ready,
  input         io_in_0_valid,
  input  [31:0] io_in_0_bits_features_0,
  input  [31:0] io_in_0_bits_features_1,
  input  [31:0] io_in_0_bits_features_2,
  input  [31:0] io_in_0_bits_features_3,
  input  [31:0] io_in_0_bits_features_4,
  input  [9:0]  io_in_0_bits_offset,
  input         io_in_0_bits_search_for_root,
  input  [7:0]  io_in_0_bits_tree_to_exec,
  input  [31:0] io_in_0_bits_scores_0,
  input  [31:0] io_in_0_bits_scores_1,
  input  [31:0] io_in_0_bits_scores_2,
  input  [31:0] io_in_0_bits_scores_3,
  input  [31:0] io_in_0_bits_weights_0,
  input  [31:0] io_in_0_bits_weights_1,
  input  [31:0] io_in_0_bits_weights_2,
  input  [31:0] io_in_0_bits_weights_3,
  input  [31:0] io_in_0_bits_weights_4,
  input         io_in_0_bits_last,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input  [31:0] io_in_1_bits_features_0,
  input  [31:0] io_in_1_bits_features_1,
  input  [31:0] io_in_1_bits_features_2,
  input  [31:0] io_in_1_bits_features_3,
  input  [31:0] io_in_1_bits_features_4,
  input  [9:0]  io_in_1_bits_offset,
  input         io_in_1_bits_search_for_root,
  input  [7:0]  io_in_1_bits_tree_to_exec,
  input  [31:0] io_in_1_bits_scores_0,
  input  [31:0] io_in_1_bits_scores_1,
  input  [31:0] io_in_1_bits_scores_2,
  input  [31:0] io_in_1_bits_scores_3,
  input  [31:0] io_in_1_bits_weights_0,
  input  [31:0] io_in_1_bits_weights_1,
  input  [31:0] io_in_1_bits_weights_2,
  input  [31:0] io_in_1_bits_weights_3,
  input  [31:0] io_in_1_bits_weights_4,
  input         io_in_1_bits_last,
  input         io_out_ready,
  output        io_out_valid,
  output [31:0] io_out_bits_features_0,
  output [31:0] io_out_bits_features_1,
  output [31:0] io_out_bits_features_2,
  output [31:0] io_out_bits_features_3,
  output [31:0] io_out_bits_features_4,
  output [9:0]  io_out_bits_offset,
  output        io_out_bits_search_for_root,
  output [7:0]  io_out_bits_tree_to_exec,
  output [31:0] io_out_bits_scores_0,
  output [31:0] io_out_bits_scores_1,
  output [31:0] io_out_bits_scores_2,
  output [31:0] io_out_bits_scores_3,
  output [31:0] io_out_bits_weights_0,
  output [31:0] io_out_bits_weights_1,
  output [31:0] io_out_bits_weights_2,
  output [31:0] io_out_bits_weights_3,
  output [31:0] io_out_bits_weights_4,
  output        io_out_bits_last,
  output        io_chosen
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  _ctrl_validMask_grantMask_lastGrant_T = io_out_ready & io_out_valid; // @[Decoupled.scala 52:35]
  reg  lastGrant; // @[Reg.scala 19:16]
  wire  grantMask_1 = 1'h1 > lastGrant; // @[Arbiter.scala 81:49]
  wire  validMask_1 = io_in_1_valid & grantMask_1; // @[Arbiter.scala 82:76]
  wire  ctrl_2 = ~validMask_1; // @[Arbiter.scala 45:78]
  wire  ctrl_3 = ~(validMask_1 | io_in_0_valid); // @[Arbiter.scala 45:78]
  wire  _T_3 = grantMask_1 | ctrl_3; // @[Arbiter.scala 86:50]
  wire  _GEN_45 = io_in_0_valid ? 1'h0 : 1'h1; // @[Arbiter.scala 91:{26,35}]
  assign io_in_0_ready = ctrl_2 & io_out_ready; // @[Arbiter.scala 74:21]
  assign io_in_1_ready = _T_3 & io_out_ready; // @[Arbiter.scala 74:21]
  assign io_out_valid = io_chosen ? io_in_1_valid : io_in_0_valid; // @[Arbiter.scala 55:{16,16}]
  assign io_out_bits_features_0 = io_chosen ? $signed(io_in_1_bits_features_0) : $signed(io_in_0_bits_features_0); // @[Arbiter.scala 56:{15,15}]
  assign io_out_bits_features_1 = io_chosen ? $signed(io_in_1_bits_features_1) : $signed(io_in_0_bits_features_1); // @[Arbiter.scala 56:{15,15}]
  assign io_out_bits_features_2 = io_chosen ? $signed(io_in_1_bits_features_2) : $signed(io_in_0_bits_features_2); // @[Arbiter.scala 56:{15,15}]
  assign io_out_bits_features_3 = io_chosen ? $signed(io_in_1_bits_features_3) : $signed(io_in_0_bits_features_3); // @[Arbiter.scala 56:{15,15}]
  assign io_out_bits_features_4 = io_chosen ? $signed(io_in_1_bits_features_4) : $signed(io_in_0_bits_features_4); // @[Arbiter.scala 56:{15,15}]
  assign io_out_bits_offset = io_chosen ? io_in_1_bits_offset : io_in_0_bits_offset; // @[Arbiter.scala 56:{15,15}]
  assign io_out_bits_search_for_root = io_chosen ? io_in_1_bits_search_for_root : io_in_0_bits_search_for_root; // @[Arbiter.scala 56:{15,15}]
  assign io_out_bits_tree_to_exec = io_chosen ? io_in_1_bits_tree_to_exec : io_in_0_bits_tree_to_exec; // @[Arbiter.scala 56:{15,15}]
  assign io_out_bits_scores_0 = io_chosen ? $signed(io_in_1_bits_scores_0) : $signed(io_in_0_bits_scores_0); // @[Arbiter.scala 56:{15,15}]
  assign io_out_bits_scores_1 = io_chosen ? $signed(io_in_1_bits_scores_1) : $signed(io_in_0_bits_scores_1); // @[Arbiter.scala 56:{15,15}]
  assign io_out_bits_scores_2 = io_chosen ? $signed(io_in_1_bits_scores_2) : $signed(io_in_0_bits_scores_2); // @[Arbiter.scala 56:{15,15}]
  assign io_out_bits_scores_3 = io_chosen ? $signed(io_in_1_bits_scores_3) : $signed(io_in_0_bits_scores_3); // @[Arbiter.scala 56:{15,15}]
  assign io_out_bits_weights_0 = io_chosen ? $signed(io_in_1_bits_weights_0) : $signed(io_in_0_bits_weights_0); // @[Arbiter.scala 56:{15,15}]
  assign io_out_bits_weights_1 = io_chosen ? $signed(io_in_1_bits_weights_1) : $signed(io_in_0_bits_weights_1); // @[Arbiter.scala 56:{15,15}]
  assign io_out_bits_weights_2 = io_chosen ? $signed(io_in_1_bits_weights_2) : $signed(io_in_0_bits_weights_2); // @[Arbiter.scala 56:{15,15}]
  assign io_out_bits_weights_3 = io_chosen ? $signed(io_in_1_bits_weights_3) : $signed(io_in_0_bits_weights_3); // @[Arbiter.scala 56:{15,15}]
  assign io_out_bits_weights_4 = io_chosen ? $signed(io_in_1_bits_weights_4) : $signed(io_in_0_bits_weights_4); // @[Arbiter.scala 56:{15,15}]
  assign io_out_bits_last = io_chosen ? io_in_1_bits_last : io_in_0_bits_last; // @[Arbiter.scala 56:{15,15}]
  assign io_chosen = validMask_1 | _GEN_45; // @[Arbiter.scala 93:{24,33}]
  always @(posedge clock) begin
    if (_ctrl_validMask_grantMask_lastGrant_T) begin // @[Reg.scala 20:18]
      lastGrant <= io_chosen; // @[Reg.scala 20:22]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  lastGrant = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module FirstInterconnectPE(
  input         clock,
  input         reset,
  output        io_sample_entering_ready,
  input         io_sample_entering_valid,
  input  [31:0] io_sample_entering_bits_features_0,
  input  [31:0] io_sample_entering_bits_features_1,
  input  [31:0] io_sample_entering_bits_features_2,
  input  [31:0] io_sample_entering_bits_features_3,
  input  [31:0] io_sample_entering_bits_features_4,
  input  [9:0]  io_sample_entering_bits_offset,
  input         io_sample_entering_bits_search_for_root,
  input  [7:0]  io_sample_entering_bits_tree_to_exec,
  input  [31:0] io_sample_entering_bits_scores_0,
  input  [31:0] io_sample_entering_bits_scores_1,
  input  [31:0] io_sample_entering_bits_scores_2,
  input  [31:0] io_sample_entering_bits_scores_3,
  input  [31:0] io_sample_entering_bits_weights_0,
  input  [31:0] io_sample_entering_bits_weights_1,
  input  [31:0] io_sample_entering_bits_weights_2,
  input  [31:0] io_sample_entering_bits_weights_3,
  input  [31:0] io_sample_entering_bits_weights_4,
  input         io_sample_entering_bits_last,
  output        io_sample_looping_ready,
  input         io_sample_looping_valid,
  input  [31:0] io_sample_looping_bits_features_0,
  input  [31:0] io_sample_looping_bits_features_1,
  input  [31:0] io_sample_looping_bits_features_2,
  input  [31:0] io_sample_looping_bits_features_3,
  input  [31:0] io_sample_looping_bits_features_4,
  input  [9:0]  io_sample_looping_bits_offset,
  input         io_sample_looping_bits_search_for_root,
  input  [7:0]  io_sample_looping_bits_tree_to_exec,
  input  [31:0] io_sample_looping_bits_scores_0,
  input  [31:0] io_sample_looping_bits_scores_1,
  input  [31:0] io_sample_looping_bits_scores_2,
  input  [31:0] io_sample_looping_bits_scores_3,
  input  [31:0] io_sample_looping_bits_weights_0,
  input  [31:0] io_sample_looping_bits_weights_1,
  input  [31:0] io_sample_looping_bits_weights_2,
  input  [31:0] io_sample_looping_bits_weights_3,
  input  [31:0] io_sample_looping_bits_weights_4,
  input         io_sample_looping_bits_last,
  input         io_sample_out_ready,
  output        io_sample_out_valid,
  output [31:0] io_sample_out_bits_features_0,
  output [31:0] io_sample_out_bits_features_1,
  output [31:0] io_sample_out_bits_features_2,
  output [31:0] io_sample_out_bits_features_3,
  output [31:0] io_sample_out_bits_features_4,
  output [9:0]  io_sample_out_bits_offset,
  output        io_sample_out_bits_search_for_root,
  output [7:0]  io_sample_out_bits_tree_to_exec,
  output [31:0] io_sample_out_bits_scores_0,
  output [31:0] io_sample_out_bits_scores_1,
  output [31:0] io_sample_out_bits_scores_2,
  output [31:0] io_sample_out_bits_scores_3,
  output [31:0] io_sample_out_bits_weights_0,
  output [31:0] io_sample_out_bits_weights_1,
  output [31:0] io_sample_out_bits_weights_2,
  output [31:0] io_sample_out_bits_weights_3,
  output [31:0] io_sample_out_bits_weights_4,
  output        io_sample_out_bits_last
);
  wire  queue_entering_clock; // @[Decoupled.scala 377:21]
  wire  queue_entering_reset; // @[Decoupled.scala 377:21]
  wire  queue_entering_io_enq_ready; // @[Decoupled.scala 377:21]
  wire  queue_entering_io_enq_valid; // @[Decoupled.scala 377:21]
  wire [31:0] queue_entering_io_enq_bits_features_0; // @[Decoupled.scala 377:21]
  wire [31:0] queue_entering_io_enq_bits_features_1; // @[Decoupled.scala 377:21]
  wire [31:0] queue_entering_io_enq_bits_features_2; // @[Decoupled.scala 377:21]
  wire [31:0] queue_entering_io_enq_bits_features_3; // @[Decoupled.scala 377:21]
  wire [31:0] queue_entering_io_enq_bits_features_4; // @[Decoupled.scala 377:21]
  wire [9:0] queue_entering_io_enq_bits_offset; // @[Decoupled.scala 377:21]
  wire  queue_entering_io_enq_bits_search_for_root; // @[Decoupled.scala 377:21]
  wire [7:0] queue_entering_io_enq_bits_tree_to_exec; // @[Decoupled.scala 377:21]
  wire [31:0] queue_entering_io_enq_bits_scores_0; // @[Decoupled.scala 377:21]
  wire [31:0] queue_entering_io_enq_bits_scores_1; // @[Decoupled.scala 377:21]
  wire [31:0] queue_entering_io_enq_bits_scores_2; // @[Decoupled.scala 377:21]
  wire [31:0] queue_entering_io_enq_bits_scores_3; // @[Decoupled.scala 377:21]
  wire [31:0] queue_entering_io_enq_bits_weights_0; // @[Decoupled.scala 377:21]
  wire [31:0] queue_entering_io_enq_bits_weights_1; // @[Decoupled.scala 377:21]
  wire [31:0] queue_entering_io_enq_bits_weights_2; // @[Decoupled.scala 377:21]
  wire [31:0] queue_entering_io_enq_bits_weights_3; // @[Decoupled.scala 377:21]
  wire [31:0] queue_entering_io_enq_bits_weights_4; // @[Decoupled.scala 377:21]
  wire  queue_entering_io_enq_bits_last; // @[Decoupled.scala 377:21]
  wire  queue_entering_io_deq_ready; // @[Decoupled.scala 377:21]
  wire  queue_entering_io_deq_valid; // @[Decoupled.scala 377:21]
  wire [31:0] queue_entering_io_deq_bits_features_0; // @[Decoupled.scala 377:21]
  wire [31:0] queue_entering_io_deq_bits_features_1; // @[Decoupled.scala 377:21]
  wire [31:0] queue_entering_io_deq_bits_features_2; // @[Decoupled.scala 377:21]
  wire [31:0] queue_entering_io_deq_bits_features_3; // @[Decoupled.scala 377:21]
  wire [31:0] queue_entering_io_deq_bits_features_4; // @[Decoupled.scala 377:21]
  wire [9:0] queue_entering_io_deq_bits_offset; // @[Decoupled.scala 377:21]
  wire  queue_entering_io_deq_bits_search_for_root; // @[Decoupled.scala 377:21]
  wire [7:0] queue_entering_io_deq_bits_tree_to_exec; // @[Decoupled.scala 377:21]
  wire [31:0] queue_entering_io_deq_bits_scores_0; // @[Decoupled.scala 377:21]
  wire [31:0] queue_entering_io_deq_bits_scores_1; // @[Decoupled.scala 377:21]
  wire [31:0] queue_entering_io_deq_bits_scores_2; // @[Decoupled.scala 377:21]
  wire [31:0] queue_entering_io_deq_bits_scores_3; // @[Decoupled.scala 377:21]
  wire [31:0] queue_entering_io_deq_bits_weights_0; // @[Decoupled.scala 377:21]
  wire [31:0] queue_entering_io_deq_bits_weights_1; // @[Decoupled.scala 377:21]
  wire [31:0] queue_entering_io_deq_bits_weights_2; // @[Decoupled.scala 377:21]
  wire [31:0] queue_entering_io_deq_bits_weights_3; // @[Decoupled.scala 377:21]
  wire [31:0] queue_entering_io_deq_bits_weights_4; // @[Decoupled.scala 377:21]
  wire  queue_entering_io_deq_bits_last; // @[Decoupled.scala 377:21]
  wire  queue_looping_clock; // @[Decoupled.scala 377:21]
  wire  queue_looping_reset; // @[Decoupled.scala 377:21]
  wire  queue_looping_io_enq_ready; // @[Decoupled.scala 377:21]
  wire  queue_looping_io_enq_valid; // @[Decoupled.scala 377:21]
  wire [31:0] queue_looping_io_enq_bits_features_0; // @[Decoupled.scala 377:21]
  wire [31:0] queue_looping_io_enq_bits_features_1; // @[Decoupled.scala 377:21]
  wire [31:0] queue_looping_io_enq_bits_features_2; // @[Decoupled.scala 377:21]
  wire [31:0] queue_looping_io_enq_bits_features_3; // @[Decoupled.scala 377:21]
  wire [31:0] queue_looping_io_enq_bits_features_4; // @[Decoupled.scala 377:21]
  wire [9:0] queue_looping_io_enq_bits_offset; // @[Decoupled.scala 377:21]
  wire  queue_looping_io_enq_bits_search_for_root; // @[Decoupled.scala 377:21]
  wire [7:0] queue_looping_io_enq_bits_tree_to_exec; // @[Decoupled.scala 377:21]
  wire [31:0] queue_looping_io_enq_bits_scores_0; // @[Decoupled.scala 377:21]
  wire [31:0] queue_looping_io_enq_bits_scores_1; // @[Decoupled.scala 377:21]
  wire [31:0] queue_looping_io_enq_bits_scores_2; // @[Decoupled.scala 377:21]
  wire [31:0] queue_looping_io_enq_bits_scores_3; // @[Decoupled.scala 377:21]
  wire [31:0] queue_looping_io_enq_bits_weights_0; // @[Decoupled.scala 377:21]
  wire [31:0] queue_looping_io_enq_bits_weights_1; // @[Decoupled.scala 377:21]
  wire [31:0] queue_looping_io_enq_bits_weights_2; // @[Decoupled.scala 377:21]
  wire [31:0] queue_looping_io_enq_bits_weights_3; // @[Decoupled.scala 377:21]
  wire [31:0] queue_looping_io_enq_bits_weights_4; // @[Decoupled.scala 377:21]
  wire  queue_looping_io_enq_bits_last; // @[Decoupled.scala 377:21]
  wire  queue_looping_io_deq_ready; // @[Decoupled.scala 377:21]
  wire  queue_looping_io_deq_valid; // @[Decoupled.scala 377:21]
  wire [31:0] queue_looping_io_deq_bits_features_0; // @[Decoupled.scala 377:21]
  wire [31:0] queue_looping_io_deq_bits_features_1; // @[Decoupled.scala 377:21]
  wire [31:0] queue_looping_io_deq_bits_features_2; // @[Decoupled.scala 377:21]
  wire [31:0] queue_looping_io_deq_bits_features_3; // @[Decoupled.scala 377:21]
  wire [31:0] queue_looping_io_deq_bits_features_4; // @[Decoupled.scala 377:21]
  wire [9:0] queue_looping_io_deq_bits_offset; // @[Decoupled.scala 377:21]
  wire  queue_looping_io_deq_bits_search_for_root; // @[Decoupled.scala 377:21]
  wire [7:0] queue_looping_io_deq_bits_tree_to_exec; // @[Decoupled.scala 377:21]
  wire [31:0] queue_looping_io_deq_bits_scores_0; // @[Decoupled.scala 377:21]
  wire [31:0] queue_looping_io_deq_bits_scores_1; // @[Decoupled.scala 377:21]
  wire [31:0] queue_looping_io_deq_bits_scores_2; // @[Decoupled.scala 377:21]
  wire [31:0] queue_looping_io_deq_bits_scores_3; // @[Decoupled.scala 377:21]
  wire [31:0] queue_looping_io_deq_bits_weights_0; // @[Decoupled.scala 377:21]
  wire [31:0] queue_looping_io_deq_bits_weights_1; // @[Decoupled.scala 377:21]
  wire [31:0] queue_looping_io_deq_bits_weights_2; // @[Decoupled.scala 377:21]
  wire [31:0] queue_looping_io_deq_bits_weights_3; // @[Decoupled.scala 377:21]
  wire [31:0] queue_looping_io_deq_bits_weights_4; // @[Decoupled.scala 377:21]
  wire  queue_looping_io_deq_bits_last; // @[Decoupled.scala 377:21]
  wire  arbiter_clock; // @[Interconnect.scala 64:25]
  wire  arbiter_io_in_0_ready; // @[Interconnect.scala 64:25]
  wire  arbiter_io_in_0_valid; // @[Interconnect.scala 64:25]
  wire [31:0] arbiter_io_in_0_bits_features_0; // @[Interconnect.scala 64:25]
  wire [31:0] arbiter_io_in_0_bits_features_1; // @[Interconnect.scala 64:25]
  wire [31:0] arbiter_io_in_0_bits_features_2; // @[Interconnect.scala 64:25]
  wire [31:0] arbiter_io_in_0_bits_features_3; // @[Interconnect.scala 64:25]
  wire [31:0] arbiter_io_in_0_bits_features_4; // @[Interconnect.scala 64:25]
  wire [9:0] arbiter_io_in_0_bits_offset; // @[Interconnect.scala 64:25]
  wire  arbiter_io_in_0_bits_search_for_root; // @[Interconnect.scala 64:25]
  wire [7:0] arbiter_io_in_0_bits_tree_to_exec; // @[Interconnect.scala 64:25]
  wire [31:0] arbiter_io_in_0_bits_scores_0; // @[Interconnect.scala 64:25]
  wire [31:0] arbiter_io_in_0_bits_scores_1; // @[Interconnect.scala 64:25]
  wire [31:0] arbiter_io_in_0_bits_scores_2; // @[Interconnect.scala 64:25]
  wire [31:0] arbiter_io_in_0_bits_scores_3; // @[Interconnect.scala 64:25]
  wire [31:0] arbiter_io_in_0_bits_weights_0; // @[Interconnect.scala 64:25]
  wire [31:0] arbiter_io_in_0_bits_weights_1; // @[Interconnect.scala 64:25]
  wire [31:0] arbiter_io_in_0_bits_weights_2; // @[Interconnect.scala 64:25]
  wire [31:0] arbiter_io_in_0_bits_weights_3; // @[Interconnect.scala 64:25]
  wire [31:0] arbiter_io_in_0_bits_weights_4; // @[Interconnect.scala 64:25]
  wire  arbiter_io_in_0_bits_last; // @[Interconnect.scala 64:25]
  wire  arbiter_io_in_1_ready; // @[Interconnect.scala 64:25]
  wire  arbiter_io_in_1_valid; // @[Interconnect.scala 64:25]
  wire [31:0] arbiter_io_in_1_bits_features_0; // @[Interconnect.scala 64:25]
  wire [31:0] arbiter_io_in_1_bits_features_1; // @[Interconnect.scala 64:25]
  wire [31:0] arbiter_io_in_1_bits_features_2; // @[Interconnect.scala 64:25]
  wire [31:0] arbiter_io_in_1_bits_features_3; // @[Interconnect.scala 64:25]
  wire [31:0] arbiter_io_in_1_bits_features_4; // @[Interconnect.scala 64:25]
  wire [9:0] arbiter_io_in_1_bits_offset; // @[Interconnect.scala 64:25]
  wire  arbiter_io_in_1_bits_search_for_root; // @[Interconnect.scala 64:25]
  wire [7:0] arbiter_io_in_1_bits_tree_to_exec; // @[Interconnect.scala 64:25]
  wire [31:0] arbiter_io_in_1_bits_scores_0; // @[Interconnect.scala 64:25]
  wire [31:0] arbiter_io_in_1_bits_scores_1; // @[Interconnect.scala 64:25]
  wire [31:0] arbiter_io_in_1_bits_scores_2; // @[Interconnect.scala 64:25]
  wire [31:0] arbiter_io_in_1_bits_scores_3; // @[Interconnect.scala 64:25]
  wire [31:0] arbiter_io_in_1_bits_weights_0; // @[Interconnect.scala 64:25]
  wire [31:0] arbiter_io_in_1_bits_weights_1; // @[Interconnect.scala 64:25]
  wire [31:0] arbiter_io_in_1_bits_weights_2; // @[Interconnect.scala 64:25]
  wire [31:0] arbiter_io_in_1_bits_weights_3; // @[Interconnect.scala 64:25]
  wire [31:0] arbiter_io_in_1_bits_weights_4; // @[Interconnect.scala 64:25]
  wire  arbiter_io_in_1_bits_last; // @[Interconnect.scala 64:25]
  wire  arbiter_io_out_ready; // @[Interconnect.scala 64:25]
  wire  arbiter_io_out_valid; // @[Interconnect.scala 64:25]
  wire [31:0] arbiter_io_out_bits_features_0; // @[Interconnect.scala 64:25]
  wire [31:0] arbiter_io_out_bits_features_1; // @[Interconnect.scala 64:25]
  wire [31:0] arbiter_io_out_bits_features_2; // @[Interconnect.scala 64:25]
  wire [31:0] arbiter_io_out_bits_features_3; // @[Interconnect.scala 64:25]
  wire [31:0] arbiter_io_out_bits_features_4; // @[Interconnect.scala 64:25]
  wire [9:0] arbiter_io_out_bits_offset; // @[Interconnect.scala 64:25]
  wire  arbiter_io_out_bits_search_for_root; // @[Interconnect.scala 64:25]
  wire [7:0] arbiter_io_out_bits_tree_to_exec; // @[Interconnect.scala 64:25]
  wire [31:0] arbiter_io_out_bits_scores_0; // @[Interconnect.scala 64:25]
  wire [31:0] arbiter_io_out_bits_scores_1; // @[Interconnect.scala 64:25]
  wire [31:0] arbiter_io_out_bits_scores_2; // @[Interconnect.scala 64:25]
  wire [31:0] arbiter_io_out_bits_scores_3; // @[Interconnect.scala 64:25]
  wire [31:0] arbiter_io_out_bits_weights_0; // @[Interconnect.scala 64:25]
  wire [31:0] arbiter_io_out_bits_weights_1; // @[Interconnect.scala 64:25]
  wire [31:0] arbiter_io_out_bits_weights_2; // @[Interconnect.scala 64:25]
  wire [31:0] arbiter_io_out_bits_weights_3; // @[Interconnect.scala 64:25]
  wire [31:0] arbiter_io_out_bits_weights_4; // @[Interconnect.scala 64:25]
  wire  arbiter_io_out_bits_last; // @[Interconnect.scala 64:25]
  wire  arbiter_io_chosen; // @[Interconnect.scala 64:25]
  Queue_31 queue_entering ( // @[Decoupled.scala 377:21]
    .clock(queue_entering_clock),
    .reset(queue_entering_reset),
    .io_enq_ready(queue_entering_io_enq_ready),
    .io_enq_valid(queue_entering_io_enq_valid),
    .io_enq_bits_features_0(queue_entering_io_enq_bits_features_0),
    .io_enq_bits_features_1(queue_entering_io_enq_bits_features_1),
    .io_enq_bits_features_2(queue_entering_io_enq_bits_features_2),
    .io_enq_bits_features_3(queue_entering_io_enq_bits_features_3),
    .io_enq_bits_features_4(queue_entering_io_enq_bits_features_4),
    .io_enq_bits_offset(queue_entering_io_enq_bits_offset),
    .io_enq_bits_search_for_root(queue_entering_io_enq_bits_search_for_root),
    .io_enq_bits_tree_to_exec(queue_entering_io_enq_bits_tree_to_exec),
    .io_enq_bits_scores_0(queue_entering_io_enq_bits_scores_0),
    .io_enq_bits_scores_1(queue_entering_io_enq_bits_scores_1),
    .io_enq_bits_scores_2(queue_entering_io_enq_bits_scores_2),
    .io_enq_bits_scores_3(queue_entering_io_enq_bits_scores_3),
    .io_enq_bits_weights_0(queue_entering_io_enq_bits_weights_0),
    .io_enq_bits_weights_1(queue_entering_io_enq_bits_weights_1),
    .io_enq_bits_weights_2(queue_entering_io_enq_bits_weights_2),
    .io_enq_bits_weights_3(queue_entering_io_enq_bits_weights_3),
    .io_enq_bits_weights_4(queue_entering_io_enq_bits_weights_4),
    .io_enq_bits_last(queue_entering_io_enq_bits_last),
    .io_deq_ready(queue_entering_io_deq_ready),
    .io_deq_valid(queue_entering_io_deq_valid),
    .io_deq_bits_features_0(queue_entering_io_deq_bits_features_0),
    .io_deq_bits_features_1(queue_entering_io_deq_bits_features_1),
    .io_deq_bits_features_2(queue_entering_io_deq_bits_features_2),
    .io_deq_bits_features_3(queue_entering_io_deq_bits_features_3),
    .io_deq_bits_features_4(queue_entering_io_deq_bits_features_4),
    .io_deq_bits_offset(queue_entering_io_deq_bits_offset),
    .io_deq_bits_search_for_root(queue_entering_io_deq_bits_search_for_root),
    .io_deq_bits_tree_to_exec(queue_entering_io_deq_bits_tree_to_exec),
    .io_deq_bits_scores_0(queue_entering_io_deq_bits_scores_0),
    .io_deq_bits_scores_1(queue_entering_io_deq_bits_scores_1),
    .io_deq_bits_scores_2(queue_entering_io_deq_bits_scores_2),
    .io_deq_bits_scores_3(queue_entering_io_deq_bits_scores_3),
    .io_deq_bits_weights_0(queue_entering_io_deq_bits_weights_0),
    .io_deq_bits_weights_1(queue_entering_io_deq_bits_weights_1),
    .io_deq_bits_weights_2(queue_entering_io_deq_bits_weights_2),
    .io_deq_bits_weights_3(queue_entering_io_deq_bits_weights_3),
    .io_deq_bits_weights_4(queue_entering_io_deq_bits_weights_4),
    .io_deq_bits_last(queue_entering_io_deq_bits_last)
  );
  Queue_31 queue_looping ( // @[Decoupled.scala 377:21]
    .clock(queue_looping_clock),
    .reset(queue_looping_reset),
    .io_enq_ready(queue_looping_io_enq_ready),
    .io_enq_valid(queue_looping_io_enq_valid),
    .io_enq_bits_features_0(queue_looping_io_enq_bits_features_0),
    .io_enq_bits_features_1(queue_looping_io_enq_bits_features_1),
    .io_enq_bits_features_2(queue_looping_io_enq_bits_features_2),
    .io_enq_bits_features_3(queue_looping_io_enq_bits_features_3),
    .io_enq_bits_features_4(queue_looping_io_enq_bits_features_4),
    .io_enq_bits_offset(queue_looping_io_enq_bits_offset),
    .io_enq_bits_search_for_root(queue_looping_io_enq_bits_search_for_root),
    .io_enq_bits_tree_to_exec(queue_looping_io_enq_bits_tree_to_exec),
    .io_enq_bits_scores_0(queue_looping_io_enq_bits_scores_0),
    .io_enq_bits_scores_1(queue_looping_io_enq_bits_scores_1),
    .io_enq_bits_scores_2(queue_looping_io_enq_bits_scores_2),
    .io_enq_bits_scores_3(queue_looping_io_enq_bits_scores_3),
    .io_enq_bits_weights_0(queue_looping_io_enq_bits_weights_0),
    .io_enq_bits_weights_1(queue_looping_io_enq_bits_weights_1),
    .io_enq_bits_weights_2(queue_looping_io_enq_bits_weights_2),
    .io_enq_bits_weights_3(queue_looping_io_enq_bits_weights_3),
    .io_enq_bits_weights_4(queue_looping_io_enq_bits_weights_4),
    .io_enq_bits_last(queue_looping_io_enq_bits_last),
    .io_deq_ready(queue_looping_io_deq_ready),
    .io_deq_valid(queue_looping_io_deq_valid),
    .io_deq_bits_features_0(queue_looping_io_deq_bits_features_0),
    .io_deq_bits_features_1(queue_looping_io_deq_bits_features_1),
    .io_deq_bits_features_2(queue_looping_io_deq_bits_features_2),
    .io_deq_bits_features_3(queue_looping_io_deq_bits_features_3),
    .io_deq_bits_features_4(queue_looping_io_deq_bits_features_4),
    .io_deq_bits_offset(queue_looping_io_deq_bits_offset),
    .io_deq_bits_search_for_root(queue_looping_io_deq_bits_search_for_root),
    .io_deq_bits_tree_to_exec(queue_looping_io_deq_bits_tree_to_exec),
    .io_deq_bits_scores_0(queue_looping_io_deq_bits_scores_0),
    .io_deq_bits_scores_1(queue_looping_io_deq_bits_scores_1),
    .io_deq_bits_scores_2(queue_looping_io_deq_bits_scores_2),
    .io_deq_bits_scores_3(queue_looping_io_deq_bits_scores_3),
    .io_deq_bits_weights_0(queue_looping_io_deq_bits_weights_0),
    .io_deq_bits_weights_1(queue_looping_io_deq_bits_weights_1),
    .io_deq_bits_weights_2(queue_looping_io_deq_bits_weights_2),
    .io_deq_bits_weights_3(queue_looping_io_deq_bits_weights_3),
    .io_deq_bits_weights_4(queue_looping_io_deq_bits_weights_4),
    .io_deq_bits_last(queue_looping_io_deq_bits_last)
  );
  RRArbiter arbiter ( // @[Interconnect.scala 64:25]
    .clock(arbiter_clock),
    .io_in_0_ready(arbiter_io_in_0_ready),
    .io_in_0_valid(arbiter_io_in_0_valid),
    .io_in_0_bits_features_0(arbiter_io_in_0_bits_features_0),
    .io_in_0_bits_features_1(arbiter_io_in_0_bits_features_1),
    .io_in_0_bits_features_2(arbiter_io_in_0_bits_features_2),
    .io_in_0_bits_features_3(arbiter_io_in_0_bits_features_3),
    .io_in_0_bits_features_4(arbiter_io_in_0_bits_features_4),
    .io_in_0_bits_offset(arbiter_io_in_0_bits_offset),
    .io_in_0_bits_search_for_root(arbiter_io_in_0_bits_search_for_root),
    .io_in_0_bits_tree_to_exec(arbiter_io_in_0_bits_tree_to_exec),
    .io_in_0_bits_scores_0(arbiter_io_in_0_bits_scores_0),
    .io_in_0_bits_scores_1(arbiter_io_in_0_bits_scores_1),
    .io_in_0_bits_scores_2(arbiter_io_in_0_bits_scores_2),
    .io_in_0_bits_scores_3(arbiter_io_in_0_bits_scores_3),
    .io_in_0_bits_weights_0(arbiter_io_in_0_bits_weights_0),
    .io_in_0_bits_weights_1(arbiter_io_in_0_bits_weights_1),
    .io_in_0_bits_weights_2(arbiter_io_in_0_bits_weights_2),
    .io_in_0_bits_weights_3(arbiter_io_in_0_bits_weights_3),
    .io_in_0_bits_weights_4(arbiter_io_in_0_bits_weights_4),
    .io_in_0_bits_last(arbiter_io_in_0_bits_last),
    .io_in_1_ready(arbiter_io_in_1_ready),
    .io_in_1_valid(arbiter_io_in_1_valid),
    .io_in_1_bits_features_0(arbiter_io_in_1_bits_features_0),
    .io_in_1_bits_features_1(arbiter_io_in_1_bits_features_1),
    .io_in_1_bits_features_2(arbiter_io_in_1_bits_features_2),
    .io_in_1_bits_features_3(arbiter_io_in_1_bits_features_3),
    .io_in_1_bits_features_4(arbiter_io_in_1_bits_features_4),
    .io_in_1_bits_offset(arbiter_io_in_1_bits_offset),
    .io_in_1_bits_search_for_root(arbiter_io_in_1_bits_search_for_root),
    .io_in_1_bits_tree_to_exec(arbiter_io_in_1_bits_tree_to_exec),
    .io_in_1_bits_scores_0(arbiter_io_in_1_bits_scores_0),
    .io_in_1_bits_scores_1(arbiter_io_in_1_bits_scores_1),
    .io_in_1_bits_scores_2(arbiter_io_in_1_bits_scores_2),
    .io_in_1_bits_scores_3(arbiter_io_in_1_bits_scores_3),
    .io_in_1_bits_weights_0(arbiter_io_in_1_bits_weights_0),
    .io_in_1_bits_weights_1(arbiter_io_in_1_bits_weights_1),
    .io_in_1_bits_weights_2(arbiter_io_in_1_bits_weights_2),
    .io_in_1_bits_weights_3(arbiter_io_in_1_bits_weights_3),
    .io_in_1_bits_weights_4(arbiter_io_in_1_bits_weights_4),
    .io_in_1_bits_last(arbiter_io_in_1_bits_last),
    .io_out_ready(arbiter_io_out_ready),
    .io_out_valid(arbiter_io_out_valid),
    .io_out_bits_features_0(arbiter_io_out_bits_features_0),
    .io_out_bits_features_1(arbiter_io_out_bits_features_1),
    .io_out_bits_features_2(arbiter_io_out_bits_features_2),
    .io_out_bits_features_3(arbiter_io_out_bits_features_3),
    .io_out_bits_features_4(arbiter_io_out_bits_features_4),
    .io_out_bits_offset(arbiter_io_out_bits_offset),
    .io_out_bits_search_for_root(arbiter_io_out_bits_search_for_root),
    .io_out_bits_tree_to_exec(arbiter_io_out_bits_tree_to_exec),
    .io_out_bits_scores_0(arbiter_io_out_bits_scores_0),
    .io_out_bits_scores_1(arbiter_io_out_bits_scores_1),
    .io_out_bits_scores_2(arbiter_io_out_bits_scores_2),
    .io_out_bits_scores_3(arbiter_io_out_bits_scores_3),
    .io_out_bits_weights_0(arbiter_io_out_bits_weights_0),
    .io_out_bits_weights_1(arbiter_io_out_bits_weights_1),
    .io_out_bits_weights_2(arbiter_io_out_bits_weights_2),
    .io_out_bits_weights_3(arbiter_io_out_bits_weights_3),
    .io_out_bits_weights_4(arbiter_io_out_bits_weights_4),
    .io_out_bits_last(arbiter_io_out_bits_last),
    .io_chosen(arbiter_io_chosen)
  );
  assign io_sample_entering_ready = queue_entering_io_enq_ready; // @[Decoupled.scala 381:17]
  assign io_sample_looping_ready = queue_looping_io_enq_ready; // @[Decoupled.scala 381:17]
  assign io_sample_out_valid = arbiter_io_out_valid; // @[Interconnect.scala 67:19]
  assign io_sample_out_bits_features_0 = arbiter_io_out_bits_features_0; // @[Interconnect.scala 67:19]
  assign io_sample_out_bits_features_1 = arbiter_io_out_bits_features_1; // @[Interconnect.scala 67:19]
  assign io_sample_out_bits_features_2 = arbiter_io_out_bits_features_2; // @[Interconnect.scala 67:19]
  assign io_sample_out_bits_features_3 = arbiter_io_out_bits_features_3; // @[Interconnect.scala 67:19]
  assign io_sample_out_bits_features_4 = arbiter_io_out_bits_features_4; // @[Interconnect.scala 67:19]
  assign io_sample_out_bits_offset = arbiter_io_out_bits_offset; // @[Interconnect.scala 67:19]
  assign io_sample_out_bits_search_for_root = arbiter_io_out_bits_search_for_root; // @[Interconnect.scala 67:19]
  assign io_sample_out_bits_tree_to_exec = arbiter_io_out_bits_tree_to_exec; // @[Interconnect.scala 67:19]
  assign io_sample_out_bits_scores_0 = arbiter_io_out_bits_scores_0; // @[Interconnect.scala 67:19]
  assign io_sample_out_bits_scores_1 = arbiter_io_out_bits_scores_1; // @[Interconnect.scala 67:19]
  assign io_sample_out_bits_scores_2 = arbiter_io_out_bits_scores_2; // @[Interconnect.scala 67:19]
  assign io_sample_out_bits_scores_3 = arbiter_io_out_bits_scores_3; // @[Interconnect.scala 67:19]
  assign io_sample_out_bits_weights_0 = arbiter_io_out_bits_weights_0; // @[Interconnect.scala 67:19]
  assign io_sample_out_bits_weights_1 = arbiter_io_out_bits_weights_1; // @[Interconnect.scala 67:19]
  assign io_sample_out_bits_weights_2 = arbiter_io_out_bits_weights_2; // @[Interconnect.scala 67:19]
  assign io_sample_out_bits_weights_3 = arbiter_io_out_bits_weights_3; // @[Interconnect.scala 67:19]
  assign io_sample_out_bits_weights_4 = arbiter_io_out_bits_weights_4; // @[Interconnect.scala 67:19]
  assign io_sample_out_bits_last = arbiter_io_out_bits_last; // @[Interconnect.scala 67:19]
  assign queue_entering_clock = clock;
  assign queue_entering_reset = reset;
  assign queue_entering_io_enq_valid = io_sample_entering_valid; // @[Decoupled.scala 379:22]
  assign queue_entering_io_enq_bits_features_0 = io_sample_entering_bits_features_0; // @[Decoupled.scala 380:21]
  assign queue_entering_io_enq_bits_features_1 = io_sample_entering_bits_features_1; // @[Decoupled.scala 380:21]
  assign queue_entering_io_enq_bits_features_2 = io_sample_entering_bits_features_2; // @[Decoupled.scala 380:21]
  assign queue_entering_io_enq_bits_features_3 = io_sample_entering_bits_features_3; // @[Decoupled.scala 380:21]
  assign queue_entering_io_enq_bits_features_4 = io_sample_entering_bits_features_4; // @[Decoupled.scala 380:21]
  assign queue_entering_io_enq_bits_offset = io_sample_entering_bits_offset; // @[Decoupled.scala 380:21]
  assign queue_entering_io_enq_bits_search_for_root = io_sample_entering_bits_search_for_root; // @[Decoupled.scala 380:21]
  assign queue_entering_io_enq_bits_tree_to_exec = io_sample_entering_bits_tree_to_exec; // @[Decoupled.scala 380:21]
  assign queue_entering_io_enq_bits_scores_0 = io_sample_entering_bits_scores_0; // @[Decoupled.scala 380:21]
  assign queue_entering_io_enq_bits_scores_1 = io_sample_entering_bits_scores_1; // @[Decoupled.scala 380:21]
  assign queue_entering_io_enq_bits_scores_2 = io_sample_entering_bits_scores_2; // @[Decoupled.scala 380:21]
  assign queue_entering_io_enq_bits_scores_3 = io_sample_entering_bits_scores_3; // @[Decoupled.scala 380:21]
  assign queue_entering_io_enq_bits_weights_0 = io_sample_entering_bits_weights_0; // @[Decoupled.scala 380:21]
  assign queue_entering_io_enq_bits_weights_1 = io_sample_entering_bits_weights_1; // @[Decoupled.scala 380:21]
  assign queue_entering_io_enq_bits_weights_2 = io_sample_entering_bits_weights_2; // @[Decoupled.scala 380:21]
  assign queue_entering_io_enq_bits_weights_3 = io_sample_entering_bits_weights_3; // @[Decoupled.scala 380:21]
  assign queue_entering_io_enq_bits_weights_4 = io_sample_entering_bits_weights_4; // @[Decoupled.scala 380:21]
  assign queue_entering_io_enq_bits_last = io_sample_entering_bits_last; // @[Decoupled.scala 380:21]
  assign queue_entering_io_deq_ready = arbiter_io_in_0_ready; // @[Interconnect.scala 65:22]
  assign queue_looping_clock = clock;
  assign queue_looping_reset = reset;
  assign queue_looping_io_enq_valid = io_sample_looping_valid; // @[Decoupled.scala 379:22]
  assign queue_looping_io_enq_bits_features_0 = io_sample_looping_bits_features_0; // @[Decoupled.scala 380:21]
  assign queue_looping_io_enq_bits_features_1 = io_sample_looping_bits_features_1; // @[Decoupled.scala 380:21]
  assign queue_looping_io_enq_bits_features_2 = io_sample_looping_bits_features_2; // @[Decoupled.scala 380:21]
  assign queue_looping_io_enq_bits_features_3 = io_sample_looping_bits_features_3; // @[Decoupled.scala 380:21]
  assign queue_looping_io_enq_bits_features_4 = io_sample_looping_bits_features_4; // @[Decoupled.scala 380:21]
  assign queue_looping_io_enq_bits_offset = io_sample_looping_bits_offset; // @[Decoupled.scala 380:21]
  assign queue_looping_io_enq_bits_search_for_root = io_sample_looping_bits_search_for_root; // @[Decoupled.scala 380:21]
  assign queue_looping_io_enq_bits_tree_to_exec = io_sample_looping_bits_tree_to_exec; // @[Decoupled.scala 380:21]
  assign queue_looping_io_enq_bits_scores_0 = io_sample_looping_bits_scores_0; // @[Decoupled.scala 380:21]
  assign queue_looping_io_enq_bits_scores_1 = io_sample_looping_bits_scores_1; // @[Decoupled.scala 380:21]
  assign queue_looping_io_enq_bits_scores_2 = io_sample_looping_bits_scores_2; // @[Decoupled.scala 380:21]
  assign queue_looping_io_enq_bits_scores_3 = io_sample_looping_bits_scores_3; // @[Decoupled.scala 380:21]
  assign queue_looping_io_enq_bits_weights_0 = io_sample_looping_bits_weights_0; // @[Decoupled.scala 380:21]
  assign queue_looping_io_enq_bits_weights_1 = io_sample_looping_bits_weights_1; // @[Decoupled.scala 380:21]
  assign queue_looping_io_enq_bits_weights_2 = io_sample_looping_bits_weights_2; // @[Decoupled.scala 380:21]
  assign queue_looping_io_enq_bits_weights_3 = io_sample_looping_bits_weights_3; // @[Decoupled.scala 380:21]
  assign queue_looping_io_enq_bits_weights_4 = io_sample_looping_bits_weights_4; // @[Decoupled.scala 380:21]
  assign queue_looping_io_enq_bits_last = io_sample_looping_bits_last; // @[Decoupled.scala 380:21]
  assign queue_looping_io_deq_ready = arbiter_io_in_1_ready; // @[Interconnect.scala 66:22]
  assign arbiter_clock = clock;
  assign arbiter_io_in_0_valid = queue_entering_io_deq_valid; // @[Interconnect.scala 65:22]
  assign arbiter_io_in_0_bits_features_0 = queue_entering_io_deq_bits_features_0; // @[Interconnect.scala 65:22]
  assign arbiter_io_in_0_bits_features_1 = queue_entering_io_deq_bits_features_1; // @[Interconnect.scala 65:22]
  assign arbiter_io_in_0_bits_features_2 = queue_entering_io_deq_bits_features_2; // @[Interconnect.scala 65:22]
  assign arbiter_io_in_0_bits_features_3 = queue_entering_io_deq_bits_features_3; // @[Interconnect.scala 65:22]
  assign arbiter_io_in_0_bits_features_4 = queue_entering_io_deq_bits_features_4; // @[Interconnect.scala 65:22]
  assign arbiter_io_in_0_bits_offset = queue_entering_io_deq_bits_offset; // @[Interconnect.scala 65:22]
  assign arbiter_io_in_0_bits_search_for_root = queue_entering_io_deq_bits_search_for_root; // @[Interconnect.scala 65:22]
  assign arbiter_io_in_0_bits_tree_to_exec = queue_entering_io_deq_bits_tree_to_exec; // @[Interconnect.scala 65:22]
  assign arbiter_io_in_0_bits_scores_0 = queue_entering_io_deq_bits_scores_0; // @[Interconnect.scala 65:22]
  assign arbiter_io_in_0_bits_scores_1 = queue_entering_io_deq_bits_scores_1; // @[Interconnect.scala 65:22]
  assign arbiter_io_in_0_bits_scores_2 = queue_entering_io_deq_bits_scores_2; // @[Interconnect.scala 65:22]
  assign arbiter_io_in_0_bits_scores_3 = queue_entering_io_deq_bits_scores_3; // @[Interconnect.scala 65:22]
  assign arbiter_io_in_0_bits_weights_0 = queue_entering_io_deq_bits_weights_0; // @[Interconnect.scala 65:22]
  assign arbiter_io_in_0_bits_weights_1 = queue_entering_io_deq_bits_weights_1; // @[Interconnect.scala 65:22]
  assign arbiter_io_in_0_bits_weights_2 = queue_entering_io_deq_bits_weights_2; // @[Interconnect.scala 65:22]
  assign arbiter_io_in_0_bits_weights_3 = queue_entering_io_deq_bits_weights_3; // @[Interconnect.scala 65:22]
  assign arbiter_io_in_0_bits_weights_4 = queue_entering_io_deq_bits_weights_4; // @[Interconnect.scala 65:22]
  assign arbiter_io_in_0_bits_last = queue_entering_io_deq_bits_last; // @[Interconnect.scala 65:22]
  assign arbiter_io_in_1_valid = queue_looping_io_deq_valid; // @[Interconnect.scala 66:22]
  assign arbiter_io_in_1_bits_features_0 = queue_looping_io_deq_bits_features_0; // @[Interconnect.scala 66:22]
  assign arbiter_io_in_1_bits_features_1 = queue_looping_io_deq_bits_features_1; // @[Interconnect.scala 66:22]
  assign arbiter_io_in_1_bits_features_2 = queue_looping_io_deq_bits_features_2; // @[Interconnect.scala 66:22]
  assign arbiter_io_in_1_bits_features_3 = queue_looping_io_deq_bits_features_3; // @[Interconnect.scala 66:22]
  assign arbiter_io_in_1_bits_features_4 = queue_looping_io_deq_bits_features_4; // @[Interconnect.scala 66:22]
  assign arbiter_io_in_1_bits_offset = queue_looping_io_deq_bits_offset; // @[Interconnect.scala 66:22]
  assign arbiter_io_in_1_bits_search_for_root = queue_looping_io_deq_bits_search_for_root; // @[Interconnect.scala 66:22]
  assign arbiter_io_in_1_bits_tree_to_exec = queue_looping_io_deq_bits_tree_to_exec; // @[Interconnect.scala 66:22]
  assign arbiter_io_in_1_bits_scores_0 = queue_looping_io_deq_bits_scores_0; // @[Interconnect.scala 66:22]
  assign arbiter_io_in_1_bits_scores_1 = queue_looping_io_deq_bits_scores_1; // @[Interconnect.scala 66:22]
  assign arbiter_io_in_1_bits_scores_2 = queue_looping_io_deq_bits_scores_2; // @[Interconnect.scala 66:22]
  assign arbiter_io_in_1_bits_scores_3 = queue_looping_io_deq_bits_scores_3; // @[Interconnect.scala 66:22]
  assign arbiter_io_in_1_bits_weights_0 = queue_looping_io_deq_bits_weights_0; // @[Interconnect.scala 66:22]
  assign arbiter_io_in_1_bits_weights_1 = queue_looping_io_deq_bits_weights_1; // @[Interconnect.scala 66:22]
  assign arbiter_io_in_1_bits_weights_2 = queue_looping_io_deq_bits_weights_2; // @[Interconnect.scala 66:22]
  assign arbiter_io_in_1_bits_weights_3 = queue_looping_io_deq_bits_weights_3; // @[Interconnect.scala 66:22]
  assign arbiter_io_in_1_bits_weights_4 = queue_looping_io_deq_bits_weights_4; // @[Interconnect.scala 66:22]
  assign arbiter_io_in_1_bits_last = queue_looping_io_deq_bits_last; // @[Interconnect.scala 66:22]
  assign arbiter_io_out_ready = io_sample_out_ready; // @[Interconnect.scala 67:19]
endmodule
module Queue_33(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [31:0] io_enq_bits_features_0,
  input  [31:0] io_enq_bits_features_1,
  input  [31:0] io_enq_bits_features_2,
  input  [31:0] io_enq_bits_features_3,
  input  [31:0] io_enq_bits_features_4,
  input  [9:0]  io_enq_bits_offset,
  input         io_enq_bits_search_for_root,
  input  [7:0]  io_enq_bits_tree_to_exec,
  input  [31:0] io_enq_bits_scores_0,
  input  [31:0] io_enq_bits_scores_1,
  input  [31:0] io_enq_bits_scores_2,
  input  [31:0] io_enq_bits_scores_3,
  input  [31:0] io_enq_bits_weights_0,
  input  [31:0] io_enq_bits_weights_1,
  input  [31:0] io_enq_bits_weights_2,
  input  [31:0] io_enq_bits_weights_3,
  input  [31:0] io_enq_bits_weights_4,
  input         io_enq_bits_dest,
  input         io_enq_bits_last,
  input         io_deq_ready,
  output        io_deq_valid,
  output [31:0] io_deq_bits_features_0,
  output [31:0] io_deq_bits_features_1,
  output [31:0] io_deq_bits_features_2,
  output [31:0] io_deq_bits_features_3,
  output [31:0] io_deq_bits_features_4,
  output [9:0]  io_deq_bits_offset,
  output        io_deq_bits_shift,
  output        io_deq_bits_search_for_root,
  output [7:0]  io_deq_bits_tree_to_exec,
  output [31:0] io_deq_bits_scores_0,
  output [31:0] io_deq_bits_scores_1,
  output [31:0] io_deq_bits_scores_2,
  output [31:0] io_deq_bits_scores_3,
  output [31:0] io_deq_bits_weights_0,
  output [31:0] io_deq_bits_weights_1,
  output [31:0] io_deq_bits_weights_2,
  output [31:0] io_deq_bits_weights_3,
  output [31:0] io_deq_bits_weights_4,
  output        io_deq_bits_dest,
  output        io_deq_bits_last
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] ram_features_0 [0:3]; // @[Decoupled.scala 275:95]
  wire  ram_features_0_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [1:0] ram_features_0_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_features_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_features_0_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_features_0_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_features_0_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_features_0_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_features_1 [0:3]; // @[Decoupled.scala 275:95]
  wire  ram_features_1_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [1:0] ram_features_1_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_features_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_features_1_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_features_1_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_features_1_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_features_1_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_features_2 [0:3]; // @[Decoupled.scala 275:95]
  wire  ram_features_2_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [1:0] ram_features_2_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_features_2_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_features_2_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_features_2_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_features_2_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_features_2_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_features_3 [0:3]; // @[Decoupled.scala 275:95]
  wire  ram_features_3_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [1:0] ram_features_3_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_features_3_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_features_3_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_features_3_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_features_3_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_features_3_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_features_4 [0:3]; // @[Decoupled.scala 275:95]
  wire  ram_features_4_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [1:0] ram_features_4_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_features_4_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_features_4_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_features_4_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_features_4_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_features_4_MPORT_en; // @[Decoupled.scala 275:95]
  reg [9:0] ram_offset [0:3]; // @[Decoupled.scala 275:95]
  wire  ram_offset_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [1:0] ram_offset_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [9:0] ram_offset_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [9:0] ram_offset_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_offset_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_offset_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_offset_MPORT_en; // @[Decoupled.scala 275:95]
  reg  ram_shift [0:3]; // @[Decoupled.scala 275:95]
  wire  ram_shift_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [1:0] ram_shift_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_shift_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire  ram_shift_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_shift_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_shift_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_shift_MPORT_en; // @[Decoupled.scala 275:95]
  reg  ram_search_for_root [0:3]; // @[Decoupled.scala 275:95]
  wire  ram_search_for_root_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [1:0] ram_search_for_root_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_search_for_root_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire  ram_search_for_root_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_search_for_root_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_search_for_root_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_search_for_root_MPORT_en; // @[Decoupled.scala 275:95]
  reg [7:0] ram_tree_to_exec [0:3]; // @[Decoupled.scala 275:95]
  wire  ram_tree_to_exec_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [1:0] ram_tree_to_exec_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [7:0] ram_tree_to_exec_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [7:0] ram_tree_to_exec_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_tree_to_exec_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_tree_to_exec_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_tree_to_exec_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_scores_0 [0:3]; // @[Decoupled.scala 275:95]
  wire  ram_scores_0_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [1:0] ram_scores_0_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_scores_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_scores_0_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_scores_0_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_scores_0_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_scores_0_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_scores_1 [0:3]; // @[Decoupled.scala 275:95]
  wire  ram_scores_1_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [1:0] ram_scores_1_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_scores_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_scores_1_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_scores_1_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_scores_1_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_scores_1_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_scores_2 [0:3]; // @[Decoupled.scala 275:95]
  wire  ram_scores_2_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [1:0] ram_scores_2_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_scores_2_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_scores_2_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_scores_2_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_scores_2_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_scores_2_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_scores_3 [0:3]; // @[Decoupled.scala 275:95]
  wire  ram_scores_3_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [1:0] ram_scores_3_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_scores_3_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_scores_3_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_scores_3_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_scores_3_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_scores_3_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_weights_0 [0:3]; // @[Decoupled.scala 275:95]
  wire  ram_weights_0_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [1:0] ram_weights_0_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_weights_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_weights_0_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_weights_0_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_weights_0_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_weights_0_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_weights_1 [0:3]; // @[Decoupled.scala 275:95]
  wire  ram_weights_1_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [1:0] ram_weights_1_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_weights_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_weights_1_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_weights_1_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_weights_1_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_weights_1_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_weights_2 [0:3]; // @[Decoupled.scala 275:95]
  wire  ram_weights_2_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [1:0] ram_weights_2_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_weights_2_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_weights_2_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_weights_2_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_weights_2_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_weights_2_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_weights_3 [0:3]; // @[Decoupled.scala 275:95]
  wire  ram_weights_3_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [1:0] ram_weights_3_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_weights_3_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_weights_3_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_weights_3_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_weights_3_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_weights_3_MPORT_en; // @[Decoupled.scala 275:95]
  reg [31:0] ram_weights_4 [0:3]; // @[Decoupled.scala 275:95]
  wire  ram_weights_4_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [1:0] ram_weights_4_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_weights_4_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_weights_4_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_weights_4_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_weights_4_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_weights_4_MPORT_en; // @[Decoupled.scala 275:95]
  reg  ram_dest [0:3]; // @[Decoupled.scala 275:95]
  wire  ram_dest_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [1:0] ram_dest_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_dest_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire  ram_dest_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_dest_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_dest_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_dest_MPORT_en; // @[Decoupled.scala 275:95]
  reg  ram_last [0:3]; // @[Decoupled.scala 275:95]
  wire  ram_last_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [1:0] ram_last_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_last_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire  ram_last_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_last_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_last_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_last_MPORT_en; // @[Decoupled.scala 275:95]
  reg [1:0] enq_ptr_value; // @[Counter.scala 61:40]
  reg [1:0] deq_ptr_value; // @[Counter.scala 61:40]
  reg  maybe_full; // @[Decoupled.scala 278:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[Decoupled.scala 279:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 280:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 281:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 52:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 52:35]
  wire [1:0] _value_T_1 = enq_ptr_value + 2'h1; // @[Counter.scala 77:24]
  wire [1:0] _value_T_3 = deq_ptr_value + 2'h1; // @[Counter.scala 77:24]
  assign ram_features_0_io_deq_bits_MPORT_en = 1'h1;
  assign ram_features_0_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_features_0_io_deq_bits_MPORT_data = ram_features_0[ram_features_0_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_features_0_MPORT_data = io_enq_bits_features_0;
  assign ram_features_0_MPORT_addr = enq_ptr_value;
  assign ram_features_0_MPORT_mask = 1'h1;
  assign ram_features_0_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_features_1_io_deq_bits_MPORT_en = 1'h1;
  assign ram_features_1_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_features_1_io_deq_bits_MPORT_data = ram_features_1[ram_features_1_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_features_1_MPORT_data = io_enq_bits_features_1;
  assign ram_features_1_MPORT_addr = enq_ptr_value;
  assign ram_features_1_MPORT_mask = 1'h1;
  assign ram_features_1_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_features_2_io_deq_bits_MPORT_en = 1'h1;
  assign ram_features_2_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_features_2_io_deq_bits_MPORT_data = ram_features_2[ram_features_2_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_features_2_MPORT_data = io_enq_bits_features_2;
  assign ram_features_2_MPORT_addr = enq_ptr_value;
  assign ram_features_2_MPORT_mask = 1'h1;
  assign ram_features_2_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_features_3_io_deq_bits_MPORT_en = 1'h1;
  assign ram_features_3_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_features_3_io_deq_bits_MPORT_data = ram_features_3[ram_features_3_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_features_3_MPORT_data = io_enq_bits_features_3;
  assign ram_features_3_MPORT_addr = enq_ptr_value;
  assign ram_features_3_MPORT_mask = 1'h1;
  assign ram_features_3_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_features_4_io_deq_bits_MPORT_en = 1'h1;
  assign ram_features_4_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_features_4_io_deq_bits_MPORT_data = ram_features_4[ram_features_4_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_features_4_MPORT_data = io_enq_bits_features_4;
  assign ram_features_4_MPORT_addr = enq_ptr_value;
  assign ram_features_4_MPORT_mask = 1'h1;
  assign ram_features_4_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_offset_io_deq_bits_MPORT_en = 1'h1;
  assign ram_offset_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_offset_io_deq_bits_MPORT_data = ram_offset[ram_offset_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_offset_MPORT_data = io_enq_bits_offset;
  assign ram_offset_MPORT_addr = enq_ptr_value;
  assign ram_offset_MPORT_mask = 1'h1;
  assign ram_offset_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_shift_io_deq_bits_MPORT_en = 1'h1;
  assign ram_shift_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_shift_io_deq_bits_MPORT_data = ram_shift[ram_shift_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_shift_MPORT_data = 1'h0;
  assign ram_shift_MPORT_addr = enq_ptr_value;
  assign ram_shift_MPORT_mask = 1'h1;
  assign ram_shift_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_search_for_root_io_deq_bits_MPORT_en = 1'h1;
  assign ram_search_for_root_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_search_for_root_io_deq_bits_MPORT_data = ram_search_for_root[ram_search_for_root_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_search_for_root_MPORT_data = io_enq_bits_search_for_root;
  assign ram_search_for_root_MPORT_addr = enq_ptr_value;
  assign ram_search_for_root_MPORT_mask = 1'h1;
  assign ram_search_for_root_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_tree_to_exec_io_deq_bits_MPORT_en = 1'h1;
  assign ram_tree_to_exec_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_tree_to_exec_io_deq_bits_MPORT_data = ram_tree_to_exec[ram_tree_to_exec_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_tree_to_exec_MPORT_data = io_enq_bits_tree_to_exec;
  assign ram_tree_to_exec_MPORT_addr = enq_ptr_value;
  assign ram_tree_to_exec_MPORT_mask = 1'h1;
  assign ram_tree_to_exec_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_scores_0_io_deq_bits_MPORT_en = 1'h1;
  assign ram_scores_0_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_scores_0_io_deq_bits_MPORT_data = ram_scores_0[ram_scores_0_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_scores_0_MPORT_data = io_enq_bits_scores_0;
  assign ram_scores_0_MPORT_addr = enq_ptr_value;
  assign ram_scores_0_MPORT_mask = 1'h1;
  assign ram_scores_0_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_scores_1_io_deq_bits_MPORT_en = 1'h1;
  assign ram_scores_1_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_scores_1_io_deq_bits_MPORT_data = ram_scores_1[ram_scores_1_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_scores_1_MPORT_data = io_enq_bits_scores_1;
  assign ram_scores_1_MPORT_addr = enq_ptr_value;
  assign ram_scores_1_MPORT_mask = 1'h1;
  assign ram_scores_1_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_scores_2_io_deq_bits_MPORT_en = 1'h1;
  assign ram_scores_2_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_scores_2_io_deq_bits_MPORT_data = ram_scores_2[ram_scores_2_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_scores_2_MPORT_data = io_enq_bits_scores_2;
  assign ram_scores_2_MPORT_addr = enq_ptr_value;
  assign ram_scores_2_MPORT_mask = 1'h1;
  assign ram_scores_2_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_scores_3_io_deq_bits_MPORT_en = 1'h1;
  assign ram_scores_3_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_scores_3_io_deq_bits_MPORT_data = ram_scores_3[ram_scores_3_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_scores_3_MPORT_data = io_enq_bits_scores_3;
  assign ram_scores_3_MPORT_addr = enq_ptr_value;
  assign ram_scores_3_MPORT_mask = 1'h1;
  assign ram_scores_3_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_weights_0_io_deq_bits_MPORT_en = 1'h1;
  assign ram_weights_0_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_weights_0_io_deq_bits_MPORT_data = ram_weights_0[ram_weights_0_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_weights_0_MPORT_data = io_enq_bits_weights_0;
  assign ram_weights_0_MPORT_addr = enq_ptr_value;
  assign ram_weights_0_MPORT_mask = 1'h1;
  assign ram_weights_0_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_weights_1_io_deq_bits_MPORT_en = 1'h1;
  assign ram_weights_1_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_weights_1_io_deq_bits_MPORT_data = ram_weights_1[ram_weights_1_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_weights_1_MPORT_data = io_enq_bits_weights_1;
  assign ram_weights_1_MPORT_addr = enq_ptr_value;
  assign ram_weights_1_MPORT_mask = 1'h1;
  assign ram_weights_1_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_weights_2_io_deq_bits_MPORT_en = 1'h1;
  assign ram_weights_2_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_weights_2_io_deq_bits_MPORT_data = ram_weights_2[ram_weights_2_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_weights_2_MPORT_data = io_enq_bits_weights_2;
  assign ram_weights_2_MPORT_addr = enq_ptr_value;
  assign ram_weights_2_MPORT_mask = 1'h1;
  assign ram_weights_2_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_weights_3_io_deq_bits_MPORT_en = 1'h1;
  assign ram_weights_3_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_weights_3_io_deq_bits_MPORT_data = ram_weights_3[ram_weights_3_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_weights_3_MPORT_data = io_enq_bits_weights_3;
  assign ram_weights_3_MPORT_addr = enq_ptr_value;
  assign ram_weights_3_MPORT_mask = 1'h1;
  assign ram_weights_3_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_weights_4_io_deq_bits_MPORT_en = 1'h1;
  assign ram_weights_4_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_weights_4_io_deq_bits_MPORT_data = ram_weights_4[ram_weights_4_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_weights_4_MPORT_data = io_enq_bits_weights_4;
  assign ram_weights_4_MPORT_addr = enq_ptr_value;
  assign ram_weights_4_MPORT_mask = 1'h1;
  assign ram_weights_4_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_dest_io_deq_bits_MPORT_en = 1'h1;
  assign ram_dest_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_dest_io_deq_bits_MPORT_data = ram_dest[ram_dest_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_dest_MPORT_data = io_enq_bits_dest;
  assign ram_dest_MPORT_addr = enq_ptr_value;
  assign ram_dest_MPORT_mask = 1'h1;
  assign ram_dest_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_last_io_deq_bits_MPORT_en = 1'h1;
  assign ram_last_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_last_io_deq_bits_MPORT_data = ram_last[ram_last_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_last_MPORT_data = io_enq_bits_last;
  assign ram_last_MPORT_addr = enq_ptr_value;
  assign ram_last_MPORT_mask = 1'h1;
  assign ram_last_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 305:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 304:19]
  assign io_deq_bits_features_0 = ram_features_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_features_1 = ram_features_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_features_2 = ram_features_2_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_features_3 = ram_features_3_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_features_4 = ram_features_4_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_offset = ram_offset_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_shift = ram_shift_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_search_for_root = ram_search_for_root_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_tree_to_exec = ram_tree_to_exec_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_scores_0 = ram_scores_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_scores_1 = ram_scores_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_scores_2 = ram_scores_2_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_scores_3 = ram_scores_3_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_weights_0 = ram_weights_0_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_weights_1 = ram_weights_1_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_weights_2 = ram_weights_2_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_weights_3 = ram_weights_3_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_weights_4 = ram_weights_4_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_dest = ram_dest_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_last = ram_last_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  always @(posedge clock) begin
    if (ram_features_0_MPORT_en & ram_features_0_MPORT_mask) begin
      ram_features_0[ram_features_0_MPORT_addr] <= ram_features_0_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_features_1_MPORT_en & ram_features_1_MPORT_mask) begin
      ram_features_1[ram_features_1_MPORT_addr] <= ram_features_1_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_features_2_MPORT_en & ram_features_2_MPORT_mask) begin
      ram_features_2[ram_features_2_MPORT_addr] <= ram_features_2_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_features_3_MPORT_en & ram_features_3_MPORT_mask) begin
      ram_features_3[ram_features_3_MPORT_addr] <= ram_features_3_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_features_4_MPORT_en & ram_features_4_MPORT_mask) begin
      ram_features_4[ram_features_4_MPORT_addr] <= ram_features_4_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_offset_MPORT_en & ram_offset_MPORT_mask) begin
      ram_offset[ram_offset_MPORT_addr] <= ram_offset_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_shift_MPORT_en & ram_shift_MPORT_mask) begin
      ram_shift[ram_shift_MPORT_addr] <= ram_shift_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_search_for_root_MPORT_en & ram_search_for_root_MPORT_mask) begin
      ram_search_for_root[ram_search_for_root_MPORT_addr] <= ram_search_for_root_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_tree_to_exec_MPORT_en & ram_tree_to_exec_MPORT_mask) begin
      ram_tree_to_exec[ram_tree_to_exec_MPORT_addr] <= ram_tree_to_exec_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_scores_0_MPORT_en & ram_scores_0_MPORT_mask) begin
      ram_scores_0[ram_scores_0_MPORT_addr] <= ram_scores_0_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_scores_1_MPORT_en & ram_scores_1_MPORT_mask) begin
      ram_scores_1[ram_scores_1_MPORT_addr] <= ram_scores_1_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_scores_2_MPORT_en & ram_scores_2_MPORT_mask) begin
      ram_scores_2[ram_scores_2_MPORT_addr] <= ram_scores_2_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_scores_3_MPORT_en & ram_scores_3_MPORT_mask) begin
      ram_scores_3[ram_scores_3_MPORT_addr] <= ram_scores_3_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_weights_0_MPORT_en & ram_weights_0_MPORT_mask) begin
      ram_weights_0[ram_weights_0_MPORT_addr] <= ram_weights_0_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_weights_1_MPORT_en & ram_weights_1_MPORT_mask) begin
      ram_weights_1[ram_weights_1_MPORT_addr] <= ram_weights_1_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_weights_2_MPORT_en & ram_weights_2_MPORT_mask) begin
      ram_weights_2[ram_weights_2_MPORT_addr] <= ram_weights_2_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_weights_3_MPORT_en & ram_weights_3_MPORT_mask) begin
      ram_weights_3[ram_weights_3_MPORT_addr] <= ram_weights_3_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_weights_4_MPORT_en & ram_weights_4_MPORT_mask) begin
      ram_weights_4[ram_weights_4_MPORT_addr] <= ram_weights_4_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_dest_MPORT_en & ram_dest_MPORT_mask) begin
      ram_dest[ram_dest_MPORT_addr] <= ram_dest_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_last_MPORT_en & ram_last_MPORT_mask) begin
      ram_last[ram_last_MPORT_addr] <= ram_last_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (reset) begin // @[Counter.scala 61:40]
      enq_ptr_value <= 2'h0; // @[Counter.scala 61:40]
    end else if (do_enq) begin // @[Decoupled.scala 288:16]
      enq_ptr_value <= _value_T_1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Counter.scala 61:40]
      deq_ptr_value <= 2'h0; // @[Counter.scala 61:40]
    end else if (do_deq) begin // @[Decoupled.scala 292:16]
      deq_ptr_value <= _value_T_3; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Decoupled.scala 278:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 278:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 295:27]
      maybe_full <= do_enq; // @[Decoupled.scala 296:16]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_features_0[initvar] = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_features_1[initvar] = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_features_2[initvar] = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_features_3[initvar] = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_features_4[initvar] = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_offset[initvar] = _RAND_5[9:0];
  _RAND_6 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_shift[initvar] = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_search_for_root[initvar] = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_tree_to_exec[initvar] = _RAND_8[7:0];
  _RAND_9 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_scores_0[initvar] = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_scores_1[initvar] = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_scores_2[initvar] = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_scores_3[initvar] = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_weights_0[initvar] = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_weights_1[initvar] = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_weights_2[initvar] = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_weights_3[initvar] = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_weights_4[initvar] = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_dest[initvar] = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_last[initvar] = _RAND_19[0:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  enq_ptr_value = _RAND_20[1:0];
  _RAND_21 = {1{`RANDOM}};
  deq_ptr_value = _RAND_21[1:0];
  _RAND_22 = {1{`RANDOM}};
  maybe_full = _RAND_22[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module LastInterconnectPE(
  input         clock,
  input         reset,
  output        io_sample_in_ready,
  input         io_sample_in_valid,
  input  [31:0] io_sample_in_bits_features_0,
  input  [31:0] io_sample_in_bits_features_1,
  input  [31:0] io_sample_in_bits_features_2,
  input  [31:0] io_sample_in_bits_features_3,
  input  [31:0] io_sample_in_bits_features_4,
  input  [9:0]  io_sample_in_bits_offset,
  input         io_sample_in_bits_search_for_root,
  input  [7:0]  io_sample_in_bits_tree_to_exec,
  input  [31:0] io_sample_in_bits_scores_0,
  input  [31:0] io_sample_in_bits_scores_1,
  input  [31:0] io_sample_in_bits_scores_2,
  input  [31:0] io_sample_in_bits_scores_3,
  input  [31:0] io_sample_in_bits_weights_0,
  input  [31:0] io_sample_in_bits_weights_1,
  input  [31:0] io_sample_in_bits_weights_2,
  input  [31:0] io_sample_in_bits_weights_3,
  input  [31:0] io_sample_in_bits_weights_4,
  input         io_sample_in_bits_dest,
  input         io_sample_in_bits_last,
  input         io_sample_looping_ready,
  output        io_sample_looping_valid,
  output [31:0] io_sample_looping_bits_features_0,
  output [31:0] io_sample_looping_bits_features_1,
  output [31:0] io_sample_looping_bits_features_2,
  output [31:0] io_sample_looping_bits_features_3,
  output [31:0] io_sample_looping_bits_features_4,
  output [9:0]  io_sample_looping_bits_offset,
  output        io_sample_looping_bits_search_for_root,
  output [7:0]  io_sample_looping_bits_tree_to_exec,
  output [31:0] io_sample_looping_bits_scores_0,
  output [31:0] io_sample_looping_bits_scores_1,
  output [31:0] io_sample_looping_bits_scores_2,
  output [31:0] io_sample_looping_bits_scores_3,
  output [31:0] io_sample_looping_bits_weights_0,
  output [31:0] io_sample_looping_bits_weights_1,
  output [31:0] io_sample_looping_bits_weights_2,
  output [31:0] io_sample_looping_bits_weights_3,
  output [31:0] io_sample_looping_bits_weights_4,
  output        io_sample_looping_bits_last,
  input         io_sample_leaving_ready,
  output        io_sample_leaving_valid,
  output [31:0] io_sample_leaving_bits_features_0,
  output [31:0] io_sample_leaving_bits_features_1,
  output [31:0] io_sample_leaving_bits_features_2,
  output [31:0] io_sample_leaving_bits_features_3,
  output [31:0] io_sample_leaving_bits_features_4,
  output [9:0]  io_sample_leaving_bits_offset,
  output        io_sample_leaving_bits_shift,
  output        io_sample_leaving_bits_search_for_root,
  output [7:0]  io_sample_leaving_bits_tree_to_exec,
  output [31:0] io_sample_leaving_bits_scores_0,
  output [31:0] io_sample_leaving_bits_scores_1,
  output [31:0] io_sample_leaving_bits_scores_2,
  output [31:0] io_sample_leaving_bits_scores_3,
  output        io_sample_leaving_bits_last
);
  wire  queue_clock; // @[Decoupled.scala 377:21]
  wire  queue_reset; // @[Decoupled.scala 377:21]
  wire  queue_io_enq_ready; // @[Decoupled.scala 377:21]
  wire  queue_io_enq_valid; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_features_0; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_features_1; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_features_2; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_features_3; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_features_4; // @[Decoupled.scala 377:21]
  wire [9:0] queue_io_enq_bits_offset; // @[Decoupled.scala 377:21]
  wire  queue_io_enq_bits_search_for_root; // @[Decoupled.scala 377:21]
  wire [7:0] queue_io_enq_bits_tree_to_exec; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_scores_0; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_scores_1; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_scores_2; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_scores_3; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_weights_0; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_weights_1; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_weights_2; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_weights_3; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_weights_4; // @[Decoupled.scala 377:21]
  wire  queue_io_enq_bits_dest; // @[Decoupled.scala 377:21]
  wire  queue_io_enq_bits_last; // @[Decoupled.scala 377:21]
  wire  queue_io_deq_ready; // @[Decoupled.scala 377:21]
  wire  queue_io_deq_valid; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_features_0; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_features_1; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_features_2; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_features_3; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_features_4; // @[Decoupled.scala 377:21]
  wire [9:0] queue_io_deq_bits_offset; // @[Decoupled.scala 377:21]
  wire  queue_io_deq_bits_shift; // @[Decoupled.scala 377:21]
  wire  queue_io_deq_bits_search_for_root; // @[Decoupled.scala 377:21]
  wire [7:0] queue_io_deq_bits_tree_to_exec; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_scores_0; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_scores_1; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_scores_2; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_scores_3; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_weights_0; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_weights_1; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_weights_2; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_weights_3; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_weights_4; // @[Decoupled.scala 377:21]
  wire  queue_io_deq_bits_dest; // @[Decoupled.scala 377:21]
  wire  queue_io_deq_bits_last; // @[Decoupled.scala 377:21]
  wire  _io_sample_looping_valid_T = ~queue_io_deq_bits_dest; // @[Interconnect.scala 26:46]
  Queue_33 queue ( // @[Decoupled.scala 377:21]
    .clock(queue_clock),
    .reset(queue_reset),
    .io_enq_ready(queue_io_enq_ready),
    .io_enq_valid(queue_io_enq_valid),
    .io_enq_bits_features_0(queue_io_enq_bits_features_0),
    .io_enq_bits_features_1(queue_io_enq_bits_features_1),
    .io_enq_bits_features_2(queue_io_enq_bits_features_2),
    .io_enq_bits_features_3(queue_io_enq_bits_features_3),
    .io_enq_bits_features_4(queue_io_enq_bits_features_4),
    .io_enq_bits_offset(queue_io_enq_bits_offset),
    .io_enq_bits_search_for_root(queue_io_enq_bits_search_for_root),
    .io_enq_bits_tree_to_exec(queue_io_enq_bits_tree_to_exec),
    .io_enq_bits_scores_0(queue_io_enq_bits_scores_0),
    .io_enq_bits_scores_1(queue_io_enq_bits_scores_1),
    .io_enq_bits_scores_2(queue_io_enq_bits_scores_2),
    .io_enq_bits_scores_3(queue_io_enq_bits_scores_3),
    .io_enq_bits_weights_0(queue_io_enq_bits_weights_0),
    .io_enq_bits_weights_1(queue_io_enq_bits_weights_1),
    .io_enq_bits_weights_2(queue_io_enq_bits_weights_2),
    .io_enq_bits_weights_3(queue_io_enq_bits_weights_3),
    .io_enq_bits_weights_4(queue_io_enq_bits_weights_4),
    .io_enq_bits_dest(queue_io_enq_bits_dest),
    .io_enq_bits_last(queue_io_enq_bits_last),
    .io_deq_ready(queue_io_deq_ready),
    .io_deq_valid(queue_io_deq_valid),
    .io_deq_bits_features_0(queue_io_deq_bits_features_0),
    .io_deq_bits_features_1(queue_io_deq_bits_features_1),
    .io_deq_bits_features_2(queue_io_deq_bits_features_2),
    .io_deq_bits_features_3(queue_io_deq_bits_features_3),
    .io_deq_bits_features_4(queue_io_deq_bits_features_4),
    .io_deq_bits_offset(queue_io_deq_bits_offset),
    .io_deq_bits_shift(queue_io_deq_bits_shift),
    .io_deq_bits_search_for_root(queue_io_deq_bits_search_for_root),
    .io_deq_bits_tree_to_exec(queue_io_deq_bits_tree_to_exec),
    .io_deq_bits_scores_0(queue_io_deq_bits_scores_0),
    .io_deq_bits_scores_1(queue_io_deq_bits_scores_1),
    .io_deq_bits_scores_2(queue_io_deq_bits_scores_2),
    .io_deq_bits_scores_3(queue_io_deq_bits_scores_3),
    .io_deq_bits_weights_0(queue_io_deq_bits_weights_0),
    .io_deq_bits_weights_1(queue_io_deq_bits_weights_1),
    .io_deq_bits_weights_2(queue_io_deq_bits_weights_2),
    .io_deq_bits_weights_3(queue_io_deq_bits_weights_3),
    .io_deq_bits_weights_4(queue_io_deq_bits_weights_4),
    .io_deq_bits_dest(queue_io_deq_bits_dest),
    .io_deq_bits_last(queue_io_deq_bits_last)
  );
  assign io_sample_in_ready = queue_io_enq_ready; // @[Decoupled.scala 381:17]
  assign io_sample_looping_valid = queue_io_deq_valid & ~queue_io_deq_bits_dest; // @[Interconnect.scala 26:44]
  assign io_sample_looping_bits_features_0 = queue_io_deq_bits_features_0; // @[Interconnect.scala 16:28]
  assign io_sample_looping_bits_features_1 = queue_io_deq_bits_features_1; // @[Interconnect.scala 16:28]
  assign io_sample_looping_bits_features_2 = queue_io_deq_bits_features_2; // @[Interconnect.scala 16:28]
  assign io_sample_looping_bits_features_3 = queue_io_deq_bits_features_3; // @[Interconnect.scala 16:28]
  assign io_sample_looping_bits_features_4 = queue_io_deq_bits_features_4; // @[Interconnect.scala 16:28]
  assign io_sample_looping_bits_offset = queue_io_deq_bits_offset; // @[Interconnect.scala 16:28]
  assign io_sample_looping_bits_search_for_root = queue_io_deq_bits_search_for_root; // @[Interconnect.scala 16:28]
  assign io_sample_looping_bits_tree_to_exec = queue_io_deq_bits_tree_to_exec; // @[Interconnect.scala 16:28]
  assign io_sample_looping_bits_scores_0 = queue_io_deq_bits_scores_0; // @[Interconnect.scala 16:28]
  assign io_sample_looping_bits_scores_1 = queue_io_deq_bits_scores_1; // @[Interconnect.scala 16:28]
  assign io_sample_looping_bits_scores_2 = queue_io_deq_bits_scores_2; // @[Interconnect.scala 16:28]
  assign io_sample_looping_bits_scores_3 = queue_io_deq_bits_scores_3; // @[Interconnect.scala 16:28]
  assign io_sample_looping_bits_weights_0 = queue_io_deq_bits_weights_0; // @[Interconnect.scala 16:28]
  assign io_sample_looping_bits_weights_1 = queue_io_deq_bits_weights_1; // @[Interconnect.scala 16:28]
  assign io_sample_looping_bits_weights_2 = queue_io_deq_bits_weights_2; // @[Interconnect.scala 16:28]
  assign io_sample_looping_bits_weights_3 = queue_io_deq_bits_weights_3; // @[Interconnect.scala 16:28]
  assign io_sample_looping_bits_weights_4 = queue_io_deq_bits_weights_4; // @[Interconnect.scala 16:28]
  assign io_sample_looping_bits_last = queue_io_deq_bits_last; // @[Interconnect.scala 16:28]
  assign io_sample_leaving_valid = queue_io_deq_valid & queue_io_deq_bits_dest; // @[Interconnect.scala 27:44]
  assign io_sample_leaving_bits_features_0 = queue_io_deq_bits_features_0; // @[Interconnect.scala 17:37]
  assign io_sample_leaving_bits_features_1 = queue_io_deq_bits_features_1; // @[Interconnect.scala 17:37]
  assign io_sample_leaving_bits_features_2 = queue_io_deq_bits_features_2; // @[Interconnect.scala 17:37]
  assign io_sample_leaving_bits_features_3 = queue_io_deq_bits_features_3; // @[Interconnect.scala 17:37]
  assign io_sample_leaving_bits_features_4 = queue_io_deq_bits_features_4; // @[Interconnect.scala 17:37]
  assign io_sample_leaving_bits_offset = queue_io_deq_bits_offset; // @[Interconnect.scala 18:35]
  assign io_sample_leaving_bits_shift = queue_io_deq_bits_shift; // @[Interconnect.scala 19:34]
  assign io_sample_leaving_bits_search_for_root = queue_io_deq_bits_search_for_root; // @[Interconnect.scala 20:44]
  assign io_sample_leaving_bits_tree_to_exec = queue_io_deq_bits_tree_to_exec; // @[Interconnect.scala 21:41]
  assign io_sample_leaving_bits_scores_0 = queue_io_deq_bits_scores_0; // @[Interconnect.scala 22:35]
  assign io_sample_leaving_bits_scores_1 = queue_io_deq_bits_scores_1; // @[Interconnect.scala 22:35]
  assign io_sample_leaving_bits_scores_2 = queue_io_deq_bits_scores_2; // @[Interconnect.scala 22:35]
  assign io_sample_leaving_bits_scores_3 = queue_io_deq_bits_scores_3; // @[Interconnect.scala 22:35]
  assign io_sample_leaving_bits_last = queue_io_deq_bits_last & queue_io_deq_bits_dest; // @[Interconnect.scala 25:52]
  assign queue_clock = clock;
  assign queue_reset = reset;
  assign queue_io_enq_valid = io_sample_in_valid; // @[Decoupled.scala 379:22]
  assign queue_io_enq_bits_features_0 = io_sample_in_bits_features_0; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_features_1 = io_sample_in_bits_features_1; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_features_2 = io_sample_in_bits_features_2; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_features_3 = io_sample_in_bits_features_3; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_features_4 = io_sample_in_bits_features_4; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_offset = io_sample_in_bits_offset; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_search_for_root = io_sample_in_bits_search_for_root; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_tree_to_exec = io_sample_in_bits_tree_to_exec; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_scores_0 = io_sample_in_bits_scores_0; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_scores_1 = io_sample_in_bits_scores_1; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_scores_2 = io_sample_in_bits_scores_2; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_scores_3 = io_sample_in_bits_scores_3; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_weights_0 = io_sample_in_bits_weights_0; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_weights_1 = io_sample_in_bits_weights_1; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_weights_2 = io_sample_in_bits_weights_2; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_weights_3 = io_sample_in_bits_weights_3; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_weights_4 = io_sample_in_bits_weights_4; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_dest = io_sample_in_bits_dest; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_last = io_sample_in_bits_last; // @[Decoupled.scala 380:21]
  assign queue_io_deq_ready = io_sample_leaving_ready & queue_io_deq_bits_dest | io_sample_looping_ready &
    _io_sample_looping_valid_T; // @[Interconnect.scala 30:64]
endmodule
module IncrementTreePE(
  input         clock,
  input         reset,
  output        io_sample_in_ready,
  input         io_sample_in_valid,
  input  [31:0] io_sample_in_bits_features_0,
  input  [31:0] io_sample_in_bits_features_1,
  input  [31:0] io_sample_in_bits_features_2,
  input  [31:0] io_sample_in_bits_features_3,
  input  [31:0] io_sample_in_bits_features_4,
  input  [9:0]  io_sample_in_bits_offset,
  input         io_sample_in_bits_search_for_root,
  input  [7:0]  io_sample_in_bits_tree_to_exec,
  input  [31:0] io_sample_in_bits_scores_0,
  input  [31:0] io_sample_in_bits_scores_1,
  input  [31:0] io_sample_in_bits_scores_2,
  input  [31:0] io_sample_in_bits_scores_3,
  input  [31:0] io_sample_in_bits_weights_0,
  input  [31:0] io_sample_in_bits_weights_1,
  input  [31:0] io_sample_in_bits_weights_2,
  input  [31:0] io_sample_in_bits_weights_3,
  input  [31:0] io_sample_in_bits_weights_4,
  input         io_sample_in_bits_last,
  input         io_sample_out_ready,
  output        io_sample_out_valid,
  output [31:0] io_sample_out_bits_features_0,
  output [31:0] io_sample_out_bits_features_1,
  output [31:0] io_sample_out_bits_features_2,
  output [31:0] io_sample_out_bits_features_3,
  output [31:0] io_sample_out_bits_features_4,
  output [9:0]  io_sample_out_bits_offset,
  output        io_sample_out_bits_search_for_root,
  output [7:0]  io_sample_out_bits_tree_to_exec,
  output [31:0] io_sample_out_bits_scores_0,
  output [31:0] io_sample_out_bits_scores_1,
  output [31:0] io_sample_out_bits_scores_2,
  output [31:0] io_sample_out_bits_scores_3,
  output [31:0] io_sample_out_bits_weights_0,
  output [31:0] io_sample_out_bits_weights_1,
  output [31:0] io_sample_out_bits_weights_2,
  output [31:0] io_sample_out_bits_weights_3,
  output [31:0] io_sample_out_bits_weights_4,
  output        io_sample_out_bits_last
);
  wire  queue_clock; // @[Decoupled.scala 377:21]
  wire  queue_reset; // @[Decoupled.scala 377:21]
  wire  queue_io_enq_ready; // @[Decoupled.scala 377:21]
  wire  queue_io_enq_valid; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_features_0; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_features_1; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_features_2; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_features_3; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_features_4; // @[Decoupled.scala 377:21]
  wire [9:0] queue_io_enq_bits_offset; // @[Decoupled.scala 377:21]
  wire  queue_io_enq_bits_search_for_root; // @[Decoupled.scala 377:21]
  wire [7:0] queue_io_enq_bits_tree_to_exec; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_scores_0; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_scores_1; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_scores_2; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_scores_3; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_weights_0; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_weights_1; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_weights_2; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_weights_3; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_enq_bits_weights_4; // @[Decoupled.scala 377:21]
  wire  queue_io_enq_bits_last; // @[Decoupled.scala 377:21]
  wire  queue_io_deq_ready; // @[Decoupled.scala 377:21]
  wire  queue_io_deq_valid; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_features_0; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_features_1; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_features_2; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_features_3; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_features_4; // @[Decoupled.scala 377:21]
  wire [9:0] queue_io_deq_bits_offset; // @[Decoupled.scala 377:21]
  wire  queue_io_deq_bits_search_for_root; // @[Decoupled.scala 377:21]
  wire [7:0] queue_io_deq_bits_tree_to_exec; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_scores_0; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_scores_1; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_scores_2; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_scores_3; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_weights_0; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_weights_1; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_weights_2; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_weights_3; // @[Decoupled.scala 377:21]
  wire [31:0] queue_io_deq_bits_weights_4; // @[Decoupled.scala 377:21]
  wire  queue_io_deq_bits_last; // @[Decoupled.scala 377:21]
  wire [7:0] _io_sample_out_bits_tree_to_exec_T_1 = queue_io_deq_bits_tree_to_exec + 8'h1; // @[IncrementTreePE.scala 17:64]
  Queue_1 queue ( // @[Decoupled.scala 377:21]
    .clock(queue_clock),
    .reset(queue_reset),
    .io_enq_ready(queue_io_enq_ready),
    .io_enq_valid(queue_io_enq_valid),
    .io_enq_bits_features_0(queue_io_enq_bits_features_0),
    .io_enq_bits_features_1(queue_io_enq_bits_features_1),
    .io_enq_bits_features_2(queue_io_enq_bits_features_2),
    .io_enq_bits_features_3(queue_io_enq_bits_features_3),
    .io_enq_bits_features_4(queue_io_enq_bits_features_4),
    .io_enq_bits_offset(queue_io_enq_bits_offset),
    .io_enq_bits_search_for_root(queue_io_enq_bits_search_for_root),
    .io_enq_bits_tree_to_exec(queue_io_enq_bits_tree_to_exec),
    .io_enq_bits_scores_0(queue_io_enq_bits_scores_0),
    .io_enq_bits_scores_1(queue_io_enq_bits_scores_1),
    .io_enq_bits_scores_2(queue_io_enq_bits_scores_2),
    .io_enq_bits_scores_3(queue_io_enq_bits_scores_3),
    .io_enq_bits_weights_0(queue_io_enq_bits_weights_0),
    .io_enq_bits_weights_1(queue_io_enq_bits_weights_1),
    .io_enq_bits_weights_2(queue_io_enq_bits_weights_2),
    .io_enq_bits_weights_3(queue_io_enq_bits_weights_3),
    .io_enq_bits_weights_4(queue_io_enq_bits_weights_4),
    .io_enq_bits_last(queue_io_enq_bits_last),
    .io_deq_ready(queue_io_deq_ready),
    .io_deq_valid(queue_io_deq_valid),
    .io_deq_bits_features_0(queue_io_deq_bits_features_0),
    .io_deq_bits_features_1(queue_io_deq_bits_features_1),
    .io_deq_bits_features_2(queue_io_deq_bits_features_2),
    .io_deq_bits_features_3(queue_io_deq_bits_features_3),
    .io_deq_bits_features_4(queue_io_deq_bits_features_4),
    .io_deq_bits_offset(queue_io_deq_bits_offset),
    .io_deq_bits_search_for_root(queue_io_deq_bits_search_for_root),
    .io_deq_bits_tree_to_exec(queue_io_deq_bits_tree_to_exec),
    .io_deq_bits_scores_0(queue_io_deq_bits_scores_0),
    .io_deq_bits_scores_1(queue_io_deq_bits_scores_1),
    .io_deq_bits_scores_2(queue_io_deq_bits_scores_2),
    .io_deq_bits_scores_3(queue_io_deq_bits_scores_3),
    .io_deq_bits_weights_0(queue_io_deq_bits_weights_0),
    .io_deq_bits_weights_1(queue_io_deq_bits_weights_1),
    .io_deq_bits_weights_2(queue_io_deq_bits_weights_2),
    .io_deq_bits_weights_3(queue_io_deq_bits_weights_3),
    .io_deq_bits_weights_4(queue_io_deq_bits_weights_4),
    .io_deq_bits_last(queue_io_deq_bits_last)
  );
  assign io_sample_in_ready = queue_io_enq_ready; // @[Decoupled.scala 381:17]
  assign io_sample_out_valid = queue_io_deq_valid; // @[IncrementTreePE.scala 26:25]
  assign io_sample_out_bits_features_0 = queue_io_deq_bits_features_0; // @[IncrementTreePE.scala 15:33]
  assign io_sample_out_bits_features_1 = queue_io_deq_bits_features_1; // @[IncrementTreePE.scala 15:33]
  assign io_sample_out_bits_features_2 = queue_io_deq_bits_features_2; // @[IncrementTreePE.scala 15:33]
  assign io_sample_out_bits_features_3 = queue_io_deq_bits_features_3; // @[IncrementTreePE.scala 15:33]
  assign io_sample_out_bits_features_4 = queue_io_deq_bits_features_4; // @[IncrementTreePE.scala 15:33]
  assign io_sample_out_bits_offset = {{2'd0}, _io_sample_out_bits_tree_to_exec_T_1}; // @[IncrementTreePE.scala 19:31]
  assign io_sample_out_bits_search_for_root = queue_io_deq_bits_search_for_root; // @[IncrementTreePE.scala 21:40]
  assign io_sample_out_bits_tree_to_exec = queue_io_deq_bits_tree_to_exec + 8'h1; // @[IncrementTreePE.scala 17:64]
  assign io_sample_out_bits_scores_0 = queue_io_deq_bits_scores_0; // @[IncrementTreePE.scala 20:31]
  assign io_sample_out_bits_scores_1 = queue_io_deq_bits_scores_1; // @[IncrementTreePE.scala 20:31]
  assign io_sample_out_bits_scores_2 = queue_io_deq_bits_scores_2; // @[IncrementTreePE.scala 20:31]
  assign io_sample_out_bits_scores_3 = queue_io_deq_bits_scores_3; // @[IncrementTreePE.scala 20:31]
  assign io_sample_out_bits_weights_0 = queue_io_deq_bits_weights_0; // @[IncrementTreePE.scala 16:32]
  assign io_sample_out_bits_weights_1 = queue_io_deq_bits_weights_1; // @[IncrementTreePE.scala 16:32]
  assign io_sample_out_bits_weights_2 = queue_io_deq_bits_weights_2; // @[IncrementTreePE.scala 16:32]
  assign io_sample_out_bits_weights_3 = queue_io_deq_bits_weights_3; // @[IncrementTreePE.scala 16:32]
  assign io_sample_out_bits_weights_4 = queue_io_deq_bits_weights_4; // @[IncrementTreePE.scala 16:32]
  assign io_sample_out_bits_last = queue_io_deq_bits_last; // @[IncrementTreePE.scala 23:29]
  assign queue_clock = clock;
  assign queue_reset = reset;
  assign queue_io_enq_valid = io_sample_in_valid; // @[Decoupled.scala 379:22]
  assign queue_io_enq_bits_features_0 = io_sample_in_bits_features_0; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_features_1 = io_sample_in_bits_features_1; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_features_2 = io_sample_in_bits_features_2; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_features_3 = io_sample_in_bits_features_3; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_features_4 = io_sample_in_bits_features_4; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_offset = io_sample_in_bits_offset; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_search_for_root = io_sample_in_bits_search_for_root; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_tree_to_exec = io_sample_in_bits_tree_to_exec; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_scores_0 = io_sample_in_bits_scores_0; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_scores_1 = io_sample_in_bits_scores_1; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_scores_2 = io_sample_in_bits_scores_2; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_scores_3 = io_sample_in_bits_scores_3; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_weights_0 = io_sample_in_bits_weights_0; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_weights_1 = io_sample_in_bits_weights_1; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_weights_2 = io_sample_in_bits_weights_2; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_weights_3 = io_sample_in_bits_weights_3; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_weights_4 = io_sample_in_bits_weights_4; // @[Decoupled.scala 380:21]
  assign queue_io_enq_bits_last = io_sample_in_bits_last; // @[Decoupled.scala 380:21]
  assign queue_io_deq_ready = io_sample_out_ready; // @[IncrementTreePE.scala 28:17]
endmodule
module TreePEsWrapper(
  input          clock,
  input          reset,
  input  [511:0] wrapper_io_sample_in_TDATA,
  input          wrapper_io_sample_in_TLAST,
  output         wrapper_io_sample_in_TREADY,
  input          wrapper_io_sample_in_TVALID,
  output [511:0] wrapper_io_sample_out_TDATA,
  output         wrapper_io_sample_out_TLAST,
  input          wrapper_io_sample_out_TREADY,
  output         wrapper_io_sample_out_TVALID,
  input  [12:0]  brams_io_0_bram_addr_a,
  input          brams_io_0_bram_clk_a,
  input  [31:0]  brams_io_0_bram_wrdata_a,
  output [31:0]  brams_io_0_bram_rddata_a,
  input          brams_io_0_bram_en_a,
  input          brams_io_0_bram_rst_a,
  input  [3:0]   brams_io_0_bram_we_a,
  input  [12:0]  brams_io_1_bram_addr_a,
  input          brams_io_1_bram_clk_a,
  input  [31:0]  brams_io_1_bram_wrdata_a,
  output [31:0]  brams_io_1_bram_rddata_a,
  input          brams_io_1_bram_en_a,
  input          brams_io_1_bram_rst_a,
  input  [3:0]   brams_io_1_bram_we_a,
  input  [12:0]  brams_io_2_bram_addr_a,
  input          brams_io_2_bram_clk_a,
  input  [31:0]  brams_io_2_bram_wrdata_a,
  output [31:0]  brams_io_2_bram_rddata_a,
  input          brams_io_2_bram_en_a,
  input          brams_io_2_bram_rst_a,
  input  [3:0]   brams_io_2_bram_we_a,
  input  [12:0]  brams_io_3_bram_addr_a,
  input          brams_io_3_bram_clk_a,
  input  [31:0]  brams_io_3_bram_wrdata_a,
  output [31:0]  brams_io_3_bram_rddata_a,
  input          brams_io_3_bram_en_a,
  input          brams_io_3_bram_rst_a,
  input  [3:0]   brams_io_3_bram_we_a,
  input  [12:0]  brams_io_4_bram_addr_a,
  input          brams_io_4_bram_clk_a,
  input  [31:0]  brams_io_4_bram_wrdata_a,
  output [31:0]  brams_io_4_bram_rddata_a,
  input          brams_io_4_bram_en_a,
  input          brams_io_4_bram_rst_a,
  input  [3:0]   brams_io_4_bram_we_a,
  input  [12:0]  brams_io_5_bram_addr_a,
  input          brams_io_5_bram_clk_a,
  input  [31:0]  brams_io_5_bram_wrdata_a,
  output [31:0]  brams_io_5_bram_rddata_a,
  input          brams_io_5_bram_en_a,
  input          brams_io_5_bram_rst_a,
  input  [3:0]   brams_io_5_bram_we_a,
  input  [12:0]  brams_io_6_bram_addr_a,
  input          brams_io_6_bram_clk_a,
  input  [31:0]  brams_io_6_bram_wrdata_a,
  output [31:0]  brams_io_6_bram_rddata_a,
  input          brams_io_6_bram_en_a,
  input          brams_io_6_bram_rst_a,
  input  [3:0]   brams_io_6_bram_we_a,
  input  [12:0]  brams_io_7_bram_addr_a,
  input          brams_io_7_bram_clk_a,
  input  [31:0]  brams_io_7_bram_wrdata_a,
  output [31:0]  brams_io_7_bram_rddata_a,
  input          brams_io_7_bram_en_a,
  input          brams_io_7_bram_rst_a,
  input  [3:0]   brams_io_7_bram_we_a,
  input  [12:0]  brams_io_8_bram_addr_a,
  input          brams_io_8_bram_clk_a,
  input  [31:0]  brams_io_8_bram_wrdata_a,
  output [31:0]  brams_io_8_bram_rddata_a,
  input          brams_io_8_bram_en_a,
  input          brams_io_8_bram_rst_a,
  input  [3:0]   brams_io_8_bram_we_a,
  input  [12:0]  brams_io_9_bram_addr_a,
  input          brams_io_9_bram_clk_a,
  input  [31:0]  brams_io_9_bram_wrdata_a,
  output [31:0]  brams_io_9_bram_rddata_a,
  input          brams_io_9_bram_en_a,
  input          brams_io_9_bram_rst_a,
  input  [3:0]   brams_io_9_bram_we_a,
  input  [12:0]  brams_io_10_bram_addr_a,
  input          brams_io_10_bram_clk_a,
  input  [31:0]  brams_io_10_bram_wrdata_a,
  output [31:0]  brams_io_10_bram_rddata_a,
  input          brams_io_10_bram_en_a,
  input          brams_io_10_bram_rst_a,
  input  [3:0]   brams_io_10_bram_we_a,
  input  [12:0]  brams_io_11_bram_addr_a,
  input          brams_io_11_bram_clk_a,
  input  [31:0]  brams_io_11_bram_wrdata_a,
  output [31:0]  brams_io_11_bram_rddata_a,
  input          brams_io_11_bram_en_a,
  input          brams_io_11_bram_rst_a,
  input  [3:0]   brams_io_11_bram_we_a,
  input  [12:0]  brams_io_12_bram_addr_a,
  input          brams_io_12_bram_clk_a,
  input  [31:0]  brams_io_12_bram_wrdata_a,
  output [31:0]  brams_io_12_bram_rddata_a,
  input          brams_io_12_bram_en_a,
  input          brams_io_12_bram_rst_a,
  input  [3:0]   brams_io_12_bram_we_a,
  input  [12:0]  brams_io_13_bram_addr_a,
  input          brams_io_13_bram_clk_a,
  input  [31:0]  brams_io_13_bram_wrdata_a,
  output [31:0]  brams_io_13_bram_rddata_a,
  input          brams_io_13_bram_en_a,
  input          brams_io_13_bram_rst_a,
  input  [3:0]   brams_io_13_bram_we_a,
  input  [12:0]  brams_io_14_bram_addr_a,
  input          brams_io_14_bram_clk_a,
  input  [31:0]  brams_io_14_bram_wrdata_a,
  output [31:0]  brams_io_14_bram_rddata_a,
  input          brams_io_14_bram_en_a,
  input          brams_io_14_bram_rst_a,
  input  [3:0]   brams_io_14_bram_we_a,
  input  [12:0]  brams_io_15_bram_addr_a,
  input          brams_io_15_bram_clk_a,
  input  [31:0]  brams_io_15_bram_wrdata_a,
  output [31:0]  brams_io_15_bram_rddata_a,
  input          brams_io_15_bram_en_a,
  input          brams_io_15_bram_rst_a,
  input  [3:0]   brams_io_15_bram_we_a,
  input  [12:0]  brams_io_16_bram_addr_a,
  input          brams_io_16_bram_clk_a,
  input  [31:0]  brams_io_16_bram_wrdata_a,
  output [31:0]  brams_io_16_bram_rddata_a,
  input          brams_io_16_bram_en_a,
  input          brams_io_16_bram_rst_a,
  input  [3:0]   brams_io_16_bram_we_a,
  input  [12:0]  brams_io_17_bram_addr_a,
  input          brams_io_17_bram_clk_a,
  input  [31:0]  brams_io_17_bram_wrdata_a,
  output [31:0]  brams_io_17_bram_rddata_a,
  input          brams_io_17_bram_en_a,
  input          brams_io_17_bram_rst_a,
  input  [3:0]   brams_io_17_bram_we_a,
  input  [12:0]  brams_io_18_bram_addr_a,
  input          brams_io_18_bram_clk_a,
  input  [31:0]  brams_io_18_bram_wrdata_a,
  output [31:0]  brams_io_18_bram_rddata_a,
  input          brams_io_18_bram_en_a,
  input          brams_io_18_bram_rst_a,
  input  [3:0]   brams_io_18_bram_we_a,
  input  [12:0]  brams_io_19_bram_addr_a,
  input          brams_io_19_bram_clk_a,
  input  [31:0]  brams_io_19_bram_wrdata_a,
  output [31:0]  brams_io_19_bram_rddata_a,
  input          brams_io_19_bram_en_a,
  input          brams_io_19_bram_rst_a,
  input  [3:0]   brams_io_19_bram_we_a,
  input  [12:0]  brams_io_20_bram_addr_a,
  input          brams_io_20_bram_clk_a,
  input  [31:0]  brams_io_20_bram_wrdata_a,
  output [31:0]  brams_io_20_bram_rddata_a,
  input          brams_io_20_bram_en_a,
  input          brams_io_20_bram_rst_a,
  input  [3:0]   brams_io_20_bram_we_a,
  input  [12:0]  brams_io_21_bram_addr_a,
  input          brams_io_21_bram_clk_a,
  input  [31:0]  brams_io_21_bram_wrdata_a,
  output [31:0]  brams_io_21_bram_rddata_a,
  input          brams_io_21_bram_en_a,
  input          brams_io_21_bram_rst_a,
  input  [3:0]   brams_io_21_bram_we_a,
  input  [12:0]  brams_io_22_bram_addr_a,
  input          brams_io_22_bram_clk_a,
  input  [31:0]  brams_io_22_bram_wrdata_a,
  output [31:0]  brams_io_22_bram_rddata_a,
  input          brams_io_22_bram_en_a,
  input          brams_io_22_bram_rst_a,
  input  [3:0]   brams_io_22_bram_we_a,
  input  [12:0]  brams_io_23_bram_addr_a,
  input          brams_io_23_bram_clk_a,
  input  [31:0]  brams_io_23_bram_wrdata_a,
  output [31:0]  brams_io_23_bram_rddata_a,
  input          brams_io_23_bram_en_a,
  input          brams_io_23_bram_rst_a,
  input  [3:0]   brams_io_23_bram_we_a,
  input  [12:0]  brams_io_24_bram_addr_a,
  input          brams_io_24_bram_clk_a,
  input  [31:0]  brams_io_24_bram_wrdata_a,
  output [31:0]  brams_io_24_bram_rddata_a,
  input          brams_io_24_bram_en_a,
  input          brams_io_24_bram_rst_a,
  input  [3:0]   brams_io_24_bram_we_a,
  input  [12:0]  brams_io_25_bram_addr_a,
  input          brams_io_25_bram_clk_a,
  input  [31:0]  brams_io_25_bram_wrdata_a,
  output [31:0]  brams_io_25_bram_rddata_a,
  input          brams_io_25_bram_en_a,
  input          brams_io_25_bram_rst_a,
  input  [3:0]   brams_io_25_bram_we_a,
  input  [12:0]  brams_io_26_bram_addr_a,
  input          brams_io_26_bram_clk_a,
  input  [31:0]  brams_io_26_bram_wrdata_a,
  output [31:0]  brams_io_26_bram_rddata_a,
  input          brams_io_26_bram_en_a,
  input          brams_io_26_bram_rst_a,
  input  [3:0]   brams_io_26_bram_we_a,
  input  [12:0]  brams_io_27_bram_addr_a,
  input          brams_io_27_bram_clk_a,
  input  [31:0]  brams_io_27_bram_wrdata_a,
  output [31:0]  brams_io_27_bram_rddata_a,
  input          brams_io_27_bram_en_a,
  input          brams_io_27_bram_rst_a,
  input  [3:0]   brams_io_27_bram_we_a,
  input  [12:0]  brams_io_28_bram_addr_a,
  input          brams_io_28_bram_clk_a,
  input  [31:0]  brams_io_28_bram_wrdata_a,
  output [31:0]  brams_io_28_bram_rddata_a,
  input          brams_io_28_bram_en_a,
  input          brams_io_28_bram_rst_a,
  input  [3:0]   brams_io_28_bram_we_a,
  input  [12:0]  brams_io_29_bram_addr_a,
  input          brams_io_29_bram_clk_a,
  input  [31:0]  brams_io_29_bram_wrdata_a,
  output [31:0]  brams_io_29_bram_rddata_a,
  input          brams_io_29_bram_en_a,
  input          brams_io_29_bram_rst_a,
  input  [3:0]   brams_io_29_bram_we_a
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire [511:0] forward_converter_io_sample_in_TDATA; // @[TreePEsWrapper.scala 50:39]
  wire  forward_converter_io_sample_in_TLAST; // @[TreePEsWrapper.scala 50:39]
  wire  forward_converter_io_sample_in_TREADY; // @[TreePEsWrapper.scala 50:39]
  wire  forward_converter_io_sample_in_TVALID; // @[TreePEsWrapper.scala 50:39]
  wire  forward_converter_io_sample_out_ready; // @[TreePEsWrapper.scala 50:39]
  wire  forward_converter_io_sample_out_valid; // @[TreePEsWrapper.scala 50:39]
  wire [31:0] forward_converter_io_sample_out_bits_features_0; // @[TreePEsWrapper.scala 50:39]
  wire [31:0] forward_converter_io_sample_out_bits_features_1; // @[TreePEsWrapper.scala 50:39]
  wire [31:0] forward_converter_io_sample_out_bits_features_2; // @[TreePEsWrapper.scala 50:39]
  wire [31:0] forward_converter_io_sample_out_bits_features_3; // @[TreePEsWrapper.scala 50:39]
  wire [31:0] forward_converter_io_sample_out_bits_features_4; // @[TreePEsWrapper.scala 50:39]
  wire [9:0] forward_converter_io_sample_out_bits_offset; // @[TreePEsWrapper.scala 50:39]
  wire  forward_converter_io_sample_out_bits_search_for_root; // @[TreePEsWrapper.scala 50:39]
  wire [7:0] forward_converter_io_sample_out_bits_tree_to_exec; // @[TreePEsWrapper.scala 50:39]
  wire [31:0] forward_converter_io_sample_out_bits_scores_0; // @[TreePEsWrapper.scala 50:39]
  wire [31:0] forward_converter_io_sample_out_bits_scores_1; // @[TreePEsWrapper.scala 50:39]
  wire [31:0] forward_converter_io_sample_out_bits_scores_2; // @[TreePEsWrapper.scala 50:39]
  wire [31:0] forward_converter_io_sample_out_bits_scores_3; // @[TreePEsWrapper.scala 50:39]
  wire [31:0] forward_converter_io_sample_out_bits_weights_0; // @[TreePEsWrapper.scala 50:39]
  wire [31:0] forward_converter_io_sample_out_bits_weights_1; // @[TreePEsWrapper.scala 50:39]
  wire [31:0] forward_converter_io_sample_out_bits_weights_2; // @[TreePEsWrapper.scala 50:39]
  wire [31:0] forward_converter_io_sample_out_bits_weights_3; // @[TreePEsWrapper.scala 50:39]
  wire [31:0] forward_converter_io_sample_out_bits_weights_4; // @[TreePEsWrapper.scala 50:39]
  wire  forward_converter_io_sample_out_bits_last; // @[TreePEsWrapper.scala 50:39]
  wire  backward_converter_clock; // @[TreePEsWrapper.scala 51:40]
  wire  backward_converter_reset; // @[TreePEsWrapper.scala 51:40]
  wire  backward_converter_io_sample_in_ready; // @[TreePEsWrapper.scala 51:40]
  wire  backward_converter_io_sample_in_valid; // @[TreePEsWrapper.scala 51:40]
  wire [31:0] backward_converter_io_sample_in_bits_features_0; // @[TreePEsWrapper.scala 51:40]
  wire [31:0] backward_converter_io_sample_in_bits_features_1; // @[TreePEsWrapper.scala 51:40]
  wire [31:0] backward_converter_io_sample_in_bits_features_2; // @[TreePEsWrapper.scala 51:40]
  wire [31:0] backward_converter_io_sample_in_bits_features_3; // @[TreePEsWrapper.scala 51:40]
  wire [31:0] backward_converter_io_sample_in_bits_features_4; // @[TreePEsWrapper.scala 51:40]
  wire [9:0] backward_converter_io_sample_in_bits_offset; // @[TreePEsWrapper.scala 51:40]
  wire  backward_converter_io_sample_in_bits_shift; // @[TreePEsWrapper.scala 51:40]
  wire  backward_converter_io_sample_in_bits_search_for_root; // @[TreePEsWrapper.scala 51:40]
  wire [7:0] backward_converter_io_sample_in_bits_tree_to_exec; // @[TreePEsWrapper.scala 51:40]
  wire [31:0] backward_converter_io_sample_in_bits_scores_0; // @[TreePEsWrapper.scala 51:40]
  wire [31:0] backward_converter_io_sample_in_bits_scores_1; // @[TreePEsWrapper.scala 51:40]
  wire [31:0] backward_converter_io_sample_in_bits_scores_2; // @[TreePEsWrapper.scala 51:40]
  wire [31:0] backward_converter_io_sample_in_bits_scores_3; // @[TreePEsWrapper.scala 51:40]
  wire  backward_converter_io_sample_in_bits_last; // @[TreePEsWrapper.scala 51:40]
  wire [31:0] backward_converter_io_sample_in_bits_clock_cycles; // @[TreePEsWrapper.scala 51:40]
  wire [511:0] backward_converter_io_sample_out_TDATA; // @[TreePEsWrapper.scala 51:40]
  wire  backward_converter_io_sample_out_TLAST; // @[TreePEsWrapper.scala 51:40]
  wire  backward_converter_io_sample_out_TREADY; // @[TreePEsWrapper.scala 51:40]
  wire  backward_converter_io_sample_out_TVALID; // @[TreePEsWrapper.scala 51:40]
  wire  pes_0_clock; // @[TreePEsWrapper.scala 57:69]
  wire  pes_0_reset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_0_pe_io_sample_in_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_0_pe_io_sample_in_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_0_pe_io_sample_in_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_0_pe_io_sample_in_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_0_pe_io_sample_in_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_0_pe_io_sample_in_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_0_pe_io_sample_in_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_0_pe_io_sample_in_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_0_pe_io_sample_in_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_0_pe_io_sample_in_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_0_pe_io_sample_in_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_0_pe_io_sample_in_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_0_pe_io_sample_in_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_0_pe_io_sample_in_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_0_pe_io_sample_in_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_0_pe_io_sample_in_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_0_pe_io_sample_in_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_0_pe_io_sample_in_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_0_pe_io_sample_in_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_0_pe_io_sample_in_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire [12:0] pes_0_pe_io_mem_addr_1; // @[TreePEsWrapper.scala 57:69]
  wire [63:0] pes_0_pe_io_mem_dataOut_1; // @[TreePEsWrapper.scala 57:69]
  wire  pes_0_pe_io_sample_out_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_0_pe_io_sample_out_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_0_pe_io_sample_out_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_0_pe_io_sample_out_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_0_pe_io_sample_out_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_0_pe_io_sample_out_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_0_pe_io_sample_out_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_0_pe_io_sample_out_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_0_pe_io_sample_out_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_0_pe_io_sample_out_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_0_pe_io_sample_out_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_0_pe_io_sample_out_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_0_pe_io_sample_out_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_0_pe_io_sample_out_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_0_pe_io_sample_out_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_0_pe_io_sample_out_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_0_pe_io_sample_out_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_0_pe_io_sample_out_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_0_pe_io_sample_out_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_0_pe_io_sample_out_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire  pes_1_clock; // @[TreePEsWrapper.scala 57:69]
  wire  pes_1_reset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_1_pe_io_sample_in_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_1_pe_io_sample_in_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_1_pe_io_sample_in_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_1_pe_io_sample_in_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_1_pe_io_sample_in_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_1_pe_io_sample_in_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_1_pe_io_sample_in_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_1_pe_io_sample_in_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_1_pe_io_sample_in_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_1_pe_io_sample_in_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_1_pe_io_sample_in_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_1_pe_io_sample_in_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_1_pe_io_sample_in_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_1_pe_io_sample_in_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_1_pe_io_sample_in_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_1_pe_io_sample_in_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_1_pe_io_sample_in_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_1_pe_io_sample_in_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_1_pe_io_sample_in_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_1_pe_io_sample_in_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire [12:0] pes_1_pe_io_mem_addr_1; // @[TreePEsWrapper.scala 57:69]
  wire [63:0] pes_1_pe_io_mem_dataOut_1; // @[TreePEsWrapper.scala 57:69]
  wire  pes_1_pe_io_sample_out_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_1_pe_io_sample_out_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_1_pe_io_sample_out_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_1_pe_io_sample_out_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_1_pe_io_sample_out_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_1_pe_io_sample_out_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_1_pe_io_sample_out_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_1_pe_io_sample_out_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_1_pe_io_sample_out_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_1_pe_io_sample_out_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_1_pe_io_sample_out_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_1_pe_io_sample_out_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_1_pe_io_sample_out_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_1_pe_io_sample_out_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_1_pe_io_sample_out_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_1_pe_io_sample_out_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_1_pe_io_sample_out_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_1_pe_io_sample_out_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_1_pe_io_sample_out_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_1_pe_io_sample_out_bits_dest; // @[TreePEsWrapper.scala 57:69]
  wire  pes_1_pe_io_sample_out_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire  pes_2_clock; // @[TreePEsWrapper.scala 57:69]
  wire  pes_2_reset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_2_pe_io_sample_in_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_2_pe_io_sample_in_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_2_pe_io_sample_in_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_2_pe_io_sample_in_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_2_pe_io_sample_in_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_2_pe_io_sample_in_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_2_pe_io_sample_in_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_2_pe_io_sample_in_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_2_pe_io_sample_in_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_2_pe_io_sample_in_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_2_pe_io_sample_in_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_2_pe_io_sample_in_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_2_pe_io_sample_in_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_2_pe_io_sample_in_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_2_pe_io_sample_in_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_2_pe_io_sample_in_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_2_pe_io_sample_in_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_2_pe_io_sample_in_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_2_pe_io_sample_in_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_2_pe_io_sample_in_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire [12:0] pes_2_pe_io_mem_addr_1; // @[TreePEsWrapper.scala 57:69]
  wire [63:0] pes_2_pe_io_mem_dataOut_1; // @[TreePEsWrapper.scala 57:69]
  wire  pes_2_pe_io_sample_out_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_2_pe_io_sample_out_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_2_pe_io_sample_out_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_2_pe_io_sample_out_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_2_pe_io_sample_out_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_2_pe_io_sample_out_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_2_pe_io_sample_out_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_2_pe_io_sample_out_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_2_pe_io_sample_out_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_2_pe_io_sample_out_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_2_pe_io_sample_out_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_2_pe_io_sample_out_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_2_pe_io_sample_out_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_2_pe_io_sample_out_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_2_pe_io_sample_out_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_2_pe_io_sample_out_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_2_pe_io_sample_out_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_2_pe_io_sample_out_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_2_pe_io_sample_out_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_2_pe_io_sample_out_bits_dest; // @[TreePEsWrapper.scala 57:69]
  wire  pes_2_pe_io_sample_out_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire  pes_3_clock; // @[TreePEsWrapper.scala 57:69]
  wire  pes_3_reset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_3_pe_io_sample_in_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_3_pe_io_sample_in_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_3_pe_io_sample_in_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_3_pe_io_sample_in_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_3_pe_io_sample_in_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_3_pe_io_sample_in_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_3_pe_io_sample_in_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_3_pe_io_sample_in_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_3_pe_io_sample_in_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_3_pe_io_sample_in_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_3_pe_io_sample_in_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_3_pe_io_sample_in_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_3_pe_io_sample_in_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_3_pe_io_sample_in_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_3_pe_io_sample_in_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_3_pe_io_sample_in_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_3_pe_io_sample_in_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_3_pe_io_sample_in_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_3_pe_io_sample_in_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_3_pe_io_sample_in_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire [12:0] pes_3_pe_io_mem_addr_1; // @[TreePEsWrapper.scala 57:69]
  wire [63:0] pes_3_pe_io_mem_dataOut_1; // @[TreePEsWrapper.scala 57:69]
  wire  pes_3_pe_io_sample_out_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_3_pe_io_sample_out_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_3_pe_io_sample_out_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_3_pe_io_sample_out_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_3_pe_io_sample_out_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_3_pe_io_sample_out_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_3_pe_io_sample_out_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_3_pe_io_sample_out_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_3_pe_io_sample_out_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_3_pe_io_sample_out_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_3_pe_io_sample_out_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_3_pe_io_sample_out_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_3_pe_io_sample_out_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_3_pe_io_sample_out_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_3_pe_io_sample_out_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_3_pe_io_sample_out_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_3_pe_io_sample_out_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_3_pe_io_sample_out_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_3_pe_io_sample_out_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_3_pe_io_sample_out_bits_dest; // @[TreePEsWrapper.scala 57:69]
  wire  pes_3_pe_io_sample_out_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire  pes_4_clock; // @[TreePEsWrapper.scala 57:69]
  wire  pes_4_reset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_4_pe_io_sample_in_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_4_pe_io_sample_in_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_4_pe_io_sample_in_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_4_pe_io_sample_in_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_4_pe_io_sample_in_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_4_pe_io_sample_in_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_4_pe_io_sample_in_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_4_pe_io_sample_in_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_4_pe_io_sample_in_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_4_pe_io_sample_in_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_4_pe_io_sample_in_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_4_pe_io_sample_in_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_4_pe_io_sample_in_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_4_pe_io_sample_in_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_4_pe_io_sample_in_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_4_pe_io_sample_in_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_4_pe_io_sample_in_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_4_pe_io_sample_in_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_4_pe_io_sample_in_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_4_pe_io_sample_in_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire [12:0] pes_4_pe_io_mem_addr_1; // @[TreePEsWrapper.scala 57:69]
  wire [63:0] pes_4_pe_io_mem_dataOut_1; // @[TreePEsWrapper.scala 57:69]
  wire  pes_4_pe_io_sample_out_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_4_pe_io_sample_out_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_4_pe_io_sample_out_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_4_pe_io_sample_out_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_4_pe_io_sample_out_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_4_pe_io_sample_out_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_4_pe_io_sample_out_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_4_pe_io_sample_out_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_4_pe_io_sample_out_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_4_pe_io_sample_out_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_4_pe_io_sample_out_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_4_pe_io_sample_out_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_4_pe_io_sample_out_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_4_pe_io_sample_out_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_4_pe_io_sample_out_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_4_pe_io_sample_out_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_4_pe_io_sample_out_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_4_pe_io_sample_out_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_4_pe_io_sample_out_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_4_pe_io_sample_out_bits_dest; // @[TreePEsWrapper.scala 57:69]
  wire  pes_4_pe_io_sample_out_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire  pes_5_clock; // @[TreePEsWrapper.scala 57:69]
  wire  pes_5_reset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_5_pe_io_sample_in_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_5_pe_io_sample_in_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_5_pe_io_sample_in_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_5_pe_io_sample_in_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_5_pe_io_sample_in_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_5_pe_io_sample_in_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_5_pe_io_sample_in_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_5_pe_io_sample_in_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_5_pe_io_sample_in_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_5_pe_io_sample_in_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_5_pe_io_sample_in_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_5_pe_io_sample_in_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_5_pe_io_sample_in_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_5_pe_io_sample_in_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_5_pe_io_sample_in_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_5_pe_io_sample_in_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_5_pe_io_sample_in_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_5_pe_io_sample_in_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_5_pe_io_sample_in_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_5_pe_io_sample_in_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire [12:0] pes_5_pe_io_mem_addr_1; // @[TreePEsWrapper.scala 57:69]
  wire [63:0] pes_5_pe_io_mem_dataOut_1; // @[TreePEsWrapper.scala 57:69]
  wire  pes_5_pe_io_sample_out_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_5_pe_io_sample_out_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_5_pe_io_sample_out_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_5_pe_io_sample_out_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_5_pe_io_sample_out_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_5_pe_io_sample_out_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_5_pe_io_sample_out_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_5_pe_io_sample_out_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_5_pe_io_sample_out_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_5_pe_io_sample_out_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_5_pe_io_sample_out_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_5_pe_io_sample_out_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_5_pe_io_sample_out_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_5_pe_io_sample_out_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_5_pe_io_sample_out_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_5_pe_io_sample_out_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_5_pe_io_sample_out_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_5_pe_io_sample_out_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_5_pe_io_sample_out_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_5_pe_io_sample_out_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire  pes_6_clock; // @[TreePEsWrapper.scala 57:69]
  wire  pes_6_reset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_6_pe_io_sample_in_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_6_pe_io_sample_in_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_6_pe_io_sample_in_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_6_pe_io_sample_in_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_6_pe_io_sample_in_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_6_pe_io_sample_in_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_6_pe_io_sample_in_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_6_pe_io_sample_in_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_6_pe_io_sample_in_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_6_pe_io_sample_in_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_6_pe_io_sample_in_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_6_pe_io_sample_in_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_6_pe_io_sample_in_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_6_pe_io_sample_in_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_6_pe_io_sample_in_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_6_pe_io_sample_in_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_6_pe_io_sample_in_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_6_pe_io_sample_in_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_6_pe_io_sample_in_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_6_pe_io_sample_in_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire [12:0] pes_6_pe_io_mem_addr_1; // @[TreePEsWrapper.scala 57:69]
  wire [63:0] pes_6_pe_io_mem_dataOut_1; // @[TreePEsWrapper.scala 57:69]
  wire  pes_6_pe_io_sample_out_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_6_pe_io_sample_out_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_6_pe_io_sample_out_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_6_pe_io_sample_out_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_6_pe_io_sample_out_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_6_pe_io_sample_out_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_6_pe_io_sample_out_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_6_pe_io_sample_out_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_6_pe_io_sample_out_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_6_pe_io_sample_out_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_6_pe_io_sample_out_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_6_pe_io_sample_out_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_6_pe_io_sample_out_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_6_pe_io_sample_out_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_6_pe_io_sample_out_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_6_pe_io_sample_out_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_6_pe_io_sample_out_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_6_pe_io_sample_out_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_6_pe_io_sample_out_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_6_pe_io_sample_out_bits_dest; // @[TreePEsWrapper.scala 57:69]
  wire  pes_6_pe_io_sample_out_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire  pes_7_clock; // @[TreePEsWrapper.scala 57:69]
  wire  pes_7_reset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_7_pe_io_sample_in_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_7_pe_io_sample_in_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_7_pe_io_sample_in_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_7_pe_io_sample_in_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_7_pe_io_sample_in_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_7_pe_io_sample_in_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_7_pe_io_sample_in_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_7_pe_io_sample_in_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_7_pe_io_sample_in_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_7_pe_io_sample_in_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_7_pe_io_sample_in_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_7_pe_io_sample_in_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_7_pe_io_sample_in_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_7_pe_io_sample_in_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_7_pe_io_sample_in_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_7_pe_io_sample_in_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_7_pe_io_sample_in_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_7_pe_io_sample_in_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_7_pe_io_sample_in_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_7_pe_io_sample_in_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire [12:0] pes_7_pe_io_mem_addr_1; // @[TreePEsWrapper.scala 57:69]
  wire [63:0] pes_7_pe_io_mem_dataOut_1; // @[TreePEsWrapper.scala 57:69]
  wire  pes_7_pe_io_sample_out_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_7_pe_io_sample_out_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_7_pe_io_sample_out_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_7_pe_io_sample_out_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_7_pe_io_sample_out_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_7_pe_io_sample_out_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_7_pe_io_sample_out_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_7_pe_io_sample_out_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_7_pe_io_sample_out_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_7_pe_io_sample_out_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_7_pe_io_sample_out_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_7_pe_io_sample_out_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_7_pe_io_sample_out_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_7_pe_io_sample_out_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_7_pe_io_sample_out_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_7_pe_io_sample_out_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_7_pe_io_sample_out_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_7_pe_io_sample_out_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_7_pe_io_sample_out_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_7_pe_io_sample_out_bits_dest; // @[TreePEsWrapper.scala 57:69]
  wire  pes_7_pe_io_sample_out_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire  pes_8_clock; // @[TreePEsWrapper.scala 57:69]
  wire  pes_8_reset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_8_pe_io_sample_in_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_8_pe_io_sample_in_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_8_pe_io_sample_in_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_8_pe_io_sample_in_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_8_pe_io_sample_in_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_8_pe_io_sample_in_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_8_pe_io_sample_in_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_8_pe_io_sample_in_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_8_pe_io_sample_in_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_8_pe_io_sample_in_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_8_pe_io_sample_in_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_8_pe_io_sample_in_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_8_pe_io_sample_in_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_8_pe_io_sample_in_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_8_pe_io_sample_in_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_8_pe_io_sample_in_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_8_pe_io_sample_in_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_8_pe_io_sample_in_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_8_pe_io_sample_in_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_8_pe_io_sample_in_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire [12:0] pes_8_pe_io_mem_addr_1; // @[TreePEsWrapper.scala 57:69]
  wire [63:0] pes_8_pe_io_mem_dataOut_1; // @[TreePEsWrapper.scala 57:69]
  wire  pes_8_pe_io_sample_out_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_8_pe_io_sample_out_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_8_pe_io_sample_out_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_8_pe_io_sample_out_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_8_pe_io_sample_out_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_8_pe_io_sample_out_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_8_pe_io_sample_out_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_8_pe_io_sample_out_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_8_pe_io_sample_out_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_8_pe_io_sample_out_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_8_pe_io_sample_out_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_8_pe_io_sample_out_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_8_pe_io_sample_out_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_8_pe_io_sample_out_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_8_pe_io_sample_out_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_8_pe_io_sample_out_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_8_pe_io_sample_out_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_8_pe_io_sample_out_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_8_pe_io_sample_out_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_8_pe_io_sample_out_bits_dest; // @[TreePEsWrapper.scala 57:69]
  wire  pes_8_pe_io_sample_out_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire  pes_9_clock; // @[TreePEsWrapper.scala 57:69]
  wire  pes_9_reset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_9_pe_io_sample_in_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_9_pe_io_sample_in_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_9_pe_io_sample_in_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_9_pe_io_sample_in_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_9_pe_io_sample_in_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_9_pe_io_sample_in_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_9_pe_io_sample_in_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_9_pe_io_sample_in_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_9_pe_io_sample_in_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_9_pe_io_sample_in_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_9_pe_io_sample_in_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_9_pe_io_sample_in_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_9_pe_io_sample_in_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_9_pe_io_sample_in_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_9_pe_io_sample_in_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_9_pe_io_sample_in_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_9_pe_io_sample_in_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_9_pe_io_sample_in_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_9_pe_io_sample_in_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_9_pe_io_sample_in_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire [12:0] pes_9_pe_io_mem_addr_1; // @[TreePEsWrapper.scala 57:69]
  wire [63:0] pes_9_pe_io_mem_dataOut_1; // @[TreePEsWrapper.scala 57:69]
  wire  pes_9_pe_io_sample_out_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_9_pe_io_sample_out_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_9_pe_io_sample_out_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_9_pe_io_sample_out_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_9_pe_io_sample_out_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_9_pe_io_sample_out_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_9_pe_io_sample_out_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_9_pe_io_sample_out_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_9_pe_io_sample_out_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_9_pe_io_sample_out_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_9_pe_io_sample_out_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_9_pe_io_sample_out_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_9_pe_io_sample_out_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_9_pe_io_sample_out_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_9_pe_io_sample_out_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_9_pe_io_sample_out_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_9_pe_io_sample_out_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_9_pe_io_sample_out_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_9_pe_io_sample_out_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_9_pe_io_sample_out_bits_dest; // @[TreePEsWrapper.scala 57:69]
  wire  pes_9_pe_io_sample_out_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire  pes_10_clock; // @[TreePEsWrapper.scala 57:69]
  wire  pes_10_reset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_10_pe_io_sample_in_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_10_pe_io_sample_in_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_10_pe_io_sample_in_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_10_pe_io_sample_in_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_10_pe_io_sample_in_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_10_pe_io_sample_in_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_10_pe_io_sample_in_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_10_pe_io_sample_in_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_10_pe_io_sample_in_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_10_pe_io_sample_in_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_10_pe_io_sample_in_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_10_pe_io_sample_in_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_10_pe_io_sample_in_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_10_pe_io_sample_in_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_10_pe_io_sample_in_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_10_pe_io_sample_in_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_10_pe_io_sample_in_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_10_pe_io_sample_in_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_10_pe_io_sample_in_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_10_pe_io_sample_in_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire [12:0] pes_10_pe_io_mem_addr_1; // @[TreePEsWrapper.scala 57:69]
  wire [63:0] pes_10_pe_io_mem_dataOut_1; // @[TreePEsWrapper.scala 57:69]
  wire  pes_10_pe_io_sample_out_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_10_pe_io_sample_out_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_10_pe_io_sample_out_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_10_pe_io_sample_out_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_10_pe_io_sample_out_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_10_pe_io_sample_out_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_10_pe_io_sample_out_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_10_pe_io_sample_out_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_10_pe_io_sample_out_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_10_pe_io_sample_out_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_10_pe_io_sample_out_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_10_pe_io_sample_out_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_10_pe_io_sample_out_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_10_pe_io_sample_out_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_10_pe_io_sample_out_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_10_pe_io_sample_out_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_10_pe_io_sample_out_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_10_pe_io_sample_out_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_10_pe_io_sample_out_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_10_pe_io_sample_out_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire  pes_11_clock; // @[TreePEsWrapper.scala 57:69]
  wire  pes_11_reset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_11_pe_io_sample_in_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_11_pe_io_sample_in_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_11_pe_io_sample_in_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_11_pe_io_sample_in_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_11_pe_io_sample_in_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_11_pe_io_sample_in_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_11_pe_io_sample_in_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_11_pe_io_sample_in_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_11_pe_io_sample_in_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_11_pe_io_sample_in_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_11_pe_io_sample_in_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_11_pe_io_sample_in_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_11_pe_io_sample_in_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_11_pe_io_sample_in_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_11_pe_io_sample_in_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_11_pe_io_sample_in_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_11_pe_io_sample_in_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_11_pe_io_sample_in_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_11_pe_io_sample_in_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_11_pe_io_sample_in_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire [12:0] pes_11_pe_io_mem_addr_1; // @[TreePEsWrapper.scala 57:69]
  wire [63:0] pes_11_pe_io_mem_dataOut_1; // @[TreePEsWrapper.scala 57:69]
  wire  pes_11_pe_io_sample_out_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_11_pe_io_sample_out_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_11_pe_io_sample_out_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_11_pe_io_sample_out_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_11_pe_io_sample_out_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_11_pe_io_sample_out_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_11_pe_io_sample_out_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_11_pe_io_sample_out_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_11_pe_io_sample_out_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_11_pe_io_sample_out_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_11_pe_io_sample_out_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_11_pe_io_sample_out_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_11_pe_io_sample_out_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_11_pe_io_sample_out_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_11_pe_io_sample_out_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_11_pe_io_sample_out_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_11_pe_io_sample_out_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_11_pe_io_sample_out_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_11_pe_io_sample_out_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_11_pe_io_sample_out_bits_dest; // @[TreePEsWrapper.scala 57:69]
  wire  pes_11_pe_io_sample_out_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire  pes_12_clock; // @[TreePEsWrapper.scala 57:69]
  wire  pes_12_reset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_12_pe_io_sample_in_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_12_pe_io_sample_in_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_12_pe_io_sample_in_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_12_pe_io_sample_in_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_12_pe_io_sample_in_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_12_pe_io_sample_in_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_12_pe_io_sample_in_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_12_pe_io_sample_in_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_12_pe_io_sample_in_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_12_pe_io_sample_in_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_12_pe_io_sample_in_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_12_pe_io_sample_in_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_12_pe_io_sample_in_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_12_pe_io_sample_in_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_12_pe_io_sample_in_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_12_pe_io_sample_in_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_12_pe_io_sample_in_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_12_pe_io_sample_in_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_12_pe_io_sample_in_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_12_pe_io_sample_in_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire [12:0] pes_12_pe_io_mem_addr_1; // @[TreePEsWrapper.scala 57:69]
  wire [63:0] pes_12_pe_io_mem_dataOut_1; // @[TreePEsWrapper.scala 57:69]
  wire  pes_12_pe_io_sample_out_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_12_pe_io_sample_out_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_12_pe_io_sample_out_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_12_pe_io_sample_out_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_12_pe_io_sample_out_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_12_pe_io_sample_out_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_12_pe_io_sample_out_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_12_pe_io_sample_out_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_12_pe_io_sample_out_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_12_pe_io_sample_out_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_12_pe_io_sample_out_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_12_pe_io_sample_out_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_12_pe_io_sample_out_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_12_pe_io_sample_out_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_12_pe_io_sample_out_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_12_pe_io_sample_out_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_12_pe_io_sample_out_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_12_pe_io_sample_out_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_12_pe_io_sample_out_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_12_pe_io_sample_out_bits_dest; // @[TreePEsWrapper.scala 57:69]
  wire  pes_12_pe_io_sample_out_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire  pes_13_clock; // @[TreePEsWrapper.scala 57:69]
  wire  pes_13_reset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_13_pe_io_sample_in_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_13_pe_io_sample_in_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_13_pe_io_sample_in_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_13_pe_io_sample_in_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_13_pe_io_sample_in_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_13_pe_io_sample_in_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_13_pe_io_sample_in_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_13_pe_io_sample_in_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_13_pe_io_sample_in_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_13_pe_io_sample_in_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_13_pe_io_sample_in_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_13_pe_io_sample_in_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_13_pe_io_sample_in_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_13_pe_io_sample_in_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_13_pe_io_sample_in_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_13_pe_io_sample_in_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_13_pe_io_sample_in_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_13_pe_io_sample_in_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_13_pe_io_sample_in_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_13_pe_io_sample_in_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire [12:0] pes_13_pe_io_mem_addr_1; // @[TreePEsWrapper.scala 57:69]
  wire [63:0] pes_13_pe_io_mem_dataOut_1; // @[TreePEsWrapper.scala 57:69]
  wire  pes_13_pe_io_sample_out_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_13_pe_io_sample_out_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_13_pe_io_sample_out_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_13_pe_io_sample_out_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_13_pe_io_sample_out_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_13_pe_io_sample_out_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_13_pe_io_sample_out_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_13_pe_io_sample_out_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_13_pe_io_sample_out_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_13_pe_io_sample_out_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_13_pe_io_sample_out_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_13_pe_io_sample_out_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_13_pe_io_sample_out_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_13_pe_io_sample_out_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_13_pe_io_sample_out_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_13_pe_io_sample_out_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_13_pe_io_sample_out_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_13_pe_io_sample_out_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_13_pe_io_sample_out_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_13_pe_io_sample_out_bits_dest; // @[TreePEsWrapper.scala 57:69]
  wire  pes_13_pe_io_sample_out_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire  pes_14_clock; // @[TreePEsWrapper.scala 57:69]
  wire  pes_14_reset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_14_pe_io_sample_in_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_14_pe_io_sample_in_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_14_pe_io_sample_in_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_14_pe_io_sample_in_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_14_pe_io_sample_in_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_14_pe_io_sample_in_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_14_pe_io_sample_in_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_14_pe_io_sample_in_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_14_pe_io_sample_in_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_14_pe_io_sample_in_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_14_pe_io_sample_in_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_14_pe_io_sample_in_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_14_pe_io_sample_in_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_14_pe_io_sample_in_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_14_pe_io_sample_in_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_14_pe_io_sample_in_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_14_pe_io_sample_in_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_14_pe_io_sample_in_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_14_pe_io_sample_in_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_14_pe_io_sample_in_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire [12:0] pes_14_pe_io_mem_addr_1; // @[TreePEsWrapper.scala 57:69]
  wire [63:0] pes_14_pe_io_mem_dataOut_1; // @[TreePEsWrapper.scala 57:69]
  wire  pes_14_pe_io_sample_out_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_14_pe_io_sample_out_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_14_pe_io_sample_out_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_14_pe_io_sample_out_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_14_pe_io_sample_out_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_14_pe_io_sample_out_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_14_pe_io_sample_out_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_14_pe_io_sample_out_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_14_pe_io_sample_out_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_14_pe_io_sample_out_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_14_pe_io_sample_out_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_14_pe_io_sample_out_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_14_pe_io_sample_out_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_14_pe_io_sample_out_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_14_pe_io_sample_out_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_14_pe_io_sample_out_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_14_pe_io_sample_out_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_14_pe_io_sample_out_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_14_pe_io_sample_out_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_14_pe_io_sample_out_bits_dest; // @[TreePEsWrapper.scala 57:69]
  wire  pes_14_pe_io_sample_out_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire  pes_15_clock; // @[TreePEsWrapper.scala 57:69]
  wire  pes_15_reset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_15_pe_io_sample_in_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_15_pe_io_sample_in_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_15_pe_io_sample_in_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_15_pe_io_sample_in_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_15_pe_io_sample_in_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_15_pe_io_sample_in_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_15_pe_io_sample_in_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_15_pe_io_sample_in_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_15_pe_io_sample_in_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_15_pe_io_sample_in_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_15_pe_io_sample_in_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_15_pe_io_sample_in_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_15_pe_io_sample_in_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_15_pe_io_sample_in_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_15_pe_io_sample_in_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_15_pe_io_sample_in_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_15_pe_io_sample_in_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_15_pe_io_sample_in_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_15_pe_io_sample_in_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_15_pe_io_sample_in_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire [12:0] pes_15_pe_io_mem_addr_1; // @[TreePEsWrapper.scala 57:69]
  wire [63:0] pes_15_pe_io_mem_dataOut_1; // @[TreePEsWrapper.scala 57:69]
  wire  pes_15_pe_io_sample_out_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_15_pe_io_sample_out_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_15_pe_io_sample_out_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_15_pe_io_sample_out_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_15_pe_io_sample_out_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_15_pe_io_sample_out_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_15_pe_io_sample_out_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_15_pe_io_sample_out_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_15_pe_io_sample_out_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_15_pe_io_sample_out_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_15_pe_io_sample_out_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_15_pe_io_sample_out_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_15_pe_io_sample_out_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_15_pe_io_sample_out_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_15_pe_io_sample_out_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_15_pe_io_sample_out_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_15_pe_io_sample_out_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_15_pe_io_sample_out_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_15_pe_io_sample_out_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_15_pe_io_sample_out_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire  pes_16_clock; // @[TreePEsWrapper.scala 57:69]
  wire  pes_16_reset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_16_pe_io_sample_in_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_16_pe_io_sample_in_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_16_pe_io_sample_in_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_16_pe_io_sample_in_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_16_pe_io_sample_in_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_16_pe_io_sample_in_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_16_pe_io_sample_in_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_16_pe_io_sample_in_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_16_pe_io_sample_in_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_16_pe_io_sample_in_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_16_pe_io_sample_in_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_16_pe_io_sample_in_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_16_pe_io_sample_in_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_16_pe_io_sample_in_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_16_pe_io_sample_in_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_16_pe_io_sample_in_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_16_pe_io_sample_in_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_16_pe_io_sample_in_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_16_pe_io_sample_in_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_16_pe_io_sample_in_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire [12:0] pes_16_pe_io_mem_addr_1; // @[TreePEsWrapper.scala 57:69]
  wire [63:0] pes_16_pe_io_mem_dataOut_1; // @[TreePEsWrapper.scala 57:69]
  wire  pes_16_pe_io_sample_out_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_16_pe_io_sample_out_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_16_pe_io_sample_out_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_16_pe_io_sample_out_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_16_pe_io_sample_out_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_16_pe_io_sample_out_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_16_pe_io_sample_out_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_16_pe_io_sample_out_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_16_pe_io_sample_out_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_16_pe_io_sample_out_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_16_pe_io_sample_out_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_16_pe_io_sample_out_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_16_pe_io_sample_out_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_16_pe_io_sample_out_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_16_pe_io_sample_out_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_16_pe_io_sample_out_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_16_pe_io_sample_out_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_16_pe_io_sample_out_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_16_pe_io_sample_out_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_16_pe_io_sample_out_bits_dest; // @[TreePEsWrapper.scala 57:69]
  wire  pes_16_pe_io_sample_out_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire  pes_17_clock; // @[TreePEsWrapper.scala 57:69]
  wire  pes_17_reset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_17_pe_io_sample_in_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_17_pe_io_sample_in_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_17_pe_io_sample_in_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_17_pe_io_sample_in_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_17_pe_io_sample_in_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_17_pe_io_sample_in_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_17_pe_io_sample_in_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_17_pe_io_sample_in_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_17_pe_io_sample_in_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_17_pe_io_sample_in_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_17_pe_io_sample_in_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_17_pe_io_sample_in_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_17_pe_io_sample_in_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_17_pe_io_sample_in_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_17_pe_io_sample_in_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_17_pe_io_sample_in_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_17_pe_io_sample_in_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_17_pe_io_sample_in_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_17_pe_io_sample_in_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_17_pe_io_sample_in_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire [12:0] pes_17_pe_io_mem_addr_1; // @[TreePEsWrapper.scala 57:69]
  wire [63:0] pes_17_pe_io_mem_dataOut_1; // @[TreePEsWrapper.scala 57:69]
  wire  pes_17_pe_io_sample_out_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_17_pe_io_sample_out_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_17_pe_io_sample_out_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_17_pe_io_sample_out_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_17_pe_io_sample_out_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_17_pe_io_sample_out_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_17_pe_io_sample_out_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_17_pe_io_sample_out_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_17_pe_io_sample_out_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_17_pe_io_sample_out_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_17_pe_io_sample_out_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_17_pe_io_sample_out_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_17_pe_io_sample_out_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_17_pe_io_sample_out_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_17_pe_io_sample_out_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_17_pe_io_sample_out_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_17_pe_io_sample_out_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_17_pe_io_sample_out_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_17_pe_io_sample_out_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_17_pe_io_sample_out_bits_dest; // @[TreePEsWrapper.scala 57:69]
  wire  pes_17_pe_io_sample_out_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire  pes_18_clock; // @[TreePEsWrapper.scala 57:69]
  wire  pes_18_reset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_18_pe_io_sample_in_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_18_pe_io_sample_in_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_18_pe_io_sample_in_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_18_pe_io_sample_in_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_18_pe_io_sample_in_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_18_pe_io_sample_in_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_18_pe_io_sample_in_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_18_pe_io_sample_in_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_18_pe_io_sample_in_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_18_pe_io_sample_in_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_18_pe_io_sample_in_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_18_pe_io_sample_in_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_18_pe_io_sample_in_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_18_pe_io_sample_in_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_18_pe_io_sample_in_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_18_pe_io_sample_in_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_18_pe_io_sample_in_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_18_pe_io_sample_in_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_18_pe_io_sample_in_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_18_pe_io_sample_in_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire [12:0] pes_18_pe_io_mem_addr_1; // @[TreePEsWrapper.scala 57:69]
  wire [63:0] pes_18_pe_io_mem_dataOut_1; // @[TreePEsWrapper.scala 57:69]
  wire  pes_18_pe_io_sample_out_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_18_pe_io_sample_out_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_18_pe_io_sample_out_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_18_pe_io_sample_out_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_18_pe_io_sample_out_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_18_pe_io_sample_out_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_18_pe_io_sample_out_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_18_pe_io_sample_out_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_18_pe_io_sample_out_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_18_pe_io_sample_out_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_18_pe_io_sample_out_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_18_pe_io_sample_out_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_18_pe_io_sample_out_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_18_pe_io_sample_out_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_18_pe_io_sample_out_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_18_pe_io_sample_out_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_18_pe_io_sample_out_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_18_pe_io_sample_out_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_18_pe_io_sample_out_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_18_pe_io_sample_out_bits_dest; // @[TreePEsWrapper.scala 57:69]
  wire  pes_18_pe_io_sample_out_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire  pes_19_clock; // @[TreePEsWrapper.scala 57:69]
  wire  pes_19_reset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_19_pe_io_sample_in_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_19_pe_io_sample_in_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_19_pe_io_sample_in_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_19_pe_io_sample_in_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_19_pe_io_sample_in_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_19_pe_io_sample_in_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_19_pe_io_sample_in_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_19_pe_io_sample_in_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_19_pe_io_sample_in_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_19_pe_io_sample_in_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_19_pe_io_sample_in_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_19_pe_io_sample_in_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_19_pe_io_sample_in_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_19_pe_io_sample_in_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_19_pe_io_sample_in_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_19_pe_io_sample_in_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_19_pe_io_sample_in_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_19_pe_io_sample_in_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_19_pe_io_sample_in_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_19_pe_io_sample_in_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire [12:0] pes_19_pe_io_mem_addr_1; // @[TreePEsWrapper.scala 57:69]
  wire [63:0] pes_19_pe_io_mem_dataOut_1; // @[TreePEsWrapper.scala 57:69]
  wire  pes_19_pe_io_sample_out_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_19_pe_io_sample_out_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_19_pe_io_sample_out_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_19_pe_io_sample_out_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_19_pe_io_sample_out_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_19_pe_io_sample_out_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_19_pe_io_sample_out_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_19_pe_io_sample_out_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_19_pe_io_sample_out_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_19_pe_io_sample_out_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_19_pe_io_sample_out_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_19_pe_io_sample_out_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_19_pe_io_sample_out_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_19_pe_io_sample_out_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_19_pe_io_sample_out_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_19_pe_io_sample_out_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_19_pe_io_sample_out_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_19_pe_io_sample_out_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_19_pe_io_sample_out_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_19_pe_io_sample_out_bits_dest; // @[TreePEsWrapper.scala 57:69]
  wire  pes_19_pe_io_sample_out_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire  pes_20_clock; // @[TreePEsWrapper.scala 57:69]
  wire  pes_20_reset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_20_pe_io_sample_in_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_20_pe_io_sample_in_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_20_pe_io_sample_in_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_20_pe_io_sample_in_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_20_pe_io_sample_in_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_20_pe_io_sample_in_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_20_pe_io_sample_in_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_20_pe_io_sample_in_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_20_pe_io_sample_in_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_20_pe_io_sample_in_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_20_pe_io_sample_in_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_20_pe_io_sample_in_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_20_pe_io_sample_in_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_20_pe_io_sample_in_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_20_pe_io_sample_in_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_20_pe_io_sample_in_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_20_pe_io_sample_in_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_20_pe_io_sample_in_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_20_pe_io_sample_in_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_20_pe_io_sample_in_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire [12:0] pes_20_pe_io_mem_addr_1; // @[TreePEsWrapper.scala 57:69]
  wire [63:0] pes_20_pe_io_mem_dataOut_1; // @[TreePEsWrapper.scala 57:69]
  wire  pes_20_pe_io_sample_out_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_20_pe_io_sample_out_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_20_pe_io_sample_out_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_20_pe_io_sample_out_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_20_pe_io_sample_out_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_20_pe_io_sample_out_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_20_pe_io_sample_out_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_20_pe_io_sample_out_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_20_pe_io_sample_out_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_20_pe_io_sample_out_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_20_pe_io_sample_out_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_20_pe_io_sample_out_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_20_pe_io_sample_out_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_20_pe_io_sample_out_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_20_pe_io_sample_out_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_20_pe_io_sample_out_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_20_pe_io_sample_out_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_20_pe_io_sample_out_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_20_pe_io_sample_out_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_20_pe_io_sample_out_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire  pes_21_clock; // @[TreePEsWrapper.scala 57:69]
  wire  pes_21_reset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_21_pe_io_sample_in_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_21_pe_io_sample_in_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_21_pe_io_sample_in_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_21_pe_io_sample_in_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_21_pe_io_sample_in_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_21_pe_io_sample_in_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_21_pe_io_sample_in_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_21_pe_io_sample_in_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_21_pe_io_sample_in_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_21_pe_io_sample_in_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_21_pe_io_sample_in_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_21_pe_io_sample_in_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_21_pe_io_sample_in_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_21_pe_io_sample_in_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_21_pe_io_sample_in_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_21_pe_io_sample_in_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_21_pe_io_sample_in_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_21_pe_io_sample_in_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_21_pe_io_sample_in_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_21_pe_io_sample_in_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire [12:0] pes_21_pe_io_mem_addr_1; // @[TreePEsWrapper.scala 57:69]
  wire [63:0] pes_21_pe_io_mem_dataOut_1; // @[TreePEsWrapper.scala 57:69]
  wire  pes_21_pe_io_sample_out_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_21_pe_io_sample_out_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_21_pe_io_sample_out_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_21_pe_io_sample_out_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_21_pe_io_sample_out_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_21_pe_io_sample_out_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_21_pe_io_sample_out_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_21_pe_io_sample_out_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_21_pe_io_sample_out_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_21_pe_io_sample_out_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_21_pe_io_sample_out_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_21_pe_io_sample_out_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_21_pe_io_sample_out_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_21_pe_io_sample_out_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_21_pe_io_sample_out_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_21_pe_io_sample_out_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_21_pe_io_sample_out_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_21_pe_io_sample_out_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_21_pe_io_sample_out_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_21_pe_io_sample_out_bits_dest; // @[TreePEsWrapper.scala 57:69]
  wire  pes_21_pe_io_sample_out_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire  pes_22_clock; // @[TreePEsWrapper.scala 57:69]
  wire  pes_22_reset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_22_pe_io_sample_in_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_22_pe_io_sample_in_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_22_pe_io_sample_in_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_22_pe_io_sample_in_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_22_pe_io_sample_in_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_22_pe_io_sample_in_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_22_pe_io_sample_in_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_22_pe_io_sample_in_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_22_pe_io_sample_in_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_22_pe_io_sample_in_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_22_pe_io_sample_in_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_22_pe_io_sample_in_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_22_pe_io_sample_in_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_22_pe_io_sample_in_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_22_pe_io_sample_in_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_22_pe_io_sample_in_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_22_pe_io_sample_in_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_22_pe_io_sample_in_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_22_pe_io_sample_in_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_22_pe_io_sample_in_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire [12:0] pes_22_pe_io_mem_addr_1; // @[TreePEsWrapper.scala 57:69]
  wire [63:0] pes_22_pe_io_mem_dataOut_1; // @[TreePEsWrapper.scala 57:69]
  wire  pes_22_pe_io_sample_out_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_22_pe_io_sample_out_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_22_pe_io_sample_out_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_22_pe_io_sample_out_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_22_pe_io_sample_out_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_22_pe_io_sample_out_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_22_pe_io_sample_out_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_22_pe_io_sample_out_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_22_pe_io_sample_out_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_22_pe_io_sample_out_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_22_pe_io_sample_out_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_22_pe_io_sample_out_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_22_pe_io_sample_out_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_22_pe_io_sample_out_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_22_pe_io_sample_out_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_22_pe_io_sample_out_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_22_pe_io_sample_out_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_22_pe_io_sample_out_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_22_pe_io_sample_out_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_22_pe_io_sample_out_bits_dest; // @[TreePEsWrapper.scala 57:69]
  wire  pes_22_pe_io_sample_out_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire  pes_23_clock; // @[TreePEsWrapper.scala 57:69]
  wire  pes_23_reset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_23_pe_io_sample_in_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_23_pe_io_sample_in_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_23_pe_io_sample_in_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_23_pe_io_sample_in_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_23_pe_io_sample_in_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_23_pe_io_sample_in_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_23_pe_io_sample_in_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_23_pe_io_sample_in_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_23_pe_io_sample_in_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_23_pe_io_sample_in_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_23_pe_io_sample_in_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_23_pe_io_sample_in_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_23_pe_io_sample_in_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_23_pe_io_sample_in_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_23_pe_io_sample_in_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_23_pe_io_sample_in_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_23_pe_io_sample_in_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_23_pe_io_sample_in_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_23_pe_io_sample_in_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_23_pe_io_sample_in_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire [12:0] pes_23_pe_io_mem_addr_1; // @[TreePEsWrapper.scala 57:69]
  wire [63:0] pes_23_pe_io_mem_dataOut_1; // @[TreePEsWrapper.scala 57:69]
  wire  pes_23_pe_io_sample_out_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_23_pe_io_sample_out_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_23_pe_io_sample_out_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_23_pe_io_sample_out_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_23_pe_io_sample_out_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_23_pe_io_sample_out_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_23_pe_io_sample_out_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_23_pe_io_sample_out_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_23_pe_io_sample_out_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_23_pe_io_sample_out_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_23_pe_io_sample_out_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_23_pe_io_sample_out_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_23_pe_io_sample_out_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_23_pe_io_sample_out_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_23_pe_io_sample_out_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_23_pe_io_sample_out_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_23_pe_io_sample_out_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_23_pe_io_sample_out_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_23_pe_io_sample_out_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_23_pe_io_sample_out_bits_dest; // @[TreePEsWrapper.scala 57:69]
  wire  pes_23_pe_io_sample_out_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire  pes_24_clock; // @[TreePEsWrapper.scala 57:69]
  wire  pes_24_reset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_24_pe_io_sample_in_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_24_pe_io_sample_in_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_24_pe_io_sample_in_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_24_pe_io_sample_in_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_24_pe_io_sample_in_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_24_pe_io_sample_in_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_24_pe_io_sample_in_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_24_pe_io_sample_in_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_24_pe_io_sample_in_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_24_pe_io_sample_in_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_24_pe_io_sample_in_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_24_pe_io_sample_in_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_24_pe_io_sample_in_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_24_pe_io_sample_in_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_24_pe_io_sample_in_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_24_pe_io_sample_in_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_24_pe_io_sample_in_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_24_pe_io_sample_in_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_24_pe_io_sample_in_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_24_pe_io_sample_in_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire [12:0] pes_24_pe_io_mem_addr_1; // @[TreePEsWrapper.scala 57:69]
  wire [63:0] pes_24_pe_io_mem_dataOut_1; // @[TreePEsWrapper.scala 57:69]
  wire  pes_24_pe_io_sample_out_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_24_pe_io_sample_out_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_24_pe_io_sample_out_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_24_pe_io_sample_out_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_24_pe_io_sample_out_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_24_pe_io_sample_out_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_24_pe_io_sample_out_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_24_pe_io_sample_out_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_24_pe_io_sample_out_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_24_pe_io_sample_out_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_24_pe_io_sample_out_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_24_pe_io_sample_out_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_24_pe_io_sample_out_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_24_pe_io_sample_out_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_24_pe_io_sample_out_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_24_pe_io_sample_out_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_24_pe_io_sample_out_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_24_pe_io_sample_out_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_24_pe_io_sample_out_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_24_pe_io_sample_out_bits_dest; // @[TreePEsWrapper.scala 57:69]
  wire  pes_24_pe_io_sample_out_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire  pes_25_clock; // @[TreePEsWrapper.scala 57:69]
  wire  pes_25_reset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_25_pe_io_sample_in_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_25_pe_io_sample_in_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_25_pe_io_sample_in_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_25_pe_io_sample_in_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_25_pe_io_sample_in_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_25_pe_io_sample_in_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_25_pe_io_sample_in_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_25_pe_io_sample_in_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_25_pe_io_sample_in_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_25_pe_io_sample_in_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_25_pe_io_sample_in_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_25_pe_io_sample_in_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_25_pe_io_sample_in_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_25_pe_io_sample_in_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_25_pe_io_sample_in_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_25_pe_io_sample_in_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_25_pe_io_sample_in_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_25_pe_io_sample_in_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_25_pe_io_sample_in_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_25_pe_io_sample_in_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire [12:0] pes_25_pe_io_mem_addr_1; // @[TreePEsWrapper.scala 57:69]
  wire [63:0] pes_25_pe_io_mem_dataOut_1; // @[TreePEsWrapper.scala 57:69]
  wire  pes_25_pe_io_sample_out_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_25_pe_io_sample_out_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_25_pe_io_sample_out_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_25_pe_io_sample_out_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_25_pe_io_sample_out_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_25_pe_io_sample_out_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_25_pe_io_sample_out_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_25_pe_io_sample_out_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_25_pe_io_sample_out_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_25_pe_io_sample_out_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_25_pe_io_sample_out_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_25_pe_io_sample_out_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_25_pe_io_sample_out_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_25_pe_io_sample_out_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_25_pe_io_sample_out_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_25_pe_io_sample_out_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_25_pe_io_sample_out_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_25_pe_io_sample_out_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_25_pe_io_sample_out_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_25_pe_io_sample_out_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire  pes_26_clock; // @[TreePEsWrapper.scala 57:69]
  wire  pes_26_reset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_26_pe_io_sample_in_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_26_pe_io_sample_in_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_26_pe_io_sample_in_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_26_pe_io_sample_in_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_26_pe_io_sample_in_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_26_pe_io_sample_in_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_26_pe_io_sample_in_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_26_pe_io_sample_in_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_26_pe_io_sample_in_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_26_pe_io_sample_in_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_26_pe_io_sample_in_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_26_pe_io_sample_in_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_26_pe_io_sample_in_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_26_pe_io_sample_in_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_26_pe_io_sample_in_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_26_pe_io_sample_in_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_26_pe_io_sample_in_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_26_pe_io_sample_in_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_26_pe_io_sample_in_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_26_pe_io_sample_in_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire [12:0] pes_26_pe_io_mem_addr_1; // @[TreePEsWrapper.scala 57:69]
  wire [63:0] pes_26_pe_io_mem_dataOut_1; // @[TreePEsWrapper.scala 57:69]
  wire  pes_26_pe_io_sample_out_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_26_pe_io_sample_out_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_26_pe_io_sample_out_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_26_pe_io_sample_out_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_26_pe_io_sample_out_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_26_pe_io_sample_out_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_26_pe_io_sample_out_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_26_pe_io_sample_out_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_26_pe_io_sample_out_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_26_pe_io_sample_out_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_26_pe_io_sample_out_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_26_pe_io_sample_out_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_26_pe_io_sample_out_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_26_pe_io_sample_out_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_26_pe_io_sample_out_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_26_pe_io_sample_out_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_26_pe_io_sample_out_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_26_pe_io_sample_out_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_26_pe_io_sample_out_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_26_pe_io_sample_out_bits_dest; // @[TreePEsWrapper.scala 57:69]
  wire  pes_26_pe_io_sample_out_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire  pes_27_clock; // @[TreePEsWrapper.scala 57:69]
  wire  pes_27_reset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_27_pe_io_sample_in_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_27_pe_io_sample_in_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_27_pe_io_sample_in_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_27_pe_io_sample_in_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_27_pe_io_sample_in_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_27_pe_io_sample_in_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_27_pe_io_sample_in_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_27_pe_io_sample_in_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_27_pe_io_sample_in_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_27_pe_io_sample_in_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_27_pe_io_sample_in_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_27_pe_io_sample_in_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_27_pe_io_sample_in_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_27_pe_io_sample_in_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_27_pe_io_sample_in_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_27_pe_io_sample_in_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_27_pe_io_sample_in_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_27_pe_io_sample_in_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_27_pe_io_sample_in_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_27_pe_io_sample_in_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire [12:0] pes_27_pe_io_mem_addr_1; // @[TreePEsWrapper.scala 57:69]
  wire [63:0] pes_27_pe_io_mem_dataOut_1; // @[TreePEsWrapper.scala 57:69]
  wire  pes_27_pe_io_sample_out_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_27_pe_io_sample_out_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_27_pe_io_sample_out_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_27_pe_io_sample_out_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_27_pe_io_sample_out_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_27_pe_io_sample_out_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_27_pe_io_sample_out_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_27_pe_io_sample_out_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_27_pe_io_sample_out_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_27_pe_io_sample_out_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_27_pe_io_sample_out_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_27_pe_io_sample_out_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_27_pe_io_sample_out_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_27_pe_io_sample_out_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_27_pe_io_sample_out_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_27_pe_io_sample_out_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_27_pe_io_sample_out_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_27_pe_io_sample_out_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_27_pe_io_sample_out_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_27_pe_io_sample_out_bits_dest; // @[TreePEsWrapper.scala 57:69]
  wire  pes_27_pe_io_sample_out_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire  pes_28_clock; // @[TreePEsWrapper.scala 57:69]
  wire  pes_28_reset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_28_pe_io_sample_in_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_28_pe_io_sample_in_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_28_pe_io_sample_in_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_28_pe_io_sample_in_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_28_pe_io_sample_in_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_28_pe_io_sample_in_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_28_pe_io_sample_in_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_28_pe_io_sample_in_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_28_pe_io_sample_in_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_28_pe_io_sample_in_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_28_pe_io_sample_in_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_28_pe_io_sample_in_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_28_pe_io_sample_in_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_28_pe_io_sample_in_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_28_pe_io_sample_in_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_28_pe_io_sample_in_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_28_pe_io_sample_in_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_28_pe_io_sample_in_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_28_pe_io_sample_in_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_28_pe_io_sample_in_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire [12:0] pes_28_pe_io_mem_addr_1; // @[TreePEsWrapper.scala 57:69]
  wire [63:0] pes_28_pe_io_mem_dataOut_1; // @[TreePEsWrapper.scala 57:69]
  wire  pes_28_pe_io_sample_out_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_28_pe_io_sample_out_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_28_pe_io_sample_out_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_28_pe_io_sample_out_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_28_pe_io_sample_out_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_28_pe_io_sample_out_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_28_pe_io_sample_out_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_28_pe_io_sample_out_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_28_pe_io_sample_out_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_28_pe_io_sample_out_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_28_pe_io_sample_out_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_28_pe_io_sample_out_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_28_pe_io_sample_out_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_28_pe_io_sample_out_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_28_pe_io_sample_out_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_28_pe_io_sample_out_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_28_pe_io_sample_out_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_28_pe_io_sample_out_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_28_pe_io_sample_out_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_28_pe_io_sample_out_bits_dest; // @[TreePEsWrapper.scala 57:69]
  wire  pes_28_pe_io_sample_out_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire  pes_29_clock; // @[TreePEsWrapper.scala 57:69]
  wire  pes_29_reset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_29_pe_io_sample_in_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_29_pe_io_sample_in_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_29_pe_io_sample_in_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_29_pe_io_sample_in_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_29_pe_io_sample_in_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_29_pe_io_sample_in_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_29_pe_io_sample_in_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_29_pe_io_sample_in_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_29_pe_io_sample_in_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_29_pe_io_sample_in_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_29_pe_io_sample_in_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_29_pe_io_sample_in_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_29_pe_io_sample_in_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_29_pe_io_sample_in_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_29_pe_io_sample_in_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_29_pe_io_sample_in_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_29_pe_io_sample_in_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_29_pe_io_sample_in_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_29_pe_io_sample_in_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_29_pe_io_sample_in_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire [12:0] pes_29_pe_io_mem_addr_1; // @[TreePEsWrapper.scala 57:69]
  wire [63:0] pes_29_pe_io_mem_dataOut_1; // @[TreePEsWrapper.scala 57:69]
  wire  pes_29_pe_io_sample_out_ready; // @[TreePEsWrapper.scala 57:69]
  wire  pes_29_pe_io_sample_out_valid; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_29_pe_io_sample_out_bits_features_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_29_pe_io_sample_out_bits_features_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_29_pe_io_sample_out_bits_features_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_29_pe_io_sample_out_bits_features_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_29_pe_io_sample_out_bits_features_4; // @[TreePEsWrapper.scala 57:69]
  wire [9:0] pes_29_pe_io_sample_out_bits_offset; // @[TreePEsWrapper.scala 57:69]
  wire  pes_29_pe_io_sample_out_bits_search_for_root; // @[TreePEsWrapper.scala 57:69]
  wire [7:0] pes_29_pe_io_sample_out_bits_tree_to_exec; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_29_pe_io_sample_out_bits_scores_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_29_pe_io_sample_out_bits_scores_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_29_pe_io_sample_out_bits_scores_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_29_pe_io_sample_out_bits_scores_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_29_pe_io_sample_out_bits_weights_0; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_29_pe_io_sample_out_bits_weights_1; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_29_pe_io_sample_out_bits_weights_2; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_29_pe_io_sample_out_bits_weights_3; // @[TreePEsWrapper.scala 57:69]
  wire [31:0] pes_29_pe_io_sample_out_bits_weights_4; // @[TreePEsWrapper.scala 57:69]
  wire  pes_29_pe_io_sample_out_bits_dest; // @[TreePEsWrapper.scala 57:69]
  wire  pes_29_pe_io_sample_out_bits_last; // @[TreePEsWrapper.scala 57:69]
  wire  brams_0_io_clk; // @[TreePEsWrapper.scala 58:71]
  wire  brams_0_io_a_en; // @[TreePEsWrapper.scala 58:71]
  wire  brams_0_io_a_wr; // @[TreePEsWrapper.scala 58:71]
  wire [12:0] brams_0_io_a_addr; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_0_io_a_din; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_0_io_a_dout; // @[TreePEsWrapper.scala 58:71]
  wire [10:0] brams_0_io_b_addr; // @[TreePEsWrapper.scala 58:71]
  wire [63:0] brams_0_io_b_dout; // @[TreePEsWrapper.scala 58:71]
  wire  brams_1_io_clk; // @[TreePEsWrapper.scala 58:71]
  wire  brams_1_io_a_en; // @[TreePEsWrapper.scala 58:71]
  wire  brams_1_io_a_wr; // @[TreePEsWrapper.scala 58:71]
  wire [12:0] brams_1_io_a_addr; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_1_io_a_din; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_1_io_a_dout; // @[TreePEsWrapper.scala 58:71]
  wire [10:0] brams_1_io_b_addr; // @[TreePEsWrapper.scala 58:71]
  wire [63:0] brams_1_io_b_dout; // @[TreePEsWrapper.scala 58:71]
  wire  brams_2_io_clk; // @[TreePEsWrapper.scala 58:71]
  wire  brams_2_io_a_en; // @[TreePEsWrapper.scala 58:71]
  wire  brams_2_io_a_wr; // @[TreePEsWrapper.scala 58:71]
  wire [12:0] brams_2_io_a_addr; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_2_io_a_din; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_2_io_a_dout; // @[TreePEsWrapper.scala 58:71]
  wire [10:0] brams_2_io_b_addr; // @[TreePEsWrapper.scala 58:71]
  wire [63:0] brams_2_io_b_dout; // @[TreePEsWrapper.scala 58:71]
  wire  brams_3_io_clk; // @[TreePEsWrapper.scala 58:71]
  wire  brams_3_io_a_en; // @[TreePEsWrapper.scala 58:71]
  wire  brams_3_io_a_wr; // @[TreePEsWrapper.scala 58:71]
  wire [12:0] brams_3_io_a_addr; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_3_io_a_din; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_3_io_a_dout; // @[TreePEsWrapper.scala 58:71]
  wire [10:0] brams_3_io_b_addr; // @[TreePEsWrapper.scala 58:71]
  wire [63:0] brams_3_io_b_dout; // @[TreePEsWrapper.scala 58:71]
  wire  brams_4_io_clk; // @[TreePEsWrapper.scala 58:71]
  wire  brams_4_io_a_en; // @[TreePEsWrapper.scala 58:71]
  wire  brams_4_io_a_wr; // @[TreePEsWrapper.scala 58:71]
  wire [12:0] brams_4_io_a_addr; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_4_io_a_din; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_4_io_a_dout; // @[TreePEsWrapper.scala 58:71]
  wire [10:0] brams_4_io_b_addr; // @[TreePEsWrapper.scala 58:71]
  wire [63:0] brams_4_io_b_dout; // @[TreePEsWrapper.scala 58:71]
  wire  brams_5_io_clk; // @[TreePEsWrapper.scala 58:71]
  wire  brams_5_io_a_en; // @[TreePEsWrapper.scala 58:71]
  wire  brams_5_io_a_wr; // @[TreePEsWrapper.scala 58:71]
  wire [12:0] brams_5_io_a_addr; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_5_io_a_din; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_5_io_a_dout; // @[TreePEsWrapper.scala 58:71]
  wire [10:0] brams_5_io_b_addr; // @[TreePEsWrapper.scala 58:71]
  wire [63:0] brams_5_io_b_dout; // @[TreePEsWrapper.scala 58:71]
  wire  brams_6_io_clk; // @[TreePEsWrapper.scala 58:71]
  wire  brams_6_io_a_en; // @[TreePEsWrapper.scala 58:71]
  wire  brams_6_io_a_wr; // @[TreePEsWrapper.scala 58:71]
  wire [12:0] brams_6_io_a_addr; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_6_io_a_din; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_6_io_a_dout; // @[TreePEsWrapper.scala 58:71]
  wire [10:0] brams_6_io_b_addr; // @[TreePEsWrapper.scala 58:71]
  wire [63:0] brams_6_io_b_dout; // @[TreePEsWrapper.scala 58:71]
  wire  brams_7_io_clk; // @[TreePEsWrapper.scala 58:71]
  wire  brams_7_io_a_en; // @[TreePEsWrapper.scala 58:71]
  wire  brams_7_io_a_wr; // @[TreePEsWrapper.scala 58:71]
  wire [12:0] brams_7_io_a_addr; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_7_io_a_din; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_7_io_a_dout; // @[TreePEsWrapper.scala 58:71]
  wire [10:0] brams_7_io_b_addr; // @[TreePEsWrapper.scala 58:71]
  wire [63:0] brams_7_io_b_dout; // @[TreePEsWrapper.scala 58:71]
  wire  brams_8_io_clk; // @[TreePEsWrapper.scala 58:71]
  wire  brams_8_io_a_en; // @[TreePEsWrapper.scala 58:71]
  wire  brams_8_io_a_wr; // @[TreePEsWrapper.scala 58:71]
  wire [12:0] brams_8_io_a_addr; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_8_io_a_din; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_8_io_a_dout; // @[TreePEsWrapper.scala 58:71]
  wire [10:0] brams_8_io_b_addr; // @[TreePEsWrapper.scala 58:71]
  wire [63:0] brams_8_io_b_dout; // @[TreePEsWrapper.scala 58:71]
  wire  brams_9_io_clk; // @[TreePEsWrapper.scala 58:71]
  wire  brams_9_io_a_en; // @[TreePEsWrapper.scala 58:71]
  wire  brams_9_io_a_wr; // @[TreePEsWrapper.scala 58:71]
  wire [12:0] brams_9_io_a_addr; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_9_io_a_din; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_9_io_a_dout; // @[TreePEsWrapper.scala 58:71]
  wire [10:0] brams_9_io_b_addr; // @[TreePEsWrapper.scala 58:71]
  wire [63:0] brams_9_io_b_dout; // @[TreePEsWrapper.scala 58:71]
  wire  brams_10_io_clk; // @[TreePEsWrapper.scala 58:71]
  wire  brams_10_io_a_en; // @[TreePEsWrapper.scala 58:71]
  wire  brams_10_io_a_wr; // @[TreePEsWrapper.scala 58:71]
  wire [12:0] brams_10_io_a_addr; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_10_io_a_din; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_10_io_a_dout; // @[TreePEsWrapper.scala 58:71]
  wire [10:0] brams_10_io_b_addr; // @[TreePEsWrapper.scala 58:71]
  wire [63:0] brams_10_io_b_dout; // @[TreePEsWrapper.scala 58:71]
  wire  brams_11_io_clk; // @[TreePEsWrapper.scala 58:71]
  wire  brams_11_io_a_en; // @[TreePEsWrapper.scala 58:71]
  wire  brams_11_io_a_wr; // @[TreePEsWrapper.scala 58:71]
  wire [12:0] brams_11_io_a_addr; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_11_io_a_din; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_11_io_a_dout; // @[TreePEsWrapper.scala 58:71]
  wire [10:0] brams_11_io_b_addr; // @[TreePEsWrapper.scala 58:71]
  wire [63:0] brams_11_io_b_dout; // @[TreePEsWrapper.scala 58:71]
  wire  brams_12_io_clk; // @[TreePEsWrapper.scala 58:71]
  wire  brams_12_io_a_en; // @[TreePEsWrapper.scala 58:71]
  wire  brams_12_io_a_wr; // @[TreePEsWrapper.scala 58:71]
  wire [12:0] brams_12_io_a_addr; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_12_io_a_din; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_12_io_a_dout; // @[TreePEsWrapper.scala 58:71]
  wire [10:0] brams_12_io_b_addr; // @[TreePEsWrapper.scala 58:71]
  wire [63:0] brams_12_io_b_dout; // @[TreePEsWrapper.scala 58:71]
  wire  brams_13_io_clk; // @[TreePEsWrapper.scala 58:71]
  wire  brams_13_io_a_en; // @[TreePEsWrapper.scala 58:71]
  wire  brams_13_io_a_wr; // @[TreePEsWrapper.scala 58:71]
  wire [12:0] brams_13_io_a_addr; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_13_io_a_din; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_13_io_a_dout; // @[TreePEsWrapper.scala 58:71]
  wire [10:0] brams_13_io_b_addr; // @[TreePEsWrapper.scala 58:71]
  wire [63:0] brams_13_io_b_dout; // @[TreePEsWrapper.scala 58:71]
  wire  brams_14_io_clk; // @[TreePEsWrapper.scala 58:71]
  wire  brams_14_io_a_en; // @[TreePEsWrapper.scala 58:71]
  wire  brams_14_io_a_wr; // @[TreePEsWrapper.scala 58:71]
  wire [12:0] brams_14_io_a_addr; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_14_io_a_din; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_14_io_a_dout; // @[TreePEsWrapper.scala 58:71]
  wire [10:0] brams_14_io_b_addr; // @[TreePEsWrapper.scala 58:71]
  wire [63:0] brams_14_io_b_dout; // @[TreePEsWrapper.scala 58:71]
  wire  brams_15_io_clk; // @[TreePEsWrapper.scala 58:71]
  wire  brams_15_io_a_en; // @[TreePEsWrapper.scala 58:71]
  wire  brams_15_io_a_wr; // @[TreePEsWrapper.scala 58:71]
  wire [12:0] brams_15_io_a_addr; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_15_io_a_din; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_15_io_a_dout; // @[TreePEsWrapper.scala 58:71]
  wire [10:0] brams_15_io_b_addr; // @[TreePEsWrapper.scala 58:71]
  wire [63:0] brams_15_io_b_dout; // @[TreePEsWrapper.scala 58:71]
  wire  brams_16_io_clk; // @[TreePEsWrapper.scala 58:71]
  wire  brams_16_io_a_en; // @[TreePEsWrapper.scala 58:71]
  wire  brams_16_io_a_wr; // @[TreePEsWrapper.scala 58:71]
  wire [12:0] brams_16_io_a_addr; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_16_io_a_din; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_16_io_a_dout; // @[TreePEsWrapper.scala 58:71]
  wire [10:0] brams_16_io_b_addr; // @[TreePEsWrapper.scala 58:71]
  wire [63:0] brams_16_io_b_dout; // @[TreePEsWrapper.scala 58:71]
  wire  brams_17_io_clk; // @[TreePEsWrapper.scala 58:71]
  wire  brams_17_io_a_en; // @[TreePEsWrapper.scala 58:71]
  wire  brams_17_io_a_wr; // @[TreePEsWrapper.scala 58:71]
  wire [12:0] brams_17_io_a_addr; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_17_io_a_din; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_17_io_a_dout; // @[TreePEsWrapper.scala 58:71]
  wire [10:0] brams_17_io_b_addr; // @[TreePEsWrapper.scala 58:71]
  wire [63:0] brams_17_io_b_dout; // @[TreePEsWrapper.scala 58:71]
  wire  brams_18_io_clk; // @[TreePEsWrapper.scala 58:71]
  wire  brams_18_io_a_en; // @[TreePEsWrapper.scala 58:71]
  wire  brams_18_io_a_wr; // @[TreePEsWrapper.scala 58:71]
  wire [12:0] brams_18_io_a_addr; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_18_io_a_din; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_18_io_a_dout; // @[TreePEsWrapper.scala 58:71]
  wire [10:0] brams_18_io_b_addr; // @[TreePEsWrapper.scala 58:71]
  wire [63:0] brams_18_io_b_dout; // @[TreePEsWrapper.scala 58:71]
  wire  brams_19_io_clk; // @[TreePEsWrapper.scala 58:71]
  wire  brams_19_io_a_en; // @[TreePEsWrapper.scala 58:71]
  wire  brams_19_io_a_wr; // @[TreePEsWrapper.scala 58:71]
  wire [12:0] brams_19_io_a_addr; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_19_io_a_din; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_19_io_a_dout; // @[TreePEsWrapper.scala 58:71]
  wire [10:0] brams_19_io_b_addr; // @[TreePEsWrapper.scala 58:71]
  wire [63:0] brams_19_io_b_dout; // @[TreePEsWrapper.scala 58:71]
  wire  brams_20_io_clk; // @[TreePEsWrapper.scala 58:71]
  wire  brams_20_io_a_en; // @[TreePEsWrapper.scala 58:71]
  wire  brams_20_io_a_wr; // @[TreePEsWrapper.scala 58:71]
  wire [12:0] brams_20_io_a_addr; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_20_io_a_din; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_20_io_a_dout; // @[TreePEsWrapper.scala 58:71]
  wire [10:0] brams_20_io_b_addr; // @[TreePEsWrapper.scala 58:71]
  wire [63:0] brams_20_io_b_dout; // @[TreePEsWrapper.scala 58:71]
  wire  brams_21_io_clk; // @[TreePEsWrapper.scala 58:71]
  wire  brams_21_io_a_en; // @[TreePEsWrapper.scala 58:71]
  wire  brams_21_io_a_wr; // @[TreePEsWrapper.scala 58:71]
  wire [12:0] brams_21_io_a_addr; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_21_io_a_din; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_21_io_a_dout; // @[TreePEsWrapper.scala 58:71]
  wire [10:0] brams_21_io_b_addr; // @[TreePEsWrapper.scala 58:71]
  wire [63:0] brams_21_io_b_dout; // @[TreePEsWrapper.scala 58:71]
  wire  brams_22_io_clk; // @[TreePEsWrapper.scala 58:71]
  wire  brams_22_io_a_en; // @[TreePEsWrapper.scala 58:71]
  wire  brams_22_io_a_wr; // @[TreePEsWrapper.scala 58:71]
  wire [12:0] brams_22_io_a_addr; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_22_io_a_din; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_22_io_a_dout; // @[TreePEsWrapper.scala 58:71]
  wire [10:0] brams_22_io_b_addr; // @[TreePEsWrapper.scala 58:71]
  wire [63:0] brams_22_io_b_dout; // @[TreePEsWrapper.scala 58:71]
  wire  brams_23_io_clk; // @[TreePEsWrapper.scala 58:71]
  wire  brams_23_io_a_en; // @[TreePEsWrapper.scala 58:71]
  wire  brams_23_io_a_wr; // @[TreePEsWrapper.scala 58:71]
  wire [12:0] brams_23_io_a_addr; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_23_io_a_din; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_23_io_a_dout; // @[TreePEsWrapper.scala 58:71]
  wire [10:0] brams_23_io_b_addr; // @[TreePEsWrapper.scala 58:71]
  wire [63:0] brams_23_io_b_dout; // @[TreePEsWrapper.scala 58:71]
  wire  brams_24_io_clk; // @[TreePEsWrapper.scala 58:71]
  wire  brams_24_io_a_en; // @[TreePEsWrapper.scala 58:71]
  wire  brams_24_io_a_wr; // @[TreePEsWrapper.scala 58:71]
  wire [12:0] brams_24_io_a_addr; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_24_io_a_din; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_24_io_a_dout; // @[TreePEsWrapper.scala 58:71]
  wire [10:0] brams_24_io_b_addr; // @[TreePEsWrapper.scala 58:71]
  wire [63:0] brams_24_io_b_dout; // @[TreePEsWrapper.scala 58:71]
  wire  brams_25_io_clk; // @[TreePEsWrapper.scala 58:71]
  wire  brams_25_io_a_en; // @[TreePEsWrapper.scala 58:71]
  wire  brams_25_io_a_wr; // @[TreePEsWrapper.scala 58:71]
  wire [12:0] brams_25_io_a_addr; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_25_io_a_din; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_25_io_a_dout; // @[TreePEsWrapper.scala 58:71]
  wire [10:0] brams_25_io_b_addr; // @[TreePEsWrapper.scala 58:71]
  wire [63:0] brams_25_io_b_dout; // @[TreePEsWrapper.scala 58:71]
  wire  brams_26_io_clk; // @[TreePEsWrapper.scala 58:71]
  wire  brams_26_io_a_en; // @[TreePEsWrapper.scala 58:71]
  wire  brams_26_io_a_wr; // @[TreePEsWrapper.scala 58:71]
  wire [12:0] brams_26_io_a_addr; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_26_io_a_din; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_26_io_a_dout; // @[TreePEsWrapper.scala 58:71]
  wire [10:0] brams_26_io_b_addr; // @[TreePEsWrapper.scala 58:71]
  wire [63:0] brams_26_io_b_dout; // @[TreePEsWrapper.scala 58:71]
  wire  brams_27_io_clk; // @[TreePEsWrapper.scala 58:71]
  wire  brams_27_io_a_en; // @[TreePEsWrapper.scala 58:71]
  wire  brams_27_io_a_wr; // @[TreePEsWrapper.scala 58:71]
  wire [12:0] brams_27_io_a_addr; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_27_io_a_din; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_27_io_a_dout; // @[TreePEsWrapper.scala 58:71]
  wire [10:0] brams_27_io_b_addr; // @[TreePEsWrapper.scala 58:71]
  wire [63:0] brams_27_io_b_dout; // @[TreePEsWrapper.scala 58:71]
  wire  brams_28_io_clk; // @[TreePEsWrapper.scala 58:71]
  wire  brams_28_io_a_en; // @[TreePEsWrapper.scala 58:71]
  wire  brams_28_io_a_wr; // @[TreePEsWrapper.scala 58:71]
  wire [12:0] brams_28_io_a_addr; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_28_io_a_din; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_28_io_a_dout; // @[TreePEsWrapper.scala 58:71]
  wire [10:0] brams_28_io_b_addr; // @[TreePEsWrapper.scala 58:71]
  wire [63:0] brams_28_io_b_dout; // @[TreePEsWrapper.scala 58:71]
  wire  brams_29_io_clk; // @[TreePEsWrapper.scala 58:71]
  wire  brams_29_io_a_en; // @[TreePEsWrapper.scala 58:71]
  wire  brams_29_io_a_wr; // @[TreePEsWrapper.scala 58:71]
  wire [12:0] brams_29_io_a_addr; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_29_io_a_din; // @[TreePEsWrapper.scala 58:71]
  wire [31:0] brams_29_io_a_dout; // @[TreePEsWrapper.scala 58:71]
  wire [10:0] brams_29_io_b_addr; // @[TreePEsWrapper.scala 58:71]
  wire [63:0] brams_29_io_b_dout; // @[TreePEsWrapper.scala 58:71]
  wire  first_interconnect_clock; // @[TreePEsWrapper.scala 60:44]
  wire  first_interconnect_reset; // @[TreePEsWrapper.scala 60:44]
  wire  first_interconnect_io_sample_entering_ready; // @[TreePEsWrapper.scala 60:44]
  wire  first_interconnect_io_sample_entering_valid; // @[TreePEsWrapper.scala 60:44]
  wire [31:0] first_interconnect_io_sample_entering_bits_features_0; // @[TreePEsWrapper.scala 60:44]
  wire [31:0] first_interconnect_io_sample_entering_bits_features_1; // @[TreePEsWrapper.scala 60:44]
  wire [31:0] first_interconnect_io_sample_entering_bits_features_2; // @[TreePEsWrapper.scala 60:44]
  wire [31:0] first_interconnect_io_sample_entering_bits_features_3; // @[TreePEsWrapper.scala 60:44]
  wire [31:0] first_interconnect_io_sample_entering_bits_features_4; // @[TreePEsWrapper.scala 60:44]
  wire [9:0] first_interconnect_io_sample_entering_bits_offset; // @[TreePEsWrapper.scala 60:44]
  wire  first_interconnect_io_sample_entering_bits_search_for_root; // @[TreePEsWrapper.scala 60:44]
  wire [7:0] first_interconnect_io_sample_entering_bits_tree_to_exec; // @[TreePEsWrapper.scala 60:44]
  wire [31:0] first_interconnect_io_sample_entering_bits_scores_0; // @[TreePEsWrapper.scala 60:44]
  wire [31:0] first_interconnect_io_sample_entering_bits_scores_1; // @[TreePEsWrapper.scala 60:44]
  wire [31:0] first_interconnect_io_sample_entering_bits_scores_2; // @[TreePEsWrapper.scala 60:44]
  wire [31:0] first_interconnect_io_sample_entering_bits_scores_3; // @[TreePEsWrapper.scala 60:44]
  wire [31:0] first_interconnect_io_sample_entering_bits_weights_0; // @[TreePEsWrapper.scala 60:44]
  wire [31:0] first_interconnect_io_sample_entering_bits_weights_1; // @[TreePEsWrapper.scala 60:44]
  wire [31:0] first_interconnect_io_sample_entering_bits_weights_2; // @[TreePEsWrapper.scala 60:44]
  wire [31:0] first_interconnect_io_sample_entering_bits_weights_3; // @[TreePEsWrapper.scala 60:44]
  wire [31:0] first_interconnect_io_sample_entering_bits_weights_4; // @[TreePEsWrapper.scala 60:44]
  wire  first_interconnect_io_sample_entering_bits_last; // @[TreePEsWrapper.scala 60:44]
  wire  first_interconnect_io_sample_looping_ready; // @[TreePEsWrapper.scala 60:44]
  wire  first_interconnect_io_sample_looping_valid; // @[TreePEsWrapper.scala 60:44]
  wire [31:0] first_interconnect_io_sample_looping_bits_features_0; // @[TreePEsWrapper.scala 60:44]
  wire [31:0] first_interconnect_io_sample_looping_bits_features_1; // @[TreePEsWrapper.scala 60:44]
  wire [31:0] first_interconnect_io_sample_looping_bits_features_2; // @[TreePEsWrapper.scala 60:44]
  wire [31:0] first_interconnect_io_sample_looping_bits_features_3; // @[TreePEsWrapper.scala 60:44]
  wire [31:0] first_interconnect_io_sample_looping_bits_features_4; // @[TreePEsWrapper.scala 60:44]
  wire [9:0] first_interconnect_io_sample_looping_bits_offset; // @[TreePEsWrapper.scala 60:44]
  wire  first_interconnect_io_sample_looping_bits_search_for_root; // @[TreePEsWrapper.scala 60:44]
  wire [7:0] first_interconnect_io_sample_looping_bits_tree_to_exec; // @[TreePEsWrapper.scala 60:44]
  wire [31:0] first_interconnect_io_sample_looping_bits_scores_0; // @[TreePEsWrapper.scala 60:44]
  wire [31:0] first_interconnect_io_sample_looping_bits_scores_1; // @[TreePEsWrapper.scala 60:44]
  wire [31:0] first_interconnect_io_sample_looping_bits_scores_2; // @[TreePEsWrapper.scala 60:44]
  wire [31:0] first_interconnect_io_sample_looping_bits_scores_3; // @[TreePEsWrapper.scala 60:44]
  wire [31:0] first_interconnect_io_sample_looping_bits_weights_0; // @[TreePEsWrapper.scala 60:44]
  wire [31:0] first_interconnect_io_sample_looping_bits_weights_1; // @[TreePEsWrapper.scala 60:44]
  wire [31:0] first_interconnect_io_sample_looping_bits_weights_2; // @[TreePEsWrapper.scala 60:44]
  wire [31:0] first_interconnect_io_sample_looping_bits_weights_3; // @[TreePEsWrapper.scala 60:44]
  wire [31:0] first_interconnect_io_sample_looping_bits_weights_4; // @[TreePEsWrapper.scala 60:44]
  wire  first_interconnect_io_sample_looping_bits_last; // @[TreePEsWrapper.scala 60:44]
  wire  first_interconnect_io_sample_out_ready; // @[TreePEsWrapper.scala 60:44]
  wire  first_interconnect_io_sample_out_valid; // @[TreePEsWrapper.scala 60:44]
  wire [31:0] first_interconnect_io_sample_out_bits_features_0; // @[TreePEsWrapper.scala 60:44]
  wire [31:0] first_interconnect_io_sample_out_bits_features_1; // @[TreePEsWrapper.scala 60:44]
  wire [31:0] first_interconnect_io_sample_out_bits_features_2; // @[TreePEsWrapper.scala 60:44]
  wire [31:0] first_interconnect_io_sample_out_bits_features_3; // @[TreePEsWrapper.scala 60:44]
  wire [31:0] first_interconnect_io_sample_out_bits_features_4; // @[TreePEsWrapper.scala 60:44]
  wire [9:0] first_interconnect_io_sample_out_bits_offset; // @[TreePEsWrapper.scala 60:44]
  wire  first_interconnect_io_sample_out_bits_search_for_root; // @[TreePEsWrapper.scala 60:44]
  wire [7:0] first_interconnect_io_sample_out_bits_tree_to_exec; // @[TreePEsWrapper.scala 60:44]
  wire [31:0] first_interconnect_io_sample_out_bits_scores_0; // @[TreePEsWrapper.scala 60:44]
  wire [31:0] first_interconnect_io_sample_out_bits_scores_1; // @[TreePEsWrapper.scala 60:44]
  wire [31:0] first_interconnect_io_sample_out_bits_scores_2; // @[TreePEsWrapper.scala 60:44]
  wire [31:0] first_interconnect_io_sample_out_bits_scores_3; // @[TreePEsWrapper.scala 60:44]
  wire [31:0] first_interconnect_io_sample_out_bits_weights_0; // @[TreePEsWrapper.scala 60:44]
  wire [31:0] first_interconnect_io_sample_out_bits_weights_1; // @[TreePEsWrapper.scala 60:44]
  wire [31:0] first_interconnect_io_sample_out_bits_weights_2; // @[TreePEsWrapper.scala 60:44]
  wire [31:0] first_interconnect_io_sample_out_bits_weights_3; // @[TreePEsWrapper.scala 60:44]
  wire [31:0] first_interconnect_io_sample_out_bits_weights_4; // @[TreePEsWrapper.scala 60:44]
  wire  first_interconnect_io_sample_out_bits_last; // @[TreePEsWrapper.scala 60:44]
  wire  last_interconnect_clock; // @[TreePEsWrapper.scala 61:43]
  wire  last_interconnect_reset; // @[TreePEsWrapper.scala 61:43]
  wire  last_interconnect_io_sample_in_ready; // @[TreePEsWrapper.scala 61:43]
  wire  last_interconnect_io_sample_in_valid; // @[TreePEsWrapper.scala 61:43]
  wire [31:0] last_interconnect_io_sample_in_bits_features_0; // @[TreePEsWrapper.scala 61:43]
  wire [31:0] last_interconnect_io_sample_in_bits_features_1; // @[TreePEsWrapper.scala 61:43]
  wire [31:0] last_interconnect_io_sample_in_bits_features_2; // @[TreePEsWrapper.scala 61:43]
  wire [31:0] last_interconnect_io_sample_in_bits_features_3; // @[TreePEsWrapper.scala 61:43]
  wire [31:0] last_interconnect_io_sample_in_bits_features_4; // @[TreePEsWrapper.scala 61:43]
  wire [9:0] last_interconnect_io_sample_in_bits_offset; // @[TreePEsWrapper.scala 61:43]
  wire  last_interconnect_io_sample_in_bits_search_for_root; // @[TreePEsWrapper.scala 61:43]
  wire [7:0] last_interconnect_io_sample_in_bits_tree_to_exec; // @[TreePEsWrapper.scala 61:43]
  wire [31:0] last_interconnect_io_sample_in_bits_scores_0; // @[TreePEsWrapper.scala 61:43]
  wire [31:0] last_interconnect_io_sample_in_bits_scores_1; // @[TreePEsWrapper.scala 61:43]
  wire [31:0] last_interconnect_io_sample_in_bits_scores_2; // @[TreePEsWrapper.scala 61:43]
  wire [31:0] last_interconnect_io_sample_in_bits_scores_3; // @[TreePEsWrapper.scala 61:43]
  wire [31:0] last_interconnect_io_sample_in_bits_weights_0; // @[TreePEsWrapper.scala 61:43]
  wire [31:0] last_interconnect_io_sample_in_bits_weights_1; // @[TreePEsWrapper.scala 61:43]
  wire [31:0] last_interconnect_io_sample_in_bits_weights_2; // @[TreePEsWrapper.scala 61:43]
  wire [31:0] last_interconnect_io_sample_in_bits_weights_3; // @[TreePEsWrapper.scala 61:43]
  wire [31:0] last_interconnect_io_sample_in_bits_weights_4; // @[TreePEsWrapper.scala 61:43]
  wire  last_interconnect_io_sample_in_bits_dest; // @[TreePEsWrapper.scala 61:43]
  wire  last_interconnect_io_sample_in_bits_last; // @[TreePEsWrapper.scala 61:43]
  wire  last_interconnect_io_sample_looping_ready; // @[TreePEsWrapper.scala 61:43]
  wire  last_interconnect_io_sample_looping_valid; // @[TreePEsWrapper.scala 61:43]
  wire [31:0] last_interconnect_io_sample_looping_bits_features_0; // @[TreePEsWrapper.scala 61:43]
  wire [31:0] last_interconnect_io_sample_looping_bits_features_1; // @[TreePEsWrapper.scala 61:43]
  wire [31:0] last_interconnect_io_sample_looping_bits_features_2; // @[TreePEsWrapper.scala 61:43]
  wire [31:0] last_interconnect_io_sample_looping_bits_features_3; // @[TreePEsWrapper.scala 61:43]
  wire [31:0] last_interconnect_io_sample_looping_bits_features_4; // @[TreePEsWrapper.scala 61:43]
  wire [9:0] last_interconnect_io_sample_looping_bits_offset; // @[TreePEsWrapper.scala 61:43]
  wire  last_interconnect_io_sample_looping_bits_search_for_root; // @[TreePEsWrapper.scala 61:43]
  wire [7:0] last_interconnect_io_sample_looping_bits_tree_to_exec; // @[TreePEsWrapper.scala 61:43]
  wire [31:0] last_interconnect_io_sample_looping_bits_scores_0; // @[TreePEsWrapper.scala 61:43]
  wire [31:0] last_interconnect_io_sample_looping_bits_scores_1; // @[TreePEsWrapper.scala 61:43]
  wire [31:0] last_interconnect_io_sample_looping_bits_scores_2; // @[TreePEsWrapper.scala 61:43]
  wire [31:0] last_interconnect_io_sample_looping_bits_scores_3; // @[TreePEsWrapper.scala 61:43]
  wire [31:0] last_interconnect_io_sample_looping_bits_weights_0; // @[TreePEsWrapper.scala 61:43]
  wire [31:0] last_interconnect_io_sample_looping_bits_weights_1; // @[TreePEsWrapper.scala 61:43]
  wire [31:0] last_interconnect_io_sample_looping_bits_weights_2; // @[TreePEsWrapper.scala 61:43]
  wire [31:0] last_interconnect_io_sample_looping_bits_weights_3; // @[TreePEsWrapper.scala 61:43]
  wire [31:0] last_interconnect_io_sample_looping_bits_weights_4; // @[TreePEsWrapper.scala 61:43]
  wire  last_interconnect_io_sample_looping_bits_last; // @[TreePEsWrapper.scala 61:43]
  wire  last_interconnect_io_sample_leaving_ready; // @[TreePEsWrapper.scala 61:43]
  wire  last_interconnect_io_sample_leaving_valid; // @[TreePEsWrapper.scala 61:43]
  wire [31:0] last_interconnect_io_sample_leaving_bits_features_0; // @[TreePEsWrapper.scala 61:43]
  wire [31:0] last_interconnect_io_sample_leaving_bits_features_1; // @[TreePEsWrapper.scala 61:43]
  wire [31:0] last_interconnect_io_sample_leaving_bits_features_2; // @[TreePEsWrapper.scala 61:43]
  wire [31:0] last_interconnect_io_sample_leaving_bits_features_3; // @[TreePEsWrapper.scala 61:43]
  wire [31:0] last_interconnect_io_sample_leaving_bits_features_4; // @[TreePEsWrapper.scala 61:43]
  wire [9:0] last_interconnect_io_sample_leaving_bits_offset; // @[TreePEsWrapper.scala 61:43]
  wire  last_interconnect_io_sample_leaving_bits_shift; // @[TreePEsWrapper.scala 61:43]
  wire  last_interconnect_io_sample_leaving_bits_search_for_root; // @[TreePEsWrapper.scala 61:43]
  wire [7:0] last_interconnect_io_sample_leaving_bits_tree_to_exec; // @[TreePEsWrapper.scala 61:43]
  wire [31:0] last_interconnect_io_sample_leaving_bits_scores_0; // @[TreePEsWrapper.scala 61:43]
  wire [31:0] last_interconnect_io_sample_leaving_bits_scores_1; // @[TreePEsWrapper.scala 61:43]
  wire [31:0] last_interconnect_io_sample_leaving_bits_scores_2; // @[TreePEsWrapper.scala 61:43]
  wire [31:0] last_interconnect_io_sample_leaving_bits_scores_3; // @[TreePEsWrapper.scala 61:43]
  wire  last_interconnect_io_sample_leaving_bits_last; // @[TreePEsWrapper.scala 61:43]
  wire  increment_clock; // @[TreePEsWrapper.scala 62:35]
  wire  increment_reset; // @[TreePEsWrapper.scala 62:35]
  wire  increment_io_sample_in_ready; // @[TreePEsWrapper.scala 62:35]
  wire  increment_io_sample_in_valid; // @[TreePEsWrapper.scala 62:35]
  wire [31:0] increment_io_sample_in_bits_features_0; // @[TreePEsWrapper.scala 62:35]
  wire [31:0] increment_io_sample_in_bits_features_1; // @[TreePEsWrapper.scala 62:35]
  wire [31:0] increment_io_sample_in_bits_features_2; // @[TreePEsWrapper.scala 62:35]
  wire [31:0] increment_io_sample_in_bits_features_3; // @[TreePEsWrapper.scala 62:35]
  wire [31:0] increment_io_sample_in_bits_features_4; // @[TreePEsWrapper.scala 62:35]
  wire [9:0] increment_io_sample_in_bits_offset; // @[TreePEsWrapper.scala 62:35]
  wire  increment_io_sample_in_bits_search_for_root; // @[TreePEsWrapper.scala 62:35]
  wire [7:0] increment_io_sample_in_bits_tree_to_exec; // @[TreePEsWrapper.scala 62:35]
  wire [31:0] increment_io_sample_in_bits_scores_0; // @[TreePEsWrapper.scala 62:35]
  wire [31:0] increment_io_sample_in_bits_scores_1; // @[TreePEsWrapper.scala 62:35]
  wire [31:0] increment_io_sample_in_bits_scores_2; // @[TreePEsWrapper.scala 62:35]
  wire [31:0] increment_io_sample_in_bits_scores_3; // @[TreePEsWrapper.scala 62:35]
  wire [31:0] increment_io_sample_in_bits_weights_0; // @[TreePEsWrapper.scala 62:35]
  wire [31:0] increment_io_sample_in_bits_weights_1; // @[TreePEsWrapper.scala 62:35]
  wire [31:0] increment_io_sample_in_bits_weights_2; // @[TreePEsWrapper.scala 62:35]
  wire [31:0] increment_io_sample_in_bits_weights_3; // @[TreePEsWrapper.scala 62:35]
  wire [31:0] increment_io_sample_in_bits_weights_4; // @[TreePEsWrapper.scala 62:35]
  wire  increment_io_sample_in_bits_last; // @[TreePEsWrapper.scala 62:35]
  wire  increment_io_sample_out_ready; // @[TreePEsWrapper.scala 62:35]
  wire  increment_io_sample_out_valid; // @[TreePEsWrapper.scala 62:35]
  wire [31:0] increment_io_sample_out_bits_features_0; // @[TreePEsWrapper.scala 62:35]
  wire [31:0] increment_io_sample_out_bits_features_1; // @[TreePEsWrapper.scala 62:35]
  wire [31:0] increment_io_sample_out_bits_features_2; // @[TreePEsWrapper.scala 62:35]
  wire [31:0] increment_io_sample_out_bits_features_3; // @[TreePEsWrapper.scala 62:35]
  wire [31:0] increment_io_sample_out_bits_features_4; // @[TreePEsWrapper.scala 62:35]
  wire [9:0] increment_io_sample_out_bits_offset; // @[TreePEsWrapper.scala 62:35]
  wire  increment_io_sample_out_bits_search_for_root; // @[TreePEsWrapper.scala 62:35]
  wire [7:0] increment_io_sample_out_bits_tree_to_exec; // @[TreePEsWrapper.scala 62:35]
  wire [31:0] increment_io_sample_out_bits_scores_0; // @[TreePEsWrapper.scala 62:35]
  wire [31:0] increment_io_sample_out_bits_scores_1; // @[TreePEsWrapper.scala 62:35]
  wire [31:0] increment_io_sample_out_bits_scores_2; // @[TreePEsWrapper.scala 62:35]
  wire [31:0] increment_io_sample_out_bits_scores_3; // @[TreePEsWrapper.scala 62:35]
  wire [31:0] increment_io_sample_out_bits_weights_0; // @[TreePEsWrapper.scala 62:35]
  wire [31:0] increment_io_sample_out_bits_weights_1; // @[TreePEsWrapper.scala 62:35]
  wire [31:0] increment_io_sample_out_bits_weights_2; // @[TreePEsWrapper.scala 62:35]
  wire [31:0] increment_io_sample_out_bits_weights_3; // @[TreePEsWrapper.scala 62:35]
  wire [31:0] increment_io_sample_out_bits_weights_4; // @[TreePEsWrapper.scala 62:35]
  wire  increment_io_sample_out_bits_last; // @[TreePEsWrapper.scala 62:35]
  reg [31:0] cycles_counter; // @[TreePEsWrapper.scala 44:37]
  reg  counting; // @[TreePEsWrapper.scala 45:31]
  reg  stop_count; // @[TreePEsWrapper.scala 46:33]
  wire  _GEN_0 = last_interconnect_io_sample_leaving_valid & last_interconnect_io_sample_leaving_bits_last ? 1'h0 :
    counting; // @[TreePEsWrapper.scala 138:118 139:22 142:22]
  wire  _GEN_1 = last_interconnect_io_sample_leaving_valid & last_interconnect_io_sample_leaving_bits_last | stop_count; // @[TreePEsWrapper.scala 138:118 140:24 46:33]
  wire  _GEN_2 = wrapper_io_sample_in_TVALID & ~counting & ~stop_count | _GEN_0; // @[TreePEsWrapper.scala 136:68 137:22]
  wire [31:0] _cycles_counter_T_1 = cycles_counter + 32'h1; // @[TreePEsWrapper.scala 144:54]
  ForwardConverter forward_converter ( // @[TreePEsWrapper.scala 50:39]
    .io_sample_in_TDATA(forward_converter_io_sample_in_TDATA),
    .io_sample_in_TLAST(forward_converter_io_sample_in_TLAST),
    .io_sample_in_TREADY(forward_converter_io_sample_in_TREADY),
    .io_sample_in_TVALID(forward_converter_io_sample_in_TVALID),
    .io_sample_out_ready(forward_converter_io_sample_out_ready),
    .io_sample_out_valid(forward_converter_io_sample_out_valid),
    .io_sample_out_bits_features_0(forward_converter_io_sample_out_bits_features_0),
    .io_sample_out_bits_features_1(forward_converter_io_sample_out_bits_features_1),
    .io_sample_out_bits_features_2(forward_converter_io_sample_out_bits_features_2),
    .io_sample_out_bits_features_3(forward_converter_io_sample_out_bits_features_3),
    .io_sample_out_bits_features_4(forward_converter_io_sample_out_bits_features_4),
    .io_sample_out_bits_offset(forward_converter_io_sample_out_bits_offset),
    .io_sample_out_bits_search_for_root(forward_converter_io_sample_out_bits_search_for_root),
    .io_sample_out_bits_tree_to_exec(forward_converter_io_sample_out_bits_tree_to_exec),
    .io_sample_out_bits_scores_0(forward_converter_io_sample_out_bits_scores_0),
    .io_sample_out_bits_scores_1(forward_converter_io_sample_out_bits_scores_1),
    .io_sample_out_bits_scores_2(forward_converter_io_sample_out_bits_scores_2),
    .io_sample_out_bits_scores_3(forward_converter_io_sample_out_bits_scores_3),
    .io_sample_out_bits_weights_0(forward_converter_io_sample_out_bits_weights_0),
    .io_sample_out_bits_weights_1(forward_converter_io_sample_out_bits_weights_1),
    .io_sample_out_bits_weights_2(forward_converter_io_sample_out_bits_weights_2),
    .io_sample_out_bits_weights_3(forward_converter_io_sample_out_bits_weights_3),
    .io_sample_out_bits_weights_4(forward_converter_io_sample_out_bits_weights_4),
    .io_sample_out_bits_last(forward_converter_io_sample_out_bits_last)
  );
  BackwardConverter backward_converter ( // @[TreePEsWrapper.scala 51:40]
    .clock(backward_converter_clock),
    .reset(backward_converter_reset),
    .io_sample_in_ready(backward_converter_io_sample_in_ready),
    .io_sample_in_valid(backward_converter_io_sample_in_valid),
    .io_sample_in_bits_features_0(backward_converter_io_sample_in_bits_features_0),
    .io_sample_in_bits_features_1(backward_converter_io_sample_in_bits_features_1),
    .io_sample_in_bits_features_2(backward_converter_io_sample_in_bits_features_2),
    .io_sample_in_bits_features_3(backward_converter_io_sample_in_bits_features_3),
    .io_sample_in_bits_features_4(backward_converter_io_sample_in_bits_features_4),
    .io_sample_in_bits_offset(backward_converter_io_sample_in_bits_offset),
    .io_sample_in_bits_shift(backward_converter_io_sample_in_bits_shift),
    .io_sample_in_bits_search_for_root(backward_converter_io_sample_in_bits_search_for_root),
    .io_sample_in_bits_tree_to_exec(backward_converter_io_sample_in_bits_tree_to_exec),
    .io_sample_in_bits_scores_0(backward_converter_io_sample_in_bits_scores_0),
    .io_sample_in_bits_scores_1(backward_converter_io_sample_in_bits_scores_1),
    .io_sample_in_bits_scores_2(backward_converter_io_sample_in_bits_scores_2),
    .io_sample_in_bits_scores_3(backward_converter_io_sample_in_bits_scores_3),
    .io_sample_in_bits_last(backward_converter_io_sample_in_bits_last),
    .io_sample_in_bits_clock_cycles(backward_converter_io_sample_in_bits_clock_cycles),
    .io_sample_out_TDATA(backward_converter_io_sample_out_TDATA),
    .io_sample_out_TLAST(backward_converter_io_sample_out_TLAST),
    .io_sample_out_TREADY(backward_converter_io_sample_out_TREADY),
    .io_sample_out_TVALID(backward_converter_io_sample_out_TVALID)
  );
  TreePEwithBRAM pes_0 ( // @[TreePEsWrapper.scala 57:69]
    .clock(pes_0_clock),
    .reset(pes_0_reset),
    .pe_io_sample_in_ready(pes_0_pe_io_sample_in_ready),
    .pe_io_sample_in_valid(pes_0_pe_io_sample_in_valid),
    .pe_io_sample_in_bits_features_0(pes_0_pe_io_sample_in_bits_features_0),
    .pe_io_sample_in_bits_features_1(pes_0_pe_io_sample_in_bits_features_1),
    .pe_io_sample_in_bits_features_2(pes_0_pe_io_sample_in_bits_features_2),
    .pe_io_sample_in_bits_features_3(pes_0_pe_io_sample_in_bits_features_3),
    .pe_io_sample_in_bits_features_4(pes_0_pe_io_sample_in_bits_features_4),
    .pe_io_sample_in_bits_offset(pes_0_pe_io_sample_in_bits_offset),
    .pe_io_sample_in_bits_search_for_root(pes_0_pe_io_sample_in_bits_search_for_root),
    .pe_io_sample_in_bits_tree_to_exec(pes_0_pe_io_sample_in_bits_tree_to_exec),
    .pe_io_sample_in_bits_scores_0(pes_0_pe_io_sample_in_bits_scores_0),
    .pe_io_sample_in_bits_scores_1(pes_0_pe_io_sample_in_bits_scores_1),
    .pe_io_sample_in_bits_scores_2(pes_0_pe_io_sample_in_bits_scores_2),
    .pe_io_sample_in_bits_scores_3(pes_0_pe_io_sample_in_bits_scores_3),
    .pe_io_sample_in_bits_weights_0(pes_0_pe_io_sample_in_bits_weights_0),
    .pe_io_sample_in_bits_weights_1(pes_0_pe_io_sample_in_bits_weights_1),
    .pe_io_sample_in_bits_weights_2(pes_0_pe_io_sample_in_bits_weights_2),
    .pe_io_sample_in_bits_weights_3(pes_0_pe_io_sample_in_bits_weights_3),
    .pe_io_sample_in_bits_weights_4(pes_0_pe_io_sample_in_bits_weights_4),
    .pe_io_sample_in_bits_last(pes_0_pe_io_sample_in_bits_last),
    .pe_io_mem_addr_1(pes_0_pe_io_mem_addr_1),
    .pe_io_mem_dataOut_1(pes_0_pe_io_mem_dataOut_1),
    .pe_io_sample_out_ready(pes_0_pe_io_sample_out_ready),
    .pe_io_sample_out_valid(pes_0_pe_io_sample_out_valid),
    .pe_io_sample_out_bits_features_0(pes_0_pe_io_sample_out_bits_features_0),
    .pe_io_sample_out_bits_features_1(pes_0_pe_io_sample_out_bits_features_1),
    .pe_io_sample_out_bits_features_2(pes_0_pe_io_sample_out_bits_features_2),
    .pe_io_sample_out_bits_features_3(pes_0_pe_io_sample_out_bits_features_3),
    .pe_io_sample_out_bits_features_4(pes_0_pe_io_sample_out_bits_features_4),
    .pe_io_sample_out_bits_offset(pes_0_pe_io_sample_out_bits_offset),
    .pe_io_sample_out_bits_search_for_root(pes_0_pe_io_sample_out_bits_search_for_root),
    .pe_io_sample_out_bits_tree_to_exec(pes_0_pe_io_sample_out_bits_tree_to_exec),
    .pe_io_sample_out_bits_scores_0(pes_0_pe_io_sample_out_bits_scores_0),
    .pe_io_sample_out_bits_scores_1(pes_0_pe_io_sample_out_bits_scores_1),
    .pe_io_sample_out_bits_scores_2(pes_0_pe_io_sample_out_bits_scores_2),
    .pe_io_sample_out_bits_scores_3(pes_0_pe_io_sample_out_bits_scores_3),
    .pe_io_sample_out_bits_weights_0(pes_0_pe_io_sample_out_bits_weights_0),
    .pe_io_sample_out_bits_weights_1(pes_0_pe_io_sample_out_bits_weights_1),
    .pe_io_sample_out_bits_weights_2(pes_0_pe_io_sample_out_bits_weights_2),
    .pe_io_sample_out_bits_weights_3(pes_0_pe_io_sample_out_bits_weights_3),
    .pe_io_sample_out_bits_weights_4(pes_0_pe_io_sample_out_bits_weights_4),
    .pe_io_sample_out_bits_last(pes_0_pe_io_sample_out_bits_last)
  );
  TreePEwithBRAM_1 pes_1 ( // @[TreePEsWrapper.scala 57:69]
    .clock(pes_1_clock),
    .reset(pes_1_reset),
    .pe_io_sample_in_ready(pes_1_pe_io_sample_in_ready),
    .pe_io_sample_in_valid(pes_1_pe_io_sample_in_valid),
    .pe_io_sample_in_bits_features_0(pes_1_pe_io_sample_in_bits_features_0),
    .pe_io_sample_in_bits_features_1(pes_1_pe_io_sample_in_bits_features_1),
    .pe_io_sample_in_bits_features_2(pes_1_pe_io_sample_in_bits_features_2),
    .pe_io_sample_in_bits_features_3(pes_1_pe_io_sample_in_bits_features_3),
    .pe_io_sample_in_bits_features_4(pes_1_pe_io_sample_in_bits_features_4),
    .pe_io_sample_in_bits_offset(pes_1_pe_io_sample_in_bits_offset),
    .pe_io_sample_in_bits_search_for_root(pes_1_pe_io_sample_in_bits_search_for_root),
    .pe_io_sample_in_bits_tree_to_exec(pes_1_pe_io_sample_in_bits_tree_to_exec),
    .pe_io_sample_in_bits_scores_0(pes_1_pe_io_sample_in_bits_scores_0),
    .pe_io_sample_in_bits_scores_1(pes_1_pe_io_sample_in_bits_scores_1),
    .pe_io_sample_in_bits_scores_2(pes_1_pe_io_sample_in_bits_scores_2),
    .pe_io_sample_in_bits_scores_3(pes_1_pe_io_sample_in_bits_scores_3),
    .pe_io_sample_in_bits_weights_0(pes_1_pe_io_sample_in_bits_weights_0),
    .pe_io_sample_in_bits_weights_1(pes_1_pe_io_sample_in_bits_weights_1),
    .pe_io_sample_in_bits_weights_2(pes_1_pe_io_sample_in_bits_weights_2),
    .pe_io_sample_in_bits_weights_3(pes_1_pe_io_sample_in_bits_weights_3),
    .pe_io_sample_in_bits_weights_4(pes_1_pe_io_sample_in_bits_weights_4),
    .pe_io_sample_in_bits_last(pes_1_pe_io_sample_in_bits_last),
    .pe_io_mem_addr_1(pes_1_pe_io_mem_addr_1),
    .pe_io_mem_dataOut_1(pes_1_pe_io_mem_dataOut_1),
    .pe_io_sample_out_ready(pes_1_pe_io_sample_out_ready),
    .pe_io_sample_out_valid(pes_1_pe_io_sample_out_valid),
    .pe_io_sample_out_bits_features_0(pes_1_pe_io_sample_out_bits_features_0),
    .pe_io_sample_out_bits_features_1(pes_1_pe_io_sample_out_bits_features_1),
    .pe_io_sample_out_bits_features_2(pes_1_pe_io_sample_out_bits_features_2),
    .pe_io_sample_out_bits_features_3(pes_1_pe_io_sample_out_bits_features_3),
    .pe_io_sample_out_bits_features_4(pes_1_pe_io_sample_out_bits_features_4),
    .pe_io_sample_out_bits_offset(pes_1_pe_io_sample_out_bits_offset),
    .pe_io_sample_out_bits_search_for_root(pes_1_pe_io_sample_out_bits_search_for_root),
    .pe_io_sample_out_bits_tree_to_exec(pes_1_pe_io_sample_out_bits_tree_to_exec),
    .pe_io_sample_out_bits_scores_0(pes_1_pe_io_sample_out_bits_scores_0),
    .pe_io_sample_out_bits_scores_1(pes_1_pe_io_sample_out_bits_scores_1),
    .pe_io_sample_out_bits_scores_2(pes_1_pe_io_sample_out_bits_scores_2),
    .pe_io_sample_out_bits_scores_3(pes_1_pe_io_sample_out_bits_scores_3),
    .pe_io_sample_out_bits_weights_0(pes_1_pe_io_sample_out_bits_weights_0),
    .pe_io_sample_out_bits_weights_1(pes_1_pe_io_sample_out_bits_weights_1),
    .pe_io_sample_out_bits_weights_2(pes_1_pe_io_sample_out_bits_weights_2),
    .pe_io_sample_out_bits_weights_3(pes_1_pe_io_sample_out_bits_weights_3),
    .pe_io_sample_out_bits_weights_4(pes_1_pe_io_sample_out_bits_weights_4),
    .pe_io_sample_out_bits_dest(pes_1_pe_io_sample_out_bits_dest),
    .pe_io_sample_out_bits_last(pes_1_pe_io_sample_out_bits_last)
  );
  TreePEwithBRAM_1 pes_2 ( // @[TreePEsWrapper.scala 57:69]
    .clock(pes_2_clock),
    .reset(pes_2_reset),
    .pe_io_sample_in_ready(pes_2_pe_io_sample_in_ready),
    .pe_io_sample_in_valid(pes_2_pe_io_sample_in_valid),
    .pe_io_sample_in_bits_features_0(pes_2_pe_io_sample_in_bits_features_0),
    .pe_io_sample_in_bits_features_1(pes_2_pe_io_sample_in_bits_features_1),
    .pe_io_sample_in_bits_features_2(pes_2_pe_io_sample_in_bits_features_2),
    .pe_io_sample_in_bits_features_3(pes_2_pe_io_sample_in_bits_features_3),
    .pe_io_sample_in_bits_features_4(pes_2_pe_io_sample_in_bits_features_4),
    .pe_io_sample_in_bits_offset(pes_2_pe_io_sample_in_bits_offset),
    .pe_io_sample_in_bits_search_for_root(pes_2_pe_io_sample_in_bits_search_for_root),
    .pe_io_sample_in_bits_tree_to_exec(pes_2_pe_io_sample_in_bits_tree_to_exec),
    .pe_io_sample_in_bits_scores_0(pes_2_pe_io_sample_in_bits_scores_0),
    .pe_io_sample_in_bits_scores_1(pes_2_pe_io_sample_in_bits_scores_1),
    .pe_io_sample_in_bits_scores_2(pes_2_pe_io_sample_in_bits_scores_2),
    .pe_io_sample_in_bits_scores_3(pes_2_pe_io_sample_in_bits_scores_3),
    .pe_io_sample_in_bits_weights_0(pes_2_pe_io_sample_in_bits_weights_0),
    .pe_io_sample_in_bits_weights_1(pes_2_pe_io_sample_in_bits_weights_1),
    .pe_io_sample_in_bits_weights_2(pes_2_pe_io_sample_in_bits_weights_2),
    .pe_io_sample_in_bits_weights_3(pes_2_pe_io_sample_in_bits_weights_3),
    .pe_io_sample_in_bits_weights_4(pes_2_pe_io_sample_in_bits_weights_4),
    .pe_io_sample_in_bits_last(pes_2_pe_io_sample_in_bits_last),
    .pe_io_mem_addr_1(pes_2_pe_io_mem_addr_1),
    .pe_io_mem_dataOut_1(pes_2_pe_io_mem_dataOut_1),
    .pe_io_sample_out_ready(pes_2_pe_io_sample_out_ready),
    .pe_io_sample_out_valid(pes_2_pe_io_sample_out_valid),
    .pe_io_sample_out_bits_features_0(pes_2_pe_io_sample_out_bits_features_0),
    .pe_io_sample_out_bits_features_1(pes_2_pe_io_sample_out_bits_features_1),
    .pe_io_sample_out_bits_features_2(pes_2_pe_io_sample_out_bits_features_2),
    .pe_io_sample_out_bits_features_3(pes_2_pe_io_sample_out_bits_features_3),
    .pe_io_sample_out_bits_features_4(pes_2_pe_io_sample_out_bits_features_4),
    .pe_io_sample_out_bits_offset(pes_2_pe_io_sample_out_bits_offset),
    .pe_io_sample_out_bits_search_for_root(pes_2_pe_io_sample_out_bits_search_for_root),
    .pe_io_sample_out_bits_tree_to_exec(pes_2_pe_io_sample_out_bits_tree_to_exec),
    .pe_io_sample_out_bits_scores_0(pes_2_pe_io_sample_out_bits_scores_0),
    .pe_io_sample_out_bits_scores_1(pes_2_pe_io_sample_out_bits_scores_1),
    .pe_io_sample_out_bits_scores_2(pes_2_pe_io_sample_out_bits_scores_2),
    .pe_io_sample_out_bits_scores_3(pes_2_pe_io_sample_out_bits_scores_3),
    .pe_io_sample_out_bits_weights_0(pes_2_pe_io_sample_out_bits_weights_0),
    .pe_io_sample_out_bits_weights_1(pes_2_pe_io_sample_out_bits_weights_1),
    .pe_io_sample_out_bits_weights_2(pes_2_pe_io_sample_out_bits_weights_2),
    .pe_io_sample_out_bits_weights_3(pes_2_pe_io_sample_out_bits_weights_3),
    .pe_io_sample_out_bits_weights_4(pes_2_pe_io_sample_out_bits_weights_4),
    .pe_io_sample_out_bits_dest(pes_2_pe_io_sample_out_bits_dest),
    .pe_io_sample_out_bits_last(pes_2_pe_io_sample_out_bits_last)
  );
  TreePEwithBRAM_1 pes_3 ( // @[TreePEsWrapper.scala 57:69]
    .clock(pes_3_clock),
    .reset(pes_3_reset),
    .pe_io_sample_in_ready(pes_3_pe_io_sample_in_ready),
    .pe_io_sample_in_valid(pes_3_pe_io_sample_in_valid),
    .pe_io_sample_in_bits_features_0(pes_3_pe_io_sample_in_bits_features_0),
    .pe_io_sample_in_bits_features_1(pes_3_pe_io_sample_in_bits_features_1),
    .pe_io_sample_in_bits_features_2(pes_3_pe_io_sample_in_bits_features_2),
    .pe_io_sample_in_bits_features_3(pes_3_pe_io_sample_in_bits_features_3),
    .pe_io_sample_in_bits_features_4(pes_3_pe_io_sample_in_bits_features_4),
    .pe_io_sample_in_bits_offset(pes_3_pe_io_sample_in_bits_offset),
    .pe_io_sample_in_bits_search_for_root(pes_3_pe_io_sample_in_bits_search_for_root),
    .pe_io_sample_in_bits_tree_to_exec(pes_3_pe_io_sample_in_bits_tree_to_exec),
    .pe_io_sample_in_bits_scores_0(pes_3_pe_io_sample_in_bits_scores_0),
    .pe_io_sample_in_bits_scores_1(pes_3_pe_io_sample_in_bits_scores_1),
    .pe_io_sample_in_bits_scores_2(pes_3_pe_io_sample_in_bits_scores_2),
    .pe_io_sample_in_bits_scores_3(pes_3_pe_io_sample_in_bits_scores_3),
    .pe_io_sample_in_bits_weights_0(pes_3_pe_io_sample_in_bits_weights_0),
    .pe_io_sample_in_bits_weights_1(pes_3_pe_io_sample_in_bits_weights_1),
    .pe_io_sample_in_bits_weights_2(pes_3_pe_io_sample_in_bits_weights_2),
    .pe_io_sample_in_bits_weights_3(pes_3_pe_io_sample_in_bits_weights_3),
    .pe_io_sample_in_bits_weights_4(pes_3_pe_io_sample_in_bits_weights_4),
    .pe_io_sample_in_bits_last(pes_3_pe_io_sample_in_bits_last),
    .pe_io_mem_addr_1(pes_3_pe_io_mem_addr_1),
    .pe_io_mem_dataOut_1(pes_3_pe_io_mem_dataOut_1),
    .pe_io_sample_out_ready(pes_3_pe_io_sample_out_ready),
    .pe_io_sample_out_valid(pes_3_pe_io_sample_out_valid),
    .pe_io_sample_out_bits_features_0(pes_3_pe_io_sample_out_bits_features_0),
    .pe_io_sample_out_bits_features_1(pes_3_pe_io_sample_out_bits_features_1),
    .pe_io_sample_out_bits_features_2(pes_3_pe_io_sample_out_bits_features_2),
    .pe_io_sample_out_bits_features_3(pes_3_pe_io_sample_out_bits_features_3),
    .pe_io_sample_out_bits_features_4(pes_3_pe_io_sample_out_bits_features_4),
    .pe_io_sample_out_bits_offset(pes_3_pe_io_sample_out_bits_offset),
    .pe_io_sample_out_bits_search_for_root(pes_3_pe_io_sample_out_bits_search_for_root),
    .pe_io_sample_out_bits_tree_to_exec(pes_3_pe_io_sample_out_bits_tree_to_exec),
    .pe_io_sample_out_bits_scores_0(pes_3_pe_io_sample_out_bits_scores_0),
    .pe_io_sample_out_bits_scores_1(pes_3_pe_io_sample_out_bits_scores_1),
    .pe_io_sample_out_bits_scores_2(pes_3_pe_io_sample_out_bits_scores_2),
    .pe_io_sample_out_bits_scores_3(pes_3_pe_io_sample_out_bits_scores_3),
    .pe_io_sample_out_bits_weights_0(pes_3_pe_io_sample_out_bits_weights_0),
    .pe_io_sample_out_bits_weights_1(pes_3_pe_io_sample_out_bits_weights_1),
    .pe_io_sample_out_bits_weights_2(pes_3_pe_io_sample_out_bits_weights_2),
    .pe_io_sample_out_bits_weights_3(pes_3_pe_io_sample_out_bits_weights_3),
    .pe_io_sample_out_bits_weights_4(pes_3_pe_io_sample_out_bits_weights_4),
    .pe_io_sample_out_bits_dest(pes_3_pe_io_sample_out_bits_dest),
    .pe_io_sample_out_bits_last(pes_3_pe_io_sample_out_bits_last)
  );
  TreePEwithBRAM_1 pes_4 ( // @[TreePEsWrapper.scala 57:69]
    .clock(pes_4_clock),
    .reset(pes_4_reset),
    .pe_io_sample_in_ready(pes_4_pe_io_sample_in_ready),
    .pe_io_sample_in_valid(pes_4_pe_io_sample_in_valid),
    .pe_io_sample_in_bits_features_0(pes_4_pe_io_sample_in_bits_features_0),
    .pe_io_sample_in_bits_features_1(pes_4_pe_io_sample_in_bits_features_1),
    .pe_io_sample_in_bits_features_2(pes_4_pe_io_sample_in_bits_features_2),
    .pe_io_sample_in_bits_features_3(pes_4_pe_io_sample_in_bits_features_3),
    .pe_io_sample_in_bits_features_4(pes_4_pe_io_sample_in_bits_features_4),
    .pe_io_sample_in_bits_offset(pes_4_pe_io_sample_in_bits_offset),
    .pe_io_sample_in_bits_search_for_root(pes_4_pe_io_sample_in_bits_search_for_root),
    .pe_io_sample_in_bits_tree_to_exec(pes_4_pe_io_sample_in_bits_tree_to_exec),
    .pe_io_sample_in_bits_scores_0(pes_4_pe_io_sample_in_bits_scores_0),
    .pe_io_sample_in_bits_scores_1(pes_4_pe_io_sample_in_bits_scores_1),
    .pe_io_sample_in_bits_scores_2(pes_4_pe_io_sample_in_bits_scores_2),
    .pe_io_sample_in_bits_scores_3(pes_4_pe_io_sample_in_bits_scores_3),
    .pe_io_sample_in_bits_weights_0(pes_4_pe_io_sample_in_bits_weights_0),
    .pe_io_sample_in_bits_weights_1(pes_4_pe_io_sample_in_bits_weights_1),
    .pe_io_sample_in_bits_weights_2(pes_4_pe_io_sample_in_bits_weights_2),
    .pe_io_sample_in_bits_weights_3(pes_4_pe_io_sample_in_bits_weights_3),
    .pe_io_sample_in_bits_weights_4(pes_4_pe_io_sample_in_bits_weights_4),
    .pe_io_sample_in_bits_last(pes_4_pe_io_sample_in_bits_last),
    .pe_io_mem_addr_1(pes_4_pe_io_mem_addr_1),
    .pe_io_mem_dataOut_1(pes_4_pe_io_mem_dataOut_1),
    .pe_io_sample_out_ready(pes_4_pe_io_sample_out_ready),
    .pe_io_sample_out_valid(pes_4_pe_io_sample_out_valid),
    .pe_io_sample_out_bits_features_0(pes_4_pe_io_sample_out_bits_features_0),
    .pe_io_sample_out_bits_features_1(pes_4_pe_io_sample_out_bits_features_1),
    .pe_io_sample_out_bits_features_2(pes_4_pe_io_sample_out_bits_features_2),
    .pe_io_sample_out_bits_features_3(pes_4_pe_io_sample_out_bits_features_3),
    .pe_io_sample_out_bits_features_4(pes_4_pe_io_sample_out_bits_features_4),
    .pe_io_sample_out_bits_offset(pes_4_pe_io_sample_out_bits_offset),
    .pe_io_sample_out_bits_search_for_root(pes_4_pe_io_sample_out_bits_search_for_root),
    .pe_io_sample_out_bits_tree_to_exec(pes_4_pe_io_sample_out_bits_tree_to_exec),
    .pe_io_sample_out_bits_scores_0(pes_4_pe_io_sample_out_bits_scores_0),
    .pe_io_sample_out_bits_scores_1(pes_4_pe_io_sample_out_bits_scores_1),
    .pe_io_sample_out_bits_scores_2(pes_4_pe_io_sample_out_bits_scores_2),
    .pe_io_sample_out_bits_scores_3(pes_4_pe_io_sample_out_bits_scores_3),
    .pe_io_sample_out_bits_weights_0(pes_4_pe_io_sample_out_bits_weights_0),
    .pe_io_sample_out_bits_weights_1(pes_4_pe_io_sample_out_bits_weights_1),
    .pe_io_sample_out_bits_weights_2(pes_4_pe_io_sample_out_bits_weights_2),
    .pe_io_sample_out_bits_weights_3(pes_4_pe_io_sample_out_bits_weights_3),
    .pe_io_sample_out_bits_weights_4(pes_4_pe_io_sample_out_bits_weights_4),
    .pe_io_sample_out_bits_dest(pes_4_pe_io_sample_out_bits_dest),
    .pe_io_sample_out_bits_last(pes_4_pe_io_sample_out_bits_last)
  );
  TreePEwithBRAM pes_5 ( // @[TreePEsWrapper.scala 57:69]
    .clock(pes_5_clock),
    .reset(pes_5_reset),
    .pe_io_sample_in_ready(pes_5_pe_io_sample_in_ready),
    .pe_io_sample_in_valid(pes_5_pe_io_sample_in_valid),
    .pe_io_sample_in_bits_features_0(pes_5_pe_io_sample_in_bits_features_0),
    .pe_io_sample_in_bits_features_1(pes_5_pe_io_sample_in_bits_features_1),
    .pe_io_sample_in_bits_features_2(pes_5_pe_io_sample_in_bits_features_2),
    .pe_io_sample_in_bits_features_3(pes_5_pe_io_sample_in_bits_features_3),
    .pe_io_sample_in_bits_features_4(pes_5_pe_io_sample_in_bits_features_4),
    .pe_io_sample_in_bits_offset(pes_5_pe_io_sample_in_bits_offset),
    .pe_io_sample_in_bits_search_for_root(pes_5_pe_io_sample_in_bits_search_for_root),
    .pe_io_sample_in_bits_tree_to_exec(pes_5_pe_io_sample_in_bits_tree_to_exec),
    .pe_io_sample_in_bits_scores_0(pes_5_pe_io_sample_in_bits_scores_0),
    .pe_io_sample_in_bits_scores_1(pes_5_pe_io_sample_in_bits_scores_1),
    .pe_io_sample_in_bits_scores_2(pes_5_pe_io_sample_in_bits_scores_2),
    .pe_io_sample_in_bits_scores_3(pes_5_pe_io_sample_in_bits_scores_3),
    .pe_io_sample_in_bits_weights_0(pes_5_pe_io_sample_in_bits_weights_0),
    .pe_io_sample_in_bits_weights_1(pes_5_pe_io_sample_in_bits_weights_1),
    .pe_io_sample_in_bits_weights_2(pes_5_pe_io_sample_in_bits_weights_2),
    .pe_io_sample_in_bits_weights_3(pes_5_pe_io_sample_in_bits_weights_3),
    .pe_io_sample_in_bits_weights_4(pes_5_pe_io_sample_in_bits_weights_4),
    .pe_io_sample_in_bits_last(pes_5_pe_io_sample_in_bits_last),
    .pe_io_mem_addr_1(pes_5_pe_io_mem_addr_1),
    .pe_io_mem_dataOut_1(pes_5_pe_io_mem_dataOut_1),
    .pe_io_sample_out_ready(pes_5_pe_io_sample_out_ready),
    .pe_io_sample_out_valid(pes_5_pe_io_sample_out_valid),
    .pe_io_sample_out_bits_features_0(pes_5_pe_io_sample_out_bits_features_0),
    .pe_io_sample_out_bits_features_1(pes_5_pe_io_sample_out_bits_features_1),
    .pe_io_sample_out_bits_features_2(pes_5_pe_io_sample_out_bits_features_2),
    .pe_io_sample_out_bits_features_3(pes_5_pe_io_sample_out_bits_features_3),
    .pe_io_sample_out_bits_features_4(pes_5_pe_io_sample_out_bits_features_4),
    .pe_io_sample_out_bits_offset(pes_5_pe_io_sample_out_bits_offset),
    .pe_io_sample_out_bits_search_for_root(pes_5_pe_io_sample_out_bits_search_for_root),
    .pe_io_sample_out_bits_tree_to_exec(pes_5_pe_io_sample_out_bits_tree_to_exec),
    .pe_io_sample_out_bits_scores_0(pes_5_pe_io_sample_out_bits_scores_0),
    .pe_io_sample_out_bits_scores_1(pes_5_pe_io_sample_out_bits_scores_1),
    .pe_io_sample_out_bits_scores_2(pes_5_pe_io_sample_out_bits_scores_2),
    .pe_io_sample_out_bits_scores_3(pes_5_pe_io_sample_out_bits_scores_3),
    .pe_io_sample_out_bits_weights_0(pes_5_pe_io_sample_out_bits_weights_0),
    .pe_io_sample_out_bits_weights_1(pes_5_pe_io_sample_out_bits_weights_1),
    .pe_io_sample_out_bits_weights_2(pes_5_pe_io_sample_out_bits_weights_2),
    .pe_io_sample_out_bits_weights_3(pes_5_pe_io_sample_out_bits_weights_3),
    .pe_io_sample_out_bits_weights_4(pes_5_pe_io_sample_out_bits_weights_4),
    .pe_io_sample_out_bits_last(pes_5_pe_io_sample_out_bits_last)
  );
  TreePEwithBRAM_1 pes_6 ( // @[TreePEsWrapper.scala 57:69]
    .clock(pes_6_clock),
    .reset(pes_6_reset),
    .pe_io_sample_in_ready(pes_6_pe_io_sample_in_ready),
    .pe_io_sample_in_valid(pes_6_pe_io_sample_in_valid),
    .pe_io_sample_in_bits_features_0(pes_6_pe_io_sample_in_bits_features_0),
    .pe_io_sample_in_bits_features_1(pes_6_pe_io_sample_in_bits_features_1),
    .pe_io_sample_in_bits_features_2(pes_6_pe_io_sample_in_bits_features_2),
    .pe_io_sample_in_bits_features_3(pes_6_pe_io_sample_in_bits_features_3),
    .pe_io_sample_in_bits_features_4(pes_6_pe_io_sample_in_bits_features_4),
    .pe_io_sample_in_bits_offset(pes_6_pe_io_sample_in_bits_offset),
    .pe_io_sample_in_bits_search_for_root(pes_6_pe_io_sample_in_bits_search_for_root),
    .pe_io_sample_in_bits_tree_to_exec(pes_6_pe_io_sample_in_bits_tree_to_exec),
    .pe_io_sample_in_bits_scores_0(pes_6_pe_io_sample_in_bits_scores_0),
    .pe_io_sample_in_bits_scores_1(pes_6_pe_io_sample_in_bits_scores_1),
    .pe_io_sample_in_bits_scores_2(pes_6_pe_io_sample_in_bits_scores_2),
    .pe_io_sample_in_bits_scores_3(pes_6_pe_io_sample_in_bits_scores_3),
    .pe_io_sample_in_bits_weights_0(pes_6_pe_io_sample_in_bits_weights_0),
    .pe_io_sample_in_bits_weights_1(pes_6_pe_io_sample_in_bits_weights_1),
    .pe_io_sample_in_bits_weights_2(pes_6_pe_io_sample_in_bits_weights_2),
    .pe_io_sample_in_bits_weights_3(pes_6_pe_io_sample_in_bits_weights_3),
    .pe_io_sample_in_bits_weights_4(pes_6_pe_io_sample_in_bits_weights_4),
    .pe_io_sample_in_bits_last(pes_6_pe_io_sample_in_bits_last),
    .pe_io_mem_addr_1(pes_6_pe_io_mem_addr_1),
    .pe_io_mem_dataOut_1(pes_6_pe_io_mem_dataOut_1),
    .pe_io_sample_out_ready(pes_6_pe_io_sample_out_ready),
    .pe_io_sample_out_valid(pes_6_pe_io_sample_out_valid),
    .pe_io_sample_out_bits_features_0(pes_6_pe_io_sample_out_bits_features_0),
    .pe_io_sample_out_bits_features_1(pes_6_pe_io_sample_out_bits_features_1),
    .pe_io_sample_out_bits_features_2(pes_6_pe_io_sample_out_bits_features_2),
    .pe_io_sample_out_bits_features_3(pes_6_pe_io_sample_out_bits_features_3),
    .pe_io_sample_out_bits_features_4(pes_6_pe_io_sample_out_bits_features_4),
    .pe_io_sample_out_bits_offset(pes_6_pe_io_sample_out_bits_offset),
    .pe_io_sample_out_bits_search_for_root(pes_6_pe_io_sample_out_bits_search_for_root),
    .pe_io_sample_out_bits_tree_to_exec(pes_6_pe_io_sample_out_bits_tree_to_exec),
    .pe_io_sample_out_bits_scores_0(pes_6_pe_io_sample_out_bits_scores_0),
    .pe_io_sample_out_bits_scores_1(pes_6_pe_io_sample_out_bits_scores_1),
    .pe_io_sample_out_bits_scores_2(pes_6_pe_io_sample_out_bits_scores_2),
    .pe_io_sample_out_bits_scores_3(pes_6_pe_io_sample_out_bits_scores_3),
    .pe_io_sample_out_bits_weights_0(pes_6_pe_io_sample_out_bits_weights_0),
    .pe_io_sample_out_bits_weights_1(pes_6_pe_io_sample_out_bits_weights_1),
    .pe_io_sample_out_bits_weights_2(pes_6_pe_io_sample_out_bits_weights_2),
    .pe_io_sample_out_bits_weights_3(pes_6_pe_io_sample_out_bits_weights_3),
    .pe_io_sample_out_bits_weights_4(pes_6_pe_io_sample_out_bits_weights_4),
    .pe_io_sample_out_bits_dest(pes_6_pe_io_sample_out_bits_dest),
    .pe_io_sample_out_bits_last(pes_6_pe_io_sample_out_bits_last)
  );
  TreePEwithBRAM_1 pes_7 ( // @[TreePEsWrapper.scala 57:69]
    .clock(pes_7_clock),
    .reset(pes_7_reset),
    .pe_io_sample_in_ready(pes_7_pe_io_sample_in_ready),
    .pe_io_sample_in_valid(pes_7_pe_io_sample_in_valid),
    .pe_io_sample_in_bits_features_0(pes_7_pe_io_sample_in_bits_features_0),
    .pe_io_sample_in_bits_features_1(pes_7_pe_io_sample_in_bits_features_1),
    .pe_io_sample_in_bits_features_2(pes_7_pe_io_sample_in_bits_features_2),
    .pe_io_sample_in_bits_features_3(pes_7_pe_io_sample_in_bits_features_3),
    .pe_io_sample_in_bits_features_4(pes_7_pe_io_sample_in_bits_features_4),
    .pe_io_sample_in_bits_offset(pes_7_pe_io_sample_in_bits_offset),
    .pe_io_sample_in_bits_search_for_root(pes_7_pe_io_sample_in_bits_search_for_root),
    .pe_io_sample_in_bits_tree_to_exec(pes_7_pe_io_sample_in_bits_tree_to_exec),
    .pe_io_sample_in_bits_scores_0(pes_7_pe_io_sample_in_bits_scores_0),
    .pe_io_sample_in_bits_scores_1(pes_7_pe_io_sample_in_bits_scores_1),
    .pe_io_sample_in_bits_scores_2(pes_7_pe_io_sample_in_bits_scores_2),
    .pe_io_sample_in_bits_scores_3(pes_7_pe_io_sample_in_bits_scores_3),
    .pe_io_sample_in_bits_weights_0(pes_7_pe_io_sample_in_bits_weights_0),
    .pe_io_sample_in_bits_weights_1(pes_7_pe_io_sample_in_bits_weights_1),
    .pe_io_sample_in_bits_weights_2(pes_7_pe_io_sample_in_bits_weights_2),
    .pe_io_sample_in_bits_weights_3(pes_7_pe_io_sample_in_bits_weights_3),
    .pe_io_sample_in_bits_weights_4(pes_7_pe_io_sample_in_bits_weights_4),
    .pe_io_sample_in_bits_last(pes_7_pe_io_sample_in_bits_last),
    .pe_io_mem_addr_1(pes_7_pe_io_mem_addr_1),
    .pe_io_mem_dataOut_1(pes_7_pe_io_mem_dataOut_1),
    .pe_io_sample_out_ready(pes_7_pe_io_sample_out_ready),
    .pe_io_sample_out_valid(pes_7_pe_io_sample_out_valid),
    .pe_io_sample_out_bits_features_0(pes_7_pe_io_sample_out_bits_features_0),
    .pe_io_sample_out_bits_features_1(pes_7_pe_io_sample_out_bits_features_1),
    .pe_io_sample_out_bits_features_2(pes_7_pe_io_sample_out_bits_features_2),
    .pe_io_sample_out_bits_features_3(pes_7_pe_io_sample_out_bits_features_3),
    .pe_io_sample_out_bits_features_4(pes_7_pe_io_sample_out_bits_features_4),
    .pe_io_sample_out_bits_offset(pes_7_pe_io_sample_out_bits_offset),
    .pe_io_sample_out_bits_search_for_root(pes_7_pe_io_sample_out_bits_search_for_root),
    .pe_io_sample_out_bits_tree_to_exec(pes_7_pe_io_sample_out_bits_tree_to_exec),
    .pe_io_sample_out_bits_scores_0(pes_7_pe_io_sample_out_bits_scores_0),
    .pe_io_sample_out_bits_scores_1(pes_7_pe_io_sample_out_bits_scores_1),
    .pe_io_sample_out_bits_scores_2(pes_7_pe_io_sample_out_bits_scores_2),
    .pe_io_sample_out_bits_scores_3(pes_7_pe_io_sample_out_bits_scores_3),
    .pe_io_sample_out_bits_weights_0(pes_7_pe_io_sample_out_bits_weights_0),
    .pe_io_sample_out_bits_weights_1(pes_7_pe_io_sample_out_bits_weights_1),
    .pe_io_sample_out_bits_weights_2(pes_7_pe_io_sample_out_bits_weights_2),
    .pe_io_sample_out_bits_weights_3(pes_7_pe_io_sample_out_bits_weights_3),
    .pe_io_sample_out_bits_weights_4(pes_7_pe_io_sample_out_bits_weights_4),
    .pe_io_sample_out_bits_dest(pes_7_pe_io_sample_out_bits_dest),
    .pe_io_sample_out_bits_last(pes_7_pe_io_sample_out_bits_last)
  );
  TreePEwithBRAM_1 pes_8 ( // @[TreePEsWrapper.scala 57:69]
    .clock(pes_8_clock),
    .reset(pes_8_reset),
    .pe_io_sample_in_ready(pes_8_pe_io_sample_in_ready),
    .pe_io_sample_in_valid(pes_8_pe_io_sample_in_valid),
    .pe_io_sample_in_bits_features_0(pes_8_pe_io_sample_in_bits_features_0),
    .pe_io_sample_in_bits_features_1(pes_8_pe_io_sample_in_bits_features_1),
    .pe_io_sample_in_bits_features_2(pes_8_pe_io_sample_in_bits_features_2),
    .pe_io_sample_in_bits_features_3(pes_8_pe_io_sample_in_bits_features_3),
    .pe_io_sample_in_bits_features_4(pes_8_pe_io_sample_in_bits_features_4),
    .pe_io_sample_in_bits_offset(pes_8_pe_io_sample_in_bits_offset),
    .pe_io_sample_in_bits_search_for_root(pes_8_pe_io_sample_in_bits_search_for_root),
    .pe_io_sample_in_bits_tree_to_exec(pes_8_pe_io_sample_in_bits_tree_to_exec),
    .pe_io_sample_in_bits_scores_0(pes_8_pe_io_sample_in_bits_scores_0),
    .pe_io_sample_in_bits_scores_1(pes_8_pe_io_sample_in_bits_scores_1),
    .pe_io_sample_in_bits_scores_2(pes_8_pe_io_sample_in_bits_scores_2),
    .pe_io_sample_in_bits_scores_3(pes_8_pe_io_sample_in_bits_scores_3),
    .pe_io_sample_in_bits_weights_0(pes_8_pe_io_sample_in_bits_weights_0),
    .pe_io_sample_in_bits_weights_1(pes_8_pe_io_sample_in_bits_weights_1),
    .pe_io_sample_in_bits_weights_2(pes_8_pe_io_sample_in_bits_weights_2),
    .pe_io_sample_in_bits_weights_3(pes_8_pe_io_sample_in_bits_weights_3),
    .pe_io_sample_in_bits_weights_4(pes_8_pe_io_sample_in_bits_weights_4),
    .pe_io_sample_in_bits_last(pes_8_pe_io_sample_in_bits_last),
    .pe_io_mem_addr_1(pes_8_pe_io_mem_addr_1),
    .pe_io_mem_dataOut_1(pes_8_pe_io_mem_dataOut_1),
    .pe_io_sample_out_ready(pes_8_pe_io_sample_out_ready),
    .pe_io_sample_out_valid(pes_8_pe_io_sample_out_valid),
    .pe_io_sample_out_bits_features_0(pes_8_pe_io_sample_out_bits_features_0),
    .pe_io_sample_out_bits_features_1(pes_8_pe_io_sample_out_bits_features_1),
    .pe_io_sample_out_bits_features_2(pes_8_pe_io_sample_out_bits_features_2),
    .pe_io_sample_out_bits_features_3(pes_8_pe_io_sample_out_bits_features_3),
    .pe_io_sample_out_bits_features_4(pes_8_pe_io_sample_out_bits_features_4),
    .pe_io_sample_out_bits_offset(pes_8_pe_io_sample_out_bits_offset),
    .pe_io_sample_out_bits_search_for_root(pes_8_pe_io_sample_out_bits_search_for_root),
    .pe_io_sample_out_bits_tree_to_exec(pes_8_pe_io_sample_out_bits_tree_to_exec),
    .pe_io_sample_out_bits_scores_0(pes_8_pe_io_sample_out_bits_scores_0),
    .pe_io_sample_out_bits_scores_1(pes_8_pe_io_sample_out_bits_scores_1),
    .pe_io_sample_out_bits_scores_2(pes_8_pe_io_sample_out_bits_scores_2),
    .pe_io_sample_out_bits_scores_3(pes_8_pe_io_sample_out_bits_scores_3),
    .pe_io_sample_out_bits_weights_0(pes_8_pe_io_sample_out_bits_weights_0),
    .pe_io_sample_out_bits_weights_1(pes_8_pe_io_sample_out_bits_weights_1),
    .pe_io_sample_out_bits_weights_2(pes_8_pe_io_sample_out_bits_weights_2),
    .pe_io_sample_out_bits_weights_3(pes_8_pe_io_sample_out_bits_weights_3),
    .pe_io_sample_out_bits_weights_4(pes_8_pe_io_sample_out_bits_weights_4),
    .pe_io_sample_out_bits_dest(pes_8_pe_io_sample_out_bits_dest),
    .pe_io_sample_out_bits_last(pes_8_pe_io_sample_out_bits_last)
  );
  TreePEwithBRAM_1 pes_9 ( // @[TreePEsWrapper.scala 57:69]
    .clock(pes_9_clock),
    .reset(pes_9_reset),
    .pe_io_sample_in_ready(pes_9_pe_io_sample_in_ready),
    .pe_io_sample_in_valid(pes_9_pe_io_sample_in_valid),
    .pe_io_sample_in_bits_features_0(pes_9_pe_io_sample_in_bits_features_0),
    .pe_io_sample_in_bits_features_1(pes_9_pe_io_sample_in_bits_features_1),
    .pe_io_sample_in_bits_features_2(pes_9_pe_io_sample_in_bits_features_2),
    .pe_io_sample_in_bits_features_3(pes_9_pe_io_sample_in_bits_features_3),
    .pe_io_sample_in_bits_features_4(pes_9_pe_io_sample_in_bits_features_4),
    .pe_io_sample_in_bits_offset(pes_9_pe_io_sample_in_bits_offset),
    .pe_io_sample_in_bits_search_for_root(pes_9_pe_io_sample_in_bits_search_for_root),
    .pe_io_sample_in_bits_tree_to_exec(pes_9_pe_io_sample_in_bits_tree_to_exec),
    .pe_io_sample_in_bits_scores_0(pes_9_pe_io_sample_in_bits_scores_0),
    .pe_io_sample_in_bits_scores_1(pes_9_pe_io_sample_in_bits_scores_1),
    .pe_io_sample_in_bits_scores_2(pes_9_pe_io_sample_in_bits_scores_2),
    .pe_io_sample_in_bits_scores_3(pes_9_pe_io_sample_in_bits_scores_3),
    .pe_io_sample_in_bits_weights_0(pes_9_pe_io_sample_in_bits_weights_0),
    .pe_io_sample_in_bits_weights_1(pes_9_pe_io_sample_in_bits_weights_1),
    .pe_io_sample_in_bits_weights_2(pes_9_pe_io_sample_in_bits_weights_2),
    .pe_io_sample_in_bits_weights_3(pes_9_pe_io_sample_in_bits_weights_3),
    .pe_io_sample_in_bits_weights_4(pes_9_pe_io_sample_in_bits_weights_4),
    .pe_io_sample_in_bits_last(pes_9_pe_io_sample_in_bits_last),
    .pe_io_mem_addr_1(pes_9_pe_io_mem_addr_1),
    .pe_io_mem_dataOut_1(pes_9_pe_io_mem_dataOut_1),
    .pe_io_sample_out_ready(pes_9_pe_io_sample_out_ready),
    .pe_io_sample_out_valid(pes_9_pe_io_sample_out_valid),
    .pe_io_sample_out_bits_features_0(pes_9_pe_io_sample_out_bits_features_0),
    .pe_io_sample_out_bits_features_1(pes_9_pe_io_sample_out_bits_features_1),
    .pe_io_sample_out_bits_features_2(pes_9_pe_io_sample_out_bits_features_2),
    .pe_io_sample_out_bits_features_3(pes_9_pe_io_sample_out_bits_features_3),
    .pe_io_sample_out_bits_features_4(pes_9_pe_io_sample_out_bits_features_4),
    .pe_io_sample_out_bits_offset(pes_9_pe_io_sample_out_bits_offset),
    .pe_io_sample_out_bits_search_for_root(pes_9_pe_io_sample_out_bits_search_for_root),
    .pe_io_sample_out_bits_tree_to_exec(pes_9_pe_io_sample_out_bits_tree_to_exec),
    .pe_io_sample_out_bits_scores_0(pes_9_pe_io_sample_out_bits_scores_0),
    .pe_io_sample_out_bits_scores_1(pes_9_pe_io_sample_out_bits_scores_1),
    .pe_io_sample_out_bits_scores_2(pes_9_pe_io_sample_out_bits_scores_2),
    .pe_io_sample_out_bits_scores_3(pes_9_pe_io_sample_out_bits_scores_3),
    .pe_io_sample_out_bits_weights_0(pes_9_pe_io_sample_out_bits_weights_0),
    .pe_io_sample_out_bits_weights_1(pes_9_pe_io_sample_out_bits_weights_1),
    .pe_io_sample_out_bits_weights_2(pes_9_pe_io_sample_out_bits_weights_2),
    .pe_io_sample_out_bits_weights_3(pes_9_pe_io_sample_out_bits_weights_3),
    .pe_io_sample_out_bits_weights_4(pes_9_pe_io_sample_out_bits_weights_4),
    .pe_io_sample_out_bits_dest(pes_9_pe_io_sample_out_bits_dest),
    .pe_io_sample_out_bits_last(pes_9_pe_io_sample_out_bits_last)
  );
  TreePEwithBRAM pes_10 ( // @[TreePEsWrapper.scala 57:69]
    .clock(pes_10_clock),
    .reset(pes_10_reset),
    .pe_io_sample_in_ready(pes_10_pe_io_sample_in_ready),
    .pe_io_sample_in_valid(pes_10_pe_io_sample_in_valid),
    .pe_io_sample_in_bits_features_0(pes_10_pe_io_sample_in_bits_features_0),
    .pe_io_sample_in_bits_features_1(pes_10_pe_io_sample_in_bits_features_1),
    .pe_io_sample_in_bits_features_2(pes_10_pe_io_sample_in_bits_features_2),
    .pe_io_sample_in_bits_features_3(pes_10_pe_io_sample_in_bits_features_3),
    .pe_io_sample_in_bits_features_4(pes_10_pe_io_sample_in_bits_features_4),
    .pe_io_sample_in_bits_offset(pes_10_pe_io_sample_in_bits_offset),
    .pe_io_sample_in_bits_search_for_root(pes_10_pe_io_sample_in_bits_search_for_root),
    .pe_io_sample_in_bits_tree_to_exec(pes_10_pe_io_sample_in_bits_tree_to_exec),
    .pe_io_sample_in_bits_scores_0(pes_10_pe_io_sample_in_bits_scores_0),
    .pe_io_sample_in_bits_scores_1(pes_10_pe_io_sample_in_bits_scores_1),
    .pe_io_sample_in_bits_scores_2(pes_10_pe_io_sample_in_bits_scores_2),
    .pe_io_sample_in_bits_scores_3(pes_10_pe_io_sample_in_bits_scores_3),
    .pe_io_sample_in_bits_weights_0(pes_10_pe_io_sample_in_bits_weights_0),
    .pe_io_sample_in_bits_weights_1(pes_10_pe_io_sample_in_bits_weights_1),
    .pe_io_sample_in_bits_weights_2(pes_10_pe_io_sample_in_bits_weights_2),
    .pe_io_sample_in_bits_weights_3(pes_10_pe_io_sample_in_bits_weights_3),
    .pe_io_sample_in_bits_weights_4(pes_10_pe_io_sample_in_bits_weights_4),
    .pe_io_sample_in_bits_last(pes_10_pe_io_sample_in_bits_last),
    .pe_io_mem_addr_1(pes_10_pe_io_mem_addr_1),
    .pe_io_mem_dataOut_1(pes_10_pe_io_mem_dataOut_1),
    .pe_io_sample_out_ready(pes_10_pe_io_sample_out_ready),
    .pe_io_sample_out_valid(pes_10_pe_io_sample_out_valid),
    .pe_io_sample_out_bits_features_0(pes_10_pe_io_sample_out_bits_features_0),
    .pe_io_sample_out_bits_features_1(pes_10_pe_io_sample_out_bits_features_1),
    .pe_io_sample_out_bits_features_2(pes_10_pe_io_sample_out_bits_features_2),
    .pe_io_sample_out_bits_features_3(pes_10_pe_io_sample_out_bits_features_3),
    .pe_io_sample_out_bits_features_4(pes_10_pe_io_sample_out_bits_features_4),
    .pe_io_sample_out_bits_offset(pes_10_pe_io_sample_out_bits_offset),
    .pe_io_sample_out_bits_search_for_root(pes_10_pe_io_sample_out_bits_search_for_root),
    .pe_io_sample_out_bits_tree_to_exec(pes_10_pe_io_sample_out_bits_tree_to_exec),
    .pe_io_sample_out_bits_scores_0(pes_10_pe_io_sample_out_bits_scores_0),
    .pe_io_sample_out_bits_scores_1(pes_10_pe_io_sample_out_bits_scores_1),
    .pe_io_sample_out_bits_scores_2(pes_10_pe_io_sample_out_bits_scores_2),
    .pe_io_sample_out_bits_scores_3(pes_10_pe_io_sample_out_bits_scores_3),
    .pe_io_sample_out_bits_weights_0(pes_10_pe_io_sample_out_bits_weights_0),
    .pe_io_sample_out_bits_weights_1(pes_10_pe_io_sample_out_bits_weights_1),
    .pe_io_sample_out_bits_weights_2(pes_10_pe_io_sample_out_bits_weights_2),
    .pe_io_sample_out_bits_weights_3(pes_10_pe_io_sample_out_bits_weights_3),
    .pe_io_sample_out_bits_weights_4(pes_10_pe_io_sample_out_bits_weights_4),
    .pe_io_sample_out_bits_last(pes_10_pe_io_sample_out_bits_last)
  );
  TreePEwithBRAM_1 pes_11 ( // @[TreePEsWrapper.scala 57:69]
    .clock(pes_11_clock),
    .reset(pes_11_reset),
    .pe_io_sample_in_ready(pes_11_pe_io_sample_in_ready),
    .pe_io_sample_in_valid(pes_11_pe_io_sample_in_valid),
    .pe_io_sample_in_bits_features_0(pes_11_pe_io_sample_in_bits_features_0),
    .pe_io_sample_in_bits_features_1(pes_11_pe_io_sample_in_bits_features_1),
    .pe_io_sample_in_bits_features_2(pes_11_pe_io_sample_in_bits_features_2),
    .pe_io_sample_in_bits_features_3(pes_11_pe_io_sample_in_bits_features_3),
    .pe_io_sample_in_bits_features_4(pes_11_pe_io_sample_in_bits_features_4),
    .pe_io_sample_in_bits_offset(pes_11_pe_io_sample_in_bits_offset),
    .pe_io_sample_in_bits_search_for_root(pes_11_pe_io_sample_in_bits_search_for_root),
    .pe_io_sample_in_bits_tree_to_exec(pes_11_pe_io_sample_in_bits_tree_to_exec),
    .pe_io_sample_in_bits_scores_0(pes_11_pe_io_sample_in_bits_scores_0),
    .pe_io_sample_in_bits_scores_1(pes_11_pe_io_sample_in_bits_scores_1),
    .pe_io_sample_in_bits_scores_2(pes_11_pe_io_sample_in_bits_scores_2),
    .pe_io_sample_in_bits_scores_3(pes_11_pe_io_sample_in_bits_scores_3),
    .pe_io_sample_in_bits_weights_0(pes_11_pe_io_sample_in_bits_weights_0),
    .pe_io_sample_in_bits_weights_1(pes_11_pe_io_sample_in_bits_weights_1),
    .pe_io_sample_in_bits_weights_2(pes_11_pe_io_sample_in_bits_weights_2),
    .pe_io_sample_in_bits_weights_3(pes_11_pe_io_sample_in_bits_weights_3),
    .pe_io_sample_in_bits_weights_4(pes_11_pe_io_sample_in_bits_weights_4),
    .pe_io_sample_in_bits_last(pes_11_pe_io_sample_in_bits_last),
    .pe_io_mem_addr_1(pes_11_pe_io_mem_addr_1),
    .pe_io_mem_dataOut_1(pes_11_pe_io_mem_dataOut_1),
    .pe_io_sample_out_ready(pes_11_pe_io_sample_out_ready),
    .pe_io_sample_out_valid(pes_11_pe_io_sample_out_valid),
    .pe_io_sample_out_bits_features_0(pes_11_pe_io_sample_out_bits_features_0),
    .pe_io_sample_out_bits_features_1(pes_11_pe_io_sample_out_bits_features_1),
    .pe_io_sample_out_bits_features_2(pes_11_pe_io_sample_out_bits_features_2),
    .pe_io_sample_out_bits_features_3(pes_11_pe_io_sample_out_bits_features_3),
    .pe_io_sample_out_bits_features_4(pes_11_pe_io_sample_out_bits_features_4),
    .pe_io_sample_out_bits_offset(pes_11_pe_io_sample_out_bits_offset),
    .pe_io_sample_out_bits_search_for_root(pes_11_pe_io_sample_out_bits_search_for_root),
    .pe_io_sample_out_bits_tree_to_exec(pes_11_pe_io_sample_out_bits_tree_to_exec),
    .pe_io_sample_out_bits_scores_0(pes_11_pe_io_sample_out_bits_scores_0),
    .pe_io_sample_out_bits_scores_1(pes_11_pe_io_sample_out_bits_scores_1),
    .pe_io_sample_out_bits_scores_2(pes_11_pe_io_sample_out_bits_scores_2),
    .pe_io_sample_out_bits_scores_3(pes_11_pe_io_sample_out_bits_scores_3),
    .pe_io_sample_out_bits_weights_0(pes_11_pe_io_sample_out_bits_weights_0),
    .pe_io_sample_out_bits_weights_1(pes_11_pe_io_sample_out_bits_weights_1),
    .pe_io_sample_out_bits_weights_2(pes_11_pe_io_sample_out_bits_weights_2),
    .pe_io_sample_out_bits_weights_3(pes_11_pe_io_sample_out_bits_weights_3),
    .pe_io_sample_out_bits_weights_4(pes_11_pe_io_sample_out_bits_weights_4),
    .pe_io_sample_out_bits_dest(pes_11_pe_io_sample_out_bits_dest),
    .pe_io_sample_out_bits_last(pes_11_pe_io_sample_out_bits_last)
  );
  TreePEwithBRAM_1 pes_12 ( // @[TreePEsWrapper.scala 57:69]
    .clock(pes_12_clock),
    .reset(pes_12_reset),
    .pe_io_sample_in_ready(pes_12_pe_io_sample_in_ready),
    .pe_io_sample_in_valid(pes_12_pe_io_sample_in_valid),
    .pe_io_sample_in_bits_features_0(pes_12_pe_io_sample_in_bits_features_0),
    .pe_io_sample_in_bits_features_1(pes_12_pe_io_sample_in_bits_features_1),
    .pe_io_sample_in_bits_features_2(pes_12_pe_io_sample_in_bits_features_2),
    .pe_io_sample_in_bits_features_3(pes_12_pe_io_sample_in_bits_features_3),
    .pe_io_sample_in_bits_features_4(pes_12_pe_io_sample_in_bits_features_4),
    .pe_io_sample_in_bits_offset(pes_12_pe_io_sample_in_bits_offset),
    .pe_io_sample_in_bits_search_for_root(pes_12_pe_io_sample_in_bits_search_for_root),
    .pe_io_sample_in_bits_tree_to_exec(pes_12_pe_io_sample_in_bits_tree_to_exec),
    .pe_io_sample_in_bits_scores_0(pes_12_pe_io_sample_in_bits_scores_0),
    .pe_io_sample_in_bits_scores_1(pes_12_pe_io_sample_in_bits_scores_1),
    .pe_io_sample_in_bits_scores_2(pes_12_pe_io_sample_in_bits_scores_2),
    .pe_io_sample_in_bits_scores_3(pes_12_pe_io_sample_in_bits_scores_3),
    .pe_io_sample_in_bits_weights_0(pes_12_pe_io_sample_in_bits_weights_0),
    .pe_io_sample_in_bits_weights_1(pes_12_pe_io_sample_in_bits_weights_1),
    .pe_io_sample_in_bits_weights_2(pes_12_pe_io_sample_in_bits_weights_2),
    .pe_io_sample_in_bits_weights_3(pes_12_pe_io_sample_in_bits_weights_3),
    .pe_io_sample_in_bits_weights_4(pes_12_pe_io_sample_in_bits_weights_4),
    .pe_io_sample_in_bits_last(pes_12_pe_io_sample_in_bits_last),
    .pe_io_mem_addr_1(pes_12_pe_io_mem_addr_1),
    .pe_io_mem_dataOut_1(pes_12_pe_io_mem_dataOut_1),
    .pe_io_sample_out_ready(pes_12_pe_io_sample_out_ready),
    .pe_io_sample_out_valid(pes_12_pe_io_sample_out_valid),
    .pe_io_sample_out_bits_features_0(pes_12_pe_io_sample_out_bits_features_0),
    .pe_io_sample_out_bits_features_1(pes_12_pe_io_sample_out_bits_features_1),
    .pe_io_sample_out_bits_features_2(pes_12_pe_io_sample_out_bits_features_2),
    .pe_io_sample_out_bits_features_3(pes_12_pe_io_sample_out_bits_features_3),
    .pe_io_sample_out_bits_features_4(pes_12_pe_io_sample_out_bits_features_4),
    .pe_io_sample_out_bits_offset(pes_12_pe_io_sample_out_bits_offset),
    .pe_io_sample_out_bits_search_for_root(pes_12_pe_io_sample_out_bits_search_for_root),
    .pe_io_sample_out_bits_tree_to_exec(pes_12_pe_io_sample_out_bits_tree_to_exec),
    .pe_io_sample_out_bits_scores_0(pes_12_pe_io_sample_out_bits_scores_0),
    .pe_io_sample_out_bits_scores_1(pes_12_pe_io_sample_out_bits_scores_1),
    .pe_io_sample_out_bits_scores_2(pes_12_pe_io_sample_out_bits_scores_2),
    .pe_io_sample_out_bits_scores_3(pes_12_pe_io_sample_out_bits_scores_3),
    .pe_io_sample_out_bits_weights_0(pes_12_pe_io_sample_out_bits_weights_0),
    .pe_io_sample_out_bits_weights_1(pes_12_pe_io_sample_out_bits_weights_1),
    .pe_io_sample_out_bits_weights_2(pes_12_pe_io_sample_out_bits_weights_2),
    .pe_io_sample_out_bits_weights_3(pes_12_pe_io_sample_out_bits_weights_3),
    .pe_io_sample_out_bits_weights_4(pes_12_pe_io_sample_out_bits_weights_4),
    .pe_io_sample_out_bits_dest(pes_12_pe_io_sample_out_bits_dest),
    .pe_io_sample_out_bits_last(pes_12_pe_io_sample_out_bits_last)
  );
  TreePEwithBRAM_1 pes_13 ( // @[TreePEsWrapper.scala 57:69]
    .clock(pes_13_clock),
    .reset(pes_13_reset),
    .pe_io_sample_in_ready(pes_13_pe_io_sample_in_ready),
    .pe_io_sample_in_valid(pes_13_pe_io_sample_in_valid),
    .pe_io_sample_in_bits_features_0(pes_13_pe_io_sample_in_bits_features_0),
    .pe_io_sample_in_bits_features_1(pes_13_pe_io_sample_in_bits_features_1),
    .pe_io_sample_in_bits_features_2(pes_13_pe_io_sample_in_bits_features_2),
    .pe_io_sample_in_bits_features_3(pes_13_pe_io_sample_in_bits_features_3),
    .pe_io_sample_in_bits_features_4(pes_13_pe_io_sample_in_bits_features_4),
    .pe_io_sample_in_bits_offset(pes_13_pe_io_sample_in_bits_offset),
    .pe_io_sample_in_bits_search_for_root(pes_13_pe_io_sample_in_bits_search_for_root),
    .pe_io_sample_in_bits_tree_to_exec(pes_13_pe_io_sample_in_bits_tree_to_exec),
    .pe_io_sample_in_bits_scores_0(pes_13_pe_io_sample_in_bits_scores_0),
    .pe_io_sample_in_bits_scores_1(pes_13_pe_io_sample_in_bits_scores_1),
    .pe_io_sample_in_bits_scores_2(pes_13_pe_io_sample_in_bits_scores_2),
    .pe_io_sample_in_bits_scores_3(pes_13_pe_io_sample_in_bits_scores_3),
    .pe_io_sample_in_bits_weights_0(pes_13_pe_io_sample_in_bits_weights_0),
    .pe_io_sample_in_bits_weights_1(pes_13_pe_io_sample_in_bits_weights_1),
    .pe_io_sample_in_bits_weights_2(pes_13_pe_io_sample_in_bits_weights_2),
    .pe_io_sample_in_bits_weights_3(pes_13_pe_io_sample_in_bits_weights_3),
    .pe_io_sample_in_bits_weights_4(pes_13_pe_io_sample_in_bits_weights_4),
    .pe_io_sample_in_bits_last(pes_13_pe_io_sample_in_bits_last),
    .pe_io_mem_addr_1(pes_13_pe_io_mem_addr_1),
    .pe_io_mem_dataOut_1(pes_13_pe_io_mem_dataOut_1),
    .pe_io_sample_out_ready(pes_13_pe_io_sample_out_ready),
    .pe_io_sample_out_valid(pes_13_pe_io_sample_out_valid),
    .pe_io_sample_out_bits_features_0(pes_13_pe_io_sample_out_bits_features_0),
    .pe_io_sample_out_bits_features_1(pes_13_pe_io_sample_out_bits_features_1),
    .pe_io_sample_out_bits_features_2(pes_13_pe_io_sample_out_bits_features_2),
    .pe_io_sample_out_bits_features_3(pes_13_pe_io_sample_out_bits_features_3),
    .pe_io_sample_out_bits_features_4(pes_13_pe_io_sample_out_bits_features_4),
    .pe_io_sample_out_bits_offset(pes_13_pe_io_sample_out_bits_offset),
    .pe_io_sample_out_bits_search_for_root(pes_13_pe_io_sample_out_bits_search_for_root),
    .pe_io_sample_out_bits_tree_to_exec(pes_13_pe_io_sample_out_bits_tree_to_exec),
    .pe_io_sample_out_bits_scores_0(pes_13_pe_io_sample_out_bits_scores_0),
    .pe_io_sample_out_bits_scores_1(pes_13_pe_io_sample_out_bits_scores_1),
    .pe_io_sample_out_bits_scores_2(pes_13_pe_io_sample_out_bits_scores_2),
    .pe_io_sample_out_bits_scores_3(pes_13_pe_io_sample_out_bits_scores_3),
    .pe_io_sample_out_bits_weights_0(pes_13_pe_io_sample_out_bits_weights_0),
    .pe_io_sample_out_bits_weights_1(pes_13_pe_io_sample_out_bits_weights_1),
    .pe_io_sample_out_bits_weights_2(pes_13_pe_io_sample_out_bits_weights_2),
    .pe_io_sample_out_bits_weights_3(pes_13_pe_io_sample_out_bits_weights_3),
    .pe_io_sample_out_bits_weights_4(pes_13_pe_io_sample_out_bits_weights_4),
    .pe_io_sample_out_bits_dest(pes_13_pe_io_sample_out_bits_dest),
    .pe_io_sample_out_bits_last(pes_13_pe_io_sample_out_bits_last)
  );
  TreePEwithBRAM_1 pes_14 ( // @[TreePEsWrapper.scala 57:69]
    .clock(pes_14_clock),
    .reset(pes_14_reset),
    .pe_io_sample_in_ready(pes_14_pe_io_sample_in_ready),
    .pe_io_sample_in_valid(pes_14_pe_io_sample_in_valid),
    .pe_io_sample_in_bits_features_0(pes_14_pe_io_sample_in_bits_features_0),
    .pe_io_sample_in_bits_features_1(pes_14_pe_io_sample_in_bits_features_1),
    .pe_io_sample_in_bits_features_2(pes_14_pe_io_sample_in_bits_features_2),
    .pe_io_sample_in_bits_features_3(pes_14_pe_io_sample_in_bits_features_3),
    .pe_io_sample_in_bits_features_4(pes_14_pe_io_sample_in_bits_features_4),
    .pe_io_sample_in_bits_offset(pes_14_pe_io_sample_in_bits_offset),
    .pe_io_sample_in_bits_search_for_root(pes_14_pe_io_sample_in_bits_search_for_root),
    .pe_io_sample_in_bits_tree_to_exec(pes_14_pe_io_sample_in_bits_tree_to_exec),
    .pe_io_sample_in_bits_scores_0(pes_14_pe_io_sample_in_bits_scores_0),
    .pe_io_sample_in_bits_scores_1(pes_14_pe_io_sample_in_bits_scores_1),
    .pe_io_sample_in_bits_scores_2(pes_14_pe_io_sample_in_bits_scores_2),
    .pe_io_sample_in_bits_scores_3(pes_14_pe_io_sample_in_bits_scores_3),
    .pe_io_sample_in_bits_weights_0(pes_14_pe_io_sample_in_bits_weights_0),
    .pe_io_sample_in_bits_weights_1(pes_14_pe_io_sample_in_bits_weights_1),
    .pe_io_sample_in_bits_weights_2(pes_14_pe_io_sample_in_bits_weights_2),
    .pe_io_sample_in_bits_weights_3(pes_14_pe_io_sample_in_bits_weights_3),
    .pe_io_sample_in_bits_weights_4(pes_14_pe_io_sample_in_bits_weights_4),
    .pe_io_sample_in_bits_last(pes_14_pe_io_sample_in_bits_last),
    .pe_io_mem_addr_1(pes_14_pe_io_mem_addr_1),
    .pe_io_mem_dataOut_1(pes_14_pe_io_mem_dataOut_1),
    .pe_io_sample_out_ready(pes_14_pe_io_sample_out_ready),
    .pe_io_sample_out_valid(pes_14_pe_io_sample_out_valid),
    .pe_io_sample_out_bits_features_0(pes_14_pe_io_sample_out_bits_features_0),
    .pe_io_sample_out_bits_features_1(pes_14_pe_io_sample_out_bits_features_1),
    .pe_io_sample_out_bits_features_2(pes_14_pe_io_sample_out_bits_features_2),
    .pe_io_sample_out_bits_features_3(pes_14_pe_io_sample_out_bits_features_3),
    .pe_io_sample_out_bits_features_4(pes_14_pe_io_sample_out_bits_features_4),
    .pe_io_sample_out_bits_offset(pes_14_pe_io_sample_out_bits_offset),
    .pe_io_sample_out_bits_search_for_root(pes_14_pe_io_sample_out_bits_search_for_root),
    .pe_io_sample_out_bits_tree_to_exec(pes_14_pe_io_sample_out_bits_tree_to_exec),
    .pe_io_sample_out_bits_scores_0(pes_14_pe_io_sample_out_bits_scores_0),
    .pe_io_sample_out_bits_scores_1(pes_14_pe_io_sample_out_bits_scores_1),
    .pe_io_sample_out_bits_scores_2(pes_14_pe_io_sample_out_bits_scores_2),
    .pe_io_sample_out_bits_scores_3(pes_14_pe_io_sample_out_bits_scores_3),
    .pe_io_sample_out_bits_weights_0(pes_14_pe_io_sample_out_bits_weights_0),
    .pe_io_sample_out_bits_weights_1(pes_14_pe_io_sample_out_bits_weights_1),
    .pe_io_sample_out_bits_weights_2(pes_14_pe_io_sample_out_bits_weights_2),
    .pe_io_sample_out_bits_weights_3(pes_14_pe_io_sample_out_bits_weights_3),
    .pe_io_sample_out_bits_weights_4(pes_14_pe_io_sample_out_bits_weights_4),
    .pe_io_sample_out_bits_dest(pes_14_pe_io_sample_out_bits_dest),
    .pe_io_sample_out_bits_last(pes_14_pe_io_sample_out_bits_last)
  );
  TreePEwithBRAM pes_15 ( // @[TreePEsWrapper.scala 57:69]
    .clock(pes_15_clock),
    .reset(pes_15_reset),
    .pe_io_sample_in_ready(pes_15_pe_io_sample_in_ready),
    .pe_io_sample_in_valid(pes_15_pe_io_sample_in_valid),
    .pe_io_sample_in_bits_features_0(pes_15_pe_io_sample_in_bits_features_0),
    .pe_io_sample_in_bits_features_1(pes_15_pe_io_sample_in_bits_features_1),
    .pe_io_sample_in_bits_features_2(pes_15_pe_io_sample_in_bits_features_2),
    .pe_io_sample_in_bits_features_3(pes_15_pe_io_sample_in_bits_features_3),
    .pe_io_sample_in_bits_features_4(pes_15_pe_io_sample_in_bits_features_4),
    .pe_io_sample_in_bits_offset(pes_15_pe_io_sample_in_bits_offset),
    .pe_io_sample_in_bits_search_for_root(pes_15_pe_io_sample_in_bits_search_for_root),
    .pe_io_sample_in_bits_tree_to_exec(pes_15_pe_io_sample_in_bits_tree_to_exec),
    .pe_io_sample_in_bits_scores_0(pes_15_pe_io_sample_in_bits_scores_0),
    .pe_io_sample_in_bits_scores_1(pes_15_pe_io_sample_in_bits_scores_1),
    .pe_io_sample_in_bits_scores_2(pes_15_pe_io_sample_in_bits_scores_2),
    .pe_io_sample_in_bits_scores_3(pes_15_pe_io_sample_in_bits_scores_3),
    .pe_io_sample_in_bits_weights_0(pes_15_pe_io_sample_in_bits_weights_0),
    .pe_io_sample_in_bits_weights_1(pes_15_pe_io_sample_in_bits_weights_1),
    .pe_io_sample_in_bits_weights_2(pes_15_pe_io_sample_in_bits_weights_2),
    .pe_io_sample_in_bits_weights_3(pes_15_pe_io_sample_in_bits_weights_3),
    .pe_io_sample_in_bits_weights_4(pes_15_pe_io_sample_in_bits_weights_4),
    .pe_io_sample_in_bits_last(pes_15_pe_io_sample_in_bits_last),
    .pe_io_mem_addr_1(pes_15_pe_io_mem_addr_1),
    .pe_io_mem_dataOut_1(pes_15_pe_io_mem_dataOut_1),
    .pe_io_sample_out_ready(pes_15_pe_io_sample_out_ready),
    .pe_io_sample_out_valid(pes_15_pe_io_sample_out_valid),
    .pe_io_sample_out_bits_features_0(pes_15_pe_io_sample_out_bits_features_0),
    .pe_io_sample_out_bits_features_1(pes_15_pe_io_sample_out_bits_features_1),
    .pe_io_sample_out_bits_features_2(pes_15_pe_io_sample_out_bits_features_2),
    .pe_io_sample_out_bits_features_3(pes_15_pe_io_sample_out_bits_features_3),
    .pe_io_sample_out_bits_features_4(pes_15_pe_io_sample_out_bits_features_4),
    .pe_io_sample_out_bits_offset(pes_15_pe_io_sample_out_bits_offset),
    .pe_io_sample_out_bits_search_for_root(pes_15_pe_io_sample_out_bits_search_for_root),
    .pe_io_sample_out_bits_tree_to_exec(pes_15_pe_io_sample_out_bits_tree_to_exec),
    .pe_io_sample_out_bits_scores_0(pes_15_pe_io_sample_out_bits_scores_0),
    .pe_io_sample_out_bits_scores_1(pes_15_pe_io_sample_out_bits_scores_1),
    .pe_io_sample_out_bits_scores_2(pes_15_pe_io_sample_out_bits_scores_2),
    .pe_io_sample_out_bits_scores_3(pes_15_pe_io_sample_out_bits_scores_3),
    .pe_io_sample_out_bits_weights_0(pes_15_pe_io_sample_out_bits_weights_0),
    .pe_io_sample_out_bits_weights_1(pes_15_pe_io_sample_out_bits_weights_1),
    .pe_io_sample_out_bits_weights_2(pes_15_pe_io_sample_out_bits_weights_2),
    .pe_io_sample_out_bits_weights_3(pes_15_pe_io_sample_out_bits_weights_3),
    .pe_io_sample_out_bits_weights_4(pes_15_pe_io_sample_out_bits_weights_4),
    .pe_io_sample_out_bits_last(pes_15_pe_io_sample_out_bits_last)
  );
  TreePEwithBRAM_1 pes_16 ( // @[TreePEsWrapper.scala 57:69]
    .clock(pes_16_clock),
    .reset(pes_16_reset),
    .pe_io_sample_in_ready(pes_16_pe_io_sample_in_ready),
    .pe_io_sample_in_valid(pes_16_pe_io_sample_in_valid),
    .pe_io_sample_in_bits_features_0(pes_16_pe_io_sample_in_bits_features_0),
    .pe_io_sample_in_bits_features_1(pes_16_pe_io_sample_in_bits_features_1),
    .pe_io_sample_in_bits_features_2(pes_16_pe_io_sample_in_bits_features_2),
    .pe_io_sample_in_bits_features_3(pes_16_pe_io_sample_in_bits_features_3),
    .pe_io_sample_in_bits_features_4(pes_16_pe_io_sample_in_bits_features_4),
    .pe_io_sample_in_bits_offset(pes_16_pe_io_sample_in_bits_offset),
    .pe_io_sample_in_bits_search_for_root(pes_16_pe_io_sample_in_bits_search_for_root),
    .pe_io_sample_in_bits_tree_to_exec(pes_16_pe_io_sample_in_bits_tree_to_exec),
    .pe_io_sample_in_bits_scores_0(pes_16_pe_io_sample_in_bits_scores_0),
    .pe_io_sample_in_bits_scores_1(pes_16_pe_io_sample_in_bits_scores_1),
    .pe_io_sample_in_bits_scores_2(pes_16_pe_io_sample_in_bits_scores_2),
    .pe_io_sample_in_bits_scores_3(pes_16_pe_io_sample_in_bits_scores_3),
    .pe_io_sample_in_bits_weights_0(pes_16_pe_io_sample_in_bits_weights_0),
    .pe_io_sample_in_bits_weights_1(pes_16_pe_io_sample_in_bits_weights_1),
    .pe_io_sample_in_bits_weights_2(pes_16_pe_io_sample_in_bits_weights_2),
    .pe_io_sample_in_bits_weights_3(pes_16_pe_io_sample_in_bits_weights_3),
    .pe_io_sample_in_bits_weights_4(pes_16_pe_io_sample_in_bits_weights_4),
    .pe_io_sample_in_bits_last(pes_16_pe_io_sample_in_bits_last),
    .pe_io_mem_addr_1(pes_16_pe_io_mem_addr_1),
    .pe_io_mem_dataOut_1(pes_16_pe_io_mem_dataOut_1),
    .pe_io_sample_out_ready(pes_16_pe_io_sample_out_ready),
    .pe_io_sample_out_valid(pes_16_pe_io_sample_out_valid),
    .pe_io_sample_out_bits_features_0(pes_16_pe_io_sample_out_bits_features_0),
    .pe_io_sample_out_bits_features_1(pes_16_pe_io_sample_out_bits_features_1),
    .pe_io_sample_out_bits_features_2(pes_16_pe_io_sample_out_bits_features_2),
    .pe_io_sample_out_bits_features_3(pes_16_pe_io_sample_out_bits_features_3),
    .pe_io_sample_out_bits_features_4(pes_16_pe_io_sample_out_bits_features_4),
    .pe_io_sample_out_bits_offset(pes_16_pe_io_sample_out_bits_offset),
    .pe_io_sample_out_bits_search_for_root(pes_16_pe_io_sample_out_bits_search_for_root),
    .pe_io_sample_out_bits_tree_to_exec(pes_16_pe_io_sample_out_bits_tree_to_exec),
    .pe_io_sample_out_bits_scores_0(pes_16_pe_io_sample_out_bits_scores_0),
    .pe_io_sample_out_bits_scores_1(pes_16_pe_io_sample_out_bits_scores_1),
    .pe_io_sample_out_bits_scores_2(pes_16_pe_io_sample_out_bits_scores_2),
    .pe_io_sample_out_bits_scores_3(pes_16_pe_io_sample_out_bits_scores_3),
    .pe_io_sample_out_bits_weights_0(pes_16_pe_io_sample_out_bits_weights_0),
    .pe_io_sample_out_bits_weights_1(pes_16_pe_io_sample_out_bits_weights_1),
    .pe_io_sample_out_bits_weights_2(pes_16_pe_io_sample_out_bits_weights_2),
    .pe_io_sample_out_bits_weights_3(pes_16_pe_io_sample_out_bits_weights_3),
    .pe_io_sample_out_bits_weights_4(pes_16_pe_io_sample_out_bits_weights_4),
    .pe_io_sample_out_bits_dest(pes_16_pe_io_sample_out_bits_dest),
    .pe_io_sample_out_bits_last(pes_16_pe_io_sample_out_bits_last)
  );
  TreePEwithBRAM_1 pes_17 ( // @[TreePEsWrapper.scala 57:69]
    .clock(pes_17_clock),
    .reset(pes_17_reset),
    .pe_io_sample_in_ready(pes_17_pe_io_sample_in_ready),
    .pe_io_sample_in_valid(pes_17_pe_io_sample_in_valid),
    .pe_io_sample_in_bits_features_0(pes_17_pe_io_sample_in_bits_features_0),
    .pe_io_sample_in_bits_features_1(pes_17_pe_io_sample_in_bits_features_1),
    .pe_io_sample_in_bits_features_2(pes_17_pe_io_sample_in_bits_features_2),
    .pe_io_sample_in_bits_features_3(pes_17_pe_io_sample_in_bits_features_3),
    .pe_io_sample_in_bits_features_4(pes_17_pe_io_sample_in_bits_features_4),
    .pe_io_sample_in_bits_offset(pes_17_pe_io_sample_in_bits_offset),
    .pe_io_sample_in_bits_search_for_root(pes_17_pe_io_sample_in_bits_search_for_root),
    .pe_io_sample_in_bits_tree_to_exec(pes_17_pe_io_sample_in_bits_tree_to_exec),
    .pe_io_sample_in_bits_scores_0(pes_17_pe_io_sample_in_bits_scores_0),
    .pe_io_sample_in_bits_scores_1(pes_17_pe_io_sample_in_bits_scores_1),
    .pe_io_sample_in_bits_scores_2(pes_17_pe_io_sample_in_bits_scores_2),
    .pe_io_sample_in_bits_scores_3(pes_17_pe_io_sample_in_bits_scores_3),
    .pe_io_sample_in_bits_weights_0(pes_17_pe_io_sample_in_bits_weights_0),
    .pe_io_sample_in_bits_weights_1(pes_17_pe_io_sample_in_bits_weights_1),
    .pe_io_sample_in_bits_weights_2(pes_17_pe_io_sample_in_bits_weights_2),
    .pe_io_sample_in_bits_weights_3(pes_17_pe_io_sample_in_bits_weights_3),
    .pe_io_sample_in_bits_weights_4(pes_17_pe_io_sample_in_bits_weights_4),
    .pe_io_sample_in_bits_last(pes_17_pe_io_sample_in_bits_last),
    .pe_io_mem_addr_1(pes_17_pe_io_mem_addr_1),
    .pe_io_mem_dataOut_1(pes_17_pe_io_mem_dataOut_1),
    .pe_io_sample_out_ready(pes_17_pe_io_sample_out_ready),
    .pe_io_sample_out_valid(pes_17_pe_io_sample_out_valid),
    .pe_io_sample_out_bits_features_0(pes_17_pe_io_sample_out_bits_features_0),
    .pe_io_sample_out_bits_features_1(pes_17_pe_io_sample_out_bits_features_1),
    .pe_io_sample_out_bits_features_2(pes_17_pe_io_sample_out_bits_features_2),
    .pe_io_sample_out_bits_features_3(pes_17_pe_io_sample_out_bits_features_3),
    .pe_io_sample_out_bits_features_4(pes_17_pe_io_sample_out_bits_features_4),
    .pe_io_sample_out_bits_offset(pes_17_pe_io_sample_out_bits_offset),
    .pe_io_sample_out_bits_search_for_root(pes_17_pe_io_sample_out_bits_search_for_root),
    .pe_io_sample_out_bits_tree_to_exec(pes_17_pe_io_sample_out_bits_tree_to_exec),
    .pe_io_sample_out_bits_scores_0(pes_17_pe_io_sample_out_bits_scores_0),
    .pe_io_sample_out_bits_scores_1(pes_17_pe_io_sample_out_bits_scores_1),
    .pe_io_sample_out_bits_scores_2(pes_17_pe_io_sample_out_bits_scores_2),
    .pe_io_sample_out_bits_scores_3(pes_17_pe_io_sample_out_bits_scores_3),
    .pe_io_sample_out_bits_weights_0(pes_17_pe_io_sample_out_bits_weights_0),
    .pe_io_sample_out_bits_weights_1(pes_17_pe_io_sample_out_bits_weights_1),
    .pe_io_sample_out_bits_weights_2(pes_17_pe_io_sample_out_bits_weights_2),
    .pe_io_sample_out_bits_weights_3(pes_17_pe_io_sample_out_bits_weights_3),
    .pe_io_sample_out_bits_weights_4(pes_17_pe_io_sample_out_bits_weights_4),
    .pe_io_sample_out_bits_dest(pes_17_pe_io_sample_out_bits_dest),
    .pe_io_sample_out_bits_last(pes_17_pe_io_sample_out_bits_last)
  );
  TreePEwithBRAM_1 pes_18 ( // @[TreePEsWrapper.scala 57:69]
    .clock(pes_18_clock),
    .reset(pes_18_reset),
    .pe_io_sample_in_ready(pes_18_pe_io_sample_in_ready),
    .pe_io_sample_in_valid(pes_18_pe_io_sample_in_valid),
    .pe_io_sample_in_bits_features_0(pes_18_pe_io_sample_in_bits_features_0),
    .pe_io_sample_in_bits_features_1(pes_18_pe_io_sample_in_bits_features_1),
    .pe_io_sample_in_bits_features_2(pes_18_pe_io_sample_in_bits_features_2),
    .pe_io_sample_in_bits_features_3(pes_18_pe_io_sample_in_bits_features_3),
    .pe_io_sample_in_bits_features_4(pes_18_pe_io_sample_in_bits_features_4),
    .pe_io_sample_in_bits_offset(pes_18_pe_io_sample_in_bits_offset),
    .pe_io_sample_in_bits_search_for_root(pes_18_pe_io_sample_in_bits_search_for_root),
    .pe_io_sample_in_bits_tree_to_exec(pes_18_pe_io_sample_in_bits_tree_to_exec),
    .pe_io_sample_in_bits_scores_0(pes_18_pe_io_sample_in_bits_scores_0),
    .pe_io_sample_in_bits_scores_1(pes_18_pe_io_sample_in_bits_scores_1),
    .pe_io_sample_in_bits_scores_2(pes_18_pe_io_sample_in_bits_scores_2),
    .pe_io_sample_in_bits_scores_3(pes_18_pe_io_sample_in_bits_scores_3),
    .pe_io_sample_in_bits_weights_0(pes_18_pe_io_sample_in_bits_weights_0),
    .pe_io_sample_in_bits_weights_1(pes_18_pe_io_sample_in_bits_weights_1),
    .pe_io_sample_in_bits_weights_2(pes_18_pe_io_sample_in_bits_weights_2),
    .pe_io_sample_in_bits_weights_3(pes_18_pe_io_sample_in_bits_weights_3),
    .pe_io_sample_in_bits_weights_4(pes_18_pe_io_sample_in_bits_weights_4),
    .pe_io_sample_in_bits_last(pes_18_pe_io_sample_in_bits_last),
    .pe_io_mem_addr_1(pes_18_pe_io_mem_addr_1),
    .pe_io_mem_dataOut_1(pes_18_pe_io_mem_dataOut_1),
    .pe_io_sample_out_ready(pes_18_pe_io_sample_out_ready),
    .pe_io_sample_out_valid(pes_18_pe_io_sample_out_valid),
    .pe_io_sample_out_bits_features_0(pes_18_pe_io_sample_out_bits_features_0),
    .pe_io_sample_out_bits_features_1(pes_18_pe_io_sample_out_bits_features_1),
    .pe_io_sample_out_bits_features_2(pes_18_pe_io_sample_out_bits_features_2),
    .pe_io_sample_out_bits_features_3(pes_18_pe_io_sample_out_bits_features_3),
    .pe_io_sample_out_bits_features_4(pes_18_pe_io_sample_out_bits_features_4),
    .pe_io_sample_out_bits_offset(pes_18_pe_io_sample_out_bits_offset),
    .pe_io_sample_out_bits_search_for_root(pes_18_pe_io_sample_out_bits_search_for_root),
    .pe_io_sample_out_bits_tree_to_exec(pes_18_pe_io_sample_out_bits_tree_to_exec),
    .pe_io_sample_out_bits_scores_0(pes_18_pe_io_sample_out_bits_scores_0),
    .pe_io_sample_out_bits_scores_1(pes_18_pe_io_sample_out_bits_scores_1),
    .pe_io_sample_out_bits_scores_2(pes_18_pe_io_sample_out_bits_scores_2),
    .pe_io_sample_out_bits_scores_3(pes_18_pe_io_sample_out_bits_scores_3),
    .pe_io_sample_out_bits_weights_0(pes_18_pe_io_sample_out_bits_weights_0),
    .pe_io_sample_out_bits_weights_1(pes_18_pe_io_sample_out_bits_weights_1),
    .pe_io_sample_out_bits_weights_2(pes_18_pe_io_sample_out_bits_weights_2),
    .pe_io_sample_out_bits_weights_3(pes_18_pe_io_sample_out_bits_weights_3),
    .pe_io_sample_out_bits_weights_4(pes_18_pe_io_sample_out_bits_weights_4),
    .pe_io_sample_out_bits_dest(pes_18_pe_io_sample_out_bits_dest),
    .pe_io_sample_out_bits_last(pes_18_pe_io_sample_out_bits_last)
  );
  TreePEwithBRAM_1 pes_19 ( // @[TreePEsWrapper.scala 57:69]
    .clock(pes_19_clock),
    .reset(pes_19_reset),
    .pe_io_sample_in_ready(pes_19_pe_io_sample_in_ready),
    .pe_io_sample_in_valid(pes_19_pe_io_sample_in_valid),
    .pe_io_sample_in_bits_features_0(pes_19_pe_io_sample_in_bits_features_0),
    .pe_io_sample_in_bits_features_1(pes_19_pe_io_sample_in_bits_features_1),
    .pe_io_sample_in_bits_features_2(pes_19_pe_io_sample_in_bits_features_2),
    .pe_io_sample_in_bits_features_3(pes_19_pe_io_sample_in_bits_features_3),
    .pe_io_sample_in_bits_features_4(pes_19_pe_io_sample_in_bits_features_4),
    .pe_io_sample_in_bits_offset(pes_19_pe_io_sample_in_bits_offset),
    .pe_io_sample_in_bits_search_for_root(pes_19_pe_io_sample_in_bits_search_for_root),
    .pe_io_sample_in_bits_tree_to_exec(pes_19_pe_io_sample_in_bits_tree_to_exec),
    .pe_io_sample_in_bits_scores_0(pes_19_pe_io_sample_in_bits_scores_0),
    .pe_io_sample_in_bits_scores_1(pes_19_pe_io_sample_in_bits_scores_1),
    .pe_io_sample_in_bits_scores_2(pes_19_pe_io_sample_in_bits_scores_2),
    .pe_io_sample_in_bits_scores_3(pes_19_pe_io_sample_in_bits_scores_3),
    .pe_io_sample_in_bits_weights_0(pes_19_pe_io_sample_in_bits_weights_0),
    .pe_io_sample_in_bits_weights_1(pes_19_pe_io_sample_in_bits_weights_1),
    .pe_io_sample_in_bits_weights_2(pes_19_pe_io_sample_in_bits_weights_2),
    .pe_io_sample_in_bits_weights_3(pes_19_pe_io_sample_in_bits_weights_3),
    .pe_io_sample_in_bits_weights_4(pes_19_pe_io_sample_in_bits_weights_4),
    .pe_io_sample_in_bits_last(pes_19_pe_io_sample_in_bits_last),
    .pe_io_mem_addr_1(pes_19_pe_io_mem_addr_1),
    .pe_io_mem_dataOut_1(pes_19_pe_io_mem_dataOut_1),
    .pe_io_sample_out_ready(pes_19_pe_io_sample_out_ready),
    .pe_io_sample_out_valid(pes_19_pe_io_sample_out_valid),
    .pe_io_sample_out_bits_features_0(pes_19_pe_io_sample_out_bits_features_0),
    .pe_io_sample_out_bits_features_1(pes_19_pe_io_sample_out_bits_features_1),
    .pe_io_sample_out_bits_features_2(pes_19_pe_io_sample_out_bits_features_2),
    .pe_io_sample_out_bits_features_3(pes_19_pe_io_sample_out_bits_features_3),
    .pe_io_sample_out_bits_features_4(pes_19_pe_io_sample_out_bits_features_4),
    .pe_io_sample_out_bits_offset(pes_19_pe_io_sample_out_bits_offset),
    .pe_io_sample_out_bits_search_for_root(pes_19_pe_io_sample_out_bits_search_for_root),
    .pe_io_sample_out_bits_tree_to_exec(pes_19_pe_io_sample_out_bits_tree_to_exec),
    .pe_io_sample_out_bits_scores_0(pes_19_pe_io_sample_out_bits_scores_0),
    .pe_io_sample_out_bits_scores_1(pes_19_pe_io_sample_out_bits_scores_1),
    .pe_io_sample_out_bits_scores_2(pes_19_pe_io_sample_out_bits_scores_2),
    .pe_io_sample_out_bits_scores_3(pes_19_pe_io_sample_out_bits_scores_3),
    .pe_io_sample_out_bits_weights_0(pes_19_pe_io_sample_out_bits_weights_0),
    .pe_io_sample_out_bits_weights_1(pes_19_pe_io_sample_out_bits_weights_1),
    .pe_io_sample_out_bits_weights_2(pes_19_pe_io_sample_out_bits_weights_2),
    .pe_io_sample_out_bits_weights_3(pes_19_pe_io_sample_out_bits_weights_3),
    .pe_io_sample_out_bits_weights_4(pes_19_pe_io_sample_out_bits_weights_4),
    .pe_io_sample_out_bits_dest(pes_19_pe_io_sample_out_bits_dest),
    .pe_io_sample_out_bits_last(pes_19_pe_io_sample_out_bits_last)
  );
  TreePEwithBRAM pes_20 ( // @[TreePEsWrapper.scala 57:69]
    .clock(pes_20_clock),
    .reset(pes_20_reset),
    .pe_io_sample_in_ready(pes_20_pe_io_sample_in_ready),
    .pe_io_sample_in_valid(pes_20_pe_io_sample_in_valid),
    .pe_io_sample_in_bits_features_0(pes_20_pe_io_sample_in_bits_features_0),
    .pe_io_sample_in_bits_features_1(pes_20_pe_io_sample_in_bits_features_1),
    .pe_io_sample_in_bits_features_2(pes_20_pe_io_sample_in_bits_features_2),
    .pe_io_sample_in_bits_features_3(pes_20_pe_io_sample_in_bits_features_3),
    .pe_io_sample_in_bits_features_4(pes_20_pe_io_sample_in_bits_features_4),
    .pe_io_sample_in_bits_offset(pes_20_pe_io_sample_in_bits_offset),
    .pe_io_sample_in_bits_search_for_root(pes_20_pe_io_sample_in_bits_search_for_root),
    .pe_io_sample_in_bits_tree_to_exec(pes_20_pe_io_sample_in_bits_tree_to_exec),
    .pe_io_sample_in_bits_scores_0(pes_20_pe_io_sample_in_bits_scores_0),
    .pe_io_sample_in_bits_scores_1(pes_20_pe_io_sample_in_bits_scores_1),
    .pe_io_sample_in_bits_scores_2(pes_20_pe_io_sample_in_bits_scores_2),
    .pe_io_sample_in_bits_scores_3(pes_20_pe_io_sample_in_bits_scores_3),
    .pe_io_sample_in_bits_weights_0(pes_20_pe_io_sample_in_bits_weights_0),
    .pe_io_sample_in_bits_weights_1(pes_20_pe_io_sample_in_bits_weights_1),
    .pe_io_sample_in_bits_weights_2(pes_20_pe_io_sample_in_bits_weights_2),
    .pe_io_sample_in_bits_weights_3(pes_20_pe_io_sample_in_bits_weights_3),
    .pe_io_sample_in_bits_weights_4(pes_20_pe_io_sample_in_bits_weights_4),
    .pe_io_sample_in_bits_last(pes_20_pe_io_sample_in_bits_last),
    .pe_io_mem_addr_1(pes_20_pe_io_mem_addr_1),
    .pe_io_mem_dataOut_1(pes_20_pe_io_mem_dataOut_1),
    .pe_io_sample_out_ready(pes_20_pe_io_sample_out_ready),
    .pe_io_sample_out_valid(pes_20_pe_io_sample_out_valid),
    .pe_io_sample_out_bits_features_0(pes_20_pe_io_sample_out_bits_features_0),
    .pe_io_sample_out_bits_features_1(pes_20_pe_io_sample_out_bits_features_1),
    .pe_io_sample_out_bits_features_2(pes_20_pe_io_sample_out_bits_features_2),
    .pe_io_sample_out_bits_features_3(pes_20_pe_io_sample_out_bits_features_3),
    .pe_io_sample_out_bits_features_4(pes_20_pe_io_sample_out_bits_features_4),
    .pe_io_sample_out_bits_offset(pes_20_pe_io_sample_out_bits_offset),
    .pe_io_sample_out_bits_search_for_root(pes_20_pe_io_sample_out_bits_search_for_root),
    .pe_io_sample_out_bits_tree_to_exec(pes_20_pe_io_sample_out_bits_tree_to_exec),
    .pe_io_sample_out_bits_scores_0(pes_20_pe_io_sample_out_bits_scores_0),
    .pe_io_sample_out_bits_scores_1(pes_20_pe_io_sample_out_bits_scores_1),
    .pe_io_sample_out_bits_scores_2(pes_20_pe_io_sample_out_bits_scores_2),
    .pe_io_sample_out_bits_scores_3(pes_20_pe_io_sample_out_bits_scores_3),
    .pe_io_sample_out_bits_weights_0(pes_20_pe_io_sample_out_bits_weights_0),
    .pe_io_sample_out_bits_weights_1(pes_20_pe_io_sample_out_bits_weights_1),
    .pe_io_sample_out_bits_weights_2(pes_20_pe_io_sample_out_bits_weights_2),
    .pe_io_sample_out_bits_weights_3(pes_20_pe_io_sample_out_bits_weights_3),
    .pe_io_sample_out_bits_weights_4(pes_20_pe_io_sample_out_bits_weights_4),
    .pe_io_sample_out_bits_last(pes_20_pe_io_sample_out_bits_last)
  );
  TreePEwithBRAM_1 pes_21 ( // @[TreePEsWrapper.scala 57:69]
    .clock(pes_21_clock),
    .reset(pes_21_reset),
    .pe_io_sample_in_ready(pes_21_pe_io_sample_in_ready),
    .pe_io_sample_in_valid(pes_21_pe_io_sample_in_valid),
    .pe_io_sample_in_bits_features_0(pes_21_pe_io_sample_in_bits_features_0),
    .pe_io_sample_in_bits_features_1(pes_21_pe_io_sample_in_bits_features_1),
    .pe_io_sample_in_bits_features_2(pes_21_pe_io_sample_in_bits_features_2),
    .pe_io_sample_in_bits_features_3(pes_21_pe_io_sample_in_bits_features_3),
    .pe_io_sample_in_bits_features_4(pes_21_pe_io_sample_in_bits_features_4),
    .pe_io_sample_in_bits_offset(pes_21_pe_io_sample_in_bits_offset),
    .pe_io_sample_in_bits_search_for_root(pes_21_pe_io_sample_in_bits_search_for_root),
    .pe_io_sample_in_bits_tree_to_exec(pes_21_pe_io_sample_in_bits_tree_to_exec),
    .pe_io_sample_in_bits_scores_0(pes_21_pe_io_sample_in_bits_scores_0),
    .pe_io_sample_in_bits_scores_1(pes_21_pe_io_sample_in_bits_scores_1),
    .pe_io_sample_in_bits_scores_2(pes_21_pe_io_sample_in_bits_scores_2),
    .pe_io_sample_in_bits_scores_3(pes_21_pe_io_sample_in_bits_scores_3),
    .pe_io_sample_in_bits_weights_0(pes_21_pe_io_sample_in_bits_weights_0),
    .pe_io_sample_in_bits_weights_1(pes_21_pe_io_sample_in_bits_weights_1),
    .pe_io_sample_in_bits_weights_2(pes_21_pe_io_sample_in_bits_weights_2),
    .pe_io_sample_in_bits_weights_3(pes_21_pe_io_sample_in_bits_weights_3),
    .pe_io_sample_in_bits_weights_4(pes_21_pe_io_sample_in_bits_weights_4),
    .pe_io_sample_in_bits_last(pes_21_pe_io_sample_in_bits_last),
    .pe_io_mem_addr_1(pes_21_pe_io_mem_addr_1),
    .pe_io_mem_dataOut_1(pes_21_pe_io_mem_dataOut_1),
    .pe_io_sample_out_ready(pes_21_pe_io_sample_out_ready),
    .pe_io_sample_out_valid(pes_21_pe_io_sample_out_valid),
    .pe_io_sample_out_bits_features_0(pes_21_pe_io_sample_out_bits_features_0),
    .pe_io_sample_out_bits_features_1(pes_21_pe_io_sample_out_bits_features_1),
    .pe_io_sample_out_bits_features_2(pes_21_pe_io_sample_out_bits_features_2),
    .pe_io_sample_out_bits_features_3(pes_21_pe_io_sample_out_bits_features_3),
    .pe_io_sample_out_bits_features_4(pes_21_pe_io_sample_out_bits_features_4),
    .pe_io_sample_out_bits_offset(pes_21_pe_io_sample_out_bits_offset),
    .pe_io_sample_out_bits_search_for_root(pes_21_pe_io_sample_out_bits_search_for_root),
    .pe_io_sample_out_bits_tree_to_exec(pes_21_pe_io_sample_out_bits_tree_to_exec),
    .pe_io_sample_out_bits_scores_0(pes_21_pe_io_sample_out_bits_scores_0),
    .pe_io_sample_out_bits_scores_1(pes_21_pe_io_sample_out_bits_scores_1),
    .pe_io_sample_out_bits_scores_2(pes_21_pe_io_sample_out_bits_scores_2),
    .pe_io_sample_out_bits_scores_3(pes_21_pe_io_sample_out_bits_scores_3),
    .pe_io_sample_out_bits_weights_0(pes_21_pe_io_sample_out_bits_weights_0),
    .pe_io_sample_out_bits_weights_1(pes_21_pe_io_sample_out_bits_weights_1),
    .pe_io_sample_out_bits_weights_2(pes_21_pe_io_sample_out_bits_weights_2),
    .pe_io_sample_out_bits_weights_3(pes_21_pe_io_sample_out_bits_weights_3),
    .pe_io_sample_out_bits_weights_4(pes_21_pe_io_sample_out_bits_weights_4),
    .pe_io_sample_out_bits_dest(pes_21_pe_io_sample_out_bits_dest),
    .pe_io_sample_out_bits_last(pes_21_pe_io_sample_out_bits_last)
  );
  TreePEwithBRAM_1 pes_22 ( // @[TreePEsWrapper.scala 57:69]
    .clock(pes_22_clock),
    .reset(pes_22_reset),
    .pe_io_sample_in_ready(pes_22_pe_io_sample_in_ready),
    .pe_io_sample_in_valid(pes_22_pe_io_sample_in_valid),
    .pe_io_sample_in_bits_features_0(pes_22_pe_io_sample_in_bits_features_0),
    .pe_io_sample_in_bits_features_1(pes_22_pe_io_sample_in_bits_features_1),
    .pe_io_sample_in_bits_features_2(pes_22_pe_io_sample_in_bits_features_2),
    .pe_io_sample_in_bits_features_3(pes_22_pe_io_sample_in_bits_features_3),
    .pe_io_sample_in_bits_features_4(pes_22_pe_io_sample_in_bits_features_4),
    .pe_io_sample_in_bits_offset(pes_22_pe_io_sample_in_bits_offset),
    .pe_io_sample_in_bits_search_for_root(pes_22_pe_io_sample_in_bits_search_for_root),
    .pe_io_sample_in_bits_tree_to_exec(pes_22_pe_io_sample_in_bits_tree_to_exec),
    .pe_io_sample_in_bits_scores_0(pes_22_pe_io_sample_in_bits_scores_0),
    .pe_io_sample_in_bits_scores_1(pes_22_pe_io_sample_in_bits_scores_1),
    .pe_io_sample_in_bits_scores_2(pes_22_pe_io_sample_in_bits_scores_2),
    .pe_io_sample_in_bits_scores_3(pes_22_pe_io_sample_in_bits_scores_3),
    .pe_io_sample_in_bits_weights_0(pes_22_pe_io_sample_in_bits_weights_0),
    .pe_io_sample_in_bits_weights_1(pes_22_pe_io_sample_in_bits_weights_1),
    .pe_io_sample_in_bits_weights_2(pes_22_pe_io_sample_in_bits_weights_2),
    .pe_io_sample_in_bits_weights_3(pes_22_pe_io_sample_in_bits_weights_3),
    .pe_io_sample_in_bits_weights_4(pes_22_pe_io_sample_in_bits_weights_4),
    .pe_io_sample_in_bits_last(pes_22_pe_io_sample_in_bits_last),
    .pe_io_mem_addr_1(pes_22_pe_io_mem_addr_1),
    .pe_io_mem_dataOut_1(pes_22_pe_io_mem_dataOut_1),
    .pe_io_sample_out_ready(pes_22_pe_io_sample_out_ready),
    .pe_io_sample_out_valid(pes_22_pe_io_sample_out_valid),
    .pe_io_sample_out_bits_features_0(pes_22_pe_io_sample_out_bits_features_0),
    .pe_io_sample_out_bits_features_1(pes_22_pe_io_sample_out_bits_features_1),
    .pe_io_sample_out_bits_features_2(pes_22_pe_io_sample_out_bits_features_2),
    .pe_io_sample_out_bits_features_3(pes_22_pe_io_sample_out_bits_features_3),
    .pe_io_sample_out_bits_features_4(pes_22_pe_io_sample_out_bits_features_4),
    .pe_io_sample_out_bits_offset(pes_22_pe_io_sample_out_bits_offset),
    .pe_io_sample_out_bits_search_for_root(pes_22_pe_io_sample_out_bits_search_for_root),
    .pe_io_sample_out_bits_tree_to_exec(pes_22_pe_io_sample_out_bits_tree_to_exec),
    .pe_io_sample_out_bits_scores_0(pes_22_pe_io_sample_out_bits_scores_0),
    .pe_io_sample_out_bits_scores_1(pes_22_pe_io_sample_out_bits_scores_1),
    .pe_io_sample_out_bits_scores_2(pes_22_pe_io_sample_out_bits_scores_2),
    .pe_io_sample_out_bits_scores_3(pes_22_pe_io_sample_out_bits_scores_3),
    .pe_io_sample_out_bits_weights_0(pes_22_pe_io_sample_out_bits_weights_0),
    .pe_io_sample_out_bits_weights_1(pes_22_pe_io_sample_out_bits_weights_1),
    .pe_io_sample_out_bits_weights_2(pes_22_pe_io_sample_out_bits_weights_2),
    .pe_io_sample_out_bits_weights_3(pes_22_pe_io_sample_out_bits_weights_3),
    .pe_io_sample_out_bits_weights_4(pes_22_pe_io_sample_out_bits_weights_4),
    .pe_io_sample_out_bits_dest(pes_22_pe_io_sample_out_bits_dest),
    .pe_io_sample_out_bits_last(pes_22_pe_io_sample_out_bits_last)
  );
  TreePEwithBRAM_1 pes_23 ( // @[TreePEsWrapper.scala 57:69]
    .clock(pes_23_clock),
    .reset(pes_23_reset),
    .pe_io_sample_in_ready(pes_23_pe_io_sample_in_ready),
    .pe_io_sample_in_valid(pes_23_pe_io_sample_in_valid),
    .pe_io_sample_in_bits_features_0(pes_23_pe_io_sample_in_bits_features_0),
    .pe_io_sample_in_bits_features_1(pes_23_pe_io_sample_in_bits_features_1),
    .pe_io_sample_in_bits_features_2(pes_23_pe_io_sample_in_bits_features_2),
    .pe_io_sample_in_bits_features_3(pes_23_pe_io_sample_in_bits_features_3),
    .pe_io_sample_in_bits_features_4(pes_23_pe_io_sample_in_bits_features_4),
    .pe_io_sample_in_bits_offset(pes_23_pe_io_sample_in_bits_offset),
    .pe_io_sample_in_bits_search_for_root(pes_23_pe_io_sample_in_bits_search_for_root),
    .pe_io_sample_in_bits_tree_to_exec(pes_23_pe_io_sample_in_bits_tree_to_exec),
    .pe_io_sample_in_bits_scores_0(pes_23_pe_io_sample_in_bits_scores_0),
    .pe_io_sample_in_bits_scores_1(pes_23_pe_io_sample_in_bits_scores_1),
    .pe_io_sample_in_bits_scores_2(pes_23_pe_io_sample_in_bits_scores_2),
    .pe_io_sample_in_bits_scores_3(pes_23_pe_io_sample_in_bits_scores_3),
    .pe_io_sample_in_bits_weights_0(pes_23_pe_io_sample_in_bits_weights_0),
    .pe_io_sample_in_bits_weights_1(pes_23_pe_io_sample_in_bits_weights_1),
    .pe_io_sample_in_bits_weights_2(pes_23_pe_io_sample_in_bits_weights_2),
    .pe_io_sample_in_bits_weights_3(pes_23_pe_io_sample_in_bits_weights_3),
    .pe_io_sample_in_bits_weights_4(pes_23_pe_io_sample_in_bits_weights_4),
    .pe_io_sample_in_bits_last(pes_23_pe_io_sample_in_bits_last),
    .pe_io_mem_addr_1(pes_23_pe_io_mem_addr_1),
    .pe_io_mem_dataOut_1(pes_23_pe_io_mem_dataOut_1),
    .pe_io_sample_out_ready(pes_23_pe_io_sample_out_ready),
    .pe_io_sample_out_valid(pes_23_pe_io_sample_out_valid),
    .pe_io_sample_out_bits_features_0(pes_23_pe_io_sample_out_bits_features_0),
    .pe_io_sample_out_bits_features_1(pes_23_pe_io_sample_out_bits_features_1),
    .pe_io_sample_out_bits_features_2(pes_23_pe_io_sample_out_bits_features_2),
    .pe_io_sample_out_bits_features_3(pes_23_pe_io_sample_out_bits_features_3),
    .pe_io_sample_out_bits_features_4(pes_23_pe_io_sample_out_bits_features_4),
    .pe_io_sample_out_bits_offset(pes_23_pe_io_sample_out_bits_offset),
    .pe_io_sample_out_bits_search_for_root(pes_23_pe_io_sample_out_bits_search_for_root),
    .pe_io_sample_out_bits_tree_to_exec(pes_23_pe_io_sample_out_bits_tree_to_exec),
    .pe_io_sample_out_bits_scores_0(pes_23_pe_io_sample_out_bits_scores_0),
    .pe_io_sample_out_bits_scores_1(pes_23_pe_io_sample_out_bits_scores_1),
    .pe_io_sample_out_bits_scores_2(pes_23_pe_io_sample_out_bits_scores_2),
    .pe_io_sample_out_bits_scores_3(pes_23_pe_io_sample_out_bits_scores_3),
    .pe_io_sample_out_bits_weights_0(pes_23_pe_io_sample_out_bits_weights_0),
    .pe_io_sample_out_bits_weights_1(pes_23_pe_io_sample_out_bits_weights_1),
    .pe_io_sample_out_bits_weights_2(pes_23_pe_io_sample_out_bits_weights_2),
    .pe_io_sample_out_bits_weights_3(pes_23_pe_io_sample_out_bits_weights_3),
    .pe_io_sample_out_bits_weights_4(pes_23_pe_io_sample_out_bits_weights_4),
    .pe_io_sample_out_bits_dest(pes_23_pe_io_sample_out_bits_dest),
    .pe_io_sample_out_bits_last(pes_23_pe_io_sample_out_bits_last)
  );
  TreePEwithBRAM_1 pes_24 ( // @[TreePEsWrapper.scala 57:69]
    .clock(pes_24_clock),
    .reset(pes_24_reset),
    .pe_io_sample_in_ready(pes_24_pe_io_sample_in_ready),
    .pe_io_sample_in_valid(pes_24_pe_io_sample_in_valid),
    .pe_io_sample_in_bits_features_0(pes_24_pe_io_sample_in_bits_features_0),
    .pe_io_sample_in_bits_features_1(pes_24_pe_io_sample_in_bits_features_1),
    .pe_io_sample_in_bits_features_2(pes_24_pe_io_sample_in_bits_features_2),
    .pe_io_sample_in_bits_features_3(pes_24_pe_io_sample_in_bits_features_3),
    .pe_io_sample_in_bits_features_4(pes_24_pe_io_sample_in_bits_features_4),
    .pe_io_sample_in_bits_offset(pes_24_pe_io_sample_in_bits_offset),
    .pe_io_sample_in_bits_search_for_root(pes_24_pe_io_sample_in_bits_search_for_root),
    .pe_io_sample_in_bits_tree_to_exec(pes_24_pe_io_sample_in_bits_tree_to_exec),
    .pe_io_sample_in_bits_scores_0(pes_24_pe_io_sample_in_bits_scores_0),
    .pe_io_sample_in_bits_scores_1(pes_24_pe_io_sample_in_bits_scores_1),
    .pe_io_sample_in_bits_scores_2(pes_24_pe_io_sample_in_bits_scores_2),
    .pe_io_sample_in_bits_scores_3(pes_24_pe_io_sample_in_bits_scores_3),
    .pe_io_sample_in_bits_weights_0(pes_24_pe_io_sample_in_bits_weights_0),
    .pe_io_sample_in_bits_weights_1(pes_24_pe_io_sample_in_bits_weights_1),
    .pe_io_sample_in_bits_weights_2(pes_24_pe_io_sample_in_bits_weights_2),
    .pe_io_sample_in_bits_weights_3(pes_24_pe_io_sample_in_bits_weights_3),
    .pe_io_sample_in_bits_weights_4(pes_24_pe_io_sample_in_bits_weights_4),
    .pe_io_sample_in_bits_last(pes_24_pe_io_sample_in_bits_last),
    .pe_io_mem_addr_1(pes_24_pe_io_mem_addr_1),
    .pe_io_mem_dataOut_1(pes_24_pe_io_mem_dataOut_1),
    .pe_io_sample_out_ready(pes_24_pe_io_sample_out_ready),
    .pe_io_sample_out_valid(pes_24_pe_io_sample_out_valid),
    .pe_io_sample_out_bits_features_0(pes_24_pe_io_sample_out_bits_features_0),
    .pe_io_sample_out_bits_features_1(pes_24_pe_io_sample_out_bits_features_1),
    .pe_io_sample_out_bits_features_2(pes_24_pe_io_sample_out_bits_features_2),
    .pe_io_sample_out_bits_features_3(pes_24_pe_io_sample_out_bits_features_3),
    .pe_io_sample_out_bits_features_4(pes_24_pe_io_sample_out_bits_features_4),
    .pe_io_sample_out_bits_offset(pes_24_pe_io_sample_out_bits_offset),
    .pe_io_sample_out_bits_search_for_root(pes_24_pe_io_sample_out_bits_search_for_root),
    .pe_io_sample_out_bits_tree_to_exec(pes_24_pe_io_sample_out_bits_tree_to_exec),
    .pe_io_sample_out_bits_scores_0(pes_24_pe_io_sample_out_bits_scores_0),
    .pe_io_sample_out_bits_scores_1(pes_24_pe_io_sample_out_bits_scores_1),
    .pe_io_sample_out_bits_scores_2(pes_24_pe_io_sample_out_bits_scores_2),
    .pe_io_sample_out_bits_scores_3(pes_24_pe_io_sample_out_bits_scores_3),
    .pe_io_sample_out_bits_weights_0(pes_24_pe_io_sample_out_bits_weights_0),
    .pe_io_sample_out_bits_weights_1(pes_24_pe_io_sample_out_bits_weights_1),
    .pe_io_sample_out_bits_weights_2(pes_24_pe_io_sample_out_bits_weights_2),
    .pe_io_sample_out_bits_weights_3(pes_24_pe_io_sample_out_bits_weights_3),
    .pe_io_sample_out_bits_weights_4(pes_24_pe_io_sample_out_bits_weights_4),
    .pe_io_sample_out_bits_dest(pes_24_pe_io_sample_out_bits_dest),
    .pe_io_sample_out_bits_last(pes_24_pe_io_sample_out_bits_last)
  );
  TreePEwithBRAM pes_25 ( // @[TreePEsWrapper.scala 57:69]
    .clock(pes_25_clock),
    .reset(pes_25_reset),
    .pe_io_sample_in_ready(pes_25_pe_io_sample_in_ready),
    .pe_io_sample_in_valid(pes_25_pe_io_sample_in_valid),
    .pe_io_sample_in_bits_features_0(pes_25_pe_io_sample_in_bits_features_0),
    .pe_io_sample_in_bits_features_1(pes_25_pe_io_sample_in_bits_features_1),
    .pe_io_sample_in_bits_features_2(pes_25_pe_io_sample_in_bits_features_2),
    .pe_io_sample_in_bits_features_3(pes_25_pe_io_sample_in_bits_features_3),
    .pe_io_sample_in_bits_features_4(pes_25_pe_io_sample_in_bits_features_4),
    .pe_io_sample_in_bits_offset(pes_25_pe_io_sample_in_bits_offset),
    .pe_io_sample_in_bits_search_for_root(pes_25_pe_io_sample_in_bits_search_for_root),
    .pe_io_sample_in_bits_tree_to_exec(pes_25_pe_io_sample_in_bits_tree_to_exec),
    .pe_io_sample_in_bits_scores_0(pes_25_pe_io_sample_in_bits_scores_0),
    .pe_io_sample_in_bits_scores_1(pes_25_pe_io_sample_in_bits_scores_1),
    .pe_io_sample_in_bits_scores_2(pes_25_pe_io_sample_in_bits_scores_2),
    .pe_io_sample_in_bits_scores_3(pes_25_pe_io_sample_in_bits_scores_3),
    .pe_io_sample_in_bits_weights_0(pes_25_pe_io_sample_in_bits_weights_0),
    .pe_io_sample_in_bits_weights_1(pes_25_pe_io_sample_in_bits_weights_1),
    .pe_io_sample_in_bits_weights_2(pes_25_pe_io_sample_in_bits_weights_2),
    .pe_io_sample_in_bits_weights_3(pes_25_pe_io_sample_in_bits_weights_3),
    .pe_io_sample_in_bits_weights_4(pes_25_pe_io_sample_in_bits_weights_4),
    .pe_io_sample_in_bits_last(pes_25_pe_io_sample_in_bits_last),
    .pe_io_mem_addr_1(pes_25_pe_io_mem_addr_1),
    .pe_io_mem_dataOut_1(pes_25_pe_io_mem_dataOut_1),
    .pe_io_sample_out_ready(pes_25_pe_io_sample_out_ready),
    .pe_io_sample_out_valid(pes_25_pe_io_sample_out_valid),
    .pe_io_sample_out_bits_features_0(pes_25_pe_io_sample_out_bits_features_0),
    .pe_io_sample_out_bits_features_1(pes_25_pe_io_sample_out_bits_features_1),
    .pe_io_sample_out_bits_features_2(pes_25_pe_io_sample_out_bits_features_2),
    .pe_io_sample_out_bits_features_3(pes_25_pe_io_sample_out_bits_features_3),
    .pe_io_sample_out_bits_features_4(pes_25_pe_io_sample_out_bits_features_4),
    .pe_io_sample_out_bits_offset(pes_25_pe_io_sample_out_bits_offset),
    .pe_io_sample_out_bits_search_for_root(pes_25_pe_io_sample_out_bits_search_for_root),
    .pe_io_sample_out_bits_tree_to_exec(pes_25_pe_io_sample_out_bits_tree_to_exec),
    .pe_io_sample_out_bits_scores_0(pes_25_pe_io_sample_out_bits_scores_0),
    .pe_io_sample_out_bits_scores_1(pes_25_pe_io_sample_out_bits_scores_1),
    .pe_io_sample_out_bits_scores_2(pes_25_pe_io_sample_out_bits_scores_2),
    .pe_io_sample_out_bits_scores_3(pes_25_pe_io_sample_out_bits_scores_3),
    .pe_io_sample_out_bits_weights_0(pes_25_pe_io_sample_out_bits_weights_0),
    .pe_io_sample_out_bits_weights_1(pes_25_pe_io_sample_out_bits_weights_1),
    .pe_io_sample_out_bits_weights_2(pes_25_pe_io_sample_out_bits_weights_2),
    .pe_io_sample_out_bits_weights_3(pes_25_pe_io_sample_out_bits_weights_3),
    .pe_io_sample_out_bits_weights_4(pes_25_pe_io_sample_out_bits_weights_4),
    .pe_io_sample_out_bits_last(pes_25_pe_io_sample_out_bits_last)
  );
  TreePEwithBRAM_1 pes_26 ( // @[TreePEsWrapper.scala 57:69]
    .clock(pes_26_clock),
    .reset(pes_26_reset),
    .pe_io_sample_in_ready(pes_26_pe_io_sample_in_ready),
    .pe_io_sample_in_valid(pes_26_pe_io_sample_in_valid),
    .pe_io_sample_in_bits_features_0(pes_26_pe_io_sample_in_bits_features_0),
    .pe_io_sample_in_bits_features_1(pes_26_pe_io_sample_in_bits_features_1),
    .pe_io_sample_in_bits_features_2(pes_26_pe_io_sample_in_bits_features_2),
    .pe_io_sample_in_bits_features_3(pes_26_pe_io_sample_in_bits_features_3),
    .pe_io_sample_in_bits_features_4(pes_26_pe_io_sample_in_bits_features_4),
    .pe_io_sample_in_bits_offset(pes_26_pe_io_sample_in_bits_offset),
    .pe_io_sample_in_bits_search_for_root(pes_26_pe_io_sample_in_bits_search_for_root),
    .pe_io_sample_in_bits_tree_to_exec(pes_26_pe_io_sample_in_bits_tree_to_exec),
    .pe_io_sample_in_bits_scores_0(pes_26_pe_io_sample_in_bits_scores_0),
    .pe_io_sample_in_bits_scores_1(pes_26_pe_io_sample_in_bits_scores_1),
    .pe_io_sample_in_bits_scores_2(pes_26_pe_io_sample_in_bits_scores_2),
    .pe_io_sample_in_bits_scores_3(pes_26_pe_io_sample_in_bits_scores_3),
    .pe_io_sample_in_bits_weights_0(pes_26_pe_io_sample_in_bits_weights_0),
    .pe_io_sample_in_bits_weights_1(pes_26_pe_io_sample_in_bits_weights_1),
    .pe_io_sample_in_bits_weights_2(pes_26_pe_io_sample_in_bits_weights_2),
    .pe_io_sample_in_bits_weights_3(pes_26_pe_io_sample_in_bits_weights_3),
    .pe_io_sample_in_bits_weights_4(pes_26_pe_io_sample_in_bits_weights_4),
    .pe_io_sample_in_bits_last(pes_26_pe_io_sample_in_bits_last),
    .pe_io_mem_addr_1(pes_26_pe_io_mem_addr_1),
    .pe_io_mem_dataOut_1(pes_26_pe_io_mem_dataOut_1),
    .pe_io_sample_out_ready(pes_26_pe_io_sample_out_ready),
    .pe_io_sample_out_valid(pes_26_pe_io_sample_out_valid),
    .pe_io_sample_out_bits_features_0(pes_26_pe_io_sample_out_bits_features_0),
    .pe_io_sample_out_bits_features_1(pes_26_pe_io_sample_out_bits_features_1),
    .pe_io_sample_out_bits_features_2(pes_26_pe_io_sample_out_bits_features_2),
    .pe_io_sample_out_bits_features_3(pes_26_pe_io_sample_out_bits_features_3),
    .pe_io_sample_out_bits_features_4(pes_26_pe_io_sample_out_bits_features_4),
    .pe_io_sample_out_bits_offset(pes_26_pe_io_sample_out_bits_offset),
    .pe_io_sample_out_bits_search_for_root(pes_26_pe_io_sample_out_bits_search_for_root),
    .pe_io_sample_out_bits_tree_to_exec(pes_26_pe_io_sample_out_bits_tree_to_exec),
    .pe_io_sample_out_bits_scores_0(pes_26_pe_io_sample_out_bits_scores_0),
    .pe_io_sample_out_bits_scores_1(pes_26_pe_io_sample_out_bits_scores_1),
    .pe_io_sample_out_bits_scores_2(pes_26_pe_io_sample_out_bits_scores_2),
    .pe_io_sample_out_bits_scores_3(pes_26_pe_io_sample_out_bits_scores_3),
    .pe_io_sample_out_bits_weights_0(pes_26_pe_io_sample_out_bits_weights_0),
    .pe_io_sample_out_bits_weights_1(pes_26_pe_io_sample_out_bits_weights_1),
    .pe_io_sample_out_bits_weights_2(pes_26_pe_io_sample_out_bits_weights_2),
    .pe_io_sample_out_bits_weights_3(pes_26_pe_io_sample_out_bits_weights_3),
    .pe_io_sample_out_bits_weights_4(pes_26_pe_io_sample_out_bits_weights_4),
    .pe_io_sample_out_bits_dest(pes_26_pe_io_sample_out_bits_dest),
    .pe_io_sample_out_bits_last(pes_26_pe_io_sample_out_bits_last)
  );
  TreePEwithBRAM_1 pes_27 ( // @[TreePEsWrapper.scala 57:69]
    .clock(pes_27_clock),
    .reset(pes_27_reset),
    .pe_io_sample_in_ready(pes_27_pe_io_sample_in_ready),
    .pe_io_sample_in_valid(pes_27_pe_io_sample_in_valid),
    .pe_io_sample_in_bits_features_0(pes_27_pe_io_sample_in_bits_features_0),
    .pe_io_sample_in_bits_features_1(pes_27_pe_io_sample_in_bits_features_1),
    .pe_io_sample_in_bits_features_2(pes_27_pe_io_sample_in_bits_features_2),
    .pe_io_sample_in_bits_features_3(pes_27_pe_io_sample_in_bits_features_3),
    .pe_io_sample_in_bits_features_4(pes_27_pe_io_sample_in_bits_features_4),
    .pe_io_sample_in_bits_offset(pes_27_pe_io_sample_in_bits_offset),
    .pe_io_sample_in_bits_search_for_root(pes_27_pe_io_sample_in_bits_search_for_root),
    .pe_io_sample_in_bits_tree_to_exec(pes_27_pe_io_sample_in_bits_tree_to_exec),
    .pe_io_sample_in_bits_scores_0(pes_27_pe_io_sample_in_bits_scores_0),
    .pe_io_sample_in_bits_scores_1(pes_27_pe_io_sample_in_bits_scores_1),
    .pe_io_sample_in_bits_scores_2(pes_27_pe_io_sample_in_bits_scores_2),
    .pe_io_sample_in_bits_scores_3(pes_27_pe_io_sample_in_bits_scores_3),
    .pe_io_sample_in_bits_weights_0(pes_27_pe_io_sample_in_bits_weights_0),
    .pe_io_sample_in_bits_weights_1(pes_27_pe_io_sample_in_bits_weights_1),
    .pe_io_sample_in_bits_weights_2(pes_27_pe_io_sample_in_bits_weights_2),
    .pe_io_sample_in_bits_weights_3(pes_27_pe_io_sample_in_bits_weights_3),
    .pe_io_sample_in_bits_weights_4(pes_27_pe_io_sample_in_bits_weights_4),
    .pe_io_sample_in_bits_last(pes_27_pe_io_sample_in_bits_last),
    .pe_io_mem_addr_1(pes_27_pe_io_mem_addr_1),
    .pe_io_mem_dataOut_1(pes_27_pe_io_mem_dataOut_1),
    .pe_io_sample_out_ready(pes_27_pe_io_sample_out_ready),
    .pe_io_sample_out_valid(pes_27_pe_io_sample_out_valid),
    .pe_io_sample_out_bits_features_0(pes_27_pe_io_sample_out_bits_features_0),
    .pe_io_sample_out_bits_features_1(pes_27_pe_io_sample_out_bits_features_1),
    .pe_io_sample_out_bits_features_2(pes_27_pe_io_sample_out_bits_features_2),
    .pe_io_sample_out_bits_features_3(pes_27_pe_io_sample_out_bits_features_3),
    .pe_io_sample_out_bits_features_4(pes_27_pe_io_sample_out_bits_features_4),
    .pe_io_sample_out_bits_offset(pes_27_pe_io_sample_out_bits_offset),
    .pe_io_sample_out_bits_search_for_root(pes_27_pe_io_sample_out_bits_search_for_root),
    .pe_io_sample_out_bits_tree_to_exec(pes_27_pe_io_sample_out_bits_tree_to_exec),
    .pe_io_sample_out_bits_scores_0(pes_27_pe_io_sample_out_bits_scores_0),
    .pe_io_sample_out_bits_scores_1(pes_27_pe_io_sample_out_bits_scores_1),
    .pe_io_sample_out_bits_scores_2(pes_27_pe_io_sample_out_bits_scores_2),
    .pe_io_sample_out_bits_scores_3(pes_27_pe_io_sample_out_bits_scores_3),
    .pe_io_sample_out_bits_weights_0(pes_27_pe_io_sample_out_bits_weights_0),
    .pe_io_sample_out_bits_weights_1(pes_27_pe_io_sample_out_bits_weights_1),
    .pe_io_sample_out_bits_weights_2(pes_27_pe_io_sample_out_bits_weights_2),
    .pe_io_sample_out_bits_weights_3(pes_27_pe_io_sample_out_bits_weights_3),
    .pe_io_sample_out_bits_weights_4(pes_27_pe_io_sample_out_bits_weights_4),
    .pe_io_sample_out_bits_dest(pes_27_pe_io_sample_out_bits_dest),
    .pe_io_sample_out_bits_last(pes_27_pe_io_sample_out_bits_last)
  );
  TreePEwithBRAM_1 pes_28 ( // @[TreePEsWrapper.scala 57:69]
    .clock(pes_28_clock),
    .reset(pes_28_reset),
    .pe_io_sample_in_ready(pes_28_pe_io_sample_in_ready),
    .pe_io_sample_in_valid(pes_28_pe_io_sample_in_valid),
    .pe_io_sample_in_bits_features_0(pes_28_pe_io_sample_in_bits_features_0),
    .pe_io_sample_in_bits_features_1(pes_28_pe_io_sample_in_bits_features_1),
    .pe_io_sample_in_bits_features_2(pes_28_pe_io_sample_in_bits_features_2),
    .pe_io_sample_in_bits_features_3(pes_28_pe_io_sample_in_bits_features_3),
    .pe_io_sample_in_bits_features_4(pes_28_pe_io_sample_in_bits_features_4),
    .pe_io_sample_in_bits_offset(pes_28_pe_io_sample_in_bits_offset),
    .pe_io_sample_in_bits_search_for_root(pes_28_pe_io_sample_in_bits_search_for_root),
    .pe_io_sample_in_bits_tree_to_exec(pes_28_pe_io_sample_in_bits_tree_to_exec),
    .pe_io_sample_in_bits_scores_0(pes_28_pe_io_sample_in_bits_scores_0),
    .pe_io_sample_in_bits_scores_1(pes_28_pe_io_sample_in_bits_scores_1),
    .pe_io_sample_in_bits_scores_2(pes_28_pe_io_sample_in_bits_scores_2),
    .pe_io_sample_in_bits_scores_3(pes_28_pe_io_sample_in_bits_scores_3),
    .pe_io_sample_in_bits_weights_0(pes_28_pe_io_sample_in_bits_weights_0),
    .pe_io_sample_in_bits_weights_1(pes_28_pe_io_sample_in_bits_weights_1),
    .pe_io_sample_in_bits_weights_2(pes_28_pe_io_sample_in_bits_weights_2),
    .pe_io_sample_in_bits_weights_3(pes_28_pe_io_sample_in_bits_weights_3),
    .pe_io_sample_in_bits_weights_4(pes_28_pe_io_sample_in_bits_weights_4),
    .pe_io_sample_in_bits_last(pes_28_pe_io_sample_in_bits_last),
    .pe_io_mem_addr_1(pes_28_pe_io_mem_addr_1),
    .pe_io_mem_dataOut_1(pes_28_pe_io_mem_dataOut_1),
    .pe_io_sample_out_ready(pes_28_pe_io_sample_out_ready),
    .pe_io_sample_out_valid(pes_28_pe_io_sample_out_valid),
    .pe_io_sample_out_bits_features_0(pes_28_pe_io_sample_out_bits_features_0),
    .pe_io_sample_out_bits_features_1(pes_28_pe_io_sample_out_bits_features_1),
    .pe_io_sample_out_bits_features_2(pes_28_pe_io_sample_out_bits_features_2),
    .pe_io_sample_out_bits_features_3(pes_28_pe_io_sample_out_bits_features_3),
    .pe_io_sample_out_bits_features_4(pes_28_pe_io_sample_out_bits_features_4),
    .pe_io_sample_out_bits_offset(pes_28_pe_io_sample_out_bits_offset),
    .pe_io_sample_out_bits_search_for_root(pes_28_pe_io_sample_out_bits_search_for_root),
    .pe_io_sample_out_bits_tree_to_exec(pes_28_pe_io_sample_out_bits_tree_to_exec),
    .pe_io_sample_out_bits_scores_0(pes_28_pe_io_sample_out_bits_scores_0),
    .pe_io_sample_out_bits_scores_1(pes_28_pe_io_sample_out_bits_scores_1),
    .pe_io_sample_out_bits_scores_2(pes_28_pe_io_sample_out_bits_scores_2),
    .pe_io_sample_out_bits_scores_3(pes_28_pe_io_sample_out_bits_scores_3),
    .pe_io_sample_out_bits_weights_0(pes_28_pe_io_sample_out_bits_weights_0),
    .pe_io_sample_out_bits_weights_1(pes_28_pe_io_sample_out_bits_weights_1),
    .pe_io_sample_out_bits_weights_2(pes_28_pe_io_sample_out_bits_weights_2),
    .pe_io_sample_out_bits_weights_3(pes_28_pe_io_sample_out_bits_weights_3),
    .pe_io_sample_out_bits_weights_4(pes_28_pe_io_sample_out_bits_weights_4),
    .pe_io_sample_out_bits_dest(pes_28_pe_io_sample_out_bits_dest),
    .pe_io_sample_out_bits_last(pes_28_pe_io_sample_out_bits_last)
  );
  TreePEwithBRAM_1 pes_29 ( // @[TreePEsWrapper.scala 57:69]
    .clock(pes_29_clock),
    .reset(pes_29_reset),
    .pe_io_sample_in_ready(pes_29_pe_io_sample_in_ready),
    .pe_io_sample_in_valid(pes_29_pe_io_sample_in_valid),
    .pe_io_sample_in_bits_features_0(pes_29_pe_io_sample_in_bits_features_0),
    .pe_io_sample_in_bits_features_1(pes_29_pe_io_sample_in_bits_features_1),
    .pe_io_sample_in_bits_features_2(pes_29_pe_io_sample_in_bits_features_2),
    .pe_io_sample_in_bits_features_3(pes_29_pe_io_sample_in_bits_features_3),
    .pe_io_sample_in_bits_features_4(pes_29_pe_io_sample_in_bits_features_4),
    .pe_io_sample_in_bits_offset(pes_29_pe_io_sample_in_bits_offset),
    .pe_io_sample_in_bits_search_for_root(pes_29_pe_io_sample_in_bits_search_for_root),
    .pe_io_sample_in_bits_tree_to_exec(pes_29_pe_io_sample_in_bits_tree_to_exec),
    .pe_io_sample_in_bits_scores_0(pes_29_pe_io_sample_in_bits_scores_0),
    .pe_io_sample_in_bits_scores_1(pes_29_pe_io_sample_in_bits_scores_1),
    .pe_io_sample_in_bits_scores_2(pes_29_pe_io_sample_in_bits_scores_2),
    .pe_io_sample_in_bits_scores_3(pes_29_pe_io_sample_in_bits_scores_3),
    .pe_io_sample_in_bits_weights_0(pes_29_pe_io_sample_in_bits_weights_0),
    .pe_io_sample_in_bits_weights_1(pes_29_pe_io_sample_in_bits_weights_1),
    .pe_io_sample_in_bits_weights_2(pes_29_pe_io_sample_in_bits_weights_2),
    .pe_io_sample_in_bits_weights_3(pes_29_pe_io_sample_in_bits_weights_3),
    .pe_io_sample_in_bits_weights_4(pes_29_pe_io_sample_in_bits_weights_4),
    .pe_io_sample_in_bits_last(pes_29_pe_io_sample_in_bits_last),
    .pe_io_mem_addr_1(pes_29_pe_io_mem_addr_1),
    .pe_io_mem_dataOut_1(pes_29_pe_io_mem_dataOut_1),
    .pe_io_sample_out_ready(pes_29_pe_io_sample_out_ready),
    .pe_io_sample_out_valid(pes_29_pe_io_sample_out_valid),
    .pe_io_sample_out_bits_features_0(pes_29_pe_io_sample_out_bits_features_0),
    .pe_io_sample_out_bits_features_1(pes_29_pe_io_sample_out_bits_features_1),
    .pe_io_sample_out_bits_features_2(pes_29_pe_io_sample_out_bits_features_2),
    .pe_io_sample_out_bits_features_3(pes_29_pe_io_sample_out_bits_features_3),
    .pe_io_sample_out_bits_features_4(pes_29_pe_io_sample_out_bits_features_4),
    .pe_io_sample_out_bits_offset(pes_29_pe_io_sample_out_bits_offset),
    .pe_io_sample_out_bits_search_for_root(pes_29_pe_io_sample_out_bits_search_for_root),
    .pe_io_sample_out_bits_tree_to_exec(pes_29_pe_io_sample_out_bits_tree_to_exec),
    .pe_io_sample_out_bits_scores_0(pes_29_pe_io_sample_out_bits_scores_0),
    .pe_io_sample_out_bits_scores_1(pes_29_pe_io_sample_out_bits_scores_1),
    .pe_io_sample_out_bits_scores_2(pes_29_pe_io_sample_out_bits_scores_2),
    .pe_io_sample_out_bits_scores_3(pes_29_pe_io_sample_out_bits_scores_3),
    .pe_io_sample_out_bits_weights_0(pes_29_pe_io_sample_out_bits_weights_0),
    .pe_io_sample_out_bits_weights_1(pes_29_pe_io_sample_out_bits_weights_1),
    .pe_io_sample_out_bits_weights_2(pes_29_pe_io_sample_out_bits_weights_2),
    .pe_io_sample_out_bits_weights_3(pes_29_pe_io_sample_out_bits_weights_3),
    .pe_io_sample_out_bits_weights_4(pes_29_pe_io_sample_out_bits_weights_4),
    .pe_io_sample_out_bits_dest(pes_29_pe_io_sample_out_bits_dest),
    .pe_io_sample_out_bits_last(pes_29_pe_io_sample_out_bits_last)
  );
  BRAMBlackBox brams_0 ( // @[TreePEsWrapper.scala 58:71]
    .io_clk(brams_0_io_clk),
    .io_a_en(brams_0_io_a_en),
    .io_a_wr(brams_0_io_a_wr),
    .io_a_addr(brams_0_io_a_addr),
    .io_a_din(brams_0_io_a_din),
    .io_a_dout(brams_0_io_a_dout),
    .io_b_addr(brams_0_io_b_addr),
    .io_b_dout(brams_0_io_b_dout)
  );
  BRAMBlackBox brams_1 ( // @[TreePEsWrapper.scala 58:71]
    .io_clk(brams_1_io_clk),
    .io_a_en(brams_1_io_a_en),
    .io_a_wr(brams_1_io_a_wr),
    .io_a_addr(brams_1_io_a_addr),
    .io_a_din(brams_1_io_a_din),
    .io_a_dout(brams_1_io_a_dout),
    .io_b_addr(brams_1_io_b_addr),
    .io_b_dout(brams_1_io_b_dout)
  );
  BRAMBlackBox brams_2 ( // @[TreePEsWrapper.scala 58:71]
    .io_clk(brams_2_io_clk),
    .io_a_en(brams_2_io_a_en),
    .io_a_wr(brams_2_io_a_wr),
    .io_a_addr(brams_2_io_a_addr),
    .io_a_din(brams_2_io_a_din),
    .io_a_dout(brams_2_io_a_dout),
    .io_b_addr(brams_2_io_b_addr),
    .io_b_dout(brams_2_io_b_dout)
  );
  BRAMBlackBox brams_3 ( // @[TreePEsWrapper.scala 58:71]
    .io_clk(brams_3_io_clk),
    .io_a_en(brams_3_io_a_en),
    .io_a_wr(brams_3_io_a_wr),
    .io_a_addr(brams_3_io_a_addr),
    .io_a_din(brams_3_io_a_din),
    .io_a_dout(brams_3_io_a_dout),
    .io_b_addr(brams_3_io_b_addr),
    .io_b_dout(brams_3_io_b_dout)
  );
  BRAMBlackBox brams_4 ( // @[TreePEsWrapper.scala 58:71]
    .io_clk(brams_4_io_clk),
    .io_a_en(brams_4_io_a_en),
    .io_a_wr(brams_4_io_a_wr),
    .io_a_addr(brams_4_io_a_addr),
    .io_a_din(brams_4_io_a_din),
    .io_a_dout(brams_4_io_a_dout),
    .io_b_addr(brams_4_io_b_addr),
    .io_b_dout(brams_4_io_b_dout)
  );
  BRAMBlackBox brams_5 ( // @[TreePEsWrapper.scala 58:71]
    .io_clk(brams_5_io_clk),
    .io_a_en(brams_5_io_a_en),
    .io_a_wr(brams_5_io_a_wr),
    .io_a_addr(brams_5_io_a_addr),
    .io_a_din(brams_5_io_a_din),
    .io_a_dout(brams_5_io_a_dout),
    .io_b_addr(brams_5_io_b_addr),
    .io_b_dout(brams_5_io_b_dout)
  );
  BRAMBlackBox brams_6 ( // @[TreePEsWrapper.scala 58:71]
    .io_clk(brams_6_io_clk),
    .io_a_en(brams_6_io_a_en),
    .io_a_wr(brams_6_io_a_wr),
    .io_a_addr(brams_6_io_a_addr),
    .io_a_din(brams_6_io_a_din),
    .io_a_dout(brams_6_io_a_dout),
    .io_b_addr(brams_6_io_b_addr),
    .io_b_dout(brams_6_io_b_dout)
  );
  BRAMBlackBox brams_7 ( // @[TreePEsWrapper.scala 58:71]
    .io_clk(brams_7_io_clk),
    .io_a_en(brams_7_io_a_en),
    .io_a_wr(brams_7_io_a_wr),
    .io_a_addr(brams_7_io_a_addr),
    .io_a_din(brams_7_io_a_din),
    .io_a_dout(brams_7_io_a_dout),
    .io_b_addr(brams_7_io_b_addr),
    .io_b_dout(brams_7_io_b_dout)
  );
  BRAMBlackBox brams_8 ( // @[TreePEsWrapper.scala 58:71]
    .io_clk(brams_8_io_clk),
    .io_a_en(brams_8_io_a_en),
    .io_a_wr(brams_8_io_a_wr),
    .io_a_addr(brams_8_io_a_addr),
    .io_a_din(brams_8_io_a_din),
    .io_a_dout(brams_8_io_a_dout),
    .io_b_addr(brams_8_io_b_addr),
    .io_b_dout(brams_8_io_b_dout)
  );
  BRAMBlackBox brams_9 ( // @[TreePEsWrapper.scala 58:71]
    .io_clk(brams_9_io_clk),
    .io_a_en(brams_9_io_a_en),
    .io_a_wr(brams_9_io_a_wr),
    .io_a_addr(brams_9_io_a_addr),
    .io_a_din(brams_9_io_a_din),
    .io_a_dout(brams_9_io_a_dout),
    .io_b_addr(brams_9_io_b_addr),
    .io_b_dout(brams_9_io_b_dout)
  );
  BRAMBlackBox brams_10 ( // @[TreePEsWrapper.scala 58:71]
    .io_clk(brams_10_io_clk),
    .io_a_en(brams_10_io_a_en),
    .io_a_wr(brams_10_io_a_wr),
    .io_a_addr(brams_10_io_a_addr),
    .io_a_din(brams_10_io_a_din),
    .io_a_dout(brams_10_io_a_dout),
    .io_b_addr(brams_10_io_b_addr),
    .io_b_dout(brams_10_io_b_dout)
  );
  BRAMBlackBox brams_11 ( // @[TreePEsWrapper.scala 58:71]
    .io_clk(brams_11_io_clk),
    .io_a_en(brams_11_io_a_en),
    .io_a_wr(brams_11_io_a_wr),
    .io_a_addr(brams_11_io_a_addr),
    .io_a_din(brams_11_io_a_din),
    .io_a_dout(brams_11_io_a_dout),
    .io_b_addr(brams_11_io_b_addr),
    .io_b_dout(brams_11_io_b_dout)
  );
  BRAMBlackBox brams_12 ( // @[TreePEsWrapper.scala 58:71]
    .io_clk(brams_12_io_clk),
    .io_a_en(brams_12_io_a_en),
    .io_a_wr(brams_12_io_a_wr),
    .io_a_addr(brams_12_io_a_addr),
    .io_a_din(brams_12_io_a_din),
    .io_a_dout(brams_12_io_a_dout),
    .io_b_addr(brams_12_io_b_addr),
    .io_b_dout(brams_12_io_b_dout)
  );
  BRAMBlackBox brams_13 ( // @[TreePEsWrapper.scala 58:71]
    .io_clk(brams_13_io_clk),
    .io_a_en(brams_13_io_a_en),
    .io_a_wr(brams_13_io_a_wr),
    .io_a_addr(brams_13_io_a_addr),
    .io_a_din(brams_13_io_a_din),
    .io_a_dout(brams_13_io_a_dout),
    .io_b_addr(brams_13_io_b_addr),
    .io_b_dout(brams_13_io_b_dout)
  );
  BRAMBlackBox brams_14 ( // @[TreePEsWrapper.scala 58:71]
    .io_clk(brams_14_io_clk),
    .io_a_en(brams_14_io_a_en),
    .io_a_wr(brams_14_io_a_wr),
    .io_a_addr(brams_14_io_a_addr),
    .io_a_din(brams_14_io_a_din),
    .io_a_dout(brams_14_io_a_dout),
    .io_b_addr(brams_14_io_b_addr),
    .io_b_dout(brams_14_io_b_dout)
  );
  BRAMBlackBox brams_15 ( // @[TreePEsWrapper.scala 58:71]
    .io_clk(brams_15_io_clk),
    .io_a_en(brams_15_io_a_en),
    .io_a_wr(brams_15_io_a_wr),
    .io_a_addr(brams_15_io_a_addr),
    .io_a_din(brams_15_io_a_din),
    .io_a_dout(brams_15_io_a_dout),
    .io_b_addr(brams_15_io_b_addr),
    .io_b_dout(brams_15_io_b_dout)
  );
  BRAMBlackBox brams_16 ( // @[TreePEsWrapper.scala 58:71]
    .io_clk(brams_16_io_clk),
    .io_a_en(brams_16_io_a_en),
    .io_a_wr(brams_16_io_a_wr),
    .io_a_addr(brams_16_io_a_addr),
    .io_a_din(brams_16_io_a_din),
    .io_a_dout(brams_16_io_a_dout),
    .io_b_addr(brams_16_io_b_addr),
    .io_b_dout(brams_16_io_b_dout)
  );
  BRAMBlackBox brams_17 ( // @[TreePEsWrapper.scala 58:71]
    .io_clk(brams_17_io_clk),
    .io_a_en(brams_17_io_a_en),
    .io_a_wr(brams_17_io_a_wr),
    .io_a_addr(brams_17_io_a_addr),
    .io_a_din(brams_17_io_a_din),
    .io_a_dout(brams_17_io_a_dout),
    .io_b_addr(brams_17_io_b_addr),
    .io_b_dout(brams_17_io_b_dout)
  );
  BRAMBlackBox brams_18 ( // @[TreePEsWrapper.scala 58:71]
    .io_clk(brams_18_io_clk),
    .io_a_en(brams_18_io_a_en),
    .io_a_wr(brams_18_io_a_wr),
    .io_a_addr(brams_18_io_a_addr),
    .io_a_din(brams_18_io_a_din),
    .io_a_dout(brams_18_io_a_dout),
    .io_b_addr(brams_18_io_b_addr),
    .io_b_dout(brams_18_io_b_dout)
  );
  BRAMBlackBox brams_19 ( // @[TreePEsWrapper.scala 58:71]
    .io_clk(brams_19_io_clk),
    .io_a_en(brams_19_io_a_en),
    .io_a_wr(brams_19_io_a_wr),
    .io_a_addr(brams_19_io_a_addr),
    .io_a_din(brams_19_io_a_din),
    .io_a_dout(brams_19_io_a_dout),
    .io_b_addr(brams_19_io_b_addr),
    .io_b_dout(brams_19_io_b_dout)
  );
  BRAMBlackBox brams_20 ( // @[TreePEsWrapper.scala 58:71]
    .io_clk(brams_20_io_clk),
    .io_a_en(brams_20_io_a_en),
    .io_a_wr(brams_20_io_a_wr),
    .io_a_addr(brams_20_io_a_addr),
    .io_a_din(brams_20_io_a_din),
    .io_a_dout(brams_20_io_a_dout),
    .io_b_addr(brams_20_io_b_addr),
    .io_b_dout(brams_20_io_b_dout)
  );
  BRAMBlackBox brams_21 ( // @[TreePEsWrapper.scala 58:71]
    .io_clk(brams_21_io_clk),
    .io_a_en(brams_21_io_a_en),
    .io_a_wr(brams_21_io_a_wr),
    .io_a_addr(brams_21_io_a_addr),
    .io_a_din(brams_21_io_a_din),
    .io_a_dout(brams_21_io_a_dout),
    .io_b_addr(brams_21_io_b_addr),
    .io_b_dout(brams_21_io_b_dout)
  );
  BRAMBlackBox brams_22 ( // @[TreePEsWrapper.scala 58:71]
    .io_clk(brams_22_io_clk),
    .io_a_en(brams_22_io_a_en),
    .io_a_wr(brams_22_io_a_wr),
    .io_a_addr(brams_22_io_a_addr),
    .io_a_din(brams_22_io_a_din),
    .io_a_dout(brams_22_io_a_dout),
    .io_b_addr(brams_22_io_b_addr),
    .io_b_dout(brams_22_io_b_dout)
  );
  BRAMBlackBox brams_23 ( // @[TreePEsWrapper.scala 58:71]
    .io_clk(brams_23_io_clk),
    .io_a_en(brams_23_io_a_en),
    .io_a_wr(brams_23_io_a_wr),
    .io_a_addr(brams_23_io_a_addr),
    .io_a_din(brams_23_io_a_din),
    .io_a_dout(brams_23_io_a_dout),
    .io_b_addr(brams_23_io_b_addr),
    .io_b_dout(brams_23_io_b_dout)
  );
  BRAMBlackBox brams_24 ( // @[TreePEsWrapper.scala 58:71]
    .io_clk(brams_24_io_clk),
    .io_a_en(brams_24_io_a_en),
    .io_a_wr(brams_24_io_a_wr),
    .io_a_addr(brams_24_io_a_addr),
    .io_a_din(brams_24_io_a_din),
    .io_a_dout(brams_24_io_a_dout),
    .io_b_addr(brams_24_io_b_addr),
    .io_b_dout(brams_24_io_b_dout)
  );
  BRAMBlackBox brams_25 ( // @[TreePEsWrapper.scala 58:71]
    .io_clk(brams_25_io_clk),
    .io_a_en(brams_25_io_a_en),
    .io_a_wr(brams_25_io_a_wr),
    .io_a_addr(brams_25_io_a_addr),
    .io_a_din(brams_25_io_a_din),
    .io_a_dout(brams_25_io_a_dout),
    .io_b_addr(brams_25_io_b_addr),
    .io_b_dout(brams_25_io_b_dout)
  );
  BRAMBlackBox brams_26 ( // @[TreePEsWrapper.scala 58:71]
    .io_clk(brams_26_io_clk),
    .io_a_en(brams_26_io_a_en),
    .io_a_wr(brams_26_io_a_wr),
    .io_a_addr(brams_26_io_a_addr),
    .io_a_din(brams_26_io_a_din),
    .io_a_dout(brams_26_io_a_dout),
    .io_b_addr(brams_26_io_b_addr),
    .io_b_dout(brams_26_io_b_dout)
  );
  BRAMBlackBox brams_27 ( // @[TreePEsWrapper.scala 58:71]
    .io_clk(brams_27_io_clk),
    .io_a_en(brams_27_io_a_en),
    .io_a_wr(brams_27_io_a_wr),
    .io_a_addr(brams_27_io_a_addr),
    .io_a_din(brams_27_io_a_din),
    .io_a_dout(brams_27_io_a_dout),
    .io_b_addr(brams_27_io_b_addr),
    .io_b_dout(brams_27_io_b_dout)
  );
  BRAMBlackBox brams_28 ( // @[TreePEsWrapper.scala 58:71]
    .io_clk(brams_28_io_clk),
    .io_a_en(brams_28_io_a_en),
    .io_a_wr(brams_28_io_a_wr),
    .io_a_addr(brams_28_io_a_addr),
    .io_a_din(brams_28_io_a_din),
    .io_a_dout(brams_28_io_a_dout),
    .io_b_addr(brams_28_io_b_addr),
    .io_b_dout(brams_28_io_b_dout)
  );
  BRAMBlackBox brams_29 ( // @[TreePEsWrapper.scala 58:71]
    .io_clk(brams_29_io_clk),
    .io_a_en(brams_29_io_a_en),
    .io_a_wr(brams_29_io_a_wr),
    .io_a_addr(brams_29_io_a_addr),
    .io_a_din(brams_29_io_a_din),
    .io_a_dout(brams_29_io_a_dout),
    .io_b_addr(brams_29_io_b_addr),
    .io_b_dout(brams_29_io_b_dout)
  );
  FirstInterconnectPE first_interconnect ( // @[TreePEsWrapper.scala 60:44]
    .clock(first_interconnect_clock),
    .reset(first_interconnect_reset),
    .io_sample_entering_ready(first_interconnect_io_sample_entering_ready),
    .io_sample_entering_valid(first_interconnect_io_sample_entering_valid),
    .io_sample_entering_bits_features_0(first_interconnect_io_sample_entering_bits_features_0),
    .io_sample_entering_bits_features_1(first_interconnect_io_sample_entering_bits_features_1),
    .io_sample_entering_bits_features_2(first_interconnect_io_sample_entering_bits_features_2),
    .io_sample_entering_bits_features_3(first_interconnect_io_sample_entering_bits_features_3),
    .io_sample_entering_bits_features_4(first_interconnect_io_sample_entering_bits_features_4),
    .io_sample_entering_bits_offset(first_interconnect_io_sample_entering_bits_offset),
    .io_sample_entering_bits_search_for_root(first_interconnect_io_sample_entering_bits_search_for_root),
    .io_sample_entering_bits_tree_to_exec(first_interconnect_io_sample_entering_bits_tree_to_exec),
    .io_sample_entering_bits_scores_0(first_interconnect_io_sample_entering_bits_scores_0),
    .io_sample_entering_bits_scores_1(first_interconnect_io_sample_entering_bits_scores_1),
    .io_sample_entering_bits_scores_2(first_interconnect_io_sample_entering_bits_scores_2),
    .io_sample_entering_bits_scores_3(first_interconnect_io_sample_entering_bits_scores_3),
    .io_sample_entering_bits_weights_0(first_interconnect_io_sample_entering_bits_weights_0),
    .io_sample_entering_bits_weights_1(first_interconnect_io_sample_entering_bits_weights_1),
    .io_sample_entering_bits_weights_2(first_interconnect_io_sample_entering_bits_weights_2),
    .io_sample_entering_bits_weights_3(first_interconnect_io_sample_entering_bits_weights_3),
    .io_sample_entering_bits_weights_4(first_interconnect_io_sample_entering_bits_weights_4),
    .io_sample_entering_bits_last(first_interconnect_io_sample_entering_bits_last),
    .io_sample_looping_ready(first_interconnect_io_sample_looping_ready),
    .io_sample_looping_valid(first_interconnect_io_sample_looping_valid),
    .io_sample_looping_bits_features_0(first_interconnect_io_sample_looping_bits_features_0),
    .io_sample_looping_bits_features_1(first_interconnect_io_sample_looping_bits_features_1),
    .io_sample_looping_bits_features_2(first_interconnect_io_sample_looping_bits_features_2),
    .io_sample_looping_bits_features_3(first_interconnect_io_sample_looping_bits_features_3),
    .io_sample_looping_bits_features_4(first_interconnect_io_sample_looping_bits_features_4),
    .io_sample_looping_bits_offset(first_interconnect_io_sample_looping_bits_offset),
    .io_sample_looping_bits_search_for_root(first_interconnect_io_sample_looping_bits_search_for_root),
    .io_sample_looping_bits_tree_to_exec(first_interconnect_io_sample_looping_bits_tree_to_exec),
    .io_sample_looping_bits_scores_0(first_interconnect_io_sample_looping_bits_scores_0),
    .io_sample_looping_bits_scores_1(first_interconnect_io_sample_looping_bits_scores_1),
    .io_sample_looping_bits_scores_2(first_interconnect_io_sample_looping_bits_scores_2),
    .io_sample_looping_bits_scores_3(first_interconnect_io_sample_looping_bits_scores_3),
    .io_sample_looping_bits_weights_0(first_interconnect_io_sample_looping_bits_weights_0),
    .io_sample_looping_bits_weights_1(first_interconnect_io_sample_looping_bits_weights_1),
    .io_sample_looping_bits_weights_2(first_interconnect_io_sample_looping_bits_weights_2),
    .io_sample_looping_bits_weights_3(first_interconnect_io_sample_looping_bits_weights_3),
    .io_sample_looping_bits_weights_4(first_interconnect_io_sample_looping_bits_weights_4),
    .io_sample_looping_bits_last(first_interconnect_io_sample_looping_bits_last),
    .io_sample_out_ready(first_interconnect_io_sample_out_ready),
    .io_sample_out_valid(first_interconnect_io_sample_out_valid),
    .io_sample_out_bits_features_0(first_interconnect_io_sample_out_bits_features_0),
    .io_sample_out_bits_features_1(first_interconnect_io_sample_out_bits_features_1),
    .io_sample_out_bits_features_2(first_interconnect_io_sample_out_bits_features_2),
    .io_sample_out_bits_features_3(first_interconnect_io_sample_out_bits_features_3),
    .io_sample_out_bits_features_4(first_interconnect_io_sample_out_bits_features_4),
    .io_sample_out_bits_offset(first_interconnect_io_sample_out_bits_offset),
    .io_sample_out_bits_search_for_root(first_interconnect_io_sample_out_bits_search_for_root),
    .io_sample_out_bits_tree_to_exec(first_interconnect_io_sample_out_bits_tree_to_exec),
    .io_sample_out_bits_scores_0(first_interconnect_io_sample_out_bits_scores_0),
    .io_sample_out_bits_scores_1(first_interconnect_io_sample_out_bits_scores_1),
    .io_sample_out_bits_scores_2(first_interconnect_io_sample_out_bits_scores_2),
    .io_sample_out_bits_scores_3(first_interconnect_io_sample_out_bits_scores_3),
    .io_sample_out_bits_weights_0(first_interconnect_io_sample_out_bits_weights_0),
    .io_sample_out_bits_weights_1(first_interconnect_io_sample_out_bits_weights_1),
    .io_sample_out_bits_weights_2(first_interconnect_io_sample_out_bits_weights_2),
    .io_sample_out_bits_weights_3(first_interconnect_io_sample_out_bits_weights_3),
    .io_sample_out_bits_weights_4(first_interconnect_io_sample_out_bits_weights_4),
    .io_sample_out_bits_last(first_interconnect_io_sample_out_bits_last)
  );
  LastInterconnectPE last_interconnect ( // @[TreePEsWrapper.scala 61:43]
    .clock(last_interconnect_clock),
    .reset(last_interconnect_reset),
    .io_sample_in_ready(last_interconnect_io_sample_in_ready),
    .io_sample_in_valid(last_interconnect_io_sample_in_valid),
    .io_sample_in_bits_features_0(last_interconnect_io_sample_in_bits_features_0),
    .io_sample_in_bits_features_1(last_interconnect_io_sample_in_bits_features_1),
    .io_sample_in_bits_features_2(last_interconnect_io_sample_in_bits_features_2),
    .io_sample_in_bits_features_3(last_interconnect_io_sample_in_bits_features_3),
    .io_sample_in_bits_features_4(last_interconnect_io_sample_in_bits_features_4),
    .io_sample_in_bits_offset(last_interconnect_io_sample_in_bits_offset),
    .io_sample_in_bits_search_for_root(last_interconnect_io_sample_in_bits_search_for_root),
    .io_sample_in_bits_tree_to_exec(last_interconnect_io_sample_in_bits_tree_to_exec),
    .io_sample_in_bits_scores_0(last_interconnect_io_sample_in_bits_scores_0),
    .io_sample_in_bits_scores_1(last_interconnect_io_sample_in_bits_scores_1),
    .io_sample_in_bits_scores_2(last_interconnect_io_sample_in_bits_scores_2),
    .io_sample_in_bits_scores_3(last_interconnect_io_sample_in_bits_scores_3),
    .io_sample_in_bits_weights_0(last_interconnect_io_sample_in_bits_weights_0),
    .io_sample_in_bits_weights_1(last_interconnect_io_sample_in_bits_weights_1),
    .io_sample_in_bits_weights_2(last_interconnect_io_sample_in_bits_weights_2),
    .io_sample_in_bits_weights_3(last_interconnect_io_sample_in_bits_weights_3),
    .io_sample_in_bits_weights_4(last_interconnect_io_sample_in_bits_weights_4),
    .io_sample_in_bits_dest(last_interconnect_io_sample_in_bits_dest),
    .io_sample_in_bits_last(last_interconnect_io_sample_in_bits_last),
    .io_sample_looping_ready(last_interconnect_io_sample_looping_ready),
    .io_sample_looping_valid(last_interconnect_io_sample_looping_valid),
    .io_sample_looping_bits_features_0(last_interconnect_io_sample_looping_bits_features_0),
    .io_sample_looping_bits_features_1(last_interconnect_io_sample_looping_bits_features_1),
    .io_sample_looping_bits_features_2(last_interconnect_io_sample_looping_bits_features_2),
    .io_sample_looping_bits_features_3(last_interconnect_io_sample_looping_bits_features_3),
    .io_sample_looping_bits_features_4(last_interconnect_io_sample_looping_bits_features_4),
    .io_sample_looping_bits_offset(last_interconnect_io_sample_looping_bits_offset),
    .io_sample_looping_bits_search_for_root(last_interconnect_io_sample_looping_bits_search_for_root),
    .io_sample_looping_bits_tree_to_exec(last_interconnect_io_sample_looping_bits_tree_to_exec),
    .io_sample_looping_bits_scores_0(last_interconnect_io_sample_looping_bits_scores_0),
    .io_sample_looping_bits_scores_1(last_interconnect_io_sample_looping_bits_scores_1),
    .io_sample_looping_bits_scores_2(last_interconnect_io_sample_looping_bits_scores_2),
    .io_sample_looping_bits_scores_3(last_interconnect_io_sample_looping_bits_scores_3),
    .io_sample_looping_bits_weights_0(last_interconnect_io_sample_looping_bits_weights_0),
    .io_sample_looping_bits_weights_1(last_interconnect_io_sample_looping_bits_weights_1),
    .io_sample_looping_bits_weights_2(last_interconnect_io_sample_looping_bits_weights_2),
    .io_sample_looping_bits_weights_3(last_interconnect_io_sample_looping_bits_weights_3),
    .io_sample_looping_bits_weights_4(last_interconnect_io_sample_looping_bits_weights_4),
    .io_sample_looping_bits_last(last_interconnect_io_sample_looping_bits_last),
    .io_sample_leaving_ready(last_interconnect_io_sample_leaving_ready),
    .io_sample_leaving_valid(last_interconnect_io_sample_leaving_valid),
    .io_sample_leaving_bits_features_0(last_interconnect_io_sample_leaving_bits_features_0),
    .io_sample_leaving_bits_features_1(last_interconnect_io_sample_leaving_bits_features_1),
    .io_sample_leaving_bits_features_2(last_interconnect_io_sample_leaving_bits_features_2),
    .io_sample_leaving_bits_features_3(last_interconnect_io_sample_leaving_bits_features_3),
    .io_sample_leaving_bits_features_4(last_interconnect_io_sample_leaving_bits_features_4),
    .io_sample_leaving_bits_offset(last_interconnect_io_sample_leaving_bits_offset),
    .io_sample_leaving_bits_shift(last_interconnect_io_sample_leaving_bits_shift),
    .io_sample_leaving_bits_search_for_root(last_interconnect_io_sample_leaving_bits_search_for_root),
    .io_sample_leaving_bits_tree_to_exec(last_interconnect_io_sample_leaving_bits_tree_to_exec),
    .io_sample_leaving_bits_scores_0(last_interconnect_io_sample_leaving_bits_scores_0),
    .io_sample_leaving_bits_scores_1(last_interconnect_io_sample_leaving_bits_scores_1),
    .io_sample_leaving_bits_scores_2(last_interconnect_io_sample_leaving_bits_scores_2),
    .io_sample_leaving_bits_scores_3(last_interconnect_io_sample_leaving_bits_scores_3),
    .io_sample_leaving_bits_last(last_interconnect_io_sample_leaving_bits_last)
  );
  IncrementTreePE increment ( // @[TreePEsWrapper.scala 62:35]
    .clock(increment_clock),
    .reset(increment_reset),
    .io_sample_in_ready(increment_io_sample_in_ready),
    .io_sample_in_valid(increment_io_sample_in_valid),
    .io_sample_in_bits_features_0(increment_io_sample_in_bits_features_0),
    .io_sample_in_bits_features_1(increment_io_sample_in_bits_features_1),
    .io_sample_in_bits_features_2(increment_io_sample_in_bits_features_2),
    .io_sample_in_bits_features_3(increment_io_sample_in_bits_features_3),
    .io_sample_in_bits_features_4(increment_io_sample_in_bits_features_4),
    .io_sample_in_bits_offset(increment_io_sample_in_bits_offset),
    .io_sample_in_bits_search_for_root(increment_io_sample_in_bits_search_for_root),
    .io_sample_in_bits_tree_to_exec(increment_io_sample_in_bits_tree_to_exec),
    .io_sample_in_bits_scores_0(increment_io_sample_in_bits_scores_0),
    .io_sample_in_bits_scores_1(increment_io_sample_in_bits_scores_1),
    .io_sample_in_bits_scores_2(increment_io_sample_in_bits_scores_2),
    .io_sample_in_bits_scores_3(increment_io_sample_in_bits_scores_3),
    .io_sample_in_bits_weights_0(increment_io_sample_in_bits_weights_0),
    .io_sample_in_bits_weights_1(increment_io_sample_in_bits_weights_1),
    .io_sample_in_bits_weights_2(increment_io_sample_in_bits_weights_2),
    .io_sample_in_bits_weights_3(increment_io_sample_in_bits_weights_3),
    .io_sample_in_bits_weights_4(increment_io_sample_in_bits_weights_4),
    .io_sample_in_bits_last(increment_io_sample_in_bits_last),
    .io_sample_out_ready(increment_io_sample_out_ready),
    .io_sample_out_valid(increment_io_sample_out_valid),
    .io_sample_out_bits_features_0(increment_io_sample_out_bits_features_0),
    .io_sample_out_bits_features_1(increment_io_sample_out_bits_features_1),
    .io_sample_out_bits_features_2(increment_io_sample_out_bits_features_2),
    .io_sample_out_bits_features_3(increment_io_sample_out_bits_features_3),
    .io_sample_out_bits_features_4(increment_io_sample_out_bits_features_4),
    .io_sample_out_bits_offset(increment_io_sample_out_bits_offset),
    .io_sample_out_bits_search_for_root(increment_io_sample_out_bits_search_for_root),
    .io_sample_out_bits_tree_to_exec(increment_io_sample_out_bits_tree_to_exec),
    .io_sample_out_bits_scores_0(increment_io_sample_out_bits_scores_0),
    .io_sample_out_bits_scores_1(increment_io_sample_out_bits_scores_1),
    .io_sample_out_bits_scores_2(increment_io_sample_out_bits_scores_2),
    .io_sample_out_bits_scores_3(increment_io_sample_out_bits_scores_3),
    .io_sample_out_bits_weights_0(increment_io_sample_out_bits_weights_0),
    .io_sample_out_bits_weights_1(increment_io_sample_out_bits_weights_1),
    .io_sample_out_bits_weights_2(increment_io_sample_out_bits_weights_2),
    .io_sample_out_bits_weights_3(increment_io_sample_out_bits_weights_3),
    .io_sample_out_bits_weights_4(increment_io_sample_out_bits_weights_4),
    .io_sample_out_bits_last(increment_io_sample_out_bits_last)
  );
  assign wrapper_io_sample_in_TREADY = forward_converter_io_sample_in_TREADY; // @[TreePEsWrapper.scala 146:30]
  assign wrapper_io_sample_out_TDATA = backward_converter_io_sample_out_TDATA; // @[TreePEsWrapper.scala 149:31]
  assign wrapper_io_sample_out_TLAST = backward_converter_io_sample_out_TLAST; // @[TreePEsWrapper.scala 149:31]
  assign wrapper_io_sample_out_TVALID = backward_converter_io_sample_out_TVALID; // @[TreePEsWrapper.scala 149:31]
  assign brams_io_0_bram_rddata_a = brams_0_io_a_dout; // @[TreePEsWrapper.scala 77:49]
  assign brams_io_1_bram_rddata_a = brams_1_io_a_dout; // @[TreePEsWrapper.scala 77:49]
  assign brams_io_2_bram_rddata_a = brams_2_io_a_dout; // @[TreePEsWrapper.scala 77:49]
  assign brams_io_3_bram_rddata_a = brams_3_io_a_dout; // @[TreePEsWrapper.scala 77:49]
  assign brams_io_4_bram_rddata_a = brams_4_io_a_dout; // @[TreePEsWrapper.scala 77:49]
  assign brams_io_5_bram_rddata_a = brams_5_io_a_dout; // @[TreePEsWrapper.scala 77:49]
  assign brams_io_6_bram_rddata_a = brams_6_io_a_dout; // @[TreePEsWrapper.scala 77:49]
  assign brams_io_7_bram_rddata_a = brams_7_io_a_dout; // @[TreePEsWrapper.scala 77:49]
  assign brams_io_8_bram_rddata_a = brams_8_io_a_dout; // @[TreePEsWrapper.scala 77:49]
  assign brams_io_9_bram_rddata_a = brams_9_io_a_dout; // @[TreePEsWrapper.scala 77:49]
  assign brams_io_10_bram_rddata_a = brams_10_io_a_dout; // @[TreePEsWrapper.scala 77:49]
  assign brams_io_11_bram_rddata_a = brams_11_io_a_dout; // @[TreePEsWrapper.scala 77:49]
  assign brams_io_12_bram_rddata_a = brams_12_io_a_dout; // @[TreePEsWrapper.scala 77:49]
  assign brams_io_13_bram_rddata_a = brams_13_io_a_dout; // @[TreePEsWrapper.scala 77:49]
  assign brams_io_14_bram_rddata_a = brams_14_io_a_dout; // @[TreePEsWrapper.scala 77:49]
  assign brams_io_15_bram_rddata_a = brams_15_io_a_dout; // @[TreePEsWrapper.scala 77:49]
  assign brams_io_16_bram_rddata_a = brams_16_io_a_dout; // @[TreePEsWrapper.scala 77:49]
  assign brams_io_17_bram_rddata_a = brams_17_io_a_dout; // @[TreePEsWrapper.scala 77:49]
  assign brams_io_18_bram_rddata_a = brams_18_io_a_dout; // @[TreePEsWrapper.scala 77:49]
  assign brams_io_19_bram_rddata_a = brams_19_io_a_dout; // @[TreePEsWrapper.scala 77:49]
  assign brams_io_20_bram_rddata_a = brams_20_io_a_dout; // @[TreePEsWrapper.scala 77:49]
  assign brams_io_21_bram_rddata_a = brams_21_io_a_dout; // @[TreePEsWrapper.scala 77:49]
  assign brams_io_22_bram_rddata_a = brams_22_io_a_dout; // @[TreePEsWrapper.scala 77:49]
  assign brams_io_23_bram_rddata_a = brams_23_io_a_dout; // @[TreePEsWrapper.scala 77:49]
  assign brams_io_24_bram_rddata_a = brams_24_io_a_dout; // @[TreePEsWrapper.scala 77:49]
  assign brams_io_25_bram_rddata_a = brams_25_io_a_dout; // @[TreePEsWrapper.scala 77:49]
  assign brams_io_26_bram_rddata_a = brams_26_io_a_dout; // @[TreePEsWrapper.scala 77:49]
  assign brams_io_27_bram_rddata_a = brams_27_io_a_dout; // @[TreePEsWrapper.scala 77:49]
  assign brams_io_28_bram_rddata_a = brams_28_io_a_dout; // @[TreePEsWrapper.scala 77:49]
  assign brams_io_29_bram_rddata_a = brams_29_io_a_dout; // @[TreePEsWrapper.scala 77:49]
  assign forward_converter_io_sample_in_TDATA = wrapper_io_sample_in_TDATA; // @[TreePEsWrapper.scala 146:30]
  assign forward_converter_io_sample_in_TLAST = wrapper_io_sample_in_TLAST; // @[TreePEsWrapper.scala 146:30]
  assign forward_converter_io_sample_in_TVALID = wrapper_io_sample_in_TVALID; // @[TreePEsWrapper.scala 146:30]
  assign forward_converter_io_sample_out_ready = first_interconnect_io_sample_entering_ready; // @[TreePEsWrapper.scala 147:41]
  assign backward_converter_clock = clock;
  assign backward_converter_reset = reset;
  assign backward_converter_io_sample_in_valid = last_interconnect_io_sample_leaving_valid; // @[TreePEsWrapper.scala 109:51]
  assign backward_converter_io_sample_in_bits_features_0 = last_interconnect_io_sample_leaving_bits_features_0; // @[TreePEsWrapper.scala 100:59]
  assign backward_converter_io_sample_in_bits_features_1 = last_interconnect_io_sample_leaving_bits_features_1; // @[TreePEsWrapper.scala 100:59]
  assign backward_converter_io_sample_in_bits_features_2 = last_interconnect_io_sample_leaving_bits_features_2; // @[TreePEsWrapper.scala 100:59]
  assign backward_converter_io_sample_in_bits_features_3 = last_interconnect_io_sample_leaving_bits_features_3; // @[TreePEsWrapper.scala 100:59]
  assign backward_converter_io_sample_in_bits_features_4 = last_interconnect_io_sample_leaving_bits_features_4; // @[TreePEsWrapper.scala 100:59]
  assign backward_converter_io_sample_in_bits_offset = last_interconnect_io_sample_leaving_bits_offset; // @[TreePEsWrapper.scala 104:57]
  assign backward_converter_io_sample_in_bits_shift = last_interconnect_io_sample_leaving_bits_shift; // @[TreePEsWrapper.scala 103:56]
  assign backward_converter_io_sample_in_bits_search_for_root = last_interconnect_io_sample_leaving_bits_search_for_root
    ; // @[TreePEsWrapper.scala 106:66]
  assign backward_converter_io_sample_in_bits_tree_to_exec = last_interconnect_io_sample_leaving_bits_tree_to_exec; // @[TreePEsWrapper.scala 102:63]
  assign backward_converter_io_sample_in_bits_scores_0 = last_interconnect_io_sample_leaving_bits_scores_0; // @[TreePEsWrapper.scala 105:57]
  assign backward_converter_io_sample_in_bits_scores_1 = last_interconnect_io_sample_leaving_bits_scores_1; // @[TreePEsWrapper.scala 105:57]
  assign backward_converter_io_sample_in_bits_scores_2 = last_interconnect_io_sample_leaving_bits_scores_2; // @[TreePEsWrapper.scala 105:57]
  assign backward_converter_io_sample_in_bits_scores_3 = last_interconnect_io_sample_leaving_bits_scores_3; // @[TreePEsWrapper.scala 105:57]
  assign backward_converter_io_sample_in_bits_last = last_interconnect_io_sample_leaving_bits_last; // @[TreePEsWrapper.scala 108:55]
  assign backward_converter_io_sample_in_bits_clock_cycles = cycles_counter; // @[TreePEsWrapper.scala 110:63]
  assign backward_converter_io_sample_out_TREADY = wrapper_io_sample_out_TREADY; // @[TreePEsWrapper.scala 149:31]
  assign pes_0_clock = clock;
  assign pes_0_reset = reset;
  assign pes_0_pe_io_sample_in_valid = first_interconnect_io_sample_out_valid; // @[Interconnect.scala 75:23]
  assign pes_0_pe_io_sample_in_bits_features_0 = first_interconnect_io_sample_out_bits_features_0; // @[Interconnect.scala 75:23]
  assign pes_0_pe_io_sample_in_bits_features_1 = first_interconnect_io_sample_out_bits_features_1; // @[Interconnect.scala 75:23]
  assign pes_0_pe_io_sample_in_bits_features_2 = first_interconnect_io_sample_out_bits_features_2; // @[Interconnect.scala 75:23]
  assign pes_0_pe_io_sample_in_bits_features_3 = first_interconnect_io_sample_out_bits_features_3; // @[Interconnect.scala 75:23]
  assign pes_0_pe_io_sample_in_bits_features_4 = first_interconnect_io_sample_out_bits_features_4; // @[Interconnect.scala 75:23]
  assign pes_0_pe_io_sample_in_bits_offset = first_interconnect_io_sample_out_bits_offset; // @[Interconnect.scala 75:23]
  assign pes_0_pe_io_sample_in_bits_search_for_root = first_interconnect_io_sample_out_bits_search_for_root; // @[Interconnect.scala 75:23]
  assign pes_0_pe_io_sample_in_bits_tree_to_exec = first_interconnect_io_sample_out_bits_tree_to_exec; // @[Interconnect.scala 75:23]
  assign pes_0_pe_io_sample_in_bits_scores_0 = first_interconnect_io_sample_out_bits_scores_0; // @[Interconnect.scala 75:23]
  assign pes_0_pe_io_sample_in_bits_scores_1 = first_interconnect_io_sample_out_bits_scores_1; // @[Interconnect.scala 75:23]
  assign pes_0_pe_io_sample_in_bits_scores_2 = first_interconnect_io_sample_out_bits_scores_2; // @[Interconnect.scala 75:23]
  assign pes_0_pe_io_sample_in_bits_scores_3 = first_interconnect_io_sample_out_bits_scores_3; // @[Interconnect.scala 75:23]
  assign pes_0_pe_io_sample_in_bits_weights_0 = first_interconnect_io_sample_out_bits_weights_0; // @[Interconnect.scala 75:23]
  assign pes_0_pe_io_sample_in_bits_weights_1 = first_interconnect_io_sample_out_bits_weights_1; // @[Interconnect.scala 75:23]
  assign pes_0_pe_io_sample_in_bits_weights_2 = first_interconnect_io_sample_out_bits_weights_2; // @[Interconnect.scala 75:23]
  assign pes_0_pe_io_sample_in_bits_weights_3 = first_interconnect_io_sample_out_bits_weights_3; // @[Interconnect.scala 75:23]
  assign pes_0_pe_io_sample_in_bits_weights_4 = first_interconnect_io_sample_out_bits_weights_4; // @[Interconnect.scala 75:23]
  assign pes_0_pe_io_sample_in_bits_last = first_interconnect_io_sample_out_bits_last; // @[Interconnect.scala 75:23]
  assign pes_0_pe_io_mem_dataOut_1 = brams_0_io_b_dout; // @[TreePEsWrapper.scala 71:44]
  assign pes_0_pe_io_sample_out_ready = pes_1_pe_io_sample_in_ready; // @[TreePE.scala 126:22]
  assign pes_1_clock = clock;
  assign pes_1_reset = reset;
  assign pes_1_pe_io_sample_in_valid = pes_0_pe_io_sample_out_valid; // @[TreePE.scala 126:22]
  assign pes_1_pe_io_sample_in_bits_features_0 = pes_0_pe_io_sample_out_bits_features_0; // @[TreePE.scala 126:22]
  assign pes_1_pe_io_sample_in_bits_features_1 = pes_0_pe_io_sample_out_bits_features_1; // @[TreePE.scala 126:22]
  assign pes_1_pe_io_sample_in_bits_features_2 = pes_0_pe_io_sample_out_bits_features_2; // @[TreePE.scala 126:22]
  assign pes_1_pe_io_sample_in_bits_features_3 = pes_0_pe_io_sample_out_bits_features_3; // @[TreePE.scala 126:22]
  assign pes_1_pe_io_sample_in_bits_features_4 = pes_0_pe_io_sample_out_bits_features_4; // @[TreePE.scala 126:22]
  assign pes_1_pe_io_sample_in_bits_offset = pes_0_pe_io_sample_out_bits_offset; // @[TreePE.scala 126:22]
  assign pes_1_pe_io_sample_in_bits_search_for_root = pes_0_pe_io_sample_out_bits_search_for_root; // @[TreePE.scala 126:22]
  assign pes_1_pe_io_sample_in_bits_tree_to_exec = pes_0_pe_io_sample_out_bits_tree_to_exec; // @[TreePE.scala 126:22]
  assign pes_1_pe_io_sample_in_bits_scores_0 = pes_0_pe_io_sample_out_bits_scores_0; // @[TreePE.scala 126:22]
  assign pes_1_pe_io_sample_in_bits_scores_1 = pes_0_pe_io_sample_out_bits_scores_1; // @[TreePE.scala 126:22]
  assign pes_1_pe_io_sample_in_bits_scores_2 = pes_0_pe_io_sample_out_bits_scores_2; // @[TreePE.scala 126:22]
  assign pes_1_pe_io_sample_in_bits_scores_3 = pes_0_pe_io_sample_out_bits_scores_3; // @[TreePE.scala 126:22]
  assign pes_1_pe_io_sample_in_bits_weights_0 = pes_0_pe_io_sample_out_bits_weights_0; // @[TreePE.scala 126:22]
  assign pes_1_pe_io_sample_in_bits_weights_1 = pes_0_pe_io_sample_out_bits_weights_1; // @[TreePE.scala 126:22]
  assign pes_1_pe_io_sample_in_bits_weights_2 = pes_0_pe_io_sample_out_bits_weights_2; // @[TreePE.scala 126:22]
  assign pes_1_pe_io_sample_in_bits_weights_3 = pes_0_pe_io_sample_out_bits_weights_3; // @[TreePE.scala 126:22]
  assign pes_1_pe_io_sample_in_bits_weights_4 = pes_0_pe_io_sample_out_bits_weights_4; // @[TreePE.scala 126:22]
  assign pes_1_pe_io_sample_in_bits_last = pes_0_pe_io_sample_out_bits_last; // @[TreePE.scala 126:22]
  assign pes_1_pe_io_mem_dataOut_1 = brams_1_io_b_dout; // @[TreePEsWrapper.scala 71:44]
  assign pes_1_pe_io_sample_out_ready = pes_2_pe_io_sample_in_ready; // @[TreePE.scala 126:22]
  assign pes_2_clock = clock;
  assign pes_2_reset = reset;
  assign pes_2_pe_io_sample_in_valid = pes_1_pe_io_sample_out_valid; // @[TreePE.scala 126:22]
  assign pes_2_pe_io_sample_in_bits_features_0 = pes_1_pe_io_sample_out_bits_features_0; // @[TreePE.scala 126:22]
  assign pes_2_pe_io_sample_in_bits_features_1 = pes_1_pe_io_sample_out_bits_features_1; // @[TreePE.scala 126:22]
  assign pes_2_pe_io_sample_in_bits_features_2 = pes_1_pe_io_sample_out_bits_features_2; // @[TreePE.scala 126:22]
  assign pes_2_pe_io_sample_in_bits_features_3 = pes_1_pe_io_sample_out_bits_features_3; // @[TreePE.scala 126:22]
  assign pes_2_pe_io_sample_in_bits_features_4 = pes_1_pe_io_sample_out_bits_features_4; // @[TreePE.scala 126:22]
  assign pes_2_pe_io_sample_in_bits_offset = pes_1_pe_io_sample_out_bits_offset; // @[TreePE.scala 126:22]
  assign pes_2_pe_io_sample_in_bits_search_for_root = pes_1_pe_io_sample_out_bits_search_for_root; // @[TreePE.scala 126:22]
  assign pes_2_pe_io_sample_in_bits_tree_to_exec = pes_1_pe_io_sample_out_bits_tree_to_exec; // @[TreePE.scala 126:22]
  assign pes_2_pe_io_sample_in_bits_scores_0 = pes_1_pe_io_sample_out_bits_scores_0; // @[TreePE.scala 126:22]
  assign pes_2_pe_io_sample_in_bits_scores_1 = pes_1_pe_io_sample_out_bits_scores_1; // @[TreePE.scala 126:22]
  assign pes_2_pe_io_sample_in_bits_scores_2 = pes_1_pe_io_sample_out_bits_scores_2; // @[TreePE.scala 126:22]
  assign pes_2_pe_io_sample_in_bits_scores_3 = pes_1_pe_io_sample_out_bits_scores_3; // @[TreePE.scala 126:22]
  assign pes_2_pe_io_sample_in_bits_weights_0 = pes_1_pe_io_sample_out_bits_weights_0; // @[TreePE.scala 126:22]
  assign pes_2_pe_io_sample_in_bits_weights_1 = pes_1_pe_io_sample_out_bits_weights_1; // @[TreePE.scala 126:22]
  assign pes_2_pe_io_sample_in_bits_weights_2 = pes_1_pe_io_sample_out_bits_weights_2; // @[TreePE.scala 126:22]
  assign pes_2_pe_io_sample_in_bits_weights_3 = pes_1_pe_io_sample_out_bits_weights_3; // @[TreePE.scala 126:22]
  assign pes_2_pe_io_sample_in_bits_weights_4 = pes_1_pe_io_sample_out_bits_weights_4; // @[TreePE.scala 126:22]
  assign pes_2_pe_io_sample_in_bits_last = pes_1_pe_io_sample_out_bits_last; // @[TreePE.scala 126:22]
  assign pes_2_pe_io_mem_dataOut_1 = brams_2_io_b_dout; // @[TreePEsWrapper.scala 71:44]
  assign pes_2_pe_io_sample_out_ready = pes_3_pe_io_sample_in_ready; // @[TreePE.scala 126:22]
  assign pes_3_clock = clock;
  assign pes_3_reset = reset;
  assign pes_3_pe_io_sample_in_valid = pes_2_pe_io_sample_out_valid; // @[TreePE.scala 126:22]
  assign pes_3_pe_io_sample_in_bits_features_0 = pes_2_pe_io_sample_out_bits_features_0; // @[TreePE.scala 126:22]
  assign pes_3_pe_io_sample_in_bits_features_1 = pes_2_pe_io_sample_out_bits_features_1; // @[TreePE.scala 126:22]
  assign pes_3_pe_io_sample_in_bits_features_2 = pes_2_pe_io_sample_out_bits_features_2; // @[TreePE.scala 126:22]
  assign pes_3_pe_io_sample_in_bits_features_3 = pes_2_pe_io_sample_out_bits_features_3; // @[TreePE.scala 126:22]
  assign pes_3_pe_io_sample_in_bits_features_4 = pes_2_pe_io_sample_out_bits_features_4; // @[TreePE.scala 126:22]
  assign pes_3_pe_io_sample_in_bits_offset = pes_2_pe_io_sample_out_bits_offset; // @[TreePE.scala 126:22]
  assign pes_3_pe_io_sample_in_bits_search_for_root = pes_2_pe_io_sample_out_bits_search_for_root; // @[TreePE.scala 126:22]
  assign pes_3_pe_io_sample_in_bits_tree_to_exec = pes_2_pe_io_sample_out_bits_tree_to_exec; // @[TreePE.scala 126:22]
  assign pes_3_pe_io_sample_in_bits_scores_0 = pes_2_pe_io_sample_out_bits_scores_0; // @[TreePE.scala 126:22]
  assign pes_3_pe_io_sample_in_bits_scores_1 = pes_2_pe_io_sample_out_bits_scores_1; // @[TreePE.scala 126:22]
  assign pes_3_pe_io_sample_in_bits_scores_2 = pes_2_pe_io_sample_out_bits_scores_2; // @[TreePE.scala 126:22]
  assign pes_3_pe_io_sample_in_bits_scores_3 = pes_2_pe_io_sample_out_bits_scores_3; // @[TreePE.scala 126:22]
  assign pes_3_pe_io_sample_in_bits_weights_0 = pes_2_pe_io_sample_out_bits_weights_0; // @[TreePE.scala 126:22]
  assign pes_3_pe_io_sample_in_bits_weights_1 = pes_2_pe_io_sample_out_bits_weights_1; // @[TreePE.scala 126:22]
  assign pes_3_pe_io_sample_in_bits_weights_2 = pes_2_pe_io_sample_out_bits_weights_2; // @[TreePE.scala 126:22]
  assign pes_3_pe_io_sample_in_bits_weights_3 = pes_2_pe_io_sample_out_bits_weights_3; // @[TreePE.scala 126:22]
  assign pes_3_pe_io_sample_in_bits_weights_4 = pes_2_pe_io_sample_out_bits_weights_4; // @[TreePE.scala 126:22]
  assign pes_3_pe_io_sample_in_bits_last = pes_2_pe_io_sample_out_bits_last; // @[TreePE.scala 126:22]
  assign pes_3_pe_io_mem_dataOut_1 = brams_3_io_b_dout; // @[TreePEsWrapper.scala 71:44]
  assign pes_3_pe_io_sample_out_ready = pes_4_pe_io_sample_in_ready; // @[TreePE.scala 126:22]
  assign pes_4_clock = clock;
  assign pes_4_reset = reset;
  assign pes_4_pe_io_sample_in_valid = pes_3_pe_io_sample_out_valid; // @[TreePE.scala 126:22]
  assign pes_4_pe_io_sample_in_bits_features_0 = pes_3_pe_io_sample_out_bits_features_0; // @[TreePE.scala 126:22]
  assign pes_4_pe_io_sample_in_bits_features_1 = pes_3_pe_io_sample_out_bits_features_1; // @[TreePE.scala 126:22]
  assign pes_4_pe_io_sample_in_bits_features_2 = pes_3_pe_io_sample_out_bits_features_2; // @[TreePE.scala 126:22]
  assign pes_4_pe_io_sample_in_bits_features_3 = pes_3_pe_io_sample_out_bits_features_3; // @[TreePE.scala 126:22]
  assign pes_4_pe_io_sample_in_bits_features_4 = pes_3_pe_io_sample_out_bits_features_4; // @[TreePE.scala 126:22]
  assign pes_4_pe_io_sample_in_bits_offset = pes_3_pe_io_sample_out_bits_offset; // @[TreePE.scala 126:22]
  assign pes_4_pe_io_sample_in_bits_search_for_root = pes_3_pe_io_sample_out_bits_search_for_root; // @[TreePE.scala 126:22]
  assign pes_4_pe_io_sample_in_bits_tree_to_exec = pes_3_pe_io_sample_out_bits_tree_to_exec; // @[TreePE.scala 126:22]
  assign pes_4_pe_io_sample_in_bits_scores_0 = pes_3_pe_io_sample_out_bits_scores_0; // @[TreePE.scala 126:22]
  assign pes_4_pe_io_sample_in_bits_scores_1 = pes_3_pe_io_sample_out_bits_scores_1; // @[TreePE.scala 126:22]
  assign pes_4_pe_io_sample_in_bits_scores_2 = pes_3_pe_io_sample_out_bits_scores_2; // @[TreePE.scala 126:22]
  assign pes_4_pe_io_sample_in_bits_scores_3 = pes_3_pe_io_sample_out_bits_scores_3; // @[TreePE.scala 126:22]
  assign pes_4_pe_io_sample_in_bits_weights_0 = pes_3_pe_io_sample_out_bits_weights_0; // @[TreePE.scala 126:22]
  assign pes_4_pe_io_sample_in_bits_weights_1 = pes_3_pe_io_sample_out_bits_weights_1; // @[TreePE.scala 126:22]
  assign pes_4_pe_io_sample_in_bits_weights_2 = pes_3_pe_io_sample_out_bits_weights_2; // @[TreePE.scala 126:22]
  assign pes_4_pe_io_sample_in_bits_weights_3 = pes_3_pe_io_sample_out_bits_weights_3; // @[TreePE.scala 126:22]
  assign pes_4_pe_io_sample_in_bits_weights_4 = pes_3_pe_io_sample_out_bits_weights_4; // @[TreePE.scala 126:22]
  assign pes_4_pe_io_sample_in_bits_last = pes_3_pe_io_sample_out_bits_last; // @[TreePE.scala 126:22]
  assign pes_4_pe_io_mem_dataOut_1 = brams_4_io_b_dout; // @[TreePEsWrapper.scala 71:44]
  assign pes_4_pe_io_sample_out_ready = pes_5_pe_io_sample_in_ready; // @[TreePE.scala 126:22]
  assign pes_5_clock = clock;
  assign pes_5_reset = reset;
  assign pes_5_pe_io_sample_in_valid = pes_4_pe_io_sample_out_valid; // @[TreePE.scala 126:22]
  assign pes_5_pe_io_sample_in_bits_features_0 = pes_4_pe_io_sample_out_bits_features_0; // @[TreePE.scala 126:22]
  assign pes_5_pe_io_sample_in_bits_features_1 = pes_4_pe_io_sample_out_bits_features_1; // @[TreePE.scala 126:22]
  assign pes_5_pe_io_sample_in_bits_features_2 = pes_4_pe_io_sample_out_bits_features_2; // @[TreePE.scala 126:22]
  assign pes_5_pe_io_sample_in_bits_features_3 = pes_4_pe_io_sample_out_bits_features_3; // @[TreePE.scala 126:22]
  assign pes_5_pe_io_sample_in_bits_features_4 = pes_4_pe_io_sample_out_bits_features_4; // @[TreePE.scala 126:22]
  assign pes_5_pe_io_sample_in_bits_offset = pes_4_pe_io_sample_out_bits_offset; // @[TreePE.scala 126:22]
  assign pes_5_pe_io_sample_in_bits_search_for_root = pes_4_pe_io_sample_out_bits_search_for_root; // @[TreePE.scala 126:22]
  assign pes_5_pe_io_sample_in_bits_tree_to_exec = pes_4_pe_io_sample_out_bits_tree_to_exec; // @[TreePE.scala 126:22]
  assign pes_5_pe_io_sample_in_bits_scores_0 = pes_4_pe_io_sample_out_bits_scores_0; // @[TreePE.scala 126:22]
  assign pes_5_pe_io_sample_in_bits_scores_1 = pes_4_pe_io_sample_out_bits_scores_1; // @[TreePE.scala 126:22]
  assign pes_5_pe_io_sample_in_bits_scores_2 = pes_4_pe_io_sample_out_bits_scores_2; // @[TreePE.scala 126:22]
  assign pes_5_pe_io_sample_in_bits_scores_3 = pes_4_pe_io_sample_out_bits_scores_3; // @[TreePE.scala 126:22]
  assign pes_5_pe_io_sample_in_bits_weights_0 = pes_4_pe_io_sample_out_bits_weights_0; // @[TreePE.scala 126:22]
  assign pes_5_pe_io_sample_in_bits_weights_1 = pes_4_pe_io_sample_out_bits_weights_1; // @[TreePE.scala 126:22]
  assign pes_5_pe_io_sample_in_bits_weights_2 = pes_4_pe_io_sample_out_bits_weights_2; // @[TreePE.scala 126:22]
  assign pes_5_pe_io_sample_in_bits_weights_3 = pes_4_pe_io_sample_out_bits_weights_3; // @[TreePE.scala 126:22]
  assign pes_5_pe_io_sample_in_bits_weights_4 = pes_4_pe_io_sample_out_bits_weights_4; // @[TreePE.scala 126:22]
  assign pes_5_pe_io_sample_in_bits_last = pes_4_pe_io_sample_out_bits_last; // @[TreePE.scala 126:22]
  assign pes_5_pe_io_mem_dataOut_1 = brams_5_io_b_dout; // @[TreePEsWrapper.scala 71:44]
  assign pes_5_pe_io_sample_out_ready = pes_6_pe_io_sample_in_ready; // @[TreePE.scala 126:22]
  assign pes_6_clock = clock;
  assign pes_6_reset = reset;
  assign pes_6_pe_io_sample_in_valid = pes_5_pe_io_sample_out_valid; // @[TreePE.scala 126:22]
  assign pes_6_pe_io_sample_in_bits_features_0 = pes_5_pe_io_sample_out_bits_features_0; // @[TreePE.scala 126:22]
  assign pes_6_pe_io_sample_in_bits_features_1 = pes_5_pe_io_sample_out_bits_features_1; // @[TreePE.scala 126:22]
  assign pes_6_pe_io_sample_in_bits_features_2 = pes_5_pe_io_sample_out_bits_features_2; // @[TreePE.scala 126:22]
  assign pes_6_pe_io_sample_in_bits_features_3 = pes_5_pe_io_sample_out_bits_features_3; // @[TreePE.scala 126:22]
  assign pes_6_pe_io_sample_in_bits_features_4 = pes_5_pe_io_sample_out_bits_features_4; // @[TreePE.scala 126:22]
  assign pes_6_pe_io_sample_in_bits_offset = pes_5_pe_io_sample_out_bits_offset; // @[TreePE.scala 126:22]
  assign pes_6_pe_io_sample_in_bits_search_for_root = pes_5_pe_io_sample_out_bits_search_for_root; // @[TreePE.scala 126:22]
  assign pes_6_pe_io_sample_in_bits_tree_to_exec = pes_5_pe_io_sample_out_bits_tree_to_exec; // @[TreePE.scala 126:22]
  assign pes_6_pe_io_sample_in_bits_scores_0 = pes_5_pe_io_sample_out_bits_scores_0; // @[TreePE.scala 126:22]
  assign pes_6_pe_io_sample_in_bits_scores_1 = pes_5_pe_io_sample_out_bits_scores_1; // @[TreePE.scala 126:22]
  assign pes_6_pe_io_sample_in_bits_scores_2 = pes_5_pe_io_sample_out_bits_scores_2; // @[TreePE.scala 126:22]
  assign pes_6_pe_io_sample_in_bits_scores_3 = pes_5_pe_io_sample_out_bits_scores_3; // @[TreePE.scala 126:22]
  assign pes_6_pe_io_sample_in_bits_weights_0 = pes_5_pe_io_sample_out_bits_weights_0; // @[TreePE.scala 126:22]
  assign pes_6_pe_io_sample_in_bits_weights_1 = pes_5_pe_io_sample_out_bits_weights_1; // @[TreePE.scala 126:22]
  assign pes_6_pe_io_sample_in_bits_weights_2 = pes_5_pe_io_sample_out_bits_weights_2; // @[TreePE.scala 126:22]
  assign pes_6_pe_io_sample_in_bits_weights_3 = pes_5_pe_io_sample_out_bits_weights_3; // @[TreePE.scala 126:22]
  assign pes_6_pe_io_sample_in_bits_weights_4 = pes_5_pe_io_sample_out_bits_weights_4; // @[TreePE.scala 126:22]
  assign pes_6_pe_io_sample_in_bits_last = pes_5_pe_io_sample_out_bits_last; // @[TreePE.scala 126:22]
  assign pes_6_pe_io_mem_dataOut_1 = brams_6_io_b_dout; // @[TreePEsWrapper.scala 71:44]
  assign pes_6_pe_io_sample_out_ready = pes_7_pe_io_sample_in_ready; // @[TreePE.scala 126:22]
  assign pes_7_clock = clock;
  assign pes_7_reset = reset;
  assign pes_7_pe_io_sample_in_valid = pes_6_pe_io_sample_out_valid; // @[TreePE.scala 126:22]
  assign pes_7_pe_io_sample_in_bits_features_0 = pes_6_pe_io_sample_out_bits_features_0; // @[TreePE.scala 126:22]
  assign pes_7_pe_io_sample_in_bits_features_1 = pes_6_pe_io_sample_out_bits_features_1; // @[TreePE.scala 126:22]
  assign pes_7_pe_io_sample_in_bits_features_2 = pes_6_pe_io_sample_out_bits_features_2; // @[TreePE.scala 126:22]
  assign pes_7_pe_io_sample_in_bits_features_3 = pes_6_pe_io_sample_out_bits_features_3; // @[TreePE.scala 126:22]
  assign pes_7_pe_io_sample_in_bits_features_4 = pes_6_pe_io_sample_out_bits_features_4; // @[TreePE.scala 126:22]
  assign pes_7_pe_io_sample_in_bits_offset = pes_6_pe_io_sample_out_bits_offset; // @[TreePE.scala 126:22]
  assign pes_7_pe_io_sample_in_bits_search_for_root = pes_6_pe_io_sample_out_bits_search_for_root; // @[TreePE.scala 126:22]
  assign pes_7_pe_io_sample_in_bits_tree_to_exec = pes_6_pe_io_sample_out_bits_tree_to_exec; // @[TreePE.scala 126:22]
  assign pes_7_pe_io_sample_in_bits_scores_0 = pes_6_pe_io_sample_out_bits_scores_0; // @[TreePE.scala 126:22]
  assign pes_7_pe_io_sample_in_bits_scores_1 = pes_6_pe_io_sample_out_bits_scores_1; // @[TreePE.scala 126:22]
  assign pes_7_pe_io_sample_in_bits_scores_2 = pes_6_pe_io_sample_out_bits_scores_2; // @[TreePE.scala 126:22]
  assign pes_7_pe_io_sample_in_bits_scores_3 = pes_6_pe_io_sample_out_bits_scores_3; // @[TreePE.scala 126:22]
  assign pes_7_pe_io_sample_in_bits_weights_0 = pes_6_pe_io_sample_out_bits_weights_0; // @[TreePE.scala 126:22]
  assign pes_7_pe_io_sample_in_bits_weights_1 = pes_6_pe_io_sample_out_bits_weights_1; // @[TreePE.scala 126:22]
  assign pes_7_pe_io_sample_in_bits_weights_2 = pes_6_pe_io_sample_out_bits_weights_2; // @[TreePE.scala 126:22]
  assign pes_7_pe_io_sample_in_bits_weights_3 = pes_6_pe_io_sample_out_bits_weights_3; // @[TreePE.scala 126:22]
  assign pes_7_pe_io_sample_in_bits_weights_4 = pes_6_pe_io_sample_out_bits_weights_4; // @[TreePE.scala 126:22]
  assign pes_7_pe_io_sample_in_bits_last = pes_6_pe_io_sample_out_bits_last; // @[TreePE.scala 126:22]
  assign pes_7_pe_io_mem_dataOut_1 = brams_7_io_b_dout; // @[TreePEsWrapper.scala 71:44]
  assign pes_7_pe_io_sample_out_ready = pes_8_pe_io_sample_in_ready; // @[TreePE.scala 126:22]
  assign pes_8_clock = clock;
  assign pes_8_reset = reset;
  assign pes_8_pe_io_sample_in_valid = pes_7_pe_io_sample_out_valid; // @[TreePE.scala 126:22]
  assign pes_8_pe_io_sample_in_bits_features_0 = pes_7_pe_io_sample_out_bits_features_0; // @[TreePE.scala 126:22]
  assign pes_8_pe_io_sample_in_bits_features_1 = pes_7_pe_io_sample_out_bits_features_1; // @[TreePE.scala 126:22]
  assign pes_8_pe_io_sample_in_bits_features_2 = pes_7_pe_io_sample_out_bits_features_2; // @[TreePE.scala 126:22]
  assign pes_8_pe_io_sample_in_bits_features_3 = pes_7_pe_io_sample_out_bits_features_3; // @[TreePE.scala 126:22]
  assign pes_8_pe_io_sample_in_bits_features_4 = pes_7_pe_io_sample_out_bits_features_4; // @[TreePE.scala 126:22]
  assign pes_8_pe_io_sample_in_bits_offset = pes_7_pe_io_sample_out_bits_offset; // @[TreePE.scala 126:22]
  assign pes_8_pe_io_sample_in_bits_search_for_root = pes_7_pe_io_sample_out_bits_search_for_root; // @[TreePE.scala 126:22]
  assign pes_8_pe_io_sample_in_bits_tree_to_exec = pes_7_pe_io_sample_out_bits_tree_to_exec; // @[TreePE.scala 126:22]
  assign pes_8_pe_io_sample_in_bits_scores_0 = pes_7_pe_io_sample_out_bits_scores_0; // @[TreePE.scala 126:22]
  assign pes_8_pe_io_sample_in_bits_scores_1 = pes_7_pe_io_sample_out_bits_scores_1; // @[TreePE.scala 126:22]
  assign pes_8_pe_io_sample_in_bits_scores_2 = pes_7_pe_io_sample_out_bits_scores_2; // @[TreePE.scala 126:22]
  assign pes_8_pe_io_sample_in_bits_scores_3 = pes_7_pe_io_sample_out_bits_scores_3; // @[TreePE.scala 126:22]
  assign pes_8_pe_io_sample_in_bits_weights_0 = pes_7_pe_io_sample_out_bits_weights_0; // @[TreePE.scala 126:22]
  assign pes_8_pe_io_sample_in_bits_weights_1 = pes_7_pe_io_sample_out_bits_weights_1; // @[TreePE.scala 126:22]
  assign pes_8_pe_io_sample_in_bits_weights_2 = pes_7_pe_io_sample_out_bits_weights_2; // @[TreePE.scala 126:22]
  assign pes_8_pe_io_sample_in_bits_weights_3 = pes_7_pe_io_sample_out_bits_weights_3; // @[TreePE.scala 126:22]
  assign pes_8_pe_io_sample_in_bits_weights_4 = pes_7_pe_io_sample_out_bits_weights_4; // @[TreePE.scala 126:22]
  assign pes_8_pe_io_sample_in_bits_last = pes_7_pe_io_sample_out_bits_last; // @[TreePE.scala 126:22]
  assign pes_8_pe_io_mem_dataOut_1 = brams_8_io_b_dout; // @[TreePEsWrapper.scala 71:44]
  assign pes_8_pe_io_sample_out_ready = pes_9_pe_io_sample_in_ready; // @[TreePE.scala 126:22]
  assign pes_9_clock = clock;
  assign pes_9_reset = reset;
  assign pes_9_pe_io_sample_in_valid = pes_8_pe_io_sample_out_valid; // @[TreePE.scala 126:22]
  assign pes_9_pe_io_sample_in_bits_features_0 = pes_8_pe_io_sample_out_bits_features_0; // @[TreePE.scala 126:22]
  assign pes_9_pe_io_sample_in_bits_features_1 = pes_8_pe_io_sample_out_bits_features_1; // @[TreePE.scala 126:22]
  assign pes_9_pe_io_sample_in_bits_features_2 = pes_8_pe_io_sample_out_bits_features_2; // @[TreePE.scala 126:22]
  assign pes_9_pe_io_sample_in_bits_features_3 = pes_8_pe_io_sample_out_bits_features_3; // @[TreePE.scala 126:22]
  assign pes_9_pe_io_sample_in_bits_features_4 = pes_8_pe_io_sample_out_bits_features_4; // @[TreePE.scala 126:22]
  assign pes_9_pe_io_sample_in_bits_offset = pes_8_pe_io_sample_out_bits_offset; // @[TreePE.scala 126:22]
  assign pes_9_pe_io_sample_in_bits_search_for_root = pes_8_pe_io_sample_out_bits_search_for_root; // @[TreePE.scala 126:22]
  assign pes_9_pe_io_sample_in_bits_tree_to_exec = pes_8_pe_io_sample_out_bits_tree_to_exec; // @[TreePE.scala 126:22]
  assign pes_9_pe_io_sample_in_bits_scores_0 = pes_8_pe_io_sample_out_bits_scores_0; // @[TreePE.scala 126:22]
  assign pes_9_pe_io_sample_in_bits_scores_1 = pes_8_pe_io_sample_out_bits_scores_1; // @[TreePE.scala 126:22]
  assign pes_9_pe_io_sample_in_bits_scores_2 = pes_8_pe_io_sample_out_bits_scores_2; // @[TreePE.scala 126:22]
  assign pes_9_pe_io_sample_in_bits_scores_3 = pes_8_pe_io_sample_out_bits_scores_3; // @[TreePE.scala 126:22]
  assign pes_9_pe_io_sample_in_bits_weights_0 = pes_8_pe_io_sample_out_bits_weights_0; // @[TreePE.scala 126:22]
  assign pes_9_pe_io_sample_in_bits_weights_1 = pes_8_pe_io_sample_out_bits_weights_1; // @[TreePE.scala 126:22]
  assign pes_9_pe_io_sample_in_bits_weights_2 = pes_8_pe_io_sample_out_bits_weights_2; // @[TreePE.scala 126:22]
  assign pes_9_pe_io_sample_in_bits_weights_3 = pes_8_pe_io_sample_out_bits_weights_3; // @[TreePE.scala 126:22]
  assign pes_9_pe_io_sample_in_bits_weights_4 = pes_8_pe_io_sample_out_bits_weights_4; // @[TreePE.scala 126:22]
  assign pes_9_pe_io_sample_in_bits_last = pes_8_pe_io_sample_out_bits_last; // @[TreePE.scala 126:22]
  assign pes_9_pe_io_mem_dataOut_1 = brams_9_io_b_dout; // @[TreePEsWrapper.scala 71:44]
  assign pes_9_pe_io_sample_out_ready = pes_10_pe_io_sample_in_ready; // @[TreePE.scala 126:22]
  assign pes_10_clock = clock;
  assign pes_10_reset = reset;
  assign pes_10_pe_io_sample_in_valid = pes_9_pe_io_sample_out_valid; // @[TreePE.scala 126:22]
  assign pes_10_pe_io_sample_in_bits_features_0 = pes_9_pe_io_sample_out_bits_features_0; // @[TreePE.scala 126:22]
  assign pes_10_pe_io_sample_in_bits_features_1 = pes_9_pe_io_sample_out_bits_features_1; // @[TreePE.scala 126:22]
  assign pes_10_pe_io_sample_in_bits_features_2 = pes_9_pe_io_sample_out_bits_features_2; // @[TreePE.scala 126:22]
  assign pes_10_pe_io_sample_in_bits_features_3 = pes_9_pe_io_sample_out_bits_features_3; // @[TreePE.scala 126:22]
  assign pes_10_pe_io_sample_in_bits_features_4 = pes_9_pe_io_sample_out_bits_features_4; // @[TreePE.scala 126:22]
  assign pes_10_pe_io_sample_in_bits_offset = pes_9_pe_io_sample_out_bits_offset; // @[TreePE.scala 126:22]
  assign pes_10_pe_io_sample_in_bits_search_for_root = pes_9_pe_io_sample_out_bits_search_for_root; // @[TreePE.scala 126:22]
  assign pes_10_pe_io_sample_in_bits_tree_to_exec = pes_9_pe_io_sample_out_bits_tree_to_exec; // @[TreePE.scala 126:22]
  assign pes_10_pe_io_sample_in_bits_scores_0 = pes_9_pe_io_sample_out_bits_scores_0; // @[TreePE.scala 126:22]
  assign pes_10_pe_io_sample_in_bits_scores_1 = pes_9_pe_io_sample_out_bits_scores_1; // @[TreePE.scala 126:22]
  assign pes_10_pe_io_sample_in_bits_scores_2 = pes_9_pe_io_sample_out_bits_scores_2; // @[TreePE.scala 126:22]
  assign pes_10_pe_io_sample_in_bits_scores_3 = pes_9_pe_io_sample_out_bits_scores_3; // @[TreePE.scala 126:22]
  assign pes_10_pe_io_sample_in_bits_weights_0 = pes_9_pe_io_sample_out_bits_weights_0; // @[TreePE.scala 126:22]
  assign pes_10_pe_io_sample_in_bits_weights_1 = pes_9_pe_io_sample_out_bits_weights_1; // @[TreePE.scala 126:22]
  assign pes_10_pe_io_sample_in_bits_weights_2 = pes_9_pe_io_sample_out_bits_weights_2; // @[TreePE.scala 126:22]
  assign pes_10_pe_io_sample_in_bits_weights_3 = pes_9_pe_io_sample_out_bits_weights_3; // @[TreePE.scala 126:22]
  assign pes_10_pe_io_sample_in_bits_weights_4 = pes_9_pe_io_sample_out_bits_weights_4; // @[TreePE.scala 126:22]
  assign pes_10_pe_io_sample_in_bits_last = pes_9_pe_io_sample_out_bits_last; // @[TreePE.scala 126:22]
  assign pes_10_pe_io_mem_dataOut_1 = brams_10_io_b_dout; // @[TreePEsWrapper.scala 71:44]
  assign pes_10_pe_io_sample_out_ready = pes_11_pe_io_sample_in_ready; // @[TreePE.scala 126:22]
  assign pes_11_clock = clock;
  assign pes_11_reset = reset;
  assign pes_11_pe_io_sample_in_valid = pes_10_pe_io_sample_out_valid; // @[TreePE.scala 126:22]
  assign pes_11_pe_io_sample_in_bits_features_0 = pes_10_pe_io_sample_out_bits_features_0; // @[TreePE.scala 126:22]
  assign pes_11_pe_io_sample_in_bits_features_1 = pes_10_pe_io_sample_out_bits_features_1; // @[TreePE.scala 126:22]
  assign pes_11_pe_io_sample_in_bits_features_2 = pes_10_pe_io_sample_out_bits_features_2; // @[TreePE.scala 126:22]
  assign pes_11_pe_io_sample_in_bits_features_3 = pes_10_pe_io_sample_out_bits_features_3; // @[TreePE.scala 126:22]
  assign pes_11_pe_io_sample_in_bits_features_4 = pes_10_pe_io_sample_out_bits_features_4; // @[TreePE.scala 126:22]
  assign pes_11_pe_io_sample_in_bits_offset = pes_10_pe_io_sample_out_bits_offset; // @[TreePE.scala 126:22]
  assign pes_11_pe_io_sample_in_bits_search_for_root = pes_10_pe_io_sample_out_bits_search_for_root; // @[TreePE.scala 126:22]
  assign pes_11_pe_io_sample_in_bits_tree_to_exec = pes_10_pe_io_sample_out_bits_tree_to_exec; // @[TreePE.scala 126:22]
  assign pes_11_pe_io_sample_in_bits_scores_0 = pes_10_pe_io_sample_out_bits_scores_0; // @[TreePE.scala 126:22]
  assign pes_11_pe_io_sample_in_bits_scores_1 = pes_10_pe_io_sample_out_bits_scores_1; // @[TreePE.scala 126:22]
  assign pes_11_pe_io_sample_in_bits_scores_2 = pes_10_pe_io_sample_out_bits_scores_2; // @[TreePE.scala 126:22]
  assign pes_11_pe_io_sample_in_bits_scores_3 = pes_10_pe_io_sample_out_bits_scores_3; // @[TreePE.scala 126:22]
  assign pes_11_pe_io_sample_in_bits_weights_0 = pes_10_pe_io_sample_out_bits_weights_0; // @[TreePE.scala 126:22]
  assign pes_11_pe_io_sample_in_bits_weights_1 = pes_10_pe_io_sample_out_bits_weights_1; // @[TreePE.scala 126:22]
  assign pes_11_pe_io_sample_in_bits_weights_2 = pes_10_pe_io_sample_out_bits_weights_2; // @[TreePE.scala 126:22]
  assign pes_11_pe_io_sample_in_bits_weights_3 = pes_10_pe_io_sample_out_bits_weights_3; // @[TreePE.scala 126:22]
  assign pes_11_pe_io_sample_in_bits_weights_4 = pes_10_pe_io_sample_out_bits_weights_4; // @[TreePE.scala 126:22]
  assign pes_11_pe_io_sample_in_bits_last = pes_10_pe_io_sample_out_bits_last; // @[TreePE.scala 126:22]
  assign pes_11_pe_io_mem_dataOut_1 = brams_11_io_b_dout; // @[TreePEsWrapper.scala 71:44]
  assign pes_11_pe_io_sample_out_ready = pes_12_pe_io_sample_in_ready; // @[TreePE.scala 126:22]
  assign pes_12_clock = clock;
  assign pes_12_reset = reset;
  assign pes_12_pe_io_sample_in_valid = pes_11_pe_io_sample_out_valid; // @[TreePE.scala 126:22]
  assign pes_12_pe_io_sample_in_bits_features_0 = pes_11_pe_io_sample_out_bits_features_0; // @[TreePE.scala 126:22]
  assign pes_12_pe_io_sample_in_bits_features_1 = pes_11_pe_io_sample_out_bits_features_1; // @[TreePE.scala 126:22]
  assign pes_12_pe_io_sample_in_bits_features_2 = pes_11_pe_io_sample_out_bits_features_2; // @[TreePE.scala 126:22]
  assign pes_12_pe_io_sample_in_bits_features_3 = pes_11_pe_io_sample_out_bits_features_3; // @[TreePE.scala 126:22]
  assign pes_12_pe_io_sample_in_bits_features_4 = pes_11_pe_io_sample_out_bits_features_4; // @[TreePE.scala 126:22]
  assign pes_12_pe_io_sample_in_bits_offset = pes_11_pe_io_sample_out_bits_offset; // @[TreePE.scala 126:22]
  assign pes_12_pe_io_sample_in_bits_search_for_root = pes_11_pe_io_sample_out_bits_search_for_root; // @[TreePE.scala 126:22]
  assign pes_12_pe_io_sample_in_bits_tree_to_exec = pes_11_pe_io_sample_out_bits_tree_to_exec; // @[TreePE.scala 126:22]
  assign pes_12_pe_io_sample_in_bits_scores_0 = pes_11_pe_io_sample_out_bits_scores_0; // @[TreePE.scala 126:22]
  assign pes_12_pe_io_sample_in_bits_scores_1 = pes_11_pe_io_sample_out_bits_scores_1; // @[TreePE.scala 126:22]
  assign pes_12_pe_io_sample_in_bits_scores_2 = pes_11_pe_io_sample_out_bits_scores_2; // @[TreePE.scala 126:22]
  assign pes_12_pe_io_sample_in_bits_scores_3 = pes_11_pe_io_sample_out_bits_scores_3; // @[TreePE.scala 126:22]
  assign pes_12_pe_io_sample_in_bits_weights_0 = pes_11_pe_io_sample_out_bits_weights_0; // @[TreePE.scala 126:22]
  assign pes_12_pe_io_sample_in_bits_weights_1 = pes_11_pe_io_sample_out_bits_weights_1; // @[TreePE.scala 126:22]
  assign pes_12_pe_io_sample_in_bits_weights_2 = pes_11_pe_io_sample_out_bits_weights_2; // @[TreePE.scala 126:22]
  assign pes_12_pe_io_sample_in_bits_weights_3 = pes_11_pe_io_sample_out_bits_weights_3; // @[TreePE.scala 126:22]
  assign pes_12_pe_io_sample_in_bits_weights_4 = pes_11_pe_io_sample_out_bits_weights_4; // @[TreePE.scala 126:22]
  assign pes_12_pe_io_sample_in_bits_last = pes_11_pe_io_sample_out_bits_last; // @[TreePE.scala 126:22]
  assign pes_12_pe_io_mem_dataOut_1 = brams_12_io_b_dout; // @[TreePEsWrapper.scala 71:44]
  assign pes_12_pe_io_sample_out_ready = pes_13_pe_io_sample_in_ready; // @[TreePE.scala 126:22]
  assign pes_13_clock = clock;
  assign pes_13_reset = reset;
  assign pes_13_pe_io_sample_in_valid = pes_12_pe_io_sample_out_valid; // @[TreePE.scala 126:22]
  assign pes_13_pe_io_sample_in_bits_features_0 = pes_12_pe_io_sample_out_bits_features_0; // @[TreePE.scala 126:22]
  assign pes_13_pe_io_sample_in_bits_features_1 = pes_12_pe_io_sample_out_bits_features_1; // @[TreePE.scala 126:22]
  assign pes_13_pe_io_sample_in_bits_features_2 = pes_12_pe_io_sample_out_bits_features_2; // @[TreePE.scala 126:22]
  assign pes_13_pe_io_sample_in_bits_features_3 = pes_12_pe_io_sample_out_bits_features_3; // @[TreePE.scala 126:22]
  assign pes_13_pe_io_sample_in_bits_features_4 = pes_12_pe_io_sample_out_bits_features_4; // @[TreePE.scala 126:22]
  assign pes_13_pe_io_sample_in_bits_offset = pes_12_pe_io_sample_out_bits_offset; // @[TreePE.scala 126:22]
  assign pes_13_pe_io_sample_in_bits_search_for_root = pes_12_pe_io_sample_out_bits_search_for_root; // @[TreePE.scala 126:22]
  assign pes_13_pe_io_sample_in_bits_tree_to_exec = pes_12_pe_io_sample_out_bits_tree_to_exec; // @[TreePE.scala 126:22]
  assign pes_13_pe_io_sample_in_bits_scores_0 = pes_12_pe_io_sample_out_bits_scores_0; // @[TreePE.scala 126:22]
  assign pes_13_pe_io_sample_in_bits_scores_1 = pes_12_pe_io_sample_out_bits_scores_1; // @[TreePE.scala 126:22]
  assign pes_13_pe_io_sample_in_bits_scores_2 = pes_12_pe_io_sample_out_bits_scores_2; // @[TreePE.scala 126:22]
  assign pes_13_pe_io_sample_in_bits_scores_3 = pes_12_pe_io_sample_out_bits_scores_3; // @[TreePE.scala 126:22]
  assign pes_13_pe_io_sample_in_bits_weights_0 = pes_12_pe_io_sample_out_bits_weights_0; // @[TreePE.scala 126:22]
  assign pes_13_pe_io_sample_in_bits_weights_1 = pes_12_pe_io_sample_out_bits_weights_1; // @[TreePE.scala 126:22]
  assign pes_13_pe_io_sample_in_bits_weights_2 = pes_12_pe_io_sample_out_bits_weights_2; // @[TreePE.scala 126:22]
  assign pes_13_pe_io_sample_in_bits_weights_3 = pes_12_pe_io_sample_out_bits_weights_3; // @[TreePE.scala 126:22]
  assign pes_13_pe_io_sample_in_bits_weights_4 = pes_12_pe_io_sample_out_bits_weights_4; // @[TreePE.scala 126:22]
  assign pes_13_pe_io_sample_in_bits_last = pes_12_pe_io_sample_out_bits_last; // @[TreePE.scala 126:22]
  assign pes_13_pe_io_mem_dataOut_1 = brams_13_io_b_dout; // @[TreePEsWrapper.scala 71:44]
  assign pes_13_pe_io_sample_out_ready = pes_14_pe_io_sample_in_ready; // @[TreePE.scala 126:22]
  assign pes_14_clock = clock;
  assign pes_14_reset = reset;
  assign pes_14_pe_io_sample_in_valid = pes_13_pe_io_sample_out_valid; // @[TreePE.scala 126:22]
  assign pes_14_pe_io_sample_in_bits_features_0 = pes_13_pe_io_sample_out_bits_features_0; // @[TreePE.scala 126:22]
  assign pes_14_pe_io_sample_in_bits_features_1 = pes_13_pe_io_sample_out_bits_features_1; // @[TreePE.scala 126:22]
  assign pes_14_pe_io_sample_in_bits_features_2 = pes_13_pe_io_sample_out_bits_features_2; // @[TreePE.scala 126:22]
  assign pes_14_pe_io_sample_in_bits_features_3 = pes_13_pe_io_sample_out_bits_features_3; // @[TreePE.scala 126:22]
  assign pes_14_pe_io_sample_in_bits_features_4 = pes_13_pe_io_sample_out_bits_features_4; // @[TreePE.scala 126:22]
  assign pes_14_pe_io_sample_in_bits_offset = pes_13_pe_io_sample_out_bits_offset; // @[TreePE.scala 126:22]
  assign pes_14_pe_io_sample_in_bits_search_for_root = pes_13_pe_io_sample_out_bits_search_for_root; // @[TreePE.scala 126:22]
  assign pes_14_pe_io_sample_in_bits_tree_to_exec = pes_13_pe_io_sample_out_bits_tree_to_exec; // @[TreePE.scala 126:22]
  assign pes_14_pe_io_sample_in_bits_scores_0 = pes_13_pe_io_sample_out_bits_scores_0; // @[TreePE.scala 126:22]
  assign pes_14_pe_io_sample_in_bits_scores_1 = pes_13_pe_io_sample_out_bits_scores_1; // @[TreePE.scala 126:22]
  assign pes_14_pe_io_sample_in_bits_scores_2 = pes_13_pe_io_sample_out_bits_scores_2; // @[TreePE.scala 126:22]
  assign pes_14_pe_io_sample_in_bits_scores_3 = pes_13_pe_io_sample_out_bits_scores_3; // @[TreePE.scala 126:22]
  assign pes_14_pe_io_sample_in_bits_weights_0 = pes_13_pe_io_sample_out_bits_weights_0; // @[TreePE.scala 126:22]
  assign pes_14_pe_io_sample_in_bits_weights_1 = pes_13_pe_io_sample_out_bits_weights_1; // @[TreePE.scala 126:22]
  assign pes_14_pe_io_sample_in_bits_weights_2 = pes_13_pe_io_sample_out_bits_weights_2; // @[TreePE.scala 126:22]
  assign pes_14_pe_io_sample_in_bits_weights_3 = pes_13_pe_io_sample_out_bits_weights_3; // @[TreePE.scala 126:22]
  assign pes_14_pe_io_sample_in_bits_weights_4 = pes_13_pe_io_sample_out_bits_weights_4; // @[TreePE.scala 126:22]
  assign pes_14_pe_io_sample_in_bits_last = pes_13_pe_io_sample_out_bits_last; // @[TreePE.scala 126:22]
  assign pes_14_pe_io_mem_dataOut_1 = brams_14_io_b_dout; // @[TreePEsWrapper.scala 71:44]
  assign pes_14_pe_io_sample_out_ready = pes_15_pe_io_sample_in_ready; // @[TreePE.scala 126:22]
  assign pes_15_clock = clock;
  assign pes_15_reset = reset;
  assign pes_15_pe_io_sample_in_valid = pes_14_pe_io_sample_out_valid; // @[TreePE.scala 126:22]
  assign pes_15_pe_io_sample_in_bits_features_0 = pes_14_pe_io_sample_out_bits_features_0; // @[TreePE.scala 126:22]
  assign pes_15_pe_io_sample_in_bits_features_1 = pes_14_pe_io_sample_out_bits_features_1; // @[TreePE.scala 126:22]
  assign pes_15_pe_io_sample_in_bits_features_2 = pes_14_pe_io_sample_out_bits_features_2; // @[TreePE.scala 126:22]
  assign pes_15_pe_io_sample_in_bits_features_3 = pes_14_pe_io_sample_out_bits_features_3; // @[TreePE.scala 126:22]
  assign pes_15_pe_io_sample_in_bits_features_4 = pes_14_pe_io_sample_out_bits_features_4; // @[TreePE.scala 126:22]
  assign pes_15_pe_io_sample_in_bits_offset = pes_14_pe_io_sample_out_bits_offset; // @[TreePE.scala 126:22]
  assign pes_15_pe_io_sample_in_bits_search_for_root = pes_14_pe_io_sample_out_bits_search_for_root; // @[TreePE.scala 126:22]
  assign pes_15_pe_io_sample_in_bits_tree_to_exec = pes_14_pe_io_sample_out_bits_tree_to_exec; // @[TreePE.scala 126:22]
  assign pes_15_pe_io_sample_in_bits_scores_0 = pes_14_pe_io_sample_out_bits_scores_0; // @[TreePE.scala 126:22]
  assign pes_15_pe_io_sample_in_bits_scores_1 = pes_14_pe_io_sample_out_bits_scores_1; // @[TreePE.scala 126:22]
  assign pes_15_pe_io_sample_in_bits_scores_2 = pes_14_pe_io_sample_out_bits_scores_2; // @[TreePE.scala 126:22]
  assign pes_15_pe_io_sample_in_bits_scores_3 = pes_14_pe_io_sample_out_bits_scores_3; // @[TreePE.scala 126:22]
  assign pes_15_pe_io_sample_in_bits_weights_0 = pes_14_pe_io_sample_out_bits_weights_0; // @[TreePE.scala 126:22]
  assign pes_15_pe_io_sample_in_bits_weights_1 = pes_14_pe_io_sample_out_bits_weights_1; // @[TreePE.scala 126:22]
  assign pes_15_pe_io_sample_in_bits_weights_2 = pes_14_pe_io_sample_out_bits_weights_2; // @[TreePE.scala 126:22]
  assign pes_15_pe_io_sample_in_bits_weights_3 = pes_14_pe_io_sample_out_bits_weights_3; // @[TreePE.scala 126:22]
  assign pes_15_pe_io_sample_in_bits_weights_4 = pes_14_pe_io_sample_out_bits_weights_4; // @[TreePE.scala 126:22]
  assign pes_15_pe_io_sample_in_bits_last = pes_14_pe_io_sample_out_bits_last; // @[TreePE.scala 126:22]
  assign pes_15_pe_io_mem_dataOut_1 = brams_15_io_b_dout; // @[TreePEsWrapper.scala 71:44]
  assign pes_15_pe_io_sample_out_ready = pes_16_pe_io_sample_in_ready; // @[TreePE.scala 126:22]
  assign pes_16_clock = clock;
  assign pes_16_reset = reset;
  assign pes_16_pe_io_sample_in_valid = pes_15_pe_io_sample_out_valid; // @[TreePE.scala 126:22]
  assign pes_16_pe_io_sample_in_bits_features_0 = pes_15_pe_io_sample_out_bits_features_0; // @[TreePE.scala 126:22]
  assign pes_16_pe_io_sample_in_bits_features_1 = pes_15_pe_io_sample_out_bits_features_1; // @[TreePE.scala 126:22]
  assign pes_16_pe_io_sample_in_bits_features_2 = pes_15_pe_io_sample_out_bits_features_2; // @[TreePE.scala 126:22]
  assign pes_16_pe_io_sample_in_bits_features_3 = pes_15_pe_io_sample_out_bits_features_3; // @[TreePE.scala 126:22]
  assign pes_16_pe_io_sample_in_bits_features_4 = pes_15_pe_io_sample_out_bits_features_4; // @[TreePE.scala 126:22]
  assign pes_16_pe_io_sample_in_bits_offset = pes_15_pe_io_sample_out_bits_offset; // @[TreePE.scala 126:22]
  assign pes_16_pe_io_sample_in_bits_search_for_root = pes_15_pe_io_sample_out_bits_search_for_root; // @[TreePE.scala 126:22]
  assign pes_16_pe_io_sample_in_bits_tree_to_exec = pes_15_pe_io_sample_out_bits_tree_to_exec; // @[TreePE.scala 126:22]
  assign pes_16_pe_io_sample_in_bits_scores_0 = pes_15_pe_io_sample_out_bits_scores_0; // @[TreePE.scala 126:22]
  assign pes_16_pe_io_sample_in_bits_scores_1 = pes_15_pe_io_sample_out_bits_scores_1; // @[TreePE.scala 126:22]
  assign pes_16_pe_io_sample_in_bits_scores_2 = pes_15_pe_io_sample_out_bits_scores_2; // @[TreePE.scala 126:22]
  assign pes_16_pe_io_sample_in_bits_scores_3 = pes_15_pe_io_sample_out_bits_scores_3; // @[TreePE.scala 126:22]
  assign pes_16_pe_io_sample_in_bits_weights_0 = pes_15_pe_io_sample_out_bits_weights_0; // @[TreePE.scala 126:22]
  assign pes_16_pe_io_sample_in_bits_weights_1 = pes_15_pe_io_sample_out_bits_weights_1; // @[TreePE.scala 126:22]
  assign pes_16_pe_io_sample_in_bits_weights_2 = pes_15_pe_io_sample_out_bits_weights_2; // @[TreePE.scala 126:22]
  assign pes_16_pe_io_sample_in_bits_weights_3 = pes_15_pe_io_sample_out_bits_weights_3; // @[TreePE.scala 126:22]
  assign pes_16_pe_io_sample_in_bits_weights_4 = pes_15_pe_io_sample_out_bits_weights_4; // @[TreePE.scala 126:22]
  assign pes_16_pe_io_sample_in_bits_last = pes_15_pe_io_sample_out_bits_last; // @[TreePE.scala 126:22]
  assign pes_16_pe_io_mem_dataOut_1 = brams_16_io_b_dout; // @[TreePEsWrapper.scala 71:44]
  assign pes_16_pe_io_sample_out_ready = pes_17_pe_io_sample_in_ready; // @[TreePE.scala 126:22]
  assign pes_17_clock = clock;
  assign pes_17_reset = reset;
  assign pes_17_pe_io_sample_in_valid = pes_16_pe_io_sample_out_valid; // @[TreePE.scala 126:22]
  assign pes_17_pe_io_sample_in_bits_features_0 = pes_16_pe_io_sample_out_bits_features_0; // @[TreePE.scala 126:22]
  assign pes_17_pe_io_sample_in_bits_features_1 = pes_16_pe_io_sample_out_bits_features_1; // @[TreePE.scala 126:22]
  assign pes_17_pe_io_sample_in_bits_features_2 = pes_16_pe_io_sample_out_bits_features_2; // @[TreePE.scala 126:22]
  assign pes_17_pe_io_sample_in_bits_features_3 = pes_16_pe_io_sample_out_bits_features_3; // @[TreePE.scala 126:22]
  assign pes_17_pe_io_sample_in_bits_features_4 = pes_16_pe_io_sample_out_bits_features_4; // @[TreePE.scala 126:22]
  assign pes_17_pe_io_sample_in_bits_offset = pes_16_pe_io_sample_out_bits_offset; // @[TreePE.scala 126:22]
  assign pes_17_pe_io_sample_in_bits_search_for_root = pes_16_pe_io_sample_out_bits_search_for_root; // @[TreePE.scala 126:22]
  assign pes_17_pe_io_sample_in_bits_tree_to_exec = pes_16_pe_io_sample_out_bits_tree_to_exec; // @[TreePE.scala 126:22]
  assign pes_17_pe_io_sample_in_bits_scores_0 = pes_16_pe_io_sample_out_bits_scores_0; // @[TreePE.scala 126:22]
  assign pes_17_pe_io_sample_in_bits_scores_1 = pes_16_pe_io_sample_out_bits_scores_1; // @[TreePE.scala 126:22]
  assign pes_17_pe_io_sample_in_bits_scores_2 = pes_16_pe_io_sample_out_bits_scores_2; // @[TreePE.scala 126:22]
  assign pes_17_pe_io_sample_in_bits_scores_3 = pes_16_pe_io_sample_out_bits_scores_3; // @[TreePE.scala 126:22]
  assign pes_17_pe_io_sample_in_bits_weights_0 = pes_16_pe_io_sample_out_bits_weights_0; // @[TreePE.scala 126:22]
  assign pes_17_pe_io_sample_in_bits_weights_1 = pes_16_pe_io_sample_out_bits_weights_1; // @[TreePE.scala 126:22]
  assign pes_17_pe_io_sample_in_bits_weights_2 = pes_16_pe_io_sample_out_bits_weights_2; // @[TreePE.scala 126:22]
  assign pes_17_pe_io_sample_in_bits_weights_3 = pes_16_pe_io_sample_out_bits_weights_3; // @[TreePE.scala 126:22]
  assign pes_17_pe_io_sample_in_bits_weights_4 = pes_16_pe_io_sample_out_bits_weights_4; // @[TreePE.scala 126:22]
  assign pes_17_pe_io_sample_in_bits_last = pes_16_pe_io_sample_out_bits_last; // @[TreePE.scala 126:22]
  assign pes_17_pe_io_mem_dataOut_1 = brams_17_io_b_dout; // @[TreePEsWrapper.scala 71:44]
  assign pes_17_pe_io_sample_out_ready = pes_18_pe_io_sample_in_ready; // @[TreePE.scala 126:22]
  assign pes_18_clock = clock;
  assign pes_18_reset = reset;
  assign pes_18_pe_io_sample_in_valid = pes_17_pe_io_sample_out_valid; // @[TreePE.scala 126:22]
  assign pes_18_pe_io_sample_in_bits_features_0 = pes_17_pe_io_sample_out_bits_features_0; // @[TreePE.scala 126:22]
  assign pes_18_pe_io_sample_in_bits_features_1 = pes_17_pe_io_sample_out_bits_features_1; // @[TreePE.scala 126:22]
  assign pes_18_pe_io_sample_in_bits_features_2 = pes_17_pe_io_sample_out_bits_features_2; // @[TreePE.scala 126:22]
  assign pes_18_pe_io_sample_in_bits_features_3 = pes_17_pe_io_sample_out_bits_features_3; // @[TreePE.scala 126:22]
  assign pes_18_pe_io_sample_in_bits_features_4 = pes_17_pe_io_sample_out_bits_features_4; // @[TreePE.scala 126:22]
  assign pes_18_pe_io_sample_in_bits_offset = pes_17_pe_io_sample_out_bits_offset; // @[TreePE.scala 126:22]
  assign pes_18_pe_io_sample_in_bits_search_for_root = pes_17_pe_io_sample_out_bits_search_for_root; // @[TreePE.scala 126:22]
  assign pes_18_pe_io_sample_in_bits_tree_to_exec = pes_17_pe_io_sample_out_bits_tree_to_exec; // @[TreePE.scala 126:22]
  assign pes_18_pe_io_sample_in_bits_scores_0 = pes_17_pe_io_sample_out_bits_scores_0; // @[TreePE.scala 126:22]
  assign pes_18_pe_io_sample_in_bits_scores_1 = pes_17_pe_io_sample_out_bits_scores_1; // @[TreePE.scala 126:22]
  assign pes_18_pe_io_sample_in_bits_scores_2 = pes_17_pe_io_sample_out_bits_scores_2; // @[TreePE.scala 126:22]
  assign pes_18_pe_io_sample_in_bits_scores_3 = pes_17_pe_io_sample_out_bits_scores_3; // @[TreePE.scala 126:22]
  assign pes_18_pe_io_sample_in_bits_weights_0 = pes_17_pe_io_sample_out_bits_weights_0; // @[TreePE.scala 126:22]
  assign pes_18_pe_io_sample_in_bits_weights_1 = pes_17_pe_io_sample_out_bits_weights_1; // @[TreePE.scala 126:22]
  assign pes_18_pe_io_sample_in_bits_weights_2 = pes_17_pe_io_sample_out_bits_weights_2; // @[TreePE.scala 126:22]
  assign pes_18_pe_io_sample_in_bits_weights_3 = pes_17_pe_io_sample_out_bits_weights_3; // @[TreePE.scala 126:22]
  assign pes_18_pe_io_sample_in_bits_weights_4 = pes_17_pe_io_sample_out_bits_weights_4; // @[TreePE.scala 126:22]
  assign pes_18_pe_io_sample_in_bits_last = pes_17_pe_io_sample_out_bits_last; // @[TreePE.scala 126:22]
  assign pes_18_pe_io_mem_dataOut_1 = brams_18_io_b_dout; // @[TreePEsWrapper.scala 71:44]
  assign pes_18_pe_io_sample_out_ready = pes_19_pe_io_sample_in_ready; // @[TreePE.scala 126:22]
  assign pes_19_clock = clock;
  assign pes_19_reset = reset;
  assign pes_19_pe_io_sample_in_valid = pes_18_pe_io_sample_out_valid; // @[TreePE.scala 126:22]
  assign pes_19_pe_io_sample_in_bits_features_0 = pes_18_pe_io_sample_out_bits_features_0; // @[TreePE.scala 126:22]
  assign pes_19_pe_io_sample_in_bits_features_1 = pes_18_pe_io_sample_out_bits_features_1; // @[TreePE.scala 126:22]
  assign pes_19_pe_io_sample_in_bits_features_2 = pes_18_pe_io_sample_out_bits_features_2; // @[TreePE.scala 126:22]
  assign pes_19_pe_io_sample_in_bits_features_3 = pes_18_pe_io_sample_out_bits_features_3; // @[TreePE.scala 126:22]
  assign pes_19_pe_io_sample_in_bits_features_4 = pes_18_pe_io_sample_out_bits_features_4; // @[TreePE.scala 126:22]
  assign pes_19_pe_io_sample_in_bits_offset = pes_18_pe_io_sample_out_bits_offset; // @[TreePE.scala 126:22]
  assign pes_19_pe_io_sample_in_bits_search_for_root = pes_18_pe_io_sample_out_bits_search_for_root; // @[TreePE.scala 126:22]
  assign pes_19_pe_io_sample_in_bits_tree_to_exec = pes_18_pe_io_sample_out_bits_tree_to_exec; // @[TreePE.scala 126:22]
  assign pes_19_pe_io_sample_in_bits_scores_0 = pes_18_pe_io_sample_out_bits_scores_0; // @[TreePE.scala 126:22]
  assign pes_19_pe_io_sample_in_bits_scores_1 = pes_18_pe_io_sample_out_bits_scores_1; // @[TreePE.scala 126:22]
  assign pes_19_pe_io_sample_in_bits_scores_2 = pes_18_pe_io_sample_out_bits_scores_2; // @[TreePE.scala 126:22]
  assign pes_19_pe_io_sample_in_bits_scores_3 = pes_18_pe_io_sample_out_bits_scores_3; // @[TreePE.scala 126:22]
  assign pes_19_pe_io_sample_in_bits_weights_0 = pes_18_pe_io_sample_out_bits_weights_0; // @[TreePE.scala 126:22]
  assign pes_19_pe_io_sample_in_bits_weights_1 = pes_18_pe_io_sample_out_bits_weights_1; // @[TreePE.scala 126:22]
  assign pes_19_pe_io_sample_in_bits_weights_2 = pes_18_pe_io_sample_out_bits_weights_2; // @[TreePE.scala 126:22]
  assign pes_19_pe_io_sample_in_bits_weights_3 = pes_18_pe_io_sample_out_bits_weights_3; // @[TreePE.scala 126:22]
  assign pes_19_pe_io_sample_in_bits_weights_4 = pes_18_pe_io_sample_out_bits_weights_4; // @[TreePE.scala 126:22]
  assign pes_19_pe_io_sample_in_bits_last = pes_18_pe_io_sample_out_bits_last; // @[TreePE.scala 126:22]
  assign pes_19_pe_io_mem_dataOut_1 = brams_19_io_b_dout; // @[TreePEsWrapper.scala 71:44]
  assign pes_19_pe_io_sample_out_ready = pes_20_pe_io_sample_in_ready; // @[TreePE.scala 126:22]
  assign pes_20_clock = clock;
  assign pes_20_reset = reset;
  assign pes_20_pe_io_sample_in_valid = pes_19_pe_io_sample_out_valid; // @[TreePE.scala 126:22]
  assign pes_20_pe_io_sample_in_bits_features_0 = pes_19_pe_io_sample_out_bits_features_0; // @[TreePE.scala 126:22]
  assign pes_20_pe_io_sample_in_bits_features_1 = pes_19_pe_io_sample_out_bits_features_1; // @[TreePE.scala 126:22]
  assign pes_20_pe_io_sample_in_bits_features_2 = pes_19_pe_io_sample_out_bits_features_2; // @[TreePE.scala 126:22]
  assign pes_20_pe_io_sample_in_bits_features_3 = pes_19_pe_io_sample_out_bits_features_3; // @[TreePE.scala 126:22]
  assign pes_20_pe_io_sample_in_bits_features_4 = pes_19_pe_io_sample_out_bits_features_4; // @[TreePE.scala 126:22]
  assign pes_20_pe_io_sample_in_bits_offset = pes_19_pe_io_sample_out_bits_offset; // @[TreePE.scala 126:22]
  assign pes_20_pe_io_sample_in_bits_search_for_root = pes_19_pe_io_sample_out_bits_search_for_root; // @[TreePE.scala 126:22]
  assign pes_20_pe_io_sample_in_bits_tree_to_exec = pes_19_pe_io_sample_out_bits_tree_to_exec; // @[TreePE.scala 126:22]
  assign pes_20_pe_io_sample_in_bits_scores_0 = pes_19_pe_io_sample_out_bits_scores_0; // @[TreePE.scala 126:22]
  assign pes_20_pe_io_sample_in_bits_scores_1 = pes_19_pe_io_sample_out_bits_scores_1; // @[TreePE.scala 126:22]
  assign pes_20_pe_io_sample_in_bits_scores_2 = pes_19_pe_io_sample_out_bits_scores_2; // @[TreePE.scala 126:22]
  assign pes_20_pe_io_sample_in_bits_scores_3 = pes_19_pe_io_sample_out_bits_scores_3; // @[TreePE.scala 126:22]
  assign pes_20_pe_io_sample_in_bits_weights_0 = pes_19_pe_io_sample_out_bits_weights_0; // @[TreePE.scala 126:22]
  assign pes_20_pe_io_sample_in_bits_weights_1 = pes_19_pe_io_sample_out_bits_weights_1; // @[TreePE.scala 126:22]
  assign pes_20_pe_io_sample_in_bits_weights_2 = pes_19_pe_io_sample_out_bits_weights_2; // @[TreePE.scala 126:22]
  assign pes_20_pe_io_sample_in_bits_weights_3 = pes_19_pe_io_sample_out_bits_weights_3; // @[TreePE.scala 126:22]
  assign pes_20_pe_io_sample_in_bits_weights_4 = pes_19_pe_io_sample_out_bits_weights_4; // @[TreePE.scala 126:22]
  assign pes_20_pe_io_sample_in_bits_last = pes_19_pe_io_sample_out_bits_last; // @[TreePE.scala 126:22]
  assign pes_20_pe_io_mem_dataOut_1 = brams_20_io_b_dout; // @[TreePEsWrapper.scala 71:44]
  assign pes_20_pe_io_sample_out_ready = pes_21_pe_io_sample_in_ready; // @[TreePE.scala 126:22]
  assign pes_21_clock = clock;
  assign pes_21_reset = reset;
  assign pes_21_pe_io_sample_in_valid = pes_20_pe_io_sample_out_valid; // @[TreePE.scala 126:22]
  assign pes_21_pe_io_sample_in_bits_features_0 = pes_20_pe_io_sample_out_bits_features_0; // @[TreePE.scala 126:22]
  assign pes_21_pe_io_sample_in_bits_features_1 = pes_20_pe_io_sample_out_bits_features_1; // @[TreePE.scala 126:22]
  assign pes_21_pe_io_sample_in_bits_features_2 = pes_20_pe_io_sample_out_bits_features_2; // @[TreePE.scala 126:22]
  assign pes_21_pe_io_sample_in_bits_features_3 = pes_20_pe_io_sample_out_bits_features_3; // @[TreePE.scala 126:22]
  assign pes_21_pe_io_sample_in_bits_features_4 = pes_20_pe_io_sample_out_bits_features_4; // @[TreePE.scala 126:22]
  assign pes_21_pe_io_sample_in_bits_offset = pes_20_pe_io_sample_out_bits_offset; // @[TreePE.scala 126:22]
  assign pes_21_pe_io_sample_in_bits_search_for_root = pes_20_pe_io_sample_out_bits_search_for_root; // @[TreePE.scala 126:22]
  assign pes_21_pe_io_sample_in_bits_tree_to_exec = pes_20_pe_io_sample_out_bits_tree_to_exec; // @[TreePE.scala 126:22]
  assign pes_21_pe_io_sample_in_bits_scores_0 = pes_20_pe_io_sample_out_bits_scores_0; // @[TreePE.scala 126:22]
  assign pes_21_pe_io_sample_in_bits_scores_1 = pes_20_pe_io_sample_out_bits_scores_1; // @[TreePE.scala 126:22]
  assign pes_21_pe_io_sample_in_bits_scores_2 = pes_20_pe_io_sample_out_bits_scores_2; // @[TreePE.scala 126:22]
  assign pes_21_pe_io_sample_in_bits_scores_3 = pes_20_pe_io_sample_out_bits_scores_3; // @[TreePE.scala 126:22]
  assign pes_21_pe_io_sample_in_bits_weights_0 = pes_20_pe_io_sample_out_bits_weights_0; // @[TreePE.scala 126:22]
  assign pes_21_pe_io_sample_in_bits_weights_1 = pes_20_pe_io_sample_out_bits_weights_1; // @[TreePE.scala 126:22]
  assign pes_21_pe_io_sample_in_bits_weights_2 = pes_20_pe_io_sample_out_bits_weights_2; // @[TreePE.scala 126:22]
  assign pes_21_pe_io_sample_in_bits_weights_3 = pes_20_pe_io_sample_out_bits_weights_3; // @[TreePE.scala 126:22]
  assign pes_21_pe_io_sample_in_bits_weights_4 = pes_20_pe_io_sample_out_bits_weights_4; // @[TreePE.scala 126:22]
  assign pes_21_pe_io_sample_in_bits_last = pes_20_pe_io_sample_out_bits_last; // @[TreePE.scala 126:22]
  assign pes_21_pe_io_mem_dataOut_1 = brams_21_io_b_dout; // @[TreePEsWrapper.scala 71:44]
  assign pes_21_pe_io_sample_out_ready = pes_22_pe_io_sample_in_ready; // @[TreePE.scala 126:22]
  assign pes_22_clock = clock;
  assign pes_22_reset = reset;
  assign pes_22_pe_io_sample_in_valid = pes_21_pe_io_sample_out_valid; // @[TreePE.scala 126:22]
  assign pes_22_pe_io_sample_in_bits_features_0 = pes_21_pe_io_sample_out_bits_features_0; // @[TreePE.scala 126:22]
  assign pes_22_pe_io_sample_in_bits_features_1 = pes_21_pe_io_sample_out_bits_features_1; // @[TreePE.scala 126:22]
  assign pes_22_pe_io_sample_in_bits_features_2 = pes_21_pe_io_sample_out_bits_features_2; // @[TreePE.scala 126:22]
  assign pes_22_pe_io_sample_in_bits_features_3 = pes_21_pe_io_sample_out_bits_features_3; // @[TreePE.scala 126:22]
  assign pes_22_pe_io_sample_in_bits_features_4 = pes_21_pe_io_sample_out_bits_features_4; // @[TreePE.scala 126:22]
  assign pes_22_pe_io_sample_in_bits_offset = pes_21_pe_io_sample_out_bits_offset; // @[TreePE.scala 126:22]
  assign pes_22_pe_io_sample_in_bits_search_for_root = pes_21_pe_io_sample_out_bits_search_for_root; // @[TreePE.scala 126:22]
  assign pes_22_pe_io_sample_in_bits_tree_to_exec = pes_21_pe_io_sample_out_bits_tree_to_exec; // @[TreePE.scala 126:22]
  assign pes_22_pe_io_sample_in_bits_scores_0 = pes_21_pe_io_sample_out_bits_scores_0; // @[TreePE.scala 126:22]
  assign pes_22_pe_io_sample_in_bits_scores_1 = pes_21_pe_io_sample_out_bits_scores_1; // @[TreePE.scala 126:22]
  assign pes_22_pe_io_sample_in_bits_scores_2 = pes_21_pe_io_sample_out_bits_scores_2; // @[TreePE.scala 126:22]
  assign pes_22_pe_io_sample_in_bits_scores_3 = pes_21_pe_io_sample_out_bits_scores_3; // @[TreePE.scala 126:22]
  assign pes_22_pe_io_sample_in_bits_weights_0 = pes_21_pe_io_sample_out_bits_weights_0; // @[TreePE.scala 126:22]
  assign pes_22_pe_io_sample_in_bits_weights_1 = pes_21_pe_io_sample_out_bits_weights_1; // @[TreePE.scala 126:22]
  assign pes_22_pe_io_sample_in_bits_weights_2 = pes_21_pe_io_sample_out_bits_weights_2; // @[TreePE.scala 126:22]
  assign pes_22_pe_io_sample_in_bits_weights_3 = pes_21_pe_io_sample_out_bits_weights_3; // @[TreePE.scala 126:22]
  assign pes_22_pe_io_sample_in_bits_weights_4 = pes_21_pe_io_sample_out_bits_weights_4; // @[TreePE.scala 126:22]
  assign pes_22_pe_io_sample_in_bits_last = pes_21_pe_io_sample_out_bits_last; // @[TreePE.scala 126:22]
  assign pes_22_pe_io_mem_dataOut_1 = brams_22_io_b_dout; // @[TreePEsWrapper.scala 71:44]
  assign pes_22_pe_io_sample_out_ready = pes_23_pe_io_sample_in_ready; // @[TreePE.scala 126:22]
  assign pes_23_clock = clock;
  assign pes_23_reset = reset;
  assign pes_23_pe_io_sample_in_valid = pes_22_pe_io_sample_out_valid; // @[TreePE.scala 126:22]
  assign pes_23_pe_io_sample_in_bits_features_0 = pes_22_pe_io_sample_out_bits_features_0; // @[TreePE.scala 126:22]
  assign pes_23_pe_io_sample_in_bits_features_1 = pes_22_pe_io_sample_out_bits_features_1; // @[TreePE.scala 126:22]
  assign pes_23_pe_io_sample_in_bits_features_2 = pes_22_pe_io_sample_out_bits_features_2; // @[TreePE.scala 126:22]
  assign pes_23_pe_io_sample_in_bits_features_3 = pes_22_pe_io_sample_out_bits_features_3; // @[TreePE.scala 126:22]
  assign pes_23_pe_io_sample_in_bits_features_4 = pes_22_pe_io_sample_out_bits_features_4; // @[TreePE.scala 126:22]
  assign pes_23_pe_io_sample_in_bits_offset = pes_22_pe_io_sample_out_bits_offset; // @[TreePE.scala 126:22]
  assign pes_23_pe_io_sample_in_bits_search_for_root = pes_22_pe_io_sample_out_bits_search_for_root; // @[TreePE.scala 126:22]
  assign pes_23_pe_io_sample_in_bits_tree_to_exec = pes_22_pe_io_sample_out_bits_tree_to_exec; // @[TreePE.scala 126:22]
  assign pes_23_pe_io_sample_in_bits_scores_0 = pes_22_pe_io_sample_out_bits_scores_0; // @[TreePE.scala 126:22]
  assign pes_23_pe_io_sample_in_bits_scores_1 = pes_22_pe_io_sample_out_bits_scores_1; // @[TreePE.scala 126:22]
  assign pes_23_pe_io_sample_in_bits_scores_2 = pes_22_pe_io_sample_out_bits_scores_2; // @[TreePE.scala 126:22]
  assign pes_23_pe_io_sample_in_bits_scores_3 = pes_22_pe_io_sample_out_bits_scores_3; // @[TreePE.scala 126:22]
  assign pes_23_pe_io_sample_in_bits_weights_0 = pes_22_pe_io_sample_out_bits_weights_0; // @[TreePE.scala 126:22]
  assign pes_23_pe_io_sample_in_bits_weights_1 = pes_22_pe_io_sample_out_bits_weights_1; // @[TreePE.scala 126:22]
  assign pes_23_pe_io_sample_in_bits_weights_2 = pes_22_pe_io_sample_out_bits_weights_2; // @[TreePE.scala 126:22]
  assign pes_23_pe_io_sample_in_bits_weights_3 = pes_22_pe_io_sample_out_bits_weights_3; // @[TreePE.scala 126:22]
  assign pes_23_pe_io_sample_in_bits_weights_4 = pes_22_pe_io_sample_out_bits_weights_4; // @[TreePE.scala 126:22]
  assign pes_23_pe_io_sample_in_bits_last = pes_22_pe_io_sample_out_bits_last; // @[TreePE.scala 126:22]
  assign pes_23_pe_io_mem_dataOut_1 = brams_23_io_b_dout; // @[TreePEsWrapper.scala 71:44]
  assign pes_23_pe_io_sample_out_ready = pes_24_pe_io_sample_in_ready; // @[TreePE.scala 126:22]
  assign pes_24_clock = clock;
  assign pes_24_reset = reset;
  assign pes_24_pe_io_sample_in_valid = pes_23_pe_io_sample_out_valid; // @[TreePE.scala 126:22]
  assign pes_24_pe_io_sample_in_bits_features_0 = pes_23_pe_io_sample_out_bits_features_0; // @[TreePE.scala 126:22]
  assign pes_24_pe_io_sample_in_bits_features_1 = pes_23_pe_io_sample_out_bits_features_1; // @[TreePE.scala 126:22]
  assign pes_24_pe_io_sample_in_bits_features_2 = pes_23_pe_io_sample_out_bits_features_2; // @[TreePE.scala 126:22]
  assign pes_24_pe_io_sample_in_bits_features_3 = pes_23_pe_io_sample_out_bits_features_3; // @[TreePE.scala 126:22]
  assign pes_24_pe_io_sample_in_bits_features_4 = pes_23_pe_io_sample_out_bits_features_4; // @[TreePE.scala 126:22]
  assign pes_24_pe_io_sample_in_bits_offset = pes_23_pe_io_sample_out_bits_offset; // @[TreePE.scala 126:22]
  assign pes_24_pe_io_sample_in_bits_search_for_root = pes_23_pe_io_sample_out_bits_search_for_root; // @[TreePE.scala 126:22]
  assign pes_24_pe_io_sample_in_bits_tree_to_exec = pes_23_pe_io_sample_out_bits_tree_to_exec; // @[TreePE.scala 126:22]
  assign pes_24_pe_io_sample_in_bits_scores_0 = pes_23_pe_io_sample_out_bits_scores_0; // @[TreePE.scala 126:22]
  assign pes_24_pe_io_sample_in_bits_scores_1 = pes_23_pe_io_sample_out_bits_scores_1; // @[TreePE.scala 126:22]
  assign pes_24_pe_io_sample_in_bits_scores_2 = pes_23_pe_io_sample_out_bits_scores_2; // @[TreePE.scala 126:22]
  assign pes_24_pe_io_sample_in_bits_scores_3 = pes_23_pe_io_sample_out_bits_scores_3; // @[TreePE.scala 126:22]
  assign pes_24_pe_io_sample_in_bits_weights_0 = pes_23_pe_io_sample_out_bits_weights_0; // @[TreePE.scala 126:22]
  assign pes_24_pe_io_sample_in_bits_weights_1 = pes_23_pe_io_sample_out_bits_weights_1; // @[TreePE.scala 126:22]
  assign pes_24_pe_io_sample_in_bits_weights_2 = pes_23_pe_io_sample_out_bits_weights_2; // @[TreePE.scala 126:22]
  assign pes_24_pe_io_sample_in_bits_weights_3 = pes_23_pe_io_sample_out_bits_weights_3; // @[TreePE.scala 126:22]
  assign pes_24_pe_io_sample_in_bits_weights_4 = pes_23_pe_io_sample_out_bits_weights_4; // @[TreePE.scala 126:22]
  assign pes_24_pe_io_sample_in_bits_last = pes_23_pe_io_sample_out_bits_last; // @[TreePE.scala 126:22]
  assign pes_24_pe_io_mem_dataOut_1 = brams_24_io_b_dout; // @[TreePEsWrapper.scala 71:44]
  assign pes_24_pe_io_sample_out_ready = pes_25_pe_io_sample_in_ready; // @[TreePE.scala 126:22]
  assign pes_25_clock = clock;
  assign pes_25_reset = reset;
  assign pes_25_pe_io_sample_in_valid = pes_24_pe_io_sample_out_valid; // @[TreePE.scala 126:22]
  assign pes_25_pe_io_sample_in_bits_features_0 = pes_24_pe_io_sample_out_bits_features_0; // @[TreePE.scala 126:22]
  assign pes_25_pe_io_sample_in_bits_features_1 = pes_24_pe_io_sample_out_bits_features_1; // @[TreePE.scala 126:22]
  assign pes_25_pe_io_sample_in_bits_features_2 = pes_24_pe_io_sample_out_bits_features_2; // @[TreePE.scala 126:22]
  assign pes_25_pe_io_sample_in_bits_features_3 = pes_24_pe_io_sample_out_bits_features_3; // @[TreePE.scala 126:22]
  assign pes_25_pe_io_sample_in_bits_features_4 = pes_24_pe_io_sample_out_bits_features_4; // @[TreePE.scala 126:22]
  assign pes_25_pe_io_sample_in_bits_offset = pes_24_pe_io_sample_out_bits_offset; // @[TreePE.scala 126:22]
  assign pes_25_pe_io_sample_in_bits_search_for_root = pes_24_pe_io_sample_out_bits_search_for_root; // @[TreePE.scala 126:22]
  assign pes_25_pe_io_sample_in_bits_tree_to_exec = pes_24_pe_io_sample_out_bits_tree_to_exec; // @[TreePE.scala 126:22]
  assign pes_25_pe_io_sample_in_bits_scores_0 = pes_24_pe_io_sample_out_bits_scores_0; // @[TreePE.scala 126:22]
  assign pes_25_pe_io_sample_in_bits_scores_1 = pes_24_pe_io_sample_out_bits_scores_1; // @[TreePE.scala 126:22]
  assign pes_25_pe_io_sample_in_bits_scores_2 = pes_24_pe_io_sample_out_bits_scores_2; // @[TreePE.scala 126:22]
  assign pes_25_pe_io_sample_in_bits_scores_3 = pes_24_pe_io_sample_out_bits_scores_3; // @[TreePE.scala 126:22]
  assign pes_25_pe_io_sample_in_bits_weights_0 = pes_24_pe_io_sample_out_bits_weights_0; // @[TreePE.scala 126:22]
  assign pes_25_pe_io_sample_in_bits_weights_1 = pes_24_pe_io_sample_out_bits_weights_1; // @[TreePE.scala 126:22]
  assign pes_25_pe_io_sample_in_bits_weights_2 = pes_24_pe_io_sample_out_bits_weights_2; // @[TreePE.scala 126:22]
  assign pes_25_pe_io_sample_in_bits_weights_3 = pes_24_pe_io_sample_out_bits_weights_3; // @[TreePE.scala 126:22]
  assign pes_25_pe_io_sample_in_bits_weights_4 = pes_24_pe_io_sample_out_bits_weights_4; // @[TreePE.scala 126:22]
  assign pes_25_pe_io_sample_in_bits_last = pes_24_pe_io_sample_out_bits_last; // @[TreePE.scala 126:22]
  assign pes_25_pe_io_mem_dataOut_1 = brams_25_io_b_dout; // @[TreePEsWrapper.scala 71:44]
  assign pes_25_pe_io_sample_out_ready = pes_26_pe_io_sample_in_ready; // @[TreePE.scala 126:22]
  assign pes_26_clock = clock;
  assign pes_26_reset = reset;
  assign pes_26_pe_io_sample_in_valid = pes_25_pe_io_sample_out_valid; // @[TreePE.scala 126:22]
  assign pes_26_pe_io_sample_in_bits_features_0 = pes_25_pe_io_sample_out_bits_features_0; // @[TreePE.scala 126:22]
  assign pes_26_pe_io_sample_in_bits_features_1 = pes_25_pe_io_sample_out_bits_features_1; // @[TreePE.scala 126:22]
  assign pes_26_pe_io_sample_in_bits_features_2 = pes_25_pe_io_sample_out_bits_features_2; // @[TreePE.scala 126:22]
  assign pes_26_pe_io_sample_in_bits_features_3 = pes_25_pe_io_sample_out_bits_features_3; // @[TreePE.scala 126:22]
  assign pes_26_pe_io_sample_in_bits_features_4 = pes_25_pe_io_sample_out_bits_features_4; // @[TreePE.scala 126:22]
  assign pes_26_pe_io_sample_in_bits_offset = pes_25_pe_io_sample_out_bits_offset; // @[TreePE.scala 126:22]
  assign pes_26_pe_io_sample_in_bits_search_for_root = pes_25_pe_io_sample_out_bits_search_for_root; // @[TreePE.scala 126:22]
  assign pes_26_pe_io_sample_in_bits_tree_to_exec = pes_25_pe_io_sample_out_bits_tree_to_exec; // @[TreePE.scala 126:22]
  assign pes_26_pe_io_sample_in_bits_scores_0 = pes_25_pe_io_sample_out_bits_scores_0; // @[TreePE.scala 126:22]
  assign pes_26_pe_io_sample_in_bits_scores_1 = pes_25_pe_io_sample_out_bits_scores_1; // @[TreePE.scala 126:22]
  assign pes_26_pe_io_sample_in_bits_scores_2 = pes_25_pe_io_sample_out_bits_scores_2; // @[TreePE.scala 126:22]
  assign pes_26_pe_io_sample_in_bits_scores_3 = pes_25_pe_io_sample_out_bits_scores_3; // @[TreePE.scala 126:22]
  assign pes_26_pe_io_sample_in_bits_weights_0 = pes_25_pe_io_sample_out_bits_weights_0; // @[TreePE.scala 126:22]
  assign pes_26_pe_io_sample_in_bits_weights_1 = pes_25_pe_io_sample_out_bits_weights_1; // @[TreePE.scala 126:22]
  assign pes_26_pe_io_sample_in_bits_weights_2 = pes_25_pe_io_sample_out_bits_weights_2; // @[TreePE.scala 126:22]
  assign pes_26_pe_io_sample_in_bits_weights_3 = pes_25_pe_io_sample_out_bits_weights_3; // @[TreePE.scala 126:22]
  assign pes_26_pe_io_sample_in_bits_weights_4 = pes_25_pe_io_sample_out_bits_weights_4; // @[TreePE.scala 126:22]
  assign pes_26_pe_io_sample_in_bits_last = pes_25_pe_io_sample_out_bits_last; // @[TreePE.scala 126:22]
  assign pes_26_pe_io_mem_dataOut_1 = brams_26_io_b_dout; // @[TreePEsWrapper.scala 71:44]
  assign pes_26_pe_io_sample_out_ready = pes_27_pe_io_sample_in_ready; // @[TreePE.scala 126:22]
  assign pes_27_clock = clock;
  assign pes_27_reset = reset;
  assign pes_27_pe_io_sample_in_valid = pes_26_pe_io_sample_out_valid; // @[TreePE.scala 126:22]
  assign pes_27_pe_io_sample_in_bits_features_0 = pes_26_pe_io_sample_out_bits_features_0; // @[TreePE.scala 126:22]
  assign pes_27_pe_io_sample_in_bits_features_1 = pes_26_pe_io_sample_out_bits_features_1; // @[TreePE.scala 126:22]
  assign pes_27_pe_io_sample_in_bits_features_2 = pes_26_pe_io_sample_out_bits_features_2; // @[TreePE.scala 126:22]
  assign pes_27_pe_io_sample_in_bits_features_3 = pes_26_pe_io_sample_out_bits_features_3; // @[TreePE.scala 126:22]
  assign pes_27_pe_io_sample_in_bits_features_4 = pes_26_pe_io_sample_out_bits_features_4; // @[TreePE.scala 126:22]
  assign pes_27_pe_io_sample_in_bits_offset = pes_26_pe_io_sample_out_bits_offset; // @[TreePE.scala 126:22]
  assign pes_27_pe_io_sample_in_bits_search_for_root = pes_26_pe_io_sample_out_bits_search_for_root; // @[TreePE.scala 126:22]
  assign pes_27_pe_io_sample_in_bits_tree_to_exec = pes_26_pe_io_sample_out_bits_tree_to_exec; // @[TreePE.scala 126:22]
  assign pes_27_pe_io_sample_in_bits_scores_0 = pes_26_pe_io_sample_out_bits_scores_0; // @[TreePE.scala 126:22]
  assign pes_27_pe_io_sample_in_bits_scores_1 = pes_26_pe_io_sample_out_bits_scores_1; // @[TreePE.scala 126:22]
  assign pes_27_pe_io_sample_in_bits_scores_2 = pes_26_pe_io_sample_out_bits_scores_2; // @[TreePE.scala 126:22]
  assign pes_27_pe_io_sample_in_bits_scores_3 = pes_26_pe_io_sample_out_bits_scores_3; // @[TreePE.scala 126:22]
  assign pes_27_pe_io_sample_in_bits_weights_0 = pes_26_pe_io_sample_out_bits_weights_0; // @[TreePE.scala 126:22]
  assign pes_27_pe_io_sample_in_bits_weights_1 = pes_26_pe_io_sample_out_bits_weights_1; // @[TreePE.scala 126:22]
  assign pes_27_pe_io_sample_in_bits_weights_2 = pes_26_pe_io_sample_out_bits_weights_2; // @[TreePE.scala 126:22]
  assign pes_27_pe_io_sample_in_bits_weights_3 = pes_26_pe_io_sample_out_bits_weights_3; // @[TreePE.scala 126:22]
  assign pes_27_pe_io_sample_in_bits_weights_4 = pes_26_pe_io_sample_out_bits_weights_4; // @[TreePE.scala 126:22]
  assign pes_27_pe_io_sample_in_bits_last = pes_26_pe_io_sample_out_bits_last; // @[TreePE.scala 126:22]
  assign pes_27_pe_io_mem_dataOut_1 = brams_27_io_b_dout; // @[TreePEsWrapper.scala 71:44]
  assign pes_27_pe_io_sample_out_ready = pes_28_pe_io_sample_in_ready; // @[TreePE.scala 126:22]
  assign pes_28_clock = clock;
  assign pes_28_reset = reset;
  assign pes_28_pe_io_sample_in_valid = pes_27_pe_io_sample_out_valid; // @[TreePE.scala 126:22]
  assign pes_28_pe_io_sample_in_bits_features_0 = pes_27_pe_io_sample_out_bits_features_0; // @[TreePE.scala 126:22]
  assign pes_28_pe_io_sample_in_bits_features_1 = pes_27_pe_io_sample_out_bits_features_1; // @[TreePE.scala 126:22]
  assign pes_28_pe_io_sample_in_bits_features_2 = pes_27_pe_io_sample_out_bits_features_2; // @[TreePE.scala 126:22]
  assign pes_28_pe_io_sample_in_bits_features_3 = pes_27_pe_io_sample_out_bits_features_3; // @[TreePE.scala 126:22]
  assign pes_28_pe_io_sample_in_bits_features_4 = pes_27_pe_io_sample_out_bits_features_4; // @[TreePE.scala 126:22]
  assign pes_28_pe_io_sample_in_bits_offset = pes_27_pe_io_sample_out_bits_offset; // @[TreePE.scala 126:22]
  assign pes_28_pe_io_sample_in_bits_search_for_root = pes_27_pe_io_sample_out_bits_search_for_root; // @[TreePE.scala 126:22]
  assign pes_28_pe_io_sample_in_bits_tree_to_exec = pes_27_pe_io_sample_out_bits_tree_to_exec; // @[TreePE.scala 126:22]
  assign pes_28_pe_io_sample_in_bits_scores_0 = pes_27_pe_io_sample_out_bits_scores_0; // @[TreePE.scala 126:22]
  assign pes_28_pe_io_sample_in_bits_scores_1 = pes_27_pe_io_sample_out_bits_scores_1; // @[TreePE.scala 126:22]
  assign pes_28_pe_io_sample_in_bits_scores_2 = pes_27_pe_io_sample_out_bits_scores_2; // @[TreePE.scala 126:22]
  assign pes_28_pe_io_sample_in_bits_scores_3 = pes_27_pe_io_sample_out_bits_scores_3; // @[TreePE.scala 126:22]
  assign pes_28_pe_io_sample_in_bits_weights_0 = pes_27_pe_io_sample_out_bits_weights_0; // @[TreePE.scala 126:22]
  assign pes_28_pe_io_sample_in_bits_weights_1 = pes_27_pe_io_sample_out_bits_weights_1; // @[TreePE.scala 126:22]
  assign pes_28_pe_io_sample_in_bits_weights_2 = pes_27_pe_io_sample_out_bits_weights_2; // @[TreePE.scala 126:22]
  assign pes_28_pe_io_sample_in_bits_weights_3 = pes_27_pe_io_sample_out_bits_weights_3; // @[TreePE.scala 126:22]
  assign pes_28_pe_io_sample_in_bits_weights_4 = pes_27_pe_io_sample_out_bits_weights_4; // @[TreePE.scala 126:22]
  assign pes_28_pe_io_sample_in_bits_last = pes_27_pe_io_sample_out_bits_last; // @[TreePE.scala 126:22]
  assign pes_28_pe_io_mem_dataOut_1 = brams_28_io_b_dout; // @[TreePEsWrapper.scala 71:44]
  assign pes_28_pe_io_sample_out_ready = pes_29_pe_io_sample_in_ready; // @[TreePE.scala 126:22]
  assign pes_29_clock = clock;
  assign pes_29_reset = reset;
  assign pes_29_pe_io_sample_in_valid = pes_28_pe_io_sample_out_valid; // @[TreePE.scala 126:22]
  assign pes_29_pe_io_sample_in_bits_features_0 = pes_28_pe_io_sample_out_bits_features_0; // @[TreePE.scala 126:22]
  assign pes_29_pe_io_sample_in_bits_features_1 = pes_28_pe_io_sample_out_bits_features_1; // @[TreePE.scala 126:22]
  assign pes_29_pe_io_sample_in_bits_features_2 = pes_28_pe_io_sample_out_bits_features_2; // @[TreePE.scala 126:22]
  assign pes_29_pe_io_sample_in_bits_features_3 = pes_28_pe_io_sample_out_bits_features_3; // @[TreePE.scala 126:22]
  assign pes_29_pe_io_sample_in_bits_features_4 = pes_28_pe_io_sample_out_bits_features_4; // @[TreePE.scala 126:22]
  assign pes_29_pe_io_sample_in_bits_offset = pes_28_pe_io_sample_out_bits_offset; // @[TreePE.scala 126:22]
  assign pes_29_pe_io_sample_in_bits_search_for_root = pes_28_pe_io_sample_out_bits_search_for_root; // @[TreePE.scala 126:22]
  assign pes_29_pe_io_sample_in_bits_tree_to_exec = pes_28_pe_io_sample_out_bits_tree_to_exec; // @[TreePE.scala 126:22]
  assign pes_29_pe_io_sample_in_bits_scores_0 = pes_28_pe_io_sample_out_bits_scores_0; // @[TreePE.scala 126:22]
  assign pes_29_pe_io_sample_in_bits_scores_1 = pes_28_pe_io_sample_out_bits_scores_1; // @[TreePE.scala 126:22]
  assign pes_29_pe_io_sample_in_bits_scores_2 = pes_28_pe_io_sample_out_bits_scores_2; // @[TreePE.scala 126:22]
  assign pes_29_pe_io_sample_in_bits_scores_3 = pes_28_pe_io_sample_out_bits_scores_3; // @[TreePE.scala 126:22]
  assign pes_29_pe_io_sample_in_bits_weights_0 = pes_28_pe_io_sample_out_bits_weights_0; // @[TreePE.scala 126:22]
  assign pes_29_pe_io_sample_in_bits_weights_1 = pes_28_pe_io_sample_out_bits_weights_1; // @[TreePE.scala 126:22]
  assign pes_29_pe_io_sample_in_bits_weights_2 = pes_28_pe_io_sample_out_bits_weights_2; // @[TreePE.scala 126:22]
  assign pes_29_pe_io_sample_in_bits_weights_3 = pes_28_pe_io_sample_out_bits_weights_3; // @[TreePE.scala 126:22]
  assign pes_29_pe_io_sample_in_bits_weights_4 = pes_28_pe_io_sample_out_bits_weights_4; // @[TreePE.scala 126:22]
  assign pes_29_pe_io_sample_in_bits_last = pes_28_pe_io_sample_out_bits_last; // @[TreePE.scala 126:22]
  assign pes_29_pe_io_mem_dataOut_1 = brams_29_io_b_dout; // @[TreePEsWrapper.scala 71:44]
  assign pes_29_pe_io_sample_out_ready = last_interconnect_io_sample_in_ready; // @[TreePE.scala 122:22]
  assign brams_0_io_clk = brams_io_0_bram_clk_a; // @[TreePEsWrapper.scala 79:33]
  assign brams_0_io_a_en = brams_io_0_bram_en_a; // @[TreePEsWrapper.scala 73:34]
  assign brams_0_io_a_wr = brams_io_0_bram_we_a[0]; // @[TreePEsWrapper.scala 74:64]
  assign brams_0_io_a_addr = brams_io_0_bram_addr_a; // @[TreePEsWrapper.scala 75:36]
  assign brams_0_io_a_din = brams_io_0_bram_wrdata_a; // @[TreePEsWrapper.scala 76:35]
  assign brams_0_io_b_addr = pes_0_pe_io_mem_addr_1[10:0]; // @[TreePEsWrapper.scala 69:36]
  assign brams_1_io_clk = brams_io_1_bram_clk_a; // @[TreePEsWrapper.scala 79:33]
  assign brams_1_io_a_en = brams_io_1_bram_en_a; // @[TreePEsWrapper.scala 73:34]
  assign brams_1_io_a_wr = brams_io_1_bram_we_a[0]; // @[TreePEsWrapper.scala 74:64]
  assign brams_1_io_a_addr = brams_io_1_bram_addr_a; // @[TreePEsWrapper.scala 75:36]
  assign brams_1_io_a_din = brams_io_1_bram_wrdata_a; // @[TreePEsWrapper.scala 76:35]
  assign brams_1_io_b_addr = pes_1_pe_io_mem_addr_1[10:0]; // @[TreePEsWrapper.scala 69:36]
  assign brams_2_io_clk = brams_io_2_bram_clk_a; // @[TreePEsWrapper.scala 79:33]
  assign brams_2_io_a_en = brams_io_2_bram_en_a; // @[TreePEsWrapper.scala 73:34]
  assign brams_2_io_a_wr = brams_io_2_bram_we_a[0]; // @[TreePEsWrapper.scala 74:64]
  assign brams_2_io_a_addr = brams_io_2_bram_addr_a; // @[TreePEsWrapper.scala 75:36]
  assign brams_2_io_a_din = brams_io_2_bram_wrdata_a; // @[TreePEsWrapper.scala 76:35]
  assign brams_2_io_b_addr = pes_2_pe_io_mem_addr_1[10:0]; // @[TreePEsWrapper.scala 69:36]
  assign brams_3_io_clk = brams_io_3_bram_clk_a; // @[TreePEsWrapper.scala 79:33]
  assign brams_3_io_a_en = brams_io_3_bram_en_a; // @[TreePEsWrapper.scala 73:34]
  assign brams_3_io_a_wr = brams_io_3_bram_we_a[0]; // @[TreePEsWrapper.scala 74:64]
  assign brams_3_io_a_addr = brams_io_3_bram_addr_a; // @[TreePEsWrapper.scala 75:36]
  assign brams_3_io_a_din = brams_io_3_bram_wrdata_a; // @[TreePEsWrapper.scala 76:35]
  assign brams_3_io_b_addr = pes_3_pe_io_mem_addr_1[10:0]; // @[TreePEsWrapper.scala 69:36]
  assign brams_4_io_clk = brams_io_4_bram_clk_a; // @[TreePEsWrapper.scala 79:33]
  assign brams_4_io_a_en = brams_io_4_bram_en_a; // @[TreePEsWrapper.scala 73:34]
  assign brams_4_io_a_wr = brams_io_4_bram_we_a[0]; // @[TreePEsWrapper.scala 74:64]
  assign brams_4_io_a_addr = brams_io_4_bram_addr_a; // @[TreePEsWrapper.scala 75:36]
  assign brams_4_io_a_din = brams_io_4_bram_wrdata_a; // @[TreePEsWrapper.scala 76:35]
  assign brams_4_io_b_addr = pes_4_pe_io_mem_addr_1[10:0]; // @[TreePEsWrapper.scala 69:36]
  assign brams_5_io_clk = brams_io_5_bram_clk_a; // @[TreePEsWrapper.scala 79:33]
  assign brams_5_io_a_en = brams_io_5_bram_en_a; // @[TreePEsWrapper.scala 73:34]
  assign brams_5_io_a_wr = brams_io_5_bram_we_a[0]; // @[TreePEsWrapper.scala 74:64]
  assign brams_5_io_a_addr = brams_io_5_bram_addr_a; // @[TreePEsWrapper.scala 75:36]
  assign brams_5_io_a_din = brams_io_5_bram_wrdata_a; // @[TreePEsWrapper.scala 76:35]
  assign brams_5_io_b_addr = pes_5_pe_io_mem_addr_1[10:0]; // @[TreePEsWrapper.scala 69:36]
  assign brams_6_io_clk = brams_io_6_bram_clk_a; // @[TreePEsWrapper.scala 79:33]
  assign brams_6_io_a_en = brams_io_6_bram_en_a; // @[TreePEsWrapper.scala 73:34]
  assign brams_6_io_a_wr = brams_io_6_bram_we_a[0]; // @[TreePEsWrapper.scala 74:64]
  assign brams_6_io_a_addr = brams_io_6_bram_addr_a; // @[TreePEsWrapper.scala 75:36]
  assign brams_6_io_a_din = brams_io_6_bram_wrdata_a; // @[TreePEsWrapper.scala 76:35]
  assign brams_6_io_b_addr = pes_6_pe_io_mem_addr_1[10:0]; // @[TreePEsWrapper.scala 69:36]
  assign brams_7_io_clk = brams_io_7_bram_clk_a; // @[TreePEsWrapper.scala 79:33]
  assign brams_7_io_a_en = brams_io_7_bram_en_a; // @[TreePEsWrapper.scala 73:34]
  assign brams_7_io_a_wr = brams_io_7_bram_we_a[0]; // @[TreePEsWrapper.scala 74:64]
  assign brams_7_io_a_addr = brams_io_7_bram_addr_a; // @[TreePEsWrapper.scala 75:36]
  assign brams_7_io_a_din = brams_io_7_bram_wrdata_a; // @[TreePEsWrapper.scala 76:35]
  assign brams_7_io_b_addr = pes_7_pe_io_mem_addr_1[10:0]; // @[TreePEsWrapper.scala 69:36]
  assign brams_8_io_clk = brams_io_8_bram_clk_a; // @[TreePEsWrapper.scala 79:33]
  assign brams_8_io_a_en = brams_io_8_bram_en_a; // @[TreePEsWrapper.scala 73:34]
  assign brams_8_io_a_wr = brams_io_8_bram_we_a[0]; // @[TreePEsWrapper.scala 74:64]
  assign brams_8_io_a_addr = brams_io_8_bram_addr_a; // @[TreePEsWrapper.scala 75:36]
  assign brams_8_io_a_din = brams_io_8_bram_wrdata_a; // @[TreePEsWrapper.scala 76:35]
  assign brams_8_io_b_addr = pes_8_pe_io_mem_addr_1[10:0]; // @[TreePEsWrapper.scala 69:36]
  assign brams_9_io_clk = brams_io_9_bram_clk_a; // @[TreePEsWrapper.scala 79:33]
  assign brams_9_io_a_en = brams_io_9_bram_en_a; // @[TreePEsWrapper.scala 73:34]
  assign brams_9_io_a_wr = brams_io_9_bram_we_a[0]; // @[TreePEsWrapper.scala 74:64]
  assign brams_9_io_a_addr = brams_io_9_bram_addr_a; // @[TreePEsWrapper.scala 75:36]
  assign brams_9_io_a_din = brams_io_9_bram_wrdata_a; // @[TreePEsWrapper.scala 76:35]
  assign brams_9_io_b_addr = pes_9_pe_io_mem_addr_1[10:0]; // @[TreePEsWrapper.scala 69:36]
  assign brams_10_io_clk = brams_io_10_bram_clk_a; // @[TreePEsWrapper.scala 79:33]
  assign brams_10_io_a_en = brams_io_10_bram_en_a; // @[TreePEsWrapper.scala 73:34]
  assign brams_10_io_a_wr = brams_io_10_bram_we_a[0]; // @[TreePEsWrapper.scala 74:64]
  assign brams_10_io_a_addr = brams_io_10_bram_addr_a; // @[TreePEsWrapper.scala 75:36]
  assign brams_10_io_a_din = brams_io_10_bram_wrdata_a; // @[TreePEsWrapper.scala 76:35]
  assign brams_10_io_b_addr = pes_10_pe_io_mem_addr_1[10:0]; // @[TreePEsWrapper.scala 69:36]
  assign brams_11_io_clk = brams_io_11_bram_clk_a; // @[TreePEsWrapper.scala 79:33]
  assign brams_11_io_a_en = brams_io_11_bram_en_a; // @[TreePEsWrapper.scala 73:34]
  assign brams_11_io_a_wr = brams_io_11_bram_we_a[0]; // @[TreePEsWrapper.scala 74:64]
  assign brams_11_io_a_addr = brams_io_11_bram_addr_a; // @[TreePEsWrapper.scala 75:36]
  assign brams_11_io_a_din = brams_io_11_bram_wrdata_a; // @[TreePEsWrapper.scala 76:35]
  assign brams_11_io_b_addr = pes_11_pe_io_mem_addr_1[10:0]; // @[TreePEsWrapper.scala 69:36]
  assign brams_12_io_clk = brams_io_12_bram_clk_a; // @[TreePEsWrapper.scala 79:33]
  assign brams_12_io_a_en = brams_io_12_bram_en_a; // @[TreePEsWrapper.scala 73:34]
  assign brams_12_io_a_wr = brams_io_12_bram_we_a[0]; // @[TreePEsWrapper.scala 74:64]
  assign brams_12_io_a_addr = brams_io_12_bram_addr_a; // @[TreePEsWrapper.scala 75:36]
  assign brams_12_io_a_din = brams_io_12_bram_wrdata_a; // @[TreePEsWrapper.scala 76:35]
  assign brams_12_io_b_addr = pes_12_pe_io_mem_addr_1[10:0]; // @[TreePEsWrapper.scala 69:36]
  assign brams_13_io_clk = brams_io_13_bram_clk_a; // @[TreePEsWrapper.scala 79:33]
  assign brams_13_io_a_en = brams_io_13_bram_en_a; // @[TreePEsWrapper.scala 73:34]
  assign brams_13_io_a_wr = brams_io_13_bram_we_a[0]; // @[TreePEsWrapper.scala 74:64]
  assign brams_13_io_a_addr = brams_io_13_bram_addr_a; // @[TreePEsWrapper.scala 75:36]
  assign brams_13_io_a_din = brams_io_13_bram_wrdata_a; // @[TreePEsWrapper.scala 76:35]
  assign brams_13_io_b_addr = pes_13_pe_io_mem_addr_1[10:0]; // @[TreePEsWrapper.scala 69:36]
  assign brams_14_io_clk = brams_io_14_bram_clk_a; // @[TreePEsWrapper.scala 79:33]
  assign brams_14_io_a_en = brams_io_14_bram_en_a; // @[TreePEsWrapper.scala 73:34]
  assign brams_14_io_a_wr = brams_io_14_bram_we_a[0]; // @[TreePEsWrapper.scala 74:64]
  assign brams_14_io_a_addr = brams_io_14_bram_addr_a; // @[TreePEsWrapper.scala 75:36]
  assign brams_14_io_a_din = brams_io_14_bram_wrdata_a; // @[TreePEsWrapper.scala 76:35]
  assign brams_14_io_b_addr = pes_14_pe_io_mem_addr_1[10:0]; // @[TreePEsWrapper.scala 69:36]
  assign brams_15_io_clk = brams_io_15_bram_clk_a; // @[TreePEsWrapper.scala 79:33]
  assign brams_15_io_a_en = brams_io_15_bram_en_a; // @[TreePEsWrapper.scala 73:34]
  assign brams_15_io_a_wr = brams_io_15_bram_we_a[0]; // @[TreePEsWrapper.scala 74:64]
  assign brams_15_io_a_addr = brams_io_15_bram_addr_a; // @[TreePEsWrapper.scala 75:36]
  assign brams_15_io_a_din = brams_io_15_bram_wrdata_a; // @[TreePEsWrapper.scala 76:35]
  assign brams_15_io_b_addr = pes_15_pe_io_mem_addr_1[10:0]; // @[TreePEsWrapper.scala 69:36]
  assign brams_16_io_clk = brams_io_16_bram_clk_a; // @[TreePEsWrapper.scala 79:33]
  assign brams_16_io_a_en = brams_io_16_bram_en_a; // @[TreePEsWrapper.scala 73:34]
  assign brams_16_io_a_wr = brams_io_16_bram_we_a[0]; // @[TreePEsWrapper.scala 74:64]
  assign brams_16_io_a_addr = brams_io_16_bram_addr_a; // @[TreePEsWrapper.scala 75:36]
  assign brams_16_io_a_din = brams_io_16_bram_wrdata_a; // @[TreePEsWrapper.scala 76:35]
  assign brams_16_io_b_addr = pes_16_pe_io_mem_addr_1[10:0]; // @[TreePEsWrapper.scala 69:36]
  assign brams_17_io_clk = brams_io_17_bram_clk_a; // @[TreePEsWrapper.scala 79:33]
  assign brams_17_io_a_en = brams_io_17_bram_en_a; // @[TreePEsWrapper.scala 73:34]
  assign brams_17_io_a_wr = brams_io_17_bram_we_a[0]; // @[TreePEsWrapper.scala 74:64]
  assign brams_17_io_a_addr = brams_io_17_bram_addr_a; // @[TreePEsWrapper.scala 75:36]
  assign brams_17_io_a_din = brams_io_17_bram_wrdata_a; // @[TreePEsWrapper.scala 76:35]
  assign brams_17_io_b_addr = pes_17_pe_io_mem_addr_1[10:0]; // @[TreePEsWrapper.scala 69:36]
  assign brams_18_io_clk = brams_io_18_bram_clk_a; // @[TreePEsWrapper.scala 79:33]
  assign brams_18_io_a_en = brams_io_18_bram_en_a; // @[TreePEsWrapper.scala 73:34]
  assign brams_18_io_a_wr = brams_io_18_bram_we_a[0]; // @[TreePEsWrapper.scala 74:64]
  assign brams_18_io_a_addr = brams_io_18_bram_addr_a; // @[TreePEsWrapper.scala 75:36]
  assign brams_18_io_a_din = brams_io_18_bram_wrdata_a; // @[TreePEsWrapper.scala 76:35]
  assign brams_18_io_b_addr = pes_18_pe_io_mem_addr_1[10:0]; // @[TreePEsWrapper.scala 69:36]
  assign brams_19_io_clk = brams_io_19_bram_clk_a; // @[TreePEsWrapper.scala 79:33]
  assign brams_19_io_a_en = brams_io_19_bram_en_a; // @[TreePEsWrapper.scala 73:34]
  assign brams_19_io_a_wr = brams_io_19_bram_we_a[0]; // @[TreePEsWrapper.scala 74:64]
  assign brams_19_io_a_addr = brams_io_19_bram_addr_a; // @[TreePEsWrapper.scala 75:36]
  assign brams_19_io_a_din = brams_io_19_bram_wrdata_a; // @[TreePEsWrapper.scala 76:35]
  assign brams_19_io_b_addr = pes_19_pe_io_mem_addr_1[10:0]; // @[TreePEsWrapper.scala 69:36]
  assign brams_20_io_clk = brams_io_20_bram_clk_a; // @[TreePEsWrapper.scala 79:33]
  assign brams_20_io_a_en = brams_io_20_bram_en_a; // @[TreePEsWrapper.scala 73:34]
  assign brams_20_io_a_wr = brams_io_20_bram_we_a[0]; // @[TreePEsWrapper.scala 74:64]
  assign brams_20_io_a_addr = brams_io_20_bram_addr_a; // @[TreePEsWrapper.scala 75:36]
  assign brams_20_io_a_din = brams_io_20_bram_wrdata_a; // @[TreePEsWrapper.scala 76:35]
  assign brams_20_io_b_addr = pes_20_pe_io_mem_addr_1[10:0]; // @[TreePEsWrapper.scala 69:36]
  assign brams_21_io_clk = brams_io_21_bram_clk_a; // @[TreePEsWrapper.scala 79:33]
  assign brams_21_io_a_en = brams_io_21_bram_en_a; // @[TreePEsWrapper.scala 73:34]
  assign brams_21_io_a_wr = brams_io_21_bram_we_a[0]; // @[TreePEsWrapper.scala 74:64]
  assign brams_21_io_a_addr = brams_io_21_bram_addr_a; // @[TreePEsWrapper.scala 75:36]
  assign brams_21_io_a_din = brams_io_21_bram_wrdata_a; // @[TreePEsWrapper.scala 76:35]
  assign brams_21_io_b_addr = pes_21_pe_io_mem_addr_1[10:0]; // @[TreePEsWrapper.scala 69:36]
  assign brams_22_io_clk = brams_io_22_bram_clk_a; // @[TreePEsWrapper.scala 79:33]
  assign brams_22_io_a_en = brams_io_22_bram_en_a; // @[TreePEsWrapper.scala 73:34]
  assign brams_22_io_a_wr = brams_io_22_bram_we_a[0]; // @[TreePEsWrapper.scala 74:64]
  assign brams_22_io_a_addr = brams_io_22_bram_addr_a; // @[TreePEsWrapper.scala 75:36]
  assign brams_22_io_a_din = brams_io_22_bram_wrdata_a; // @[TreePEsWrapper.scala 76:35]
  assign brams_22_io_b_addr = pes_22_pe_io_mem_addr_1[10:0]; // @[TreePEsWrapper.scala 69:36]
  assign brams_23_io_clk = brams_io_23_bram_clk_a; // @[TreePEsWrapper.scala 79:33]
  assign brams_23_io_a_en = brams_io_23_bram_en_a; // @[TreePEsWrapper.scala 73:34]
  assign brams_23_io_a_wr = brams_io_23_bram_we_a[0]; // @[TreePEsWrapper.scala 74:64]
  assign brams_23_io_a_addr = brams_io_23_bram_addr_a; // @[TreePEsWrapper.scala 75:36]
  assign brams_23_io_a_din = brams_io_23_bram_wrdata_a; // @[TreePEsWrapper.scala 76:35]
  assign brams_23_io_b_addr = pes_23_pe_io_mem_addr_1[10:0]; // @[TreePEsWrapper.scala 69:36]
  assign brams_24_io_clk = brams_io_24_bram_clk_a; // @[TreePEsWrapper.scala 79:33]
  assign brams_24_io_a_en = brams_io_24_bram_en_a; // @[TreePEsWrapper.scala 73:34]
  assign brams_24_io_a_wr = brams_io_24_bram_we_a[0]; // @[TreePEsWrapper.scala 74:64]
  assign brams_24_io_a_addr = brams_io_24_bram_addr_a; // @[TreePEsWrapper.scala 75:36]
  assign brams_24_io_a_din = brams_io_24_bram_wrdata_a; // @[TreePEsWrapper.scala 76:35]
  assign brams_24_io_b_addr = pes_24_pe_io_mem_addr_1[10:0]; // @[TreePEsWrapper.scala 69:36]
  assign brams_25_io_clk = brams_io_25_bram_clk_a; // @[TreePEsWrapper.scala 79:33]
  assign brams_25_io_a_en = brams_io_25_bram_en_a; // @[TreePEsWrapper.scala 73:34]
  assign brams_25_io_a_wr = brams_io_25_bram_we_a[0]; // @[TreePEsWrapper.scala 74:64]
  assign brams_25_io_a_addr = brams_io_25_bram_addr_a; // @[TreePEsWrapper.scala 75:36]
  assign brams_25_io_a_din = brams_io_25_bram_wrdata_a; // @[TreePEsWrapper.scala 76:35]
  assign brams_25_io_b_addr = pes_25_pe_io_mem_addr_1[10:0]; // @[TreePEsWrapper.scala 69:36]
  assign brams_26_io_clk = brams_io_26_bram_clk_a; // @[TreePEsWrapper.scala 79:33]
  assign brams_26_io_a_en = brams_io_26_bram_en_a; // @[TreePEsWrapper.scala 73:34]
  assign brams_26_io_a_wr = brams_io_26_bram_we_a[0]; // @[TreePEsWrapper.scala 74:64]
  assign brams_26_io_a_addr = brams_io_26_bram_addr_a; // @[TreePEsWrapper.scala 75:36]
  assign brams_26_io_a_din = brams_io_26_bram_wrdata_a; // @[TreePEsWrapper.scala 76:35]
  assign brams_26_io_b_addr = pes_26_pe_io_mem_addr_1[10:0]; // @[TreePEsWrapper.scala 69:36]
  assign brams_27_io_clk = brams_io_27_bram_clk_a; // @[TreePEsWrapper.scala 79:33]
  assign brams_27_io_a_en = brams_io_27_bram_en_a; // @[TreePEsWrapper.scala 73:34]
  assign brams_27_io_a_wr = brams_io_27_bram_we_a[0]; // @[TreePEsWrapper.scala 74:64]
  assign brams_27_io_a_addr = brams_io_27_bram_addr_a; // @[TreePEsWrapper.scala 75:36]
  assign brams_27_io_a_din = brams_io_27_bram_wrdata_a; // @[TreePEsWrapper.scala 76:35]
  assign brams_27_io_b_addr = pes_27_pe_io_mem_addr_1[10:0]; // @[TreePEsWrapper.scala 69:36]
  assign brams_28_io_clk = brams_io_28_bram_clk_a; // @[TreePEsWrapper.scala 79:33]
  assign brams_28_io_a_en = brams_io_28_bram_en_a; // @[TreePEsWrapper.scala 73:34]
  assign brams_28_io_a_wr = brams_io_28_bram_we_a[0]; // @[TreePEsWrapper.scala 74:64]
  assign brams_28_io_a_addr = brams_io_28_bram_addr_a; // @[TreePEsWrapper.scala 75:36]
  assign brams_28_io_a_din = brams_io_28_bram_wrdata_a; // @[TreePEsWrapper.scala 76:35]
  assign brams_28_io_b_addr = pes_28_pe_io_mem_addr_1[10:0]; // @[TreePEsWrapper.scala 69:36]
  assign brams_29_io_clk = brams_io_29_bram_clk_a; // @[TreePEsWrapper.scala 79:33]
  assign brams_29_io_a_en = brams_io_29_bram_en_a; // @[TreePEsWrapper.scala 73:34]
  assign brams_29_io_a_wr = brams_io_29_bram_we_a[0]; // @[TreePEsWrapper.scala 74:64]
  assign brams_29_io_a_addr = brams_io_29_bram_addr_a; // @[TreePEsWrapper.scala 75:36]
  assign brams_29_io_a_din = brams_io_29_bram_wrdata_a; // @[TreePEsWrapper.scala 76:35]
  assign brams_29_io_b_addr = pes_29_pe_io_mem_addr_1[10:0]; // @[TreePEsWrapper.scala 69:36]
  assign first_interconnect_clock = clock;
  assign first_interconnect_reset = reset;
  assign first_interconnect_io_sample_entering_valid = forward_converter_io_sample_out_valid; // @[TreePEsWrapper.scala 147:41]
  assign first_interconnect_io_sample_entering_bits_features_0 = forward_converter_io_sample_out_bits_features_0; // @[TreePEsWrapper.scala 147:41]
  assign first_interconnect_io_sample_entering_bits_features_1 = forward_converter_io_sample_out_bits_features_1; // @[TreePEsWrapper.scala 147:41]
  assign first_interconnect_io_sample_entering_bits_features_2 = forward_converter_io_sample_out_bits_features_2; // @[TreePEsWrapper.scala 147:41]
  assign first_interconnect_io_sample_entering_bits_features_3 = forward_converter_io_sample_out_bits_features_3; // @[TreePEsWrapper.scala 147:41]
  assign first_interconnect_io_sample_entering_bits_features_4 = forward_converter_io_sample_out_bits_features_4; // @[TreePEsWrapper.scala 147:41]
  assign first_interconnect_io_sample_entering_bits_offset = forward_converter_io_sample_out_bits_offset; // @[TreePEsWrapper.scala 147:41]
  assign first_interconnect_io_sample_entering_bits_search_for_root =
    forward_converter_io_sample_out_bits_search_for_root; // @[TreePEsWrapper.scala 147:41]
  assign first_interconnect_io_sample_entering_bits_tree_to_exec = forward_converter_io_sample_out_bits_tree_to_exec; // @[TreePEsWrapper.scala 147:41]
  assign first_interconnect_io_sample_entering_bits_scores_0 = forward_converter_io_sample_out_bits_scores_0; // @[TreePEsWrapper.scala 147:41]
  assign first_interconnect_io_sample_entering_bits_scores_1 = forward_converter_io_sample_out_bits_scores_1; // @[TreePEsWrapper.scala 147:41]
  assign first_interconnect_io_sample_entering_bits_scores_2 = forward_converter_io_sample_out_bits_scores_2; // @[TreePEsWrapper.scala 147:41]
  assign first_interconnect_io_sample_entering_bits_scores_3 = forward_converter_io_sample_out_bits_scores_3; // @[TreePEsWrapper.scala 147:41]
  assign first_interconnect_io_sample_entering_bits_weights_0 = forward_converter_io_sample_out_bits_weights_0; // @[TreePEsWrapper.scala 147:41]
  assign first_interconnect_io_sample_entering_bits_weights_1 = forward_converter_io_sample_out_bits_weights_1; // @[TreePEsWrapper.scala 147:41]
  assign first_interconnect_io_sample_entering_bits_weights_2 = forward_converter_io_sample_out_bits_weights_2; // @[TreePEsWrapper.scala 147:41]
  assign first_interconnect_io_sample_entering_bits_weights_3 = forward_converter_io_sample_out_bits_weights_3; // @[TreePEsWrapper.scala 147:41]
  assign first_interconnect_io_sample_entering_bits_weights_4 = forward_converter_io_sample_out_bits_weights_4; // @[TreePEsWrapper.scala 147:41]
  assign first_interconnect_io_sample_entering_bits_last = forward_converter_io_sample_out_bits_last; // @[TreePEsWrapper.scala 147:41]
  assign first_interconnect_io_sample_looping_valid = increment_io_sample_out_valid; // @[IncrementTreePE.scala 31:23]
  assign first_interconnect_io_sample_looping_bits_features_0 = increment_io_sample_out_bits_features_0; // @[IncrementTreePE.scala 31:23]
  assign first_interconnect_io_sample_looping_bits_features_1 = increment_io_sample_out_bits_features_1; // @[IncrementTreePE.scala 31:23]
  assign first_interconnect_io_sample_looping_bits_features_2 = increment_io_sample_out_bits_features_2; // @[IncrementTreePE.scala 31:23]
  assign first_interconnect_io_sample_looping_bits_features_3 = increment_io_sample_out_bits_features_3; // @[IncrementTreePE.scala 31:23]
  assign first_interconnect_io_sample_looping_bits_features_4 = increment_io_sample_out_bits_features_4; // @[IncrementTreePE.scala 31:23]
  assign first_interconnect_io_sample_looping_bits_offset = increment_io_sample_out_bits_offset; // @[IncrementTreePE.scala 31:23]
  assign first_interconnect_io_sample_looping_bits_search_for_root = increment_io_sample_out_bits_search_for_root; // @[IncrementTreePE.scala 31:23]
  assign first_interconnect_io_sample_looping_bits_tree_to_exec = increment_io_sample_out_bits_tree_to_exec; // @[IncrementTreePE.scala 31:23]
  assign first_interconnect_io_sample_looping_bits_scores_0 = increment_io_sample_out_bits_scores_0; // @[IncrementTreePE.scala 31:23]
  assign first_interconnect_io_sample_looping_bits_scores_1 = increment_io_sample_out_bits_scores_1; // @[IncrementTreePE.scala 31:23]
  assign first_interconnect_io_sample_looping_bits_scores_2 = increment_io_sample_out_bits_scores_2; // @[IncrementTreePE.scala 31:23]
  assign first_interconnect_io_sample_looping_bits_scores_3 = increment_io_sample_out_bits_scores_3; // @[IncrementTreePE.scala 31:23]
  assign first_interconnect_io_sample_looping_bits_weights_0 = increment_io_sample_out_bits_weights_0; // @[IncrementTreePE.scala 31:23]
  assign first_interconnect_io_sample_looping_bits_weights_1 = increment_io_sample_out_bits_weights_1; // @[IncrementTreePE.scala 31:23]
  assign first_interconnect_io_sample_looping_bits_weights_2 = increment_io_sample_out_bits_weights_2; // @[IncrementTreePE.scala 31:23]
  assign first_interconnect_io_sample_looping_bits_weights_3 = increment_io_sample_out_bits_weights_3; // @[IncrementTreePE.scala 31:23]
  assign first_interconnect_io_sample_looping_bits_weights_4 = increment_io_sample_out_bits_weights_4; // @[IncrementTreePE.scala 31:23]
  assign first_interconnect_io_sample_looping_bits_last = increment_io_sample_out_bits_last; // @[IncrementTreePE.scala 31:23]
  assign first_interconnect_io_sample_out_ready = pes_0_pe_io_sample_in_ready; // @[Interconnect.scala 75:23]
  assign last_interconnect_clock = clock;
  assign last_interconnect_reset = reset;
  assign last_interconnect_io_sample_in_valid = pes_29_pe_io_sample_out_valid; // @[TreePE.scala 122:22]
  assign last_interconnect_io_sample_in_bits_features_0 = pes_29_pe_io_sample_out_bits_features_0; // @[TreePE.scala 122:22]
  assign last_interconnect_io_sample_in_bits_features_1 = pes_29_pe_io_sample_out_bits_features_1; // @[TreePE.scala 122:22]
  assign last_interconnect_io_sample_in_bits_features_2 = pes_29_pe_io_sample_out_bits_features_2; // @[TreePE.scala 122:22]
  assign last_interconnect_io_sample_in_bits_features_3 = pes_29_pe_io_sample_out_bits_features_3; // @[TreePE.scala 122:22]
  assign last_interconnect_io_sample_in_bits_features_4 = pes_29_pe_io_sample_out_bits_features_4; // @[TreePE.scala 122:22]
  assign last_interconnect_io_sample_in_bits_offset = pes_29_pe_io_sample_out_bits_offset; // @[TreePE.scala 122:22]
  assign last_interconnect_io_sample_in_bits_search_for_root = pes_29_pe_io_sample_out_bits_search_for_root; // @[TreePE.scala 122:22]
  assign last_interconnect_io_sample_in_bits_tree_to_exec = pes_29_pe_io_sample_out_bits_tree_to_exec; // @[TreePE.scala 122:22]
  assign last_interconnect_io_sample_in_bits_scores_0 = pes_29_pe_io_sample_out_bits_scores_0; // @[TreePE.scala 122:22]
  assign last_interconnect_io_sample_in_bits_scores_1 = pes_29_pe_io_sample_out_bits_scores_1; // @[TreePE.scala 122:22]
  assign last_interconnect_io_sample_in_bits_scores_2 = pes_29_pe_io_sample_out_bits_scores_2; // @[TreePE.scala 122:22]
  assign last_interconnect_io_sample_in_bits_scores_3 = pes_29_pe_io_sample_out_bits_scores_3; // @[TreePE.scala 122:22]
  assign last_interconnect_io_sample_in_bits_weights_0 = pes_29_pe_io_sample_out_bits_weights_0; // @[TreePE.scala 122:22]
  assign last_interconnect_io_sample_in_bits_weights_1 = pes_29_pe_io_sample_out_bits_weights_1; // @[TreePE.scala 122:22]
  assign last_interconnect_io_sample_in_bits_weights_2 = pes_29_pe_io_sample_out_bits_weights_2; // @[TreePE.scala 122:22]
  assign last_interconnect_io_sample_in_bits_weights_3 = pes_29_pe_io_sample_out_bits_weights_3; // @[TreePE.scala 122:22]
  assign last_interconnect_io_sample_in_bits_weights_4 = pes_29_pe_io_sample_out_bits_weights_4; // @[TreePE.scala 122:22]
  assign last_interconnect_io_sample_in_bits_dest = pes_29_pe_io_sample_out_bits_dest; // @[TreePE.scala 122:22]
  assign last_interconnect_io_sample_in_bits_last = pes_29_pe_io_sample_out_bits_last; // @[TreePE.scala 122:22]
  assign last_interconnect_io_sample_looping_ready = increment_io_sample_in_ready; // @[Interconnect.scala 33:27]
  assign last_interconnect_io_sample_leaving_ready = backward_converter_io_sample_in_ready; // @[TreePEsWrapper.scala 111:55]
  assign increment_clock = clock;
  assign increment_reset = reset;
  assign increment_io_sample_in_valid = last_interconnect_io_sample_looping_valid; // @[Interconnect.scala 33:27]
  assign increment_io_sample_in_bits_features_0 = last_interconnect_io_sample_looping_bits_features_0; // @[Interconnect.scala 33:27]
  assign increment_io_sample_in_bits_features_1 = last_interconnect_io_sample_looping_bits_features_1; // @[Interconnect.scala 33:27]
  assign increment_io_sample_in_bits_features_2 = last_interconnect_io_sample_looping_bits_features_2; // @[Interconnect.scala 33:27]
  assign increment_io_sample_in_bits_features_3 = last_interconnect_io_sample_looping_bits_features_3; // @[Interconnect.scala 33:27]
  assign increment_io_sample_in_bits_features_4 = last_interconnect_io_sample_looping_bits_features_4; // @[Interconnect.scala 33:27]
  assign increment_io_sample_in_bits_offset = last_interconnect_io_sample_looping_bits_offset; // @[Interconnect.scala 33:27]
  assign increment_io_sample_in_bits_search_for_root = last_interconnect_io_sample_looping_bits_search_for_root; // @[Interconnect.scala 33:27]
  assign increment_io_sample_in_bits_tree_to_exec = last_interconnect_io_sample_looping_bits_tree_to_exec; // @[Interconnect.scala 33:27]
  assign increment_io_sample_in_bits_scores_0 = last_interconnect_io_sample_looping_bits_scores_0; // @[Interconnect.scala 33:27]
  assign increment_io_sample_in_bits_scores_1 = last_interconnect_io_sample_looping_bits_scores_1; // @[Interconnect.scala 33:27]
  assign increment_io_sample_in_bits_scores_2 = last_interconnect_io_sample_looping_bits_scores_2; // @[Interconnect.scala 33:27]
  assign increment_io_sample_in_bits_scores_3 = last_interconnect_io_sample_looping_bits_scores_3; // @[Interconnect.scala 33:27]
  assign increment_io_sample_in_bits_weights_0 = last_interconnect_io_sample_looping_bits_weights_0; // @[Interconnect.scala 33:27]
  assign increment_io_sample_in_bits_weights_1 = last_interconnect_io_sample_looping_bits_weights_1; // @[Interconnect.scala 33:27]
  assign increment_io_sample_in_bits_weights_2 = last_interconnect_io_sample_looping_bits_weights_2; // @[Interconnect.scala 33:27]
  assign increment_io_sample_in_bits_weights_3 = last_interconnect_io_sample_looping_bits_weights_3; // @[Interconnect.scala 33:27]
  assign increment_io_sample_in_bits_weights_4 = last_interconnect_io_sample_looping_bits_weights_4; // @[Interconnect.scala 33:27]
  assign increment_io_sample_in_bits_last = last_interconnect_io_sample_looping_bits_last; // @[Interconnect.scala 33:27]
  assign increment_io_sample_out_ready = first_interconnect_io_sample_looping_ready; // @[IncrementTreePE.scala 31:23]
  always @(posedge clock) begin
    if (reset) begin // @[TreePEsWrapper.scala 44:37]
      cycles_counter <= 32'h0; // @[TreePEsWrapper.scala 44:37]
    end else if (counting) begin // @[TreePEsWrapper.scala 144:30]
      cycles_counter <= _cycles_counter_T_1;
    end
    if (reset) begin // @[TreePEsWrapper.scala 45:31]
      counting <= 1'h0; // @[TreePEsWrapper.scala 45:31]
    end else begin
      counting <= _GEN_2;
    end
    if (reset) begin // @[TreePEsWrapper.scala 46:33]
      stop_count <= 1'h0; // @[TreePEsWrapper.scala 46:33]
    end else if (!(wrapper_io_sample_in_TVALID & ~counting & ~stop_count)) begin // @[TreePEsWrapper.scala 136:68]
      stop_count <= _GEN_1;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  cycles_counter = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  counting = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  stop_count = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
