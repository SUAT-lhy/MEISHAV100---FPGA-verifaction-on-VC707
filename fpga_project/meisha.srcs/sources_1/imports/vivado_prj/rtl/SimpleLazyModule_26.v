module SimpleLazyModule_26( 
  input         clock, 
  input         reset, 
  output        auto_picker_in_a_ready, 
  input         auto_picker_in_a_valid, 
  input  [2:0]  auto_picker_in_a_bits_opcode, 
  input  [2:0]  auto_picker_in_a_bits_param, 
  input  [2:0]  auto_picker_in_a_bits_size, 
  input  [6:0]  auto_picker_in_a_bits_source, 
  input  [31:0] auto_picker_in_a_bits_address, 
  input  [7:0]  auto_picker_in_a_bits_mask, 
  input  [63:0] auto_picker_in_a_bits_data, 
  input         auto_picker_in_a_bits_corrupt, 
  input         auto_picker_in_d_ready, 
  output        auto_picker_in_d_valid, 
  output [2:0]  auto_picker_in_d_bits_opcode, 
  output [1:0]  auto_picker_in_d_bits_param, 
  output [2:0]  auto_picker_in_d_bits_size, 
  output [6:0]  auto_picker_in_d_bits_source, 
  output        auto_picker_in_d_bits_sink, 
  output        auto_picker_in_d_bits_denied, 
  output [63:0] auto_picker_in_d_bits_data, 
  output        auto_picker_in_d_bits_corrupt, 
  input         auto_xilinxvc707mig_out_a_ready, 
  output        auto_xilinxvc707mig_out_a_valid, 
  output [2:0]  auto_xilinxvc707mig_out_a_bits_opcode, 
  output [2:0]  auto_xilinxvc707mig_out_a_bits_param, 
  output [2:0]  auto_xilinxvc707mig_out_a_bits_size, 
  output [6:0]  auto_xilinxvc707mig_out_a_bits_source, 
  output [31:0] auto_xilinxvc707mig_out_a_bits_address, 
  output [7:0]  auto_xilinxvc707mig_out_a_bits_mask, 
  output [63:0] auto_xilinxvc707mig_out_a_bits_data, 
  output        auto_xilinxvc707mig_out_a_bits_corrupt, 
  output        auto_xilinxvc707mig_out_d_ready, 
  input         auto_xilinxvc707mig_out_d_valid, 
  input  [2:0]  auto_xilinxvc707mig_out_d_bits_opcode, 
  input  [1:0]  auto_xilinxvc707mig_out_d_bits_param, 
  input  [2:0]  auto_xilinxvc707mig_out_d_bits_size, 
  input  [6:0]  auto_xilinxvc707mig_out_d_bits_source, 
  input         auto_xilinxvc707mig_out_d_bits_sink, 
  input         auto_xilinxvc707mig_out_d_bits_denied, 
  input  [63:0] auto_xilinxvc707mig_out_d_bits_data, 
  input         auto_xilinxvc707mig_out_d_bits_corrupt 
);
  wire  buffer_clock; 
  wire  buffer_reset; 
  wire  buffer_auto_in_a_ready; 
  wire  buffer_auto_in_a_valid; 
  wire [2:0] buffer_auto_in_a_bits_opcode; 
  wire [2:0] buffer_auto_in_a_bits_param; 
  wire [2:0] buffer_auto_in_a_bits_size; 
  wire [6:0] buffer_auto_in_a_bits_source; 
  wire [31:0] buffer_auto_in_a_bits_address; 
  wire [7:0] buffer_auto_in_a_bits_mask; 
  wire [63:0] buffer_auto_in_a_bits_data; 
  wire  buffer_auto_in_a_bits_corrupt; 
  wire  buffer_auto_in_d_ready; 
  wire  buffer_auto_in_d_valid; 
  wire [2:0] buffer_auto_in_d_bits_opcode; 
  wire [1:0] buffer_auto_in_d_bits_param; 
  wire [2:0] buffer_auto_in_d_bits_size; 
  wire [6:0] buffer_auto_in_d_bits_source; 
  wire  buffer_auto_in_d_bits_sink; 
  wire  buffer_auto_in_d_bits_denied; 
  wire [63:0] buffer_auto_in_d_bits_data; 
  wire  buffer_auto_in_d_bits_corrupt; 
  wire  buffer_auto_out_a_ready; 
  wire  buffer_auto_out_a_valid; 
  wire [2:0] buffer_auto_out_a_bits_opcode; 
  wire [2:0] buffer_auto_out_a_bits_param; 
  wire [2:0] buffer_auto_out_a_bits_size; 
  wire [6:0] buffer_auto_out_a_bits_source; 
  wire [31:0] buffer_auto_out_a_bits_address; 
  wire [7:0] buffer_auto_out_a_bits_mask; 
  wire [63:0] buffer_auto_out_a_bits_data; 
  wire  buffer_auto_out_a_bits_corrupt; 
  wire  buffer_auto_out_d_ready; 
  wire  buffer_auto_out_d_valid; 
  wire [2:0] buffer_auto_out_d_bits_opcode; 
  wire [1:0] buffer_auto_out_d_bits_param; 
  wire [2:0] buffer_auto_out_d_bits_size; 
  wire [6:0] buffer_auto_out_d_bits_source; 
  wire  buffer_auto_out_d_bits_sink; 
  wire  buffer_auto_out_d_bits_denied; 
  wire [63:0] buffer_auto_out_d_bits_data; 
  wire  buffer_auto_out_d_bits_corrupt; 
  wire  picker_clock; 
  wire  picker_reset; 
  wire  picker_auto_in_a_ready; 
  wire  picker_auto_in_a_valid; 
  wire [2:0] picker_auto_in_a_bits_opcode; 
  wire [2:0] picker_auto_in_a_bits_param; 
  wire [2:0] picker_auto_in_a_bits_size; 
  wire [6:0] picker_auto_in_a_bits_source; 
  wire [31:0] picker_auto_in_a_bits_address; 
  wire [7:0] picker_auto_in_a_bits_mask; 
  wire [63:0] picker_auto_in_a_bits_data; 
  wire  picker_auto_in_a_bits_corrupt; 
  wire  picker_auto_in_d_ready; 
  wire  picker_auto_in_d_valid; 
  wire [2:0] picker_auto_in_d_bits_opcode; 
  wire [1:0] picker_auto_in_d_bits_param; 
  wire [2:0] picker_auto_in_d_bits_size; 
  wire [6:0] picker_auto_in_d_bits_source; 
  wire  picker_auto_in_d_bits_sink; 
  wire  picker_auto_in_d_bits_denied; 
  wire [63:0] picker_auto_in_d_bits_data; 
  wire  picker_auto_in_d_bits_corrupt; 
  wire  picker_auto_out_a_ready; 
  wire  picker_auto_out_a_valid; 
  wire [2:0] picker_auto_out_a_bits_opcode; 
  wire [2:0] picker_auto_out_a_bits_param; 
  wire [2:0] picker_auto_out_a_bits_size; 
  wire [6:0] picker_auto_out_a_bits_source; 
  wire [31:0] picker_auto_out_a_bits_address; 
  wire [7:0] picker_auto_out_a_bits_mask; 
  wire [63:0] picker_auto_out_a_bits_data; 
  wire  picker_auto_out_a_bits_corrupt; 
  wire  picker_auto_out_d_ready; 
  wire  picker_auto_out_d_valid; 
  wire [2:0] picker_auto_out_d_bits_opcode; 
  wire [1:0] picker_auto_out_d_bits_param; 
  wire [2:0] picker_auto_out_d_bits_size; 
  wire [6:0] picker_auto_out_d_bits_source; 
  wire  picker_auto_out_d_bits_sink; 
  wire  picker_auto_out_d_bits_denied; 
  wire [63:0] picker_auto_out_d_bits_data; 
  wire  picker_auto_out_d_bits_corrupt; 
  TLBuffer_22 buffer ( 
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
    .auto_in_a_bits_data(buffer_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(buffer_auto_in_a_bits_corrupt),
    .auto_in_d_ready(buffer_auto_in_d_ready),
    .auto_in_d_valid(buffer_auto_in_d_valid),
    .auto_in_d_bits_opcode(buffer_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(buffer_auto_in_d_bits_param),
    .auto_in_d_bits_size(buffer_auto_in_d_bits_size),
    .auto_in_d_bits_source(buffer_auto_in_d_bits_source),
    .auto_in_d_bits_sink(buffer_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(buffer_auto_in_d_bits_denied),
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
    .auto_out_a_bits_data(buffer_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(buffer_auto_out_a_bits_corrupt),
    .auto_out_d_ready(buffer_auto_out_d_ready),
    .auto_out_d_valid(buffer_auto_out_d_valid),
    .auto_out_d_bits_opcode(buffer_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(buffer_auto_out_d_bits_param),
    .auto_out_d_bits_size(buffer_auto_out_d_bits_size),
    .auto_out_d_bits_source(buffer_auto_out_d_bits_source),
    .auto_out_d_bits_sink(buffer_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(buffer_auto_out_d_bits_denied),
    .auto_out_d_bits_data(buffer_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(buffer_auto_out_d_bits_corrupt)
  );
  ProbePicker picker ( 
    .clock(picker_clock),
    .reset(picker_reset),
    .auto_in_a_ready(picker_auto_in_a_ready),
    .auto_in_a_valid(picker_auto_in_a_valid),
    .auto_in_a_bits_opcode(picker_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(picker_auto_in_a_bits_param),
    .auto_in_a_bits_size(picker_auto_in_a_bits_size),
    .auto_in_a_bits_source(picker_auto_in_a_bits_source),
    .auto_in_a_bits_address(picker_auto_in_a_bits_address),
    .auto_in_a_bits_mask(picker_auto_in_a_bits_mask),
    .auto_in_a_bits_data(picker_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(picker_auto_in_a_bits_corrupt),
    .auto_in_d_ready(picker_auto_in_d_ready),
    .auto_in_d_valid(picker_auto_in_d_valid),
    .auto_in_d_bits_opcode(picker_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(picker_auto_in_d_bits_param),
    .auto_in_d_bits_size(picker_auto_in_d_bits_size),
    .auto_in_d_bits_source(picker_auto_in_d_bits_source),
    .auto_in_d_bits_sink(picker_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(picker_auto_in_d_bits_denied),
    .auto_in_d_bits_data(picker_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(picker_auto_in_d_bits_corrupt),
    .auto_out_a_ready(picker_auto_out_a_ready),
    .auto_out_a_valid(picker_auto_out_a_valid),
    .auto_out_a_bits_opcode(picker_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(picker_auto_out_a_bits_param),
    .auto_out_a_bits_size(picker_auto_out_a_bits_size),
    .auto_out_a_bits_source(picker_auto_out_a_bits_source),
    .auto_out_a_bits_address(picker_auto_out_a_bits_address),
    .auto_out_a_bits_mask(picker_auto_out_a_bits_mask),
    .auto_out_a_bits_data(picker_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(picker_auto_out_a_bits_corrupt),
    .auto_out_d_ready(picker_auto_out_d_ready),
    .auto_out_d_valid(picker_auto_out_d_valid),
    .auto_out_d_bits_opcode(picker_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(picker_auto_out_d_bits_param),
    .auto_out_d_bits_size(picker_auto_out_d_bits_size),
    .auto_out_d_bits_source(picker_auto_out_d_bits_source),
    .auto_out_d_bits_sink(picker_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(picker_auto_out_d_bits_denied),
    .auto_out_d_bits_data(picker_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(picker_auto_out_d_bits_corrupt)
  );
  assign auto_picker_in_a_ready = picker_auto_in_a_ready; 
  assign auto_picker_in_d_valid = picker_auto_in_d_valid; 
  assign auto_picker_in_d_bits_opcode = picker_auto_in_d_bits_opcode; 
  assign auto_picker_in_d_bits_param = picker_auto_in_d_bits_param; 
  assign auto_picker_in_d_bits_size = picker_auto_in_d_bits_size; 
  assign auto_picker_in_d_bits_source = picker_auto_in_d_bits_source; 
  assign auto_picker_in_d_bits_sink = picker_auto_in_d_bits_sink; 
  assign auto_picker_in_d_bits_denied = picker_auto_in_d_bits_denied; 
  assign auto_picker_in_d_bits_data = picker_auto_in_d_bits_data; 
  assign auto_picker_in_d_bits_corrupt = picker_auto_in_d_bits_corrupt; 
  assign auto_xilinxvc707mig_out_a_valid = buffer_auto_out_a_valid; 
  assign auto_xilinxvc707mig_out_a_bits_opcode = buffer_auto_out_a_bits_opcode; 
  assign auto_xilinxvc707mig_out_a_bits_param = buffer_auto_out_a_bits_param; 
  assign auto_xilinxvc707mig_out_a_bits_size = buffer_auto_out_a_bits_size; 
  assign auto_xilinxvc707mig_out_a_bits_source = buffer_auto_out_a_bits_source; 
  assign auto_xilinxvc707mig_out_a_bits_address = buffer_auto_out_a_bits_address; 
  assign auto_xilinxvc707mig_out_a_bits_mask = buffer_auto_out_a_bits_mask; 
  assign auto_xilinxvc707mig_out_a_bits_data = buffer_auto_out_a_bits_data; 
  assign auto_xilinxvc707mig_out_a_bits_corrupt = buffer_auto_out_a_bits_corrupt; 
  assign auto_xilinxvc707mig_out_d_ready = buffer_auto_out_d_ready; 
  assign buffer_clock = clock; 
  assign buffer_reset = reset; 
  assign buffer_auto_in_a_valid = picker_auto_out_a_valid; 
  assign buffer_auto_in_a_bits_opcode = picker_auto_out_a_bits_opcode; 
  assign buffer_auto_in_a_bits_param = picker_auto_out_a_bits_param; 
  assign buffer_auto_in_a_bits_size = picker_auto_out_a_bits_size; 
  assign buffer_auto_in_a_bits_source = picker_auto_out_a_bits_source; 
  assign buffer_auto_in_a_bits_address = picker_auto_out_a_bits_address; 
  assign buffer_auto_in_a_bits_mask = picker_auto_out_a_bits_mask; 
  assign buffer_auto_in_a_bits_data = picker_auto_out_a_bits_data; 
  assign buffer_auto_in_a_bits_corrupt = picker_auto_out_a_bits_corrupt; 
  assign buffer_auto_in_d_ready = picker_auto_out_d_ready; 
  assign buffer_auto_out_a_ready = auto_xilinxvc707mig_out_a_ready; 
  assign buffer_auto_out_d_valid = auto_xilinxvc707mig_out_d_valid; 
  assign buffer_auto_out_d_bits_opcode = auto_xilinxvc707mig_out_d_bits_opcode; 
  assign buffer_auto_out_d_bits_param = auto_xilinxvc707mig_out_d_bits_param; 
  assign buffer_auto_out_d_bits_size = auto_xilinxvc707mig_out_d_bits_size; 
  assign buffer_auto_out_d_bits_source = auto_xilinxvc707mig_out_d_bits_source; 
  assign buffer_auto_out_d_bits_sink = auto_xilinxvc707mig_out_d_bits_sink; 
  assign buffer_auto_out_d_bits_denied = auto_xilinxvc707mig_out_d_bits_denied; 
  assign buffer_auto_out_d_bits_data = auto_xilinxvc707mig_out_d_bits_data; 
  assign buffer_auto_out_d_bits_corrupt = auto_xilinxvc707mig_out_d_bits_corrupt; 
  assign picker_clock = clock; 
  assign picker_reset = reset; 
  assign picker_auto_in_a_valid = auto_picker_in_a_valid; 
  assign picker_auto_in_a_bits_opcode = auto_picker_in_a_bits_opcode; 
  assign picker_auto_in_a_bits_param = auto_picker_in_a_bits_param; 
  assign picker_auto_in_a_bits_size = auto_picker_in_a_bits_size; 
  assign picker_auto_in_a_bits_source = auto_picker_in_a_bits_source; 
  assign picker_auto_in_a_bits_address = auto_picker_in_a_bits_address; 
  assign picker_auto_in_a_bits_mask = auto_picker_in_a_bits_mask; 
  assign picker_auto_in_a_bits_data = auto_picker_in_a_bits_data; 
  assign picker_auto_in_a_bits_corrupt = auto_picker_in_a_bits_corrupt; 
  assign picker_auto_in_d_ready = auto_picker_in_d_ready; 
  assign picker_auto_out_a_ready = buffer_auto_in_a_ready; 
  assign picker_auto_out_d_valid = buffer_auto_in_d_valid; 
  assign picker_auto_out_d_bits_opcode = buffer_auto_in_d_bits_opcode; 
  assign picker_auto_out_d_bits_param = buffer_auto_in_d_bits_param; 
  assign picker_auto_out_d_bits_size = buffer_auto_in_d_bits_size; 
  assign picker_auto_out_d_bits_source = buffer_auto_in_d_bits_source; 
  assign picker_auto_out_d_bits_sink = buffer_auto_in_d_bits_sink; 
  assign picker_auto_out_d_bits_denied = buffer_auto_in_d_bits_denied; 
  assign picker_auto_out_d_bits_data = buffer_auto_in_d_bits_data; 
  assign picker_auto_out_d_bits_corrupt = buffer_auto_in_d_bits_corrupt; 
endmodule
