module AsyncQueueSink_3( 
  input         clock, 
  input         reset, 
  input         io_deq_ready, 
  output        io_deq_valid, 
  output [3:0]  io_deq_bits_id, 
  output [31:0] io_deq_bits_addr, 
  output [7:0]  io_deq_bits_len, 
  output [2:0]  io_deq_bits_size, 
  output [1:0]  io_deq_bits_burst, 
  output        io_deq_bits_lock, 
  output [3:0]  io_deq_bits_cache, 
  output [2:0]  io_deq_bits_prot, 
  output [3:0]  io_deq_bits_qos, 
  input  [3:0]  io_async_mem_0_id, 
  input  [31:0] io_async_mem_0_addr, 
  input  [7:0]  io_async_mem_0_len, 
  input  [2:0]  io_async_mem_0_size, 
  input  [1:0]  io_async_mem_0_burst, 
  input         io_async_mem_0_lock, 
  input  [3:0]  io_async_mem_0_cache, 
  input  [2:0]  io_async_mem_0_prot, 
  input  [3:0]  io_async_mem_0_qos, 
  input  [3:0]  io_async_mem_1_id, 
  input  [31:0] io_async_mem_1_addr, 
  input  [7:0]  io_async_mem_1_len, 
  input  [2:0]  io_async_mem_1_size, 
  input  [1:0]  io_async_mem_1_burst, 
  input         io_async_mem_1_lock, 
  input  [3:0]  io_async_mem_1_cache, 
  input  [2:0]  io_async_mem_1_prot, 
  input  [3:0]  io_async_mem_1_qos, 
  input  [3:0]  io_async_mem_2_id, 
  input  [31:0] io_async_mem_2_addr, 
  input  [7:0]  io_async_mem_2_len, 
  input  [2:0]  io_async_mem_2_size, 
  input  [1:0]  io_async_mem_2_burst, 
  input         io_async_mem_2_lock, 
  input  [3:0]  io_async_mem_2_cache, 
  input  [2:0]  io_async_mem_2_prot, 
  input  [3:0]  io_async_mem_2_qos, 
  input  [3:0]  io_async_mem_3_id, 
  input  [31:0] io_async_mem_3_addr, 
  input  [7:0]  io_async_mem_3_len, 
  input  [2:0]  io_async_mem_3_size, 
  input  [1:0]  io_async_mem_3_burst, 
  input         io_async_mem_3_lock, 
  input  [3:0]  io_async_mem_3_cache, 
  input  [2:0]  io_async_mem_3_prot, 
  input  [3:0]  io_async_mem_3_qos, 
  input  [3:0]  io_async_mem_4_id, 
  input  [31:0] io_async_mem_4_addr, 
  input  [7:0]  io_async_mem_4_len, 
  input  [2:0]  io_async_mem_4_size, 
  input  [1:0]  io_async_mem_4_burst, 
  input         io_async_mem_4_lock, 
  input  [3:0]  io_async_mem_4_cache, 
  input  [2:0]  io_async_mem_4_prot, 
  input  [3:0]  io_async_mem_4_qos, 
  input  [3:0]  io_async_mem_5_id, 
  input  [31:0] io_async_mem_5_addr, 
  input  [7:0]  io_async_mem_5_len, 
  input  [2:0]  io_async_mem_5_size, 
  input  [1:0]  io_async_mem_5_burst, 
  input         io_async_mem_5_lock, 
  input  [3:0]  io_async_mem_5_cache, 
  input  [2:0]  io_async_mem_5_prot, 
  input  [3:0]  io_async_mem_5_qos, 
  input  [3:0]  io_async_mem_6_id, 
  input  [31:0] io_async_mem_6_addr, 
  input  [7:0]  io_async_mem_6_len, 
  input  [2:0]  io_async_mem_6_size, 
  input  [1:0]  io_async_mem_6_burst, 
  input         io_async_mem_6_lock, 
  input  [3:0]  io_async_mem_6_cache, 
  input  [2:0]  io_async_mem_6_prot, 
  input  [3:0]  io_async_mem_6_qos, 
  input  [3:0]  io_async_mem_7_id, 
  input  [31:0] io_async_mem_7_addr, 
  input  [7:0]  io_async_mem_7_len, 
  input  [2:0]  io_async_mem_7_size, 
  input  [1:0]  io_async_mem_7_burst, 
  input         io_async_mem_7_lock, 
  input  [3:0]  io_async_mem_7_cache, 
  input  [2:0]  io_async_mem_7_prot, 
  input  [3:0]  io_async_mem_7_qos, 
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
  wire [60:0] deq_bits_reg_io_d; 
  wire [60:0] deq_bits_reg_io_q; 
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
  wire [3:0] _GEN_72; 
  wire [3:0] _T_91; 
  wire [3:0] _T_92; 
  wire [2:0] _T_93; 
  wire [3:0] _GEN_73; 
  wire [3:0] ridx; 
  wire [3:0] widx; 
  wire  _T_95; 
  wire  valid; 
  wire [2:0] _T_96; 
  wire  _T_97; 
  wire [2:0] _GEN_74; 
  wire [2:0] _T_98; 
  wire [2:0] index; 
  wire [3:0] _GEN_9; 
  wire [31:0] _GEN_10; 
  wire [7:0] _GEN_11; 
  wire [2:0] _GEN_12; 
  wire [1:0] _GEN_13; 
  wire  _GEN_14; 
  wire [3:0] _GEN_15; 
  wire [2:0] _GEN_16; 
  wire [3:0] _GEN_17; 
  wire [3:0] _GEN_18; 
  wire [31:0] _GEN_19; 
  wire [7:0] _GEN_20; 
  wire [2:0] _GEN_21; 
  wire [1:0] _GEN_22; 
  wire  _GEN_23; 
  wire [3:0] _GEN_24; 
  wire [2:0] _GEN_25; 
  wire [3:0] _GEN_26; 
  wire [3:0] _GEN_27; 
  wire [31:0] _GEN_28; 
  wire [7:0] _GEN_29; 
  wire [2:0] _GEN_30; 
  wire [1:0] _GEN_31; 
  wire  _GEN_32; 
  wire [3:0] _GEN_33; 
  wire [2:0] _GEN_34; 
  wire [3:0] _GEN_35; 
  wire [3:0] _GEN_36; 
  wire [31:0] _GEN_37; 
  wire [7:0] _GEN_38; 
  wire [2:0] _GEN_39; 
  wire [1:0] _GEN_40; 
  wire  _GEN_41; 
  wire [3:0] _GEN_42; 
  wire [2:0] _GEN_43; 
  wire [3:0] _GEN_44; 
  wire [3:0] _GEN_45; 
  wire [31:0] _GEN_46; 
  wire [7:0] _GEN_47; 
  wire [2:0] _GEN_48; 
  wire [1:0] _GEN_49; 
  wire  _GEN_50; 
  wire [3:0] _GEN_51; 
  wire [2:0] _GEN_52; 
  wire [3:0] _GEN_53; 
  wire [3:0] _GEN_54; 
  wire [31:0] _GEN_55; 
  wire [7:0] _GEN_56; 
  wire [2:0] _GEN_57; 
  wire [1:0] _GEN_58; 
  wire  _GEN_59; 
  wire [3:0] _GEN_60; 
  wire [2:0] _GEN_61; 
  wire [3:0] _GEN_62; 
  wire [3:0] _GEN_63; 
  wire [31:0] _GEN_64; 
  wire [7:0] _GEN_65; 
  wire [2:0] _GEN_66; 
  wire [1:0] _GEN_67; 
  wire  _GEN_68; 
  wire [3:0] _GEN_69; 
  wire [2:0] _GEN_70; 
  wire [3:0] _GEN_71; 
  wire [3:0] deq_bits_nxt_id; 
  wire [31:0] deq_bits_nxt_addr; 
  wire [7:0] deq_bits_nxt_len; 
  wire [2:0] deq_bits_nxt_size; 
  wire [1:0] deq_bits_nxt_burst; 
  wire  deq_bits_nxt_lock; 
  wire [3:0] deq_bits_nxt_cache; 
  wire [2:0] deq_bits_nxt_prot; 
  wire [3:0] deq_bits_nxt_qos; 
  wire [6:0] _T_100; 
  wire [4:0] _T_101; 
  wire [11:0] _T_102; 
  wire [4:0] _T_103; 
  wire [35:0] _T_104; 
  wire [43:0] _T_105; 
  wire [48:0] _T_106; 
  wire [60:0] _T_111; 
  wire  valid_reg_1; 
  wire  _T_123; 
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
  SynchronizerShiftReg_w61_d1 deq_bits_reg ( 
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
  assign _GEN_72 = {{3'd0}, _T_86}; 
  assign _T_91 = ridx_bin_io_q + _GEN_72; 
  assign _T_92 = _T_87 ? 4'h0 : _T_91; 
  assign _T_93 = _T_92[3:1]; 
  assign _GEN_73 = {{1'd0}, _T_93}; 
  assign ridx = _T_92 ^ _GEN_73; 
  assign widx = widx_gray_io_q; 
  assign _T_95 = ridx != widx; 
  assign valid = source_ready & _T_95; 
  assign _T_96 = ridx[2:0]; 
  assign _T_97 = ridx[3]; 
  assign _GEN_74 = {{2'd0}, _T_97}; 
  assign _T_98 = _GEN_74 << 2; 
  assign index = _T_96 ^ _T_98; 
  assign _GEN_9 = 3'h1 == index ? io_async_mem_1_id : io_async_mem_0_id; 
  assign _GEN_10 = 3'h1 == index ? io_async_mem_1_addr : io_async_mem_0_addr; 
  assign _GEN_11 = 3'h1 == index ? io_async_mem_1_len : io_async_mem_0_len; 
  assign _GEN_12 = 3'h1 == index ? io_async_mem_1_size : io_async_mem_0_size; 
  assign _GEN_13 = 3'h1 == index ? io_async_mem_1_burst : io_async_mem_0_burst; 
  assign _GEN_14 = 3'h1 == index ? io_async_mem_1_lock : io_async_mem_0_lock; 
  assign _GEN_15 = 3'h1 == index ? io_async_mem_1_cache : io_async_mem_0_cache; 
  assign _GEN_16 = 3'h1 == index ? io_async_mem_1_prot : io_async_mem_0_prot; 
  assign _GEN_17 = 3'h1 == index ? io_async_mem_1_qos : io_async_mem_0_qos; 
  assign _GEN_18 = 3'h2 == index ? io_async_mem_2_id : _GEN_9; 
  assign _GEN_19 = 3'h2 == index ? io_async_mem_2_addr : _GEN_10; 
  assign _GEN_20 = 3'h2 == index ? io_async_mem_2_len : _GEN_11; 
  assign _GEN_21 = 3'h2 == index ? io_async_mem_2_size : _GEN_12; 
  assign _GEN_22 = 3'h2 == index ? io_async_mem_2_burst : _GEN_13; 
  assign _GEN_23 = 3'h2 == index ? io_async_mem_2_lock : _GEN_14; 
  assign _GEN_24 = 3'h2 == index ? io_async_mem_2_cache : _GEN_15; 
  assign _GEN_25 = 3'h2 == index ? io_async_mem_2_prot : _GEN_16; 
  assign _GEN_26 = 3'h2 == index ? io_async_mem_2_qos : _GEN_17; 
  assign _GEN_27 = 3'h3 == index ? io_async_mem_3_id : _GEN_18; 
  assign _GEN_28 = 3'h3 == index ? io_async_mem_3_addr : _GEN_19; 
  assign _GEN_29 = 3'h3 == index ? io_async_mem_3_len : _GEN_20; 
  assign _GEN_30 = 3'h3 == index ? io_async_mem_3_size : _GEN_21; 
  assign _GEN_31 = 3'h3 == index ? io_async_mem_3_burst : _GEN_22; 
  assign _GEN_32 = 3'h3 == index ? io_async_mem_3_lock : _GEN_23; 
  assign _GEN_33 = 3'h3 == index ? io_async_mem_3_cache : _GEN_24; 
  assign _GEN_34 = 3'h3 == index ? io_async_mem_3_prot : _GEN_25; 
  assign _GEN_35 = 3'h3 == index ? io_async_mem_3_qos : _GEN_26; 
  assign _GEN_36 = 3'h4 == index ? io_async_mem_4_id : _GEN_27; 
  assign _GEN_37 = 3'h4 == index ? io_async_mem_4_addr : _GEN_28; 
  assign _GEN_38 = 3'h4 == index ? io_async_mem_4_len : _GEN_29; 
  assign _GEN_39 = 3'h4 == index ? io_async_mem_4_size : _GEN_30; 
  assign _GEN_40 = 3'h4 == index ? io_async_mem_4_burst : _GEN_31; 
  assign _GEN_41 = 3'h4 == index ? io_async_mem_4_lock : _GEN_32; 
  assign _GEN_42 = 3'h4 == index ? io_async_mem_4_cache : _GEN_33; 
  assign _GEN_43 = 3'h4 == index ? io_async_mem_4_prot : _GEN_34; 
  assign _GEN_44 = 3'h4 == index ? io_async_mem_4_qos : _GEN_35; 
  assign _GEN_45 = 3'h5 == index ? io_async_mem_5_id : _GEN_36; 
  assign _GEN_46 = 3'h5 == index ? io_async_mem_5_addr : _GEN_37; 
  assign _GEN_47 = 3'h5 == index ? io_async_mem_5_len : _GEN_38; 
  assign _GEN_48 = 3'h5 == index ? io_async_mem_5_size : _GEN_39; 
  assign _GEN_49 = 3'h5 == index ? io_async_mem_5_burst : _GEN_40; 
  assign _GEN_50 = 3'h5 == index ? io_async_mem_5_lock : _GEN_41; 
  assign _GEN_51 = 3'h5 == index ? io_async_mem_5_cache : _GEN_42; 
  assign _GEN_52 = 3'h5 == index ? io_async_mem_5_prot : _GEN_43; 
  assign _GEN_53 = 3'h5 == index ? io_async_mem_5_qos : _GEN_44; 
  assign _GEN_54 = 3'h6 == index ? io_async_mem_6_id : _GEN_45; 
  assign _GEN_55 = 3'h6 == index ? io_async_mem_6_addr : _GEN_46; 
  assign _GEN_56 = 3'h6 == index ? io_async_mem_6_len : _GEN_47; 
  assign _GEN_57 = 3'h6 == index ? io_async_mem_6_size : _GEN_48; 
  assign _GEN_58 = 3'h6 == index ? io_async_mem_6_burst : _GEN_49; 
  assign _GEN_59 = 3'h6 == index ? io_async_mem_6_lock : _GEN_50; 
  assign _GEN_60 = 3'h6 == index ? io_async_mem_6_cache : _GEN_51; 
  assign _GEN_61 = 3'h6 == index ? io_async_mem_6_prot : _GEN_52; 
  assign _GEN_62 = 3'h6 == index ? io_async_mem_6_qos : _GEN_53; 
  assign _GEN_63 = 3'h7 == index ? io_async_mem_7_id : _GEN_54; 
  assign _GEN_64 = 3'h7 == index ? io_async_mem_7_addr : _GEN_55; 
  assign _GEN_65 = 3'h7 == index ? io_async_mem_7_len : _GEN_56; 
  assign _GEN_66 = 3'h7 == index ? io_async_mem_7_size : _GEN_57; 
  assign _GEN_67 = 3'h7 == index ? io_async_mem_7_burst : _GEN_58; 
  assign _GEN_68 = 3'h7 == index ? io_async_mem_7_lock : _GEN_59; 
  assign _GEN_69 = 3'h7 == index ? io_async_mem_7_cache : _GEN_60; 
  assign _GEN_70 = 3'h7 == index ? io_async_mem_7_prot : _GEN_61; 
  assign _GEN_71 = 3'h7 == index ? io_async_mem_7_qos : _GEN_62; 
  assign deq_bits_nxt_id = valid ? _GEN_63 : io_deq_bits_id; 
  assign deq_bits_nxt_addr = valid ? _GEN_64 : io_deq_bits_addr; 
  assign deq_bits_nxt_len = valid ? _GEN_65 : io_deq_bits_len; 
  assign deq_bits_nxt_size = valid ? _GEN_66 : io_deq_bits_size; 
  assign deq_bits_nxt_burst = valid ? _GEN_67 : io_deq_bits_burst; 
  assign deq_bits_nxt_lock = valid ? _GEN_68 : io_deq_bits_lock; 
  assign deq_bits_nxt_cache = valid ? _GEN_69 : io_deq_bits_cache; 
  assign deq_bits_nxt_prot = valid ? _GEN_70 : io_deq_bits_prot; 
  assign deq_bits_nxt_qos = valid ? _GEN_71 : io_deq_bits_qos; 
  assign _T_100 = {deq_bits_nxt_prot,deq_bits_nxt_qos}; 
  assign _T_101 = {deq_bits_nxt_lock,deq_bits_nxt_cache}; 
  assign _T_102 = {_T_101,_T_100}; 
  assign _T_103 = {deq_bits_nxt_size,deq_bits_nxt_burst}; 
  assign _T_104 = {deq_bits_nxt_id,deq_bits_nxt_addr}; 
  assign _T_105 = {_T_104,deq_bits_nxt_len}; 
  assign _T_106 = {_T_105,_T_103}; 
  assign _T_111 = deq_bits_reg_io_q; 
  assign valid_reg_1 = valid_reg_io_q; 
  assign _T_123 = io_async_safe_source_reset_n == 1'h0; 
  assign io_deq_valid = valid_reg_1 & source_ready; 
  assign io_deq_bits_id = _T_111[60:57]; 
  assign io_deq_bits_addr = _T_111[56:25]; 
  assign io_deq_bits_len = _T_111[24:17]; 
  assign io_deq_bits_size = _T_111[16:14]; 
  assign io_deq_bits_burst = _T_111[13:12]; 
  assign io_deq_bits_lock = _T_111[11]; 
  assign io_deq_bits_cache = _T_111[10:7]; 
  assign io_deq_bits_prot = _T_111[6:4]; 
  assign io_deq_bits_qos = _T_111[3:0]; 
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
  assign deq_bits_reg_io_d = {_T_106,_T_102}; 
  assign valid_reg_clock = clock; 
  assign valid_reg_reset = reset; 
  assign valid_reg_io_d = source_ready & _T_95; 
  assign valid_reg_io_en = 1'h1; 
  assign ridx_gray_clock = clock; 
  assign ridx_gray_reset = reset; 
  assign ridx_gray_io_d = _T_92 ^ _GEN_73; 
  assign ridx_gray_io_en = 1'h1; 
  assign AsyncValidSync_clock = clock; 
  assign AsyncValidSync_reset = reset | _T_123; 
  assign AsyncValidSync_io_in = 1'h1; 
  assign AsyncValidSync_1_clock = clock; 
  assign AsyncValidSync_1_reset = reset | _T_123; 
  assign AsyncValidSync_1_io_in = io_async_safe_widx_valid; 
  assign AsyncValidSync_2_clock = clock; 
  assign AsyncValidSync_2_reset = reset; 
  assign AsyncValidSync_2_io_in = AsyncValidSync_1_io_out; 
  assign AsyncResetRegVec_w1_i0_clock = clock; 
  assign AsyncResetRegVec_w1_i0_reset = reset; 
  assign AsyncResetRegVec_w1_i0_io_d = io_async_widx == io_async_ridx; 
  assign AsyncResetRegVec_w1_i0_io_en = 1'h1; 
endmodule
