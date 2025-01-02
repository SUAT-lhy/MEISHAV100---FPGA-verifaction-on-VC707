module SimpleLazyModule_9( 
  input         clock, 
  input         reset, 
  output        auto_buffer_in_a_ready, 
  input         auto_buffer_in_a_valid, 
  input  [2:0]  auto_buffer_in_a_bits_opcode, 
  input  [2:0]  auto_buffer_in_a_bits_param, 
  input  [2:0]  auto_buffer_in_a_bits_size, 
  input  [4:0]  auto_buffer_in_a_bits_source, 
  input  [16:0] auto_buffer_in_a_bits_address, 
  input  [7:0]  auto_buffer_in_a_bits_mask, 
  input         auto_buffer_in_a_bits_corrupt, 
  input         auto_buffer_in_d_ready, 
  output        auto_buffer_in_d_valid, 
  output [2:0]  auto_buffer_in_d_bits_size, 
  output [4:0]  auto_buffer_in_d_bits_source, 
  output [63:0] auto_buffer_in_d_bits_data, 
  output        auto_buffer_in_d_bits_corrupt, 
  input         auto_fragmenter_out_a_ready, 
  output        auto_fragmenter_out_a_valid, 
  output [2:0]  auto_fragmenter_out_a_bits_opcode, 
  output [2:0]  auto_fragmenter_out_a_bits_param, 
  output [1:0]  auto_fragmenter_out_a_bits_size, 
  output [9:0]  auto_fragmenter_out_a_bits_source, 
  output [16:0] auto_fragmenter_out_a_bits_address, 
  output [3:0]  auto_fragmenter_out_a_bits_mask, 
  output        auto_fragmenter_out_a_bits_corrupt, 
  output        auto_fragmenter_out_d_ready, 
  input         auto_fragmenter_out_d_valid, 
  input  [1:0]  auto_fragmenter_out_d_bits_size, 
  input  [9:0]  auto_fragmenter_out_d_bits_source, 
  input  [31:0] auto_fragmenter_out_d_bits_data 
);
  wire  fragmenter_clock; 
  wire  fragmenter_reset; 
  wire  fragmenter_auto_in_a_ready; 
  wire  fragmenter_auto_in_a_valid; 
  wire [2:0] fragmenter_auto_in_a_bits_opcode; 
  wire [2:0] fragmenter_auto_in_a_bits_param; 
  wire [2:0] fragmenter_auto_in_a_bits_size; 
  wire [4:0] fragmenter_auto_in_a_bits_source; 
  wire [16:0] fragmenter_auto_in_a_bits_address; 
  wire [3:0] fragmenter_auto_in_a_bits_mask; 
  wire  fragmenter_auto_in_a_bits_corrupt; 
  wire  fragmenter_auto_in_d_ready; 
  wire  fragmenter_auto_in_d_valid; 
  wire [2:0] fragmenter_auto_in_d_bits_size; 
  wire [4:0] fragmenter_auto_in_d_bits_source; 
  wire [31:0] fragmenter_auto_in_d_bits_data; 
  wire  fragmenter_auto_out_a_ready; 
  wire  fragmenter_auto_out_a_valid; 
  wire [2:0] fragmenter_auto_out_a_bits_opcode; 
  wire [2:0] fragmenter_auto_out_a_bits_param; 
  wire [1:0] fragmenter_auto_out_a_bits_size; 
  wire [9:0] fragmenter_auto_out_a_bits_source; 
  wire [16:0] fragmenter_auto_out_a_bits_address; 
  wire [3:0] fragmenter_auto_out_a_bits_mask; 
  wire  fragmenter_auto_out_a_bits_corrupt; 
  wire  fragmenter_auto_out_d_ready; 
  wire  fragmenter_auto_out_d_valid; 
  wire [1:0] fragmenter_auto_out_d_bits_size; 
  wire [9:0] fragmenter_auto_out_d_bits_source; 
  wire [31:0] fragmenter_auto_out_d_bits_data; 
  wire  widget_clock; 
  wire  widget_reset; 
  wire  widget_auto_in_a_ready; 
  wire  widget_auto_in_a_valid; 
  wire [2:0] widget_auto_in_a_bits_opcode; 
  wire [2:0] widget_auto_in_a_bits_param; 
  wire [2:0] widget_auto_in_a_bits_size; 
  wire [4:0] widget_auto_in_a_bits_source; 
  wire [16:0] widget_auto_in_a_bits_address; 
  wire [7:0] widget_auto_in_a_bits_mask; 
  wire  widget_auto_in_a_bits_corrupt; 
  wire  widget_auto_in_d_ready; 
  wire  widget_auto_in_d_valid; 
  wire [2:0] widget_auto_in_d_bits_size; 
  wire [4:0] widget_auto_in_d_bits_source; 
  wire [63:0] widget_auto_in_d_bits_data; 
  wire  widget_auto_in_d_bits_corrupt; 
  wire  widget_auto_out_a_ready; 
  wire  widget_auto_out_a_valid; 
  wire [2:0] widget_auto_out_a_bits_opcode; 
  wire [2:0] widget_auto_out_a_bits_param; 
  wire [2:0] widget_auto_out_a_bits_size; 
  wire [4:0] widget_auto_out_a_bits_source; 
  wire [16:0] widget_auto_out_a_bits_address; 
  wire [3:0] widget_auto_out_a_bits_mask; 
  wire  widget_auto_out_a_bits_corrupt; 
  wire  widget_auto_out_d_ready; 
  wire  widget_auto_out_d_valid; 
  wire [2:0] widget_auto_out_d_bits_size; 
  wire [4:0] widget_auto_out_d_bits_source; 
  wire [31:0] widget_auto_out_d_bits_data; 
  wire  buffer_clock; 
  wire  buffer_reset; 
  wire  buffer_auto_in_a_ready; 
  wire  buffer_auto_in_a_valid; 
  wire [2:0] buffer_auto_in_a_bits_opcode; 
  wire [2:0] buffer_auto_in_a_bits_param; 
  wire [2:0] buffer_auto_in_a_bits_size; 
  wire [4:0] buffer_auto_in_a_bits_source; 
  wire [16:0] buffer_auto_in_a_bits_address; 
  wire [7:0] buffer_auto_in_a_bits_mask; 
  wire  buffer_auto_in_a_bits_corrupt; 
  wire  buffer_auto_in_d_ready; 
  wire  buffer_auto_in_d_valid; 
  wire [2:0] buffer_auto_in_d_bits_size; 
  wire [4:0] buffer_auto_in_d_bits_source; 
  wire [63:0] buffer_auto_in_d_bits_data; 
  wire  buffer_auto_in_d_bits_corrupt; 
  wire  buffer_auto_out_a_ready; 
  wire  buffer_auto_out_a_valid; 
  wire [2:0] buffer_auto_out_a_bits_opcode; 
  wire [2:0] buffer_auto_out_a_bits_param; 
  wire [2:0] buffer_auto_out_a_bits_size; 
  wire [4:0] buffer_auto_out_a_bits_source; 
  wire [16:0] buffer_auto_out_a_bits_address; 
  wire [7:0] buffer_auto_out_a_bits_mask; 
  wire  buffer_auto_out_a_bits_corrupt; 
  wire  buffer_auto_out_d_ready; 
  wire  buffer_auto_out_d_valid; 
  wire [2:0] buffer_auto_out_d_bits_size; 
  wire [4:0] buffer_auto_out_d_bits_source; 
  wire [63:0] buffer_auto_out_d_bits_data; 
  wire  buffer_auto_out_d_bits_corrupt; 
  TLFragmenter_3 fragmenter ( 
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
    .auto_in_a_bits_corrupt(fragmenter_auto_in_a_bits_corrupt),
    .auto_in_d_ready(fragmenter_auto_in_d_ready),
    .auto_in_d_valid(fragmenter_auto_in_d_valid),
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
    .auto_out_a_bits_corrupt(fragmenter_auto_out_a_bits_corrupt),
    .auto_out_d_ready(fragmenter_auto_out_d_ready),
    .auto_out_d_valid(fragmenter_auto_out_d_valid),
    .auto_out_d_bits_size(fragmenter_auto_out_d_bits_size),
    .auto_out_d_bits_source(fragmenter_auto_out_d_bits_source),
    .auto_out_d_bits_data(fragmenter_auto_out_d_bits_data)
  );
  TLWidthWidget_1 widget ( 
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
    .auto_in_a_bits_corrupt(widget_auto_in_a_bits_corrupt),
    .auto_in_d_ready(widget_auto_in_d_ready),
    .auto_in_d_valid(widget_auto_in_d_valid),
    .auto_in_d_bits_size(widget_auto_in_d_bits_size),
    .auto_in_d_bits_source(widget_auto_in_d_bits_source),
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
    .auto_out_a_bits_corrupt(widget_auto_out_a_bits_corrupt),
    .auto_out_d_ready(widget_auto_out_d_ready),
    .auto_out_d_valid(widget_auto_out_d_valid),
    .auto_out_d_bits_size(widget_auto_out_d_bits_size),
    .auto_out_d_bits_source(widget_auto_out_d_bits_source),
    .auto_out_d_bits_data(widget_auto_out_d_bits_data)
  );
  TLBuffer_9 buffer ( 
    .clock(buffer_clock),
    .reset(buffer_reset),
    .auto_in_a_ready(buffer_auto_in_a_ready),
    .auto_in_a_valid(buffer_auto_in_a_valid),
    .auto_in_a_bits_opcode(buffer_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(buffer_auto_in_a_bits_param),
    .auto_in_a_bits_size(buffer_auto_in_a_bits_size),
    .auto_in_a_bits_source(buffer_auto_in_a_bits_source),
    .auto_in_a_bits_address(buffer_auto_in_a_bits_address),
    .auto_in_a_bits_mask(buffer_auto_in_a_bits_mask),
    .auto_in_a_bits_corrupt(buffer_auto_in_a_bits_corrupt),
    .auto_in_d_ready(buffer_auto_in_d_ready),
    .auto_in_d_valid(buffer_auto_in_d_valid),
    .auto_in_d_bits_size(buffer_auto_in_d_bits_size),
    .auto_in_d_bits_source(buffer_auto_in_d_bits_source),
    .auto_in_d_bits_data(buffer_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(buffer_auto_in_d_bits_corrupt),
    .auto_out_a_ready(buffer_auto_out_a_ready),
    .auto_out_a_valid(buffer_auto_out_a_valid),
    .auto_out_a_bits_opcode(buffer_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(buffer_auto_out_a_bits_param),
    .auto_out_a_bits_size(buffer_auto_out_a_bits_size),
    .auto_out_a_bits_source(buffer_auto_out_a_bits_source),
    .auto_out_a_bits_address(buffer_auto_out_a_bits_address),
    .auto_out_a_bits_mask(buffer_auto_out_a_bits_mask),
    .auto_out_a_bits_corrupt(buffer_auto_out_a_bits_corrupt),
    .auto_out_d_ready(buffer_auto_out_d_ready),
    .auto_out_d_valid(buffer_auto_out_d_valid),
    .auto_out_d_bits_size(buffer_auto_out_d_bits_size),
    .auto_out_d_bits_source(buffer_auto_out_d_bits_source),
    .auto_out_d_bits_data(buffer_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(buffer_auto_out_d_bits_corrupt)
  );
  assign auto_buffer_in_a_ready = buffer_auto_in_a_ready; 
  assign auto_buffer_in_d_valid = buffer_auto_in_d_valid; 
  assign auto_buffer_in_d_bits_size = buffer_auto_in_d_bits_size; 
  assign auto_buffer_in_d_bits_source = buffer_auto_in_d_bits_source; 
  assign auto_buffer_in_d_bits_data = buffer_auto_in_d_bits_data; 
  assign auto_buffer_in_d_bits_corrupt = buffer_auto_in_d_bits_corrupt; 
  assign auto_fragmenter_out_a_valid = fragmenter_auto_out_a_valid; 
  assign auto_fragmenter_out_a_bits_opcode = fragmenter_auto_out_a_bits_opcode; 
  assign auto_fragmenter_out_a_bits_param = fragmenter_auto_out_a_bits_param; 
  assign auto_fragmenter_out_a_bits_size = fragmenter_auto_out_a_bits_size; 
  assign auto_fragmenter_out_a_bits_source = fragmenter_auto_out_a_bits_source; 
  assign auto_fragmenter_out_a_bits_address = fragmenter_auto_out_a_bits_address; 
  assign auto_fragmenter_out_a_bits_mask = fragmenter_auto_out_a_bits_mask; 
  assign auto_fragmenter_out_a_bits_corrupt = fragmenter_auto_out_a_bits_corrupt; 
  assign auto_fragmenter_out_d_ready = fragmenter_auto_out_d_ready; 
  assign fragmenter_clock = clock; 
  assign fragmenter_reset = reset; 
  assign fragmenter_auto_in_a_valid = widget_auto_out_a_valid; 
  assign fragmenter_auto_in_a_bits_opcode = widget_auto_out_a_bits_opcode; 
  assign fragmenter_auto_in_a_bits_param = widget_auto_out_a_bits_param; 
  assign fragmenter_auto_in_a_bits_size = widget_auto_out_a_bits_size; 
  assign fragmenter_auto_in_a_bits_source = widget_auto_out_a_bits_source; 
  assign fragmenter_auto_in_a_bits_address = widget_auto_out_a_bits_address; 
  assign fragmenter_auto_in_a_bits_mask = widget_auto_out_a_bits_mask; 
  assign fragmenter_auto_in_a_bits_corrupt = widget_auto_out_a_bits_corrupt; 
  assign fragmenter_auto_in_d_ready = widget_auto_out_d_ready; 
  assign fragmenter_auto_out_a_ready = auto_fragmenter_out_a_ready; 
  assign fragmenter_auto_out_d_valid = auto_fragmenter_out_d_valid; 
  assign fragmenter_auto_out_d_bits_size = auto_fragmenter_out_d_bits_size; 
  assign fragmenter_auto_out_d_bits_source = auto_fragmenter_out_d_bits_source; 
  assign fragmenter_auto_out_d_bits_data = auto_fragmenter_out_d_bits_data; 
  assign widget_clock = clock; 
  assign widget_reset = reset; 
  assign widget_auto_in_a_valid = buffer_auto_out_a_valid; 
  assign widget_auto_in_a_bits_opcode = buffer_auto_out_a_bits_opcode; 
  assign widget_auto_in_a_bits_param = buffer_auto_out_a_bits_param; 
  assign widget_auto_in_a_bits_size = buffer_auto_out_a_bits_size; 
  assign widget_auto_in_a_bits_source = buffer_auto_out_a_bits_source; 
  assign widget_auto_in_a_bits_address = buffer_auto_out_a_bits_address; 
  assign widget_auto_in_a_bits_mask = buffer_auto_out_a_bits_mask; 
  assign widget_auto_in_a_bits_corrupt = buffer_auto_out_a_bits_corrupt; 
  assign widget_auto_in_d_ready = buffer_auto_out_d_ready; 
  assign widget_auto_out_a_ready = fragmenter_auto_in_a_ready; 
  assign widget_auto_out_d_valid = fragmenter_auto_in_d_valid; 
  assign widget_auto_out_d_bits_size = fragmenter_auto_in_d_bits_size; 
  assign widget_auto_out_d_bits_source = fragmenter_auto_in_d_bits_source; 
  assign widget_auto_out_d_bits_data = fragmenter_auto_in_d_bits_data; 
  assign buffer_clock = clock; 
  assign buffer_reset = reset; 
  assign buffer_auto_in_a_valid = auto_buffer_in_a_valid; 
  assign buffer_auto_in_a_bits_opcode = auto_buffer_in_a_bits_opcode; 
  assign buffer_auto_in_a_bits_param = auto_buffer_in_a_bits_param; 
  assign buffer_auto_in_a_bits_size = auto_buffer_in_a_bits_size; 
  assign buffer_auto_in_a_bits_source = auto_buffer_in_a_bits_source; 
  assign buffer_auto_in_a_bits_address = auto_buffer_in_a_bits_address; 
  assign buffer_auto_in_a_bits_mask = auto_buffer_in_a_bits_mask; 
  assign buffer_auto_in_a_bits_corrupt = auto_buffer_in_a_bits_corrupt; 
  assign buffer_auto_in_d_ready = auto_buffer_in_d_ready; 
  assign buffer_auto_out_a_ready = widget_auto_in_a_ready; 
  assign buffer_auto_out_d_valid = widget_auto_in_d_valid; 
  assign buffer_auto_out_d_bits_size = widget_auto_in_d_bits_size; 
  assign buffer_auto_out_d_bits_source = widget_auto_in_d_bits_source; 
  assign buffer_auto_out_d_bits_data = widget_auto_in_d_bits_data; 
  assign buffer_auto_out_d_bits_corrupt = widget_auto_in_d_bits_corrupt; 
endmodule
