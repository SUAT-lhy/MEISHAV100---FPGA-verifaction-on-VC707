module SimpleLazyModule_1( 
  input         clock, 
  input         reset, 
  output        auto_widget_in_a_ready, 
  input         auto_widget_in_a_valid, 
  input  [2:0]  auto_widget_in_a_bits_opcode, 
  input  [2:0]  auto_widget_in_a_bits_param, 
  input  [2:0]  auto_widget_in_a_bits_size, 
  input  [4:0]  auto_widget_in_a_bits_source, 
  input  [30:0] auto_widget_in_a_bits_address, 
  input  [7:0]  auto_widget_in_a_bits_mask, 
  input  [63:0] auto_widget_in_a_bits_data, 
  input         auto_widget_in_a_bits_corrupt, 
  input         auto_widget_in_d_ready, 
  output        auto_widget_in_d_valid, 
  output [2:0]  auto_widget_in_d_bits_opcode, 
  output [1:0]  auto_widget_in_d_bits_param, 
  output [2:0]  auto_widget_in_d_bits_size, 
  output [4:0]  auto_widget_in_d_bits_source, 
  output        auto_widget_in_d_bits_sink, 
  output        auto_widget_in_d_bits_denied, 
  output [63:0] auto_widget_in_d_bits_data, 
  output        auto_widget_in_d_bits_corrupt, 
  input         auto_from_cbus_out_a_ready, 
  output        auto_from_cbus_out_a_valid, 
  output [2:0]  auto_from_cbus_out_a_bits_opcode, 
  output [2:0]  auto_from_cbus_out_a_bits_param, 
  output [2:0]  auto_from_cbus_out_a_bits_size, 
  output [4:0]  auto_from_cbus_out_a_bits_source, 
  output [30:0] auto_from_cbus_out_a_bits_address, 
  output [7:0]  auto_from_cbus_out_a_bits_mask, 
  output [63:0] auto_from_cbus_out_a_bits_data, 
  output        auto_from_cbus_out_a_bits_corrupt, 
  output        auto_from_cbus_out_d_ready, 
  input         auto_from_cbus_out_d_valid, 
  input  [2:0]  auto_from_cbus_out_d_bits_opcode, 
  input  [1:0]  auto_from_cbus_out_d_bits_param, 
  input  [2:0]  auto_from_cbus_out_d_bits_size, 
  input  [4:0]  auto_from_cbus_out_d_bits_source, 
  input         auto_from_cbus_out_d_bits_sink, 
  input         auto_from_cbus_out_d_bits_denied, 
  input  [63:0] auto_from_cbus_out_d_bits_data, 
  input         auto_from_cbus_out_d_bits_corrupt 
);
  wire  widget_clock; 
  wire  widget_reset; 
  wire  widget_auto_in_a_ready; 
  wire  widget_auto_in_a_valid; 
  wire [2:0] widget_auto_in_a_bits_opcode; 
  wire [2:0] widget_auto_in_a_bits_param; 
  wire [2:0] widget_auto_in_a_bits_size; 
  wire [4:0] widget_auto_in_a_bits_source; 
  wire [30:0] widget_auto_in_a_bits_address; 
  wire [7:0] widget_auto_in_a_bits_mask; 
  wire [63:0] widget_auto_in_a_bits_data; 
  wire  widget_auto_in_a_bits_corrupt; 
  wire  widget_auto_in_d_ready; 
  wire  widget_auto_in_d_valid; 
  wire [2:0] widget_auto_in_d_bits_opcode; 
  wire [1:0] widget_auto_in_d_bits_param; 
  wire [2:0] widget_auto_in_d_bits_size; 
  wire [4:0] widget_auto_in_d_bits_source; 
  wire  widget_auto_in_d_bits_sink; 
  wire  widget_auto_in_d_bits_denied; 
  wire [63:0] widget_auto_in_d_bits_data; 
  wire  widget_auto_in_d_bits_corrupt; 
  wire  widget_auto_out_a_ready; 
  wire  widget_auto_out_a_valid; 
  wire [2:0] widget_auto_out_a_bits_opcode; 
  wire [2:0] widget_auto_out_a_bits_param; 
  wire [2:0] widget_auto_out_a_bits_size; 
  wire [4:0] widget_auto_out_a_bits_source; 
  wire [30:0] widget_auto_out_a_bits_address; 
  wire [7:0] widget_auto_out_a_bits_mask; 
  wire [63:0] widget_auto_out_a_bits_data; 
  wire  widget_auto_out_a_bits_corrupt; 
  wire  widget_auto_out_d_ready; 
  wire  widget_auto_out_d_valid; 
  wire [2:0] widget_auto_out_d_bits_opcode; 
  wire [1:0] widget_auto_out_d_bits_param; 
  wire [2:0] widget_auto_out_d_bits_size; 
  wire [4:0] widget_auto_out_d_bits_source; 
  wire  widget_auto_out_d_bits_sink; 
  wire  widget_auto_out_d_bits_denied; 
  wire [63:0] widget_auto_out_d_bits_data; 
  wire  widget_auto_out_d_bits_corrupt; 
  TLWidthWidget widget ( 
    .clock(widget_clock),
    .reset(widget_reset),
    .auto_in_a_ready(widget_auto_in_a_ready),
    .auto_in_a_valid(widget_auto_in_a_valid),
    .auto_in_a_bits_opcode(widget_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(widget_auto_in_a_bits_param),
    .auto_in_a_bits_size(widget_auto_in_a_bits_size),
    .auto_in_a_bits_source(widget_auto_in_a_bits_source),
    .auto_in_a_bits_address(widget_auto_in_a_bits_address),
    .auto_in_a_bits_mask(widget_auto_in_a_bits_mask),
    .auto_in_a_bits_data(widget_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(widget_auto_in_a_bits_corrupt),
    .auto_in_d_ready(widget_auto_in_d_ready),
    .auto_in_d_valid(widget_auto_in_d_valid),
    .auto_in_d_bits_opcode(widget_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(widget_auto_in_d_bits_param),
    .auto_in_d_bits_size(widget_auto_in_d_bits_size),
    .auto_in_d_bits_source(widget_auto_in_d_bits_source),
    .auto_in_d_bits_sink(widget_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(widget_auto_in_d_bits_denied),
    .auto_in_d_bits_data(widget_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(widget_auto_in_d_bits_corrupt),
    .auto_out_a_ready(widget_auto_out_a_ready),
    .auto_out_a_valid(widget_auto_out_a_valid),
    .auto_out_a_bits_opcode(widget_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(widget_auto_out_a_bits_param),
    .auto_out_a_bits_size(widget_auto_out_a_bits_size),
    .auto_out_a_bits_source(widget_auto_out_a_bits_source),
    .auto_out_a_bits_address(widget_auto_out_a_bits_address),
    .auto_out_a_bits_mask(widget_auto_out_a_bits_mask),
    .auto_out_a_bits_data(widget_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(widget_auto_out_a_bits_corrupt),
    .auto_out_d_ready(widget_auto_out_d_ready),
    .auto_out_d_valid(widget_auto_out_d_valid),
    .auto_out_d_bits_opcode(widget_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(widget_auto_out_d_bits_param),
    .auto_out_d_bits_size(widget_auto_out_d_bits_size),
    .auto_out_d_bits_source(widget_auto_out_d_bits_source),
    .auto_out_d_bits_sink(widget_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(widget_auto_out_d_bits_denied),
    .auto_out_d_bits_data(widget_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(widget_auto_out_d_bits_corrupt)
  );
  assign auto_widget_in_a_ready = widget_auto_in_a_ready; 
  assign auto_widget_in_d_valid = widget_auto_in_d_valid; 
  assign auto_widget_in_d_bits_opcode = widget_auto_in_d_bits_opcode; 
  assign auto_widget_in_d_bits_param = widget_auto_in_d_bits_param; 
  assign auto_widget_in_d_bits_size = widget_auto_in_d_bits_size; 
  assign auto_widget_in_d_bits_source = widget_auto_in_d_bits_source; 
  assign auto_widget_in_d_bits_sink = widget_auto_in_d_bits_sink; 
  assign auto_widget_in_d_bits_denied = widget_auto_in_d_bits_denied; 
  assign auto_widget_in_d_bits_data = widget_auto_in_d_bits_data; 
  assign auto_widget_in_d_bits_corrupt = widget_auto_in_d_bits_corrupt; 
  assign auto_from_cbus_out_a_valid = widget_auto_out_a_valid; 
  assign auto_from_cbus_out_a_bits_opcode = widget_auto_out_a_bits_opcode; 
  assign auto_from_cbus_out_a_bits_param = widget_auto_out_a_bits_param; 
  assign auto_from_cbus_out_a_bits_size = widget_auto_out_a_bits_size; 
  assign auto_from_cbus_out_a_bits_source = widget_auto_out_a_bits_source; 
  assign auto_from_cbus_out_a_bits_address = widget_auto_out_a_bits_address; 
  assign auto_from_cbus_out_a_bits_mask = widget_auto_out_a_bits_mask; 
  assign auto_from_cbus_out_a_bits_data = widget_auto_out_a_bits_data; 
  assign auto_from_cbus_out_a_bits_corrupt = widget_auto_out_a_bits_corrupt; 
  assign auto_from_cbus_out_d_ready = widget_auto_out_d_ready; 
  assign widget_clock = clock; 
  assign widget_reset = reset; 
  assign widget_auto_in_a_valid = auto_widget_in_a_valid; 
  assign widget_auto_in_a_bits_opcode = auto_widget_in_a_bits_opcode; 
  assign widget_auto_in_a_bits_param = auto_widget_in_a_bits_param; 
  assign widget_auto_in_a_bits_size = auto_widget_in_a_bits_size; 
  assign widget_auto_in_a_bits_source = auto_widget_in_a_bits_source; 
  assign widget_auto_in_a_bits_address = auto_widget_in_a_bits_address; 
  assign widget_auto_in_a_bits_mask = auto_widget_in_a_bits_mask; 
  assign widget_auto_in_a_bits_data = auto_widget_in_a_bits_data; 
  assign widget_auto_in_a_bits_corrupt = auto_widget_in_a_bits_corrupt; 
  assign widget_auto_in_d_ready = auto_widget_in_d_ready; 
  assign widget_auto_out_a_ready = auto_from_cbus_out_a_ready; 
  assign widget_auto_out_d_valid = auto_from_cbus_out_d_valid; 
  assign widget_auto_out_d_bits_opcode = auto_from_cbus_out_d_bits_opcode; 
  assign widget_auto_out_d_bits_param = auto_from_cbus_out_d_bits_param; 
  assign widget_auto_out_d_bits_size = auto_from_cbus_out_d_bits_size; 
  assign widget_auto_out_d_bits_source = auto_from_cbus_out_d_bits_source; 
  assign widget_auto_out_d_bits_sink = auto_from_cbus_out_d_bits_sink; 
  assign widget_auto_out_d_bits_denied = auto_from_cbus_out_d_bits_denied; 
  assign widget_auto_out_d_bits_data = auto_from_cbus_out_d_bits_data; 
  assign widget_auto_out_d_bits_corrupt = auto_from_cbus_out_d_bits_corrupt; 
endmodule
