module SimpleLazyModule_25( 
  input         clock, 
  input         reset, 
  output        auto_binder_in_a_ready, 
  input         auto_binder_in_a_valid, 
  input  [2:0]  auto_binder_in_a_bits_opcode, 
  input  [2:0]  auto_binder_in_a_bits_param, 
  input  [2:0]  auto_binder_in_a_bits_size, 
  input  [6:0]  auto_binder_in_a_bits_source, 
  input  [31:0] auto_binder_in_a_bits_address, 
  input  [7:0]  auto_binder_in_a_bits_mask, 
  input  [63:0] auto_binder_in_a_bits_data, 
  input         auto_binder_in_a_bits_corrupt, 
  input         auto_binder_in_d_ready, 
  output        auto_binder_in_d_valid, 
  output [2:0]  auto_binder_in_d_bits_opcode, 
  output [1:0]  auto_binder_in_d_bits_param, 
  output [2:0]  auto_binder_in_d_bits_size, 
  output [6:0]  auto_binder_in_d_bits_source, 
  output        auto_binder_in_d_bits_sink, 
  output        auto_binder_in_d_bits_denied, 
  output [63:0] auto_binder_in_d_bits_data, 
  output        auto_binder_in_d_bits_corrupt, 
  input         auto_binder_out_a_ready, 
  output        auto_binder_out_a_valid, 
  output [2:0]  auto_binder_out_a_bits_opcode, 
  output [2:0]  auto_binder_out_a_bits_param, 
  output [2:0]  auto_binder_out_a_bits_size, 
  output [6:0]  auto_binder_out_a_bits_source, 
  output [31:0] auto_binder_out_a_bits_address, 
  output [7:0]  auto_binder_out_a_bits_mask, 
  output [63:0] auto_binder_out_a_bits_data, 
  output        auto_binder_out_a_bits_corrupt, 
  output        auto_binder_out_d_ready, 
  input         auto_binder_out_d_valid, 
  input  [2:0]  auto_binder_out_d_bits_opcode, 
  input  [1:0]  auto_binder_out_d_bits_param, 
  input  [2:0]  auto_binder_out_d_bits_size, 
  input  [6:0]  auto_binder_out_d_bits_source, 
  input         auto_binder_out_d_bits_sink, 
  input         auto_binder_out_d_bits_denied, 
  input  [63:0] auto_binder_out_d_bits_data, 
  input         auto_binder_out_d_bits_corrupt 
);
  wire  binder_clock; 
  wire  binder_reset; 
  wire  binder_auto_in_a_ready; 
  wire  binder_auto_in_a_valid; 
  wire [2:0] binder_auto_in_a_bits_opcode; 
  wire [2:0] binder_auto_in_a_bits_param; 
  wire [2:0] binder_auto_in_a_bits_size; 
  wire [6:0] binder_auto_in_a_bits_source; 
  wire [31:0] binder_auto_in_a_bits_address; 
  wire [7:0] binder_auto_in_a_bits_mask; 
  wire [63:0] binder_auto_in_a_bits_data; 
  wire  binder_auto_in_a_bits_corrupt; 
  wire  binder_auto_in_d_ready; 
  wire  binder_auto_in_d_valid; 
  wire [2:0] binder_auto_in_d_bits_opcode; 
  wire [1:0] binder_auto_in_d_bits_param; 
  wire [2:0] binder_auto_in_d_bits_size; 
  wire [6:0] binder_auto_in_d_bits_source; 
  wire  binder_auto_in_d_bits_sink; 
  wire  binder_auto_in_d_bits_denied; 
  wire [63:0] binder_auto_in_d_bits_data; 
  wire  binder_auto_in_d_bits_corrupt; 
  wire  binder_auto_out_a_ready; 
  wire  binder_auto_out_a_valid; 
  wire [2:0] binder_auto_out_a_bits_opcode; 
  wire [2:0] binder_auto_out_a_bits_param; 
  wire [2:0] binder_auto_out_a_bits_size; 
  wire [6:0] binder_auto_out_a_bits_source; 
  wire [31:0] binder_auto_out_a_bits_address; 
  wire [7:0] binder_auto_out_a_bits_mask; 
  wire [63:0] binder_auto_out_a_bits_data; 
  wire  binder_auto_out_a_bits_corrupt; 
  wire  binder_auto_out_d_ready; 
  wire  binder_auto_out_d_valid; 
  wire [2:0] binder_auto_out_d_bits_opcode; 
  wire [1:0] binder_auto_out_d_bits_param; 
  wire [2:0] binder_auto_out_d_bits_size; 
  wire [6:0] binder_auto_out_d_bits_source; 
  wire  binder_auto_out_d_bits_sink; 
  wire  binder_auto_out_d_bits_denied; 
  wire [63:0] binder_auto_out_d_bits_data; 
  wire  binder_auto_out_d_bits_corrupt; 
  BankBinder binder ( 
    .clock(binder_clock),
    .reset(binder_reset),
    .auto_in_a_ready(binder_auto_in_a_ready),
    .auto_in_a_valid(binder_auto_in_a_valid),
    .auto_in_a_bits_opcode(binder_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(binder_auto_in_a_bits_param),
    .auto_in_a_bits_size(binder_auto_in_a_bits_size),
    .auto_in_a_bits_source(binder_auto_in_a_bits_source),
    .auto_in_a_bits_address(binder_auto_in_a_bits_address),
    .auto_in_a_bits_mask(binder_auto_in_a_bits_mask),
    .auto_in_a_bits_data(binder_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(binder_auto_in_a_bits_corrupt),
    .auto_in_d_ready(binder_auto_in_d_ready),
    .auto_in_d_valid(binder_auto_in_d_valid),
    .auto_in_d_bits_opcode(binder_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(binder_auto_in_d_bits_param),
    .auto_in_d_bits_size(binder_auto_in_d_bits_size),
    .auto_in_d_bits_source(binder_auto_in_d_bits_source),
    .auto_in_d_bits_sink(binder_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(binder_auto_in_d_bits_denied),
    .auto_in_d_bits_data(binder_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(binder_auto_in_d_bits_corrupt),
    .auto_out_a_ready(binder_auto_out_a_ready),
    .auto_out_a_valid(binder_auto_out_a_valid),
    .auto_out_a_bits_opcode(binder_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(binder_auto_out_a_bits_param),
    .auto_out_a_bits_size(binder_auto_out_a_bits_size),
    .auto_out_a_bits_source(binder_auto_out_a_bits_source),
    .auto_out_a_bits_address(binder_auto_out_a_bits_address),
    .auto_out_a_bits_mask(binder_auto_out_a_bits_mask),
    .auto_out_a_bits_data(binder_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(binder_auto_out_a_bits_corrupt),
    .auto_out_d_ready(binder_auto_out_d_ready),
    .auto_out_d_valid(binder_auto_out_d_valid),
    .auto_out_d_bits_opcode(binder_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(binder_auto_out_d_bits_param),
    .auto_out_d_bits_size(binder_auto_out_d_bits_size),
    .auto_out_d_bits_source(binder_auto_out_d_bits_source),
    .auto_out_d_bits_sink(binder_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(binder_auto_out_d_bits_denied),
    .auto_out_d_bits_data(binder_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(binder_auto_out_d_bits_corrupt)
  );
  assign auto_binder_in_a_ready = binder_auto_in_a_ready; 
  assign auto_binder_in_d_valid = binder_auto_in_d_valid; 
  assign auto_binder_in_d_bits_opcode = binder_auto_in_d_bits_opcode; 
  assign auto_binder_in_d_bits_param = binder_auto_in_d_bits_param; 
  assign auto_binder_in_d_bits_size = binder_auto_in_d_bits_size; 
  assign auto_binder_in_d_bits_source = binder_auto_in_d_bits_source; 
  assign auto_binder_in_d_bits_sink = binder_auto_in_d_bits_sink; 
  assign auto_binder_in_d_bits_denied = binder_auto_in_d_bits_denied; 
  assign auto_binder_in_d_bits_data = binder_auto_in_d_bits_data; 
  assign auto_binder_in_d_bits_corrupt = binder_auto_in_d_bits_corrupt; 
  assign auto_binder_out_a_valid = binder_auto_out_a_valid; 
  assign auto_binder_out_a_bits_opcode = binder_auto_out_a_bits_opcode; 
  assign auto_binder_out_a_bits_param = binder_auto_out_a_bits_param; 
  assign auto_binder_out_a_bits_size = binder_auto_out_a_bits_size; 
  assign auto_binder_out_a_bits_source = binder_auto_out_a_bits_source; 
  assign auto_binder_out_a_bits_address = binder_auto_out_a_bits_address; 
  assign auto_binder_out_a_bits_mask = binder_auto_out_a_bits_mask; 
  assign auto_binder_out_a_bits_data = binder_auto_out_a_bits_data; 
  assign auto_binder_out_a_bits_corrupt = binder_auto_out_a_bits_corrupt; 
  assign auto_binder_out_d_ready = binder_auto_out_d_ready; 
  assign binder_clock = clock; 
  assign binder_reset = reset; 
  assign binder_auto_in_a_valid = auto_binder_in_a_valid; 
  assign binder_auto_in_a_bits_opcode = auto_binder_in_a_bits_opcode; 
  assign binder_auto_in_a_bits_param = auto_binder_in_a_bits_param; 
  assign binder_auto_in_a_bits_size = auto_binder_in_a_bits_size; 
  assign binder_auto_in_a_bits_source = auto_binder_in_a_bits_source; 
  assign binder_auto_in_a_bits_address = auto_binder_in_a_bits_address; 
  assign binder_auto_in_a_bits_mask = auto_binder_in_a_bits_mask; 
  assign binder_auto_in_a_bits_data = auto_binder_in_a_bits_data; 
  assign binder_auto_in_a_bits_corrupt = auto_binder_in_a_bits_corrupt; 
  assign binder_auto_in_d_ready = auto_binder_in_d_ready; 
  assign binder_auto_out_a_ready = auto_binder_out_a_ready; 
  assign binder_auto_out_d_valid = auto_binder_out_d_valid; 
  assign binder_auto_out_d_bits_opcode = auto_binder_out_d_bits_opcode; 
  assign binder_auto_out_d_bits_param = auto_binder_out_d_bits_param; 
  assign binder_auto_out_d_bits_size = auto_binder_out_d_bits_size; 
  assign binder_auto_out_d_bits_source = auto_binder_out_d_bits_source; 
  assign binder_auto_out_d_bits_sink = auto_binder_out_d_bits_sink; 
  assign binder_auto_out_d_bits_denied = auto_binder_out_d_bits_denied; 
  assign binder_auto_out_d_bits_data = auto_binder_out_d_bits_data; 
  assign binder_auto_out_d_bits_corrupt = auto_binder_out_d_bits_corrupt; 
endmodule
