module AsyncQueueSink_1( 
  input         clock, 
  input         reset, 
  input         io_deq_ready, 
  output        io_deq_valid, 
  output [2:0]  io_deq_bits_opcode, 
  output [2:0]  io_deq_bits_param, 
  output [1:0]  io_deq_bits_size, 
  output        io_deq_bits_source, 
  output [8:0]  io_deq_bits_address, 
  output [3:0]  io_deq_bits_mask, 
  output [31:0] io_deq_bits_data, 
  output        io_deq_bits_corrupt, 
  input  [2:0]  io_async_mem_0_opcode, 
  input  [8:0]  io_async_mem_0_address, 
  input  [3:0]  io_async_mem_0_mask, 
  input  [31:0] io_async_mem_0_data, 
  output        io_async_ridx, 
  input         io_async_widx, 
  output        io_async_safe_ridx_valid, 
  input         io_async_safe_widx_valid, 
  input         io_async_safe_source_reset_n, 
  output        io_async_safe_sink_reset_n 
);
  wire  ridx_bin_clock; 
  wire  ridx_bin_reset; 
  wire  ridx_bin_io_d; 
  wire  ridx_bin_io_q; 
  wire  ridx_bin_io_en; 
  wire  widx_gray_clock; 
  wire  widx_gray_reset; 
  wire  widx_gray_io_d; 
  wire  widx_gray_io_q; 
  wire  deq_bits_reg_clock; 
  wire [54:0] deq_bits_reg_io_d; 
  wire [54:0] deq_bits_reg_io_q; 
  wire  valid_reg_clock; 
  wire  valid_reg_reset; 
  wire  valid_reg_io_d; 
  wire  valid_reg_io_q; 
  wire  valid_reg_io_en; 
  wire  ridx_gray_clock; 
  wire  ridx_gray_reset; 
  wire  ridx_gray_io_d; 
  wire  ridx_gray_io_q; 
  wire  ridx_gray_io_en; 
  wire  AsyncValidSync_clock; 
  wire  AsyncValidSync_reset; 
  wire  AsyncValidSync_io_in; 
  wire  AsyncValidSync_io_out; 
  wire  AsyncValidSync_1_clock; 
  wire  AsyncValidSync_1_reset; 
  wire  AsyncValidSync_1_io_in; 
  wire  AsyncValidSync_1_io_out; 
  wire  AsyncValidSync_2_clock; 
  wire  AsyncValidSync_2_reset; 
  wire  AsyncValidSync_2_io_in; 
  wire  AsyncValidSync_2_io_out; 
  wire  AsyncResetRegVec_w1_i0_clock; 
  wire  AsyncResetRegVec_w1_i0_reset; 
  wire  AsyncResetRegVec_w1_i0_io_d; 
  wire  AsyncResetRegVec_w1_i0_io_q; 
  wire  AsyncResetRegVec_w1_i0_io_en; 
  wire  _T_58; 
  wire  source_ready; 
  wire  _T_59; 
  wire  _T_63; 
  wire  ridx; 
  wire  widx; 
  wire  _T_67; 
  wire  valid; 
  wire [2:0] deq_bits_nxt_opcode; 
  wire [2:0] deq_bits_nxt_param; 
  wire [1:0] deq_bits_nxt_size; 
  wire  deq_bits_nxt_source; 
  wire [8:0] deq_bits_nxt_address; 
  wire [3:0] deq_bits_nxt_mask; 
  wire [31:0] deq_bits_nxt_data; 
  wire  deq_bits_nxt_corrupt; 
  wire [32:0] _T_69; 
  wire [12:0] _T_70; 
  wire [45:0] _T_71; 
  wire [2:0] _T_72; 
  wire [5:0] _T_73; 
  wire [8:0] _T_74; 
  wire [54:0] _T_79; 
  wire  valid_reg_1; 
  wire  _T_90; 
  AsyncResetRegVec_w1_i0 ridx_bin ( 
    .clock(ridx_bin_clock),
    .reset(ridx_bin_reset),
    .io_d(ridx_bin_io_d),
    .io_q(ridx_bin_io_q),
    .io_en(ridx_bin_io_en)
  );
  AsyncResetSynchronizerShiftReg_w1_d3_i0 widx_gray ( 
    .clock(widx_gray_clock),
    .reset(widx_gray_reset),
    .io_d(widx_gray_io_d),
    .io_q(widx_gray_io_q)
  );
  SynchronizerShiftReg_w55_d1 deq_bits_reg ( 
    .clock(deq_bits_reg_clock),
    .io_d(deq_bits_reg_io_d),
    .io_q(deq_bits_reg_io_q)
  );
  AsyncResetRegVec_w1_i0 valid_reg ( 
    .clock(valid_reg_clock),
    .reset(valid_reg_reset),
    .io_d(valid_reg_io_d),
    .io_q(valid_reg_io_q),
    .io_en(valid_reg_io_en)
  );
  AsyncResetRegVec_w1_i0 ridx_gray ( 
    .clock(ridx_gray_clock),
    .reset(ridx_gray_reset),
    .io_d(ridx_gray_io_d),
    .io_q(ridx_gray_io_q),
    .io_en(ridx_gray_io_en)
  );
  AsyncValidSync AsyncValidSync ( 
    .clock(AsyncValidSync_clock),
    .reset(AsyncValidSync_reset),
    .io_in(AsyncValidSync_io_in),
    .io_out(AsyncValidSync_io_out)
  );
  AsyncValidSync_1 AsyncValidSync_1 ( 
    .clock(AsyncValidSync_1_clock),
    .reset(AsyncValidSync_1_reset),
    .io_in(AsyncValidSync_1_io_in),
    .io_out(AsyncValidSync_1_io_out)
  );
  AsyncValidSync_2 AsyncValidSync_2 ( 
    .clock(AsyncValidSync_2_clock),
    .reset(AsyncValidSync_2_reset),
    .io_in(AsyncValidSync_2_io_in),
    .io_out(AsyncValidSync_2_io_out)
  );
  AsyncResetRegVec_w1_i0 AsyncResetRegVec_w1_i0 ( 
    .clock(AsyncResetRegVec_w1_i0_clock),
    .reset(AsyncResetRegVec_w1_i0_reset),
    .io_d(AsyncResetRegVec_w1_i0_io_d),
    .io_q(AsyncResetRegVec_w1_i0_io_q),
    .io_en(AsyncResetRegVec_w1_i0_io_en)
  );
  assign _T_58 = io_deq_ready & io_deq_valid; 
  assign source_ready = AsyncValidSync_2_io_out; 
  assign _T_59 = source_ready == 1'h0; 
  assign _T_63 = ridx_bin_io_q + _T_58; 
  assign ridx = _T_59 ? 1'h0 : _T_63; 
  assign widx = widx_gray_io_q; 
  assign _T_67 = ridx != widx; 
  assign valid = source_ready & _T_67; 
  assign deq_bits_nxt_opcode = valid ? io_async_mem_0_opcode : io_deq_bits_opcode; 
  assign deq_bits_nxt_param = valid ? 3'h0 : io_deq_bits_param; 
  assign deq_bits_nxt_size = valid ? 2'h2 : io_deq_bits_size; 
  assign deq_bits_nxt_source = valid ? 1'h0 : io_deq_bits_source; 
  assign deq_bits_nxt_address = valid ? io_async_mem_0_address : io_deq_bits_address; 
  assign deq_bits_nxt_mask = valid ? io_async_mem_0_mask : io_deq_bits_mask; 
  assign deq_bits_nxt_data = valid ? io_async_mem_0_data : io_deq_bits_data; 
  assign deq_bits_nxt_corrupt = valid ? 1'h0 : io_deq_bits_corrupt; 
  assign _T_69 = {deq_bits_nxt_data,deq_bits_nxt_corrupt}; 
  assign _T_70 = {deq_bits_nxt_address,deq_bits_nxt_mask}; 
  assign _T_71 = {_T_70,_T_69}; 
  assign _T_72 = {deq_bits_nxt_size,deq_bits_nxt_source}; 
  assign _T_73 = {deq_bits_nxt_opcode,deq_bits_nxt_param}; 
  assign _T_74 = {_T_73,_T_72}; 
  assign _T_79 = deq_bits_reg_io_q; 
  assign valid_reg_1 = valid_reg_io_q; 
  assign _T_90 = io_async_safe_source_reset_n == 1'h0; 
  assign io_deq_valid = valid_reg_1 & source_ready; 
  assign io_deq_bits_opcode = _T_79[54:52]; 
  assign io_deq_bits_param = _T_79[51:49]; 
  assign io_deq_bits_size = _T_79[48:47]; 
  assign io_deq_bits_source = _T_79[46]; 
  assign io_deq_bits_address = _T_79[45:37]; 
  assign io_deq_bits_mask = _T_79[36:33]; 
  assign io_deq_bits_data = _T_79[32:1]; 
  assign io_deq_bits_corrupt = _T_79[0]; 
  assign io_async_ridx = ridx_gray_io_q; 
  assign io_async_safe_ridx_valid = AsyncValidSync_io_out; 
  assign io_async_safe_sink_reset_n = reset == 1'h0; 
  assign ridx_bin_clock = clock; 
  assign ridx_bin_reset = reset; 
  assign ridx_bin_io_d = _T_59 ? 1'h0 : _T_63; 
  assign ridx_bin_io_en = 1'h1; 
  assign widx_gray_clock = clock; 
  assign widx_gray_reset = reset; 
  assign widx_gray_io_d = io_async_widx; 
  assign deq_bits_reg_clock = clock; 
  assign deq_bits_reg_io_d = {_T_74,_T_71}; 
  assign valid_reg_clock = clock; 
  assign valid_reg_reset = reset; 
  assign valid_reg_io_d = source_ready & _T_67; 
  assign valid_reg_io_en = 1'h1; 
  assign ridx_gray_clock = clock; 
  assign ridx_gray_reset = reset; 
  assign ridx_gray_io_d = _T_59 ? 1'h0 : _T_63; 
  assign ridx_gray_io_en = 1'h1; 
  assign AsyncValidSync_clock = clock; 
  assign AsyncValidSync_reset = reset | _T_90; 
  assign AsyncValidSync_io_in = 1'h1; 
  assign AsyncValidSync_1_clock = clock; 
  assign AsyncValidSync_1_reset = reset | _T_90; 
  assign AsyncValidSync_1_io_in = io_async_safe_widx_valid; 
  assign AsyncValidSync_2_clock = clock; 
  assign AsyncValidSync_2_reset = reset; 
  assign AsyncValidSync_2_io_in = AsyncValidSync_1_io_out; 
  assign AsyncResetRegVec_w1_i0_clock = clock; 
  assign AsyncResetRegVec_w1_i0_reset = reset; 
  assign AsyncResetRegVec_w1_i0_io_d = io_async_widx == io_async_ridx; 
  assign AsyncResetRegVec_w1_i0_io_en = 1'h1; 
endmodule
