module Arbiter_1( 
  input         io_in_0_valid, 
  input  [11:0] io_in_0_bits_addr, 
  input         io_in_0_bits_write, 
  input  [63:0] io_in_0_bits_wdata, 
  input  [7:0]  io_in_0_bits_eccMask, 
  input  [3:0]  io_in_0_bits_way_en, 
  output        io_in_1_ready, 
  input         io_in_1_valid, 
  input  [11:0] io_in_1_bits_addr, 
  input         io_in_1_bits_write, 
  input  [63:0] io_in_1_bits_wdata, 
  input  [7:0]  io_in_1_bits_eccMask, 
  input  [3:0]  io_in_1_bits_way_en, 
  output        io_in_2_ready, 
  input         io_in_2_valid, 
  input  [11:0] io_in_2_bits_addr, 
  input  [63:0] io_in_2_bits_wdata, 
  input  [7:0]  io_in_2_bits_eccMask, 
  output        io_in_3_ready, 
  input         io_in_3_valid, 
  input  [11:0] io_in_3_bits_addr, 
  input  [63:0] io_in_3_bits_wdata, 
  input  [7:0]  io_in_3_bits_eccMask, 
  output        io_out_valid, 
  output [11:0] io_out_bits_addr, 
  output        io_out_bits_write, 
  output [63:0] io_out_bits_wdata, 
  output [7:0]  io_out_bits_eccMask, 
  output [3:0]  io_out_bits_way_en 
);
  wire [7:0] _GEN_2; 
  wire [63:0] _GEN_5; 
  wire [11:0] _GEN_7; 
  wire [3:0] _GEN_9; 
  wire [7:0] _GEN_10; 
  wire [63:0] _GEN_13; 
  wire  _GEN_14; 
  wire [11:0] _GEN_15; 
  wire  _T_94; 
  wire  _T_95; 
  wire  _T_98; 
  wire  _T_103; 
  assign _GEN_2 = io_in_2_valid ? io_in_2_bits_eccMask : io_in_3_bits_eccMask; 
  assign _GEN_5 = io_in_2_valid ? io_in_2_bits_wdata : io_in_3_bits_wdata; 
  assign _GEN_7 = io_in_2_valid ? io_in_2_bits_addr : io_in_3_bits_addr; 
  assign _GEN_9 = io_in_1_valid ? io_in_1_bits_way_en : 4'hf; 
  assign _GEN_10 = io_in_1_valid ? 8'hff : _GEN_2; 
  assign _GEN_13 = io_in_1_valid ? io_in_1_bits_wdata : _GEN_5; 
  assign _GEN_14 = io_in_1_valid ? io_in_1_bits_write : 1'h0; 
  assign _GEN_15 = io_in_1_valid ? io_in_1_bits_addr : _GEN_7; 
  assign _T_94 = io_in_0_valid | io_in_1_valid; 
  assign _T_95 = _T_94 | io_in_2_valid; 
  assign _T_98 = _T_95 == 1'h0; 
  assign _T_103 = _T_98 == 1'h0; 
  assign io_in_1_ready = io_in_0_valid == 1'h0; 
  assign io_in_2_ready = _T_94 == 1'h0; 
  assign io_in_3_ready = _T_95 == 1'h0; 
  assign io_out_valid = _T_103 | io_in_3_valid; 
  assign io_out_bits_addr = io_in_0_valid ? io_in_0_bits_addr : _GEN_15; 
  assign io_out_bits_write = io_in_0_valid ? io_in_0_bits_write : _GEN_14; 
  assign io_out_bits_wdata = io_in_0_valid ? io_in_0_bits_wdata : _GEN_13; 
  assign io_out_bits_eccMask = io_in_0_valid ? io_in_0_bits_eccMask : _GEN_10; 
  assign io_out_bits_way_en = io_in_0_valid ? io_in_0_bits_way_en : _GEN_9; 
endmodule
