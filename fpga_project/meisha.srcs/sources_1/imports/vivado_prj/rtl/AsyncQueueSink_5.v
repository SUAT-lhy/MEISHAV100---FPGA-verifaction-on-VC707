module AsyncQueueSink_5( 
  input         clock, 
  input         reset, 
  input         io_deq_ready, 
  output        io_deq_valid, 
  output [63:0] io_deq_bits_data, 
  output [7:0]  io_deq_bits_strb, 
  output        io_deq_bits_last, 
  input  [63:0] io_async_mem_0_data, 
  input  [7:0]  io_async_mem_0_strb, 
  input         io_async_mem_0_last, 
  input  [63:0] io_async_mem_1_data, 
  input  [7:0]  io_async_mem_1_strb, 
  input         io_async_mem_1_last, 
  input  [63:0] io_async_mem_2_data, 
  input  [7:0]  io_async_mem_2_strb, 
  input         io_async_mem_2_last, 
  input  [63:0] io_async_mem_3_data, 
  input  [7:0]  io_async_mem_3_strb, 
  input         io_async_mem_3_last, 
  input  [63:0] io_async_mem_4_data, 
  input  [7:0]  io_async_mem_4_strb, 
  input         io_async_mem_4_last, 
  input  [63:0] io_async_mem_5_data, 
  input  [7:0]  io_async_mem_5_strb, 
  input         io_async_mem_5_last, 
  input  [63:0] io_async_mem_6_data, 
  input  [7:0]  io_async_mem_6_strb, 
  input         io_async_mem_6_last, 
  input  [63:0] io_async_mem_7_data, 
  input  [7:0]  io_async_mem_7_strb, 
  input         io_async_mem_7_last, 
  output [3:0]  io_async_ridx, 
  input  [3:0]  io_async_widx, 
  output        io_async_safe_ridx_valid, 
  input         io_async_safe_widx_valid, 
  input         io_async_safe_source_reset_n, 
  output        io_async_safe_sink_reset_n 
);
  wire  ridx_bin_clock; 
  wire  ridx_bin_reset; 
  wire [3:0] ridx_bin_io_d; 
  wire [3:0] ridx_bin_io_q; 
  wire  ridx_bin_io_en; 
  wire  widx_gray_clock; 
  wire  widx_gray_reset; 
  wire [3:0] widx_gray_io_d; 
  wire [3:0] widx_gray_io_q; 
  wire  deq_bits_reg_clock; 
  wire [72:0] deq_bits_reg_io_d; 
  wire [72:0] deq_bits_reg_io_q; 
  wire  valid_reg_clock; 
  wire  valid_reg_reset; 
  wire  valid_reg_io_d; 
  wire  valid_reg_io_q; 
  wire  valid_reg_io_en; 
  wire  ridx_gray_clock; 
  wire  ridx_gray_reset; 
  wire [3:0] ridx_gray_io_d; 
  wire [3:0] ridx_gray_io_q; 
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
  wire  _T_86; 
  wire  source_ready; 
  wire  _T_87; 
  wire [3:0] _GEN_24; 
  wire [3:0] _T_91; 
  wire [3:0] _T_92; 
  wire [2:0] _T_93; 
  wire [3:0] _GEN_25; 
  wire [3:0] ridx; 
  wire [3:0] widx; 
  wire  _T_95; 
  wire  valid; 
  wire [2:0] _T_96; 
  wire  _T_97; 
  wire [2:0] _GEN_26; 
  wire [2:0] _T_98; 
  wire [2:0] index; 
  wire [63:0] _GEN_3; 
  wire [7:0] _GEN_4; 
  wire  _GEN_5; 
  wire [63:0] _GEN_6; 
  wire [7:0] _GEN_7; 
  wire  _GEN_8; 
  wire [63:0] _GEN_9; 
  wire [7:0] _GEN_10; 
  wire  _GEN_11; 
  wire [63:0] _GEN_12; 
  wire [7:0] _GEN_13; 
  wire  _GEN_14; 
  wire [63:0] _GEN_15; 
  wire [7:0] _GEN_16; 
  wire  _GEN_17; 
  wire [63:0] _GEN_18; 
  wire [7:0] _GEN_19; 
  wire  _GEN_20; 
  wire [63:0] _GEN_21; 
  wire [7:0] _GEN_22; 
  wire  _GEN_23; 
  wire [63:0] deq_bits_nxt_data; 
  wire [7:0] deq_bits_nxt_strb; 
  wire  deq_bits_nxt_last; 
  wire [71:0] _T_100; 
  wire [72:0] _T_105; 
  wire  valid_reg_1; 
  wire  _T_111; 
  AsyncResetRegVec_w4_i0 ridx_bin ( 
    .clock(ridx_bin_clock),
    .reset(ridx_bin_reset),
    .io_d(ridx_bin_io_d),
    .io_q(ridx_bin_io_q),
    .io_en(ridx_bin_io_en)
  );
  AsyncResetSynchronizerShiftReg_w4_d3_i0 widx_gray ( 
    .clock(widx_gray_clock),
    .reset(widx_gray_reset),
    .io_d(widx_gray_io_d),
    .io_q(widx_gray_io_q)
  );
  SynchronizerShiftReg_w73_d1 deq_bits_reg ( 
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
  AsyncResetRegVec_w4_i0 ridx_gray ( 
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
  assign _T_86 = io_deq_ready & io_deq_valid; 
  assign source_ready = AsyncValidSync_2_io_out; 
  assign _T_87 = source_ready == 1'h0; 
  assign _GEN_24 = {{3'd0}, _T_86}; 
  assign _T_91 = ridx_bin_io_q + _GEN_24; 
  assign _T_92 = _T_87 ? 4'h0 : _T_91; 
  assign _T_93 = _T_92[3:1]; 
  assign _GEN_25 = {{1'd0}, _T_93}; 
  assign ridx = _T_92 ^ _GEN_25; 
  assign widx = widx_gray_io_q; 
  assign _T_95 = ridx != widx; 
  assign valid = source_ready & _T_95; 
  assign _T_96 = ridx[2:0]; 
  assign _T_97 = ridx[3]; 
  assign _GEN_26 = {{2'd0}, _T_97}; 
  assign _T_98 = _GEN_26 << 2; 
  assign index = _T_96 ^ _T_98; 
  assign _GEN_3 = 3'h1 == index ? io_async_mem_1_data : io_async_mem_0_data; 
  assign _GEN_4 = 3'h1 == index ? io_async_mem_1_strb : io_async_mem_0_strb; 
  assign _GEN_5 = 3'h1 == index ? io_async_mem_1_last : io_async_mem_0_last; 
  assign _GEN_6 = 3'h2 == index ? io_async_mem_2_data : _GEN_3; 
  assign _GEN_7 = 3'h2 == index ? io_async_mem_2_strb : _GEN_4; 
  assign _GEN_8 = 3'h2 == index ? io_async_mem_2_last : _GEN_5; 
  assign _GEN_9 = 3'h3 == index ? io_async_mem_3_data : _GEN_6; 
  assign _GEN_10 = 3'h3 == index ? io_async_mem_3_strb : _GEN_7; 
  assign _GEN_11 = 3'h3 == index ? io_async_mem_3_last : _GEN_8; 
  assign _GEN_12 = 3'h4 == index ? io_async_mem_4_data : _GEN_9; 
  assign _GEN_13 = 3'h4 == index ? io_async_mem_4_strb : _GEN_10; 
  assign _GEN_14 = 3'h4 == index ? io_async_mem_4_last : _GEN_11; 
  assign _GEN_15 = 3'h5 == index ? io_async_mem_5_data : _GEN_12; 
  assign _GEN_16 = 3'h5 == index ? io_async_mem_5_strb : _GEN_13; 
  assign _GEN_17 = 3'h5 == index ? io_async_mem_5_last : _GEN_14; 
  assign _GEN_18 = 3'h6 == index ? io_async_mem_6_data : _GEN_15; 
  assign _GEN_19 = 3'h6 == index ? io_async_mem_6_strb : _GEN_16; 
  assign _GEN_20 = 3'h6 == index ? io_async_mem_6_last : _GEN_17; 
  assign _GEN_21 = 3'h7 == index ? io_async_mem_7_data : _GEN_18; 
  assign _GEN_22 = 3'h7 == index ? io_async_mem_7_strb : _GEN_19; 
  assign _GEN_23 = 3'h7 == index ? io_async_mem_7_last : _GEN_20; 
  assign deq_bits_nxt_data = valid ? _GEN_21 : io_deq_bits_data; 
  assign deq_bits_nxt_strb = valid ? _GEN_22 : io_deq_bits_strb; 
  assign deq_bits_nxt_last = valid ? _GEN_23 : io_deq_bits_last; 
  assign _T_100 = {deq_bits_nxt_data,deq_bits_nxt_strb}; 
  assign _T_105 = deq_bits_reg_io_q; 
  assign valid_reg_1 = valid_reg_io_q; 
  assign _T_111 = io_async_safe_source_reset_n == 1'h0; 
  assign io_deq_valid = valid_reg_1 & source_ready; 
  assign io_deq_bits_data = _T_105[72:9]; 
  assign io_deq_bits_strb = _T_105[8:1]; 
  assign io_deq_bits_last = _T_105[0]; 
  assign io_async_ridx = ridx_gray_io_q; 
  assign io_async_safe_ridx_valid = AsyncValidSync_io_out; 
  assign io_async_safe_sink_reset_n = reset == 1'h0; 
  assign ridx_bin_clock = clock; 
  assign ridx_bin_reset = reset; 
  assign ridx_bin_io_d = _T_87 ? 4'h0 : _T_91; 
  assign ridx_bin_io_en = 1'h1; 
  assign widx_gray_clock = clock; 
  assign widx_gray_reset = reset; 
  assign widx_gray_io_d = io_async_widx; 
  assign deq_bits_reg_clock = clock; 
  assign deq_bits_reg_io_d = {_T_100,deq_bits_nxt_last}; 
  assign valid_reg_clock = clock; 
  assign valid_reg_reset = reset; 
  assign valid_reg_io_d = source_ready & _T_95; 
  assign valid_reg_io_en = 1'h1; 
  assign ridx_gray_clock = clock; 
  assign ridx_gray_reset = reset; 
  assign ridx_gray_io_d = _T_92 ^ _GEN_25; 
  assign ridx_gray_io_en = 1'h1; 
  assign AsyncValidSync_clock = clock; 
  assign AsyncValidSync_reset = reset | _T_111; 
  assign AsyncValidSync_io_in = 1'h1; 
  assign AsyncValidSync_1_clock = clock; 
  assign AsyncValidSync_1_reset = reset | _T_111; 
  assign AsyncValidSync_1_io_in = io_async_safe_widx_valid; 
  assign AsyncValidSync_2_clock = clock; 
  assign AsyncValidSync_2_reset = reset; 
  assign AsyncValidSync_2_io_in = AsyncValidSync_1_io_out; 
  assign AsyncResetRegVec_w1_i0_clock = clock; 
  assign AsyncResetRegVec_w1_i0_reset = reset; 
  assign AsyncResetRegVec_w1_i0_io_d = io_async_widx == io_async_ridx; 
  assign AsyncResetRegVec_w1_i0_io_en = 1'h1; 
endmodule
