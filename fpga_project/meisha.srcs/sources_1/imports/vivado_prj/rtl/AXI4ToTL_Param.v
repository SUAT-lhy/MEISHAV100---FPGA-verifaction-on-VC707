module AXI4ToTL_Param #(
		// {{{
		 parameter AXI_ID_WIDTH 	= 	1,
		 //parameter MAX_AXI_ID_CNT 	= 	32'h1 << AXI_ID_WIDTH
		 parameter MAX_AXI_ID_CNT 	= 	2
	) (
  input         clock,
  input         reset,
  output        auto_in_aw_ready,
  input         auto_in_aw_valid,
  input  [AXI_ID_WIDTH-1:0] auto_in_aw_bits_id,
  input  [31:0] auto_in_aw_bits_addr,
  input  [7:0]  auto_in_aw_bits_len,
  input  [2:0]  auto_in_aw_bits_size,
  input  [3:0]  auto_in_aw_bits_cache,
  input  [2:0]  auto_in_aw_bits_prot,
  output        auto_in_w_ready,
  input         auto_in_w_valid,
  input  [63:0] auto_in_w_bits_data,
  input  [7:0]  auto_in_w_bits_strb,
  input         auto_in_w_bits_last,
  input         auto_in_b_ready,
  output        auto_in_b_valid,
  output [AXI_ID_WIDTH-1:0]  auto_in_b_bits_id,
  output [1:0]  auto_in_b_bits_resp,
  output        auto_in_ar_ready,
  input         auto_in_ar_valid,
  input  [AXI_ID_WIDTH-1:0] auto_in_ar_bits_id,
  input  [31:0] auto_in_ar_bits_addr,
  input  [7:0]  auto_in_ar_bits_len,
  input  [2:0]  auto_in_ar_bits_size,
  input  [3:0]  auto_in_ar_bits_cache,
  input  [2:0]  auto_in_ar_bits_prot,
  input         auto_in_r_ready,
  output        auto_in_r_valid,
  output [AXI_ID_WIDTH-1:0] auto_in_r_bits_id,
  output [63:0] auto_in_r_bits_data,
  output [1:0]  auto_in_r_bits_resp,
  output        auto_in_r_bits_last,
  input         auto_out_a_ready,
  output        auto_out_a_valid,
  output [2:0]  auto_out_a_bits_opcode,
  output [3:0]  auto_out_a_bits_size,
  output [AXI_ID_WIDTH + 2:0]  auto_out_a_bits_source,
  output [31:0] auto_out_a_bits_address,
  output        auto_out_a_bits_user_amba_prot_bufferable,
  output        auto_out_a_bits_user_amba_prot_modifiable,
  output        auto_out_a_bits_user_amba_prot_readalloc,
  output        auto_out_a_bits_user_amba_prot_writealloc,
  output        auto_out_a_bits_user_amba_prot_privileged,
  output        auto_out_a_bits_user_amba_prot_secure,
  output        auto_out_a_bits_user_amba_prot_fetch,
  output [7:0]  auto_out_a_bits_mask,
  output [63:0] auto_out_a_bits_data,
  output        auto_out_d_ready,
  input         auto_out_d_valid,
  input  [2:0]  auto_out_d_bits_opcode,
  input  [3:0]  auto_out_d_bits_size,
  input  [AXI_ID_WIDTH + 2:0]  auto_out_d_bits_source,
  input         auto_out_d_bits_denied,
  input  [63:0] auto_out_d_bits_data,
  input         auto_out_d_bits_corrupt
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
  reg [31:0] _RAND_10;
`endif // RANDOMIZE_REG_INIT
  wire  deq_clock; // @[Decoupled.scala 361:21]
  wire  deq_reset; // @[Decoupled.scala 361:21]
  wire  deq_io_enq_ready; // @[Decoupled.scala 361:21]
  wire  deq_io_enq_valid; // @[Decoupled.scala 361:21]
  wire  deq_io_enq_bits_id; // @[Decoupled.scala 361:21]
  wire [63:0] deq_io_enq_bits_data; // @[Decoupled.scala 361:21]
  wire [1:0] deq_io_enq_bits_resp; // @[Decoupled.scala 361:21]
  wire  deq_io_enq_bits_last; // @[Decoupled.scala 361:21]
  wire  deq_io_deq_ready; // @[Decoupled.scala 361:21]
  wire  deq_io_deq_valid; // @[Decoupled.scala 361:21]
  wire  deq_io_deq_bits_id; // @[Decoupled.scala 361:21]
  wire [63:0] deq_io_deq_bits_data; // @[Decoupled.scala 361:21]
  wire [1:0] deq_io_deq_bits_resp; // @[Decoupled.scala 361:21]
  wire  deq_io_deq_bits_last; // @[Decoupled.scala 361:21]
  wire  q_b_deq_clock; // @[Decoupled.scala 361:21]
  wire  q_b_deq_reset; // @[Decoupled.scala 361:21]
  wire  q_b_deq_io_enq_ready; // @[Decoupled.scala 361:21]
  wire  q_b_deq_io_enq_valid; // @[Decoupled.scala 361:21]
  wire  q_b_deq_io_enq_bits_id; // @[Decoupled.scala 361:21]
  wire [1:0] q_b_deq_io_enq_bits_resp; // @[Decoupled.scala 361:21]
  wire  q_b_deq_io_deq_ready; // @[Decoupled.scala 361:21]
  wire  q_b_deq_io_deq_valid; // @[Decoupled.scala 361:21]
  wire  q_b_deq_io_deq_bits_id; // @[Decoupled.scala 361:21]
  wire [1:0] q_b_deq_io_deq_bits_resp; // @[Decoupled.scala 361:21]
  wire [15:0] _r_size1_T = {auto_in_ar_bits_len,8'hff}; // @[Cat.scala 31:58]
  wire [22:0] _GEN_0 = {{7'd0}, _r_size1_T}; // @[Bundles.scala 34:21]
  wire [22:0] _r_size1_T_1 = _GEN_0 << auto_in_ar_bits_size; // @[Bundles.scala 34:21]
  wire [14:0] r_size1 = _r_size1_T_1[22:8]; // @[Bundles.scala 34:30]
  wire [15:0] _r_size_T = {r_size1, 1'h0}; // @[package.scala 232:35]
  wire [15:0] _r_size_T_1 = _r_size_T | 16'h1; // @[package.scala 232:40]
  wire [15:0] _r_size_T_2 = {1'h0,r_size1}; // @[Cat.scala 31:58]
  wire [15:0] _r_size_T_3 = ~_r_size_T_2; // @[package.scala 232:53]
  wire [15:0] _r_size_T_4 = _r_size_T_1 & _r_size_T_3; // @[package.scala 232:51]
  wire [7:0] r_size_hi = _r_size_T_4[15:8]; // @[OneHot.scala 30:18]
  wire [7:0] r_size_lo = _r_size_T_4[7:0]; // @[OneHot.scala 31:18]
  wire  _r_size_T_5 = |r_size_hi; // @[OneHot.scala 32:14]
  wire [7:0] _r_size_T_6 = r_size_hi | r_size_lo; // @[OneHot.scala 32:28]
  wire [3:0] r_size_hi_1 = _r_size_T_6[7:4]; // @[OneHot.scala 30:18]
  wire [3:0] r_size_lo_1 = _r_size_T_6[3:0]; // @[OneHot.scala 31:18]
  wire  _r_size_T_7 = |r_size_hi_1; // @[OneHot.scala 32:14]
  wire [3:0] _r_size_T_8 = r_size_hi_1 | r_size_lo_1; // @[OneHot.scala 32:28]
  wire [1:0] r_size_hi_2 = _r_size_T_8[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] r_size_lo_2 = _r_size_T_8[1:0]; // @[OneHot.scala 31:18]
  wire  _r_size_T_9 = |r_size_hi_2; // @[OneHot.scala 32:14]
  wire [1:0] _r_size_T_10 = r_size_hi_2 | r_size_lo_2; // @[OneHot.scala 32:28]
  wire [3:0] r_size = {_r_size_T_5,_r_size_T_7,_r_size_T_9,_r_size_T_10[1]}; // @[Cat.scala 31:58]
  wire  _r_ok_T_1 = r_size <= 4'hc; // @[Parameters.scala 92:42]
  wire [31:0] _r_ok_T_4 = auto_in_ar_bits_addr ^ 32'h3000; // @[Parameters.scala 137:31]
  wire [32:0] _r_ok_T_5 = {1'b0,$signed(_r_ok_T_4)}; // @[Parameters.scala 137:49]
  wire [32:0] _r_ok_T_7 = $signed(_r_ok_T_5) & -33'sh1000; // @[Parameters.scala 137:52]
  wire  _r_ok_T_8 = $signed(_r_ok_T_7) == 33'sh0; // @[Parameters.scala 137:67]
  wire  _r_ok_T_9 = _r_ok_T_1 & _r_ok_T_8; // @[Parameters.scala 670:56]
  wire  _r_ok_T_11 = r_size <= 4'h6; // @[Parameters.scala 92:42]
  wire [32:0] _r_ok_T_15 = {1'b0,$signed(auto_in_ar_bits_addr)}; // @[Parameters.scala 137:49]
  wire [32:0] _r_ok_T_17 = $signed(_r_ok_T_15) & -33'sh1000; // @[Parameters.scala 137:52]
  wire  _r_ok_T_18 = $signed(_r_ok_T_17) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _r_ok_T_19 = auto_in_ar_bits_addr ^ 32'h10000; // @[Parameters.scala 137:31]
  wire [32:0] _r_ok_T_20 = {1'b0,$signed(_r_ok_T_19)}; // @[Parameters.scala 137:49]
  wire [32:0] _r_ok_T_22 = $signed(_r_ok_T_20) & -33'sh10000; // @[Parameters.scala 137:52]
  wire  _r_ok_T_23 = $signed(_r_ok_T_22) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _r_ok_T_24 = auto_in_ar_bits_addr ^ 32'h2000000; // @[Parameters.scala 137:31]
  wire [32:0] _r_ok_T_25 = {1'b0,$signed(_r_ok_T_24)}; // @[Parameters.scala 137:49]
  wire [32:0] _r_ok_T_27 = $signed(_r_ok_T_25) & -33'sh10000; // @[Parameters.scala 137:52]
  wire  _r_ok_T_28 = $signed(_r_ok_T_27) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _r_ok_T_29 = auto_in_ar_bits_addr ^ 32'hc000000; // @[Parameters.scala 137:31]
  wire [32:0] _r_ok_T_30 = {1'b0,$signed(_r_ok_T_29)}; // @[Parameters.scala 137:49]
  wire [32:0] _r_ok_T_32 = $signed(_r_ok_T_30) & -33'sh4000000; // @[Parameters.scala 137:52]
  wire  _r_ok_T_33 = $signed(_r_ok_T_32) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _r_ok_T_34 = auto_in_ar_bits_addr ^ 32'h60000000; // @[Parameters.scala 137:31]
  wire [32:0] _r_ok_T_35 = {1'b0,$signed(_r_ok_T_34)}; // @[Parameters.scala 137:49]
  wire [32:0] _r_ok_T_37 = $signed(_r_ok_T_35) & -33'sh20000000; // @[Parameters.scala 137:52]
  wire  _r_ok_T_38 = $signed(_r_ok_T_37) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _r_ok_T_39 = auto_in_ar_bits_addr ^ 32'h80000000; // @[Parameters.scala 137:31]
  wire [32:0] _r_ok_T_40 = {1'b0,$signed(_r_ok_T_39)}; // @[Parameters.scala 137:49]
  wire [32:0] _r_ok_T_42 = $signed(_r_ok_T_40) & -33'sh4000; // @[Parameters.scala 137:52]
  wire  _r_ok_T_43 = $signed(_r_ok_T_42) == 33'sh0; // @[Parameters.scala 137:67]
  wire  _r_ok_T_48 = _r_ok_T_18 | _r_ok_T_23 | _r_ok_T_28 | _r_ok_T_33 | _r_ok_T_38 | _r_ok_T_43; // @[Parameters.scala 671:42]
  wire  _r_ok_T_49 = _r_ok_T_11 & _r_ok_T_48; // @[Parameters.scala 670:56]
  wire  r_ok = _r_ok_T_9 | _r_ok_T_49; // @[Parameters.scala 672:30]
  wire [13:0] _GEN_16 = {{11'd0}, auto_in_ar_bits_addr[2:0]}; // @[ToTL.scala 99:59]
  wire [13:0] _r_addr_T_1 = 14'h3000 | _GEN_16; // @[ToTL.scala 99:59]
  wire [31:0] r_addr = r_ok ? auto_in_ar_bits_addr : {{18'd0}, _r_addr_T_1}; // @[ToTL.scala 99:23]
  reg [2:0] r_count_0; // @[ToTL.scala 100:28]
  reg [2:0] r_count_1; // @[ToTL.scala 100:28]
  wire [2:0] _GEN_1 = auto_in_ar_bits_id ? r_count_1 : r_count_0; // @[ToTL.scala 104:{50,50}]
  wire [AXI_ID_WIDTH + 2:0] r_id = {auto_in_ar_bits_id[AXI_ID_WIDTH-1:0],_GEN_1[1:0],1'h0}; // @[Cat.scala 31:58]
  wire [29:0] _T_2 = 30'h7fff << r_size; // @[package.scala 234:77]
  wire [14:0] _T_4 = ~_T_2[14:0]; // @[package.scala 234:46]
  wire  _T_8 = ~reset; // @[ToTL.scala 107:14]
  wire [1:0] a_mask_sizeOH_shiftAmount = r_size[1:0]; // @[OneHot.scala 63:49]
  wire [3:0] _a_mask_sizeOH_T_1 = 4'h1 << a_mask_sizeOH_shiftAmount; // @[OneHot.scala 64:12]
  wire [2:0] a_mask_sizeOH = _a_mask_sizeOH_T_1[2:0] | 3'h1; // @[Misc.scala 201:81]
  wire  _a_mask_T = r_size >= 4'h3; // @[Misc.scala 205:21]
  wire  a_mask_size = a_mask_sizeOH[2]; // @[Misc.scala 208:26]
  wire  a_mask_bit = r_addr[2]; // @[Misc.scala 209:26]
  wire  a_mask_nbit = ~a_mask_bit; // @[Misc.scala 210:20]
  wire  a_mask_acc = _a_mask_T | a_mask_size & a_mask_nbit; // @[Misc.scala 214:29]
  wire  a_mask_acc_1 = _a_mask_T | a_mask_size & a_mask_bit; // @[Misc.scala 214:29]
  wire  a_mask_size_1 = a_mask_sizeOH[1]; // @[Misc.scala 208:26]
  wire  a_mask_bit_1 = r_addr[1]; // @[Misc.scala 209:26]
  wire  a_mask_nbit_1 = ~a_mask_bit_1; // @[Misc.scala 210:20]
  wire  a_mask_eq_2 = a_mask_nbit & a_mask_nbit_1; // @[Misc.scala 213:27]
  wire  a_mask_acc_2 = a_mask_acc | a_mask_size_1 & a_mask_eq_2; // @[Misc.scala 214:29]
  wire  a_mask_eq_3 = a_mask_nbit & a_mask_bit_1; // @[Misc.scala 213:27]
  wire  a_mask_acc_3 = a_mask_acc | a_mask_size_1 & a_mask_eq_3; // @[Misc.scala 214:29]
  wire  a_mask_eq_4 = a_mask_bit & a_mask_nbit_1; // @[Misc.scala 213:27]
  wire  a_mask_acc_4 = a_mask_acc_1 | a_mask_size_1 & a_mask_eq_4; // @[Misc.scala 214:29]
  wire  a_mask_eq_5 = a_mask_bit & a_mask_bit_1; // @[Misc.scala 213:27]
  wire  a_mask_acc_5 = a_mask_acc_1 | a_mask_size_1 & a_mask_eq_5; // @[Misc.scala 214:29]
  wire  a_mask_size_2 = a_mask_sizeOH[0]; // @[Misc.scala 208:26]
  wire  a_mask_bit_2 = r_addr[0]; // @[Misc.scala 209:26]
  wire  a_mask_nbit_2 = ~a_mask_bit_2; // @[Misc.scala 210:20]
  wire  a_mask_eq_6 = a_mask_eq_2 & a_mask_nbit_2; // @[Misc.scala 213:27]
  wire  a_mask_acc_6 = a_mask_acc_2 | a_mask_size_2 & a_mask_eq_6; // @[Misc.scala 214:29]
  wire  a_mask_eq_7 = a_mask_eq_2 & a_mask_bit_2; // @[Misc.scala 213:27]
  wire  a_mask_acc_7 = a_mask_acc_2 | a_mask_size_2 & a_mask_eq_7; // @[Misc.scala 214:29]
  wire  a_mask_eq_8 = a_mask_eq_3 & a_mask_nbit_2; // @[Misc.scala 213:27]
  wire  a_mask_acc_8 = a_mask_acc_3 | a_mask_size_2 & a_mask_eq_8; // @[Misc.scala 214:29]
  wire  a_mask_eq_9 = a_mask_eq_3 & a_mask_bit_2; // @[Misc.scala 213:27]
  wire  a_mask_acc_9 = a_mask_acc_3 | a_mask_size_2 & a_mask_eq_9; // @[Misc.scala 214:29]
  wire  a_mask_eq_10 = a_mask_eq_4 & a_mask_nbit_2; // @[Misc.scala 213:27]
  wire  a_mask_acc_10 = a_mask_acc_4 | a_mask_size_2 & a_mask_eq_10; // @[Misc.scala 214:29]
  wire  a_mask_eq_11 = a_mask_eq_4 & a_mask_bit_2; // @[Misc.scala 213:27]
  wire  a_mask_acc_11 = a_mask_acc_4 | a_mask_size_2 & a_mask_eq_11; // @[Misc.scala 214:29]
  wire  a_mask_eq_12 = a_mask_eq_5 & a_mask_nbit_2; // @[Misc.scala 213:27]
  wire  a_mask_acc_12 = a_mask_acc_5 | a_mask_size_2 & a_mask_eq_12; // @[Misc.scala 214:29]
  wire  a_mask_eq_13 = a_mask_eq_5 & a_mask_bit_2; // @[Misc.scala 213:27]
  wire  a_mask_acc_13 = a_mask_acc_5 | a_mask_size_2 & a_mask_eq_13; // @[Misc.scala 214:29]
  wire [7:0] a_mask = {a_mask_acc_13,a_mask_acc_12,a_mask_acc_11,a_mask_acc_10,a_mask_acc_9,a_mask_acc_8,a_mask_acc_7,
    a_mask_acc_6}; // @[Cat.scala 31:58]
  wire  r_out_bits_user_amba_prot_privileged = auto_in_ar_bits_prot[0]; // @[ToTL.scala 114:45]
  wire  r_out_bits_user_amba_prot_secure = ~auto_in_ar_bits_prot[1]; // @[ToTL.scala 115:29]
  wire  r_out_bits_user_amba_prot_fetch = auto_in_ar_bits_prot[2]; // @[ToTL.scala 116:45]
  wire  r_out_bits_user_amba_prot_bufferable = auto_in_ar_bits_cache[0]; // @[ToTL.scala 117:46]
  wire  r_out_bits_user_amba_prot_modifiable = auto_in_ar_bits_cache[1]; // @[ToTL.scala 118:46]
  wire  r_out_bits_user_amba_prot_readalloc = auto_in_ar_bits_cache[2]; // @[ToTL.scala 119:46]
  wire  r_out_bits_user_amba_prot_writealloc = auto_in_ar_bits_cache[3]; // @[ToTL.scala 120:46]
  wire [1:0] r_sel = 2'h1 << auto_in_ar_bits_id; // @[OneHot.scala 64:12]
  reg [7:0] beatsLeft; // @[Arbiter.scala 87:30]
  wire  idle = beatsLeft == 8'h0; // @[Arbiter.scala 88:28]
  wire  w_out_valid = auto_in_aw_valid & auto_in_w_valid; // @[ToTL.scala 144:34]
  wire [1:0] readys_valid = {w_out_valid,auto_in_ar_valid}; // @[Cat.scala 31:58]
  reg [1:0] readys_mask; // @[Arbiter.scala 23:23]
  wire [1:0] _readys_filter_T = ~readys_mask; // @[Arbiter.scala 24:30]
  wire [1:0] _readys_filter_T_1 = readys_valid & _readys_filter_T; // @[Arbiter.scala 24:28]
  wire [3:0] readys_filter = {_readys_filter_T_1,w_out_valid,auto_in_ar_valid}; // @[Cat.scala 31:58]
  wire [3:0] _GEN_17 = {{1'd0}, readys_filter[3:1]}; // @[package.scala 253:43]
  wire [3:0] _readys_unready_T_1 = readys_filter | _GEN_17; // @[package.scala 253:43]
  wire [3:0] _readys_unready_T_4 = {readys_mask, 2'h0}; // @[Arbiter.scala 25:66]
  wire [3:0] _GEN_18 = {{1'd0}, _readys_unready_T_1[3:1]}; // @[Arbiter.scala 25:58]
  wire [3:0] readys_unready = _GEN_18 | _readys_unready_T_4; // @[Arbiter.scala 25:58]
  wire [1:0] _readys_readys_T_2 = readys_unready[3:2] & readys_unready[1:0]; // @[Arbiter.scala 26:39]
  wire [1:0] readys_readys = ~_readys_readys_T_2; // @[Arbiter.scala 26:18]
  wire  readys_0 = readys_readys[0]; // @[Arbiter.scala 95:86]
  reg  state_0; // @[Arbiter.scala 116:26]
  wire  allowed_0 = idle ? readys_0 : state_0; // @[Arbiter.scala 121:24]
  wire  out_ready = auto_out_a_ready & allowed_0; // @[Arbiter.scala 123:31]
  wire  _T_12 = out_ready & auto_in_ar_valid; // @[Decoupled.scala 50:35]
  wire [2:0] _r_count_0_T_1 = r_count_0 + 3'h1; // @[ToTL.scala 125:43]
  wire [2:0] _r_count_1_T_1 = r_count_1 + 3'h1; // @[ToTL.scala 125:43]
  wire [15:0] _w_size1_T = {auto_in_aw_bits_len,8'hff}; // @[Cat.scala 31:58]
  wire [22:0] _GEN_4 = {{7'd0}, _w_size1_T}; // @[Bundles.scala 34:21]
  wire [22:0] _w_size1_T_1 = _GEN_4 << auto_in_aw_bits_size; // @[Bundles.scala 34:21]
  wire [14:0] w_size1 = _w_size1_T_1[22:8]; // @[Bundles.scala 34:30]
  wire [15:0] _w_size_T = {w_size1, 1'h0}; // @[package.scala 232:35]
  wire [15:0] _w_size_T_1 = _w_size_T | 16'h1; // @[package.scala 232:40]
  wire [15:0] _w_size_T_2 = {1'h0,w_size1}; // @[Cat.scala 31:58]
  wire [15:0] _w_size_T_3 = ~_w_size_T_2; // @[package.scala 232:53]
  wire [15:0] _w_size_T_4 = _w_size_T_1 & _w_size_T_3; // @[package.scala 232:51]
  wire [7:0] w_size_hi = _w_size_T_4[15:8]; // @[OneHot.scala 30:18]
  wire [7:0] w_size_lo = _w_size_T_4[7:0]; // @[OneHot.scala 31:18]
  wire  _w_size_T_5 = |w_size_hi; // @[OneHot.scala 32:14]
  wire [7:0] _w_size_T_6 = w_size_hi | w_size_lo; // @[OneHot.scala 32:28]
  wire [3:0] w_size_hi_1 = _w_size_T_6[7:4]; // @[OneHot.scala 30:18]
  wire [3:0] w_size_lo_1 = _w_size_T_6[3:0]; // @[OneHot.scala 31:18]
  wire  _w_size_T_7 = |w_size_hi_1; // @[OneHot.scala 32:14]
  wire [3:0] _w_size_T_8 = w_size_hi_1 | w_size_lo_1; // @[OneHot.scala 32:28]
  wire [1:0] w_size_hi_2 = _w_size_T_8[3:2]; // @[OneHot.scala 30:18]
  wire [1:0] w_size_lo_2 = _w_size_T_8[1:0]; // @[OneHot.scala 31:18]
  wire  _w_size_T_9 = |w_size_hi_2; // @[OneHot.scala 32:14]
  wire [1:0] _w_size_T_10 = w_size_hi_2 | w_size_lo_2; // @[OneHot.scala 32:28]
  wire [3:0] w_size = {_w_size_T_5,_w_size_T_7,_w_size_T_9,_w_size_T_10[1]}; // @[Cat.scala 31:58]
  wire  _w_ok_T_1 = w_size <= 4'hc; // @[Parameters.scala 92:42]
  wire [31:0] _w_ok_T_4 = auto_in_aw_bits_addr ^ 32'h3000; // @[Parameters.scala 137:31]
  wire [32:0] _w_ok_T_5 = {1'b0,$signed(_w_ok_T_4)}; // @[Parameters.scala 137:49]
  wire [32:0] _w_ok_T_7 = $signed(_w_ok_T_5) & -33'sh1000; // @[Parameters.scala 137:52]
  wire  _w_ok_T_8 = $signed(_w_ok_T_7) == 33'sh0; // @[Parameters.scala 137:67]
  wire  _w_ok_T_9 = _w_ok_T_1 & _w_ok_T_8; // @[Parameters.scala 670:56]
  wire  _w_ok_T_11 = w_size <= 4'h6; // @[Parameters.scala 92:42]
  wire [32:0] _w_ok_T_15 = {1'b0,$signed(auto_in_aw_bits_addr)}; // @[Parameters.scala 137:49]
  wire [32:0] _w_ok_T_17 = $signed(_w_ok_T_15) & -33'sh1000; // @[Parameters.scala 137:52]
  wire  _w_ok_T_18 = $signed(_w_ok_T_17) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _w_ok_T_19 = auto_in_aw_bits_addr ^ 32'h2000000; // @[Parameters.scala 137:31]
  wire [32:0] _w_ok_T_20 = {1'b0,$signed(_w_ok_T_19)}; // @[Parameters.scala 137:49]
  wire [32:0] _w_ok_T_22 = $signed(_w_ok_T_20) & -33'sh10000; // @[Parameters.scala 137:52]
  wire  _w_ok_T_23 = $signed(_w_ok_T_22) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _w_ok_T_24 = auto_in_aw_bits_addr ^ 32'hc000000; // @[Parameters.scala 137:31]
  wire [32:0] _w_ok_T_25 = {1'b0,$signed(_w_ok_T_24)}; // @[Parameters.scala 137:49]
  wire [32:0] _w_ok_T_27 = $signed(_w_ok_T_25) & -33'sh4000000; // @[Parameters.scala 137:52]
  wire  _w_ok_T_28 = $signed(_w_ok_T_27) == 33'sh0; // @[Parameters.scala 137:67]
  wire [31:0] _w_ok_T_29 = auto_in_aw_bits_addr ^ 32'h80000000; // @[Parameters.scala 137:31]
  wire [32:0] _w_ok_T_30 = {1'b0,$signed(_w_ok_T_29)}; // @[Parameters.scala 137:49]
  wire [32:0] _w_ok_T_32 = $signed(_w_ok_T_30) & -33'sh4000; // @[Parameters.scala 137:52]
  wire  _w_ok_T_33 = $signed(_w_ok_T_32) == 33'sh0; // @[Parameters.scala 137:67]
  wire  _w_ok_T_36 = _w_ok_T_18 | _w_ok_T_23 | _w_ok_T_28 | _w_ok_T_33; // @[Parameters.scala 671:42]
  wire  _w_ok_T_37 = _w_ok_T_11 & _w_ok_T_36; // @[Parameters.scala 670:56]
  wire  _w_ok_T_46 = w_size <= 4'h8; // @[Parameters.scala 92:42]
  wire [31:0] _w_ok_T_49 = auto_in_aw_bits_addr ^ 32'h60000000; // @[Parameters.scala 137:31]
  wire [32:0] _w_ok_T_50 = {1'b0,$signed(_w_ok_T_49)}; // @[Parameters.scala 137:49]
  wire [32:0] _w_ok_T_52 = $signed(_w_ok_T_50) & -33'sh20000000; // @[Parameters.scala 137:52]
  wire  _w_ok_T_53 = $signed(_w_ok_T_52) == 33'sh0; // @[Parameters.scala 137:67]
  wire  _w_ok_T_54 = _w_ok_T_46 & _w_ok_T_53; // @[Parameters.scala 670:56]
  wire  w_ok = _w_ok_T_9 | _w_ok_T_37 | _w_ok_T_54; // @[Parameters.scala 672:30]
  wire [13:0] _GEN_19 = {{11'd0}, auto_in_aw_bits_addr[2:0]}; // @[ToTL.scala 132:59]
  wire [13:0] _w_addr_T_1 = 14'h3000 | _GEN_19; // @[ToTL.scala 132:59]
  wire [31:0] w_addr = w_ok ? auto_in_aw_bits_addr : {{18'd0}, _w_addr_T_1}; // @[ToTL.scala 132:23]
  reg [2:0] w_count_0; // @[ToTL.scala 133:28]
  reg [2:0] w_count_1; // @[ToTL.scala 133:28]
  wire [2:0] _GEN_5 = auto_in_aw_bits_id[0] ? w_count_1 : w_count_0; // @[ToTL.scala 137:{50,50}]
  wire [AXI_ID_WIDTH+2:0] w_id = {auto_in_aw_bits_id[AXI_ID_WIDTH-1:0],_GEN_5[1:0],1'h1}; // @[Cat.scala 31:58]
  wire  _T_16 = ~auto_in_aw_valid; // @[ToTL.scala 140:15]
  wire [29:0] _T_18 = 30'h7fff << w_size; // @[package.scala 234:77]
  wire [14:0] _T_20 = ~_T_18[14:0]; // @[package.scala 234:46]
  wire  readys_1 = readys_readys[1]; // @[Arbiter.scala 95:86]
  reg  state_1; // @[Arbiter.scala 116:26]
  wire  allowed_1 = idle ? readys_1 : state_1; // @[Arbiter.scala 121:24]
  wire  out_1_ready = auto_out_a_ready & allowed_1; // @[Arbiter.scala 123:31]
  wire  bundleIn_0_aw_ready = out_1_ready & auto_in_w_valid & auto_in_w_bits_last; // @[ToTL.scala 142:48]
  wire  w_out_bits_user_amba_prot_privileged = auto_in_aw_bits_prot[0]; // @[ToTL.scala 150:45]
  wire  w_out_bits_user_amba_prot_secure = ~auto_in_aw_bits_prot[1]; // @[ToTL.scala 151:29]
  wire  w_out_bits_user_amba_prot_fetch = auto_in_aw_bits_prot[2]; // @[ToTL.scala 152:45]
  wire  w_out_bits_user_amba_prot_bufferable = auto_in_aw_bits_cache[0]; // @[ToTL.scala 153:46]
  wire  w_out_bits_user_amba_prot_modifiable = auto_in_aw_bits_cache[1]; // @[ToTL.scala 154:46]
  wire  w_out_bits_user_amba_prot_readalloc = auto_in_aw_bits_cache[2]; // @[ToTL.scala 155:46]
  wire  w_out_bits_user_amba_prot_writealloc = auto_in_aw_bits_cache[3]; // @[ToTL.scala 156:46]
  wire [MAX_AXI_ID_CNT:0] w_sel = MAX_AXI_ID_CNT+1'h1 << auto_in_aw_bits_id[0]; // @[OneHot.scala 64:12]
  wire  _T_36 = bundleIn_0_aw_ready & auto_in_aw_valid; // @[Decoupled.scala 50:35]
  wire [2:0] _w_count_0_T_1 = w_count_0 + 3'h1; // @[ToTL.scala 161:43]
  wire [2:0] _w_count_1_T_1 = w_count_1 + 3'h1; // @[ToTL.scala 161:43]
  wire  latch = idle & auto_out_a_ready; // @[Arbiter.scala 89:24]
  wire [1:0] _readys_mask_T = readys_readys & readys_valid; // @[Arbiter.scala 28:29]
  wire [2:0] _readys_mask_T_1 = {_readys_mask_T, 1'h0}; // @[package.scala 244:48]
  wire [1:0] _readys_mask_T_3 = _readys_mask_T | _readys_mask_T_1[1:0]; // @[package.scala 244:43]
  wire  earlyWinner_0 = readys_0 & auto_in_ar_valid; // @[Arbiter.scala 97:79]
  wire  earlyWinner_1 = readys_1 & w_out_valid; // @[Arbiter.scala 97:79]
  wire  _prefixOR_T = earlyWinner_0 | earlyWinner_1; // @[Arbiter.scala 104:53]
  wire  _T_50 = auto_in_ar_valid | w_out_valid; // @[Arbiter.scala 107:36]
  wire  _T_51 = ~(auto_in_ar_valid | w_out_valid); // @[Arbiter.scala 107:15]
  wire  muxStateEarly_0 = idle ? earlyWinner_0 : state_0; // @[Arbiter.scala 117:30]
  wire  muxStateEarly_1 = idle ? earlyWinner_1 : state_1; // @[Arbiter.scala 117:30]
  wire  _sink_ACancel_earlyValid_T_3 = state_0 & auto_in_ar_valid | state_1 & w_out_valid; // @[Mux.scala 27:73]
  wire  sink_ACancel_earlyValid = idle ? _T_50 : _sink_ACancel_earlyValid_T_3; // @[Arbiter.scala 125:29]
  wire  _beatsLeft_T_2 = auto_out_a_ready & sink_ACancel_earlyValid; // @[ReadyValidCancel.scala 49:33]
  wire [7:0] _GEN_20 = {{7'd0}, _beatsLeft_T_2}; // @[Arbiter.scala 113:52]
  wire [7:0] _beatsLeft_T_4 = beatsLeft - _GEN_20; // @[Arbiter.scala 113:52]
  wire [7:0] _T_70 = muxStateEarly_0 ? a_mask : 8'h0; // @[Mux.scala 27:73]
  wire [7:0] _T_71 = muxStateEarly_1 ? auto_in_w_bits_strb : 8'h0; // @[Mux.scala 27:73]
  wire [31:0] _T_94 = muxStateEarly_0 ? r_addr : 32'h0; // @[Mux.scala 27:73]
  wire [31:0] _T_95 = muxStateEarly_1 ? w_addr : 32'h0; // @[Mux.scala 27:73]
  wire [AXI_ID_WIDTH + 2:0] _T_97 = muxStateEarly_0 ? r_id : AXI_ID_WIDTH + 3'h0; // @[Mux.scala 27:73]
  wire [AXI_ID_WIDTH + 2:0] _T_98 = muxStateEarly_1 ? w_id : AXI_ID_WIDTH + 3'h0; // @[Mux.scala 27:73]
  wire [3:0] _T_100 = muxStateEarly_0 ? r_size : 4'h0; // @[Mux.scala 27:73]
  wire [3:0] _T_101 = muxStateEarly_1 ? w_size : 4'h0; // @[Mux.scala 27:73]
  wire [2:0] _T_106 = muxStateEarly_0 ? 3'h4 : 3'h0; // @[Mux.scala 27:73]
  wire [2:0] _T_107 = muxStateEarly_1 ? 3'h1 : 3'h0; // @[Mux.scala 27:73]
  wire  d_hasData = auto_out_d_bits_opcode[0]; // @[Edges.scala 105:36]
  wire  ok_r_ready = deq_io_enq_ready; // @[ToTL.scala 167:23 Decoupled.scala 365:17]
  wire  ok_b_ready = q_b_deq_io_enq_ready; // @[ToTL.scala 166:23 Decoupled.scala 365:17]
  wire  bundleOut_0_d_ready = d_hasData ? ok_r_ready : ok_b_ready; // @[ToTL.scala 173:25]
  wire  _d_last_T = bundleOut_0_d_ready & auto_out_d_valid; // @[Decoupled.scala 50:35]
  wire [26:0] _d_last_beats1_decode_T_1 = 27'hfff << auto_out_d_bits_size; // @[package.scala 234:77]
  wire [11:0] _d_last_beats1_decode_T_3 = ~_d_last_beats1_decode_T_1[11:0]; // @[package.scala 234:46]
  wire [8:0] d_last_beats1_decode = _d_last_beats1_decode_T_3[11:3]; // @[Edges.scala 219:59]
  wire [8:0] d_last_beats1 = d_hasData ? d_last_beats1_decode : 9'h0; // @[Edges.scala 220:14]
  reg [8:0] d_last_counter; // @[Edges.scala 228:27]
  wire [8:0] d_last_counter1 = d_last_counter - 9'h1; // @[Edges.scala 229:28]
  wire  d_last_first = d_last_counter == 9'h0; // @[Edges.scala 230:25]
  reg [2:0] b_count_0; // @[ToTL.scala 195:28]
  reg [2:0] b_count_1; // @[ToTL.scala 195:28]
  wire  q_b_bits_id = q_b_deq_io_deq_bits_id; // @[Decoupled.scala 401:19 402:14]
  wire [2:0] _GEN_11 = q_b_bits_id ? b_count_1 : b_count_0; // @[ToTL.scala 196:{43,43}]
  wire [2:0] _GEN_13 = q_b_bits_id ? w_count_1 : w_count_0; // @[ToTL.scala 196:{43,43}]
  wire  b_allow = _GEN_11 != _GEN_13; // @[ToTL.scala 196:43]
  wire [1:0] b_sel = 2'h1 << q_b_bits_id; // @[OneHot.scala 64:12]
  wire  q_b_valid = q_b_deq_io_deq_valid; // @[Decoupled.scala 401:19 403:15]
  wire  bundleIn_0_b_valid = q_b_valid & b_allow; // @[ToTL.scala 204:31]
  wire  _T_111 = auto_in_b_ready & bundleIn_0_b_valid; // @[Decoupled.scala 50:35]
  wire [2:0] _b_count_0_T_1 = b_count_0 + 3'h1; // @[ToTL.scala 200:42]
  wire [2:0] _b_count_1_T_1 = b_count_1 + 3'h1; // @[ToTL.scala 200:42]
  AXI4ToTL_Param_Queue_15 deq ( // @[Decoupled.scala 361:21]
    .clock(deq_clock),
    .reset(deq_reset),
    .io_enq_ready(deq_io_enq_ready),
    .io_enq_valid(deq_io_enq_valid),
    .io_enq_bits_id(deq_io_enq_bits_id),
    .io_enq_bits_data(deq_io_enq_bits_data),
    .io_enq_bits_resp(deq_io_enq_bits_resp),
    .io_enq_bits_last(deq_io_enq_bits_last),
    .io_deq_ready(deq_io_deq_ready),
    .io_deq_valid(deq_io_deq_valid),
    .io_deq_bits_id(deq_io_deq_bits_id),
    .io_deq_bits_data(deq_io_deq_bits_data),
    .io_deq_bits_resp(deq_io_deq_bits_resp),
    .io_deq_bits_last(deq_io_deq_bits_last)
  );
  AXI4ToTL_Param_Queue_16 q_b_deq ( // @[Decoupled.scala 361:21]
    .clock(q_b_deq_clock),
    .reset(q_b_deq_reset),
    .io_enq_ready(q_b_deq_io_enq_ready),
    .io_enq_valid(q_b_deq_io_enq_valid),
    .io_enq_bits_id(q_b_deq_io_enq_bits_id),
    .io_enq_bits_resp(q_b_deq_io_enq_bits_resp),
    .io_deq_ready(q_b_deq_io_deq_ready),
    .io_deq_valid(q_b_deq_io_deq_valid),
    .io_deq_bits_id(q_b_deq_io_deq_bits_id),
    .io_deq_bits_resp(q_b_deq_io_deq_bits_resp)
  );
  assign auto_in_aw_ready = out_1_ready & auto_in_w_valid & auto_in_w_bits_last; // @[ToTL.scala 142:48]
  assign auto_in_w_ready = out_1_ready & auto_in_aw_valid; // @[ToTL.scala 143:34]
  assign auto_in_b_valid = q_b_valid & b_allow; // @[ToTL.scala 204:31]
  assign auto_in_b_bits_id = q_b_deq_io_deq_bits_id; // @[Decoupled.scala 401:19 402:14]
  assign auto_in_b_bits_resp = q_b_deq_io_deq_bits_resp; // @[Decoupled.scala 401:19 402:14]
  assign auto_in_ar_ready = auto_out_a_ready & allowed_0; // @[Arbiter.scala 123:31]
  assign auto_in_r_valid = deq_io_deq_valid; // @[Decoupled.scala 401:19 403:15]
  assign auto_in_r_bits_id = deq_io_deq_bits_id; // @[Decoupled.scala 401:19 402:14]
  assign auto_in_r_bits_data = deq_io_deq_bits_data; // @[Decoupled.scala 401:19 402:14]
  assign auto_in_r_bits_resp = deq_io_deq_bits_resp; // @[Decoupled.scala 401:19 402:14]
  assign auto_in_r_bits_last = deq_io_deq_bits_last; // @[Decoupled.scala 401:19 402:14]
  assign auto_out_a_valid = idle ? _T_50 : _sink_ACancel_earlyValid_T_3; // @[Arbiter.scala 125:29]
  assign auto_out_a_bits_opcode = _T_106 | _T_107; // @[Mux.scala 27:73]
  assign auto_out_a_bits_size = _T_100 | _T_101; // @[Mux.scala 27:73]
  assign auto_out_a_bits_source = _T_97 | _T_98; // @[Mux.scala 27:73]
  assign auto_out_a_bits_address = _T_94 | _T_95; // @[Mux.scala 27:73]
  assign auto_out_a_bits_user_amba_prot_bufferable = muxStateEarly_0 & r_out_bits_user_amba_prot_bufferable |
    muxStateEarly_1 & w_out_bits_user_amba_prot_bufferable; // @[Mux.scala 27:73]
  assign auto_out_a_bits_user_amba_prot_modifiable = muxStateEarly_0 & r_out_bits_user_amba_prot_modifiable |
    muxStateEarly_1 & w_out_bits_user_amba_prot_modifiable; // @[Mux.scala 27:73]
  assign auto_out_a_bits_user_amba_prot_readalloc = muxStateEarly_0 & r_out_bits_user_amba_prot_readalloc |
    muxStateEarly_1 & w_out_bits_user_amba_prot_readalloc; // @[Mux.scala 27:73]
  assign auto_out_a_bits_user_amba_prot_writealloc = muxStateEarly_0 & r_out_bits_user_amba_prot_writealloc |
    muxStateEarly_1 & w_out_bits_user_amba_prot_writealloc; // @[Mux.scala 27:73]
  assign auto_out_a_bits_user_amba_prot_privileged = muxStateEarly_0 & r_out_bits_user_amba_prot_privileged |
    muxStateEarly_1 & w_out_bits_user_amba_prot_privileged; // @[Mux.scala 27:73]
  assign auto_out_a_bits_user_amba_prot_secure = muxStateEarly_0 & r_out_bits_user_amba_prot_secure | muxStateEarly_1 &
    w_out_bits_user_amba_prot_secure; // @[Mux.scala 27:73]
  assign auto_out_a_bits_user_amba_prot_fetch = muxStateEarly_0 & r_out_bits_user_amba_prot_fetch | muxStateEarly_1 &
    w_out_bits_user_amba_prot_fetch; // @[Mux.scala 27:73]
  assign auto_out_a_bits_mask = _T_70 | _T_71; // @[Mux.scala 27:73]
  assign auto_out_a_bits_data = muxStateEarly_1 ? auto_in_w_bits_data : 64'h0; // @[Mux.scala 27:73]
  assign auto_out_d_ready = d_hasData ? ok_r_ready : ok_b_ready; // @[ToTL.scala 173:25]
  assign deq_clock = clock;
  assign deq_reset = reset;
  assign deq_io_enq_valid = auto_out_d_valid & d_hasData; // @[ToTL.scala 174:33]
  assign deq_io_enq_bits_id = auto_out_d_bits_source[3]; // @[ToTL.scala 177:43]
  assign deq_io_enq_bits_data = auto_out_d_bits_data; // @[Nodes.scala 1207:84 LazyModule.scala 311:12]
  assign deq_io_enq_bits_resp = auto_out_d_bits_denied | auto_out_d_bits_corrupt ? 2'h2 : 2'h0; // @[ToTL.scala 169:23]
  assign deq_io_enq_bits_last = d_last_counter == 9'h1 | d_last_beats1 == 9'h0; // @[Edges.scala 231:37]
  assign deq_io_deq_ready = auto_in_r_ready; // @[Nodes.scala 1210:84 LazyModule.scala 309:16]
  assign q_b_deq_clock = clock;
  assign q_b_deq_reset = reset;
  assign q_b_deq_io_enq_valid = auto_out_d_valid & ~d_hasData; // @[ToTL.scala 175:33]
  assign q_b_deq_io_enq_bits_id = auto_out_d_bits_source[3]; // @[ToTL.scala 186:43]
  assign q_b_deq_io_enq_bits_resp = auto_out_d_bits_denied | auto_out_d_bits_corrupt ? 2'h2 : 2'h0; // @[ToTL.scala 169:23]
  assign q_b_deq_io_deq_ready = auto_in_b_ready & b_allow; // @[ToTL.scala 205:31]
  always @(posedge clock) begin
    if (reset) begin // @[ToTL.scala 100:28]
      r_count_0 <= 3'h0; // @[ToTL.scala 100:28]
    end else if (_T_12 & r_sel[0]) begin // @[ToTL.scala 125:34]
      r_count_0 <= _r_count_0_T_1; // @[ToTL.scala 125:38]
    end
    if (reset) begin // @[ToTL.scala 100:28]
      r_count_1 <= 3'h0; // @[ToTL.scala 100:28]
    end else if (_T_12 & r_sel[1]) begin // @[ToTL.scala 125:34]
      r_count_1 <= _r_count_1_T_1; // @[ToTL.scala 125:38]
    end
    if (reset) begin // @[Arbiter.scala 87:30]
      beatsLeft <= 8'h0; // @[Arbiter.scala 87:30]
    end else if (latch) begin // @[Arbiter.scala 113:23]
      if (earlyWinner_1) begin // @[Arbiter.scala 111:73]
        beatsLeft <= auto_in_aw_bits_len;
      end else begin
        beatsLeft <= 8'h0;
      end
    end else begin
      beatsLeft <= _beatsLeft_T_4;
    end
    if (reset) begin // @[Arbiter.scala 23:23]
      readys_mask <= 2'h3; // @[Arbiter.scala 23:23]
    end else if (latch & |readys_valid) begin // @[Arbiter.scala 27:32]
      readys_mask <= _readys_mask_T_3; // @[Arbiter.scala 28:12]
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      state_0 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (idle) begin // @[Arbiter.scala 117:30]
      state_0 <= earlyWinner_0;
    end
    if (reset) begin // @[ToTL.scala 133:28]
      w_count_0 <= 3'h0; // @[ToTL.scala 133:28]
    end else if (_T_36 & w_sel[0]) begin // @[ToTL.scala 161:34]
      w_count_0 <= _w_count_0_T_1; // @[ToTL.scala 161:38]
    end
    if (reset) begin // @[ToTL.scala 133:28]
      w_count_1 <= 3'h0; // @[ToTL.scala 133:28]
    end else if (_T_36 & w_sel[1]) begin // @[ToTL.scala 161:34]
      w_count_1 <= _w_count_1_T_1; // @[ToTL.scala 161:38]
    end
    if (reset) begin // @[Arbiter.scala 116:26]
      state_1 <= 1'h0; // @[Arbiter.scala 116:26]
    end else if (idle) begin // @[Arbiter.scala 117:30]
      state_1 <= earlyWinner_1;
    end
    if (reset) begin // @[Edges.scala 228:27]
      d_last_counter <= 9'h0; // @[Edges.scala 228:27]
    end else if (_d_last_T) begin // @[Edges.scala 234:17]
      if (d_last_first) begin // @[Edges.scala 235:21]
        if (d_hasData) begin // @[Edges.scala 220:14]
          d_last_counter <= d_last_beats1_decode;
        end else begin
          d_last_counter <= 9'h0;
        end
      end else begin
        d_last_counter <= d_last_counter1;
      end
    end
    if (reset) begin // @[ToTL.scala 195:28]
      b_count_0 <= 3'h0; // @[ToTL.scala 195:28]
    end else if (_T_111 & b_sel[0]) begin // @[ToTL.scala 200:33]
      b_count_0 <= _b_count_0_T_1; // @[ToTL.scala 200:37]
    end
    if (reset) begin // @[ToTL.scala 195:28]
      b_count_1 <= 3'h0; // @[ToTL.scala 195:28]
    end else if (_T_111 & b_sel[1]) begin // @[ToTL.scala 200:33]
      b_count_1 <= _b_count_1_T_1; // @[ToTL.scala 200:37]
    end
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~auto_in_ar_valid | r_size1 == _T_4) & ~reset) begin
          $fatal; // @[ToTL.scala 107:14]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(~auto_in_ar_valid | r_size1 == _T_4)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToTL.scala:107 assert (!in.ar.valid || r_size1 === UIntToOH1(r_size, beatCountBits)) // because aligned\n"
            ); // @[ToTL.scala 107:14]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~auto_in_aw_valid | w_size1 == _T_20) & _T_8) begin
          $fatal; // @[ToTL.scala 140:14]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_8 & ~(~auto_in_aw_valid | w_size1 == _T_20)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToTL.scala:140 assert (!in.aw.valid || w_size1 === UIntToOH1(w_size, beatCountBits)) // because aligned\n"
            ); // @[ToTL.scala 140:14]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_16 | auto_in_aw_bits_len == 8'h0 | auto_in_aw_bits_size == 3'h3) & _T_8) begin
          $fatal; // @[ToTL.scala 141:14]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_8 & ~(_T_16 | auto_in_aw_bits_len == 8'h0 | auto_in_aw_bits_size == 3'h3)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToTL.scala:141 assert (!in.aw.valid || in.aw.bits.len === UInt(0) || in.aw.bits.size === UInt(log2Ceil(beatBytes))) // because aligned\n"
            ); // @[ToTL.scala 141:14]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~earlyWinner_0 | ~earlyWinner_1) & _T_8) begin
          $fatal; // @[Arbiter.scala 105:13]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_8 & ~(~earlyWinner_0 | ~earlyWinner_1)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Arbiter.scala:105 assert((prefixOR zip earlyWinner) map { case (p,w) => !p || !w } reduce {_ && _})\n"
            ); // @[Arbiter.scala 105:13]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~(auto_in_ar_valid | w_out_valid) | _prefixOR_T) & _T_8) begin
          $fatal; // @[Arbiter.scala 107:14]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_8 & ~(~(auto_in_ar_valid | w_out_valid) | _prefixOR_T)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Arbiter.scala:107 assert (!earlyValids.reduce(_||_) || earlyWinner.reduce(_||_))\n"
            ); // @[Arbiter.scala 107:14]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(_T_51 | _T_50) & _T_8) begin
          $fatal; // @[Arbiter.scala 108:14]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_8 & ~(_T_51 | _T_50)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at Arbiter.scala:108 assert (!validQuals .reduce(_||_) || validQuals .reduce(_||_))\n"
            ); // @[Arbiter.scala 108:14]
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
  r_count_0 = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  r_count_1 = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  beatsLeft = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  readys_mask = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  state_0 = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  w_count_0 = _RAND_5[2:0];
  _RAND_6 = {1{`RANDOM}};
  w_count_1 = _RAND_6[2:0];
  _RAND_7 = {1{`RANDOM}};
  state_1 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  d_last_counter = _RAND_8[8:0];
  _RAND_9 = {1{`RANDOM}};
  b_count_0 = _RAND_9[2:0];
  _RAND_10 = {1{`RANDOM}};
  b_count_1 = _RAND_10[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
