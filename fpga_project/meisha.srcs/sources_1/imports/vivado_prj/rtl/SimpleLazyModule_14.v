module SimpleLazyModule_14( 
  input         clock, 
  input         reset, 
  input         auto_buffer_out_a_ready, 
  output        auto_buffer_out_a_valid, 
  output [2:0]  auto_buffer_out_a_bits_opcode, 
  output [2:0]  auto_buffer_out_a_bits_param, 
  output [2:0]  auto_buffer_out_a_bits_size, 
  output [1:0]  auto_buffer_out_a_bits_source, 
  output [37:0] auto_buffer_out_a_bits_address, 
  output [7:0]  auto_buffer_out_a_bits_mask, 
  output [63:0] auto_buffer_out_a_bits_data, 
  output        auto_buffer_out_a_bits_corrupt, 
  output        auto_buffer_out_b_ready, 
  input         auto_buffer_out_b_valid, 
  input  [2:0]  auto_buffer_out_b_bits_opcode, 
  input  [1:0]  auto_buffer_out_b_bits_param, 
  input  [2:0]  auto_buffer_out_b_bits_size, 
  input  [1:0]  auto_buffer_out_b_bits_source, 
  input  [37:0] auto_buffer_out_b_bits_address, 
  input  [7:0]  auto_buffer_out_b_bits_mask, 
  input         auto_buffer_out_b_bits_corrupt, 
  input         auto_buffer_out_c_ready, 
  output        auto_buffer_out_c_valid, 
  output [2:0]  auto_buffer_out_c_bits_opcode, 
  output [2:0]  auto_buffer_out_c_bits_param, 
  output [2:0]  auto_buffer_out_c_bits_size, 
  output [1:0]  auto_buffer_out_c_bits_source, 
  output [37:0] auto_buffer_out_c_bits_address, 
  output [63:0] auto_buffer_out_c_bits_data, 
  output        auto_buffer_out_c_bits_corrupt, 
  output        auto_buffer_out_d_ready, 
  input         auto_buffer_out_d_valid, 
  input  [2:0]  auto_buffer_out_d_bits_opcode, 
  input  [1:0]  auto_buffer_out_d_bits_param, 
  input  [2:0]  auto_buffer_out_d_bits_size, 
  input  [1:0]  auto_buffer_out_d_bits_source, 
  input  [2:0]  auto_buffer_out_d_bits_sink, 
  input         auto_buffer_out_d_bits_denied, 
  input  [63:0] auto_buffer_out_d_bits_data, 
  input         auto_buffer_out_d_bits_corrupt, 
  input         auto_buffer_out_e_ready, 
  output        auto_buffer_out_e_valid, 
  output [2:0]  auto_buffer_out_e_bits_sink, 
  output        auto_tl_master_xing_in_a_ready, 
  input         auto_tl_master_xing_in_a_valid, 
  input  [2:0]  auto_tl_master_xing_in_a_bits_opcode, 
  input  [2:0]  auto_tl_master_xing_in_a_bits_param, 
  input  [2:0]  auto_tl_master_xing_in_a_bits_size, 
  input  [1:0]  auto_tl_master_xing_in_a_bits_source, 
  input  [37:0] auto_tl_master_xing_in_a_bits_address, 
  input  [7:0]  auto_tl_master_xing_in_a_bits_mask, 
  input  [63:0] auto_tl_master_xing_in_a_bits_data, 
  input         auto_tl_master_xing_in_a_bits_corrupt, 
  input         auto_tl_master_xing_in_b_ready, 
  output        auto_tl_master_xing_in_b_valid, 
  output [2:0]  auto_tl_master_xing_in_b_bits_opcode, 
  output [1:0]  auto_tl_master_xing_in_b_bits_param, 
  output [2:0]  auto_tl_master_xing_in_b_bits_size, 
  output [1:0]  auto_tl_master_xing_in_b_bits_source, 
  output [37:0] auto_tl_master_xing_in_b_bits_address, 
  output [7:0]  auto_tl_master_xing_in_b_bits_mask, 
  output        auto_tl_master_xing_in_b_bits_corrupt, 
  output        auto_tl_master_xing_in_c_ready, 
  input         auto_tl_master_xing_in_c_valid, 
  input  [2:0]  auto_tl_master_xing_in_c_bits_opcode, 
  input  [2:0]  auto_tl_master_xing_in_c_bits_param, 
  input  [2:0]  auto_tl_master_xing_in_c_bits_size, 
  input  [1:0]  auto_tl_master_xing_in_c_bits_source, 
  input  [37:0] auto_tl_master_xing_in_c_bits_address, 
  input  [63:0] auto_tl_master_xing_in_c_bits_data, 
  input         auto_tl_master_xing_in_c_bits_corrupt, 
  input         auto_tl_master_xing_in_d_ready, 
  output        auto_tl_master_xing_in_d_valid, 
  output [2:0]  auto_tl_master_xing_in_d_bits_opcode, 
  output [1:0]  auto_tl_master_xing_in_d_bits_param, 
  output [2:0]  auto_tl_master_xing_in_d_bits_size, 
  output [1:0]  auto_tl_master_xing_in_d_bits_source, 
  output [2:0]  auto_tl_master_xing_in_d_bits_sink, 
  output        auto_tl_master_xing_in_d_bits_denied, 
  output [63:0] auto_tl_master_xing_in_d_bits_data, 
  output        auto_tl_master_xing_in_d_bits_corrupt, 
  output        auto_tl_master_xing_in_e_ready, 
  input         auto_tl_master_xing_in_e_valid, 
  input  [2:0]  auto_tl_master_xing_in_e_bits_sink 
);
  wire  buffer_clock; 
  wire  buffer_reset; 
  wire  buffer_auto_in_a_ready; 
  wire  buffer_auto_in_a_valid; 
  wire [2:0] buffer_auto_in_a_bits_opcode; 
  wire [2:0] buffer_auto_in_a_bits_param; 
  wire [2:0] buffer_auto_in_a_bits_size; 
  wire [1:0] buffer_auto_in_a_bits_source; 
  wire [37:0] buffer_auto_in_a_bits_address; 
  wire [7:0] buffer_auto_in_a_bits_mask; 
  wire [63:0] buffer_auto_in_a_bits_data; 
  wire  buffer_auto_in_a_bits_corrupt; 
  wire  buffer_auto_in_b_ready; 
  wire  buffer_auto_in_b_valid; 
  wire [2:0] buffer_auto_in_b_bits_opcode; 
  wire [1:0] buffer_auto_in_b_bits_param; 
  wire [2:0] buffer_auto_in_b_bits_size; 
  wire [1:0] buffer_auto_in_b_bits_source; 
  wire [37:0] buffer_auto_in_b_bits_address; 
  wire [7:0] buffer_auto_in_b_bits_mask; 
  wire  buffer_auto_in_b_bits_corrupt; 
  wire  buffer_auto_in_c_ready; 
  wire  buffer_auto_in_c_valid; 
  wire [2:0] buffer_auto_in_c_bits_opcode; 
  wire [2:0] buffer_auto_in_c_bits_param; 
  wire [2:0] buffer_auto_in_c_bits_size; 
  wire [1:0] buffer_auto_in_c_bits_source; 
  wire [37:0] buffer_auto_in_c_bits_address; 
  wire [63:0] buffer_auto_in_c_bits_data; 
  wire  buffer_auto_in_c_bits_corrupt; 
  wire  buffer_auto_in_d_ready; 
  wire  buffer_auto_in_d_valid; 
  wire [2:0] buffer_auto_in_d_bits_opcode; 
  wire [1:0] buffer_auto_in_d_bits_param; 
  wire [2:0] buffer_auto_in_d_bits_size; 
  wire [1:0] buffer_auto_in_d_bits_source; 
  wire [2:0] buffer_auto_in_d_bits_sink; 
  wire  buffer_auto_in_d_bits_denied; 
  wire [63:0] buffer_auto_in_d_bits_data; 
  wire  buffer_auto_in_d_bits_corrupt; 
  wire  buffer_auto_in_e_ready; 
  wire  buffer_auto_in_e_valid; 
  wire [2:0] buffer_auto_in_e_bits_sink; 
  wire  buffer_auto_out_a_ready; 
  wire  buffer_auto_out_a_valid; 
  wire [2:0] buffer_auto_out_a_bits_opcode; 
  wire [2:0] buffer_auto_out_a_bits_param; 
  wire [2:0] buffer_auto_out_a_bits_size; 
  wire [1:0] buffer_auto_out_a_bits_source; 
  wire [37:0] buffer_auto_out_a_bits_address; 
  wire [7:0] buffer_auto_out_a_bits_mask; 
  wire [63:0] buffer_auto_out_a_bits_data; 
  wire  buffer_auto_out_a_bits_corrupt; 
  wire  buffer_auto_out_b_ready; 
  wire  buffer_auto_out_b_valid; 
  wire [2:0] buffer_auto_out_b_bits_opcode; 
  wire [1:0] buffer_auto_out_b_bits_param; 
  wire [2:0] buffer_auto_out_b_bits_size; 
  wire [1:0] buffer_auto_out_b_bits_source; 
  wire [37:0] buffer_auto_out_b_bits_address; 
  wire [7:0] buffer_auto_out_b_bits_mask; 
  wire  buffer_auto_out_b_bits_corrupt; 
  wire  buffer_auto_out_c_ready; 
  wire  buffer_auto_out_c_valid; 
  wire [2:0] buffer_auto_out_c_bits_opcode; 
  wire [2:0] buffer_auto_out_c_bits_param; 
  wire [2:0] buffer_auto_out_c_bits_size; 
  wire [1:0] buffer_auto_out_c_bits_source; 
  wire [37:0] buffer_auto_out_c_bits_address; 
  wire [63:0] buffer_auto_out_c_bits_data; 
  wire  buffer_auto_out_c_bits_corrupt; 
  wire  buffer_auto_out_d_ready; 
  wire  buffer_auto_out_d_valid; 
  wire [2:0] buffer_auto_out_d_bits_opcode; 
  wire [1:0] buffer_auto_out_d_bits_param; 
  wire [2:0] buffer_auto_out_d_bits_size; 
  wire [1:0] buffer_auto_out_d_bits_source; 
  wire [2:0] buffer_auto_out_d_bits_sink; 
  wire  buffer_auto_out_d_bits_denied; 
  wire [63:0] buffer_auto_out_d_bits_data; 
  wire  buffer_auto_out_d_bits_corrupt; 
  wire  buffer_auto_out_e_ready; 
  wire  buffer_auto_out_e_valid; 
  wire [2:0] buffer_auto_out_e_bits_sink; 
  wire  fixer_clock; 
  wire  fixer_reset; 
  wire  fixer_auto_in_a_ready; 
  wire  fixer_auto_in_a_valid; 
  wire [2:0] fixer_auto_in_a_bits_opcode; 
  wire [2:0] fixer_auto_in_a_bits_param; 
  wire [2:0] fixer_auto_in_a_bits_size; 
  wire [1:0] fixer_auto_in_a_bits_source; 
  wire [37:0] fixer_auto_in_a_bits_address; 
  wire [7:0] fixer_auto_in_a_bits_mask; 
  wire [63:0] fixer_auto_in_a_bits_data; 
  wire  fixer_auto_in_a_bits_corrupt; 
  wire  fixer_auto_in_b_ready; 
  wire  fixer_auto_in_b_valid; 
  wire [2:0] fixer_auto_in_b_bits_opcode; 
  wire [1:0] fixer_auto_in_b_bits_param; 
  wire [2:0] fixer_auto_in_b_bits_size; 
  wire [1:0] fixer_auto_in_b_bits_source; 
  wire [37:0] fixer_auto_in_b_bits_address; 
  wire [7:0] fixer_auto_in_b_bits_mask; 
  wire  fixer_auto_in_b_bits_corrupt; 
  wire  fixer_auto_in_c_ready; 
  wire  fixer_auto_in_c_valid; 
  wire [2:0] fixer_auto_in_c_bits_opcode; 
  wire [2:0] fixer_auto_in_c_bits_param; 
  wire [2:0] fixer_auto_in_c_bits_size; 
  wire [1:0] fixer_auto_in_c_bits_source; 
  wire [37:0] fixer_auto_in_c_bits_address; 
  wire [63:0] fixer_auto_in_c_bits_data; 
  wire  fixer_auto_in_c_bits_corrupt; 
  wire  fixer_auto_in_d_ready; 
  wire  fixer_auto_in_d_valid; 
  wire [2:0] fixer_auto_in_d_bits_opcode; 
  wire [1:0] fixer_auto_in_d_bits_param; 
  wire [2:0] fixer_auto_in_d_bits_size; 
  wire [1:0] fixer_auto_in_d_bits_source; 
  wire [2:0] fixer_auto_in_d_bits_sink; 
  wire  fixer_auto_in_d_bits_denied; 
  wire [63:0] fixer_auto_in_d_bits_data; 
  wire  fixer_auto_in_d_bits_corrupt; 
  wire  fixer_auto_in_e_ready; 
  wire  fixer_auto_in_e_valid; 
  wire [2:0] fixer_auto_in_e_bits_sink; 
  wire  fixer_auto_out_a_ready; 
  wire  fixer_auto_out_a_valid; 
  wire [2:0] fixer_auto_out_a_bits_opcode; 
  wire [2:0] fixer_auto_out_a_bits_param; 
  wire [2:0] fixer_auto_out_a_bits_size; 
  wire [1:0] fixer_auto_out_a_bits_source; 
  wire [37:0] fixer_auto_out_a_bits_address; 
  wire [7:0] fixer_auto_out_a_bits_mask; 
  wire [63:0] fixer_auto_out_a_bits_data; 
  wire  fixer_auto_out_a_bits_corrupt; 
  wire  fixer_auto_out_b_ready; 
  wire  fixer_auto_out_b_valid; 
  wire [2:0] fixer_auto_out_b_bits_opcode; 
  wire [1:0] fixer_auto_out_b_bits_param; 
  wire [2:0] fixer_auto_out_b_bits_size; 
  wire [1:0] fixer_auto_out_b_bits_source; 
  wire [37:0] fixer_auto_out_b_bits_address; 
  wire [7:0] fixer_auto_out_b_bits_mask; 
  wire  fixer_auto_out_b_bits_corrupt; 
  wire  fixer_auto_out_c_ready; 
  wire  fixer_auto_out_c_valid; 
  wire [2:0] fixer_auto_out_c_bits_opcode; 
  wire [2:0] fixer_auto_out_c_bits_param; 
  wire [2:0] fixer_auto_out_c_bits_size; 
  wire [1:0] fixer_auto_out_c_bits_source; 
  wire [37:0] fixer_auto_out_c_bits_address; 
  wire [63:0] fixer_auto_out_c_bits_data; 
  wire  fixer_auto_out_c_bits_corrupt; 
  wire  fixer_auto_out_d_ready; 
  wire  fixer_auto_out_d_valid; 
  wire [2:0] fixer_auto_out_d_bits_opcode; 
  wire [1:0] fixer_auto_out_d_bits_param; 
  wire [2:0] fixer_auto_out_d_bits_size; 
  wire [1:0] fixer_auto_out_d_bits_source; 
  wire [2:0] fixer_auto_out_d_bits_sink; 
  wire  fixer_auto_out_d_bits_denied; 
  wire [63:0] fixer_auto_out_d_bits_data; 
  wire  fixer_auto_out_d_bits_corrupt; 
  wire  fixer_auto_out_e_ready; 
  wire  fixer_auto_out_e_valid; 
  wire [2:0] fixer_auto_out_e_bits_sink; 
  TLBuffer_12 buffer ( 
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
    .auto_in_b_ready(buffer_auto_in_b_ready),
    .auto_in_b_valid(buffer_auto_in_b_valid),
    .auto_in_b_bits_opcode(buffer_auto_in_b_bits_opcode),
    .auto_in_b_bits_param(buffer_auto_in_b_bits_param),
    .auto_in_b_bits_size(buffer_auto_in_b_bits_size),
    .auto_in_b_bits_source(buffer_auto_in_b_bits_source),
    .auto_in_b_bits_address(buffer_auto_in_b_bits_address),
    .auto_in_b_bits_mask(buffer_auto_in_b_bits_mask),
    .auto_in_b_bits_corrupt(buffer_auto_in_b_bits_corrupt),
    .auto_in_c_ready(buffer_auto_in_c_ready),
    .auto_in_c_valid(buffer_auto_in_c_valid),
    .auto_in_c_bits_opcode(buffer_auto_in_c_bits_opcode),
    .auto_in_c_bits_param(buffer_auto_in_c_bits_param),
    .auto_in_c_bits_size(buffer_auto_in_c_bits_size),
    .auto_in_c_bits_source(buffer_auto_in_c_bits_source),
    .auto_in_c_bits_address(buffer_auto_in_c_bits_address),
    .auto_in_c_bits_data(buffer_auto_in_c_bits_data),
    .auto_in_c_bits_corrupt(buffer_auto_in_c_bits_corrupt),
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
    .auto_in_e_ready(buffer_auto_in_e_ready),
    .auto_in_e_valid(buffer_auto_in_e_valid),
    .auto_in_e_bits_sink(buffer_auto_in_e_bits_sink),
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
    .auto_out_b_ready(buffer_auto_out_b_ready),
    .auto_out_b_valid(buffer_auto_out_b_valid),
    .auto_out_b_bits_opcode(buffer_auto_out_b_bits_opcode),
    .auto_out_b_bits_param(buffer_auto_out_b_bits_param),
    .auto_out_b_bits_size(buffer_auto_out_b_bits_size),
    .auto_out_b_bits_source(buffer_auto_out_b_bits_source),
    .auto_out_b_bits_address(buffer_auto_out_b_bits_address),
    .auto_out_b_bits_mask(buffer_auto_out_b_bits_mask),
    .auto_out_b_bits_corrupt(buffer_auto_out_b_bits_corrupt),
    .auto_out_c_ready(buffer_auto_out_c_ready),
    .auto_out_c_valid(buffer_auto_out_c_valid),
    .auto_out_c_bits_opcode(buffer_auto_out_c_bits_opcode),
    .auto_out_c_bits_param(buffer_auto_out_c_bits_param),
    .auto_out_c_bits_size(buffer_auto_out_c_bits_size),
    .auto_out_c_bits_source(buffer_auto_out_c_bits_source),
    .auto_out_c_bits_address(buffer_auto_out_c_bits_address),
    .auto_out_c_bits_data(buffer_auto_out_c_bits_data),
    .auto_out_c_bits_corrupt(buffer_auto_out_c_bits_corrupt),
    .auto_out_d_ready(buffer_auto_out_d_ready),
    .auto_out_d_valid(buffer_auto_out_d_valid),
    .auto_out_d_bits_opcode(buffer_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(buffer_auto_out_d_bits_param),
    .auto_out_d_bits_size(buffer_auto_out_d_bits_size),
    .auto_out_d_bits_source(buffer_auto_out_d_bits_source),
    .auto_out_d_bits_sink(buffer_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(buffer_auto_out_d_bits_denied),
    .auto_out_d_bits_data(buffer_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(buffer_auto_out_d_bits_corrupt),
    .auto_out_e_ready(buffer_auto_out_e_ready),
    .auto_out_e_valid(buffer_auto_out_e_valid),
    .auto_out_e_bits_sink(buffer_auto_out_e_bits_sink)
  );
  TLFIFOFixer_1 fixer ( 
    .clock(fixer_clock),
    .reset(fixer_reset),
    .auto_in_a_ready(fixer_auto_in_a_ready),
    .auto_in_a_valid(fixer_auto_in_a_valid),
    .auto_in_a_bits_opcode(fixer_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(fixer_auto_in_a_bits_param),
    .auto_in_a_bits_size(fixer_auto_in_a_bits_size),
    .auto_in_a_bits_source(fixer_auto_in_a_bits_source),
    .auto_in_a_bits_address(fixer_auto_in_a_bits_address),
    .auto_in_a_bits_mask(fixer_auto_in_a_bits_mask),
    .auto_in_a_bits_data(fixer_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(fixer_auto_in_a_bits_corrupt),
    .auto_in_b_ready(fixer_auto_in_b_ready),
    .auto_in_b_valid(fixer_auto_in_b_valid),
    .auto_in_b_bits_opcode(fixer_auto_in_b_bits_opcode),
    .auto_in_b_bits_param(fixer_auto_in_b_bits_param),
    .auto_in_b_bits_size(fixer_auto_in_b_bits_size),
    .auto_in_b_bits_source(fixer_auto_in_b_bits_source),
    .auto_in_b_bits_address(fixer_auto_in_b_bits_address),
    .auto_in_b_bits_mask(fixer_auto_in_b_bits_mask),
    .auto_in_b_bits_corrupt(fixer_auto_in_b_bits_corrupt),
    .auto_in_c_ready(fixer_auto_in_c_ready),
    .auto_in_c_valid(fixer_auto_in_c_valid),
    .auto_in_c_bits_opcode(fixer_auto_in_c_bits_opcode),
    .auto_in_c_bits_param(fixer_auto_in_c_bits_param),
    .auto_in_c_bits_size(fixer_auto_in_c_bits_size),
    .auto_in_c_bits_source(fixer_auto_in_c_bits_source),
    .auto_in_c_bits_address(fixer_auto_in_c_bits_address),
    .auto_in_c_bits_data(fixer_auto_in_c_bits_data),
    .auto_in_c_bits_corrupt(fixer_auto_in_c_bits_corrupt),
    .auto_in_d_ready(fixer_auto_in_d_ready),
    .auto_in_d_valid(fixer_auto_in_d_valid),
    .auto_in_d_bits_opcode(fixer_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(fixer_auto_in_d_bits_param),
    .auto_in_d_bits_size(fixer_auto_in_d_bits_size),
    .auto_in_d_bits_source(fixer_auto_in_d_bits_source),
    .auto_in_d_bits_sink(fixer_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(fixer_auto_in_d_bits_denied),
    .auto_in_d_bits_data(fixer_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(fixer_auto_in_d_bits_corrupt),
    .auto_in_e_ready(fixer_auto_in_e_ready),
    .auto_in_e_valid(fixer_auto_in_e_valid),
    .auto_in_e_bits_sink(fixer_auto_in_e_bits_sink),
    .auto_out_a_ready(fixer_auto_out_a_ready),
    .auto_out_a_valid(fixer_auto_out_a_valid),
    .auto_out_a_bits_opcode(fixer_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(fixer_auto_out_a_bits_param),
    .auto_out_a_bits_size(fixer_auto_out_a_bits_size),
    .auto_out_a_bits_source(fixer_auto_out_a_bits_source),
    .auto_out_a_bits_address(fixer_auto_out_a_bits_address),
    .auto_out_a_bits_mask(fixer_auto_out_a_bits_mask),
    .auto_out_a_bits_data(fixer_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(fixer_auto_out_a_bits_corrupt),
    .auto_out_b_ready(fixer_auto_out_b_ready),
    .auto_out_b_valid(fixer_auto_out_b_valid),
    .auto_out_b_bits_opcode(fixer_auto_out_b_bits_opcode),
    .auto_out_b_bits_param(fixer_auto_out_b_bits_param),
    .auto_out_b_bits_size(fixer_auto_out_b_bits_size),
    .auto_out_b_bits_source(fixer_auto_out_b_bits_source),
    .auto_out_b_bits_address(fixer_auto_out_b_bits_address),
    .auto_out_b_bits_mask(fixer_auto_out_b_bits_mask),
    .auto_out_b_bits_corrupt(fixer_auto_out_b_bits_corrupt),
    .auto_out_c_ready(fixer_auto_out_c_ready),
    .auto_out_c_valid(fixer_auto_out_c_valid),
    .auto_out_c_bits_opcode(fixer_auto_out_c_bits_opcode),
    .auto_out_c_bits_param(fixer_auto_out_c_bits_param),
    .auto_out_c_bits_size(fixer_auto_out_c_bits_size),
    .auto_out_c_bits_source(fixer_auto_out_c_bits_source),
    .auto_out_c_bits_address(fixer_auto_out_c_bits_address),
    .auto_out_c_bits_data(fixer_auto_out_c_bits_data),
    .auto_out_c_bits_corrupt(fixer_auto_out_c_bits_corrupt),
    .auto_out_d_ready(fixer_auto_out_d_ready),
    .auto_out_d_valid(fixer_auto_out_d_valid),
    .auto_out_d_bits_opcode(fixer_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(fixer_auto_out_d_bits_param),
    .auto_out_d_bits_size(fixer_auto_out_d_bits_size),
    .auto_out_d_bits_source(fixer_auto_out_d_bits_source),
    .auto_out_d_bits_sink(fixer_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(fixer_auto_out_d_bits_denied),
    .auto_out_d_bits_data(fixer_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(fixer_auto_out_d_bits_corrupt),
    .auto_out_e_ready(fixer_auto_out_e_ready),
    .auto_out_e_valid(fixer_auto_out_e_valid),
    .auto_out_e_bits_sink(fixer_auto_out_e_bits_sink)
  );
  assign auto_buffer_out_a_valid = buffer_auto_out_a_valid; 
  assign auto_buffer_out_a_bits_opcode = buffer_auto_out_a_bits_opcode; 
  assign auto_buffer_out_a_bits_param = buffer_auto_out_a_bits_param; 
  assign auto_buffer_out_a_bits_size = buffer_auto_out_a_bits_size; 
  assign auto_buffer_out_a_bits_source = buffer_auto_out_a_bits_source; 
  assign auto_buffer_out_a_bits_address = buffer_auto_out_a_bits_address; 
  assign auto_buffer_out_a_bits_mask = buffer_auto_out_a_bits_mask; 
  assign auto_buffer_out_a_bits_data = buffer_auto_out_a_bits_data; 
  assign auto_buffer_out_a_bits_corrupt = buffer_auto_out_a_bits_corrupt; 
  assign auto_buffer_out_b_ready = buffer_auto_out_b_ready; 
  assign auto_buffer_out_c_valid = buffer_auto_out_c_valid; 
  assign auto_buffer_out_c_bits_opcode = buffer_auto_out_c_bits_opcode; 
  assign auto_buffer_out_c_bits_param = buffer_auto_out_c_bits_param; 
  assign auto_buffer_out_c_bits_size = buffer_auto_out_c_bits_size; 
  assign auto_buffer_out_c_bits_source = buffer_auto_out_c_bits_source; 
  assign auto_buffer_out_c_bits_address = buffer_auto_out_c_bits_address; 
  assign auto_buffer_out_c_bits_data = buffer_auto_out_c_bits_data; 
  assign auto_buffer_out_c_bits_corrupt = buffer_auto_out_c_bits_corrupt; 
  assign auto_buffer_out_d_ready = buffer_auto_out_d_ready; 
  assign auto_buffer_out_e_valid = buffer_auto_out_e_valid; 
  assign auto_buffer_out_e_bits_sink = buffer_auto_out_e_bits_sink; 
  assign auto_tl_master_xing_in_a_ready = fixer_auto_in_a_ready; 
  assign auto_tl_master_xing_in_b_valid = fixer_auto_in_b_valid; 
  assign auto_tl_master_xing_in_b_bits_opcode = fixer_auto_in_b_bits_opcode; 
  assign auto_tl_master_xing_in_b_bits_param = fixer_auto_in_b_bits_param; 
  assign auto_tl_master_xing_in_b_bits_size = fixer_auto_in_b_bits_size; 
  assign auto_tl_master_xing_in_b_bits_source = fixer_auto_in_b_bits_source; 
  assign auto_tl_master_xing_in_b_bits_address = fixer_auto_in_b_bits_address; 
  assign auto_tl_master_xing_in_b_bits_mask = fixer_auto_in_b_bits_mask; 
  assign auto_tl_master_xing_in_b_bits_corrupt = fixer_auto_in_b_bits_corrupt; 
  assign auto_tl_master_xing_in_c_ready = fixer_auto_in_c_ready; 
  assign auto_tl_master_xing_in_d_valid = fixer_auto_in_d_valid; 
  assign auto_tl_master_xing_in_d_bits_opcode = fixer_auto_in_d_bits_opcode; 
  assign auto_tl_master_xing_in_d_bits_param = fixer_auto_in_d_bits_param; 
  assign auto_tl_master_xing_in_d_bits_size = fixer_auto_in_d_bits_size; 
  assign auto_tl_master_xing_in_d_bits_source = fixer_auto_in_d_bits_source; 
  assign auto_tl_master_xing_in_d_bits_sink = fixer_auto_in_d_bits_sink; 
  assign auto_tl_master_xing_in_d_bits_denied = fixer_auto_in_d_bits_denied; 
  assign auto_tl_master_xing_in_d_bits_data = fixer_auto_in_d_bits_data; 
  assign auto_tl_master_xing_in_d_bits_corrupt = fixer_auto_in_d_bits_corrupt; 
  assign auto_tl_master_xing_in_e_ready = fixer_auto_in_e_ready; 
  assign buffer_clock = clock; 
  assign buffer_reset = reset; 
  assign buffer_auto_in_a_valid = fixer_auto_out_a_valid; 
  assign buffer_auto_in_a_bits_opcode = fixer_auto_out_a_bits_opcode; 
  assign buffer_auto_in_a_bits_param = fixer_auto_out_a_bits_param; 
  assign buffer_auto_in_a_bits_size = fixer_auto_out_a_bits_size; 
  assign buffer_auto_in_a_bits_source = fixer_auto_out_a_bits_source; 
  assign buffer_auto_in_a_bits_address = fixer_auto_out_a_bits_address; 
  assign buffer_auto_in_a_bits_mask = fixer_auto_out_a_bits_mask; 
  assign buffer_auto_in_a_bits_data = fixer_auto_out_a_bits_data; 
  assign buffer_auto_in_a_bits_corrupt = fixer_auto_out_a_bits_corrupt; 
  assign buffer_auto_in_b_ready = fixer_auto_out_b_ready; 
  assign buffer_auto_in_c_valid = fixer_auto_out_c_valid; 
  assign buffer_auto_in_c_bits_opcode = fixer_auto_out_c_bits_opcode; 
  assign buffer_auto_in_c_bits_param = fixer_auto_out_c_bits_param; 
  assign buffer_auto_in_c_bits_size = fixer_auto_out_c_bits_size; 
  assign buffer_auto_in_c_bits_source = fixer_auto_out_c_bits_source; 
  assign buffer_auto_in_c_bits_address = fixer_auto_out_c_bits_address; 
  assign buffer_auto_in_c_bits_data = fixer_auto_out_c_bits_data; 
  assign buffer_auto_in_c_bits_corrupt = fixer_auto_out_c_bits_corrupt; 
  assign buffer_auto_in_d_ready = fixer_auto_out_d_ready; 
  assign buffer_auto_in_e_valid = fixer_auto_out_e_valid; 
  assign buffer_auto_in_e_bits_sink = fixer_auto_out_e_bits_sink; 
  assign buffer_auto_out_a_ready = auto_buffer_out_a_ready; 
  assign buffer_auto_out_b_valid = auto_buffer_out_b_valid; 
  assign buffer_auto_out_b_bits_opcode = auto_buffer_out_b_bits_opcode; 
  assign buffer_auto_out_b_bits_param = auto_buffer_out_b_bits_param; 
  assign buffer_auto_out_b_bits_size = auto_buffer_out_b_bits_size; 
  assign buffer_auto_out_b_bits_source = auto_buffer_out_b_bits_source; 
  assign buffer_auto_out_b_bits_address = auto_buffer_out_b_bits_address; 
  assign buffer_auto_out_b_bits_mask = auto_buffer_out_b_bits_mask; 
  assign buffer_auto_out_b_bits_corrupt = auto_buffer_out_b_bits_corrupt; 
  assign buffer_auto_out_c_ready = auto_buffer_out_c_ready; 
  assign buffer_auto_out_d_valid = auto_buffer_out_d_valid; 
  assign buffer_auto_out_d_bits_opcode = auto_buffer_out_d_bits_opcode; 
  assign buffer_auto_out_d_bits_param = auto_buffer_out_d_bits_param; 
  assign buffer_auto_out_d_bits_size = auto_buffer_out_d_bits_size; 
  assign buffer_auto_out_d_bits_source = auto_buffer_out_d_bits_source; 
  assign buffer_auto_out_d_bits_sink = auto_buffer_out_d_bits_sink; 
  assign buffer_auto_out_d_bits_denied = auto_buffer_out_d_bits_denied; 
  assign buffer_auto_out_d_bits_data = auto_buffer_out_d_bits_data; 
  assign buffer_auto_out_d_bits_corrupt = auto_buffer_out_d_bits_corrupt; 
  assign buffer_auto_out_e_ready = auto_buffer_out_e_ready; 
  assign fixer_clock = clock; 
  assign fixer_reset = reset; 
  assign fixer_auto_in_a_valid = auto_tl_master_xing_in_a_valid; 
  assign fixer_auto_in_a_bits_opcode = auto_tl_master_xing_in_a_bits_opcode; 
  assign fixer_auto_in_a_bits_param = auto_tl_master_xing_in_a_bits_param; 
  assign fixer_auto_in_a_bits_size = auto_tl_master_xing_in_a_bits_size; 
  assign fixer_auto_in_a_bits_source = auto_tl_master_xing_in_a_bits_source; 
  assign fixer_auto_in_a_bits_address = auto_tl_master_xing_in_a_bits_address; 
  assign fixer_auto_in_a_bits_mask = auto_tl_master_xing_in_a_bits_mask; 
  assign fixer_auto_in_a_bits_data = auto_tl_master_xing_in_a_bits_data; 
  assign fixer_auto_in_a_bits_corrupt = auto_tl_master_xing_in_a_bits_corrupt; 
  assign fixer_auto_in_b_ready = auto_tl_master_xing_in_b_ready; 
  assign fixer_auto_in_c_valid = auto_tl_master_xing_in_c_valid; 
  assign fixer_auto_in_c_bits_opcode = auto_tl_master_xing_in_c_bits_opcode; 
  assign fixer_auto_in_c_bits_param = auto_tl_master_xing_in_c_bits_param; 
  assign fixer_auto_in_c_bits_size = auto_tl_master_xing_in_c_bits_size; 
  assign fixer_auto_in_c_bits_source = auto_tl_master_xing_in_c_bits_source; 
  assign fixer_auto_in_c_bits_address = auto_tl_master_xing_in_c_bits_address; 
  assign fixer_auto_in_c_bits_data = auto_tl_master_xing_in_c_bits_data; 
  assign fixer_auto_in_c_bits_corrupt = auto_tl_master_xing_in_c_bits_corrupt; 
  assign fixer_auto_in_d_ready = auto_tl_master_xing_in_d_ready; 
  assign fixer_auto_in_e_valid = auto_tl_master_xing_in_e_valid; 
  assign fixer_auto_in_e_bits_sink = auto_tl_master_xing_in_e_bits_sink; 
  assign fixer_auto_out_a_ready = buffer_auto_in_a_ready; 
  assign fixer_auto_out_b_valid = buffer_auto_in_b_valid; 
  assign fixer_auto_out_b_bits_opcode = buffer_auto_in_b_bits_opcode; 
  assign fixer_auto_out_b_bits_param = buffer_auto_in_b_bits_param; 
  assign fixer_auto_out_b_bits_size = buffer_auto_in_b_bits_size; 
  assign fixer_auto_out_b_bits_source = buffer_auto_in_b_bits_source; 
  assign fixer_auto_out_b_bits_address = buffer_auto_in_b_bits_address; 
  assign fixer_auto_out_b_bits_mask = buffer_auto_in_b_bits_mask; 
  assign fixer_auto_out_b_bits_corrupt = buffer_auto_in_b_bits_corrupt; 
  assign fixer_auto_out_c_ready = buffer_auto_in_c_ready; 
  assign fixer_auto_out_d_valid = buffer_auto_in_d_valid; 
  assign fixer_auto_out_d_bits_opcode = buffer_auto_in_d_bits_opcode; 
  assign fixer_auto_out_d_bits_param = buffer_auto_in_d_bits_param; 
  assign fixer_auto_out_d_bits_size = buffer_auto_in_d_bits_size; 
  assign fixer_auto_out_d_bits_source = buffer_auto_in_d_bits_source; 
  assign fixer_auto_out_d_bits_sink = buffer_auto_in_d_bits_sink; 
  assign fixer_auto_out_d_bits_denied = buffer_auto_in_d_bits_denied; 
  assign fixer_auto_out_d_bits_data = buffer_auto_in_d_bits_data; 
  assign fixer_auto_out_d_bits_corrupt = buffer_auto_in_d_bits_corrupt; 
  assign fixer_auto_out_e_ready = buffer_auto_in_e_ready; 
endmodule
