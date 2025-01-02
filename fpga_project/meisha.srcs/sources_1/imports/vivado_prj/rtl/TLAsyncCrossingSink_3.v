module TLAsyncCrossingSink_3( 
  input         clock, 
  input         reset, 
  input  [2:0]  auto_in_a_mem_0_opcode, 
  input  [2:0]  auto_in_a_mem_0_param, 
  input  [2:0]  auto_in_a_mem_0_size, 
  input  [3:0]  auto_in_a_mem_0_source, 
  input  [37:0] auto_in_a_mem_0_address, 
  input  [7:0]  auto_in_a_mem_0_mask, 
  input  [63:0] auto_in_a_mem_0_data, 
  input         auto_in_a_mem_0_corrupt, 
  input  [2:0]  auto_in_a_mem_1_opcode, 
  input  [2:0]  auto_in_a_mem_1_param, 
  input  [2:0]  auto_in_a_mem_1_size, 
  input  [3:0]  auto_in_a_mem_1_source, 
  input  [37:0] auto_in_a_mem_1_address, 
  input  [7:0]  auto_in_a_mem_1_mask, 
  input  [63:0] auto_in_a_mem_1_data, 
  input         auto_in_a_mem_1_corrupt, 
  input  [2:0]  auto_in_a_mem_2_opcode, 
  input  [2:0]  auto_in_a_mem_2_param, 
  input  [2:0]  auto_in_a_mem_2_size, 
  input  [3:0]  auto_in_a_mem_2_source, 
  input  [37:0] auto_in_a_mem_2_address, 
  input  [7:0]  auto_in_a_mem_2_mask, 
  input  [63:0] auto_in_a_mem_2_data, 
  input         auto_in_a_mem_2_corrupt, 
  input  [2:0]  auto_in_a_mem_3_opcode, 
  input  [2:0]  auto_in_a_mem_3_param, 
  input  [2:0]  auto_in_a_mem_3_size, 
  input  [3:0]  auto_in_a_mem_3_source, 
  input  [37:0] auto_in_a_mem_3_address, 
  input  [7:0]  auto_in_a_mem_3_mask, 
  input  [63:0] auto_in_a_mem_3_data, 
  input         auto_in_a_mem_3_corrupt, 
  input  [2:0]  auto_in_a_mem_4_opcode, 
  input  [2:0]  auto_in_a_mem_4_param, 
  input  [2:0]  auto_in_a_mem_4_size, 
  input  [3:0]  auto_in_a_mem_4_source, 
  input  [37:0] auto_in_a_mem_4_address, 
  input  [7:0]  auto_in_a_mem_4_mask, 
  input  [63:0] auto_in_a_mem_4_data, 
  input         auto_in_a_mem_4_corrupt, 
  input  [2:0]  auto_in_a_mem_5_opcode, 
  input  [2:0]  auto_in_a_mem_5_param, 
  input  [2:0]  auto_in_a_mem_5_size, 
  input  [3:0]  auto_in_a_mem_5_source, 
  input  [37:0] auto_in_a_mem_5_address, 
  input  [7:0]  auto_in_a_mem_5_mask, 
  input  [63:0] auto_in_a_mem_5_data, 
  input         auto_in_a_mem_5_corrupt, 
  input  [2:0]  auto_in_a_mem_6_opcode, 
  input  [2:0]  auto_in_a_mem_6_param, 
  input  [2:0]  auto_in_a_mem_6_size, 
  input  [3:0]  auto_in_a_mem_6_source, 
  input  [37:0] auto_in_a_mem_6_address, 
  input  [7:0]  auto_in_a_mem_6_mask, 
  input  [63:0] auto_in_a_mem_6_data, 
  input         auto_in_a_mem_6_corrupt, 
  input  [2:0]  auto_in_a_mem_7_opcode, 
  input  [2:0]  auto_in_a_mem_7_param, 
  input  [2:0]  auto_in_a_mem_7_size, 
  input  [3:0]  auto_in_a_mem_7_source, 
  input  [37:0] auto_in_a_mem_7_address, 
  input  [7:0]  auto_in_a_mem_7_mask, 
  input  [63:0] auto_in_a_mem_7_data, 
  input         auto_in_a_mem_7_corrupt, 
  output [3:0]  auto_in_a_ridx, 
  input  [3:0]  auto_in_a_widx, 
  output        auto_in_a_safe_ridx_valid, 
  input         auto_in_a_safe_widx_valid, 
  input         auto_in_a_safe_source_reset_n, 
  output        auto_in_a_safe_sink_reset_n, 
  output [2:0]  auto_in_d_mem_0_opcode, 
  output [1:0]  auto_in_d_mem_0_param, 
  output [2:0]  auto_in_d_mem_0_size, 
  output [3:0]  auto_in_d_mem_0_source, 
  output [2:0]  auto_in_d_mem_0_sink, 
  output        auto_in_d_mem_0_denied, 
  output [63:0] auto_in_d_mem_0_data, 
  output        auto_in_d_mem_0_corrupt, 
  output [2:0]  auto_in_d_mem_1_opcode, 
  output [1:0]  auto_in_d_mem_1_param, 
  output [2:0]  auto_in_d_mem_1_size, 
  output [3:0]  auto_in_d_mem_1_source, 
  output [2:0]  auto_in_d_mem_1_sink, 
  output        auto_in_d_mem_1_denied, 
  output [63:0] auto_in_d_mem_1_data, 
  output        auto_in_d_mem_1_corrupt, 
  output [2:0]  auto_in_d_mem_2_opcode, 
  output [1:0]  auto_in_d_mem_2_param, 
  output [2:0]  auto_in_d_mem_2_size, 
  output [3:0]  auto_in_d_mem_2_source, 
  output [2:0]  auto_in_d_mem_2_sink, 
  output        auto_in_d_mem_2_denied, 
  output [63:0] auto_in_d_mem_2_data, 
  output        auto_in_d_mem_2_corrupt, 
  output [2:0]  auto_in_d_mem_3_opcode, 
  output [1:0]  auto_in_d_mem_3_param, 
  output [2:0]  auto_in_d_mem_3_size, 
  output [3:0]  auto_in_d_mem_3_source, 
  output [2:0]  auto_in_d_mem_3_sink, 
  output        auto_in_d_mem_3_denied, 
  output [63:0] auto_in_d_mem_3_data, 
  output        auto_in_d_mem_3_corrupt, 
  output [2:0]  auto_in_d_mem_4_opcode, 
  output [1:0]  auto_in_d_mem_4_param, 
  output [2:0]  auto_in_d_mem_4_size, 
  output [3:0]  auto_in_d_mem_4_source, 
  output [2:0]  auto_in_d_mem_4_sink, 
  output        auto_in_d_mem_4_denied, 
  output [63:0] auto_in_d_mem_4_data, 
  output        auto_in_d_mem_4_corrupt, 
  output [2:0]  auto_in_d_mem_5_opcode, 
  output [1:0]  auto_in_d_mem_5_param, 
  output [2:0]  auto_in_d_mem_5_size, 
  output [3:0]  auto_in_d_mem_5_source, 
  output [2:0]  auto_in_d_mem_5_sink, 
  output        auto_in_d_mem_5_denied, 
  output [63:0] auto_in_d_mem_5_data, 
  output        auto_in_d_mem_5_corrupt, 
  output [2:0]  auto_in_d_mem_6_opcode, 
  output [1:0]  auto_in_d_mem_6_param, 
  output [2:0]  auto_in_d_mem_6_size, 
  output [3:0]  auto_in_d_mem_6_source, 
  output [2:0]  auto_in_d_mem_6_sink, 
  output        auto_in_d_mem_6_denied, 
  output [63:0] auto_in_d_mem_6_data, 
  output        auto_in_d_mem_6_corrupt, 
  output [2:0]  auto_in_d_mem_7_opcode, 
  output [1:0]  auto_in_d_mem_7_param, 
  output [2:0]  auto_in_d_mem_7_size, 
  output [3:0]  auto_in_d_mem_7_source, 
  output [2:0]  auto_in_d_mem_7_sink, 
  output        auto_in_d_mem_7_denied, 
  output [63:0] auto_in_d_mem_7_data, 
  output        auto_in_d_mem_7_corrupt, 
  input  [3:0]  auto_in_d_ridx, 
  output [3:0]  auto_in_d_widx, 
  input         auto_in_d_safe_ridx_valid, 
  output        auto_in_d_safe_widx_valid, 
  output        auto_in_d_safe_source_reset_n, 
  input         auto_in_d_safe_sink_reset_n, 
  input         auto_out_a_ready, 
  output        auto_out_a_valid, 
  output [2:0]  auto_out_a_bits_opcode, 
  output [2:0]  auto_out_a_bits_param, 
  output [2:0]  auto_out_a_bits_size, 
  output [3:0]  auto_out_a_bits_source, 
  output [37:0] auto_out_a_bits_address, 
  output [7:0]  auto_out_a_bits_mask, 
  output [63:0] auto_out_a_bits_data, 
  output        auto_out_a_bits_corrupt, 
  output        auto_out_d_ready, 
  input         auto_out_d_valid, 
  input  [2:0]  auto_out_d_bits_opcode, 
  input  [1:0]  auto_out_d_bits_param, 
  input  [2:0]  auto_out_d_bits_size, 
  input  [3:0]  auto_out_d_bits_source, 
  input  [2:0]  auto_out_d_bits_sink, 
  input         auto_out_d_bits_denied, 
  input  [63:0] auto_out_d_bits_data, 
  input         auto_out_d_bits_corrupt 
);
  wire  AsyncQueueSink_clock; 
  wire  AsyncQueueSink_reset; 
  wire  AsyncQueueSink_io_deq_ready; 
  wire  AsyncQueueSink_io_deq_valid; 
  wire [2:0] AsyncQueueSink_io_deq_bits_opcode; 
  wire [2:0] AsyncQueueSink_io_deq_bits_param; 
  wire [2:0] AsyncQueueSink_io_deq_bits_size; 
  wire [3:0] AsyncQueueSink_io_deq_bits_source; 
  wire [37:0] AsyncQueueSink_io_deq_bits_address; 
  wire [7:0] AsyncQueueSink_io_deq_bits_mask; 
  wire [63:0] AsyncQueueSink_io_deq_bits_data; 
  wire  AsyncQueueSink_io_deq_bits_corrupt; 
  wire [2:0] AsyncQueueSink_io_async_mem_0_opcode; 
  wire [2:0] AsyncQueueSink_io_async_mem_0_param; 
  wire [2:0] AsyncQueueSink_io_async_mem_0_size; 
  wire [3:0] AsyncQueueSink_io_async_mem_0_source; 
  wire [37:0] AsyncQueueSink_io_async_mem_0_address; 
  wire [7:0] AsyncQueueSink_io_async_mem_0_mask; 
  wire [63:0] AsyncQueueSink_io_async_mem_0_data; 
  wire  AsyncQueueSink_io_async_mem_0_corrupt; 
  wire [2:0] AsyncQueueSink_io_async_mem_1_opcode; 
  wire [2:0] AsyncQueueSink_io_async_mem_1_param; 
  wire [2:0] AsyncQueueSink_io_async_mem_1_size; 
  wire [3:0] AsyncQueueSink_io_async_mem_1_source; 
  wire [37:0] AsyncQueueSink_io_async_mem_1_address; 
  wire [7:0] AsyncQueueSink_io_async_mem_1_mask; 
  wire [63:0] AsyncQueueSink_io_async_mem_1_data; 
  wire  AsyncQueueSink_io_async_mem_1_corrupt; 
  wire [2:0] AsyncQueueSink_io_async_mem_2_opcode; 
  wire [2:0] AsyncQueueSink_io_async_mem_2_param; 
  wire [2:0] AsyncQueueSink_io_async_mem_2_size; 
  wire [3:0] AsyncQueueSink_io_async_mem_2_source; 
  wire [37:0] AsyncQueueSink_io_async_mem_2_address; 
  wire [7:0] AsyncQueueSink_io_async_mem_2_mask; 
  wire [63:0] AsyncQueueSink_io_async_mem_2_data; 
  wire  AsyncQueueSink_io_async_mem_2_corrupt; 
  wire [2:0] AsyncQueueSink_io_async_mem_3_opcode; 
  wire [2:0] AsyncQueueSink_io_async_mem_3_param; 
  wire [2:0] AsyncQueueSink_io_async_mem_3_size; 
  wire [3:0] AsyncQueueSink_io_async_mem_3_source; 
  wire [37:0] AsyncQueueSink_io_async_mem_3_address; 
  wire [7:0] AsyncQueueSink_io_async_mem_3_mask; 
  wire [63:0] AsyncQueueSink_io_async_mem_3_data; 
  wire  AsyncQueueSink_io_async_mem_3_corrupt; 
  wire [2:0] AsyncQueueSink_io_async_mem_4_opcode; 
  wire [2:0] AsyncQueueSink_io_async_mem_4_param; 
  wire [2:0] AsyncQueueSink_io_async_mem_4_size; 
  wire [3:0] AsyncQueueSink_io_async_mem_4_source; 
  wire [37:0] AsyncQueueSink_io_async_mem_4_address; 
  wire [7:0] AsyncQueueSink_io_async_mem_4_mask; 
  wire [63:0] AsyncQueueSink_io_async_mem_4_data; 
  wire  AsyncQueueSink_io_async_mem_4_corrupt; 
  wire [2:0] AsyncQueueSink_io_async_mem_5_opcode; 
  wire [2:0] AsyncQueueSink_io_async_mem_5_param; 
  wire [2:0] AsyncQueueSink_io_async_mem_5_size; 
  wire [3:0] AsyncQueueSink_io_async_mem_5_source; 
  wire [37:0] AsyncQueueSink_io_async_mem_5_address; 
  wire [7:0] AsyncQueueSink_io_async_mem_5_mask; 
  wire [63:0] AsyncQueueSink_io_async_mem_5_data; 
  wire  AsyncQueueSink_io_async_mem_5_corrupt; 
  wire [2:0] AsyncQueueSink_io_async_mem_6_opcode; 
  wire [2:0] AsyncQueueSink_io_async_mem_6_param; 
  wire [2:0] AsyncQueueSink_io_async_mem_6_size; 
  wire [3:0] AsyncQueueSink_io_async_mem_6_source; 
  wire [37:0] AsyncQueueSink_io_async_mem_6_address; 
  wire [7:0] AsyncQueueSink_io_async_mem_6_mask; 
  wire [63:0] AsyncQueueSink_io_async_mem_6_data; 
  wire  AsyncQueueSink_io_async_mem_6_corrupt; 
  wire [2:0] AsyncQueueSink_io_async_mem_7_opcode; 
  wire [2:0] AsyncQueueSink_io_async_mem_7_param; 
  wire [2:0] AsyncQueueSink_io_async_mem_7_size; 
  wire [3:0] AsyncQueueSink_io_async_mem_7_source; 
  wire [37:0] AsyncQueueSink_io_async_mem_7_address; 
  wire [7:0] AsyncQueueSink_io_async_mem_7_mask; 
  wire [63:0] AsyncQueueSink_io_async_mem_7_data; 
  wire  AsyncQueueSink_io_async_mem_7_corrupt; 
  wire [3:0] AsyncQueueSink_io_async_ridx; 
  wire [3:0] AsyncQueueSink_io_async_widx; 
  wire  AsyncQueueSink_io_async_safe_ridx_valid; 
  wire  AsyncQueueSink_io_async_safe_widx_valid; 
  wire  AsyncQueueSink_io_async_safe_source_reset_n; 
  wire  AsyncQueueSink_io_async_safe_sink_reset_n; 
  wire  AsyncQueueSource_clock; 
  wire  AsyncQueueSource_reset; 
  wire  AsyncQueueSource_io_enq_ready; 
  wire  AsyncQueueSource_io_enq_valid; 
  wire [2:0] AsyncQueueSource_io_enq_bits_opcode; 
  wire [1:0] AsyncQueueSource_io_enq_bits_param; 
  wire [2:0] AsyncQueueSource_io_enq_bits_size; 
  wire [3:0] AsyncQueueSource_io_enq_bits_source; 
  wire [2:0] AsyncQueueSource_io_enq_bits_sink; 
  wire  AsyncQueueSource_io_enq_bits_denied; 
  wire [63:0] AsyncQueueSource_io_enq_bits_data; 
  wire  AsyncQueueSource_io_enq_bits_corrupt; 
  wire [2:0] AsyncQueueSource_io_async_mem_0_opcode; 
  wire [1:0] AsyncQueueSource_io_async_mem_0_param; 
  wire [2:0] AsyncQueueSource_io_async_mem_0_size; 
  wire [3:0] AsyncQueueSource_io_async_mem_0_source; 
  wire [2:0] AsyncQueueSource_io_async_mem_0_sink; 
  wire  AsyncQueueSource_io_async_mem_0_denied; 
  wire [63:0] AsyncQueueSource_io_async_mem_0_data; 
  wire  AsyncQueueSource_io_async_mem_0_corrupt; 
  wire [2:0] AsyncQueueSource_io_async_mem_1_opcode; 
  wire [1:0] AsyncQueueSource_io_async_mem_1_param; 
  wire [2:0] AsyncQueueSource_io_async_mem_1_size; 
  wire [3:0] AsyncQueueSource_io_async_mem_1_source; 
  wire [2:0] AsyncQueueSource_io_async_mem_1_sink; 
  wire  AsyncQueueSource_io_async_mem_1_denied; 
  wire [63:0] AsyncQueueSource_io_async_mem_1_data; 
  wire  AsyncQueueSource_io_async_mem_1_corrupt; 
  wire [2:0] AsyncQueueSource_io_async_mem_2_opcode; 
  wire [1:0] AsyncQueueSource_io_async_mem_2_param; 
  wire [2:0] AsyncQueueSource_io_async_mem_2_size; 
  wire [3:0] AsyncQueueSource_io_async_mem_2_source; 
  wire [2:0] AsyncQueueSource_io_async_mem_2_sink; 
  wire  AsyncQueueSource_io_async_mem_2_denied; 
  wire [63:0] AsyncQueueSource_io_async_mem_2_data; 
  wire  AsyncQueueSource_io_async_mem_2_corrupt; 
  wire [2:0] AsyncQueueSource_io_async_mem_3_opcode; 
  wire [1:0] AsyncQueueSource_io_async_mem_3_param; 
  wire [2:0] AsyncQueueSource_io_async_mem_3_size; 
  wire [3:0] AsyncQueueSource_io_async_mem_3_source; 
  wire [2:0] AsyncQueueSource_io_async_mem_3_sink; 
  wire  AsyncQueueSource_io_async_mem_3_denied; 
  wire [63:0] AsyncQueueSource_io_async_mem_3_data; 
  wire  AsyncQueueSource_io_async_mem_3_corrupt; 
  wire [2:0] AsyncQueueSource_io_async_mem_4_opcode; 
  wire [1:0] AsyncQueueSource_io_async_mem_4_param; 
  wire [2:0] AsyncQueueSource_io_async_mem_4_size; 
  wire [3:0] AsyncQueueSource_io_async_mem_4_source; 
  wire [2:0] AsyncQueueSource_io_async_mem_4_sink; 
  wire  AsyncQueueSource_io_async_mem_4_denied; 
  wire [63:0] AsyncQueueSource_io_async_mem_4_data; 
  wire  AsyncQueueSource_io_async_mem_4_corrupt; 
  wire [2:0] AsyncQueueSource_io_async_mem_5_opcode; 
  wire [1:0] AsyncQueueSource_io_async_mem_5_param; 
  wire [2:0] AsyncQueueSource_io_async_mem_5_size; 
  wire [3:0] AsyncQueueSource_io_async_mem_5_source; 
  wire [2:0] AsyncQueueSource_io_async_mem_5_sink; 
  wire  AsyncQueueSource_io_async_mem_5_denied; 
  wire [63:0] AsyncQueueSource_io_async_mem_5_data; 
  wire  AsyncQueueSource_io_async_mem_5_corrupt; 
  wire [2:0] AsyncQueueSource_io_async_mem_6_opcode; 
  wire [1:0] AsyncQueueSource_io_async_mem_6_param; 
  wire [2:0] AsyncQueueSource_io_async_mem_6_size; 
  wire [3:0] AsyncQueueSource_io_async_mem_6_source; 
  wire [2:0] AsyncQueueSource_io_async_mem_6_sink; 
  wire  AsyncQueueSource_io_async_mem_6_denied; 
  wire [63:0] AsyncQueueSource_io_async_mem_6_data; 
  wire  AsyncQueueSource_io_async_mem_6_corrupt; 
  wire [2:0] AsyncQueueSource_io_async_mem_7_opcode; 
  wire [1:0] AsyncQueueSource_io_async_mem_7_param; 
  wire [2:0] AsyncQueueSource_io_async_mem_7_size; 
  wire [3:0] AsyncQueueSource_io_async_mem_7_source; 
  wire [2:0] AsyncQueueSource_io_async_mem_7_sink; 
  wire  AsyncQueueSource_io_async_mem_7_denied; 
  wire [63:0] AsyncQueueSource_io_async_mem_7_data; 
  wire  AsyncQueueSource_io_async_mem_7_corrupt; 
  wire [3:0] AsyncQueueSource_io_async_ridx; 
  wire [3:0] AsyncQueueSource_io_async_widx; 
  wire  AsyncQueueSource_io_async_safe_ridx_valid; 
  wire  AsyncQueueSource_io_async_safe_widx_valid; 
  wire  AsyncQueueSource_io_async_safe_source_reset_n; 
  wire  AsyncQueueSource_io_async_safe_sink_reset_n; 
  AsyncQueueSink_13 AsyncQueueSink ( 
    .clock(AsyncQueueSink_clock),
    .reset(AsyncQueueSink_reset),
    .io_deq_ready(AsyncQueueSink_io_deq_ready),
    .io_deq_valid(AsyncQueueSink_io_deq_valid),
    .io_deq_bits_opcode(AsyncQueueSink_io_deq_bits_opcode),
    .io_deq_bits_param(AsyncQueueSink_io_deq_bits_param),
    .io_deq_bits_size(AsyncQueueSink_io_deq_bits_size),
    .io_deq_bits_source(AsyncQueueSink_io_deq_bits_source),
    .io_deq_bits_address(AsyncQueueSink_io_deq_bits_address),
    .io_deq_bits_mask(AsyncQueueSink_io_deq_bits_mask),
    .io_deq_bits_data(AsyncQueueSink_io_deq_bits_data),
    .io_deq_bits_corrupt(AsyncQueueSink_io_deq_bits_corrupt),
    .io_async_mem_0_opcode(AsyncQueueSink_io_async_mem_0_opcode),
    .io_async_mem_0_param(AsyncQueueSink_io_async_mem_0_param),
    .io_async_mem_0_size(AsyncQueueSink_io_async_mem_0_size),
    .io_async_mem_0_source(AsyncQueueSink_io_async_mem_0_source),
    .io_async_mem_0_address(AsyncQueueSink_io_async_mem_0_address),
    .io_async_mem_0_mask(AsyncQueueSink_io_async_mem_0_mask),
    .io_async_mem_0_data(AsyncQueueSink_io_async_mem_0_data),
    .io_async_mem_0_corrupt(AsyncQueueSink_io_async_mem_0_corrupt),
    .io_async_mem_1_opcode(AsyncQueueSink_io_async_mem_1_opcode),
    .io_async_mem_1_param(AsyncQueueSink_io_async_mem_1_param),
    .io_async_mem_1_size(AsyncQueueSink_io_async_mem_1_size),
    .io_async_mem_1_source(AsyncQueueSink_io_async_mem_1_source),
    .io_async_mem_1_address(AsyncQueueSink_io_async_mem_1_address),
    .io_async_mem_1_mask(AsyncQueueSink_io_async_mem_1_mask),
    .io_async_mem_1_data(AsyncQueueSink_io_async_mem_1_data),
    .io_async_mem_1_corrupt(AsyncQueueSink_io_async_mem_1_corrupt),
    .io_async_mem_2_opcode(AsyncQueueSink_io_async_mem_2_opcode),
    .io_async_mem_2_param(AsyncQueueSink_io_async_mem_2_param),
    .io_async_mem_2_size(AsyncQueueSink_io_async_mem_2_size),
    .io_async_mem_2_source(AsyncQueueSink_io_async_mem_2_source),
    .io_async_mem_2_address(AsyncQueueSink_io_async_mem_2_address),
    .io_async_mem_2_mask(AsyncQueueSink_io_async_mem_2_mask),
    .io_async_mem_2_data(AsyncQueueSink_io_async_mem_2_data),
    .io_async_mem_2_corrupt(AsyncQueueSink_io_async_mem_2_corrupt),
    .io_async_mem_3_opcode(AsyncQueueSink_io_async_mem_3_opcode),
    .io_async_mem_3_param(AsyncQueueSink_io_async_mem_3_param),
    .io_async_mem_3_size(AsyncQueueSink_io_async_mem_3_size),
    .io_async_mem_3_source(AsyncQueueSink_io_async_mem_3_source),
    .io_async_mem_3_address(AsyncQueueSink_io_async_mem_3_address),
    .io_async_mem_3_mask(AsyncQueueSink_io_async_mem_3_mask),
    .io_async_mem_3_data(AsyncQueueSink_io_async_mem_3_data),
    .io_async_mem_3_corrupt(AsyncQueueSink_io_async_mem_3_corrupt),
    .io_async_mem_4_opcode(AsyncQueueSink_io_async_mem_4_opcode),
    .io_async_mem_4_param(AsyncQueueSink_io_async_mem_4_param),
    .io_async_mem_4_size(AsyncQueueSink_io_async_mem_4_size),
    .io_async_mem_4_source(AsyncQueueSink_io_async_mem_4_source),
    .io_async_mem_4_address(AsyncQueueSink_io_async_mem_4_address),
    .io_async_mem_4_mask(AsyncQueueSink_io_async_mem_4_mask),
    .io_async_mem_4_data(AsyncQueueSink_io_async_mem_4_data),
    .io_async_mem_4_corrupt(AsyncQueueSink_io_async_mem_4_corrupt),
    .io_async_mem_5_opcode(AsyncQueueSink_io_async_mem_5_opcode),
    .io_async_mem_5_param(AsyncQueueSink_io_async_mem_5_param),
    .io_async_mem_5_size(AsyncQueueSink_io_async_mem_5_size),
    .io_async_mem_5_source(AsyncQueueSink_io_async_mem_5_source),
    .io_async_mem_5_address(AsyncQueueSink_io_async_mem_5_address),
    .io_async_mem_5_mask(AsyncQueueSink_io_async_mem_5_mask),
    .io_async_mem_5_data(AsyncQueueSink_io_async_mem_5_data),
    .io_async_mem_5_corrupt(AsyncQueueSink_io_async_mem_5_corrupt),
    .io_async_mem_6_opcode(AsyncQueueSink_io_async_mem_6_opcode),
    .io_async_mem_6_param(AsyncQueueSink_io_async_mem_6_param),
    .io_async_mem_6_size(AsyncQueueSink_io_async_mem_6_size),
    .io_async_mem_6_source(AsyncQueueSink_io_async_mem_6_source),
    .io_async_mem_6_address(AsyncQueueSink_io_async_mem_6_address),
    .io_async_mem_6_mask(AsyncQueueSink_io_async_mem_6_mask),
    .io_async_mem_6_data(AsyncQueueSink_io_async_mem_6_data),
    .io_async_mem_6_corrupt(AsyncQueueSink_io_async_mem_6_corrupt),
    .io_async_mem_7_opcode(AsyncQueueSink_io_async_mem_7_opcode),
    .io_async_mem_7_param(AsyncQueueSink_io_async_mem_7_param),
    .io_async_mem_7_size(AsyncQueueSink_io_async_mem_7_size),
    .io_async_mem_7_source(AsyncQueueSink_io_async_mem_7_source),
    .io_async_mem_7_address(AsyncQueueSink_io_async_mem_7_address),
    .io_async_mem_7_mask(AsyncQueueSink_io_async_mem_7_mask),
    .io_async_mem_7_data(AsyncQueueSink_io_async_mem_7_data),
    .io_async_mem_7_corrupt(AsyncQueueSink_io_async_mem_7_corrupt),
    .io_async_ridx(AsyncQueueSink_io_async_ridx),
    .io_async_widx(AsyncQueueSink_io_async_widx),
    .io_async_safe_ridx_valid(AsyncQueueSink_io_async_safe_ridx_valid),
    .io_async_safe_widx_valid(AsyncQueueSink_io_async_safe_widx_valid),
    .io_async_safe_source_reset_n(AsyncQueueSink_io_async_safe_source_reset_n),
    .io_async_safe_sink_reset_n(AsyncQueueSink_io_async_safe_sink_reset_n)
  );
  AsyncQueueSource_13 AsyncQueueSource ( 
    .clock(AsyncQueueSource_clock),
    .reset(AsyncQueueSource_reset),
    .io_enq_ready(AsyncQueueSource_io_enq_ready),
    .io_enq_valid(AsyncQueueSource_io_enq_valid),
    .io_enq_bits_opcode(AsyncQueueSource_io_enq_bits_opcode),
    .io_enq_bits_param(AsyncQueueSource_io_enq_bits_param),
    .io_enq_bits_size(AsyncQueueSource_io_enq_bits_size),
    .io_enq_bits_source(AsyncQueueSource_io_enq_bits_source),
    .io_enq_bits_sink(AsyncQueueSource_io_enq_bits_sink),
    .io_enq_bits_denied(AsyncQueueSource_io_enq_bits_denied),
    .io_enq_bits_data(AsyncQueueSource_io_enq_bits_data),
    .io_enq_bits_corrupt(AsyncQueueSource_io_enq_bits_corrupt),
    .io_async_mem_0_opcode(AsyncQueueSource_io_async_mem_0_opcode),
    .io_async_mem_0_param(AsyncQueueSource_io_async_mem_0_param),
    .io_async_mem_0_size(AsyncQueueSource_io_async_mem_0_size),
    .io_async_mem_0_source(AsyncQueueSource_io_async_mem_0_source),
    .io_async_mem_0_sink(AsyncQueueSource_io_async_mem_0_sink),
    .io_async_mem_0_denied(AsyncQueueSource_io_async_mem_0_denied),
    .io_async_mem_0_data(AsyncQueueSource_io_async_mem_0_data),
    .io_async_mem_0_corrupt(AsyncQueueSource_io_async_mem_0_corrupt),
    .io_async_mem_1_opcode(AsyncQueueSource_io_async_mem_1_opcode),
    .io_async_mem_1_param(AsyncQueueSource_io_async_mem_1_param),
    .io_async_mem_1_size(AsyncQueueSource_io_async_mem_1_size),
    .io_async_mem_1_source(AsyncQueueSource_io_async_mem_1_source),
    .io_async_mem_1_sink(AsyncQueueSource_io_async_mem_1_sink),
    .io_async_mem_1_denied(AsyncQueueSource_io_async_mem_1_denied),
    .io_async_mem_1_data(AsyncQueueSource_io_async_mem_1_data),
    .io_async_mem_1_corrupt(AsyncQueueSource_io_async_mem_1_corrupt),
    .io_async_mem_2_opcode(AsyncQueueSource_io_async_mem_2_opcode),
    .io_async_mem_2_param(AsyncQueueSource_io_async_mem_2_param),
    .io_async_mem_2_size(AsyncQueueSource_io_async_mem_2_size),
    .io_async_mem_2_source(AsyncQueueSource_io_async_mem_2_source),
    .io_async_mem_2_sink(AsyncQueueSource_io_async_mem_2_sink),
    .io_async_mem_2_denied(AsyncQueueSource_io_async_mem_2_denied),
    .io_async_mem_2_data(AsyncQueueSource_io_async_mem_2_data),
    .io_async_mem_2_corrupt(AsyncQueueSource_io_async_mem_2_corrupt),
    .io_async_mem_3_opcode(AsyncQueueSource_io_async_mem_3_opcode),
    .io_async_mem_3_param(AsyncQueueSource_io_async_mem_3_param),
    .io_async_mem_3_size(AsyncQueueSource_io_async_mem_3_size),
    .io_async_mem_3_source(AsyncQueueSource_io_async_mem_3_source),
    .io_async_mem_3_sink(AsyncQueueSource_io_async_mem_3_sink),
    .io_async_mem_3_denied(AsyncQueueSource_io_async_mem_3_denied),
    .io_async_mem_3_data(AsyncQueueSource_io_async_mem_3_data),
    .io_async_mem_3_corrupt(AsyncQueueSource_io_async_mem_3_corrupt),
    .io_async_mem_4_opcode(AsyncQueueSource_io_async_mem_4_opcode),
    .io_async_mem_4_param(AsyncQueueSource_io_async_mem_4_param),
    .io_async_mem_4_size(AsyncQueueSource_io_async_mem_4_size),
    .io_async_mem_4_source(AsyncQueueSource_io_async_mem_4_source),
    .io_async_mem_4_sink(AsyncQueueSource_io_async_mem_4_sink),
    .io_async_mem_4_denied(AsyncQueueSource_io_async_mem_4_denied),
    .io_async_mem_4_data(AsyncQueueSource_io_async_mem_4_data),
    .io_async_mem_4_corrupt(AsyncQueueSource_io_async_mem_4_corrupt),
    .io_async_mem_5_opcode(AsyncQueueSource_io_async_mem_5_opcode),
    .io_async_mem_5_param(AsyncQueueSource_io_async_mem_5_param),
    .io_async_mem_5_size(AsyncQueueSource_io_async_mem_5_size),
    .io_async_mem_5_source(AsyncQueueSource_io_async_mem_5_source),
    .io_async_mem_5_sink(AsyncQueueSource_io_async_mem_5_sink),
    .io_async_mem_5_denied(AsyncQueueSource_io_async_mem_5_denied),
    .io_async_mem_5_data(AsyncQueueSource_io_async_mem_5_data),
    .io_async_mem_5_corrupt(AsyncQueueSource_io_async_mem_5_corrupt),
    .io_async_mem_6_opcode(AsyncQueueSource_io_async_mem_6_opcode),
    .io_async_mem_6_param(AsyncQueueSource_io_async_mem_6_param),
    .io_async_mem_6_size(AsyncQueueSource_io_async_mem_6_size),
    .io_async_mem_6_source(AsyncQueueSource_io_async_mem_6_source),
    .io_async_mem_6_sink(AsyncQueueSource_io_async_mem_6_sink),
    .io_async_mem_6_denied(AsyncQueueSource_io_async_mem_6_denied),
    .io_async_mem_6_data(AsyncQueueSource_io_async_mem_6_data),
    .io_async_mem_6_corrupt(AsyncQueueSource_io_async_mem_6_corrupt),
    .io_async_mem_7_opcode(AsyncQueueSource_io_async_mem_7_opcode),
    .io_async_mem_7_param(AsyncQueueSource_io_async_mem_7_param),
    .io_async_mem_7_size(AsyncQueueSource_io_async_mem_7_size),
    .io_async_mem_7_source(AsyncQueueSource_io_async_mem_7_source),
    .io_async_mem_7_sink(AsyncQueueSource_io_async_mem_7_sink),
    .io_async_mem_7_denied(AsyncQueueSource_io_async_mem_7_denied),
    .io_async_mem_7_data(AsyncQueueSource_io_async_mem_7_data),
    .io_async_mem_7_corrupt(AsyncQueueSource_io_async_mem_7_corrupt),
    .io_async_ridx(AsyncQueueSource_io_async_ridx),
    .io_async_widx(AsyncQueueSource_io_async_widx),
    .io_async_safe_ridx_valid(AsyncQueueSource_io_async_safe_ridx_valid),
    .io_async_safe_widx_valid(AsyncQueueSource_io_async_safe_widx_valid),
    .io_async_safe_source_reset_n(AsyncQueueSource_io_async_safe_source_reset_n),
    .io_async_safe_sink_reset_n(AsyncQueueSource_io_async_safe_sink_reset_n)
  );
  assign auto_in_a_ridx = AsyncQueueSink_io_async_ridx; 
  assign auto_in_a_safe_ridx_valid = AsyncQueueSink_io_async_safe_ridx_valid; 
  assign auto_in_a_safe_sink_reset_n = AsyncQueueSink_io_async_safe_sink_reset_n; 
  assign auto_in_d_mem_0_opcode = AsyncQueueSource_io_async_mem_0_opcode; 
  assign auto_in_d_mem_0_param = AsyncQueueSource_io_async_mem_0_param; 
  assign auto_in_d_mem_0_size = AsyncQueueSource_io_async_mem_0_size; 
  assign auto_in_d_mem_0_source = AsyncQueueSource_io_async_mem_0_source; 
  assign auto_in_d_mem_0_sink = AsyncQueueSource_io_async_mem_0_sink; 
  assign auto_in_d_mem_0_denied = AsyncQueueSource_io_async_mem_0_denied; 
  assign auto_in_d_mem_0_data = AsyncQueueSource_io_async_mem_0_data; 
  assign auto_in_d_mem_0_corrupt = AsyncQueueSource_io_async_mem_0_corrupt; 
  assign auto_in_d_mem_1_opcode = AsyncQueueSource_io_async_mem_1_opcode; 
  assign auto_in_d_mem_1_param = AsyncQueueSource_io_async_mem_1_param; 
  assign auto_in_d_mem_1_size = AsyncQueueSource_io_async_mem_1_size; 
  assign auto_in_d_mem_1_source = AsyncQueueSource_io_async_mem_1_source; 
  assign auto_in_d_mem_1_sink = AsyncQueueSource_io_async_mem_1_sink; 
  assign auto_in_d_mem_1_denied = AsyncQueueSource_io_async_mem_1_denied; 
  assign auto_in_d_mem_1_data = AsyncQueueSource_io_async_mem_1_data; 
  assign auto_in_d_mem_1_corrupt = AsyncQueueSource_io_async_mem_1_corrupt; 
  assign auto_in_d_mem_2_opcode = AsyncQueueSource_io_async_mem_2_opcode; 
  assign auto_in_d_mem_2_param = AsyncQueueSource_io_async_mem_2_param; 
  assign auto_in_d_mem_2_size = AsyncQueueSource_io_async_mem_2_size; 
  assign auto_in_d_mem_2_source = AsyncQueueSource_io_async_mem_2_source; 
  assign auto_in_d_mem_2_sink = AsyncQueueSource_io_async_mem_2_sink; 
  assign auto_in_d_mem_2_denied = AsyncQueueSource_io_async_mem_2_denied; 
  assign auto_in_d_mem_2_data = AsyncQueueSource_io_async_mem_2_data; 
  assign auto_in_d_mem_2_corrupt = AsyncQueueSource_io_async_mem_2_corrupt; 
  assign auto_in_d_mem_3_opcode = AsyncQueueSource_io_async_mem_3_opcode; 
  assign auto_in_d_mem_3_param = AsyncQueueSource_io_async_mem_3_param; 
  assign auto_in_d_mem_3_size = AsyncQueueSource_io_async_mem_3_size; 
  assign auto_in_d_mem_3_source = AsyncQueueSource_io_async_mem_3_source; 
  assign auto_in_d_mem_3_sink = AsyncQueueSource_io_async_mem_3_sink; 
  assign auto_in_d_mem_3_denied = AsyncQueueSource_io_async_mem_3_denied; 
  assign auto_in_d_mem_3_data = AsyncQueueSource_io_async_mem_3_data; 
  assign auto_in_d_mem_3_corrupt = AsyncQueueSource_io_async_mem_3_corrupt; 
  assign auto_in_d_mem_4_opcode = AsyncQueueSource_io_async_mem_4_opcode; 
  assign auto_in_d_mem_4_param = AsyncQueueSource_io_async_mem_4_param; 
  assign auto_in_d_mem_4_size = AsyncQueueSource_io_async_mem_4_size; 
  assign auto_in_d_mem_4_source = AsyncQueueSource_io_async_mem_4_source; 
  assign auto_in_d_mem_4_sink = AsyncQueueSource_io_async_mem_4_sink; 
  assign auto_in_d_mem_4_denied = AsyncQueueSource_io_async_mem_4_denied; 
  assign auto_in_d_mem_4_data = AsyncQueueSource_io_async_mem_4_data; 
  assign auto_in_d_mem_4_corrupt = AsyncQueueSource_io_async_mem_4_corrupt; 
  assign auto_in_d_mem_5_opcode = AsyncQueueSource_io_async_mem_5_opcode; 
  assign auto_in_d_mem_5_param = AsyncQueueSource_io_async_mem_5_param; 
  assign auto_in_d_mem_5_size = AsyncQueueSource_io_async_mem_5_size; 
  assign auto_in_d_mem_5_source = AsyncQueueSource_io_async_mem_5_source; 
  assign auto_in_d_mem_5_sink = AsyncQueueSource_io_async_mem_5_sink; 
  assign auto_in_d_mem_5_denied = AsyncQueueSource_io_async_mem_5_denied; 
  assign auto_in_d_mem_5_data = AsyncQueueSource_io_async_mem_5_data; 
  assign auto_in_d_mem_5_corrupt = AsyncQueueSource_io_async_mem_5_corrupt; 
  assign auto_in_d_mem_6_opcode = AsyncQueueSource_io_async_mem_6_opcode; 
  assign auto_in_d_mem_6_param = AsyncQueueSource_io_async_mem_6_param; 
  assign auto_in_d_mem_6_size = AsyncQueueSource_io_async_mem_6_size; 
  assign auto_in_d_mem_6_source = AsyncQueueSource_io_async_mem_6_source; 
  assign auto_in_d_mem_6_sink = AsyncQueueSource_io_async_mem_6_sink; 
  assign auto_in_d_mem_6_denied = AsyncQueueSource_io_async_mem_6_denied; 
  assign auto_in_d_mem_6_data = AsyncQueueSource_io_async_mem_6_data; 
  assign auto_in_d_mem_6_corrupt = AsyncQueueSource_io_async_mem_6_corrupt; 
  assign auto_in_d_mem_7_opcode = AsyncQueueSource_io_async_mem_7_opcode; 
  assign auto_in_d_mem_7_param = AsyncQueueSource_io_async_mem_7_param; 
  assign auto_in_d_mem_7_size = AsyncQueueSource_io_async_mem_7_size; 
  assign auto_in_d_mem_7_source = AsyncQueueSource_io_async_mem_7_source; 
  assign auto_in_d_mem_7_sink = AsyncQueueSource_io_async_mem_7_sink; 
  assign auto_in_d_mem_7_denied = AsyncQueueSource_io_async_mem_7_denied; 
  assign auto_in_d_mem_7_data = AsyncQueueSource_io_async_mem_7_data; 
  assign auto_in_d_mem_7_corrupt = AsyncQueueSource_io_async_mem_7_corrupt; 
  assign auto_in_d_widx = AsyncQueueSource_io_async_widx; 
  assign auto_in_d_safe_widx_valid = AsyncQueueSource_io_async_safe_widx_valid; 
  assign auto_in_d_safe_source_reset_n = AsyncQueueSource_io_async_safe_source_reset_n; 
  assign auto_out_a_valid = AsyncQueueSink_io_deq_valid; 
  assign auto_out_a_bits_opcode = AsyncQueueSink_io_deq_bits_opcode; 
  assign auto_out_a_bits_param = AsyncQueueSink_io_deq_bits_param; 
  assign auto_out_a_bits_size = AsyncQueueSink_io_deq_bits_size; 
  assign auto_out_a_bits_source = AsyncQueueSink_io_deq_bits_source; 
  assign auto_out_a_bits_address = AsyncQueueSink_io_deq_bits_address; 
  assign auto_out_a_bits_mask = AsyncQueueSink_io_deq_bits_mask; 
  assign auto_out_a_bits_data = AsyncQueueSink_io_deq_bits_data; 
  assign auto_out_a_bits_corrupt = AsyncQueueSink_io_deq_bits_corrupt; 
  assign auto_out_d_ready = AsyncQueueSource_io_enq_ready; 
  assign AsyncQueueSink_clock = clock; 
  assign AsyncQueueSink_reset = reset; 
  assign AsyncQueueSink_io_deq_ready = auto_out_a_ready; 
  assign AsyncQueueSink_io_async_mem_0_opcode = auto_in_a_mem_0_opcode; 
  assign AsyncQueueSink_io_async_mem_0_param = auto_in_a_mem_0_param; 
  assign AsyncQueueSink_io_async_mem_0_size = auto_in_a_mem_0_size; 
  assign AsyncQueueSink_io_async_mem_0_source = auto_in_a_mem_0_source; 
  assign AsyncQueueSink_io_async_mem_0_address = auto_in_a_mem_0_address; 
  assign AsyncQueueSink_io_async_mem_0_mask = auto_in_a_mem_0_mask; 
  assign AsyncQueueSink_io_async_mem_0_data = auto_in_a_mem_0_data; 
  assign AsyncQueueSink_io_async_mem_0_corrupt = auto_in_a_mem_0_corrupt; 
  assign AsyncQueueSink_io_async_mem_1_opcode = auto_in_a_mem_1_opcode; 
  assign AsyncQueueSink_io_async_mem_1_param = auto_in_a_mem_1_param; 
  assign AsyncQueueSink_io_async_mem_1_size = auto_in_a_mem_1_size; 
  assign AsyncQueueSink_io_async_mem_1_source = auto_in_a_mem_1_source; 
  assign AsyncQueueSink_io_async_mem_1_address = auto_in_a_mem_1_address; 
  assign AsyncQueueSink_io_async_mem_1_mask = auto_in_a_mem_1_mask; 
  assign AsyncQueueSink_io_async_mem_1_data = auto_in_a_mem_1_data; 
  assign AsyncQueueSink_io_async_mem_1_corrupt = auto_in_a_mem_1_corrupt; 
  assign AsyncQueueSink_io_async_mem_2_opcode = auto_in_a_mem_2_opcode; 
  assign AsyncQueueSink_io_async_mem_2_param = auto_in_a_mem_2_param; 
  assign AsyncQueueSink_io_async_mem_2_size = auto_in_a_mem_2_size; 
  assign AsyncQueueSink_io_async_mem_2_source = auto_in_a_mem_2_source; 
  assign AsyncQueueSink_io_async_mem_2_address = auto_in_a_mem_2_address; 
  assign AsyncQueueSink_io_async_mem_2_mask = auto_in_a_mem_2_mask; 
  assign AsyncQueueSink_io_async_mem_2_data = auto_in_a_mem_2_data; 
  assign AsyncQueueSink_io_async_mem_2_corrupt = auto_in_a_mem_2_corrupt; 
  assign AsyncQueueSink_io_async_mem_3_opcode = auto_in_a_mem_3_opcode; 
  assign AsyncQueueSink_io_async_mem_3_param = auto_in_a_mem_3_param; 
  assign AsyncQueueSink_io_async_mem_3_size = auto_in_a_mem_3_size; 
  assign AsyncQueueSink_io_async_mem_3_source = auto_in_a_mem_3_source; 
  assign AsyncQueueSink_io_async_mem_3_address = auto_in_a_mem_3_address; 
  assign AsyncQueueSink_io_async_mem_3_mask = auto_in_a_mem_3_mask; 
  assign AsyncQueueSink_io_async_mem_3_data = auto_in_a_mem_3_data; 
  assign AsyncQueueSink_io_async_mem_3_corrupt = auto_in_a_mem_3_corrupt; 
  assign AsyncQueueSink_io_async_mem_4_opcode = auto_in_a_mem_4_opcode; 
  assign AsyncQueueSink_io_async_mem_4_param = auto_in_a_mem_4_param; 
  assign AsyncQueueSink_io_async_mem_4_size = auto_in_a_mem_4_size; 
  assign AsyncQueueSink_io_async_mem_4_source = auto_in_a_mem_4_source; 
  assign AsyncQueueSink_io_async_mem_4_address = auto_in_a_mem_4_address; 
  assign AsyncQueueSink_io_async_mem_4_mask = auto_in_a_mem_4_mask; 
  assign AsyncQueueSink_io_async_mem_4_data = auto_in_a_mem_4_data; 
  assign AsyncQueueSink_io_async_mem_4_corrupt = auto_in_a_mem_4_corrupt; 
  assign AsyncQueueSink_io_async_mem_5_opcode = auto_in_a_mem_5_opcode; 
  assign AsyncQueueSink_io_async_mem_5_param = auto_in_a_mem_5_param; 
  assign AsyncQueueSink_io_async_mem_5_size = auto_in_a_mem_5_size; 
  assign AsyncQueueSink_io_async_mem_5_source = auto_in_a_mem_5_source; 
  assign AsyncQueueSink_io_async_mem_5_address = auto_in_a_mem_5_address; 
  assign AsyncQueueSink_io_async_mem_5_mask = auto_in_a_mem_5_mask; 
  assign AsyncQueueSink_io_async_mem_5_data = auto_in_a_mem_5_data; 
  assign AsyncQueueSink_io_async_mem_5_corrupt = auto_in_a_mem_5_corrupt; 
  assign AsyncQueueSink_io_async_mem_6_opcode = auto_in_a_mem_6_opcode; 
  assign AsyncQueueSink_io_async_mem_6_param = auto_in_a_mem_6_param; 
  assign AsyncQueueSink_io_async_mem_6_size = auto_in_a_mem_6_size; 
  assign AsyncQueueSink_io_async_mem_6_source = auto_in_a_mem_6_source; 
  assign AsyncQueueSink_io_async_mem_6_address = auto_in_a_mem_6_address; 
  assign AsyncQueueSink_io_async_mem_6_mask = auto_in_a_mem_6_mask; 
  assign AsyncQueueSink_io_async_mem_6_data = auto_in_a_mem_6_data; 
  assign AsyncQueueSink_io_async_mem_6_corrupt = auto_in_a_mem_6_corrupt; 
  assign AsyncQueueSink_io_async_mem_7_opcode = auto_in_a_mem_7_opcode; 
  assign AsyncQueueSink_io_async_mem_7_param = auto_in_a_mem_7_param; 
  assign AsyncQueueSink_io_async_mem_7_size = auto_in_a_mem_7_size; 
  assign AsyncQueueSink_io_async_mem_7_source = auto_in_a_mem_7_source; 
  assign AsyncQueueSink_io_async_mem_7_address = auto_in_a_mem_7_address; 
  assign AsyncQueueSink_io_async_mem_7_mask = auto_in_a_mem_7_mask; 
  assign AsyncQueueSink_io_async_mem_7_data = auto_in_a_mem_7_data; 
  assign AsyncQueueSink_io_async_mem_7_corrupt = auto_in_a_mem_7_corrupt; 
  assign AsyncQueueSink_io_async_widx = auto_in_a_widx; 
  assign AsyncQueueSink_io_async_safe_widx_valid = auto_in_a_safe_widx_valid; 
  assign AsyncQueueSink_io_async_safe_source_reset_n = auto_in_a_safe_source_reset_n; 
  assign AsyncQueueSource_clock = clock; 
  assign AsyncQueueSource_reset = reset; 
  assign AsyncQueueSource_io_enq_valid = auto_out_d_valid; 
  assign AsyncQueueSource_io_enq_bits_opcode = auto_out_d_bits_opcode; 
  assign AsyncQueueSource_io_enq_bits_param = auto_out_d_bits_param; 
  assign AsyncQueueSource_io_enq_bits_size = auto_out_d_bits_size; 
  assign AsyncQueueSource_io_enq_bits_source = auto_out_d_bits_source; 
  assign AsyncQueueSource_io_enq_bits_sink = auto_out_d_bits_sink; 
  assign AsyncQueueSource_io_enq_bits_denied = auto_out_d_bits_denied; 
  assign AsyncQueueSource_io_enq_bits_data = auto_out_d_bits_data; 
  assign AsyncQueueSource_io_enq_bits_corrupt = auto_out_d_bits_corrupt; 
  assign AsyncQueueSource_io_async_ridx = auto_in_d_ridx; 
  assign AsyncQueueSource_io_async_safe_ridx_valid = auto_in_d_safe_ridx_valid; 
  assign AsyncQueueSource_io_async_safe_sink_reset_n = auto_in_d_safe_sink_reset_n; 
endmodule
