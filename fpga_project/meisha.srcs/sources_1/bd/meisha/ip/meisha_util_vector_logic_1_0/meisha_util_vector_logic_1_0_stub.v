// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (lin64) Build 1756540 Mon Jan 23 19:11:19 MST 2017
// Date        : Thu Aug  1 19:21:38 2024
// Host        : meisha running 64-bit CentOS Linux release 7.9.2009 (Core)
// Command     : write_verilog -force -mode synth_stub -rename_top meisha_util_vector_logic_1_0 -prefix
//               meisha_util_vector_logic_1_0_ meisha_util_vector_logic_0_1_stub.v
// Design      : meisha_util_vector_logic_0_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx485tffg1761-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "util_vector_logic,Vivado 2016.4" *)
module meisha_util_vector_logic_1_0(Op1, Res)
/* synthesis syn_black_box black_box_pad_pin="Op1[7:0],Res[7:0]" */;
  input [7:0]Op1;
  output [7:0]Res;
endmodule