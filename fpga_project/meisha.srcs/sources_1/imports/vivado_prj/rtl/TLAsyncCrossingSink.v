module TLAsyncCrossingSink( 
  input         clock, 
  input         reset, 
  input  [2:0]  auto_in_a_mem_0_opcode, 
  input  [8:0]  auto_in_a_mem_0_address, 
  input  [3:0]  auto_in_a_mem_0_mask, 
  input  [31:0] auto_in_a_mem_0_data, 
  output        auto_in_a_ridx, 
  input         auto_in_a_widx, 
  output        auto_in_a_safe_ridx_valid, 
  input         auto_in_a_safe_widx_valid, 
  input         auto_in_a_safe_source_reset_n, 
  output        auto_in_a_safe_sink_reset_n, 
  output [2:0]  auto_in_d_mem_0_opcode, 
  output [1:0]  auto_in_d_mem_0_size, 
  output        auto_in_d_mem_0_source, 
  output [31:0] auto_in_d_mem_0_data, 
  input         auto_in_d_ridx, 
  output        auto_in_d_widx, 
  input         auto_in_d_safe_ridx_valid, 
  output        auto_in_d_safe_widx_valid, 
  output        auto_in_d_safe_source_reset_n, 
  input         auto_in_d_safe_sink_reset_n, 
  input         auto_out_a_ready, 
  output        auto_out_a_valid, 
  output [2:0]  auto_out_a_bits_opcode, 
  output [2:0]  auto_out_a_bits_param, 
  output [1:0]  auto_out_a_bits_size, 
  output        auto_out_a_bits_source, 
  output [8:0]  auto_out_a_bits_address, 
  output [3:0]  auto_out_a_bits_mask, 
  output [31:0] auto_out_a_bits_data, 
  output        auto_out_a_bits_corrupt, 
  output        auto_out_d_ready, 
  input         auto_out_d_valid, 
  input  [2:0]  auto_out_d_bits_opcode, 
  input  [1:0]  auto_out_d_bits_size, 
  input         auto_out_d_bits_source, 
  input  [31:0] auto_out_d_bits_data 
);
  wire  AsyncQueueSink_clock; 
  wire  AsyncQueueSink_reset; 
  wire  AsyncQueueSink_io_deq_ready; 
  wire  AsyncQueueSink_io_deq_valid; 
  wire [2:0] AsyncQueueSink_io_deq_bits_opcode; 
  wire [2:0] AsyncQueueSink_io_deq_bits_param; 
  wire [1:0] AsyncQueueSink_io_deq_bits_size; 
  wire  AsyncQueueSink_io_deq_bits_source; 
  wire [8:0] AsyncQueueSink_io_deq_bits_address; 
  wire [3:0] AsyncQueueSink_io_deq_bits_mask; 
  wire [31:0] AsyncQueueSink_io_deq_bits_data; 
  wire  AsyncQueueSink_io_deq_bits_corrupt; 
  wire [2:0] AsyncQueueSink_io_async_mem_0_opcode; 
  wire [8:0] AsyncQueueSink_io_async_mem_0_address; 
  wire [3:0] AsyncQueueSink_io_async_mem_0_mask; 
  wire [31:0] AsyncQueueSink_io_async_mem_0_data; 
  wire  AsyncQueueSink_io_async_ridx; 
  wire  AsyncQueueSink_io_async_widx; 
  wire  AsyncQueueSink_io_async_safe_ridx_valid; 
  wire  AsyncQueueSink_io_async_safe_widx_valid; 
  wire  AsyncQueueSink_io_async_safe_source_reset_n; 
  wire  AsyncQueueSink_io_async_safe_sink_reset_n; 
  wire  AsyncQueueSource_clock; 
  wire  AsyncQueueSource_reset; 
  wire  AsyncQueueSource_io_enq_ready; 
  wire  AsyncQueueSource_io_enq_valid; 
  wire [2:0] AsyncQueueSource_io_enq_bits_opcode; 
  wire [1:0] AsyncQueueSource_io_enq_bits_size; 
  wire  AsyncQueueSource_io_enq_bits_source; 
  wire [31:0] AsyncQueueSource_io_enq_bits_data; 
  wire [2:0] AsyncQueueSource_io_async_mem_0_opcode; 
  wire [1:0] AsyncQueueSource_io_async_mem_0_size; 
  wire  AsyncQueueSource_io_async_mem_0_source; 
  wire [31:0] AsyncQueueSource_io_async_mem_0_data; 
  wire  AsyncQueueSource_io_async_ridx; 
  wire  AsyncQueueSource_io_async_widx; 
  wire  AsyncQueueSource_io_async_safe_ridx_valid; 
  wire  AsyncQueueSource_io_async_safe_widx_valid; 
  wire  AsyncQueueSource_io_async_safe_source_reset_n; 
  wire  AsyncQueueSource_io_async_safe_sink_reset_n; 
  AsyncQueueSink_1 AsyncQueueSink ( 
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
    .io_async_mem_0_address(AsyncQueueSink_io_async_mem_0_address),
    .io_async_mem_0_mask(AsyncQueueSink_io_async_mem_0_mask),
    .io_async_mem_0_data(AsyncQueueSink_io_async_mem_0_data),
    .io_async_ridx(AsyncQueueSink_io_async_ridx),
    .io_async_widx(AsyncQueueSink_io_async_widx),
    .io_async_safe_ridx_valid(AsyncQueueSink_io_async_safe_ridx_valid),
    .io_async_safe_widx_valid(AsyncQueueSink_io_async_safe_widx_valid),
    .io_async_safe_source_reset_n(AsyncQueueSink_io_async_safe_source_reset_n),
    .io_async_safe_sink_reset_n(AsyncQueueSink_io_async_safe_sink_reset_n)
  );
  AsyncQueueSource_2 AsyncQueueSource ( 
    .clock(AsyncQueueSource_clock),
    .reset(AsyncQueueSource_reset),
    .io_enq_ready(AsyncQueueSource_io_enq_ready),
    .io_enq_valid(AsyncQueueSource_io_enq_valid),
    .io_enq_bits_opcode(AsyncQueueSource_io_enq_bits_opcode),
    .io_enq_bits_size(AsyncQueueSource_io_enq_bits_size),
    .io_enq_bits_source(AsyncQueueSource_io_enq_bits_source),
    .io_enq_bits_data(AsyncQueueSource_io_enq_bits_data),
    .io_async_mem_0_opcode(AsyncQueueSource_io_async_mem_0_opcode),
    .io_async_mem_0_size(AsyncQueueSource_io_async_mem_0_size),
    .io_async_mem_0_source(AsyncQueueSource_io_async_mem_0_source),
    .io_async_mem_0_data(AsyncQueueSource_io_async_mem_0_data),
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
  assign auto_in_d_mem_0_size = AsyncQueueSource_io_async_mem_0_size; 
  assign auto_in_d_mem_0_source = AsyncQueueSource_io_async_mem_0_source; 
  assign auto_in_d_mem_0_data = AsyncQueueSource_io_async_mem_0_data; 
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
  assign AsyncQueueSink_io_async_mem_0_address = auto_in_a_mem_0_address; 
  assign AsyncQueueSink_io_async_mem_0_mask = auto_in_a_mem_0_mask; 
  assign AsyncQueueSink_io_async_mem_0_data = auto_in_a_mem_0_data; 
  assign AsyncQueueSink_io_async_widx = auto_in_a_widx; 
  assign AsyncQueueSink_io_async_safe_widx_valid = auto_in_a_safe_widx_valid; 
  assign AsyncQueueSink_io_async_safe_source_reset_n = auto_in_a_safe_source_reset_n; 
  assign AsyncQueueSource_clock = clock; 
  assign AsyncQueueSource_reset = reset; 
  assign AsyncQueueSource_io_enq_valid = auto_out_d_valid; 
  assign AsyncQueueSource_io_enq_bits_opcode = auto_out_d_bits_opcode; 
  assign AsyncQueueSource_io_enq_bits_size = auto_out_d_bits_size; 
  assign AsyncQueueSource_io_enq_bits_source = auto_out_d_bits_source; 
  assign AsyncQueueSource_io_enq_bits_data = auto_out_d_bits_data; 
  assign AsyncQueueSource_io_async_ridx = auto_in_d_ridx; 
  assign AsyncQueueSource_io_async_safe_ridx_valid = auto_in_d_safe_ridx_valid; 
  assign AsyncQueueSource_io_async_safe_sink_reset_n = auto_in_d_safe_sink_reset_n; 
endmodule
