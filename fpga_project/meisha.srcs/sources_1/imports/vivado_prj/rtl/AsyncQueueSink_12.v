module AsyncQueueSink_12( 
  input         clock, 
  input         reset, 
  input         io_deq_ready, 
  output        io_deq_valid, 
  output [2:0]  io_deq_bits_opcode, 
  output [1:0]  io_deq_bits_param, 
  output [2:0]  io_deq_bits_size, 
  output [4:0]  io_deq_bits_source, 
  output        io_deq_bits_sink, 
  output        io_deq_bits_denied, 
  output [31:0] io_deq_bits_data, 
  output        io_deq_bits_corrupt, 
  input  [2:0]  io_async_mem_0_opcode, 
  input  [1:0]  io_async_mem_0_param, 
  input  [2:0]  io_async_mem_0_size, 
  input  [4:0]  io_async_mem_0_source, 
  input         io_async_mem_0_sink, 
  input         io_async_mem_0_denied, 
  input  [31:0] io_async_mem_0_data, 
  input         io_async_mem_0_corrupt, 
  input  [2:0]  io_async_mem_1_opcode, 
  input  [1:0]  io_async_mem_1_param, 
  input  [2:0]  io_async_mem_1_size, 
  input  [4:0]  io_async_mem_1_source, 
  input         io_async_mem_1_sink, 
  input         io_async_mem_1_denied, 
  input  [31:0] io_async_mem_1_data, 
  input         io_async_mem_1_corrupt, 
  input  [2:0]  io_async_mem_2_opcode, 
  input  [1:0]  io_async_mem_2_param, 
  input  [2:0]  io_async_mem_2_size, 
  input  [4:0]  io_async_mem_2_source, 
  input         io_async_mem_2_sink, 
  input         io_async_mem_2_denied, 
  input  [31:0] io_async_mem_2_data, 
  input         io_async_mem_2_corrupt, 
  input  [2:0]  io_async_mem_3_opcode, 
  input  [1:0]  io_async_mem_3_param, 
  input  [2:0]  io_async_mem_3_size, 
  input  [4:0]  io_async_mem_3_source, 
  input         io_async_mem_3_sink, 
  input         io_async_mem_3_denied, 
  input  [31:0] io_async_mem_3_data, 
  input         io_async_mem_3_corrupt, 
  input  [2:0]  io_async_mem_4_opcode, 
  input  [1:0]  io_async_mem_4_param, 
  input  [2:0]  io_async_mem_4_size, 
  input  [4:0]  io_async_mem_4_source, 
  input         io_async_mem_4_sink, 
  input         io_async_mem_4_denied, 
  input  [31:0] io_async_mem_4_data, 
  input         io_async_mem_4_corrupt, 
  input  [2:0]  io_async_mem_5_opcode, 
  input  [1:0]  io_async_mem_5_param, 
  input  [2:0]  io_async_mem_5_size, 
  input  [4:0]  io_async_mem_5_source, 
  input         io_async_mem_5_sink, 
  input         io_async_mem_5_denied, 
  input  [31:0] io_async_mem_5_data, 
  input         io_async_mem_5_corrupt, 
  input  [2:0]  io_async_mem_6_opcode, 
  input  [1:0]  io_async_mem_6_param, 
  input  [2:0]  io_async_mem_6_size, 
  input  [4:0]  io_async_mem_6_source, 
  input         io_async_mem_6_sink, 
  input         io_async_mem_6_denied, 
  input  [31:0] io_async_mem_6_data, 
  input         io_async_mem_6_corrupt, 
  input  [2:0]  io_async_mem_7_opcode, 
  input  [1:0]  io_async_mem_7_param, 
  input  [2:0]  io_async_mem_7_size, 
  input  [4:0]  io_async_mem_7_source, 
  input         io_async_mem_7_sink, 
  input         io_async_mem_7_denied, 
  input  [31:0] io_async_mem_7_data, 
  input         io_async_mem_7_corrupt, 
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
  wire [47:0] deq_bits_reg_io_d; 
  wire [47:0] deq_bits_reg_io_q; 
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
  wire [3:0] _GEN_64; 
  wire [3:0] _T_91; 
  wire [3:0] _T_92; 
  wire [2:0] _T_93; 
  wire [3:0] _GEN_65; 
  wire [3:0] ridx; 
  wire [3:0] widx; 
  wire  _T_95; 
  wire  valid; 
  wire [2:0] _T_96; 
  wire  _T_97; 
  wire [2:0] _GEN_66; 
  wire [2:0] _T_98; 
  wire [2:0] index; 
  wire [2:0] _GEN_8; 
  wire [1:0] _GEN_9; 
  wire [2:0] _GEN_10; 
  wire [4:0] _GEN_11; 
  wire  _GEN_12; 
  wire  _GEN_13; 
  wire [31:0] _GEN_14; 
  wire  _GEN_15; 
  wire [2:0] _GEN_16; 
  wire [1:0] _GEN_17; 
  wire [2:0] _GEN_18; 
  wire [4:0] _GEN_19; 
  wire  _GEN_20; 
  wire  _GEN_21; 
  wire [31:0] _GEN_22; 
  wire  _GEN_23; 
  wire [2:0] _GEN_24; 
  wire [1:0] _GEN_25; 
  wire [2:0] _GEN_26; 
  wire [4:0] _GEN_27; 
  wire  _GEN_28; 
  wire  _GEN_29; 
  wire [31:0] _GEN_30; 
  wire  _GEN_31; 
  wire [2:0] _GEN_32; 
  wire [1:0] _GEN_33; 
  wire [2:0] _GEN_34; 
  wire [4:0] _GEN_35; 
  wire  _GEN_36; 
  wire  _GEN_37; 
  wire [31:0] _GEN_38; 
  wire  _GEN_39; 
  wire [2:0] _GEN_40; 
  wire [1:0] _GEN_41; 
  wire [2:0] _GEN_42; 
  wire [4:0] _GEN_43; 
  wire  _GEN_44; 
  wire  _GEN_45; 
  wire [31:0] _GEN_46; 
  wire  _GEN_47; 
  wire [2:0] _GEN_48; 
  wire [1:0] _GEN_49; 
  wire [2:0] _GEN_50; 
  wire [4:0] _GEN_51; 
  wire  _GEN_52; 
  wire  _GEN_53; 
  wire [31:0] _GEN_54; 
  wire  _GEN_55; 
  wire [2:0] _GEN_56; 
  wire [1:0] _GEN_57; 
  wire [2:0] _GEN_58; 
  wire [4:0] _GEN_59; 
  wire  _GEN_60; 
  wire  _GEN_61; 
  wire [31:0] _GEN_62; 
  wire  _GEN_63; 
  wire [2:0] deq_bits_nxt_opcode; 
  wire [1:0] deq_bits_nxt_param; 
  wire [2:0] deq_bits_nxt_size; 
  wire [4:0] deq_bits_nxt_source; 
  wire  deq_bits_nxt_sink; 
  wire  deq_bits_nxt_denied; 
  wire [31:0] deq_bits_nxt_data; 
  wire  deq_bits_nxt_corrupt; 
  wire [32:0] _T_100; 
  wire [1:0] _T_101; 
  wire [34:0] _T_102; 
  wire [7:0] _T_103; 
  wire [4:0] _T_104; 
  wire [12:0] _T_105; 
  wire [47:0] _T_110; 
  wire  valid_reg_1; 
  wire  _T_121; 
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
  SynchronizerShiftReg_w48_d1 deq_bits_reg ( 
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
  assign _GEN_64 = {{3'd0}, _T_86}; 
  assign _T_91 = ridx_bin_io_q + _GEN_64; 
  assign _T_92 = _T_87 ? 4'h0 : _T_91; 
  assign _T_93 = _T_92[3:1]; 
  assign _GEN_65 = {{1'd0}, _T_93}; 
  assign ridx = _T_92 ^ _GEN_65; 
  assign widx = widx_gray_io_q; 
  assign _T_95 = ridx != widx; 
  assign valid = source_ready & _T_95; 
  assign _T_96 = ridx[2:0]; 
  assign _T_97 = ridx[3]; 
  assign _GEN_66 = {{2'd0}, _T_97}; 
  assign _T_98 = _GEN_66 << 2; 
  assign index = _T_96 ^ _T_98; 
  assign _GEN_8 = 3'h1 == index ? io_async_mem_1_opcode : io_async_mem_0_opcode; 
  assign _GEN_9 = 3'h1 == index ? io_async_mem_1_param : io_async_mem_0_param; 
  assign _GEN_10 = 3'h1 == index ? io_async_mem_1_size : io_async_mem_0_size; 
  assign _GEN_11 = 3'h1 == index ? io_async_mem_1_source : io_async_mem_0_source; 
  assign _GEN_12 = 3'h1 == index ? io_async_mem_1_sink : io_async_mem_0_sink; 
  assign _GEN_13 = 3'h1 == index ? io_async_mem_1_denied : io_async_mem_0_denied; 
  assign _GEN_14 = 3'h1 == index ? io_async_mem_1_data : io_async_mem_0_data; 
  assign _GEN_15 = 3'h1 == index ? io_async_mem_1_corrupt : io_async_mem_0_corrupt; 
  assign _GEN_16 = 3'h2 == index ? io_async_mem_2_opcode : _GEN_8; 
  assign _GEN_17 = 3'h2 == index ? io_async_mem_2_param : _GEN_9; 
  assign _GEN_18 = 3'h2 == index ? io_async_mem_2_size : _GEN_10; 
  assign _GEN_19 = 3'h2 == index ? io_async_mem_2_source : _GEN_11; 
  assign _GEN_20 = 3'h2 == index ? io_async_mem_2_sink : _GEN_12; 
  assign _GEN_21 = 3'h2 == index ? io_async_mem_2_denied : _GEN_13; 
  assign _GEN_22 = 3'h2 == index ? io_async_mem_2_data : _GEN_14; 
  assign _GEN_23 = 3'h2 == index ? io_async_mem_2_corrupt : _GEN_15; 
  assign _GEN_24 = 3'h3 == index ? io_async_mem_3_opcode : _GEN_16; 
  assign _GEN_25 = 3'h3 == index ? io_async_mem_3_param : _GEN_17; 
  assign _GEN_26 = 3'h3 == index ? io_async_mem_3_size : _GEN_18; 
  assign _GEN_27 = 3'h3 == index ? io_async_mem_3_source : _GEN_19; 
  assign _GEN_28 = 3'h3 == index ? io_async_mem_3_sink : _GEN_20; 
  assign _GEN_29 = 3'h3 == index ? io_async_mem_3_denied : _GEN_21; 
  assign _GEN_30 = 3'h3 == index ? io_async_mem_3_data : _GEN_22; 
  assign _GEN_31 = 3'h3 == index ? io_async_mem_3_corrupt : _GEN_23; 
  assign _GEN_32 = 3'h4 == index ? io_async_mem_4_opcode : _GEN_24; 
  assign _GEN_33 = 3'h4 == index ? io_async_mem_4_param : _GEN_25; 
  assign _GEN_34 = 3'h4 == index ? io_async_mem_4_size : _GEN_26; 
  assign _GEN_35 = 3'h4 == index ? io_async_mem_4_source : _GEN_27; 
  assign _GEN_36 = 3'h4 == index ? io_async_mem_4_sink : _GEN_28; 
  assign _GEN_37 = 3'h4 == index ? io_async_mem_4_denied : _GEN_29; 
  assign _GEN_38 = 3'h4 == index ? io_async_mem_4_data : _GEN_30; 
  assign _GEN_39 = 3'h4 == index ? io_async_mem_4_corrupt : _GEN_31; 
  assign _GEN_40 = 3'h5 == index ? io_async_mem_5_opcode : _GEN_32; 
  assign _GEN_41 = 3'h5 == index ? io_async_mem_5_param : _GEN_33; 
  assign _GEN_42 = 3'h5 == index ? io_async_mem_5_size : _GEN_34; 
  assign _GEN_43 = 3'h5 == index ? io_async_mem_5_source : _GEN_35; 
  assign _GEN_44 = 3'h5 == index ? io_async_mem_5_sink : _GEN_36; 
  assign _GEN_45 = 3'h5 == index ? io_async_mem_5_denied : _GEN_37; 
  assign _GEN_46 = 3'h5 == index ? io_async_mem_5_data : _GEN_38; 
  assign _GEN_47 = 3'h5 == index ? io_async_mem_5_corrupt : _GEN_39; 
  assign _GEN_48 = 3'h6 == index ? io_async_mem_6_opcode : _GEN_40; 
  assign _GEN_49 = 3'h6 == index ? io_async_mem_6_param : _GEN_41; 
  assign _GEN_50 = 3'h6 == index ? io_async_mem_6_size : _GEN_42; 
  assign _GEN_51 = 3'h6 == index ? io_async_mem_6_source : _GEN_43; 
  assign _GEN_52 = 3'h6 == index ? io_async_mem_6_sink : _GEN_44; 
  assign _GEN_53 = 3'h6 == index ? io_async_mem_6_denied : _GEN_45; 
  assign _GEN_54 = 3'h6 == index ? io_async_mem_6_data : _GEN_46; 
  assign _GEN_55 = 3'h6 == index ? io_async_mem_6_corrupt : _GEN_47; 
  assign _GEN_56 = 3'h7 == index ? io_async_mem_7_opcode : _GEN_48; 
  assign _GEN_57 = 3'h7 == index ? io_async_mem_7_param : _GEN_49; 
  assign _GEN_58 = 3'h7 == index ? io_async_mem_7_size : _GEN_50; 
  assign _GEN_59 = 3'h7 == index ? io_async_mem_7_source : _GEN_51; 
  assign _GEN_60 = 3'h7 == index ? io_async_mem_7_sink : _GEN_52; 
  assign _GEN_61 = 3'h7 == index ? io_async_mem_7_denied : _GEN_53; 
  assign _GEN_62 = 3'h7 == index ? io_async_mem_7_data : _GEN_54; 
  assign _GEN_63 = 3'h7 == index ? io_async_mem_7_corrupt : _GEN_55; 
  assign deq_bits_nxt_opcode = valid ? _GEN_56 : io_deq_bits_opcode; 
  assign deq_bits_nxt_param = valid ? _GEN_57 : io_deq_bits_param; 
  assign deq_bits_nxt_size = valid ? _GEN_58 : io_deq_bits_size; 
  assign deq_bits_nxt_source = valid ? _GEN_59 : io_deq_bits_source; 
  assign deq_bits_nxt_sink = valid ? _GEN_60 : io_deq_bits_sink; 
  assign deq_bits_nxt_denied = valid ? _GEN_61 : io_deq_bits_denied; 
  assign deq_bits_nxt_data = valid ? _GEN_62 : io_deq_bits_data; 
  assign deq_bits_nxt_corrupt = valid ? _GEN_63 : io_deq_bits_corrupt; 
  assign _T_100 = {deq_bits_nxt_data,deq_bits_nxt_corrupt}; 
  assign _T_101 = {deq_bits_nxt_sink,deq_bits_nxt_denied}; 
  assign _T_102 = {_T_101,_T_100}; 
  assign _T_103 = {deq_bits_nxt_size,deq_bits_nxt_source}; 
  assign _T_104 = {deq_bits_nxt_opcode,deq_bits_nxt_param}; 
  assign _T_105 = {_T_104,_T_103}; 
  assign _T_110 = deq_bits_reg_io_q; 
  assign valid_reg_1 = valid_reg_io_q; 
  assign _T_121 = io_async_safe_source_reset_n == 1'h0; 
  assign io_deq_valid = valid_reg_1 & source_ready; 
  assign io_deq_bits_opcode = _T_110[47:45]; 
  assign io_deq_bits_param = _T_110[44:43]; 
  assign io_deq_bits_size = _T_110[42:40]; 
  assign io_deq_bits_source = _T_110[39:35]; 
  assign io_deq_bits_sink = _T_110[34]; 
  assign io_deq_bits_denied = _T_110[33]; 
  assign io_deq_bits_data = _T_110[32:1]; 
  assign io_deq_bits_corrupt = _T_110[0]; 
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
  assign deq_bits_reg_io_d = {_T_105,_T_102}; 
  assign valid_reg_clock = clock; 
  assign valid_reg_reset = reset; 
  assign valid_reg_io_d = source_ready & _T_95; 
  assign valid_reg_io_en = 1'h1; 
  assign ridx_gray_clock = clock; 
  assign ridx_gray_reset = reset; 
  assign ridx_gray_io_d = _T_92 ^ _GEN_65; 
  assign ridx_gray_io_en = 1'h1; 
  assign AsyncValidSync_clock = clock; 
  assign AsyncValidSync_reset = reset | _T_121; 
  assign AsyncValidSync_io_in = 1'h1; 
  assign AsyncValidSync_1_clock = clock; 
  assign AsyncValidSync_1_reset = reset | _T_121; 
  assign AsyncValidSync_1_io_in = io_async_safe_widx_valid; 
  assign AsyncValidSync_2_clock = clock; 
  assign AsyncValidSync_2_reset = reset; 
  assign AsyncValidSync_2_io_in = AsyncValidSync_1_io_out; 
  assign AsyncResetRegVec_w1_i0_clock = clock; 
  assign AsyncResetRegVec_w1_i0_reset = reset; 
  assign AsyncResetRegVec_w1_i0_io_d = io_async_widx == io_async_ridx; 
  assign AsyncResetRegVec_w1_i0_io_en = 1'h1; 
endmodule
