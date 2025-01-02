module SimpleLazyModule_23( 
  input         clock, 
  input         reset, 
  output        auto_fragmenter_in_a_ready, 
  input         auto_fragmenter_in_a_valid, 
  input  [2:0]  auto_fragmenter_in_a_bits_opcode, 
  input  [2:0]  auto_fragmenter_in_a_bits_param, 
  input  [2:0]  auto_fragmenter_in_a_bits_size, 
  input  [4:0]  auto_fragmenter_in_a_bits_source, 
  input  [30:0] auto_fragmenter_in_a_bits_address, 
  input  [7:0]  auto_fragmenter_in_a_bits_mask, 
  input  [63:0] auto_fragmenter_in_a_bits_data, 
  input         auto_fragmenter_in_a_bits_corrupt, 
  input         auto_fragmenter_in_d_ready, 
  output        auto_fragmenter_in_d_valid, 
  output [2:0]  auto_fragmenter_in_d_bits_opcode, 
  output [2:0]  auto_fragmenter_in_d_bits_size, 
  output [4:0]  auto_fragmenter_in_d_bits_source, 
  output [63:0] auto_fragmenter_in_d_bits_data, 
  input         auto_control_xing_out_a_ready, 
  output        auto_control_xing_out_a_valid, 
  output [2:0]  auto_control_xing_out_a_bits_opcode, 
  output [2:0]  auto_control_xing_out_a_bits_param, 
  output [1:0]  auto_control_xing_out_a_bits_size, 
  output [8:0]  auto_control_xing_out_a_bits_source, 
  output [30:0] auto_control_xing_out_a_bits_address, 
  output [7:0]  auto_control_xing_out_a_bits_mask, 
  output [63:0] auto_control_xing_out_a_bits_data, 
  output        auto_control_xing_out_a_bits_corrupt, 
  output        auto_control_xing_out_d_ready, 
  input         auto_control_xing_out_d_valid, 
  input  [2:0]  auto_control_xing_out_d_bits_opcode, 
  input  [1:0]  auto_control_xing_out_d_bits_size, 
  input  [8:0]  auto_control_xing_out_d_bits_source, 
  input  [63:0] auto_control_xing_out_d_bits_data 
);
  wire  fragmenter_clock; 
  wire  fragmenter_reset; 
  wire  fragmenter_auto_in_a_ready; 
  wire  fragmenter_auto_in_a_valid; 
  wire [2:0] fragmenter_auto_in_a_bits_opcode; 
  wire [2:0] fragmenter_auto_in_a_bits_param; 
  wire [2:0] fragmenter_auto_in_a_bits_size; 
  wire [4:0] fragmenter_auto_in_a_bits_source; 
  wire [30:0] fragmenter_auto_in_a_bits_address; 
  wire [7:0] fragmenter_auto_in_a_bits_mask; 
  wire [63:0] fragmenter_auto_in_a_bits_data; 
  wire  fragmenter_auto_in_a_bits_corrupt; 
  wire  fragmenter_auto_in_d_ready; 
  wire  fragmenter_auto_in_d_valid; 
  wire [2:0] fragmenter_auto_in_d_bits_opcode; 
  wire [2:0] fragmenter_auto_in_d_bits_size; 
  wire [4:0] fragmenter_auto_in_d_bits_source; 
  wire [63:0] fragmenter_auto_in_d_bits_data; 
  wire  fragmenter_auto_out_a_ready; 
  wire  fragmenter_auto_out_a_valid; 
  wire [2:0] fragmenter_auto_out_a_bits_opcode; 
  wire [2:0] fragmenter_auto_out_a_bits_param; 
  wire [1:0] fragmenter_auto_out_a_bits_size; 
  wire [8:0] fragmenter_auto_out_a_bits_source; 
  wire [30:0] fragmenter_auto_out_a_bits_address; 
  wire [7:0] fragmenter_auto_out_a_bits_mask; 
  wire [63:0] fragmenter_auto_out_a_bits_data; 
  wire  fragmenter_auto_out_a_bits_corrupt; 
  wire  fragmenter_auto_out_d_ready; 
  wire  fragmenter_auto_out_d_valid; 
  wire [2:0] fragmenter_auto_out_d_bits_opcode; 
  wire [1:0] fragmenter_auto_out_d_bits_size; 
  wire [8:0] fragmenter_auto_out_d_bits_source; 
  wire [63:0] fragmenter_auto_out_d_bits_data; 
  TLFragmenter_6 fragmenter ( 
    .clock(fragmenter_clock),
    .reset(fragmenter_reset),
    .auto_in_a_ready(fragmenter_auto_in_a_ready),
    .auto_in_a_valid(fragmenter_auto_in_a_valid),
    .auto_in_a_bits_opcode(fragmenter_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(fragmenter_auto_in_a_bits_param),
    .auto_in_a_bits_size(fragmenter_auto_in_a_bits_size),
    .auto_in_a_bits_source(fragmenter_auto_in_a_bits_source),
    .auto_in_a_bits_address(fragmenter_auto_in_a_bits_address),
    .auto_in_a_bits_mask(fragmenter_auto_in_a_bits_mask),
    .auto_in_a_bits_data(fragmenter_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(fragmenter_auto_in_a_bits_corrupt),
    .auto_in_d_ready(fragmenter_auto_in_d_ready),
    .auto_in_d_valid(fragmenter_auto_in_d_valid),
    .auto_in_d_bits_opcode(fragmenter_auto_in_d_bits_opcode),
    .auto_in_d_bits_size(fragmenter_auto_in_d_bits_size),
    .auto_in_d_bits_source(fragmenter_auto_in_d_bits_source),
    .auto_in_d_bits_data(fragmenter_auto_in_d_bits_data),
    .auto_out_a_ready(fragmenter_auto_out_a_ready),
    .auto_out_a_valid(fragmenter_auto_out_a_valid),
    .auto_out_a_bits_opcode(fragmenter_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(fragmenter_auto_out_a_bits_param),
    .auto_out_a_bits_size(fragmenter_auto_out_a_bits_size),
    .auto_out_a_bits_source(fragmenter_auto_out_a_bits_source),
    .auto_out_a_bits_address(fragmenter_auto_out_a_bits_address),
    .auto_out_a_bits_mask(fragmenter_auto_out_a_bits_mask),
    .auto_out_a_bits_data(fragmenter_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(fragmenter_auto_out_a_bits_corrupt),
    .auto_out_d_ready(fragmenter_auto_out_d_ready),
    .auto_out_d_valid(fragmenter_auto_out_d_valid),
    .auto_out_d_bits_opcode(fragmenter_auto_out_d_bits_opcode),
    .auto_out_d_bits_size(fragmenter_auto_out_d_bits_size),
    .auto_out_d_bits_source(fragmenter_auto_out_d_bits_source),
    .auto_out_d_bits_data(fragmenter_auto_out_d_bits_data)
  );
  assign auto_fragmenter_in_a_ready = fragmenter_auto_in_a_ready; 
  assign auto_fragmenter_in_d_valid = fragmenter_auto_in_d_valid; 
  assign auto_fragmenter_in_d_bits_opcode = fragmenter_auto_in_d_bits_opcode; 
  assign auto_fragmenter_in_d_bits_size = fragmenter_auto_in_d_bits_size; 
  assign auto_fragmenter_in_d_bits_source = fragmenter_auto_in_d_bits_source; 
  assign auto_fragmenter_in_d_bits_data = fragmenter_auto_in_d_bits_data; 
  assign auto_control_xing_out_a_valid = fragmenter_auto_out_a_valid; 
  assign auto_control_xing_out_a_bits_opcode = fragmenter_auto_out_a_bits_opcode; 
  assign auto_control_xing_out_a_bits_param = fragmenter_auto_out_a_bits_param; 
  assign auto_control_xing_out_a_bits_size = fragmenter_auto_out_a_bits_size; 
  assign auto_control_xing_out_a_bits_source = fragmenter_auto_out_a_bits_source; 
  assign auto_control_xing_out_a_bits_address = fragmenter_auto_out_a_bits_address; 
  assign auto_control_xing_out_a_bits_mask = fragmenter_auto_out_a_bits_mask; 
  assign auto_control_xing_out_a_bits_data = fragmenter_auto_out_a_bits_data; 
  assign auto_control_xing_out_a_bits_corrupt = fragmenter_auto_out_a_bits_corrupt; 
  assign auto_control_xing_out_d_ready = fragmenter_auto_out_d_ready; 
  assign fragmenter_clock = clock; 
  assign fragmenter_reset = reset; 
  assign fragmenter_auto_in_a_valid = auto_fragmenter_in_a_valid; 
  assign fragmenter_auto_in_a_bits_opcode = auto_fragmenter_in_a_bits_opcode; 
  assign fragmenter_auto_in_a_bits_param = auto_fragmenter_in_a_bits_param; 
  assign fragmenter_auto_in_a_bits_size = auto_fragmenter_in_a_bits_size; 
  assign fragmenter_auto_in_a_bits_source = auto_fragmenter_in_a_bits_source; 
  assign fragmenter_auto_in_a_bits_address = auto_fragmenter_in_a_bits_address; 
  assign fragmenter_auto_in_a_bits_mask = auto_fragmenter_in_a_bits_mask; 
  assign fragmenter_auto_in_a_bits_data = auto_fragmenter_in_a_bits_data; 
  assign fragmenter_auto_in_a_bits_corrupt = auto_fragmenter_in_a_bits_corrupt; 
  assign fragmenter_auto_in_d_ready = auto_fragmenter_in_d_ready; 
  assign fragmenter_auto_out_a_ready = auto_control_xing_out_a_ready; 
  assign fragmenter_auto_out_d_valid = auto_control_xing_out_d_valid; 
  assign fragmenter_auto_out_d_bits_opcode = auto_control_xing_out_d_bits_opcode; 
  assign fragmenter_auto_out_d_bits_size = auto_control_xing_out_d_bits_size; 
  assign fragmenter_auto_out_d_bits_source = auto_control_xing_out_d_bits_source; 
  assign fragmenter_auto_out_d_bits_data = auto_control_xing_out_d_bits_data; 
endmodule
