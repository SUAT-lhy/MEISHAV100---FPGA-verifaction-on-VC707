module AXI4Fragmenter_Param #(
    parameter AXI4_ADDRESS_WIDTH = 32,
    parameter AXI4_RDATA_WIDTH   = 64,
    parameter AXI4_WDATA_WIDTH   = 64,
    parameter AXI4_USER_WIDTH    = 1,
    parameter AXI4_ID_WIDTH      = 8
) (
  input         clock,
  input         reset,
  output        auto_in_aw_ready,
  input         auto_in_aw_valid,
  input         auto_in_aw_bits_id,
  input  [31:0] auto_in_aw_bits_addr,
  input  [7:0]  auto_in_aw_bits_len,
  input  [2:0]  auto_in_aw_bits_size,
  input  [1:0]  auto_in_aw_bits_burst,
  input  [3:0]  auto_in_aw_bits_cache,
  input  [2:0]  auto_in_aw_bits_prot,
  input  [AXI4_ID_WIDTH-2:0]  auto_in_aw_bits_echo_extra_id,
  output        auto_in_w_ready,
  input         auto_in_w_valid,
  input  [63:0] auto_in_w_bits_data,
  input  [7:0]  auto_in_w_bits_strb,
  input         auto_in_w_bits_last,
  input         auto_in_b_ready,
  output        auto_in_b_valid,
  output        auto_in_b_bits_id,
  output [1:0]  auto_in_b_bits_resp,
  output [AXI4_ID_WIDTH-2:0]  auto_in_b_bits_echo_extra_id,
  output        auto_in_ar_ready,
  input         auto_in_ar_valid,
  input         auto_in_ar_bits_id,
  input  [31:0] auto_in_ar_bits_addr,
  input  [7:0]  auto_in_ar_bits_len,
  input  [2:0]  auto_in_ar_bits_size,
  input  [1:0]  auto_in_ar_bits_burst,
  input  [3:0]  auto_in_ar_bits_cache,
  input  [2:0]  auto_in_ar_bits_prot,
  input  [AXI4_ID_WIDTH-2:0]  auto_in_ar_bits_echo_extra_id,
  input         auto_in_r_ready,
  output        auto_in_r_valid,
  output        auto_in_r_bits_id,
  output [63:0] auto_in_r_bits_data,
  output [1:0]  auto_in_r_bits_resp,
  output [AXI4_ID_WIDTH-2:0]  auto_in_r_bits_echo_extra_id,
  output        auto_in_r_bits_last,
  input         auto_out_aw_ready,
  output        auto_out_aw_valid,
  output        auto_out_aw_bits_id,
  output [31:0] auto_out_aw_bits_addr,
  output [7:0]  auto_out_aw_bits_len,
  output [2:0]  auto_out_aw_bits_size,
  output [3:0]  auto_out_aw_bits_cache,
  output [2:0]  auto_out_aw_bits_prot,
  output [AXI4_ID_WIDTH-2:0]  auto_out_aw_bits_echo_extra_id,
  output        auto_out_aw_bits_echo_real_last,
  input         auto_out_w_ready,
  output        auto_out_w_valid,
  output [63:0] auto_out_w_bits_data,
  output [7:0]  auto_out_w_bits_strb,
  output        auto_out_w_bits_last,
  output        auto_out_b_ready,
  input         auto_out_b_valid,
  input         auto_out_b_bits_id,
  input  [1:0]  auto_out_b_bits_resp,
  input  [AXI4_ID_WIDTH-2:0]  auto_out_b_bits_echo_extra_id,
  input         auto_out_b_bits_echo_real_last,
  input         auto_out_ar_ready,
  output        auto_out_ar_valid,
  output        auto_out_ar_bits_id,
  output [31:0] auto_out_ar_bits_addr,
  output [7:0]  auto_out_ar_bits_len,
  output [2:0]  auto_out_ar_bits_size,
  output [3:0]  auto_out_ar_bits_cache,
  output [2:0]  auto_out_ar_bits_prot,
  output [AXI4_ID_WIDTH-2:0]  auto_out_ar_bits_echo_extra_id,
  output        auto_out_ar_bits_echo_real_last,
  output        auto_out_r_ready,
  input         auto_out_r_valid,
  input         auto_out_r_bits_id,
  input  [63:0] auto_out_r_bits_data,
  input  [1:0]  auto_out_r_bits_resp,
  input  [AXI4_ID_WIDTH-2:0]  auto_out_r_bits_echo_extra_id,
  input         auto_out_r_bits_echo_real_last,
  input         auto_out_r_bits_last
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
`endif // RANDOMIZE_REG_INIT
  wire  deq_clock; // @[Decoupled.scala 361:21]
  wire  deq_reset; // @[Decoupled.scala 361:21]
  wire  deq_io_enq_ready; // @[Decoupled.scala 361:21]
  wire  deq_io_enq_valid; // @[Decoupled.scala 361:21]
  wire  deq_io_enq_bits_id; // @[Decoupled.scala 361:21]
  wire [31:0] deq_io_enq_bits_addr; // @[Decoupled.scala 361:21]
  wire [7:0] deq_io_enq_bits_len; // @[Decoupled.scala 361:21]
  wire [2:0] deq_io_enq_bits_size; // @[Decoupled.scala 361:21]
  wire [1:0] deq_io_enq_bits_burst; // @[Decoupled.scala 361:21]
  wire [3:0] deq_io_enq_bits_cache; // @[Decoupled.scala 361:21]
  wire [2:0] deq_io_enq_bits_prot; // @[Decoupled.scala 361:21]
  wire [AXI4_ID_WIDTH-2:0] deq_io_enq_bits_echo_extra_id; // @[Decoupled.scala 361:21]
  wire  deq_io_deq_ready; // @[Decoupled.scala 361:21]
  wire  deq_io_deq_valid; // @[Decoupled.scala 361:21]
  wire  deq_io_deq_bits_id; // @[Decoupled.scala 361:21]
  wire [31:0] deq_io_deq_bits_addr; // @[Decoupled.scala 361:21]
  wire [7:0] deq_io_deq_bits_len; // @[Decoupled.scala 361:21]
  wire [2:0] deq_io_deq_bits_size; // @[Decoupled.scala 361:21]
  wire [1:0] deq_io_deq_bits_burst; // @[Decoupled.scala 361:21]
  wire [3:0] deq_io_deq_bits_cache; // @[Decoupled.scala 361:21]
  wire [2:0] deq_io_deq_bits_prot; // @[Decoupled.scala 361:21]
  wire [AXI4_ID_WIDTH-2:0] deq_io_deq_bits_echo_extra_id; // @[Decoupled.scala 361:21]
  wire  deq_1_clock; // @[Decoupled.scala 361:21]
  wire  deq_1_reset; // @[Decoupled.scala 361:21]
  wire  deq_1_io_enq_ready; // @[Decoupled.scala 361:21]
  wire  deq_1_io_enq_valid; // @[Decoupled.scala 361:21]
  wire  deq_1_io_enq_bits_id; // @[Decoupled.scala 361:21]
  wire [31:0] deq_1_io_enq_bits_addr; // @[Decoupled.scala 361:21]
  wire [7:0] deq_1_io_enq_bits_len; // @[Decoupled.scala 361:21]
  wire [2:0] deq_1_io_enq_bits_size; // @[Decoupled.scala 361:21]
  wire [1:0] deq_1_io_enq_bits_burst; // @[Decoupled.scala 361:21]
  wire [3:0] deq_1_io_enq_bits_cache; // @[Decoupled.scala 361:21]
  wire [2:0] deq_1_io_enq_bits_prot; // @[Decoupled.scala 361:21]
  wire [AXI4_ID_WIDTH-2:0] deq_1_io_enq_bits_echo_extra_id; // @[Decoupled.scala 361:21]
  wire  deq_1_io_deq_ready; // @[Decoupled.scala 361:21]
  wire  deq_1_io_deq_valid; // @[Decoupled.scala 361:21]
  wire  deq_1_io_deq_bits_id; // @[Decoupled.scala 361:21]
  wire [31:0] deq_1_io_deq_bits_addr; // @[Decoupled.scala 361:21]
  wire [7:0] deq_1_io_deq_bits_len; // @[Decoupled.scala 361:21]
  wire [2:0] deq_1_io_deq_bits_size; // @[Decoupled.scala 361:21]
  wire [1:0] deq_1_io_deq_bits_burst; // @[Decoupled.scala 361:21]
  wire [3:0] deq_1_io_deq_bits_cache; // @[Decoupled.scala 361:21]
  wire [2:0] deq_1_io_deq_bits_prot; // @[Decoupled.scala 361:21]
  wire [AXI4_ID_WIDTH-2:0] deq_1_io_deq_bits_echo_extra_id; // @[Decoupled.scala 361:21]
  wire  in_w_deq_clock; // @[Decoupled.scala 361:21]
  wire  in_w_deq_reset; // @[Decoupled.scala 361:21]
  wire  in_w_deq_io_enq_ready; // @[Decoupled.scala 361:21]
  wire  in_w_deq_io_enq_valid; // @[Decoupled.scala 361:21]
  wire [63:0] in_w_deq_io_enq_bits_data; // @[Decoupled.scala 361:21]
  wire [7:0] in_w_deq_io_enq_bits_strb; // @[Decoupled.scala 361:21]
  wire  in_w_deq_io_enq_bits_last; // @[Decoupled.scala 361:21]
  wire  in_w_deq_io_deq_ready; // @[Decoupled.scala 361:21]
  wire  in_w_deq_io_deq_valid; // @[Decoupled.scala 361:21]
  wire [63:0] in_w_deq_io_deq_bits_data; // @[Decoupled.scala 361:21]
  wire [7:0] in_w_deq_io_deq_bits_strb; // @[Decoupled.scala 361:21]
  wire  in_w_deq_io_deq_bits_last; // @[Decoupled.scala 361:21]
  reg  busy; // @[Fragmenter.scala 63:29]
  reg [31:0] r_addr; // @[Fragmenter.scala 64:25]
  reg [7:0] r_len; // @[Fragmenter.scala 65:25]
  wire [7:0] irr_bits_len = deq_io_deq_bits_len; // @[Decoupled.scala 401:19 402:14]
  wire [7:0] len = busy ? r_len : irr_bits_len; // @[Fragmenter.scala 67:23]
  wire [31:0] irr_bits_addr = deq_io_deq_bits_addr; // @[Decoupled.scala 401:19 402:14]
  wire [31:0] addr = busy ? r_addr : irr_bits_addr; // @[Fragmenter.scala 68:23]
  wire [7:0] alignment = addr[10:3]; // @[Fragmenter.scala 72:29]
  wire [31:0] _support1_T = addr ^ 32'h2000; // @[Parameters.scala 137:31]
  wire [32:0] _support1_T_1 = {1'b0,$signed(_support1_T)}; // @[Parameters.scala 137:49]
  wire [32:0] _support1_T_3 = $signed(_support1_T_1) & 33'shca012000; // @[Parameters.scala 137:52]
  wire  _support1_T_4 = $signed(_support1_T_3) == 33'sh0; // @[Parameters.scala 137:67]
  wire [32:0] _support1_T_6 = {1'b0,$signed(addr)}; // @[Parameters.scala 137:49]
  wire [32:0] _support1_T_8 = $signed(_support1_T_6) & 33'shca012000; // @[Parameters.scala 137:52]
  wire  _support1_T_9 = $signed(_support1_T_8) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _support1_T_10 = addr ^ 32'h10000; // @[Parameters.scala 137:31]
  wire [32:0] _support1_T_11 = {1'b0,$signed(_support1_T_10)}; // @[Parameters.scala 137:49]
  wire [32:0] _support1_T_13 = $signed(_support1_T_11) & 33'shca010000; // @[Parameters.scala 137:52]
  wire  _support1_T_14 = $signed(_support1_T_13) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _support1_T_15 = addr ^ 32'h2000000; // @[Parameters.scala 137:31]
  wire [32:0] _support1_T_16 = {1'b0,$signed(_support1_T_15)}; // @[Parameters.scala 137:49]
  wire [32:0] _support1_T_18 = $signed(_support1_T_16) & 33'shca010000; // @[Parameters.scala 137:52]
  wire  _support1_T_19 = $signed(_support1_T_18) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _support1_T_20 = addr ^ 32'h8000000; // @[Parameters.scala 137:31]
  wire [32:0] _support1_T_21 = {1'b0,$signed(_support1_T_20)}; // @[Parameters.scala 137:49]
  wire [32:0] _support1_T_23 = $signed(_support1_T_21) & 33'shc8000000; // @[Parameters.scala 137:52]
  wire  _support1_T_24 = $signed(_support1_T_23) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _support1_T_25 = addr ^ 32'h40000000; // @[Parameters.scala 137:31]
  wire [32:0] _support1_T_26 = {1'b0,$signed(_support1_T_25)}; // @[Parameters.scala 137:49]
  wire [32:0] _support1_T_28 = $signed(_support1_T_26) & 33'shc0000000; // @[Parameters.scala 137:52]
  wire  _support1_T_29 = $signed(_support1_T_28) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _support1_T_30 = addr ^ 32'h80000000; // @[Parameters.scala 137:31]
  wire [32:0] _support1_T_31 = {1'b0,$signed(_support1_T_30)}; // @[Parameters.scala 137:49]
  wire [32:0] _support1_T_33 = $signed(_support1_T_31) & 33'shca010000; // @[Parameters.scala 137:52]
  wire  _support1_T_34 = $signed(_support1_T_33) == 33'sh0; // @[Parameters.scala 137:67]
  wire  _support1_T_39 = _support1_T_9 | _support1_T_14 | _support1_T_19 | _support1_T_24 | _support1_T_29 |
    _support1_T_34; // @[Fragmenter.scala 79:100]
  wire [7:0] _support1_T_40 = _support1_T_4 ? 8'hff : 8'h0; // @[Mux.scala 27:73]
  wire [2:0] _support1_T_41 = _support1_T_39 ? 3'h7 : 3'h0; // @[Mux.scala 27:73]
  wire [7:0] _GEN_16 = {{5'd0}, _support1_T_41}; // @[Mux.scala 27:73]
  wire [7:0] support1 = _support1_T_40 | _GEN_16; // @[Mux.scala 27:73]
  wire [7:0] _GEN_17 = {{1'd0}, len[7:1]}; // @[package.scala 253:43]
  wire [7:0] _fillLow_T_1 = len | _GEN_17; // @[package.scala 253:43]
  wire [7:0] _GEN_18 = {{2'd0}, _fillLow_T_1[7:2]}; // @[package.scala 253:43]
  wire [7:0] _fillLow_T_3 = _fillLow_T_1 | _GEN_18; // @[package.scala 253:43]
  wire [7:0] _GEN_19 = {{4'd0}, _fillLow_T_3[7:4]}; // @[package.scala 253:43]
  wire [7:0] _fillLow_T_5 = _fillLow_T_3 | _GEN_19; // @[package.scala 253:43]
  wire [AXI4_ID_WIDTH-2:0] fillLow = _fillLow_T_5[7:1]; // @[Fragmenter.scala 88:37]
  wire [7:0] _wipeHigh_T = ~len; // @[Fragmenter.scala 89:32]
  wire [8:0] _wipeHigh_T_1 = {_wipeHigh_T, 1'h0}; // @[package.scala 244:48]
  wire [7:0] _wipeHigh_T_3 = _wipeHigh_T | _wipeHigh_T_1[7:0]; // @[package.scala 244:43]
  wire [9:0] _wipeHigh_T_4 = {_wipeHigh_T_3, 2'h0}; // @[package.scala 244:48]
  wire [7:0] _wipeHigh_T_6 = _wipeHigh_T_3 | _wipeHigh_T_4[7:0]; // @[package.scala 244:43]
  wire [11:0] _wipeHigh_T_7 = {_wipeHigh_T_6, 4'h0}; // @[package.scala 244:48]
  wire [7:0] _wipeHigh_T_9 = _wipeHigh_T_6 | _wipeHigh_T_7[7:0]; // @[package.scala 244:43]
  wire [7:0] wipeHigh = ~_wipeHigh_T_9; // @[Fragmenter.scala 89:24]
  wire [7:0] _GEN_20 = {{1'd0}, fillLow}; // @[Fragmenter.scala 90:32]
  wire [7:0] remain1 = _GEN_20 | wipeHigh; // @[Fragmenter.scala 90:32]
  wire [8:0] _align1_T = {alignment, 1'h0}; // @[package.scala 244:48]
  wire [7:0] _align1_T_2 = alignment | _align1_T[7:0]; // @[package.scala 244:43]
  wire [9:0] _align1_T_3 = {_align1_T_2, 2'h0}; // @[package.scala 244:48]
  wire [7:0] _align1_T_5 = _align1_T_2 | _align1_T_3[7:0]; // @[package.scala 244:43]
  wire [11:0] _align1_T_6 = {_align1_T_5, 4'h0}; // @[package.scala 244:48]
  wire [7:0] _align1_T_8 = _align1_T_5 | _align1_T_6[7:0]; // @[package.scala 244:43]
  wire [7:0] align1 = ~_align1_T_8; // @[Fragmenter.scala 91:24]
  wire [7:0] _maxSupported1_T = remain1 & align1; // @[Fragmenter.scala 92:37]
  wire [7:0] maxSupported1 = _maxSupported1_T & support1; // @[Fragmenter.scala 92:46]
  wire [1:0] irr_bits_burst = deq_io_deq_bits_burst; // @[Decoupled.scala 401:19 402:14]
  wire  fixed = irr_bits_burst == 2'h0; // @[Fragmenter.scala 95:34]
  wire [2:0] irr_bits_size = deq_io_deq_bits_size; // @[Decoupled.scala 401:19 402:14]
  wire  narrow = irr_bits_size != 3'h3; // @[Fragmenter.scala 9AXI4_ID_WIDTH-2:34]
  wire  bad = fixed | narrow; // @[Fragmenter.scala 97:25]
  wire [7:0] beats1 = bad ? 8'h0 : maxSupported1; // @[Fragmenter.scala 100:25]
  wire [8:0] _beats_T = {beats1, 1'h0}; // @[package.scala 232:35]
  wire [8:0] _beats_T_1 = _beats_T | 9'h1; // @[package.scala 232:40]
  wire [8:0] _beats_T_2 = {1'h0,beats1}; // @[Cat.scala 31:58]
  wire [8:0] _beats_T_3 = ~_beats_T_2; // @[package.scala 232:53]
  wire [8:0] beats = _beats_T_1 & _beats_T_3; // @[package.scala 232:51]
  wire [15:0] _GEN_1 = {{7'd0}, beats}; // @[Fragmenter.scala 103:38]
  wire [15:0] _inc_addr_T = _GEN_1 << irr_bits_size; // @[Fragmenter.scala 103:38]
  wire [31:0] _GEN_21 = {{16'd0}, _inc_addr_T}; // @[Fragmenter.scala 103:29]
  wire [31:0] inc_addr = addr + _GEN_21; // @[Fragmenter.scala 103:29]
  wire [15:0] _wrapMask_T = {irr_bits_len,8'hff}; // @[Cat.scala 31:58]
  wire [22:0] _GEN_3 = {{7'd0}, _wrapMask_T}; // @[Bundles.scala 34:21]
  wire [22:0] _wrapMask_T_1 = _GEN_3 << irr_bits_size; // @[Bundles.scala 34:21]
  wire [14:0] wrapMask = _wrapMask_T_1[22:8]; // @[Bundles.scala 34:30]
  wire [31:0] _GEN_22 = {{17'd0}, wrapMask}; // @[Fragmenter.scala 107:33]
  wire [31:0] _mux_addr_T = inc_addr & _GEN_22; // @[Fragmenter.scala 107:33]
  wire [31:0] _mux_addr_T_1 = ~irr_bits_addr; // @[Fragmenter.scala 107:49]
  wire [31:0] _mux_addr_T_2 = _mux_addr_T_1 | _GEN_22; // @[Fragmenter.scala 107:62]
  wire [31:0] _mux_addr_T_3 = ~_mux_addr_T_2; // @[Fragmenter.scala 107:47]
  wire [31:0] _mux_addr_T_4 = _mux_addr_T | _mux_addr_T_3; // @[Fragmenter.scala 107:45]
  wire  ar_last = beats1 == len; // @[Fragmenter.scala 113:27]
  wire [31:0] _out_bits_addr_T = ~addr; // @[Fragmenter.scala 125:28]
  wire [9:0] _out_bits_addr_T_2 = 10'h7 << irr_bits_size; // @[package.scala 234:77]
  wire [2:0] _out_bits_addr_T_4 = ~_out_bits_addr_T_2[2:0]; // @[package.scala 234:46]
  wire [31:0] _GEN_24 = {{29'd0}, _out_bits_addr_T_4}; // @[Fragmenter.scala 125:34]
  wire [31:0] _out_bits_addr_T_5 = _out_bits_addr_T | _GEN_24; // @[Fragmenter.scala 125:34]
  wire  irr_valid = deq_io_deq_valid; // @[Decoupled.scala 401:19 403:15]
  wire  _T_2 = auto_out_ar_ready & irr_valid; // @[Decoupled.scala 50:35]
  wire [8:0] _GEN_25 = {{1'd0}, len}; // @[Fragmenter.scala 130:25]
  wire [8:0] _r_len_T_1 = _GEN_25 - beats; // @[Fragmenter.scala 130:25]
  wire [8:0] _GEN_4 = _T_2 ? _r_len_T_1 : {{1'd0}, r_len}; // @[Fragmenter.scala 127:27 130:18 65:25]
  reg  busy_1; // @[Fragmenter.scala 63:29]
  reg [31:0] r_addr_1; // @[Fragmenter.scala 64:25]
  reg [7:0] r_len_1; // @[Fragmenter.scala 65:25]
  wire [7:0] irr_1_bits_len = deq_1_io_deq_bits_len; // @[Decoupled.scala 401:19 402:14]
  wire [7:0] len_1 = busy_1 ? r_len_1 : irr_1_bits_len; // @[Fragmenter.scala 67:23]
  wire [31:0] irr_1_bits_addr = deq_1_io_deq_bits_addr; // @[Decoupled.scala 401:19 402:14]
  wire [31:0] addr_1 = busy_1 ? r_addr_1 : irr_1_bits_addr; // @[Fragmenter.scala 68:23]
  wire [7:0] alignment_1 = addr_1[10:3]; // @[Fragmenter.scala 72:29]
  wire [31:0] _support1_T_43 = addr_1 ^ 32'h2000; // @[Parameters.scala 137:31]
  wire [32:0] _support1_T_44 = {1'b0,$signed(_support1_T_43)}; // @[Parameters.scala 137:49]
  wire [32:0] _support1_T_46 = $signed(_support1_T_44) & 33'shca002000; // @[Parameters.scala 137:52]
  wire  _support1_T_47 = $signed(_support1_T_46) == 33'sh0; // @[Parameters.scala 137:67]
  wire [32:0] _support1_T_49 = {1'b0,$signed(addr_1)}; // @[Parameters.scala 137:49]
  wire [32:0] _support1_T_51 = $signed(_support1_T_49) & 33'shca002000; // @[Parameters.scala 137:52]
  wire  _support1_T_52 = $signed(_support1_T_51) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _support1_T_53 = addr_1 ^ 32'h2000000; // @[Parameters.scala 137:31]
  wire [32:0] _support1_T_54 = {1'b0,$signed(_support1_T_53)}; // @[Parameters.scala 137:49]
  wire [32:0] _support1_T_56 = $signed(_support1_T_54) & 33'shca000000; // @[Parameters.scala 137:52]
  wire  _support1_T_57 = $signed(_support1_T_56) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _support1_T_58 = addr_1 ^ 32'h8000000; // @[Parameters.scala 137:31]
  wire [32:0] _support1_T_59 = {1'b0,$signed(_support1_T_58)}; // @[Parameters.scala 137:49]
  wire [32:0] _support1_T_61 = $signed(_support1_T_59) & 33'shc8000000; // @[Parameters.scala 137:52]
  wire  _support1_T_62 = $signed(_support1_T_61) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _support1_T_63 = addr_1 ^ 32'h80000000; // @[Parameters.scala 137:31]
  wire [32:0] _support1_T_64 = {1'b0,$signed(_support1_T_63)}; // @[Parameters.scala 137:49]
  wire [32:0] _support1_T_66 = $signed(_support1_T_64) & 33'shca000000; // @[Parameters.scala 137:52]
  wire  _support1_T_67 = $signed(_support1_T_66) == 33'sh0; // @[Parameters.scala 137:67]
  wire  _support1_T_70 = _support1_T_52 | _support1_T_57 | _support1_T_62 | _support1_T_67; // @[Fragmenter.scala 79:100]
  wire [31:0] _support1_T_71 = addr_1 ^ 32'h40000000; // @[Parameters.scala 137:31]
  wire [32:0] _support1_T_72 = {1'b0,$signed(_support1_T_71)}; // @[Parameters.scala 137:49]
  wire [32:0] _support1_T_74 = $signed(_support1_T_72) & 33'shc0000000; // @[Parameters.scala 137:52]
  wire  _support1_T_75 = $signed(_support1_T_74) == 33'sh0; // @[Parameters.scala 137:67]
  wire [7:0] _support1_T_76 = _support1_T_47 ? 8'hff : 8'h0; // @[Mux.scala 27:73]
  wire [2:0] _support1_T_77 = _support1_T_70 ? 3'h7 : 3'h0; // @[Mux.scala 27:73]
  wire [4:0] _support1_T_78 = _support1_T_75 ? 5'h1f : 5'h0; // @[Mux.scala 27:73]
  wire [7:0] _GEN_26 = {{5'd0}, _support1_T_77}; // @[Mux.scala 27:73]
  wire [7:0] _support1_T_79 = _support1_T_76 | _GEN_26; // @[Mux.scala 27:73]
  wire [7:0] _GEN_27 = {{3'd0}, _support1_T_78}; // @[Mux.scala 27:73]
  wire [7:0] support1_1 = _support1_T_79 | _GEN_27; // @[Mux.scala 27:73]
  wire [7:0] _GEN_28 = {{1'd0}, len_1[7:1]}; // @[package.scala 253:43]
  wire [7:0] _fillLow_T_8 = len_1 | _GEN_28; // @[package.scala 253:43]
  wire [7:0] _GEN_29 = {{2'd0}, _fillLow_T_8[7:2]}; // @[package.scala 253:43]
  wire [7:0] _fillLow_T_10 = _fillLow_T_8 | _GEN_29; // @[package.scala 253:43]
  wire [7:0] _GEN_30 = {{4'd0}, _fillLow_T_10[7:4]}; // @[package.scala 253:43]
  wire [7:0] _fillLow_T_12 = _fillLow_T_10 | _GEN_30; // @[package.scala 253:43]
  wire [AXI4_ID_WIDTH-2:0] fillLow_1 = _fillLow_T_12[7:1]; // @[Fragmenter.scala 88:37]
  wire [7:0] _wipeHigh_T_11 = ~len_1; // @[Fragmenter.scala 89:32]
  wire [8:0] _wipeHigh_T_12 = {_wipeHigh_T_11, 1'h0}; // @[package.scala 244:48]
  wire [7:0] _wipeHigh_T_14 = _wipeHigh_T_11 | _wipeHigh_T_12[7:0]; // @[package.scala 244:43]
  wire [9:0] _wipeHigh_T_15 = {_wipeHigh_T_14, 2'h0}; // @[package.scala 244:48]
  wire [7:0] _wipeHigh_T_17 = _wipeHigh_T_14 | _wipeHigh_T_15[7:0]; // @[package.scala 244:43]
  wire [11:0] _wipeHigh_T_18 = {_wipeHigh_T_17, 4'h0}; // @[package.scala 244:48]
  wire [7:0] _wipeHigh_T_20 = _wipeHigh_T_17 | _wipeHigh_T_18[7:0]; // @[package.scala 244:43]
  wire [7:0] wipeHigh_1 = ~_wipeHigh_T_20; // @[Fragmenter.scala 89:24]
  wire [7:0] _GEN_31 = {{1'd0}, fillLow_1}; // @[Fragmenter.scala 90:32]
  wire [7:0] remain1_1 = _GEN_31 | wipeHigh_1; // @[Fragmenter.scala 90:32]
  wire [8:0] _align1_T_10 = {alignment_1, 1'h0}; // @[package.scala 244:48]
  wire [7:0] _align1_T_12 = alignment_1 | _align1_T_10[7:0]; // @[package.scala 244:43]
  wire [9:0] _align1_T_13 = {_align1_T_12, 2'h0}; // @[package.scala 244:48]
  wire [7:0] _align1_T_15 = _align1_T_12 | _align1_T_13[7:0]; // @[package.scala 244:43]
  wire [11:0] _align1_T_16 = {_align1_T_15, 4'h0}; // @[package.scala 244:48]
  wire [7:0] _align1_T_18 = _align1_T_15 | _align1_T_16[7:0]; // @[package.scala 244:43]
  wire [7:0] align1_1 = ~_align1_T_18; // @[Fragmenter.scala 91:24]
  wire [7:0] _maxSupported1_T_1 = remain1_1 & align1_1; // @[Fragmenter.scala 92:37]
  wire [7:0] maxSupported1_1 = _maxSupported1_T_1 & support1_1; // @[Fragmenter.scala 92:46]
  wire [1:0] irr_1_bits_burst = deq_1_io_deq_bits_burst; // @[Decoupled.scala 401:19 402:14]
  wire  fixed_1 = irr_1_bits_burst == 2'h0; // @[Fragmenter.scala 95:34]
  wire [2:0] irr_1_bits_size = deq_1_io_deq_bits_size; // @[Decoupled.scala 401:19 402:14]
  wire  narrow_1 = irr_1_bits_size != 3'h3; // @[Fragmenter.scala 9AXI4_ID_WIDTH-2:34]
  wire  bad_1 = fixed_1 | narrow_1; // @[Fragmenter.scala 97:25]
  wire [7:0] beats1_1 = bad_1 ? 8'h0 : maxSupported1_1; // @[Fragmenter.scala 100:25]
  wire [8:0] _beats_T_4 = {beats1_1, 1'h0}; // @[package.scala 232:35]
  wire [8:0] _beats_T_5 = _beats_T_4 | 9'h1; // @[package.scala 232:40]
  wire [8:0] _beats_T_6 = {1'h0,beats1_1}; // @[Cat.scala 31:58]
  wire [8:0] _beats_T_7 = ~_beats_T_6; // @[package.scala 232:53]
  wire [8:0] w_beats = _beats_T_5 & _beats_T_7; // @[package.scala 232:51]
  wire [15:0] _GEN_6 = {{7'd0}, w_beats}; // @[Fragmenter.scala 103:38]
  wire [15:0] _inc_addr_T_2 = _GEN_6 << irr_1_bits_size; // @[Fragmenter.scala 103:38]
  wire [31:0] _GEN_32 = {{16'd0}, _inc_addr_T_2}; // @[Fragmenter.scala 103:29]
  wire [31:0] inc_addr_1 = addr_1 + _GEN_32; // @[Fragmenter.scala 103:29]
  wire [15:0] _wrapMask_T_2 = {irr_1_bits_len,8'hff}; // @[Cat.scala 31:58]
  wire [22:0] _GEN_8 = {{7'd0}, _wrapMask_T_2}; // @[Bundles.scala 34:21]
  wire [22:0] _wrapMask_T_3 = _GEN_8 << irr_1_bits_size; // @[Bundles.scala 34:21]
  wire [14:0] wrapMask_1 = _wrapMask_T_3[22:8]; // @[Bundles.scala 34:30]
  wire [31:0] _GEN_33 = {{17'd0}, wrapMask_1}; // @[Fragmenter.scala 107:33]
  wire [31:0] _mux_addr_T_5 = inc_addr_1 & _GEN_33; // @[Fragmenter.scala 107:33]
  wire [31:0] _mux_addr_T_6 = ~irr_1_bits_addr; // @[Fragmenter.scala 107:49]
  wire [31:0] _mux_addr_T_7 = _mux_addr_T_6 | _GEN_33; // @[Fragmenter.scala 107:62]
  wire [31:0] _mux_addr_T_8 = ~_mux_addr_T_7; // @[Fragmenter.scala 107:47]
  wire [31:0] _mux_addr_T_9 = _mux_addr_T_5 | _mux_addr_T_8; // @[Fragmenter.scala 107:45]
  wire  aw_last = beats1_1 == len_1; // @[Fragmenter.scala 113:27]
  reg [8:0] w_counter; // @[Fragmenter.scala 167:30]
  wire  w_idle = w_counter == 9'h0; // @[Fragmenter.scala 168:30]
  reg  wbeats_latched; // @[Fragmenter.scala 153:35]
  wire  _in_aw_ready_T = w_idle | wbeats_latched; // @[Fragmenter.scala 161:52]
  wire  in_aw_ready = auto_out_aw_ready & (w_idle | wbeats_latched); // @[Fragmenter.scala 161:35]
  wire [31:0] _out_bits_addr_T_7 = ~addr_1; // @[Fragmenter.scala 125:28]
  wire [9:0] _out_bits_addr_T_9 = 10'h7 << irr_1_bits_size; // @[package.scala 234:77]
  wire [2:0] _out_bits_addr_T_11 = ~_out_bits_addr_T_9[2:0]; // @[package.scala 234:46]
  wire [31:0] _GEN_35 = {{29'd0}, _out_bits_addr_T_11}; // @[Fragmenter.scala 125:34]
  wire [31:0] _out_bits_addr_T_12 = _out_bits_addr_T_7 | _GEN_35; // @[Fragmenter.scala 125:34]
  wire  irr_1_valid = deq_1_io_deq_valid; // @[Decoupled.scala 401:19 403:15]
  wire  _T_5 = in_aw_ready & irr_1_valid; // @[Decoupled.scala 50:35]
  wire [8:0] _GEN_36 = {{1'd0}, len_1}; // @[Fragmenter.scala 130:25]
  wire [8:0] _r_len_T_3 = _GEN_36 - w_beats; // @[Fragmenter.scala 130:25]
  wire [8:0] _GEN_9 = _T_5 ? _r_len_T_3 : {{1'd0}, r_len_1}; // @[Fragmenter.scala 127:27 130:18 65:25]
  wire  wbeats_valid = irr_1_valid & ~wbeats_latched; // @[Fragmenter.scala 162:35]
  wire  _GEN_10 = wbeats_valid & w_idle | wbeats_latched; // @[Fragmenter.scala 153:35 15AXI4_ID_WIDTH-2:{43,60}]
  wire  bundleOut_0_aw_valid = irr_1_valid & _in_aw_ready_T; // @[Fragmenter.scala 160:35]
  wire  _T_7 = auto_out_aw_ready & bundleOut_0_aw_valid; // @[Decoupled.scala 50:35]
  wire [8:0] _w_todo_T = wbeats_valid ? w_beats : 9'h0; // @[Fragmenter.scala 169:35]
  wire [8:0] w_todo = w_idle ? _w_todo_T : w_counter; // @[Fragmenter.scala 169:23]
  wire  w_last = w_todo == 9'h1; // @[Fragmenter.scala 170:27]
  wire  in_w_valid = in_w_deq_io_deq_valid; // @[Decoupled.scala 401:19 403:15]
  wire  _bundleOut_0_w_valid_T_1 = ~w_idle | wbeats_valid; // @[Fragmenter.scala 17AXI4_ID_WIDTH-2:51]
  wire  bundleOut_0_w_valid = in_w_valid & (~w_idle | wbeats_valid); // @[Fragmenter.scala 17AXI4_ID_WIDTH-2:33]
  wire  _w_counter_T = auto_out_w_ready & bundleOut_0_w_valid; // @[Decoupled.scala 50:35]
  wire [8:0] _GEN_37 = {{8'd0}, _w_counter_T}; // @[Fragmenter.scala 171:27]
  wire [8:0] _w_counter_T_2 = w_todo - _GEN_37; // @[Fragmenter.scala 171:27]
  wire  _T_13 = ~reset; // @[Fragmenter.scala 172:14]
  wire  in_w_bits_last = in_w_deq_io_deq_bits_last; // @[Decoupled.scala 401:19 402:14]
  wire  bundleOut_0_b_ready = auto_in_b_ready | ~auto_out_b_bits_echo_real_last; // @[Fragmenter.scala 192:33]
  reg [1:0] error_0; // @[Fragmenter.scala 195:26]
  reg [1:0] error_1; // @[Fragmenter.scala 195:26]
  wire [1:0] _GEN_13 = auto_out_b_bits_id ? error_1 : error_0; // @[Fragmenter.scala 19AXI4_ID_WIDTH-2:{41,41}]
  wire [1:0] _T_22 = 2'h1 << auto_out_b_bits_id; // @[OneHot.scala 64:12]
  wire  _T_26 = bundleOut_0_b_ready & auto_out_b_valid; // @[Decoupled.scala 50:35]
  wire [1:0] _error_0_T = error_0 | auto_out_b_bits_resp; // @[Fragmenter.scala 198:70]
  wire [1:0] _error_1_T = error_1 | auto_out_b_bits_resp; // @[Fragmenter.scala 198:70]
  Queue_Fragmenter_17 deq ( // @[Decoupled.scala 361:21]
    .clock(deq_clock),
    .reset(deq_reset),
    .io_enq_ready(deq_io_enq_ready),
    .io_enq_valid(deq_io_enq_valid),
    .io_enq_bits_id(deq_io_enq_bits_id),
    .io_enq_bits_addr(deq_io_enq_bits_addr),
    .io_enq_bits_len(deq_io_enq_bits_len),
    .io_enq_bits_size(deq_io_enq_bits_size),
    .io_enq_bits_burst(deq_io_enq_bits_burst),
    .io_enq_bits_cache(deq_io_enq_bits_cache),
    .io_enq_bits_prot(deq_io_enq_bits_prot),
    .io_enq_bits_echo_extra_id(deq_io_enq_bits_echo_extra_id),
    .io_deq_ready(deq_io_deq_ready),
    .io_deq_valid(deq_io_deq_valid),
    .io_deq_bits_id(deq_io_deq_bits_id),
    .io_deq_bits_addr(deq_io_deq_bits_addr),
    .io_deq_bits_len(deq_io_deq_bits_len),
    .io_deq_bits_size(deq_io_deq_bits_size),
    .io_deq_bits_burst(deq_io_deq_bits_burst),
    .io_deq_bits_cache(deq_io_deq_bits_cache),
    .io_deq_bits_prot(deq_io_deq_bits_prot),
    .io_deq_bits_echo_extra_id(deq_io_deq_bits_echo_extra_id)
  );
  Queue_Fragmenter_17 deq_1 ( // @[Decoupled.scala 361:21]
    .clock(deq_1_clock),
    .reset(deq_1_reset),
    .io_enq_ready(deq_1_io_enq_ready),
    .io_enq_valid(deq_1_io_enq_valid),
    .io_enq_bits_id(deq_1_io_enq_bits_id),
    .io_enq_bits_addr(deq_1_io_enq_bits_addr),
    .io_enq_bits_len(deq_1_io_enq_bits_len),
    .io_enq_bits_size(deq_1_io_enq_bits_size),
    .io_enq_bits_burst(deq_1_io_enq_bits_burst),
    .io_enq_bits_cache(deq_1_io_enq_bits_cache),
    .io_enq_bits_prot(deq_1_io_enq_bits_prot),
    .io_enq_bits_echo_extra_id(deq_1_io_enq_bits_echo_extra_id),
    .io_deq_ready(deq_1_io_deq_ready),
    .io_deq_valid(deq_1_io_deq_valid),
    .io_deq_bits_id(deq_1_io_deq_bits_id),
    .io_deq_bits_addr(deq_1_io_deq_bits_addr),
    .io_deq_bits_len(deq_1_io_deq_bits_len),
    .io_deq_bits_size(deq_1_io_deq_bits_size),
    .io_deq_bits_burst(deq_1_io_deq_bits_burst),
    .io_deq_bits_cache(deq_1_io_deq_bits_cache),
    .io_deq_bits_prot(deq_1_io_deq_bits_prot),
    .io_deq_bits_echo_extra_id(deq_1_io_deq_bits_echo_extra_id)
  );
  Queue_Fragmenter_19 in_w_deq ( // @[Decoupled.scala 361:21]
    .clock(in_w_deq_clock),
    .reset(in_w_deq_reset),
    .io_enq_ready(in_w_deq_io_enq_ready),
    .io_enq_valid(in_w_deq_io_enq_valid),
    .io_enq_bits_data(in_w_deq_io_enq_bits_data),
    .io_enq_bits_strb(in_w_deq_io_enq_bits_strb),
    .io_enq_bits_last(in_w_deq_io_enq_bits_last),
    .io_deq_ready(in_w_deq_io_deq_ready),
    .io_deq_valid(in_w_deq_io_deq_valid),
    .io_deq_bits_data(in_w_deq_io_deq_bits_data),
    .io_deq_bits_strb(in_w_deq_io_deq_bits_strb),
    .io_deq_bits_last(in_w_deq_io_deq_bits_last)
  );
  assign auto_in_aw_ready = deq_1_io_enq_ready; // @[Nodes.scala 1210:84 Decoupled.scala 365:17]
  assign auto_in_w_ready = in_w_deq_io_enq_ready; // @[Nodes.scala 1210:84 Decoupled.scala 365:17]
  assign auto_in_b_valid = auto_out_b_valid & auto_out_b_bits_echo_real_last; // @[Fragmenter.scala 191:33]
  assign auto_in_b_bits_id = auto_out_b_bits_id; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_b_bits_resp = auto_out_b_bits_resp | _GEN_13; // @[Fragmenter.scala 19AXI4_ID_WIDTH-2:41]
  assign auto_in_b_bits_echo_extra_id = auto_out_b_bits_echo_extra_id; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_ar_ready = deq_io_enq_ready; // @[Nodes.scala 1210:84 Decoupled.scala 365:17]
  assign auto_in_r_valid = auto_out_r_valid; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_r_bits_id = auto_out_r_bits_id; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_r_bits_data = auto_out_r_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_r_bits_resp = auto_out_r_bits_resp; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_r_bits_echo_extra_id = auto_out_r_bits_echo_extra_id; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign auto_in_r_bits_last = auto_out_r_bits_last & auto_out_r_bits_echo_real_last; // @[Fragmenter.scala 18AXI4_ID_WIDTH-2:41]
  assign auto_out_aw_valid = irr_1_valid & _in_aw_ready_T; // @[Fragmenter.scala 160:35]
  assign auto_out_aw_bits_id = deq_1_io_deq_bits_id; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_aw_bits_addr = ~_out_bits_addr_T_12; // @[Fragmenter.scala 125:26]
  assign auto_out_aw_bits_len = bad_1 ? 8'h0 : maxSupported1_1; // @[Fragmenter.scala 100:25]
  assign auto_out_aw_bits_size = deq_1_io_deq_bits_size; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_aw_bits_cache = deq_1_io_deq_bits_cache; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_aw_bits_prot = deq_1_io_deq_bits_prot; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_aw_bits_echo_extra_id = deq_1_io_deq_bits_echo_extra_id; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_aw_bits_echo_real_last = beats1_1 == len_1; // @[Fragmenter.scala 113:27]
  assign auto_out_w_valid = in_w_valid & (~w_idle | wbeats_valid); // @[Fragmenter.scala 17AXI4_ID_WIDTH-2:33]
  assign auto_out_w_bits_data = in_w_deq_io_deq_bits_data; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_w_bits_strb = in_w_deq_io_deq_bits_strb; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_w_bits_last = w_todo == 9'h1; // @[Fragmenter.scala 170:27]
  assign auto_out_b_ready = auto_in_b_ready | ~auto_out_b_bits_echo_real_last; // @[Fragmenter.scala 192:33]
  assign auto_out_ar_valid = deq_io_deq_valid; // @[Decoupled.scala 401:19 403:15]
  assign auto_out_ar_bits_id = deq_io_deq_bits_id; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_ar_bits_addr = ~_out_bits_addr_T_5; // @[Fragmenter.scala 125:26]
  assign auto_out_ar_bits_len = bad ? 8'h0 : maxSupported1; // @[Fragmenter.scala 100:25]
  assign auto_out_ar_bits_size = deq_io_deq_bits_size; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_ar_bits_cache = deq_io_deq_bits_cache; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_ar_bits_prot = deq_io_deq_bits_prot; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_ar_bits_echo_extra_id = deq_io_deq_bits_echo_extra_id; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_ar_bits_echo_real_last = beats1 == len; // @[Fragmenter.scala 113:27]
  assign auto_out_r_ready = auto_in_r_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign deq_clock = clock;
  assign deq_reset = reset;
  assign deq_io_enq_valid = auto_in_ar_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign deq_io_enq_bits_id = auto_in_ar_bits_id; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign deq_io_enq_bits_addr = auto_in_ar_bits_addr; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign deq_io_enq_bits_len = auto_in_ar_bits_len; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign deq_io_enq_bits_size = auto_in_ar_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign deq_io_enq_bits_burst = auto_in_ar_bits_burst; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign deq_io_enq_bits_cache = auto_in_ar_bits_cache; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign deq_io_enq_bits_prot = auto_in_ar_bits_prot; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign deq_io_enq_bits_echo_extra_id = auto_in_ar_bits_echo_extra_id; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign deq_io_deq_ready = auto_out_ar_ready & ar_last; // @[Fragmenter.scala 114:30]
  assign deq_1_clock = clock;
  assign deq_1_reset = reset;
  assign deq_1_io_enq_valid = auto_in_aw_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign deq_1_io_enq_bits_id = auto_in_aw_bits_id; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign deq_1_io_enq_bits_addr = auto_in_aw_bits_addr; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign deq_1_io_enq_bits_len = auto_in_aw_bits_len; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign deq_1_io_enq_bits_size = auto_in_aw_bits_size; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign deq_1_io_enq_bits_burst = auto_in_aw_bits_burst; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign deq_1_io_enq_bits_cache = auto_in_aw_bits_cache; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign deq_1_io_enq_bits_prot = auto_in_aw_bits_prot; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign deq_1_io_enq_bits_echo_extra_id = auto_in_aw_bits_echo_extra_id; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign deq_1_io_deq_ready = in_aw_ready & aw_last; // @[Fragmenter.scala 114:30]
  assign in_w_deq_clock = clock;
  assign in_w_deq_reset = reset;
  assign in_w_deq_io_enq_valid = auto_in_w_valid; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign in_w_deq_io_enq_bits_data = auto_in_w_bits_data; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign in_w_deq_io_enq_bits_strb = auto_in_w_bits_strb; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign in_w_deq_io_enq_bits_last = auto_in_w_bits_last; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign in_w_deq_io_deq_ready = auto_out_w_ready & _bundleOut_0_w_valid_T_1; // @[Fragmenter.scala 177:33]
  always @(posedge clock) begin
    if (reset) begin // @[Fragmenter.scala 63:29]
      busy <= 1'h0; // @[Fragmenter.scala 63:29]
    end else if (_T_2) begin // @[Fragmenter.scala 127:27]
      busy <= ~ar_last; // @[Fragmenter.scala 128:16]
    end
    if (_T_2) begin // @[Fragmenter.scala 127:27]
      if (fixed) begin // @[Fragmenter.scala 109:60]
        r_addr <= irr_bits_addr; // @[Fragmenter.scala 110:20]
      end else if (irr_bits_burst == 2'h2) begin // @[Fragmenter.scala 10AXI4_ID_WIDTH-2:59]
        r_addr <= _mux_addr_T_4; // @[Fragmenter.scala 107:20]
      end else begin
        r_addr <= inc_addr;
      end
    end
    r_len <= _GEN_4[7:0];
    if (reset) begin // @[Fragmenter.scala 63:29]
      busy_1 <= 1'h0; // @[Fragmenter.scala 63:29]
    end else if (_T_5) begin // @[Fragmenter.scala 127:27]
      busy_1 <= ~aw_last; // @[Fragmenter.scala 128:16]
    end
    if (_T_5) begin // @[Fragmenter.scala 127:27]
      if (fixed_1) begin // @[Fragmenter.scala 109:60]
        r_addr_1 <= irr_1_bits_addr; // @[Fragmenter.scala 110:20]
      end else if (irr_1_bits_burst == 2'h2) begin // @[Fragmenter.scala 10AXI4_ID_WIDTH-2:59]
        r_addr_1 <= _mux_addr_T_9; // @[Fragmenter.scala 107:20]
      end else begin
        r_addr_1 <= inc_addr_1;
      end
    end
    r_len_1 <= _GEN_9[7:0];
    if (reset) begin // @[Fragmenter.scala 167:30]
      w_counter <= 9'h0; // @[Fragmenter.scala 167:30]
    end else begin
      w_counter <= _w_counter_T_2; // @[Fragmenter.scala 171:17]
    end
    if (reset) begin // @[Fragmenter.scala 153:35]
      wbeats_latched <= 1'h0; // @[Fragmenter.scala 153:35]
    end else if (_T_7) begin // @[Fragmenter.scala 157:28]
      wbeats_latched <= 1'h0; // @[Fragmenter.scala 157:45]
    end else begin
      wbeats_latched <= _GEN_10;
    end
    if (reset) begin // @[Fragmenter.scala 195:26]
      error_0 <= 2'h0; // @[Fragmenter.scala 195:26]
    end else if (_T_22[0] & _T_26) begin // @[Fragmenter.scala 198:36]
      if (auto_out_b_bits_echo_real_last) begin // @[Fragmenter.scala 198:48]
        error_0 <= 2'h0;
      end else begin
        error_0 <= _error_0_T;
      end
    end
    if (reset) begin // @[Fragmenter.scala 195:26]
      error_1 <= 2'h0; // @[Fragmenter.scala 195:26]
    end else if (_T_22[1] & _T_26) begin // @[Fragmenter.scala 198:36]
      if (auto_out_b_bits_echo_real_last) begin // @[Fragmenter.scala 198:48]
        error_1 <= 2'h0;
      end else begin
        error_1 <= _error_1_T;
      end
    end
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~_w_counter_T | w_todo != 9'h0) & ~reset) begin
          $fatal; // @[Fragmenter.scala 172:14]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~_w_counter_T | w_todo != 9'h0)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Fragmenter.scala:172 assert (!out.w.fire() || w_todo =/= UInt(0)) // underflow impossible\n"
            ); // @[Fragmenter.scala 172:14]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~bundleOut_0_w_valid | ~in_w_bits_last | w_last) & _T_13) begin
          $fatal; // @[Fragmenter.scala 181:14]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_13 & ~(~bundleOut_0_w_valid | ~in_w_bits_last | w_last)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Fragmenter.scala:181 assert (!out.w.valid || !in_w.bits.last || w_last)\n"); // @[Fragmenter.scala 181:14]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  busy = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  r_addr = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  r_len = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  busy_1 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  r_addr_1 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  r_len_1 = _RAND_5[7:0];
  _RAND_6 = {1{`RANDOM}};
  w_counter = _RAND_6[8:0];
  _RAND_7 = {1{`RANDOM}};
  wbeats_latched = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  error_0 = _RAND_8[1:0];
  _RAND_9 = {1{`RANDOM}};
  error_1 = _RAND_9[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
