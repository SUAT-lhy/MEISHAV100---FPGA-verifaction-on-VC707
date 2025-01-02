module TLDebugModuleInnerAsync( 
  input         clock, 
  input         reset, 
  input  [2:0]  auto_dmiXing_in_a_mem_0_opcode, 
  input  [8:0]  auto_dmiXing_in_a_mem_0_address, 
  input  [3:0]  auto_dmiXing_in_a_mem_0_mask, 
  input  [31:0] auto_dmiXing_in_a_mem_0_data, 
  output        auto_dmiXing_in_a_ridx, 
  input         auto_dmiXing_in_a_widx, 
  output        auto_dmiXing_in_a_safe_ridx_valid, 
  input         auto_dmiXing_in_a_safe_widx_valid, 
  input         auto_dmiXing_in_a_safe_source_reset_n, 
  output        auto_dmiXing_in_a_safe_sink_reset_n, 
  output [2:0]  auto_dmiXing_in_d_mem_0_opcode, 
  output [1:0]  auto_dmiXing_in_d_mem_0_size, 
  output        auto_dmiXing_in_d_mem_0_source, 
  output [31:0] auto_dmiXing_in_d_mem_0_data, 
  input         auto_dmiXing_in_d_ridx, 
  output        auto_dmiXing_in_d_widx, 
  input         auto_dmiXing_in_d_safe_ridx_valid, 
  output        auto_dmiXing_in_d_safe_widx_valid, 
  output        auto_dmiXing_in_d_safe_source_reset_n, 
  input         auto_dmiXing_in_d_safe_sink_reset_n, 
  output        auto_dmInner_tl_in_a_ready, 
  input         auto_dmInner_tl_in_a_valid, 
  input  [2:0]  auto_dmInner_tl_in_a_bits_opcode, 
  input  [2:0]  auto_dmInner_tl_in_a_bits_param, 
  input  [1:0]  auto_dmInner_tl_in_a_bits_size, 
  input  [8:0]  auto_dmInner_tl_in_a_bits_source, 
  input  [11:0] auto_dmInner_tl_in_a_bits_address, 
  input  [7:0]  auto_dmInner_tl_in_a_bits_mask, 
  input  [63:0] auto_dmInner_tl_in_a_bits_data, 
  input         auto_dmInner_tl_in_a_bits_corrupt, 
  input         auto_dmInner_tl_in_d_ready, 
  output        auto_dmInner_tl_in_d_valid, 
  output [2:0]  auto_dmInner_tl_in_d_bits_opcode, 
  output [1:0]  auto_dmInner_tl_in_d_bits_size, 
  output [8:0]  auto_dmInner_tl_in_d_bits_source, 
  output [63:0] auto_dmInner_tl_in_d_bits_data, 
  input         io_dmactive, 
  input         io_innerCtrl_mem_0_resumereq, 
  input  [9:0]  io_innerCtrl_mem_0_hartsel, 
  input         io_innerCtrl_mem_0_ackhavereset, 
  output        io_innerCtrl_ridx, 
  input         io_innerCtrl_widx, 
  output        io_innerCtrl_safe_ridx_valid, 
  input         io_innerCtrl_safe_widx_valid, 
  input         io_innerCtrl_safe_source_reset_n, 
  output        io_innerCtrl_safe_sink_reset_n 
);
  wire  dmInner_clock; 
  wire  dmInner_reset; 
  wire  dmInner_auto_tl_in_a_ready; 
  wire  dmInner_auto_tl_in_a_valid; 
  wire [2:0] dmInner_auto_tl_in_a_bits_opcode; 
  wire [2:0] dmInner_auto_tl_in_a_bits_param; 
  wire [1:0] dmInner_auto_tl_in_a_bits_size; 
  wire [8:0] dmInner_auto_tl_in_a_bits_source; 
  wire [11:0] dmInner_auto_tl_in_a_bits_address; 
  wire [7:0] dmInner_auto_tl_in_a_bits_mask; 
  wire [63:0] dmInner_auto_tl_in_a_bits_data; 
  wire  dmInner_auto_tl_in_a_bits_corrupt; 
  wire  dmInner_auto_tl_in_d_ready; 
  wire  dmInner_auto_tl_in_d_valid; 
  wire [2:0] dmInner_auto_tl_in_d_bits_opcode; 
  wire [1:0] dmInner_auto_tl_in_d_bits_size; 
  wire [8:0] dmInner_auto_tl_in_d_bits_source; 
  wire [63:0] dmInner_auto_tl_in_d_bits_data; 
  wire  dmInner_auto_dmi_in_a_ready; 
  wire  dmInner_auto_dmi_in_a_valid; 
  wire [2:0] dmInner_auto_dmi_in_a_bits_opcode; 
  wire [2:0] dmInner_auto_dmi_in_a_bits_param; 
  wire [1:0] dmInner_auto_dmi_in_a_bits_size; 
  wire  dmInner_auto_dmi_in_a_bits_source; 
  wire [8:0] dmInner_auto_dmi_in_a_bits_address; 
  wire [3:0] dmInner_auto_dmi_in_a_bits_mask; 
  wire [31:0] dmInner_auto_dmi_in_a_bits_data; 
  wire  dmInner_auto_dmi_in_a_bits_corrupt; 
  wire  dmInner_auto_dmi_in_d_ready; 
  wire  dmInner_auto_dmi_in_d_valid; 
  wire [2:0] dmInner_auto_dmi_in_d_bits_opcode; 
  wire [1:0] dmInner_auto_dmi_in_d_bits_size; 
  wire  dmInner_auto_dmi_in_d_bits_source; 
  wire [31:0] dmInner_auto_dmi_in_d_bits_data; 
  wire  dmInner_io_dmactive; 
  wire  dmInner_io_innerCtrl_ready; 
  wire  dmInner_io_innerCtrl_valid; 
  wire  dmInner_io_innerCtrl_bits_resumereq; 
  wire [9:0] dmInner_io_innerCtrl_bits_hartsel; 
  wire  dmInner_io_innerCtrl_bits_ackhavereset; 
  wire  dmiXing_clock; 
  wire  dmiXing_reset; 
  wire [2:0] dmiXing_auto_in_a_mem_0_opcode; 
  wire [8:0] dmiXing_auto_in_a_mem_0_address; 
  wire [3:0] dmiXing_auto_in_a_mem_0_mask; 
  wire [31:0] dmiXing_auto_in_a_mem_0_data; 
  wire  dmiXing_auto_in_a_ridx; 
  wire  dmiXing_auto_in_a_widx; 
  wire  dmiXing_auto_in_a_safe_ridx_valid; 
  wire  dmiXing_auto_in_a_safe_widx_valid; 
  wire  dmiXing_auto_in_a_safe_source_reset_n; 
  wire  dmiXing_auto_in_a_safe_sink_reset_n; 
  wire [2:0] dmiXing_auto_in_d_mem_0_opcode; 
  wire [1:0] dmiXing_auto_in_d_mem_0_size; 
  wire  dmiXing_auto_in_d_mem_0_source; 
  wire [31:0] dmiXing_auto_in_d_mem_0_data; 
  wire  dmiXing_auto_in_d_ridx; 
  wire  dmiXing_auto_in_d_widx; 
  wire  dmiXing_auto_in_d_safe_ridx_valid; 
  wire  dmiXing_auto_in_d_safe_widx_valid; 
  wire  dmiXing_auto_in_d_safe_source_reset_n; 
  wire  dmiXing_auto_in_d_safe_sink_reset_n; 
  wire  dmiXing_auto_out_a_ready; 
  wire  dmiXing_auto_out_a_valid; 
  wire [2:0] dmiXing_auto_out_a_bits_opcode; 
  wire [2:0] dmiXing_auto_out_a_bits_param; 
  wire [1:0] dmiXing_auto_out_a_bits_size; 
  wire  dmiXing_auto_out_a_bits_source; 
  wire [8:0] dmiXing_auto_out_a_bits_address; 
  wire [3:0] dmiXing_auto_out_a_bits_mask; 
  wire [31:0] dmiXing_auto_out_a_bits_data; 
  wire  dmiXing_auto_out_a_bits_corrupt; 
  wire  dmiXing_auto_out_d_ready; 
  wire  dmiXing_auto_out_d_valid; 
  wire [2:0] dmiXing_auto_out_d_bits_opcode; 
  wire [1:0] dmiXing_auto_out_d_bits_size; 
  wire  dmiXing_auto_out_d_bits_source; 
  wire [31:0] dmiXing_auto_out_d_bits_data; 
  wire  AsyncQueueSink_clock; 
  wire  AsyncQueueSink_reset; 
  wire  AsyncQueueSink_io_deq_valid; 
  wire  AsyncQueueSink_io_deq_bits_resumereq; 
  wire [9:0] AsyncQueueSink_io_deq_bits_hartsel; 
  wire  AsyncQueueSink_io_deq_bits_ackhavereset; 
  wire  AsyncQueueSink_io_async_mem_0_resumereq; 
  wire [9:0] AsyncQueueSink_io_async_mem_0_hartsel; 
  wire  AsyncQueueSink_io_async_mem_0_ackhavereset; 
  wire  AsyncQueueSink_io_async_ridx; 
  wire  AsyncQueueSink_io_async_widx; 
  wire  AsyncQueueSink_io_async_safe_ridx_valid; 
  wire  AsyncQueueSink_io_async_safe_widx_valid; 
  wire  AsyncQueueSink_io_async_safe_source_reset_n; 
  wire  AsyncQueueSink_io_async_safe_sink_reset_n; 
  wire  dmactiveSync_clock; 
  wire  dmactiveSync_reset; 
  wire  dmactiveSync_io_sync_reset; 
  TLDebugModuleInner dmInner ( 
    .clock(dmInner_clock),
    .reset(dmInner_reset),
    .auto_tl_in_a_ready(dmInner_auto_tl_in_a_ready),
    .auto_tl_in_a_valid(dmInner_auto_tl_in_a_valid),
    .auto_tl_in_a_bits_opcode(dmInner_auto_tl_in_a_bits_opcode),
    .auto_tl_in_a_bits_param(dmInner_auto_tl_in_a_bits_param),
    .auto_tl_in_a_bits_size(dmInner_auto_tl_in_a_bits_size),
    .auto_tl_in_a_bits_source(dmInner_auto_tl_in_a_bits_source),
    .auto_tl_in_a_bits_address(dmInner_auto_tl_in_a_bits_address),
    .auto_tl_in_a_bits_mask(dmInner_auto_tl_in_a_bits_mask),
    .auto_tl_in_a_bits_data(dmInner_auto_tl_in_a_bits_data),
    .auto_tl_in_a_bits_corrupt(dmInner_auto_tl_in_a_bits_corrupt),
    .auto_tl_in_d_ready(dmInner_auto_tl_in_d_ready),
    .auto_tl_in_d_valid(dmInner_auto_tl_in_d_valid),
    .auto_tl_in_d_bits_opcode(dmInner_auto_tl_in_d_bits_opcode),
    .auto_tl_in_d_bits_size(dmInner_auto_tl_in_d_bits_size),
    .auto_tl_in_d_bits_source(dmInner_auto_tl_in_d_bits_source),
    .auto_tl_in_d_bits_data(dmInner_auto_tl_in_d_bits_data),
    .auto_dmi_in_a_ready(dmInner_auto_dmi_in_a_ready),
    .auto_dmi_in_a_valid(dmInner_auto_dmi_in_a_valid),
    .auto_dmi_in_a_bits_opcode(dmInner_auto_dmi_in_a_bits_opcode),
    .auto_dmi_in_a_bits_param(dmInner_auto_dmi_in_a_bits_param),
    .auto_dmi_in_a_bits_size(dmInner_auto_dmi_in_a_bits_size),
    .auto_dmi_in_a_bits_source(dmInner_auto_dmi_in_a_bits_source),
    .auto_dmi_in_a_bits_address(dmInner_auto_dmi_in_a_bits_address),
    .auto_dmi_in_a_bits_mask(dmInner_auto_dmi_in_a_bits_mask),
    .auto_dmi_in_a_bits_data(dmInner_auto_dmi_in_a_bits_data),
    .auto_dmi_in_a_bits_corrupt(dmInner_auto_dmi_in_a_bits_corrupt),
    .auto_dmi_in_d_ready(dmInner_auto_dmi_in_d_ready),
    .auto_dmi_in_d_valid(dmInner_auto_dmi_in_d_valid),
    .auto_dmi_in_d_bits_opcode(dmInner_auto_dmi_in_d_bits_opcode),
    .auto_dmi_in_d_bits_size(dmInner_auto_dmi_in_d_bits_size),
    .auto_dmi_in_d_bits_source(dmInner_auto_dmi_in_d_bits_source),
    .auto_dmi_in_d_bits_data(dmInner_auto_dmi_in_d_bits_data),
    .io_dmactive(dmInner_io_dmactive),
    .io_innerCtrl_ready(dmInner_io_innerCtrl_ready),
    .io_innerCtrl_valid(dmInner_io_innerCtrl_valid),
    .io_innerCtrl_bits_resumereq(dmInner_io_innerCtrl_bits_resumereq),
    .io_innerCtrl_bits_hartsel(dmInner_io_innerCtrl_bits_hartsel),
    .io_innerCtrl_bits_ackhavereset(dmInner_io_innerCtrl_bits_ackhavereset)
  );
  TLAsyncCrossingSink dmiXing ( 
    .clock(dmiXing_clock),
    .reset(dmiXing_reset),
    .auto_in_a_mem_0_opcode(dmiXing_auto_in_a_mem_0_opcode),
    .auto_in_a_mem_0_address(dmiXing_auto_in_a_mem_0_address),
    .auto_in_a_mem_0_mask(dmiXing_auto_in_a_mem_0_mask),
    .auto_in_a_mem_0_data(dmiXing_auto_in_a_mem_0_data),
    .auto_in_a_ridx(dmiXing_auto_in_a_ridx),
    .auto_in_a_widx(dmiXing_auto_in_a_widx),
    .auto_in_a_safe_ridx_valid(dmiXing_auto_in_a_safe_ridx_valid),
    .auto_in_a_safe_widx_valid(dmiXing_auto_in_a_safe_widx_valid),
    .auto_in_a_safe_source_reset_n(dmiXing_auto_in_a_safe_source_reset_n),
    .auto_in_a_safe_sink_reset_n(dmiXing_auto_in_a_safe_sink_reset_n),
    .auto_in_d_mem_0_opcode(dmiXing_auto_in_d_mem_0_opcode),
    .auto_in_d_mem_0_size(dmiXing_auto_in_d_mem_0_size),
    .auto_in_d_mem_0_source(dmiXing_auto_in_d_mem_0_source),
    .auto_in_d_mem_0_data(dmiXing_auto_in_d_mem_0_data),
    .auto_in_d_ridx(dmiXing_auto_in_d_ridx),
    .auto_in_d_widx(dmiXing_auto_in_d_widx),
    .auto_in_d_safe_ridx_valid(dmiXing_auto_in_d_safe_ridx_valid),
    .auto_in_d_safe_widx_valid(dmiXing_auto_in_d_safe_widx_valid),
    .auto_in_d_safe_source_reset_n(dmiXing_auto_in_d_safe_source_reset_n),
    .auto_in_d_safe_sink_reset_n(dmiXing_auto_in_d_safe_sink_reset_n),
    .auto_out_a_ready(dmiXing_auto_out_a_ready),
    .auto_out_a_valid(dmiXing_auto_out_a_valid),
    .auto_out_a_bits_opcode(dmiXing_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(dmiXing_auto_out_a_bits_param),
    .auto_out_a_bits_size(dmiXing_auto_out_a_bits_size),
    .auto_out_a_bits_source(dmiXing_auto_out_a_bits_source),
    .auto_out_a_bits_address(dmiXing_auto_out_a_bits_address),
    .auto_out_a_bits_mask(dmiXing_auto_out_a_bits_mask),
    .auto_out_a_bits_data(dmiXing_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(dmiXing_auto_out_a_bits_corrupt),
    .auto_out_d_ready(dmiXing_auto_out_d_ready),
    .auto_out_d_valid(dmiXing_auto_out_d_valid),
    .auto_out_d_bits_opcode(dmiXing_auto_out_d_bits_opcode),
    .auto_out_d_bits_size(dmiXing_auto_out_d_bits_size),
    .auto_out_d_bits_source(dmiXing_auto_out_d_bits_source),
    .auto_out_d_bits_data(dmiXing_auto_out_d_bits_data)
  );
  AsyncQueueSink_2 AsyncQueueSink ( 
    .clock(AsyncQueueSink_clock),
    .reset(AsyncQueueSink_reset),
    .io_deq_valid(AsyncQueueSink_io_deq_valid),
    .io_deq_bits_resumereq(AsyncQueueSink_io_deq_bits_resumereq),
    .io_deq_bits_hartsel(AsyncQueueSink_io_deq_bits_hartsel),
    .io_deq_bits_ackhavereset(AsyncQueueSink_io_deq_bits_ackhavereset),
    .io_async_mem_0_resumereq(AsyncQueueSink_io_async_mem_0_resumereq),
    .io_async_mem_0_hartsel(AsyncQueueSink_io_async_mem_0_hartsel),
    .io_async_mem_0_ackhavereset(AsyncQueueSink_io_async_mem_0_ackhavereset),
    .io_async_ridx(AsyncQueueSink_io_async_ridx),
    .io_async_widx(AsyncQueueSink_io_async_widx),
    .io_async_safe_ridx_valid(AsyncQueueSink_io_async_safe_ridx_valid),
    .io_async_safe_widx_valid(AsyncQueueSink_io_async_safe_widx_valid),
    .io_async_safe_source_reset_n(AsyncQueueSink_io_async_safe_source_reset_n),
    .io_async_safe_sink_reset_n(AsyncQueueSink_io_async_safe_sink_reset_n)
  );
  ResetCatchAndSync_d3 dmactiveSync ( 
    .clock(dmactiveSync_clock),
    .reset(dmactiveSync_reset),
    .io_sync_reset(dmactiveSync_io_sync_reset)
  );
  assign auto_dmiXing_in_a_ridx = dmiXing_auto_in_a_ridx; 
  assign auto_dmiXing_in_a_safe_ridx_valid = dmiXing_auto_in_a_safe_ridx_valid; 
  assign auto_dmiXing_in_a_safe_sink_reset_n = dmiXing_auto_in_a_safe_sink_reset_n; 
  assign auto_dmiXing_in_d_mem_0_opcode = dmiXing_auto_in_d_mem_0_opcode; 
  assign auto_dmiXing_in_d_mem_0_size = dmiXing_auto_in_d_mem_0_size; 
  assign auto_dmiXing_in_d_mem_0_source = dmiXing_auto_in_d_mem_0_source; 
  assign auto_dmiXing_in_d_mem_0_data = dmiXing_auto_in_d_mem_0_data; 
  assign auto_dmiXing_in_d_widx = dmiXing_auto_in_d_widx; 
  assign auto_dmiXing_in_d_safe_widx_valid = dmiXing_auto_in_d_safe_widx_valid; 
  assign auto_dmiXing_in_d_safe_source_reset_n = dmiXing_auto_in_d_safe_source_reset_n; 
  assign auto_dmInner_tl_in_a_ready = dmInner_auto_tl_in_a_ready; 
  assign auto_dmInner_tl_in_d_valid = dmInner_auto_tl_in_d_valid; 
  assign auto_dmInner_tl_in_d_bits_opcode = dmInner_auto_tl_in_d_bits_opcode; 
  assign auto_dmInner_tl_in_d_bits_size = dmInner_auto_tl_in_d_bits_size; 
  assign auto_dmInner_tl_in_d_bits_source = dmInner_auto_tl_in_d_bits_source; 
  assign auto_dmInner_tl_in_d_bits_data = dmInner_auto_tl_in_d_bits_data; 
  assign io_innerCtrl_ridx = AsyncQueueSink_io_async_ridx; 
  assign io_innerCtrl_safe_ridx_valid = AsyncQueueSink_io_async_safe_ridx_valid; 
  assign io_innerCtrl_safe_sink_reset_n = AsyncQueueSink_io_async_safe_sink_reset_n; 
  assign dmInner_clock = clock; 
  assign dmInner_reset = reset; 
  assign dmInner_auto_tl_in_a_valid = auto_dmInner_tl_in_a_valid; 
  assign dmInner_auto_tl_in_a_bits_opcode = auto_dmInner_tl_in_a_bits_opcode; 
  assign dmInner_auto_tl_in_a_bits_param = auto_dmInner_tl_in_a_bits_param; 
  assign dmInner_auto_tl_in_a_bits_size = auto_dmInner_tl_in_a_bits_size; 
  assign dmInner_auto_tl_in_a_bits_source = auto_dmInner_tl_in_a_bits_source; 
  assign dmInner_auto_tl_in_a_bits_address = auto_dmInner_tl_in_a_bits_address; 
  assign dmInner_auto_tl_in_a_bits_mask = auto_dmInner_tl_in_a_bits_mask; 
  assign dmInner_auto_tl_in_a_bits_data = auto_dmInner_tl_in_a_bits_data; 
  assign dmInner_auto_tl_in_a_bits_corrupt = auto_dmInner_tl_in_a_bits_corrupt; 
  assign dmInner_auto_tl_in_d_ready = auto_dmInner_tl_in_d_ready; 
  assign dmInner_auto_dmi_in_a_valid = dmiXing_auto_out_a_valid; 
  assign dmInner_auto_dmi_in_a_bits_opcode = dmiXing_auto_out_a_bits_opcode; 
  assign dmInner_auto_dmi_in_a_bits_param = dmiXing_auto_out_a_bits_param; 
  assign dmInner_auto_dmi_in_a_bits_size = dmiXing_auto_out_a_bits_size; 
  assign dmInner_auto_dmi_in_a_bits_source = dmiXing_auto_out_a_bits_source; 
  assign dmInner_auto_dmi_in_a_bits_address = dmiXing_auto_out_a_bits_address; 
  assign dmInner_auto_dmi_in_a_bits_mask = dmiXing_auto_out_a_bits_mask; 
  assign dmInner_auto_dmi_in_a_bits_data = dmiXing_auto_out_a_bits_data; 
  assign dmInner_auto_dmi_in_a_bits_corrupt = dmiXing_auto_out_a_bits_corrupt; 
  assign dmInner_auto_dmi_in_d_ready = dmiXing_auto_out_d_ready; 
  assign dmInner_io_dmactive = ~ dmactiveSync_io_sync_reset; 
  assign dmInner_io_innerCtrl_valid = AsyncQueueSink_io_deq_valid; 
  assign dmInner_io_innerCtrl_bits_resumereq = AsyncQueueSink_io_deq_bits_resumereq; 
  assign dmInner_io_innerCtrl_bits_hartsel = AsyncQueueSink_io_deq_bits_hartsel; 
  assign dmInner_io_innerCtrl_bits_ackhavereset = AsyncQueueSink_io_deq_bits_ackhavereset; 
  assign dmiXing_clock = clock; 
  assign dmiXing_reset = reset; 
  assign dmiXing_auto_in_a_mem_0_opcode = auto_dmiXing_in_a_mem_0_opcode; 
  assign dmiXing_auto_in_a_mem_0_address = auto_dmiXing_in_a_mem_0_address; 
  assign dmiXing_auto_in_a_mem_0_mask = auto_dmiXing_in_a_mem_0_mask; 
  assign dmiXing_auto_in_a_mem_0_data = auto_dmiXing_in_a_mem_0_data; 
  assign dmiXing_auto_in_a_widx = auto_dmiXing_in_a_widx; 
  assign dmiXing_auto_in_a_safe_widx_valid = auto_dmiXing_in_a_safe_widx_valid; 
  assign dmiXing_auto_in_a_safe_source_reset_n = auto_dmiXing_in_a_safe_source_reset_n; 
  assign dmiXing_auto_in_d_ridx = auto_dmiXing_in_d_ridx; 
  assign dmiXing_auto_in_d_safe_ridx_valid = auto_dmiXing_in_d_safe_ridx_valid; 
  assign dmiXing_auto_in_d_safe_sink_reset_n = auto_dmiXing_in_d_safe_sink_reset_n; 
  assign dmiXing_auto_out_a_ready = dmInner_auto_dmi_in_a_ready; 
  assign dmiXing_auto_out_d_valid = dmInner_auto_dmi_in_d_valid; 
  assign dmiXing_auto_out_d_bits_opcode = dmInner_auto_dmi_in_d_bits_opcode; 
  assign dmiXing_auto_out_d_bits_size = dmInner_auto_dmi_in_d_bits_size; 
  assign dmiXing_auto_out_d_bits_source = dmInner_auto_dmi_in_d_bits_source; 
  assign dmiXing_auto_out_d_bits_data = dmInner_auto_dmi_in_d_bits_data; 
  assign AsyncQueueSink_clock = clock; 
  assign AsyncQueueSink_reset = reset; 
  assign AsyncQueueSink_io_async_mem_0_resumereq = io_innerCtrl_mem_0_resumereq; 
  assign AsyncQueueSink_io_async_mem_0_hartsel = io_innerCtrl_mem_0_hartsel; 
  assign AsyncQueueSink_io_async_mem_0_ackhavereset = io_innerCtrl_mem_0_ackhavereset; 
  assign AsyncQueueSink_io_async_widx = io_innerCtrl_widx; 
  assign AsyncQueueSink_io_async_safe_widx_valid = io_innerCtrl_safe_widx_valid; 
  assign AsyncQueueSink_io_async_safe_source_reset_n = io_innerCtrl_safe_source_reset_n; 
  assign dmactiveSync_clock = clock; 
  assign dmactiveSync_reset = ~ io_dmactive; 
endmodule
