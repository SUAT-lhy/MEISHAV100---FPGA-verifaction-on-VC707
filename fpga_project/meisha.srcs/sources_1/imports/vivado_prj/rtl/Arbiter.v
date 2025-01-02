module Arbiter( 
  input         io_in_0_valid, 
  input  [39:0] io_in_0_bits_addr, 
  input  [5:0]  io_in_0_bits_idx, 
  input  [27:0] io_in_0_bits_data, 
  input         io_in_2_valid, 
  input         io_in_2_bits_write, 
  input  [39:0] io_in_2_bits_addr, 
  input  [5:0]  io_in_2_bits_idx, 
  input  [3:0]  io_in_2_bits_way_en, 
  input  [27:0] io_in_2_bits_data, 
  input         io_in_3_valid, 
  input  [39:0] io_in_3_bits_addr, 
  input  [5:0]  io_in_3_bits_idx, 
  input  [3:0]  io_in_3_bits_way_en, 
  input  [27:0] io_in_3_bits_data, 
  output        io_in_4_ready, 
  input         io_in_4_valid, 
  input  [39:0] io_in_4_bits_addr, 
  input  [5:0]  io_in_4_bits_idx, 
  input  [3:0]  io_in_4_bits_way_en, 
  input  [27:0] io_in_4_bits_data, 
  output        io_in_5_ready, 
  // input         io_in_5_valid, // for lint unused
  // input  [39:0] io_in_5_bits_addr, 
  // input  [5:0]  io_in_5_bits_idx, 
  output        io_in_6_ready, 
  input         io_in_6_valid, 
  input  [39:0] io_in_6_bits_addr, 
  input  [5:0]  io_in_6_bits_idx, 
  input  [3:0]  io_in_6_bits_way_en, 
  input  [27:0] io_in_6_bits_data, 
  output        io_in_7_ready, 
  input         io_in_7_valid, 
  input  [39:0] io_in_7_bits_addr, 
  input  [5:0]  io_in_7_bits_idx, 
  input  [3:0]  io_in_7_bits_way_en, 
  input  [27:0] io_in_7_bits_data, 
  input         io_out_ready, 
  output        io_out_valid, 
  output        io_out_bits_write, 
  output [39:0] io_out_bits_addr, 
  output [5:0]  io_out_bits_idx, 
  output [3:0]  io_out_bits_way_en, 
  output [27:0] io_out_bits_data 
);
  wire [27:0] _GEN_1; 
  wire [3:0] _GEN_2; 
  wire [5:0] _GEN_3; 
  wire [39:0] _GEN_4; 
  wire [27:0] _GEN_13; 
  wire [3:0] _GEN_14; 
  wire [5:0] _GEN_15; 
  wire [39:0] _GEN_16; 
  wire [27:0] _GEN_19; 
  wire [3:0] _GEN_20; 
  wire [5:0] _GEN_21; 
  wire [39:0] _GEN_22; 
  wire  _GEN_23; 
  wire [27:0] _GEN_25; 
  wire [3:0] _GEN_26; 
  wire [5:0] _GEN_27; 
  wire [39:0] _GEN_28; 
  wire  _GEN_29; 
  wire  _T_210; 
  wire  _T_211; 
  wire  _T_212; 
  wire  _T_214; 
  wire  _T_218; 
  wire  _T_219; 
  wire  _T_221; 
  wire  _T_230; 
  assign _GEN_1 = io_in_6_valid ? io_in_6_bits_data : io_in_7_bits_data; 
  assign _GEN_2 = io_in_6_valid ? io_in_6_bits_way_en : io_in_7_bits_way_en; 
  assign _GEN_3 = io_in_6_valid ? io_in_6_bits_idx : io_in_7_bits_idx; 
  assign _GEN_4 = io_in_6_valid ? io_in_6_bits_addr : io_in_7_bits_addr; 
  assign _GEN_13 = io_in_4_valid ? io_in_4_bits_data : _GEN_1; 
  assign _GEN_14 = io_in_4_valid ? io_in_4_bits_way_en : _GEN_2; 
  assign _GEN_15 = io_in_4_valid ? io_in_4_bits_idx : _GEN_3; 
  assign _GEN_16 = io_in_4_valid ? io_in_4_bits_addr : _GEN_4; 
  assign _GEN_19 = io_in_3_valid ? io_in_3_bits_data : _GEN_13; 
  assign _GEN_20 = io_in_3_valid ? io_in_3_bits_way_en : _GEN_14; 
  assign _GEN_21 = io_in_3_valid ? io_in_3_bits_idx : _GEN_15; 
  assign _GEN_22 = io_in_3_valid ? io_in_3_bits_addr : _GEN_16; 
  assign _GEN_23 = io_in_3_valid ? 1'h1 : io_in_4_valid; 
  assign _GEN_25 = io_in_2_valid ? io_in_2_bits_data : _GEN_19; 
  assign _GEN_26 = io_in_2_valid ? io_in_2_bits_way_en : _GEN_20; 
  assign _GEN_27 = io_in_2_valid ? io_in_2_bits_idx : _GEN_21; 
  assign _GEN_28 = io_in_2_valid ? io_in_2_bits_addr : _GEN_22; 
  assign _GEN_29 = io_in_2_valid ? io_in_2_bits_write : _GEN_23; 
  assign _T_210 = io_in_0_valid | io_in_2_valid; 
  assign _T_211 = _T_210 | io_in_3_valid; 
  assign _T_212 = _T_211 | io_in_4_valid; 
  assign _T_214 = _T_212 | io_in_6_valid; 
  assign _T_218 = _T_211 == 1'h0; 
  assign _T_219 = _T_212 == 1'h0; 
  assign _T_221 = _T_214 == 1'h0; 
  assign _T_230 = _T_221 == 1'h0; 
  assign io_in_4_ready = _T_218 & io_out_ready; 
  assign io_in_5_ready = _T_219 & io_out_ready; 
  assign io_in_6_ready = _T_219 & io_out_ready; 
  assign io_in_7_ready = _T_221 & io_out_ready; 
  assign io_out_valid = _T_230 | io_in_7_valid; 
  assign io_out_bits_write = io_in_0_valid ? 1'h1 : _GEN_29; 
  assign io_out_bits_addr = io_in_0_valid ? io_in_0_bits_addr : _GEN_28; 
  assign io_out_bits_idx = io_in_0_valid ? io_in_0_bits_idx : _GEN_27; 
  assign io_out_bits_way_en = io_in_0_valid ? 4'hf : _GEN_26; 
  assign io_out_bits_data = io_in_0_valid ? io_in_0_bits_data : _GEN_25; 
endmodule
