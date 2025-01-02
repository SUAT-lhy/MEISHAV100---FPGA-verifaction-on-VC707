module DCache( 
  input         gated_clock, 
  input         reset, 
  input         auto_out_a_ready, 
  output        auto_out_a_valid, 
  output [2:0]  auto_out_a_bits_opcode, 
  output [2:0]  auto_out_a_bits_param, 
  output [2:0]  auto_out_a_bits_size, 
  output        auto_out_a_bits_source, 
  output [37:0] auto_out_a_bits_address, 
  output [7:0]  auto_out_a_bits_mask, 
  output [63:0] auto_out_a_bits_data, 
  output        auto_out_b_ready, 
  input         auto_out_b_valid, 
  input  [1:0]  auto_out_b_bits_param, 
  input  [2:0]  auto_out_b_bits_size, 
  input         auto_out_b_bits_source, 
  input  [37:0] auto_out_b_bits_address, 
  input         auto_out_c_ready, 
  output        auto_out_c_valid, 
  output [2:0]  auto_out_c_bits_opcode, 
  output [2:0]  auto_out_c_bits_param, 
  output [2:0]  auto_out_c_bits_size, 
  output        auto_out_c_bits_source, 
  output [37:0] auto_out_c_bits_address, 
  output [63:0] auto_out_c_bits_data, 
  output        auto_out_d_ready, 
  input         auto_out_d_valid, 
  input  [2:0]  auto_out_d_bits_opcode, 
  input  [1:0]  auto_out_d_bits_param, 
  input  [2:0]  auto_out_d_bits_size, 
  input         auto_out_d_bits_source, 
  input  [2:0]  auto_out_d_bits_sink, 
  input         auto_out_d_bits_denied, 
  input  [63:0] auto_out_d_bits_data, 
  input         auto_out_e_ready, 
  output        auto_out_e_valid, 
  output [2:0]  auto_out_e_bits_sink, 
  output        io_cpu_req_ready, 
  input         io_cpu_req_valid, 
  input  [39:0] io_cpu_req_bits_addr, 
  input  [6:0]  io_cpu_req_bits_tag, 
  input  [4:0]  io_cpu_req_bits_cmd, 
  input  [2:0]  io_cpu_req_bits_typ, 
  input         io_cpu_req_bits_phys, 
  input         io_cpu_s1_kill, 
  input  [63:0] io_cpu_s1_data_data, 
  input  [7:0]  io_cpu_s1_data_mask, 
  output        io_cpu_s2_nack, 
  input         io_cpu_s2_kill, 
  output        io_cpu_resp_valid, 
  output [6:0]  io_cpu_resp_bits_tag, 
  output [2:0]  io_cpu_resp_bits_typ, 
  output [63:0] io_cpu_resp_bits_data, 
  output        io_cpu_resp_bits_replay, 
  output        io_cpu_resp_bits_has_data, 
  output [63:0] io_cpu_resp_bits_data_word_bypass, 
  output        io_cpu_replay_next, 
  output        io_cpu_s2_xcpt_ma_ld, 
  output        io_cpu_s2_xcpt_ma_st, 
  output        io_cpu_s2_xcpt_pf_ld, 
  output        io_cpu_s2_xcpt_pf_st, 
  output        io_cpu_s2_xcpt_ae_ld, 
  output        io_cpu_s2_xcpt_ae_st, 
  output        io_cpu_ordered, 
  output        io_cpu_perf_grant, 
  input         io_cpu_keep_clock_enabled, 
  output        io_cpu_clock_enabled, 
  input         io_ptw_req_ready, 
  output        io_ptw_req_valid, 
  output        io_ptw_req_bits_valid, 
  output [26:0] io_ptw_req_bits_bits_addr, 
  input         io_ptw_resp_valid, 
  input         io_ptw_resp_bits_ae, 
  input  [53:0] io_ptw_resp_bits_pte_ppn, 
  input         io_ptw_resp_bits_pte_d, 
  input         io_ptw_resp_bits_pte_a, 
  input         io_ptw_resp_bits_pte_g, 
  input         io_ptw_resp_bits_pte_u, 
  input         io_ptw_resp_bits_pte_x, 
  input         io_ptw_resp_bits_pte_w, 
  input         io_ptw_resp_bits_pte_r, 
  input         io_ptw_resp_bits_pte_v, 
  input  [1:0]  io_ptw_resp_bits_level, 
  input         io_ptw_resp_bits_fragmented_superpage, 
  input         io_ptw_resp_bits_homogeneous, 
  input  [3:0]  io_ptw_ptbr_mode, 
  input  [1:0]  io_ptw_status_dprv, 
  input         io_ptw_status_mxr, 
  input         io_ptw_status_sum, 
  input         io_ptw_pmp_0_cfg_l, 
  input  [1:0]  io_ptw_pmp_0_cfg_a, 
  input         io_ptw_pmp_0_cfg_x, 
  input         io_ptw_pmp_0_cfg_w, 
  input         io_ptw_pmp_0_cfg_r, 
  input  [35:0] io_ptw_pmp_0_addr, 
  input  [37:0] io_ptw_pmp_0_mask, 
  input         io_ptw_pmp_1_cfg_l, 
  input  [1:0]  io_ptw_pmp_1_cfg_a, 
  input         io_ptw_pmp_1_cfg_x, 
  input         io_ptw_pmp_1_cfg_w, 
  input         io_ptw_pmp_1_cfg_r, 
  input  [35:0] io_ptw_pmp_1_addr, 
  input  [37:0] io_ptw_pmp_1_mask, 
  input         io_ptw_pmp_2_cfg_l, 
  input  [1:0]  io_ptw_pmp_2_cfg_a, 
  input         io_ptw_pmp_2_cfg_x, 
  input         io_ptw_pmp_2_cfg_w, 
  input         io_ptw_pmp_2_cfg_r, 
  input  [35:0] io_ptw_pmp_2_addr, 
  input  [37:0] io_ptw_pmp_2_mask, 
  input         io_ptw_pmp_3_cfg_l, 
  input  [1:0]  io_ptw_pmp_3_cfg_a, 
  input         io_ptw_pmp_3_cfg_x, 
  input         io_ptw_pmp_3_cfg_w, 
  input         io_ptw_pmp_3_cfg_r, 
  input  [35:0] io_ptw_pmp_3_addr, 
  input  [37:0] io_ptw_pmp_3_mask, 
  input         io_ptw_pmp_4_cfg_l, 
  input  [1:0]  io_ptw_pmp_4_cfg_a, 
  input         io_ptw_pmp_4_cfg_x, 
  input         io_ptw_pmp_4_cfg_w, 
  input         io_ptw_pmp_4_cfg_r, 
  input  [35:0] io_ptw_pmp_4_addr, 
  input  [37:0] io_ptw_pmp_4_mask, 
  input         io_ptw_pmp_5_cfg_l, 
  input  [1:0]  io_ptw_pmp_5_cfg_a, 
  input         io_ptw_pmp_5_cfg_x, 
  input         io_ptw_pmp_5_cfg_w, 
  input         io_ptw_pmp_5_cfg_r, 
  input  [35:0] io_ptw_pmp_5_addr, 
  input  [37:0] io_ptw_pmp_5_mask, 
  input         io_ptw_pmp_6_cfg_l, 
  input  [1:0]  io_ptw_pmp_6_cfg_a, 
  input         io_ptw_pmp_6_cfg_x, 
  input         io_ptw_pmp_6_cfg_w, 
  input         io_ptw_pmp_6_cfg_r, 
  input  [35:0] io_ptw_pmp_6_addr, 
  input  [37:0] io_ptw_pmp_6_mask, 
  input         io_ptw_pmp_7_cfg_l, 
  input  [1:0]  io_ptw_pmp_7_cfg_a, 
  input         io_ptw_pmp_7_cfg_x, 
  input         io_ptw_pmp_7_cfg_w, 
  input         io_ptw_pmp_7_cfg_r, 
  input  [35:0] io_ptw_pmp_7_addr, 
  input  [37:0] io_ptw_pmp_7_mask, 
  input  [63:0] io_ptw_customCSRs_csrs_0_value 
);
  wire  metaArb_io_in_0_valid; 
  wire [39:0] metaArb_io_in_0_bits_addr; 
  wire [5:0] metaArb_io_in_0_bits_idx; 
  wire [27:0] metaArb_io_in_0_bits_data; 
  wire  metaArb_io_in_2_valid; 
  wire  metaArb_io_in_2_bits_write; 
  wire [39:0] metaArb_io_in_2_bits_addr; 
  wire [5:0] metaArb_io_in_2_bits_idx; 
  wire [3:0] metaArb_io_in_2_bits_way_en; 
  wire [27:0] metaArb_io_in_2_bits_data; 
  wire  metaArb_io_in_3_valid; 
  wire [39:0] metaArb_io_in_3_bits_addr; 
  wire [5:0] metaArb_io_in_3_bits_idx; 
  wire [3:0] metaArb_io_in_3_bits_way_en; 
  wire [27:0] metaArb_io_in_3_bits_data; 
  wire  metaArb_io_in_4_ready; 
  wire  metaArb_io_in_4_valid; 
  wire [39:0] metaArb_io_in_4_bits_addr; 
  wire [5:0] metaArb_io_in_4_bits_idx; 
  wire [3:0] metaArb_io_in_4_bits_way_en; 
  wire [27:0] metaArb_io_in_4_bits_data; 
  wire  metaArb_io_in_5_ready; 
  wire  metaArb_io_in_5_valid; 
  wire [39:0] metaArb_io_in_5_bits_addr; 
  wire [5:0] metaArb_io_in_5_bits_idx; 
  wire  metaArb_io_in_6_ready; 
  wire  metaArb_io_in_6_valid; 
  wire [39:0] metaArb_io_in_6_bits_addr; 
  wire [5:0] metaArb_io_in_6_bits_idx; 
  wire [3:0] metaArb_io_in_6_bits_way_en; 
  wire [27:0] metaArb_io_in_6_bits_data; 
  wire  metaArb_io_in_7_ready; 
  wire  metaArb_io_in_7_valid; 
  wire [39:0] metaArb_io_in_7_bits_addr; 
  wire [5:0] metaArb_io_in_7_bits_idx; 
  wire [3:0] metaArb_io_in_7_bits_way_en; 
  wire [27:0] metaArb_io_in_7_bits_data; 
  wire  metaArb_io_out_ready; 
  wire  metaArb_io_out_valid; 
  wire  metaArb_io_out_bits_write; 
  wire [39:0] metaArb_io_out_bits_addr; 
  wire [5:0] metaArb_io_out_bits_idx; 
  wire [3:0] metaArb_io_out_bits_way_en; 
  wire [27:0] metaArb_io_out_bits_data; 
  reg [27:0] tag_array_0 [0:63]; 
  reg [31:0] _RAND_0;
  wire [27:0] tag_array_0_s1_meta_data; 
  wire [5:0] tag_array_0_s1_meta_addr; 
  wire [27:0] tag_array_0__T_553_data; 
  wire [5:0] tag_array_0__T_553_addr; 
  wire  tag_array_0__T_553_mask; 
  wire  tag_array_0__T_553_en; 
  reg [27:0] tag_array_1 [0:63]; 
  reg [31:0] _RAND_1;
  wire [27:0] tag_array_1_s1_meta_data; 
  wire [5:0] tag_array_1_s1_meta_addr; 
  wire [27:0] tag_array_1__T_553_data; 
  wire [5:0] tag_array_1__T_553_addr; 
  wire  tag_array_1__T_553_mask; 
  wire  tag_array_1__T_553_en; 
  reg [27:0] tag_array_2 [0:63]; 
  reg [31:0] _RAND_2;
  wire [27:0] tag_array_2_s1_meta_data; 
  wire [5:0] tag_array_2_s1_meta_addr; 
  wire [27:0] tag_array_2__T_553_data; 
  wire [5:0] tag_array_2__T_553_addr; 
  wire  tag_array_2__T_553_mask; 
  wire  tag_array_2__T_553_en; 
  reg [27:0] tag_array_3 [0:63]; 
  reg [31:0] _RAND_3;
  wire [27:0] tag_array_3_s1_meta_data; 
  wire [5:0] tag_array_3_s1_meta_addr; 
  wire [27:0] tag_array_3__T_553_data; 
  wire [5:0] tag_array_3__T_553_addr; 
  wire  tag_array_3__T_553_mask; 
  wire  tag_array_3__T_553_en; 
  wire  data_clock; 
  wire  data_io_req_valid; 
  wire [11:0] data_io_req_bits_addr; 
  wire  data_io_req_bits_write; 
  wire [63:0] data_io_req_bits_wdata; 
  wire [7:0] data_io_req_bits_eccMask; 
  wire [3:0] data_io_req_bits_way_en; 
  wire [63:0] data_io_resp_0; 
  wire [63:0] data_io_resp_1; 
  wire [63:0] data_io_resp_2; 
  wire [63:0] data_io_resp_3; 
  wire  dataArb_io_in_0_valid; 
  wire [11:0] dataArb_io_in_0_bits_addr; 
  wire  dataArb_io_in_0_bits_write; 
  wire [63:0] dataArb_io_in_0_bits_wdata; 
  wire [7:0] dataArb_io_in_0_bits_eccMask; 
  wire [3:0] dataArb_io_in_0_bits_way_en; 
  wire  dataArb_io_in_1_ready; 
  wire  dataArb_io_in_1_valid; 
  wire [11:0] dataArb_io_in_1_bits_addr; 
  wire  dataArb_io_in_1_bits_write; 
  wire [63:0] dataArb_io_in_1_bits_wdata; 
  wire [7:0] dataArb_io_in_1_bits_eccMask; 
  wire [3:0] dataArb_io_in_1_bits_way_en; 
  wire  dataArb_io_in_2_ready; 
  wire  dataArb_io_in_2_valid; 
  wire [11:0] dataArb_io_in_2_bits_addr; 
  wire [63:0] dataArb_io_in_2_bits_wdata; 
  wire [7:0] dataArb_io_in_2_bits_eccMask; 
  wire  dataArb_io_in_3_ready; 
  wire  dataArb_io_in_3_valid; 
  wire [11:0] dataArb_io_in_3_bits_addr; 
  wire [63:0] dataArb_io_in_3_bits_wdata; 
  wire [7:0] dataArb_io_in_3_bits_eccMask; 
  wire  dataArb_io_out_valid; 
  wire [11:0] dataArb_io_out_bits_addr; 
  wire  dataArb_io_out_bits_write; 
  wire [63:0] dataArb_io_out_bits_wdata; 
  wire [7:0] dataArb_io_out_bits_eccMask; 
  wire [3:0] dataArb_io_out_bits_way_en; 
  wire  tlb_clock; 
  wire  tlb_reset; 
  wire  tlb_io_req_ready; 
  wire  tlb_io_req_valid; 
  wire [39:0] tlb_io_req_bits_vaddr; 
  wire  tlb_io_req_bits_passthrough; 
  wire [1:0] tlb_io_req_bits_size; 
  wire [4:0] tlb_io_req_bits_cmd; 
  wire  tlb_io_resp_miss; 
  wire [37:0] tlb_io_resp_paddr; 
  wire  tlb_io_resp_pf_ld; 
  wire  tlb_io_resp_pf_st; 
  wire  tlb_io_resp_ae_ld; 
  wire  tlb_io_resp_ae_st; 
  wire  tlb_io_resp_ma_ld; 
  wire  tlb_io_resp_ma_st; 
  wire  tlb_io_resp_cacheable; 
  wire  tlb_io_sfence_valid; 
  wire  tlb_io_sfence_bits_rs1; 
  wire  tlb_io_sfence_bits_rs2; 
  wire [38:0] tlb_io_sfence_bits_addr; 
  wire  tlb_io_ptw_req_ready; 
  wire  tlb_io_ptw_req_valid; 
  wire  tlb_io_ptw_req_bits_valid; 
  wire [26:0] tlb_io_ptw_req_bits_bits_addr; 
  wire  tlb_io_ptw_resp_valid; 
  wire  tlb_io_ptw_resp_bits_ae; 
  wire [53:0] tlb_io_ptw_resp_bits_pte_ppn; 
  wire  tlb_io_ptw_resp_bits_pte_d; 
  wire  tlb_io_ptw_resp_bits_pte_a; 
  wire  tlb_io_ptw_resp_bits_pte_g; 
  wire  tlb_io_ptw_resp_bits_pte_u; 
  wire  tlb_io_ptw_resp_bits_pte_x; 
  wire  tlb_io_ptw_resp_bits_pte_w; 
  wire  tlb_io_ptw_resp_bits_pte_r; 
  wire  tlb_io_ptw_resp_bits_pte_v; 
  wire [1:0] tlb_io_ptw_resp_bits_level; 
  wire  tlb_io_ptw_resp_bits_fragmented_superpage; 
  wire  tlb_io_ptw_resp_bits_homogeneous; 
  wire [3:0] tlb_io_ptw_ptbr_mode; 
  wire [1:0] tlb_io_ptw_status_dprv; 
  wire  tlb_io_ptw_status_mxr; 
  wire  tlb_io_ptw_status_sum; 
  wire  tlb_io_ptw_pmp_0_cfg_l; 
  wire [1:0] tlb_io_ptw_pmp_0_cfg_a; 
  wire  tlb_io_ptw_pmp_0_cfg_x; 
  wire  tlb_io_ptw_pmp_0_cfg_w; 
  wire  tlb_io_ptw_pmp_0_cfg_r; 
  wire [35:0] tlb_io_ptw_pmp_0_addr; 
  wire [37:0] tlb_io_ptw_pmp_0_mask; 
  wire  tlb_io_ptw_pmp_1_cfg_l; 
  wire [1:0] tlb_io_ptw_pmp_1_cfg_a; 
  wire  tlb_io_ptw_pmp_1_cfg_x; 
  wire  tlb_io_ptw_pmp_1_cfg_w; 
  wire  tlb_io_ptw_pmp_1_cfg_r; 
  wire [35:0] tlb_io_ptw_pmp_1_addr; 
  wire [37:0] tlb_io_ptw_pmp_1_mask; 
  wire  tlb_io_ptw_pmp_2_cfg_l; 
  wire [1:0] tlb_io_ptw_pmp_2_cfg_a; 
  wire  tlb_io_ptw_pmp_2_cfg_x; 
  wire  tlb_io_ptw_pmp_2_cfg_w; 
  wire  tlb_io_ptw_pmp_2_cfg_r; 
  wire [35:0] tlb_io_ptw_pmp_2_addr; 
  wire [37:0] tlb_io_ptw_pmp_2_mask; 
  wire  tlb_io_ptw_pmp_3_cfg_l; 
  wire [1:0] tlb_io_ptw_pmp_3_cfg_a; 
  wire  tlb_io_ptw_pmp_3_cfg_x; 
  wire  tlb_io_ptw_pmp_3_cfg_w; 
  wire  tlb_io_ptw_pmp_3_cfg_r; 
  wire [35:0] tlb_io_ptw_pmp_3_addr; 
  wire [37:0] tlb_io_ptw_pmp_3_mask; 
  wire  tlb_io_ptw_pmp_4_cfg_l; 
  wire [1:0] tlb_io_ptw_pmp_4_cfg_a; 
  wire  tlb_io_ptw_pmp_4_cfg_x; 
  wire  tlb_io_ptw_pmp_4_cfg_w; 
  wire  tlb_io_ptw_pmp_4_cfg_r; 
  wire [35:0] tlb_io_ptw_pmp_4_addr; 
  wire [37:0] tlb_io_ptw_pmp_4_mask; 
  wire  tlb_io_ptw_pmp_5_cfg_l; 
  wire [1:0] tlb_io_ptw_pmp_5_cfg_a; 
  wire  tlb_io_ptw_pmp_5_cfg_x; 
  wire  tlb_io_ptw_pmp_5_cfg_w; 
  wire  tlb_io_ptw_pmp_5_cfg_r; 
  wire [35:0] tlb_io_ptw_pmp_5_addr; 
  wire [37:0] tlb_io_ptw_pmp_5_mask; 
  wire  tlb_io_ptw_pmp_6_cfg_l; 
  wire [1:0] tlb_io_ptw_pmp_6_cfg_a; 
  wire  tlb_io_ptw_pmp_6_cfg_x; 
  wire  tlb_io_ptw_pmp_6_cfg_w; 
  wire  tlb_io_ptw_pmp_6_cfg_r; 
  wire [35:0] tlb_io_ptw_pmp_6_addr; 
  wire [37:0] tlb_io_ptw_pmp_6_mask; 
  wire  tlb_io_ptw_pmp_7_cfg_l; 
  wire [1:0] tlb_io_ptw_pmp_7_cfg_a; 
  wire  tlb_io_ptw_pmp_7_cfg_x; 
  wire  tlb_io_ptw_pmp_7_cfg_w; 
  wire  tlb_io_ptw_pmp_7_cfg_r; 
  wire [35:0] tlb_io_ptw_pmp_7_addr; 
  wire [37:0] tlb_io_ptw_pmp_7_mask; 
  wire  tlb_io_kill; 
  wire [7:0] amoalu_io_mask; 
  wire [4:0] amoalu_io_cmd; 
  wire [63:0] amoalu_io_lhs; 
  wire [63:0] amoalu_io_rhs; 
  wire [63:0] amoalu_io_out; 
  reg  clock_en_reg; 
  reg [31:0] _RAND_4;
  reg [15:0] lfsr; 
  reg [31:0] _RAND_5;
  wire  _T_235; 
  wire  _T_236; 
  wire  _T_237; 
  wire  _T_238; 
  wire  _T_239; 
  wire  _T_240; 
  wire  _T_241; 
  wire [14:0] _T_242; 
  wire [15:0] _T_243; 
  wire  grantIsUncachedData; 
  reg  blockUncachedGrant; 
  reg [31:0] _RAND_6;
  reg  s1_valid; 
  reg [31:0] _RAND_7;
  wire  _T_3420; 
  wire  _T_3421; 
  wire  grantIsRefill; 
  wire  _T_3331; 
  wire  _T_3332; 
  wire  _T_3284; 
  wire  grantIsCached; 
  reg [3:0] _T_3271; 
  reg [31:0] _RAND_8;
  wire  d_first; 
  wire  _T_3292; 
  wire  _T_3293; 
  wire  _T_3295; 
  wire  _GEN_169; 
  wire  tl_out__d_ready; 
  wire  _T_3296; 
  wire  _T_3275; 
  wire  _T_3268; 
  wire [13:0] _T_3264; 
  wire [6:0] _T_3265; 
  wire [6:0] _T_3266; 
  wire [3:0] _T_3267; 
  wire [3:0] _T_3269; 
  wire  _T_3276; 
  wire  d_last; 
  wire  _GEN_147; 
  wire  _GEN_159; 
  wire [63:0] _T_256; 
  wire [7:0] _T_257; 
  wire [7:0] _T_258; 
  wire [7:0] _T_259; 
  wire [7:0] _T_260; 
  wire [7:0] _T_261; 
  wire [7:0] _T_262; 
  wire [7:0] _T_263; 
  wire [7:0] _T_264; 
  wire [15:0] _T_265; 
  wire [15:0] _T_266; 
  wire [31:0] _T_267; 
  wire [15:0] _T_268; 
  wire [15:0] _T_269; 
  wire [31:0] _T_270; 
  wire  _T_274; 
  reg  s1_probe; 
  reg [31:0] _RAND_9;
  reg  s2_probe; 
  reg [31:0] _RAND_10;
  wire  _T_720; 
  reg [2:0] release_state; 
  reg [31:0] _RAND_11;
  wire  _T_721; 
  wire  releaseInFlight; 
  reg  grantInProgress; 
  reg [31:0] _RAND_12;
  wire  _T_3425; 
  reg [2:0] blockProbeAfterGrantCount; 
  reg [31:0] _RAND_13;
  wire  _T_3426; 
  wire  _T_3427; 
  reg [6:0] lrscCount; 
  reg [31:0] _RAND_14;
  wire  lrscValid; 
  wire  block_probe; 
  wire  _T_3431; 
  wire  _T_3432; 
  wire  _T_3433; 
  wire  _T_3434; 
  reg  s2_valid_pre_xcpt; 
  reg [31:0] _RAND_15;
  wire [1:0] _T_714; 
  wire [2:0] _T_715; 
  wire [1:0] _T_712; 
  wire [2:0] _T_713; 
  wire [5:0] _T_716; 
  wire  _T_717; 
  wire  _T_718; 
  wire  s2_valid; 
  wire  _T_3435; 
  wire  tl_out__b_ready; 
  wire  _T_276; 
  reg [1:0] probe_bits_param; 
  reg [31:0] _RAND_16;
  reg [2:0] probe_bits_size; 
  reg [31:0] _RAND_17;
  reg  probe_bits_source; 
  reg [31:0] _RAND_18;
  reg [37:0] probe_bits_address; 
  reg [63:0] _RAND_19;
  wire  _T_281; 
  wire  s1_valid_masked; 
  reg [1:0] s2_probe_state_state; 
  reg [31:0] _RAND_20;
  wire [3:0] _T_1055; 
  wire  _T_1112; 
  wire  _T_1108; 
  wire  _T_1104; 
  wire  _T_1100; 
  wire  _T_1096; 
  wire  _T_1092; 
  wire  _T_1088; 
  wire  _T_1084; 
  wire  _T_1080; 
  wire  _T_1076; 
  wire  _T_1072; 
  wire  _T_1068; 
  wire  _T_1085; 
  wire  _T_1089; 
  wire  _T_1093; 
  wire  _T_1097; 
  wire  _T_1101; 
  wire  _T_1105; 
  wire  _T_1109; 
  wire  s2_prb_ack_data; 
  wire  _T_3506; 
  reg [3:0] _T_3449; 
  reg [31:0] _RAND_21;
  wire  _T_3453; 
  wire  _T_3517; 
  wire  _T_3518; 
  wire  _T_3519; 
  wire  _T_3516; 
  wire  _T_3515; 
  wire [2:0] _GEN_251; 
  wire [2:0] tl_out__c_bits_opcode; 
  wire  _T_3446; 
  wire [2:0] tl_out__c_bits_size; 
  wire [13:0] _T_3442; 
  wire [6:0] _T_3443; 
  wire [6:0] _T_3444; 
  wire [3:0] _T_3445; 
  wire [3:0] _T_3447; 
  wire  _T_3454; 
  wire  c_last; 
  wire  _T_3514; 
  reg  s2_release_data_valid; 
  reg [31:0] _RAND_22;
  wire  _GEN_200; 
  wire  _GEN_221; 
  wire  _GEN_238; 
  wire  tl_out__c_valid; 
  wire  _T_3440; 
  wire  releaseDone; 
  wire  _T_3508; 
  wire  _GEN_198; 
  wire  probeNack; 
  reg [4:0] s1_req_cmd; 
  reg [31:0] _RAND_23;
  wire  _T_288; 
  wire  _T_289; 
  wire  _T_290; 
  wire  _T_291; 
  wire  _T_292; 
  wire  _T_293; 
  wire  _T_294; 
  wire  _T_297; 
  wire  _T_295; 
  wire  _T_298; 
  wire  _T_296; 
  wire  _T_299; 
  wire  _T_300; 
  wire  _T_301; 
  wire  _T_305; 
  wire  _T_302; 
  wire  _T_306; 
  wire  _T_303; 
  wire  _T_307; 
  wire  _T_304; 
  wire  _T_308; 
  wire  _T_309; 
  wire  s1_read; 
  reg  _T_724; 
  reg [31:0] _RAND_24;
  wire  s2_valid_masked; 
  reg [4:0] s2_req_cmd; 
  reg [31:0] _RAND_25;
  wire  _T_735; 
  wire  _T_736; 
  wire  _T_737; 
  wire  _T_738; 
  wire  _T_739; 
  wire  _T_740; 
  wire  _T_741; 
  wire  _T_744; 
  wire  _T_742; 
  wire  _T_745; 
  wire  _T_743; 
  wire  _T_746; 
  wire  _T_747; 
  wire  _T_748; 
  wire  _T_752; 
  wire  _T_749; 
  wire  _T_753; 
  wire  _T_750; 
  wire  _T_754; 
  wire  _T_751; 
  wire  _T_755; 
  wire  _T_756; 
  wire  s2_read; 
  wire  _T_757; 
  wire  _T_758; 
  wire  _T_759; 
  wire  _T_761; 
  wire  s2_write; 
  wire  s2_readwrite; 
  wire  _T_1019; 
  wire  _T_912; 
  wire  _T_913; 
  wire  _T_915; 
  wire [1:0] _T_916; 
  reg [1:0] s2_hit_state_state; 
  reg [31:0] _RAND_26;
  wire [3:0] _T_917; 
  wire  _T_975; 
  wire  _T_972; 
  wire  _T_969; 
  wire  _T_966; 
  wire  _T_963; 
  wire  _T_960; 
  wire  _T_957; 
  wire  _T_954; 
  wire  _T_951; 
  wire  _T_948; 
  wire  _T_945; 
  wire  _T_942; 
  wire  _T_961; 
  wire  _T_964; 
  wire  _T_967; 
  wire  _T_970; 
  wire  _T_973; 
  wire  s2_hit; 
  wire  s2_valid_hit_pre_data_ecc; 
  wire  _T_1403; 
  reg [33:0] lrscAddr; 
  reg [63:0] _RAND_27;
  reg [39:0] s2_req_addr; 
  reg [63:0] _RAND_28;
  wire [33:0] _T_1240; 
  wire  lrscAddrMatch; 
  wire  _T_1241; 
  wire  _T_1242; 
  wire  s2_sc_fail; 
  wire  _T_1404; 
  wire  _T_1405; 
  reg  pstore1_held; 
  reg [31:0] _RAND_29;
  wire  pstore1_valid_pre_kill; 
  reg [39:0] pstore1_addr; 
  reg [63:0] _RAND_30;
  wire [8:0] _T_1575; 
  reg [39:0] s1_req_addr; 
  reg [63:0] _RAND_31;
  wire [8:0] _T_1576; 
  wire  _T_1577; 
  wire  _T_310; 
  wire  _T_311; 
  wire  _T_312; 
  wire  _T_314; 
  wire  s1_write; 
  reg [7:0] pstore1_mask; 
  reg [31:0] _RAND_32;
  wire  _T_1585; 
  wire  _T_1584; 
  wire [1:0] _T_1598; 
  wire  _T_1583; 
  wire  _T_1582; 
  wire [1:0] _T_1597; 
  wire [3:0] _T_1599; 
  wire  _T_1581; 
  wire  _T_1580; 
  wire [1:0] _T_1595; 
  wire  _T_1579; 
  wire  _T_1578; 
  wire [1:0] _T_1594; 
  wire [3:0] _T_1596; 
  wire [7:0] _T_1600; 
  wire  _T_1608; 
  wire  _T_1607; 
  wire [1:0] _T_1613; 
  wire  _T_1606; 
  wire  _T_1605; 
  wire [1:0] _T_1612; 
  wire [3:0] _T_1614; 
  wire  _T_1604; 
  wire  _T_1603; 
  wire [1:0] _T_1610; 
  wire  _T_1602; 
  wire  _T_1601; 
  wire [1:0] _T_1609; 
  wire [3:0] _T_1611; 
  wire [7:0] _T_1615; 
  wire  _T_701; 
  wire  _T_693; 
  wire  _T_685; 
  reg [2:0] s1_req_typ; 
  reg [31:0] _RAND_33;
  wire [1:0] _T_684; 
  wire  _T_687; 
  wire  _T_689; 
  wire  _T_691; 
  wire [1:0] _T_692; 
  wire [1:0] _T_694; 
  wire  _T_695; 
  wire [1:0] _T_696; 
  wire [1:0] _T_697; 
  wire [1:0] _T_699; 
  wire [3:0] _T_700; 
  wire [3:0] _T_702; 
  wire  _T_703; 
  wire [3:0] _T_704; 
  wire [3:0] _T_705; 
  wire [3:0] _T_707; 
  wire [7:0] _T_708; 
  wire [7:0] s1_mask; 
  wire  _T_1623; 
  wire  _T_1622; 
  wire [1:0] _T_1636; 
  wire  _T_1621; 
  wire  _T_1620; 
  wire [1:0] _T_1635; 
  wire [3:0] _T_1637; 
  wire  _T_1619; 
  wire  _T_1618; 
  wire [1:0] _T_1633; 
  wire  _T_1617; 
  wire  _T_1616; 
  wire [1:0] _T_1632; 
  wire [3:0] _T_1634; 
  wire [7:0] _T_1638; 
  wire  _T_1646; 
  wire  _T_1645; 
  wire [1:0] _T_1651; 
  wire  _T_1644; 
  wire  _T_1643; 
  wire [1:0] _T_1650; 
  wire [3:0] _T_1652; 
  wire  _T_1642; 
  wire  _T_1641; 
  wire [1:0] _T_1648; 
  wire  _T_1640; 
  wire  _T_1639; 
  wire [1:0] _T_1647; 
  wire [3:0] _T_1649; 
  wire [7:0] _T_1653; 
  wire [7:0] _T_1654; 
  wire  _T_1655; 
  wire [7:0] _T_1656; 
  wire  _T_1657; 
  wire  _T_1658; 
  wire  _T_1659; 
  wire  _T_1660; 
  reg  pstore2_valid; 
  reg [31:0] _RAND_34;
  reg [39:0] pstore2_addr; 
  reg [63:0] _RAND_35;
  wire [8:0] _T_1661; 
  wire  _T_1663; 
  reg [7:0] mask; 
  reg [31:0] _RAND_36;
  wire  _T_1671; 
  wire  _T_1670; 
  wire [1:0] _T_1684; 
  wire  _T_1669; 
  wire  _T_1668; 
  wire [1:0] _T_1683; 
  wire [3:0] _T_1685; 
  wire  _T_1667; 
  wire  _T_1666; 
  wire [1:0] _T_1681; 
  wire  _T_1665; 
  wire  _T_1664; 
  wire [1:0] _T_1680; 
  wire [3:0] _T_1682; 
  wire [7:0] _T_1686; 
  wire  _T_1694; 
  wire  _T_1693; 
  wire [1:0] _T_1699; 
  wire  _T_1692; 
  wire  _T_1691; 
  wire [1:0] _T_1698; 
  wire [3:0] _T_1700; 
  wire  _T_1690; 
  wire  _T_1689; 
  wire [1:0] _T_1696; 
  wire  _T_1688; 
  wire  _T_1687; 
  wire [1:0] _T_1695; 
  wire [3:0] _T_1697; 
  wire [7:0] _T_1701; 
  wire [7:0] _T_1740; 
  wire  _T_1741; 
  wire [7:0] _T_1742; 
  wire  _T_1743; 
  wire  _T_1744; 
  wire  _T_1745; 
  wire  _T_1746; 
  wire  s1_hazard; 
  wire  s1_raw_hazard; 
  wire  _T_1747; 
  wire [1:0] _T_944; 
  wire [1:0] _T_947; 
  wire [1:0] _T_950; 
  wire [1:0] _T_953; 
  wire [1:0] _T_956; 
  wire [1:0] _T_959; 
  wire [1:0] _T_962; 
  wire [1:0] _T_965; 
  wire [1:0] _T_968; 
  wire [1:0] _T_971; 
  wire [1:0] _T_974; 
  wire [1:0] s2_grow_param; 
  wire  _T_1181; 
  wire  s2_update_meta; 
  wire  _T_1187; 
  wire  _T_1188; 
  wire  s1_readwrite; 
  wire  _T_529; 
  wire  _T_530; 
  wire  _GEN_74; 
  wire  _GEN_98; 
  wire  _GEN_219; 
  wire  s1_nack; 
  wire  _T_282; 
  wire  s1_valid_not_nacked; 
  reg [6:0] s1_req_tag; 
  reg [31:0] _RAND_37;
  reg  s1_req_phys; 
  reg [31:0] _RAND_38;
  wire  _T_283; 
  wire  s0_clk_en; 
  wire [33:0] _T_284; 
  wire [5:0] _T_285; 
  wire [39:0] _T_286; 
  wire  _T_287; 
  wire  s1_sfence; 
  reg  s1_flush_valid; 
  reg [31:0] _RAND_39;
  reg  cached_grant_wait; 
  reg [31:0] _RAND_40;
  reg  release_ack_wait; 
  reg [31:0] _RAND_41;
  wire  can_acquire_before_release; 
  wire  inWriteback; 
  wire  _T_343; 
  wire  _T_344; 
  wire  _T_345; 
  wire  _T_347; 
  reg  uncachedInFlight_0; 
  reg [31:0] _RAND_42;
  reg [39:0] uncachedReqs_0_addr; 
  reg [63:0] _RAND_43;
  reg [6:0] uncachedReqs_0_tag; 
  reg [31:0] _RAND_44;
  reg [2:0] uncachedReqs_0_typ; 
  reg [31:0] _RAND_45;
  wire  _T_374; 
  wire  _T_375; 
  wire  _T_376; 
  wire  _T_377; 
  wire  _T_378; 
  wire  _T_379; 
  wire  _T_380; 
  wire  _T_381; 
  wire  _T_382; 
  wire  _T_383; 
  wire  _T_384; 
  wire  _T_385; 
  wire  _T_386; 
  wire  _T_387; 
  wire  _T_388; 
  wire  _T_389; 
  wire  _T_390; 
  wire  _T_391; 
  wire  _T_392; 
  wire  _T_393; 
  wire  _T_394; 
  wire  _T_395; 
  wire  s0_read; 
  wire  _T_396; 
  wire  _T_397; 
  wire  _T_398; 
  wire  res; 
  wire  _T_426; 
  wire  _T_427; 
  wire  _T_429; 
  wire  _T_447; 
  wire  _T_452; 
  wire  _T_453; 
  wire  _T_454; 
  wire  _T_455; 
  wire  _T_457; 
  wire  _T_458; 
  wire  _T_459; 
  wire  _T_462; 
  wire  _T_463; 
  wire  _GEN_16; 
  wire  _GEN_18; 
  wire  _T_524; 
  wire  _T_525; 
  wire  _T_526; 
  wire  _T_527; 
  wire  _T_528; 
  wire  _GEN_19; 
  wire [1:0] s1_victim_way; 
  wire [5:0] _GEN_29; 
  wire  _GEN_41; 
  wire [27:0] _T_586; 
  wire [25:0] _T_587; 
  wire [1:0] _T_588; 
  wire [27:0] _T_593; 
  wire [25:0] _T_594; 
  wire [1:0] _T_595; 
  wire [27:0] _T_600; 
  wire [25:0] _T_601; 
  wire [1:0] _T_602; 
  wire [27:0] _T_607; 
  wire [25:0] _T_608; 
  wire [1:0] _T_609; 
  wire [25:0] s1_tag; 
  wire  _T_610; 
  wire  _T_611; 
  wire  _T_612; 
  wire  _T_613; 
  wire  _T_614; 
  wire  _T_615; 
  wire  _T_616; 
  wire  _T_617; 
  wire  _T_618; 
  wire  _T_619; 
  wire  _T_620; 
  wire  _T_621; 
  wire [1:0] _T_622; 
  wire [1:0] _T_623; 
  wire [3:0] s1_meta_hit_way; 
  wire  _T_627; 
  wire  _T_628; 
  wire [1:0] _T_629; 
  wire  _T_632; 
  wire [1:0] _T_633; 
  wire  _T_636; 
  wire [1:0] _T_637; 
  wire  _T_640; 
  wire [1:0] _T_641; 
  wire [1:0] _T_642; 
  wire [1:0] _T_643; 
  wire [1:0] s1_meta_hit_state_state; 
  wire  _T_651; 
  wire  _T_653; 
  wire  _T_655; 
  wire  s2_hit_valid; 
  reg [3:0] s2_hit_way; 
  reg [31:0] _RAND_46;
  reg [1:0] _T_1046; 
  reg [31:0] _RAND_47;
  wire [3:0] _T_1047; 
  wire [3:0] s2_victim_way; 
  reg [3:0] s2_probe_way; 
  reg [31:0] _RAND_48;
  wire [3:0] releaseWay; 
  wire [3:0] _T_656; 
  wire [7:0] _T_658; 
  wire [7:0] _T_659; 
  wire [7:0] _T_660; 
  wire [7:0] _T_661; 
  wire [7:0] _T_662; 
  wire [7:0] _T_663; 
  wire [7:0] _T_664; 
  wire [7:0] _T_665; 
  wire [15:0] _T_666; 
  wire [15:0] _T_667; 
  wire [31:0] _T_668; 
  wire [15:0] _T_669; 
  wire [15:0] _T_670; 
  wire [31:0] _T_671; 
  wire [63:0] s1_all_data_ways_4; 
  wire  _T_709; 
  wire  _T_710; 
  wire  _T_725; 
  wire  s2_valid_not_killed; 
  reg [6:0] s2_req_tag; 
  reg [31:0] _RAND_49;
  reg [2:0] s2_req_typ; 
  reg [31:0] _RAND_50;
  reg  s2_uncached; 
  reg [31:0] _RAND_51;
  wire  _T_728; 
  wire  _T_729; 
  reg [39:0] _T_732; 
  reg [63:0] _RAND_52;
  wire [27:0] _T_733; 
  wire [11:0] _T_734; 
  wire [39:0] s2_vaddr; 
  reg  s2_flush_valid_pre_tag_ecc; 
  reg [31:0] _RAND_53;
  wire  en; 
  wire  _T_3281; 
  wire  _T_3283; 
  wire  _T_3282; 
  wire  grantIsUncached; 
  wire [4:0] _GEN_129; 
  wire [4:0] _GEN_137; 
  wire [4:0] _GEN_149; 
  wire [4:0] s1_data_way; 
  wire  _T_839; 
  wire  _T_840; 
  wire  _T_841; 
  wire  _T_842; 
  wire  _T_843; 
  wire [63:0] s1_all_data_ways_0; 
  wire [63:0] _T_845; 
  wire [63:0] s1_all_data_ways_1; 
  wire [63:0] _T_846; 
  wire [63:0] s1_all_data_ways_2; 
  wire [63:0] _T_847; 
  wire [63:0] s1_all_data_ways_3; 
  wire [63:0] _T_848; 
  wire [63:0] _T_849; 
  wire [63:0] _T_850; 
  wire [63:0] _T_851; 
  wire [63:0] _T_852; 
  wire [63:0] _T_853; 
  wire  _T_857; 
  reg [63:0] s2_data; 
  reg [63:0] _RAND_54;
  wire [7:0] _T_977; 
  wire [7:0] _T_978; 
  wire [7:0] _T_979; 
  wire [7:0] _T_980; 
  wire [7:0] _T_981; 
  wire [7:0] _T_982; 
  wire [7:0] _T_983; 
  wire [7:0] _T_984; 
  wire [15:0] _T_1007; 
  wire [15:0] _T_1008; 
  wire [31:0] _T_1009; 
  wire [15:0] _T_1010; 
  wire [15:0] _T_1011; 
  wire [31:0] _T_1012; 
  wire [63:0] s2_data_corrected; 
  wire  _T_1030; 
  wire  _T_1031; 
  wire  s2_valid_miss; 
  wire  _T_1032; 
  wire  _T_1033; 
  wire  _T_1035; 
  wire  s2_valid_cached_miss; 
  wire  s2_want_victimize; 
  wire  _T_1038; 
  wire  s2_cannot_victimize; 
  wire  _T_1039; 
  wire  s2_victimize; 
  wire  _T_1040; 
  wire  _T_1041; 
  wire  _T_1042; 
  wire  _T_1043; 
  wire  s2_valid_uncached_pending; 
  reg [25:0] s2_victim_tag; 
  reg [31:0] _RAND_55;
  reg [1:0] _T_1054_state; 
  reg [31:0] _RAND_56;
  wire [1:0] s2_victim_state_state; 
  wire [2:0] _T_1070; 
  wire [2:0] _T_1074; 
  wire [2:0] _T_1078; 
  wire [2:0] _T_1082; 
  wire [2:0] _T_1086; 
  wire [2:0] _T_1090; 
  wire [1:0] _T_1091; 
  wire [2:0] _T_1094; 
  wire [1:0] _T_1095; 
  wire [2:0] _T_1098; 
  wire [1:0] _T_1099; 
  wire [2:0] _T_1102; 
  wire [1:0] _T_1103; 
  wire [2:0] _T_1106; 
  wire [1:0] _T_1107; 
  wire [2:0] _T_1110; 
  wire [1:0] _T_1111; 
  wire [2:0] s2_report_param; 
  wire [1:0] probeNewCoh_state; 
  wire [3:0] _T_1121; 
  wire  _T_1134; 
  wire [2:0] _T_1136; 
  wire  _T_1138; 
  wire [2:0] _T_1140; 
  wire  _T_1142; 
  wire [2:0] _T_1144; 
  wire  _T_1146; 
  wire [2:0] _T_1148; 
  wire  _T_1150; 
  wire  _T_1151; 
  wire [2:0] _T_1152; 
  wire  _T_1154; 
  wire  _T_1155; 
  wire [2:0] _T_1156; 
  wire [1:0] _T_1157; 
  wire  _T_1158; 
  wire  _T_1159; 
  wire [2:0] _T_1160; 
  wire [1:0] _T_1161; 
  wire  _T_1162; 
  wire  _T_1163; 
  wire [2:0] _T_1164; 
  wire [1:0] _T_1165; 
  wire  _T_1166; 
  wire  _T_1167; 
  wire [2:0] _T_1168; 
  wire [1:0] _T_1169; 
  wire  _T_1170; 
  wire  _T_1171; 
  wire [2:0] _T_1172; 
  wire [1:0] _T_1173; 
  wire  _T_1174; 
  wire  _T_1175; 
  wire [2:0] _T_1176; 
  wire [1:0] _T_1177; 
  wire  _T_1178; 
  wire  s2_victim_dirty; 
  wire [2:0] s2_shrink_param; 
  wire [1:0] voluntaryNewCoh_state; 
  wire  _T_1182; 
  wire  _T_1183; 
  wire  _T_1184; 
  wire  _T_1185; 
  wire  _T_1186; 
  wire [5:0] _T_1208; 
  wire [27:0] _T_1211; 
  wire  _T_1219; 
  wire  _T_1220; 
  wire [11:0] _T_1225; 
  wire [27:0] _T_1227; 
  wire [1:0] _T_1230_state; 
  wire [25:0] _T_1232_tag; 
  wire  _T_1237; 
  wire  _T_1238; 
  wire  lrscBackingOff; 
  wire  _T_1243; 
  wire  _T_1245; 
  wire  _T_1246; 
  wire  _T_1248; 
  wire [7:0] _T_1252; 
  wire [7:0] _T_1253; 
  wire [6:0] _T_1254; 
  wire  _T_1255; 
  wire  _T_1264; 
  reg [4:0] pstore1_cmd; 
  reg [31:0] _RAND_57;
  reg [63:0] pstore1_data; 
  reg [63:0] _RAND_58;
  reg [3:0] pstore1_way; 
  reg [31:0] _RAND_59;
  wire  _T_1325; 
  wire  _T_1326; 
  reg  pstore1_rmw; 
  reg [31:0] _RAND_60;
  wire  _T_1330; 
  wire  _T_1335; 
  wire  pstore_drain_opportunistic; 
  wire  pstore1_valid_likely; 
  wire  pstore1_valid; 
  wire  _T_1412; 
  wire  _T_1413; 
  wire  _T_1414; 
  wire  pstore_drain_structural; 
  wire  _T_1424; 
  wire  _T_1425; 
  wire  _T_1427; 
  wire  _T_1428; 
  wire  _T_1442; 
  wire  _T_1443; 
  wire  _T_1444; 
  wire  _T_1445; 
  wire  _T_1446; 
  wire  pstore_drain; 
  wire  _T_1456; 
  wire  _T_1457; 
  wire  _T_1460; 
  wire  advance_pstore1; 
  wire  _T_1462; 
  reg [3:0] pstore2_way; 
  reg [31:0] _RAND_61;
  wire [63:0] pstore1_storegen_data; 
  wire [7:0] _T_1468; 
  reg [7:0] _T_1473; 
  reg [31:0] _RAND_62;
  wire [7:0] _T_1474; 
  reg [7:0] _T_1479; 
  reg [31:0] _RAND_63;
  wire [7:0] _T_1480; 
  reg [7:0] _T_1485; 
  reg [31:0] _RAND_64;
  wire [7:0] _T_1486; 
  reg [7:0] _T_1491; 
  reg [31:0] _RAND_65;
  wire [7:0] _T_1492; 
  reg [7:0] _T_1497; 
  reg [31:0] _RAND_66;
  wire [7:0] _T_1498; 
  reg [7:0] _T_1503; 
  reg [31:0] _RAND_67;
  wire [7:0] _T_1504; 
  reg [7:0] _T_1509; 
  reg [31:0] _RAND_68;
  wire [7:0] _T_1510; 
  reg [7:0] _T_1515; 
  reg [31:0] _RAND_69;
  wire [15:0] _T_1516; 
  wire [15:0] _T_1517; 
  wire [31:0] _T_1518; 
  wire [15:0] _T_1519; 
  wire [15:0] _T_1520; 
  wire [31:0] _T_1521; 
  wire [63:0] pstore2_storegen_data; 
  wire [7:0] _T_1525; 
  wire [7:0] _T_1527; 
  wire  _T_1540; 
  wire  _T_1541; 
  wire  _T_1543; 
  wire [39:0] _T_1546; 
  wire [7:0] _T_1551; 
  wire  _T_1552; 
  wire  _T_1553; 
  wire  _T_1554; 
  wire  _T_1555; 
  wire  _T_1556; 
  wire  _T_1557; 
  wire  _T_1558; 
  wire  _T_1559; 
  wire [1:0] _T_1568; 
  wire [1:0] _T_1569; 
  wire [3:0] _T_1570; 
  wire [1:0] _T_1571; 
  wire [1:0] _T_1572; 
  wire [3:0] _T_1573; 
  wire [1:0] _GEN_324; 
  wire [1:0] _T_1751; 
  wire  _T_1752; 
  wire  a_source; 
  wire [39:0] _GEN_325; 
  wire [39:0] acquire_address; 
  wire [1:0] a_size; 
  wire [2:0] _T_1814; 
  wire [1:0] _T_1815; 
  wire [3:0] _T_1816; 
  wire [2:0] _T_1817; 
  wire [2:0] _T_1818; 
  wire  _T_1819; 
  wire  _T_1820; 
  wire  _T_1821; 
  wire  _T_1822; 
  wire  _T_1824; 
  wire  _T_1825; 
  wire  _T_1827; 
  wire  _T_1828; 
  wire  _T_1829; 
  wire  _T_1830; 
  wire  _T_1831; 
  wire  _T_1832; 
  wire  _T_1833; 
  wire  _T_1834; 
  wire  _T_1835; 
  wire  _T_1836; 
  wire  _T_1837; 
  wire  _T_1838; 
  wire  _T_1839; 
  wire  _T_1840; 
  wire  _T_1841; 
  wire  _T_1842; 
  wire  _T_1843; 
  wire  _T_1844; 
  wire  _T_1845; 
  wire  _T_1846; 
  wire  _T_1847; 
  wire  _T_1848; 
  wire  _T_1849; 
  wire  _T_1850; 
  wire  _T_1851; 
  wire  _T_1852; 
  wire  _T_1853; 
  wire  _T_1854; 
  wire  _T_1855; 
  wire  _T_1856; 
  wire  _T_1857; 
  wire  _T_1858; 
  wire  _T_1859; 
  wire  _T_1860; 
  wire  _T_1861; 
  wire  _T_1862; 
  wire  _T_1863; 
  wire  _T_1864; 
  wire  _T_1865; 
  wire  _T_1866; 
  wire  _T_1867; 
  wire  _T_1868; 
  wire  _T_1869; 
  wire  _T_1870; 
  wire [1:0] _T_1871; 
  wire [1:0] _T_1872; 
  wire [3:0] _T_1873; 
  wire [1:0] _T_1874; 
  wire [1:0] _T_1875; 
  wire [3:0] _T_1876; 
  wire [7:0] get_mask; 
  wire  _T_3100; 
  wire [2:0] _T_3101_opcode; 
  wire [2:0] _T_3101_param; 
  wire [2:0] _T_3101_size; 
  wire  _T_3101_source; 
  wire [37:0] _T_3035_address; 
  wire [37:0] _T_3101_address; 
  wire [7:0] _T_3101_mask; 
  wire [63:0] _T_3101_data; 
  wire  _T_3102; 
  wire [2:0] _T_3103_opcode; 
  wire [2:0] _T_3103_param; 
  wire [2:0] _T_3103_size; 
  wire  _T_3103_source; 
  wire [37:0] _T_3103_address; 
  wire [7:0] _T_3103_mask; 
  wire [63:0] _T_3103_data; 
  wire  _T_3104; 
  wire [2:0] _T_3105_opcode; 
  wire [2:0] _T_3105_param; 
  wire [2:0] _T_3105_size; 
  wire  _T_3105_source; 
  wire [37:0] _T_3105_address; 
  wire [7:0] _T_3105_mask; 
  wire [63:0] _T_3105_data; 
  wire  _T_3106; 
  wire [2:0] _T_3107_opcode; 
  wire [2:0] _T_3107_param; 
  wire [2:0] _T_3107_size; 
  wire  _T_3107_source; 
  wire [37:0] _T_3107_address; 
  wire [7:0] _T_3107_mask; 
  wire [63:0] _T_3107_data; 
  wire  _T_3108; 
  wire [2:0] _T_3109_opcode; 
  wire [2:0] _T_3109_param; 
  wire [2:0] _T_3109_size; 
  wire  _T_3109_source; 
  wire [37:0] _T_3109_address; 
  wire [7:0] _T_3109_mask; 
  wire [63:0] _T_3109_data; 
  wire  _T_3110; 
  wire [2:0] _T_3111_opcode; 
  wire [2:0] _T_3111_param; 
  wire [2:0] _T_3111_size; 
  wire  _T_3111_source; 
  wire [37:0] _T_3111_address; 
  wire [7:0] _T_3111_mask; 
  wire [63:0] _T_3111_data; 
  wire  _T_3112; 
  wire [2:0] _T_3113_opcode; 
  wire [2:0] _T_3113_param; 
  wire [2:0] _T_3113_size; 
  wire  _T_3113_source; 
  wire [37:0] _T_3113_address; 
  wire [7:0] _T_3113_mask; 
  wire [63:0] _T_3113_data; 
  wire  _T_3114; 
  wire [2:0] _T_3115_opcode; 
  wire [2:0] _T_3115_param; 
  wire [2:0] _T_3115_size; 
  wire  _T_3115_source; 
  wire [37:0] _T_3115_address; 
  wire [7:0] _T_3115_mask; 
  wire [63:0] _T_3115_data; 
  wire  _T_3116; 
  wire [2:0] atomics_opcode; 
  wire [2:0] atomics_param; 
  wire [2:0] atomics_size; 
  wire  atomics_source; 
  wire [37:0] atomics_address; 
  wire [7:0] atomics_mask; 
  wire [63:0] atomics_data; 
  wire  _T_3120; 
  wire  _T_3121; 
  wire  tl_out_a_valid; 
  wire  _T_3252; 
  wire  _T_3253; 
  wire [2:0] _T_3254_opcode; 
  wire [2:0] _T_3254_param; 
  wire [2:0] _T_3254_size; 
  wire  _T_3254_source; 
  wire [37:0] _T_3254_address; 
  wire [7:0] _T_3254_mask; 
  wire [63:0] _T_3254_data; 
  wire [2:0] _T_3255_opcode; 
  wire [2:0] _T_3255_param; 
  wire [2:0] _T_3255_size; 
  wire  _T_3255_source; 
  wire [37:0] _T_3255_address; 
  wire [7:0] _T_3255_mask; 
  wire [63:0] _T_3255_data; 
  wire [2:0] _T_3187_param; 
  wire [37:0] _T_3187_address; 
  wire [1:0] _T_3258; 
  wire  a_sel; 
  wire  _T_3260; 
  wire [4:0] _T_3272; 
  wire [4:0] _T_3273; 
  wire [3:0] _T_3274; 
  wire  d_done; 
  wire [3:0] _T_3277; 
  wire [3:0] _T_3278; 
  wire [6:0] _GEN_327; 
  wire [6:0] d_address_inc; 
  wire  grantIsVoluntary; 
  wire [3:0] _T_3289; 
  wire [3:0] _T_3290; 
  wire [2:0] _T_3291; 
  wire  _T_3298; 
  wire  _T_3299; 
  wire [1:0] _T_3301; 
  wire  d_sel; 
  wire  _T_3305; 
  wire  _T_3307; 
  wire  _T_3308; 
  wire [34:0] _T_3310; 
  wire [37:0] _GEN_328; 
  wire [37:0] dontCareBits; 
  wire [2:0] _T_3311; 
  wire [37:0] _GEN_329; 
  wire [37:0] _T_3312; 
  wire  _T_3314; 
  wire  _T_3315; 
  wire  _T_3316; 
  wire  _T_3317; 
  wire  tl_out__e_valid; 
  wire  _T_3321; 
  wire  _T_3323; 
  wire  _T_3324; 
  wire  _T_3325; 
  wire  _T_3327; 
  wire  _T_3328; 
  wire  _T_3329; 
  wire [33:0] _T_3333; 
  wire [39:0] _GEN_330; 
  wire [39:0] _T_3334; 
  wire [39:0] _GEN_331; 
  wire [39:0] _T_3335; 
  wire  _T_3338; 
  wire  _T_3339; 
  wire [3:0] _T_3397; 
  wire  _T_3406; 
  wire [1:0] _T_3407; 
  wire  _T_3408; 
  wire [1:0] _T_3409; 
  wire  _T_3410; 
  wire [1:0] _T_3411; 
  wire  _T_3412; 
  wire [1:0] _T_3413; 
  wire  _GEN_170; 
  wire  _GEN_171; 
  wire  _GEN_172; 
  wire  _T_3429; 
  wire  _T_3430; 
  wire [5:0] _T_3437; 
  wire [1:0] _T_3438; 
  wire [39:0] _T_3439; 
  wire [4:0] _T_3450; 
  wire [4:0] _T_3451; 
  wire [3:0] _T_3452; 
  wire  c_first; 
  wire [3:0] _T_3455; 
  wire [3:0] c_count; 
  wire  _T_3457; 
  wire  releaseRejected; 
  reg  s1_release_data_valid; 
  reg [31:0] _RAND_70;
  wire  _T_3460; 
  wire [4:0] _T_3463; 
  wire [1:0] _T_3464; 
  wire [1:0] _GEN_332; 
  wire [1:0] _T_3466; 
  wire [1:0] _T_3467; 
  wire [4:0] _GEN_333; 
  wire [4:0] releaseDataBeat; 
  wire  _T_3493; 
  wire  _T_3494; 
  wire  _T_3497; 
  wire  _T_3499; 
  wire  _T_3500; 
  wire [5:0] _T_3501; 
  wire [31:0] _T_3502; 
  wire [37:0] _GEN_334; 
  wire [37:0] res_2_address; 
  wire [2:0] _GEN_180; 
  wire [2:0] _T_3507; 
  wire [2:0] _T_3509; 
  wire [2:0] _GEN_191; 
  wire [2:0] _GEN_197; 
  wire [2:0] _GEN_199; 
  wire [2:0] _GEN_202; 
  wire [2:0] _GEN_220; 
  wire [2:0] _GEN_223; 
  wire  _T_3510; 
  wire [39:0] _T_3513; 
  wire [2:0] _GEN_230; 
  wire [2:0] _GEN_235; 
  wire [2:0] _GEN_237; 
  wire [2:0] _GEN_239; 
  wire [2:0] _GEN_243; 
  wire [2:0] _GEN_252; 
  wire  _T_3583; 
  wire [1:0] newCoh_state; 
  wire  _T_3585; 
  wire [11:0] _GEN_342; 
  wire [11:0] _T_3588; 
  wire [2:0] _T_3589; 
  wire [5:0] _GEN_343; 
  wire [5:0] _T_3590; 
  wire [11:0] _GEN_344; 
  wire  _T_3595; 
  wire [11:0] _T_3599; 
  wire [25:0] _T_3601; 
  wire  _T_3605; 
  wire  _T_3610; 
  wire  _T_3611; 
  wire  _T_3613; 
  reg  _T_3617; 
  reg [31:0] _RAND_71;
  reg  _T_3619_pf_ld; 
  reg [31:0] _RAND_72;
  reg  _T_3619_pf_st; 
  reg [31:0] _RAND_73;
  reg  _T_3619_ae_ld; 
  reg [31:0] _RAND_74;
  reg  _T_3619_ae_st; 
  reg [31:0] _RAND_75;
  reg  _T_3619_ma_ld; 
  reg [31:0] _RAND_76;
  reg  _T_3619_ma_st; 
  reg [31:0] _RAND_77;
  reg  doUncachedResp; 
  reg [31:0] _RAND_78;
  wire  _T_3646; 
  wire  _T_3647; 
  wire  _T_3649; 
  wire  _T_3650; 
  wire [31:0] _T_3653; 
  wire [31:0] _T_3654; 
  wire [31:0] _T_3655; 
  wire  _T_3658; 
  wire  _T_3660; 
  wire  _T_3661; 
  wire [31:0] _T_3663; 
  wire [31:0] _T_3665; 
  wire [63:0] _T_3666; 
  wire [15:0] _T_3668; 
  wire [15:0] _T_3669; 
  wire [15:0] _T_3670; 
  wire  _T_3673; 
  wire  _T_3675; 
  wire  _T_3676; 
  wire [47:0] _T_3678; 
  wire [47:0] _T_3679; 
  wire [47:0] _T_3680; 
  wire [63:0] _T_3681; 
  wire [7:0] _T_3683; 
  wire [7:0] _T_3684; 
  wire [7:0] _T_3685; 
  wire [7:0] _T_3687; 
  wire  _T_3688; 
  wire  _T_3689; 
  wire  _T_3690; 
  wire  _T_3691; 
  wire [55:0] _T_3693; 
  wire [55:0] _T_3694; 
  wire [55:0] _T_3695; 
  wire [63:0] _T_3696; 
  wire [63:0] _GEN_345; 
  reg  resetting; 
  reg [31:0] _RAND_79;
  reg  _T_3716; 
  reg [31:0] _RAND_80;
  reg [7:0] flushCounter; 
  reg [31:0] _RAND_81;
  wire [8:0] flushCounterNext; 
  wire [2:0] _T_3720; 
  wire  flushDone; 
  wire  _T_3721; 
  wire  _T_3722; 
  wire  _T_3737; 
  wire  _T_3739; 
  wire  _T_3741; 
  wire  _T_3743; 
  wire [11:0] _GEN_346; 
  wire [11:0] _T_3748; 
  wire [8:0] _GEN_295; 
  wire  _T_3757; 
  wire  _T_3758; 
  wire  _T_3759; 
  wire  _T_3760; 
  wire  _T_3761; 
  wire  _T_3762; 
  wire  _T_3763; 
  wire  _T_3764; 
  wire  _T_3765; 
  wire  _T_3767; 
  wire  _T_3768; 
  wire  _T_3772; 
  wire  _T_3773; 
  wire  _T_3775; 
  wire  _T_3777; 
  wire  _T_3842; 
  wire  _GEN_351; 
  wire  _GEN_354; 
  wire  _GEN_355; 
  wire  _GEN_356; 
  wire  _GEN_363; 
  wire  _GEN_364; 
  wire  _GEN_365; 
  reg [5:0] tag_array_0_s1_meta_addr_pipe_0;
  reg [31:0] _RAND_82;
  reg [5:0] tag_array_1_s1_meta_addr_pipe_0;
  reg [31:0] _RAND_83;
  reg [5:0] tag_array_2_s1_meta_addr_pipe_0;
  reg [31:0] _RAND_84;
  reg [5:0] tag_array_3_s1_meta_addr_pipe_0;
  reg [31:0] _RAND_85;
  Arbiter metaArb ( 
    .io_in_0_valid(metaArb_io_in_0_valid),
    .io_in_0_bits_addr(metaArb_io_in_0_bits_addr),
    .io_in_0_bits_idx(metaArb_io_in_0_bits_idx),
    .io_in_0_bits_data(metaArb_io_in_0_bits_data),
    .io_in_2_valid(metaArb_io_in_2_valid),
    .io_in_2_bits_write(metaArb_io_in_2_bits_write),
    .io_in_2_bits_addr(metaArb_io_in_2_bits_addr),
    .io_in_2_bits_idx(metaArb_io_in_2_bits_idx),
    .io_in_2_bits_way_en(metaArb_io_in_2_bits_way_en),
    .io_in_2_bits_data(metaArb_io_in_2_bits_data),
    .io_in_3_valid(metaArb_io_in_3_valid),
    .io_in_3_bits_addr(metaArb_io_in_3_bits_addr),
    .io_in_3_bits_idx(metaArb_io_in_3_bits_idx),
    .io_in_3_bits_way_en(metaArb_io_in_3_bits_way_en),
    .io_in_3_bits_data(metaArb_io_in_3_bits_data),
    .io_in_4_ready(metaArb_io_in_4_ready),
    .io_in_4_valid(metaArb_io_in_4_valid),
    .io_in_4_bits_addr(metaArb_io_in_4_bits_addr),
    .io_in_4_bits_idx(metaArb_io_in_4_bits_idx),
    .io_in_4_bits_way_en(metaArb_io_in_4_bits_way_en),
    .io_in_4_bits_data(metaArb_io_in_4_bits_data),
    .io_in_5_ready(metaArb_io_in_5_ready),
    // .io_in_5_valid(metaArb_io_in_5_valid),   // for lint 
    // .io_in_5_bits_addr(metaArb_io_in_5_bits_addr),
    // .io_in_5_bits_idx(metaArb_io_in_5_bits_idx),
    .io_in_6_ready(metaArb_io_in_6_ready),
    .io_in_6_valid(metaArb_io_in_6_valid),
    .io_in_6_bits_addr(metaArb_io_in_6_bits_addr),
    .io_in_6_bits_idx(metaArb_io_in_6_bits_idx),
    .io_in_6_bits_way_en(metaArb_io_in_6_bits_way_en),
    .io_in_6_bits_data(metaArb_io_in_6_bits_data),
    .io_in_7_ready(metaArb_io_in_7_ready),
    .io_in_7_valid(metaArb_io_in_7_valid),
    .io_in_7_bits_addr(metaArb_io_in_7_bits_addr),
    .io_in_7_bits_idx(metaArb_io_in_7_bits_idx),
    .io_in_7_bits_way_en(metaArb_io_in_7_bits_way_en),
    .io_in_7_bits_data(metaArb_io_in_7_bits_data),
    .io_out_ready(metaArb_io_out_ready),
    .io_out_valid(metaArb_io_out_valid),
    .io_out_bits_write(metaArb_io_out_bits_write),
    .io_out_bits_addr(metaArb_io_out_bits_addr),
    .io_out_bits_idx(metaArb_io_out_bits_idx),
    .io_out_bits_way_en(metaArb_io_out_bits_way_en),
    .io_out_bits_data(metaArb_io_out_bits_data)
  );
  DCacheDataArray data ( 
    .clock(data_clock),
    .io_req_valid(data_io_req_valid),
    .io_req_bits_addr(data_io_req_bits_addr),
    .io_req_bits_write(data_io_req_bits_write),
    .io_req_bits_wdata(data_io_req_bits_wdata),
    .io_req_bits_eccMask(data_io_req_bits_eccMask),
    .io_req_bits_way_en(data_io_req_bits_way_en),
    .io_resp_0(data_io_resp_0),
    .io_resp_1(data_io_resp_1),
    .io_resp_2(data_io_resp_2),
    .io_resp_3(data_io_resp_3)
  );
  Arbiter_1 dataArb ( 
    .io_in_0_valid(dataArb_io_in_0_valid),
    .io_in_0_bits_addr(dataArb_io_in_0_bits_addr),
    .io_in_0_bits_write(dataArb_io_in_0_bits_write),
    .io_in_0_bits_wdata(dataArb_io_in_0_bits_wdata),
    .io_in_0_bits_eccMask(dataArb_io_in_0_bits_eccMask),
    .io_in_0_bits_way_en(dataArb_io_in_0_bits_way_en),
    .io_in_1_ready(dataArb_io_in_1_ready),
    .io_in_1_valid(dataArb_io_in_1_valid),
    .io_in_1_bits_addr(dataArb_io_in_1_bits_addr),
    .io_in_1_bits_write(dataArb_io_in_1_bits_write),
    .io_in_1_bits_wdata(dataArb_io_in_1_bits_wdata),
    .io_in_1_bits_eccMask(dataArb_io_in_1_bits_eccMask),
    .io_in_1_bits_way_en(dataArb_io_in_1_bits_way_en),
    .io_in_2_ready(dataArb_io_in_2_ready),
    .io_in_2_valid(dataArb_io_in_2_valid),
    .io_in_2_bits_addr(dataArb_io_in_2_bits_addr),
    .io_in_2_bits_wdata(dataArb_io_in_2_bits_wdata),
    .io_in_2_bits_eccMask(dataArb_io_in_2_bits_eccMask),
    .io_in_3_ready(dataArb_io_in_3_ready),
    .io_in_3_valid(dataArb_io_in_3_valid),
    .io_in_3_bits_addr(dataArb_io_in_3_bits_addr),
    .io_in_3_bits_wdata(dataArb_io_in_3_bits_wdata),
    .io_in_3_bits_eccMask(dataArb_io_in_3_bits_eccMask),
    .io_out_valid(dataArb_io_out_valid),
    .io_out_bits_addr(dataArb_io_out_bits_addr),
    .io_out_bits_write(dataArb_io_out_bits_write),
    .io_out_bits_wdata(dataArb_io_out_bits_wdata),
    .io_out_bits_eccMask(dataArb_io_out_bits_eccMask),
    .io_out_bits_way_en(dataArb_io_out_bits_way_en)
  );
  TLB tlb ( 
    .clock(tlb_clock),
    .reset(tlb_reset),
    .io_req_ready(tlb_io_req_ready),
    .io_req_valid(tlb_io_req_valid),
    .io_req_bits_vaddr(tlb_io_req_bits_vaddr),
    .io_req_bits_passthrough(tlb_io_req_bits_passthrough),
    .io_req_bits_size(tlb_io_req_bits_size),
    .io_req_bits_cmd(tlb_io_req_bits_cmd),
    .io_resp_miss(tlb_io_resp_miss),
    .io_resp_paddr(tlb_io_resp_paddr),
    .io_resp_pf_ld(tlb_io_resp_pf_ld),
    .io_resp_pf_st(tlb_io_resp_pf_st),
    .io_resp_ae_ld(tlb_io_resp_ae_ld),
    .io_resp_ae_st(tlb_io_resp_ae_st),
    .io_resp_ma_ld(tlb_io_resp_ma_ld),
    .io_resp_ma_st(tlb_io_resp_ma_st),
    .io_resp_cacheable(tlb_io_resp_cacheable),
    .io_sfence_valid(tlb_io_sfence_valid),
    .io_sfence_bits_rs1(tlb_io_sfence_bits_rs1),
    .io_sfence_bits_rs2(tlb_io_sfence_bits_rs2),
    .io_sfence_bits_addr(tlb_io_sfence_bits_addr),
    .io_ptw_req_ready(tlb_io_ptw_req_ready),
    .io_ptw_req_valid(tlb_io_ptw_req_valid),
    .io_ptw_req_bits_valid(tlb_io_ptw_req_bits_valid),
    .io_ptw_req_bits_bits_addr(tlb_io_ptw_req_bits_bits_addr),
    .io_ptw_resp_valid(tlb_io_ptw_resp_valid),
    .io_ptw_resp_bits_ae(tlb_io_ptw_resp_bits_ae),
    .io_ptw_resp_bits_pte_ppn(tlb_io_ptw_resp_bits_pte_ppn),
    .io_ptw_resp_bits_pte_d(tlb_io_ptw_resp_bits_pte_d),
    .io_ptw_resp_bits_pte_a(tlb_io_ptw_resp_bits_pte_a),
    .io_ptw_resp_bits_pte_g(tlb_io_ptw_resp_bits_pte_g),
    .io_ptw_resp_bits_pte_u(tlb_io_ptw_resp_bits_pte_u),
    .io_ptw_resp_bits_pte_x(tlb_io_ptw_resp_bits_pte_x),
    .io_ptw_resp_bits_pte_w(tlb_io_ptw_resp_bits_pte_w),
    .io_ptw_resp_bits_pte_r(tlb_io_ptw_resp_bits_pte_r),
    .io_ptw_resp_bits_pte_v(tlb_io_ptw_resp_bits_pte_v),
    .io_ptw_resp_bits_level(tlb_io_ptw_resp_bits_level),
    .io_ptw_resp_bits_fragmented_superpage(tlb_io_ptw_resp_bits_fragmented_superpage),
    .io_ptw_resp_bits_homogeneous(tlb_io_ptw_resp_bits_homogeneous),
    .io_ptw_ptbr_mode(tlb_io_ptw_ptbr_mode),
    .io_ptw_status_dprv(tlb_io_ptw_status_dprv),
    .io_ptw_status_mxr(tlb_io_ptw_status_mxr),
    .io_ptw_status_sum(tlb_io_ptw_status_sum),
    .io_ptw_pmp_0_cfg_l(tlb_io_ptw_pmp_0_cfg_l),
    .io_ptw_pmp_0_cfg_a(tlb_io_ptw_pmp_0_cfg_a),
    .io_ptw_pmp_0_cfg_x(tlb_io_ptw_pmp_0_cfg_x),
    .io_ptw_pmp_0_cfg_w(tlb_io_ptw_pmp_0_cfg_w),
    .io_ptw_pmp_0_cfg_r(tlb_io_ptw_pmp_0_cfg_r),
    .io_ptw_pmp_0_addr(tlb_io_ptw_pmp_0_addr),
    .io_ptw_pmp_0_mask(tlb_io_ptw_pmp_0_mask),
    .io_ptw_pmp_1_cfg_l(tlb_io_ptw_pmp_1_cfg_l),
    .io_ptw_pmp_1_cfg_a(tlb_io_ptw_pmp_1_cfg_a),
    .io_ptw_pmp_1_cfg_x(tlb_io_ptw_pmp_1_cfg_x),
    .io_ptw_pmp_1_cfg_w(tlb_io_ptw_pmp_1_cfg_w),
    .io_ptw_pmp_1_cfg_r(tlb_io_ptw_pmp_1_cfg_r),
    .io_ptw_pmp_1_addr(tlb_io_ptw_pmp_1_addr),
    .io_ptw_pmp_1_mask(tlb_io_ptw_pmp_1_mask),
    .io_ptw_pmp_2_cfg_l(tlb_io_ptw_pmp_2_cfg_l),
    .io_ptw_pmp_2_cfg_a(tlb_io_ptw_pmp_2_cfg_a),
    .io_ptw_pmp_2_cfg_x(tlb_io_ptw_pmp_2_cfg_x),
    .io_ptw_pmp_2_cfg_w(tlb_io_ptw_pmp_2_cfg_w),
    .io_ptw_pmp_2_cfg_r(tlb_io_ptw_pmp_2_cfg_r),
    .io_ptw_pmp_2_addr(tlb_io_ptw_pmp_2_addr),
    .io_ptw_pmp_2_mask(tlb_io_ptw_pmp_2_mask),
    .io_ptw_pmp_3_cfg_l(tlb_io_ptw_pmp_3_cfg_l),
    .io_ptw_pmp_3_cfg_a(tlb_io_ptw_pmp_3_cfg_a),
    .io_ptw_pmp_3_cfg_x(tlb_io_ptw_pmp_3_cfg_x),
    .io_ptw_pmp_3_cfg_w(tlb_io_ptw_pmp_3_cfg_w),
    .io_ptw_pmp_3_cfg_r(tlb_io_ptw_pmp_3_cfg_r),
    .io_ptw_pmp_3_addr(tlb_io_ptw_pmp_3_addr),
    .io_ptw_pmp_3_mask(tlb_io_ptw_pmp_3_mask),
    .io_ptw_pmp_4_cfg_l(tlb_io_ptw_pmp_4_cfg_l),
    .io_ptw_pmp_4_cfg_a(tlb_io_ptw_pmp_4_cfg_a),
    .io_ptw_pmp_4_cfg_x(tlb_io_ptw_pmp_4_cfg_x),
    .io_ptw_pmp_4_cfg_w(tlb_io_ptw_pmp_4_cfg_w),
    .io_ptw_pmp_4_cfg_r(tlb_io_ptw_pmp_4_cfg_r),
    .io_ptw_pmp_4_addr(tlb_io_ptw_pmp_4_addr),
    .io_ptw_pmp_4_mask(tlb_io_ptw_pmp_4_mask),
    .io_ptw_pmp_5_cfg_l(tlb_io_ptw_pmp_5_cfg_l),
    .io_ptw_pmp_5_cfg_a(tlb_io_ptw_pmp_5_cfg_a),
    .io_ptw_pmp_5_cfg_x(tlb_io_ptw_pmp_5_cfg_x),
    .io_ptw_pmp_5_cfg_w(tlb_io_ptw_pmp_5_cfg_w),
    .io_ptw_pmp_5_cfg_r(tlb_io_ptw_pmp_5_cfg_r),
    .io_ptw_pmp_5_addr(tlb_io_ptw_pmp_5_addr),
    .io_ptw_pmp_5_mask(tlb_io_ptw_pmp_5_mask),
    .io_ptw_pmp_6_cfg_l(tlb_io_ptw_pmp_6_cfg_l),
    .io_ptw_pmp_6_cfg_a(tlb_io_ptw_pmp_6_cfg_a),
    .io_ptw_pmp_6_cfg_x(tlb_io_ptw_pmp_6_cfg_x),
    .io_ptw_pmp_6_cfg_w(tlb_io_ptw_pmp_6_cfg_w),
    .io_ptw_pmp_6_cfg_r(tlb_io_ptw_pmp_6_cfg_r),
    .io_ptw_pmp_6_addr(tlb_io_ptw_pmp_6_addr),
    .io_ptw_pmp_6_mask(tlb_io_ptw_pmp_6_mask),
    .io_ptw_pmp_7_cfg_l(tlb_io_ptw_pmp_7_cfg_l),
    .io_ptw_pmp_7_cfg_a(tlb_io_ptw_pmp_7_cfg_a),
    .io_ptw_pmp_7_cfg_x(tlb_io_ptw_pmp_7_cfg_x),
    .io_ptw_pmp_7_cfg_w(tlb_io_ptw_pmp_7_cfg_w),
    .io_ptw_pmp_7_cfg_r(tlb_io_ptw_pmp_7_cfg_r),
    .io_ptw_pmp_7_addr(tlb_io_ptw_pmp_7_addr),
    .io_ptw_pmp_7_mask(tlb_io_ptw_pmp_7_mask),
    .io_kill(tlb_io_kill)
  );
  AMOALU amoalu ( 
    .io_mask(amoalu_io_mask),
    .io_cmd(amoalu_io_cmd),
    .io_lhs(amoalu_io_lhs),
    .io_rhs(amoalu_io_rhs),
    .io_out(amoalu_io_out)
  );
  assign tag_array_0_s1_meta_addr = tag_array_0_s1_meta_addr_pipe_0;
  assign tag_array_0_s1_meta_data = tag_array_0[tag_array_0_s1_meta_addr]; 
  assign tag_array_0__T_553_data = metaArb_io_out_bits_data;
  assign tag_array_0__T_553_addr = metaArb_io_out_bits_idx;
  assign tag_array_0__T_553_mask = metaArb_io_out_bits_way_en[0];
  assign tag_array_0__T_553_en = metaArb_io_out_valid & metaArb_io_out_bits_write;
  assign tag_array_1_s1_meta_addr = tag_array_1_s1_meta_addr_pipe_0;
  assign tag_array_1_s1_meta_data = tag_array_1[tag_array_1_s1_meta_addr]; 
  assign tag_array_1__T_553_data = metaArb_io_out_bits_data;
  assign tag_array_1__T_553_addr = metaArb_io_out_bits_idx;
  assign tag_array_1__T_553_mask = metaArb_io_out_bits_way_en[1];
  assign tag_array_1__T_553_en = metaArb_io_out_valid & metaArb_io_out_bits_write;
  assign tag_array_2_s1_meta_addr = tag_array_2_s1_meta_addr_pipe_0;
  assign tag_array_2_s1_meta_data = tag_array_2[tag_array_2_s1_meta_addr]; 
  assign tag_array_2__T_553_data = metaArb_io_out_bits_data;
  assign tag_array_2__T_553_addr = metaArb_io_out_bits_idx;
  assign tag_array_2__T_553_mask = metaArb_io_out_bits_way_en[2];
  assign tag_array_2__T_553_en = metaArb_io_out_valid & metaArb_io_out_bits_write;
  assign tag_array_3_s1_meta_addr = tag_array_3_s1_meta_addr_pipe_0;
  assign tag_array_3_s1_meta_data = tag_array_3[tag_array_3_s1_meta_addr]; 
  assign tag_array_3__T_553_data = metaArb_io_out_bits_data;
  assign tag_array_3__T_553_addr = metaArb_io_out_bits_idx;
  assign tag_array_3__T_553_mask = metaArb_io_out_bits_way_en[3];
  assign tag_array_3__T_553_en = metaArb_io_out_valid & metaArb_io_out_bits_write;
  assign _T_235 = lfsr[0]; 
  assign _T_236 = lfsr[2]; 
  assign _T_237 = _T_235 ^ _T_236; 
  assign _T_238 = lfsr[3]; 
  assign _T_239 = _T_237 ^ _T_238; 
  assign _T_240 = lfsr[5]; 
  assign _T_241 = _T_239 ^ _T_240; 
  assign _T_242 = lfsr[15:1]; 
  assign _T_243 = {_T_241,_T_242}; 
  assign grantIsUncachedData = auto_out_d_bits_opcode == 3'h1; 
  assign _T_3420 = blockUncachedGrant | s1_valid; 
  assign _T_3421 = grantIsUncachedData & _T_3420; 
  assign grantIsRefill = auto_out_d_bits_opcode == 3'h5; 
  assign _T_3331 = dataArb_io_in_1_ready == 1'h0; 
  assign _T_3332 = grantIsRefill & _T_3331; 
  assign _T_3284 = auto_out_d_bits_opcode == 3'h4; 
  assign grantIsCached = _T_3284 | grantIsRefill; 
  assign d_first = _T_3271 == 4'h0; 
  assign _T_3292 = d_first == 1'h0; 
  assign _T_3293 = _T_3292 | auto_out_e_ready; 
  assign _T_3295 = grantIsCached ? _T_3293 : 1'h1; 
  assign _GEN_169 = _T_3332 ? 1'h0 : _T_3295; 
  assign tl_out__d_ready = _T_3421 ? 1'h0 : _GEN_169; 
  assign _T_3296 = tl_out__d_ready & auto_out_d_valid; 
  assign _T_3275 = _T_3271 == 4'h1; 
  assign _T_3268 = auto_out_d_bits_opcode[0]; 
  assign _T_3264 = 14'h7f << auto_out_d_bits_size; 
  assign _T_3265 = _T_3264[6:0]; 
  assign _T_3266 = ~ _T_3265; 
  assign _T_3267 = _T_3266[6:3]; 
  assign _T_3269 = _T_3268 ? _T_3267 : 4'h0; 
  assign _T_3276 = _T_3269 == 4'h0; 
  assign d_last = _T_3275 | _T_3276; 
  assign _GEN_147 = grantIsCached ? d_last : 1'h0; 
  assign _GEN_159 = _T_3296 ? _GEN_147 : 1'h0; 
  assign _T_256 = dataArb_io_out_bits_wdata; 
  assign _T_257 = _T_256[7:0]; 
  assign _T_258 = _T_256[15:8]; 
  assign _T_259 = _T_256[23:16]; 
  assign _T_260 = _T_256[31:24]; 
  assign _T_261 = _T_256[39:32]; 
  assign _T_262 = _T_256[47:40]; 
  assign _T_263 = _T_256[55:48]; 
  assign _T_264 = _T_256[63:56]; 
  assign _T_265 = {_T_258,_T_257}; 
  assign _T_266 = {_T_260,_T_259}; 
  assign _T_267 = {_T_266,_T_265}; 
  assign _T_268 = {_T_262,_T_261}; 
  assign _T_269 = {_T_264,_T_263}; 
  assign _T_270 = {_T_269,_T_268}; 
  assign _T_274 = io_cpu_req_ready & io_cpu_req_valid; 
  assign _T_720 = s1_probe | s2_probe; 
  assign _T_721 = release_state != 3'h0; 
  assign releaseInFlight = _T_720 | _T_721; 
  assign _T_3425 = releaseInFlight | grantInProgress; 
  assign _T_3426 = blockProbeAfterGrantCount > 3'h0; 
  assign _T_3427 = _T_3425 | _T_3426; 
  assign lrscValid = lrscCount > 7'h3; 
  assign block_probe = _T_3427 | lrscValid; 
  assign _T_3431 = block_probe == 1'h0; 
  assign _T_3432 = metaArb_io_in_6_ready & _T_3431; 
  assign _T_3433 = s1_valid == 1'h0; 
  assign _T_3434 = _T_3432 & _T_3433; 
  assign _T_714 = {io_cpu_s2_xcpt_ma_ld,io_cpu_s2_xcpt_ma_st}; 
  assign _T_715 = {_T_714,io_cpu_s2_xcpt_pf_ld}; 
  assign _T_712 = {io_cpu_s2_xcpt_pf_st,io_cpu_s2_xcpt_ae_ld}; 
  assign _T_713 = {_T_712,io_cpu_s2_xcpt_ae_st}; 
  assign _T_716 = {_T_715,_T_713}; 
  assign _T_717 = _T_716 != 6'h0; 
  assign _T_718 = _T_717 == 1'h0; 
  assign s2_valid = s2_valid_pre_xcpt & _T_718; 
  assign _T_3435 = s2_valid == 1'h0; 
  assign tl_out__b_ready = _T_3434 & _T_3435; 
  assign _T_276 = tl_out__b_ready & auto_out_b_valid; 
  assign _T_281 = io_cpu_s1_kill == 1'h0; 
  assign s1_valid_masked = s1_valid & _T_281; 
  assign _T_1055 = {probe_bits_param,s2_probe_state_state}; 
  assign _T_1112 = 4'h3 == _T_1055; 
  assign _T_1108 = 4'h2 == _T_1055; 
  assign _T_1104 = 4'h1 == _T_1055; 
  assign _T_1100 = 4'h0 == _T_1055; 
  assign _T_1096 = 4'h7 == _T_1055; 
  assign _T_1092 = 4'h6 == _T_1055; 
  assign _T_1088 = 4'h5 == _T_1055; 
  assign _T_1084 = 4'h4 == _T_1055; 
  assign _T_1080 = 4'hb == _T_1055; 
  assign _T_1076 = 4'ha == _T_1055; 
  assign _T_1072 = 4'h9 == _T_1055; 
  assign _T_1068 = 4'h8 == _T_1055; 
  assign _T_1085 = _T_1084 ? 1'h0 : _T_1080; 
  assign _T_1089 = _T_1088 ? 1'h0 : _T_1085; 
  assign _T_1093 = _T_1092 ? 1'h0 : _T_1089; 
  assign _T_1097 = _T_1096 ? 1'h1 : _T_1093; 
  assign _T_1101 = _T_1100 ? 1'h0 : _T_1097; 
  assign _T_1105 = _T_1104 ? 1'h0 : _T_1101; 
  assign _T_1109 = _T_1108 ? 1'h0 : _T_1105; 
  assign s2_prb_ack_data = _T_1112 ? 1'h1 : _T_1109; 
  assign _T_3506 = s2_probe_state_state > 2'h0; 
  assign _T_3453 = _T_3449 == 4'h1; 
  assign _T_3517 = release_state == 3'h1; 
  assign _T_3518 = release_state == 3'h6; 
  assign _T_3519 = _T_3517 | _T_3518; 
  assign _T_3516 = release_state == 3'h2; 
  assign _T_3515 = release_state == 3'h3; 
  assign _GEN_251 = _T_3516 ? 3'h5 : 3'h4; 
  assign tl_out__c_bits_opcode = _T_3519 ? 3'h7 : _GEN_251; 
  assign _T_3446 = tl_out__c_bits_opcode[0]; 
  assign tl_out__c_bits_size = _T_3519 ? 3'h6 : probe_bits_size; 
  assign _T_3442 = 14'h7f << tl_out__c_bits_size; 
  assign _T_3443 = _T_3442[6:0]; 
  assign _T_3444 = ~ _T_3443; 
  assign _T_3445 = _T_3444[6:3]; 
  assign _T_3447 = _T_3446 ? _T_3445 : 4'h0; 
  assign _T_3454 = _T_3447 == 4'h0; 
  assign c_last = _T_3453 | _T_3454; 
  assign _T_3514 = release_state == 3'h5; 
  assign _GEN_200 = s2_prb_ack_data ? s2_release_data_valid : 1'h1; 
  assign _GEN_221 = s2_probe ? _GEN_200 : s2_release_data_valid; 
  assign _GEN_238 = _T_3514 ? 1'h1 : _GEN_221; 
  assign tl_out__c_valid = _T_3515 ? 1'h1 : _GEN_238; 
  assign _T_3440 = auto_out_c_ready & tl_out__c_valid; 
  assign releaseDone = c_last & _T_3440; 
  assign _T_3508 = releaseDone == 1'h0; 
  assign _GEN_198 = _T_3506 ? 1'h1 : _T_3508; 
  assign probeNack = s2_prb_ack_data ? 1'h1 : _GEN_198; 
  assign _T_288 = s1_req_cmd == 5'h0; 
  assign _T_289 = s1_req_cmd == 5'h6; 
  assign _T_290 = _T_288 | _T_289; 
  assign _T_291 = s1_req_cmd == 5'h7; 
  assign _T_292 = _T_290 | _T_291; 
  assign _T_293 = s1_req_cmd == 5'h4; 
  assign _T_294 = s1_req_cmd == 5'h9; 
  assign _T_297 = _T_293 | _T_294; 
  assign _T_295 = s1_req_cmd == 5'ha; 
  assign _T_298 = _T_297 | _T_295; 
  assign _T_296 = s1_req_cmd == 5'hb; 
  assign _T_299 = _T_298 | _T_296; 
  assign _T_300 = s1_req_cmd == 5'h8; 
  assign _T_301 = s1_req_cmd == 5'hc; 
  assign _T_305 = _T_300 | _T_301; 
  assign _T_302 = s1_req_cmd == 5'hd; 
  assign _T_306 = _T_305 | _T_302; 
  assign _T_303 = s1_req_cmd == 5'he; 
  assign _T_307 = _T_306 | _T_303; 
  assign _T_304 = s1_req_cmd == 5'hf; 
  assign _T_308 = _T_307 | _T_304; 
  assign _T_309 = _T_299 | _T_308; 
  assign s1_read = _T_292 | _T_309; 
  assign s2_valid_masked = s2_valid & _T_724; 
  assign _T_735 = s2_req_cmd == 5'h0; 
  assign _T_736 = s2_req_cmd == 5'h6; 
  assign _T_737 = _T_735 | _T_736; 
  assign _T_738 = s2_req_cmd == 5'h7; 
  assign _T_739 = _T_737 | _T_738; 
  assign _T_740 = s2_req_cmd == 5'h4; 
  assign _T_741 = s2_req_cmd == 5'h9; 
  assign _T_744 = _T_740 | _T_741; 
  assign _T_742 = s2_req_cmd == 5'ha; 
  assign _T_745 = _T_744 | _T_742; 
  assign _T_743 = s2_req_cmd == 5'hb; 
  assign _T_746 = _T_745 | _T_743; 
  assign _T_747 = s2_req_cmd == 5'h8; 
  assign _T_748 = s2_req_cmd == 5'hc; 
  assign _T_752 = _T_747 | _T_748; 
  assign _T_749 = s2_req_cmd == 5'hd; 
  assign _T_753 = _T_752 | _T_749; 
  assign _T_750 = s2_req_cmd == 5'he; 
  assign _T_754 = _T_753 | _T_750; 
  assign _T_751 = s2_req_cmd == 5'hf; 
  assign _T_755 = _T_754 | _T_751; 
  assign _T_756 = _T_746 | _T_755; 
  assign s2_read = _T_739 | _T_756; 
  assign _T_757 = s2_req_cmd == 5'h1; 
  assign _T_758 = s2_req_cmd == 5'h11; 
  assign _T_759 = _T_757 | _T_758; 
  assign _T_761 = _T_759 | _T_738; 
  assign s2_write = _T_761 | _T_756; 
  assign s2_readwrite = s2_read | s2_write; 
  assign _T_1019 = s2_valid_masked & s2_readwrite; 
  assign _T_912 = s2_req_cmd == 5'h3; 
  assign _T_913 = s2_write | _T_912; 
  assign _T_915 = _T_913 | _T_736; 
  assign _T_916 = {s2_write,_T_915}; 
  assign _T_917 = {_T_916,s2_hit_state_state}; 
  assign _T_975 = 4'h3 == _T_917; 
  assign _T_972 = 4'h2 == _T_917; 
  assign _T_969 = 4'h1 == _T_917; 
  assign _T_966 = 4'h7 == _T_917; 
  assign _T_963 = 4'h6 == _T_917; 
  assign _T_960 = 4'hf == _T_917; 
  assign _T_957 = 4'he == _T_917; 
  assign _T_954 = 4'h0 == _T_917; 
  assign _T_951 = 4'h5 == _T_917; 
  assign _T_948 = 4'h4 == _T_917; 
  assign _T_945 = 4'hd == _T_917; 
  assign _T_942 = 4'hc == _T_917; 
  assign _T_961 = _T_960 ? 1'h1 : _T_957; 
  assign _T_964 = _T_963 ? 1'h1 : _T_961; 
  assign _T_967 = _T_966 ? 1'h1 : _T_964; 
  assign _T_970 = _T_969 ? 1'h1 : _T_967; 
  assign _T_973 = _T_972 ? 1'h1 : _T_970; 
  assign s2_hit = _T_975 ? 1'h1 : _T_973; 
  assign s2_valid_hit_pre_data_ecc = _T_1019 & s2_hit; 
  assign _T_1403 = s2_valid_hit_pre_data_ecc & s2_write; 
  assign _T_1240 = s2_req_addr[39:6]; 
  assign lrscAddrMatch = lrscAddr == _T_1240; 
  assign _T_1241 = lrscValid & lrscAddrMatch; 
  assign _T_1242 = _T_1241 == 1'h0; 
  assign s2_sc_fail = _T_738 & _T_1242; 
  assign _T_1404 = s2_sc_fail == 1'h0; 
  assign _T_1405 = _T_1403 & _T_1404; 
  assign pstore1_valid_pre_kill = _T_1405 | pstore1_held; 
  assign _T_1575 = pstore1_addr[11:3]; 
  assign _T_1576 = s1_req_addr[11:3]; 
  assign _T_1577 = _T_1575 == _T_1576; 
  assign _T_310 = s1_req_cmd == 5'h1; 
  assign _T_311 = s1_req_cmd == 5'h11; 
  assign _T_312 = _T_310 | _T_311; 
  assign _T_314 = _T_312 | _T_291; 
  assign s1_write = _T_314 | _T_309; 
  assign _T_1585 = pstore1_mask[7]; 
  assign _T_1584 = pstore1_mask[6]; 
  assign _T_1598 = {_T_1585,_T_1584}; 
  assign _T_1583 = pstore1_mask[5]; 
  assign _T_1582 = pstore1_mask[4]; 
  assign _T_1597 = {_T_1583,_T_1582}; 
  assign _T_1599 = {_T_1598,_T_1597}; 
  assign _T_1581 = pstore1_mask[3]; 
  assign _T_1580 = pstore1_mask[2]; 
  assign _T_1595 = {_T_1581,_T_1580}; 
  assign _T_1579 = pstore1_mask[1]; 
  assign _T_1578 = pstore1_mask[0]; 
  assign _T_1594 = {_T_1579,_T_1578}; 
  assign _T_1596 = {_T_1595,_T_1594}; 
  assign _T_1600 = {_T_1599,_T_1596}; 
  assign _T_1608 = _T_1600[7]; 
  assign _T_1607 = _T_1600[6]; 
  assign _T_1613 = {_T_1608,_T_1607}; 
  assign _T_1606 = _T_1600[5]; 
  assign _T_1605 = _T_1600[4]; 
  assign _T_1612 = {_T_1606,_T_1605}; 
  assign _T_1614 = {_T_1613,_T_1612}; 
  assign _T_1604 = _T_1600[3]; 
  assign _T_1603 = _T_1600[2]; 
  assign _T_1610 = {_T_1604,_T_1603}; 
  assign _T_1602 = _T_1600[1]; 
  assign _T_1601 = _T_1600[0]; 
  assign _T_1609 = {_T_1602,_T_1601}; 
  assign _T_1611 = {_T_1610,_T_1609}; 
  assign _T_1615 = {_T_1614,_T_1611}; 
  assign _T_701 = s1_req_addr[2]; 
  assign _T_693 = s1_req_addr[1]; 
  assign _T_685 = s1_req_addr[0]; 
  assign _T_684 = s1_req_typ[1:0]; 
  assign _T_687 = _T_684 >= 2'h1; 
  assign _T_689 = _T_685 | _T_687; 
  assign _T_691 = _T_685 ? 1'h0 : 1'h1; 
  assign _T_692 = {_T_689,_T_691}; 
  assign _T_694 = _T_693 ? _T_692 : 2'h0; 
  assign _T_695 = _T_684 >= 2'h2; 
  assign _T_696 = _T_695 ? 2'h3 : 2'h0; 
  assign _T_697 = _T_694 | _T_696; 
  assign _T_699 = _T_693 ? 2'h0 : _T_692; 
  assign _T_700 = {_T_697,_T_699}; 
  assign _T_702 = _T_701 ? _T_700 : 4'h0; 
  assign _T_703 = _T_684 >= 2'h3; 
  assign _T_704 = _T_703 ? 4'hf : 4'h0; 
  assign _T_705 = _T_702 | _T_704; 
  assign _T_707 = _T_701 ? 4'h0 : _T_700; 
  assign _T_708 = {_T_705,_T_707}; 
  assign s1_mask = _T_311 ? io_cpu_s1_data_mask : _T_708; 
  assign _T_1623 = s1_mask[7]; 
  assign _T_1622 = s1_mask[6]; 
  assign _T_1636 = {_T_1623,_T_1622}; 
  assign _T_1621 = s1_mask[5]; 
  assign _T_1620 = s1_mask[4]; 
  assign _T_1635 = {_T_1621,_T_1620}; 
  assign _T_1637 = {_T_1636,_T_1635}; 
  assign _T_1619 = s1_mask[3]; 
  assign _T_1618 = s1_mask[2]; 
  assign _T_1633 = {_T_1619,_T_1618}; 
  assign _T_1617 = s1_mask[1]; 
  assign _T_1616 = s1_mask[0]; 
  assign _T_1632 = {_T_1617,_T_1616}; 
  assign _T_1634 = {_T_1633,_T_1632}; 
  assign _T_1638 = {_T_1637,_T_1634}; 
  assign _T_1646 = _T_1638[7]; 
  assign _T_1645 = _T_1638[6]; 
  assign _T_1651 = {_T_1646,_T_1645}; 
  assign _T_1644 = _T_1638[5]; 
  assign _T_1643 = _T_1638[4]; 
  assign _T_1650 = {_T_1644,_T_1643}; 
  assign _T_1652 = {_T_1651,_T_1650}; 
  assign _T_1642 = _T_1638[3]; 
  assign _T_1641 = _T_1638[2]; 
  assign _T_1648 = {_T_1642,_T_1641}; 
  assign _T_1640 = _T_1638[1]; 
  assign _T_1639 = _T_1638[0]; 
  assign _T_1647 = {_T_1640,_T_1639}; 
  assign _T_1649 = {_T_1648,_T_1647}; 
  assign _T_1653 = {_T_1652,_T_1649}; 
  assign _T_1654 = _T_1615 & _T_1653; 
  assign _T_1655 = _T_1654 != 8'h0; 
  assign _T_1656 = pstore1_mask & s1_mask; 
  assign _T_1657 = _T_1656 != 8'h0; 
  assign _T_1658 = s1_write ? _T_1655 : _T_1657; 
  assign _T_1659 = _T_1577 & _T_1658; 
  assign _T_1660 = pstore1_valid_pre_kill & _T_1659; 
  assign _T_1661 = pstore2_addr[11:3]; 
  assign _T_1663 = _T_1661 == _T_1576; 
  assign _T_1671 = mask[7]; 
  assign _T_1670 = mask[6]; 
  assign _T_1684 = {_T_1671,_T_1670}; 
  assign _T_1669 = mask[5]; 
  assign _T_1668 = mask[4]; 
  assign _T_1683 = {_T_1669,_T_1668}; 
  assign _T_1685 = {_T_1684,_T_1683}; 
  assign _T_1667 = mask[3]; 
  assign _T_1666 = mask[2]; 
  assign _T_1681 = {_T_1667,_T_1666}; 
  assign _T_1665 = mask[1]; 
  assign _T_1664 = mask[0]; 
  assign _T_1680 = {_T_1665,_T_1664}; 
  assign _T_1682 = {_T_1681,_T_1680}; 
  assign _T_1686 = {_T_1685,_T_1682}; 
  assign _T_1694 = _T_1686[7]; 
  assign _T_1693 = _T_1686[6]; 
  assign _T_1699 = {_T_1694,_T_1693}; 
  assign _T_1692 = _T_1686[5]; 
  assign _T_1691 = _T_1686[4]; 
  assign _T_1698 = {_T_1692,_T_1691}; 
  assign _T_1700 = {_T_1699,_T_1698}; 
  assign _T_1690 = _T_1686[3]; 
  assign _T_1689 = _T_1686[2]; 
  assign _T_1696 = {_T_1690,_T_1689}; 
  assign _T_1688 = _T_1686[1]; 
  assign _T_1687 = _T_1686[0]; 
  assign _T_1695 = {_T_1688,_T_1687}; 
  assign _T_1697 = {_T_1696,_T_1695}; 
  assign _T_1701 = {_T_1700,_T_1697}; 
  assign _T_1740 = _T_1701 & _T_1653; 
  assign _T_1741 = _T_1740 != 8'h0; 
  assign _T_1742 = mask & s1_mask; 
  assign _T_1743 = _T_1742 != 8'h0; 
  assign _T_1744 = s1_write ? _T_1741 : _T_1743; 
  assign _T_1745 = _T_1663 & _T_1744; 
  assign _T_1746 = pstore2_valid & _T_1745; 
  assign s1_hazard = _T_1660 | _T_1746; 
  assign s1_raw_hazard = s1_read & s1_hazard; 
  assign _T_1747 = s1_valid & s1_raw_hazard; 
  assign _T_944 = _T_942 ? 2'h1 : 2'h0; 
  assign _T_947 = _T_945 ? 2'h2 : _T_944; 
  assign _T_950 = _T_948 ? 2'h1 : _T_947; 
  assign _T_953 = _T_951 ? 2'h2 : _T_950; 
  assign _T_956 = _T_954 ? 2'h0 : _T_953; 
  assign _T_959 = _T_957 ? 2'h3 : _T_956; 
  assign _T_962 = _T_960 ? 2'h3 : _T_959; 
  assign _T_965 = _T_963 ? 2'h2 : _T_962; 
  assign _T_968 = _T_966 ? 2'h3 : _T_965; 
  assign _T_971 = _T_969 ? 2'h1 : _T_968; 
  assign _T_974 = _T_972 ? 2'h2 : _T_971; 
  assign s2_grow_param = _T_975 ? 2'h3 : _T_974; 
  assign _T_1181 = s2_hit_state_state == s2_grow_param; 
  assign s2_update_meta = _T_1181 == 1'h0; 
  assign _T_1187 = s2_valid_hit_pre_data_ecc & s2_update_meta; 
  assign _T_1188 = io_cpu_s2_nack | _T_1187; 
  assign s1_readwrite = s1_read | s1_write; 
  assign _T_529 = s1_valid & s1_readwrite; 
  assign _T_530 = _T_529 & tlb_io_resp_miss; 
  assign _GEN_74 = _T_1188 ? 1'h1 : _T_530; 
  assign _GEN_98 = _T_1747 ? 1'h1 : _GEN_74; 
  assign _GEN_219 = probeNack ? 1'h1 : _GEN_98; 
  assign s1_nack = s2_probe ? _GEN_219 : _GEN_98; 
  assign _T_282 = s1_nack == 1'h0; 
  assign s1_valid_not_nacked = s1_valid & _T_282; 
  assign _T_283 = metaArb_io_out_bits_write == 1'h0; 
  assign s0_clk_en = metaArb_io_out_valid & _T_283; 
  assign _T_284 = metaArb_io_out_bits_addr[39:6]; 
  assign _T_285 = io_cpu_req_bits_addr[5:0]; 
  assign _T_286 = {_T_284,_T_285}; 
  assign _T_287 = metaArb_io_in_7_ready == 1'h0; 
  assign s1_sfence = s1_req_cmd == 5'h14; 
  assign can_acquire_before_release = release_ack_wait == 1'h0; 
  assign inWriteback = _T_3517 | _T_3516; 
  assign _T_343 = release_state == 3'h0; 
  assign _T_344 = cached_grant_wait == 1'h0; 
  assign _T_345 = _T_343 & _T_344; 
  assign _T_347 = _T_345 & _T_282; 
  assign _T_374 = io_cpu_req_bits_cmd == 5'h0; 
  assign _T_375 = io_cpu_req_bits_cmd == 5'h6; 
  assign _T_376 = _T_374 | _T_375; 
  assign _T_377 = io_cpu_req_bits_cmd == 5'h7; 
  assign _T_378 = _T_376 | _T_377; 
  assign _T_379 = io_cpu_req_bits_cmd == 5'h4; 
  assign _T_380 = io_cpu_req_bits_cmd == 5'h9; 
  assign _T_381 = io_cpu_req_bits_cmd == 5'ha; 
  assign _T_382 = io_cpu_req_bits_cmd == 5'hb; 
  assign _T_383 = _T_379 | _T_380; 
  assign _T_384 = _T_383 | _T_381; 
  assign _T_385 = _T_384 | _T_382; 
  assign _T_386 = io_cpu_req_bits_cmd == 5'h8; 
  assign _T_387 = io_cpu_req_bits_cmd == 5'hc; 
  assign _T_388 = io_cpu_req_bits_cmd == 5'hd; 
  assign _T_389 = io_cpu_req_bits_cmd == 5'he; 
  assign _T_390 = io_cpu_req_bits_cmd == 5'hf; 
  assign _T_391 = _T_386 | _T_387; 
  assign _T_392 = _T_391 | _T_388; 
  assign _T_393 = _T_392 | _T_389; 
  assign _T_394 = _T_393 | _T_390; 
  assign _T_395 = _T_385 | _T_394; 
  assign s0_read = _T_378 | _T_395; 
  assign _T_396 = io_cpu_req_bits_cmd == 5'h1; 
  assign _T_397 = io_cpu_req_bits_cmd == 5'h3; 
  assign _T_398 = _T_396 | _T_397; 
  assign res = _T_398 == 1'h0; 
  assign _T_426 = io_cpu_req_bits_cmd == 5'h11; 
  assign _T_427 = _T_396 | _T_426; 
  assign _T_429 = _T_427 | _T_377; 
  assign _T_447 = _T_429 | _T_395; 
  assign _T_452 = _T_447 & _T_426; 
  assign _T_453 = s0_read | _T_452; 
  assign _T_454 = _T_453 == 1'h0; 
  assign _T_455 = _T_454 | res; 
  assign _T_457 = _T_455 | reset; 
  assign _T_458 = _T_457 == 1'h0; 
  assign _T_459 = io_cpu_req_valid & res; 
  assign _T_462 = dataArb_io_in_3_ready == 1'h0; 
  assign _T_463 = _T_462 & s0_read; 
  assign _GEN_16 = _T_463 ? 1'h0 : _T_347; 
  assign _GEN_18 = _T_287 ? 1'h0 : _GEN_16; 
  assign _T_524 = tlb_io_req_ready == 1'h0; 
  assign _T_525 = tlb_io_ptw_resp_valid == 1'h0; 
  assign _T_526 = _T_524 & _T_525; 
  assign _T_527 = io_cpu_req_bits_phys == 1'h0; 
  assign _T_528 = _T_526 & _T_527; 
  assign _GEN_19 = _T_528 ? 1'h0 : _GEN_18; 
  assign s1_victim_way = lfsr[1:0]; 
  assign _GEN_29 = metaArb_io_out_bits_idx; 
  assign _GEN_41 = s0_clk_en; 
  assign _T_586 = tag_array_0_s1_meta_data; 
  assign _T_587 = _T_586[25:0]; 
  assign _T_588 = _T_586[27:26]; 
  assign _T_593 = tag_array_1_s1_meta_data; 
  assign _T_594 = _T_593[25:0]; 
  assign _T_595 = _T_593[27:26]; 
  assign _T_600 = tag_array_2_s1_meta_data; 
  assign _T_601 = _T_600[25:0]; 
  assign _T_602 = _T_600[27:26]; 
  assign _T_607 = tag_array_3_s1_meta_data; 
  assign _T_608 = _T_607[25:0]; 
  assign _T_609 = _T_607[27:26]; 
  assign s1_tag = tlb_io_resp_paddr[37:12]; 
  assign _T_610 = _T_588 > 2'h0; 
  assign _T_611 = _T_587 == s1_tag; 
  assign _T_612 = _T_610 & _T_611; 
  assign _T_613 = _T_595 > 2'h0; 
  assign _T_614 = _T_594 == s1_tag; 
  assign _T_615 = _T_613 & _T_614; 
  assign _T_616 = _T_602 > 2'h0; 
  assign _T_617 = _T_601 == s1_tag; 
  assign _T_618 = _T_616 & _T_617; 
  assign _T_619 = _T_609 > 2'h0; 
  assign _T_620 = _T_608 == s1_tag; 
  assign _T_621 = _T_619 & _T_620; 
  assign _T_622 = {_T_615,_T_612}; 
  assign _T_623 = {_T_621,_T_618}; 
  assign s1_meta_hit_way = {_T_623,_T_622}; 
  assign _T_627 = s1_flush_valid == 1'h0; 
  assign _T_628 = _T_611 & _T_627; 
  assign _T_629 = _T_628 ? _T_588 : 2'h0; 
  assign _T_632 = _T_614 & _T_627; 
  assign _T_633 = _T_632 ? _T_595 : 2'h0; 
  assign _T_636 = _T_617 & _T_627; 
  assign _T_637 = _T_636 ? _T_602 : 2'h0; 
  assign _T_640 = _T_620 & _T_627; 
  assign _T_641 = _T_640 ? _T_609 : 2'h0; 
  assign _T_642 = _T_629 | _T_633; 
  assign _T_643 = _T_642 | _T_637; 
  assign s1_meta_hit_state_state = _T_643 | _T_641; 
  assign _T_651 = s1_victim_way == 2'h1; 
  assign _T_653 = s1_victim_way == 2'h2; 
  assign _T_655 = s1_victim_way == 2'h3; 
  assign s2_hit_valid = s2_hit_state_state > 2'h0; 
  assign _T_1047 = 4'h1 << _T_1046; 
  assign s2_victim_way = s2_hit_valid ? s2_hit_way : _T_1047; 
  assign releaseWay = _T_3519 ? s2_victim_way : s2_probe_way; 
  assign _T_656 = inWriteback ? releaseWay : s1_meta_hit_way; 
  assign _T_658 = auto_out_d_bits_data[7:0]; 
  assign _T_659 = auto_out_d_bits_data[15:8]; 
  assign _T_660 = auto_out_d_bits_data[23:16]; 
  assign _T_661 = auto_out_d_bits_data[31:24]; 
  assign _T_662 = auto_out_d_bits_data[39:32]; 
  assign _T_663 = auto_out_d_bits_data[47:40]; 
  assign _T_664 = auto_out_d_bits_data[55:48]; 
  assign _T_665 = auto_out_d_bits_data[63:56]; 
  assign _T_666 = {_T_659,_T_658}; 
  assign _T_667 = {_T_661,_T_660}; 
  assign _T_668 = {_T_667,_T_666}; 
  assign _T_669 = {_T_663,_T_662}; 
  assign _T_670 = {_T_665,_T_664}; 
  assign _T_671 = {_T_670,_T_669}; 
  assign s1_all_data_ways_4 = {_T_671,_T_668}; 
  assign _T_709 = s1_sfence == 1'h0; 
  assign _T_710 = s1_valid_masked & _T_709; 
  assign _T_725 = io_cpu_s2_kill == 1'h0; 
  assign s2_valid_not_killed = s2_valid_masked & _T_725; 
  assign _T_728 = s1_valid_not_nacked | s1_flush_valid; 
  assign _T_729 = tlb_io_resp_cacheable == 1'h0; 
  assign _T_733 = _T_732[39:12]; 
  assign _T_734 = s2_req_addr[11:0]; 
  assign s2_vaddr = {_T_733,_T_734}; 
  assign en = s1_valid | inWriteback; 
  assign _T_3281 = auto_out_d_bits_opcode == 3'h0; 
  assign _T_3283 = grantIsUncachedData | _T_3281; 
  assign _T_3282 = auto_out_d_bits_opcode == 3'h2; 
  assign grantIsUncached = _T_3283 | _T_3282; 
  assign _GEN_129 = grantIsUncachedData ? 5'h10 : {{1'd0}, _T_656}; 
  assign _GEN_137 = grantIsUncached ? _GEN_129 : {{1'd0}, _T_656}; 
  assign _GEN_149 = grantIsCached ? {{1'd0}, _T_656} : _GEN_137; 
  assign s1_data_way = _T_3296 ? _GEN_149 : {{1'd0}, _T_656}; 
  assign _T_839 = s1_data_way[0]; 
  assign _T_840 = s1_data_way[1]; 
  assign _T_841 = s1_data_way[2]; 
  assign _T_842 = s1_data_way[3]; 
  assign _T_843 = s1_data_way[4]; 
  assign s1_all_data_ways_0 = data_io_resp_0; 
  assign _T_845 = _T_839 ? s1_all_data_ways_0 : 64'h0; 
  assign s1_all_data_ways_1 = data_io_resp_1; 
  assign _T_846 = _T_840 ? s1_all_data_ways_1 : 64'h0; 
  assign s1_all_data_ways_2 = data_io_resp_2; 
  assign _T_847 = _T_841 ? s1_all_data_ways_2 : 64'h0; 
  assign s1_all_data_ways_3 = data_io_resp_3; 
  assign _T_848 = _T_842 ? s1_all_data_ways_3 : 64'h0; 
  assign _T_849 = _T_843 ? s1_all_data_ways_4 : 64'h0; 
  assign _T_850 = _T_845 | _T_846; 
  assign _T_851 = _T_850 | _T_847; 
  assign _T_852 = _T_851 | _T_848; 
  assign _T_853 = _T_852 | _T_849; 
  assign _T_857 = en | _T_3296; 
  assign _T_977 = s2_data[7:0]; 
  assign _T_978 = s2_data[15:8]; 
  assign _T_979 = s2_data[23:16]; 
  assign _T_980 = s2_data[31:24]; 
  assign _T_981 = s2_data[39:32]; 
  assign _T_982 = s2_data[47:40]; 
  assign _T_983 = s2_data[55:48]; 
  assign _T_984 = s2_data[63:56]; 
  assign _T_1007 = {_T_978,_T_977}; 
  assign _T_1008 = {_T_980,_T_979}; 
  assign _T_1009 = {_T_1008,_T_1007}; 
  assign _T_1010 = {_T_982,_T_981}; 
  assign _T_1011 = {_T_984,_T_983}; 
  assign _T_1012 = {_T_1011,_T_1010}; 
  assign s2_data_corrected = {_T_1012,_T_1009}; 
  assign _T_1030 = s2_hit == 1'h0; 
  assign _T_1031 = _T_1019 & _T_1030; 
  assign s2_valid_miss = _T_1031 & can_acquire_before_release; 
  assign _T_1032 = s2_uncached == 1'h0; 
  assign _T_1033 = s2_valid_miss & _T_1032; 
  assign _T_1035 = uncachedInFlight_0 == 1'h0; 
  assign s2_valid_cached_miss = _T_1033 & _T_1035; 
  assign s2_want_victimize = s2_valid_cached_miss | s2_flush_valid_pre_tag_ecc; 
  assign _T_1038 = s2_flush_valid_pre_tag_ecc == 1'h0; 
  assign s2_cannot_victimize = _T_1038 & io_cpu_s2_kill; 
  assign _T_1039 = s2_cannot_victimize == 1'h0; 
  assign s2_victimize = s2_want_victimize & _T_1039; 
  assign _T_1040 = s2_valid_miss & s2_uncached; 
  assign _T_1041 = ~ uncachedInFlight_0; 
  assign _T_1042 = _T_1041 == 1'h0; 
  assign _T_1043 = _T_1042 == 1'h0; 
  assign s2_valid_uncached_pending = _T_1040 & _T_1043; 
  assign s2_victim_state_state = s2_hit_valid ? s2_hit_state_state : _T_1054_state; 
  assign _T_1070 = _T_1068 ? 3'h5 : 3'h0; 
  assign _T_1074 = _T_1072 ? 3'h2 : _T_1070; 
  assign _T_1078 = _T_1076 ? 3'h1 : _T_1074; 
  assign _T_1082 = _T_1080 ? 3'h1 : _T_1078; 
  assign _T_1086 = _T_1084 ? 3'h2 : _T_1082; 
  assign _T_1090 = _T_1088 ? 3'h4 : _T_1086; 
  assign _T_1091 = _T_1088 ? 2'h1 : 2'h0; 
  assign _T_1094 = _T_1092 ? 3'h0 : _T_1090; 
  assign _T_1095 = _T_1092 ? 2'h1 : _T_1091; 
  assign _T_1098 = _T_1096 ? 3'h0 : _T_1094; 
  assign _T_1099 = _T_1096 ? 2'h1 : _T_1095; 
  assign _T_1102 = _T_1100 ? 3'h5 : _T_1098; 
  assign _T_1103 = _T_1100 ? 2'h0 : _T_1099; 
  assign _T_1106 = _T_1104 ? 3'h4 : _T_1102; 
  assign _T_1107 = _T_1104 ? 2'h1 : _T_1103; 
  assign _T_1110 = _T_1108 ? 3'h3 : _T_1106; 
  assign _T_1111 = _T_1108 ? 2'h2 : _T_1107; 
  assign s2_report_param = _T_1112 ? 3'h3 : _T_1110; 
  assign probeNewCoh_state = _T_1112 ? 2'h2 : _T_1111; 
  assign _T_1121 = {2'h2,s2_victim_state_state}; 
  assign _T_1134 = 4'h8 == _T_1121; 
  assign _T_1136 = _T_1134 ? 3'h5 : 3'h0; 
  assign _T_1138 = 4'h9 == _T_1121; 
  assign _T_1140 = _T_1138 ? 3'h2 : _T_1136; 
  assign _T_1142 = 4'ha == _T_1121; 
  assign _T_1144 = _T_1142 ? 3'h1 : _T_1140; 
  assign _T_1146 = 4'hb == _T_1121; 
  assign _T_1148 = _T_1146 ? 3'h1 : _T_1144; 
  assign _T_1150 = 4'h4 == _T_1121; 
  assign _T_1151 = _T_1150 ? 1'h0 : _T_1146; 
  assign _T_1152 = _T_1150 ? 3'h2 : _T_1148; 
  assign _T_1154 = 4'h5 == _T_1121; 
  assign _T_1155 = _T_1154 ? 1'h0 : _T_1151; 
  assign _T_1156 = _T_1154 ? 3'h4 : _T_1152; 
  assign _T_1157 = _T_1154 ? 2'h1 : 2'h0; 
  assign _T_1158 = 4'h6 == _T_1121; 
  assign _T_1159 = _T_1158 ? 1'h0 : _T_1155; 
  assign _T_1160 = _T_1158 ? 3'h0 : _T_1156; 
  assign _T_1161 = _T_1158 ? 2'h1 : _T_1157; 
  assign _T_1162 = 4'h7 == _T_1121; 
  assign _T_1163 = _T_1162 ? 1'h1 : _T_1159; 
  assign _T_1164 = _T_1162 ? 3'h0 : _T_1160; 
  assign _T_1165 = _T_1162 ? 2'h1 : _T_1161; 
  assign _T_1166 = 4'h0 == _T_1121; 
  assign _T_1167 = _T_1166 ? 1'h0 : _T_1163; 
  assign _T_1168 = _T_1166 ? 3'h5 : _T_1164; 
  assign _T_1169 = _T_1166 ? 2'h0 : _T_1165; 
  assign _T_1170 = 4'h1 == _T_1121; 
  assign _T_1171 = _T_1170 ? 1'h0 : _T_1167; 
  assign _T_1172 = _T_1170 ? 3'h4 : _T_1168; 
  assign _T_1173 = _T_1170 ? 2'h1 : _T_1169; 
  assign _T_1174 = 4'h2 == _T_1121; 
  assign _T_1175 = _T_1174 ? 1'h0 : _T_1171; 
  assign _T_1176 = _T_1174 ? 3'h3 : _T_1172; 
  assign _T_1177 = _T_1174 ? 2'h2 : _T_1173; 
  assign _T_1178 = 4'h3 == _T_1121; 
  assign s2_victim_dirty = _T_1178 ? 1'h1 : _T_1175; 
  assign s2_shrink_param = _T_1178 ? 3'h3 : _T_1176; 
  assign voluntaryNewCoh_state = _T_1178 ? 2'h2 : _T_1177; 
  assign _T_1182 = s2_valid_hit_pre_data_ecc == 1'h0; 
  assign _T_1183 = s2_valid & _T_1182; 
  assign _T_1184 = s2_valid_uncached_pending & auto_out_a_ready; 
  assign _T_1185 = _T_1184 == 1'h0; 
  assign _T_1186 = _T_1183 & _T_1185; 
  assign _T_1208 = probe_bits_address[11:6]; 
  assign _T_1211 = io_cpu_req_bits_addr[39:12]; 
  assign _T_1219 = s2_victim_dirty == 1'h0; 
  assign _T_1220 = s2_want_victimize & _T_1219; 
  assign _T_1225 = s2_vaddr[11:0]; 
  assign _T_1227 = s2_req_addr[39:12]; 
  assign _T_1230_state = s2_valid_hit_pre_data_ecc ? s2_grow_param : 2'h0; 
  assign _T_1232_tag = _T_1227[25:0]; 
  assign _T_1237 = lrscCount > 7'h0; 
  assign _T_1238 = lrscValid == 1'h0; 
  assign lrscBackingOff = _T_1237 & _T_1238; 
  assign _T_1243 = s2_valid_hit_pre_data_ecc & _T_736; 
  assign _T_1245 = _T_1243 & _T_344; 
  assign _T_1246 = _T_1245 | s2_valid_cached_miss; 
  assign _T_1248 = _T_1246 & _T_725; 
  assign _T_1252 = lrscCount - 7'h1; 
  assign _T_1253 = $unsigned(_T_1252); 
  assign _T_1254 = _T_1253[6:0]; 
  assign _T_1255 = s2_valid_not_killed & lrscValid; 
  assign _T_1264 = s1_valid_not_nacked & s1_write; 
  assign _T_1325 = s1_write & _T_311; 
  assign _T_1326 = s1_read | _T_1325; 
  assign _T_1330 = s2_valid & s2_write; 
  assign _T_1335 = _T_1405 & _T_725; 
  assign pstore_drain_opportunistic = _T_459 == 1'h0; 
  assign pstore1_valid_likely = _T_1330 | pstore1_held; 
  assign pstore1_valid = _T_1335 | pstore1_held; 
  assign _T_1412 = pstore1_valid_likely & pstore2_valid; 
  assign _T_1413 = s1_valid & s1_write; 
  assign _T_1414 = _T_1413 | pstore1_rmw; 
  assign pstore_drain_structural = _T_1412 & _T_1414; 
  assign _T_1424 = pstore1_valid == pstore1_valid; 
  assign _T_1425 = pstore1_rmw | _T_1424; 
  assign _T_1427 = _T_1425 | reset; 
  assign _T_1428 = _T_1427 == 1'h0; 
  assign _T_1442 = pstore1_rmw == 1'h0; 
  assign _T_1443 = pstore1_valid & _T_1442; 
  assign _T_1444 = _T_1443 | pstore2_valid; 
  assign _T_1445 = pstore_drain_opportunistic | releaseInFlight; 
  assign _T_1446 = _T_1444 & _T_1445; 
  assign pstore_drain = pstore_drain_structural | _T_1446; 
  assign _T_1456 = pstore1_valid & pstore2_valid; 
  assign _T_1457 = pstore_drain == 1'h0; 
  assign _T_1460 = pstore2_valid == pstore_drain; 
  assign advance_pstore1 = pstore1_valid & _T_1460; 
  assign _T_1462 = pstore2_valid & _T_1457; 
  assign pstore1_storegen_data = amoalu_io_out; 
  assign _T_1468 = pstore1_storegen_data[7:0]; 
  assign _T_1474 = pstore1_storegen_data[15:8]; 
  assign _T_1480 = pstore1_storegen_data[23:16]; 
  assign _T_1486 = pstore1_storegen_data[31:24]; 
  assign _T_1492 = pstore1_storegen_data[39:32]; 
  assign _T_1498 = pstore1_storegen_data[47:40]; 
  assign _T_1504 = pstore1_storegen_data[55:48]; 
  assign _T_1510 = pstore1_storegen_data[63:56]; 
  assign _T_1516 = {_T_1479,_T_1473}; 
  assign _T_1517 = {_T_1491,_T_1485}; 
  assign _T_1518 = {_T_1517,_T_1516}; 
  assign _T_1519 = {_T_1503,_T_1497}; 
  assign _T_1520 = {_T_1515,_T_1509}; 
  assign _T_1521 = {_T_1520,_T_1519}; 
  assign pstore2_storegen_data = {_T_1521,_T_1518}; 
  assign _T_1525 = ~ pstore1_mask; 
  assign _T_1527 = ~ _T_1525; 
  assign _T_1540 = pstore1_valid_pre_kill & _T_1442; 
  assign _T_1541 = _T_1540 | pstore2_valid; 
  assign _T_1543 = _T_1541 & _T_1445; 
  assign _T_1546 = pstore2_valid ? pstore2_addr : pstore1_addr; 
  assign _T_1551 = pstore2_valid ? mask : pstore1_mask; 
  assign _T_1552 = _T_1551[0]; 
  assign _T_1553 = _T_1551[1]; 
  assign _T_1554 = _T_1551[2]; 
  assign _T_1555 = _T_1551[3]; 
  assign _T_1556 = _T_1551[4]; 
  assign _T_1557 = _T_1551[5]; 
  assign _T_1558 = _T_1551[6]; 
  assign _T_1559 = _T_1551[7]; 
  assign _T_1568 = {_T_1553,_T_1552}; 
  assign _T_1569 = {_T_1555,_T_1554}; 
  assign _T_1570 = {_T_1569,_T_1568}; 
  assign _T_1571 = {_T_1557,_T_1556}; 
  assign _T_1572 = {_T_1559,_T_1558}; 
  assign _T_1573 = {_T_1572,_T_1571}; 
  assign _GEN_324 = {{1'd0}, _T_1041}; 
  assign _T_1751 = _GEN_324 << 1; 
  assign _T_1752 = _T_1751[0]; 
  assign a_source = _T_1752 ? 1'h0 : 1'h1; 
  assign _GEN_325 = {{6'd0}, _T_1240}; 
  assign acquire_address = _GEN_325 << 6; 
  assign a_size = s2_req_typ[1:0]; 
  assign _T_1814 = {{1'd0}, a_size}; 
  assign _T_1815 = _T_1814[1:0]; 
  assign _T_1816 = 4'h1 << _T_1815; 
  assign _T_1817 = _T_1816[2:0]; 
  assign _T_1818 = _T_1817 | 3'h1; 
  assign _T_1819 = a_size >= 2'h3; 
  assign _T_1820 = _T_1818[2]; 
  assign _T_1821 = s2_req_addr[2]; 
  assign _T_1822 = _T_1821 == 1'h0; 
  assign _T_1824 = _T_1820 & _T_1822; 
  assign _T_1825 = _T_1819 | _T_1824; 
  assign _T_1827 = _T_1820 & _T_1821; 
  assign _T_1828 = _T_1819 | _T_1827; 
  assign _T_1829 = _T_1818[1]; 
  assign _T_1830 = s2_req_addr[1]; 
  assign _T_1831 = _T_1830 == 1'h0; 
  assign _T_1832 = _T_1822 & _T_1831; 
  assign _T_1833 = _T_1829 & _T_1832; 
  assign _T_1834 = _T_1825 | _T_1833; 
  assign _T_1835 = _T_1822 & _T_1830; 
  assign _T_1836 = _T_1829 & _T_1835; 
  assign _T_1837 = _T_1825 | _T_1836; 
  assign _T_1838 = _T_1821 & _T_1831; 
  assign _T_1839 = _T_1829 & _T_1838; 
  assign _T_1840 = _T_1828 | _T_1839; 
  assign _T_1841 = _T_1821 & _T_1830; 
  assign _T_1842 = _T_1829 & _T_1841; 
  assign _T_1843 = _T_1828 | _T_1842; 
  assign _T_1844 = _T_1818[0]; 
  assign _T_1845 = s2_req_addr[0]; 
  assign _T_1846 = _T_1845 == 1'h0; 
  assign _T_1847 = _T_1832 & _T_1846; 
  assign _T_1848 = _T_1844 & _T_1847; 
  assign _T_1849 = _T_1834 | _T_1848; 
  assign _T_1850 = _T_1832 & _T_1845; 
  assign _T_1851 = _T_1844 & _T_1850; 
  assign _T_1852 = _T_1834 | _T_1851; 
  assign _T_1853 = _T_1835 & _T_1846; 
  assign _T_1854 = _T_1844 & _T_1853; 
  assign _T_1855 = _T_1837 | _T_1854; 
  assign _T_1856 = _T_1835 & _T_1845; 
  assign _T_1857 = _T_1844 & _T_1856; 
  assign _T_1858 = _T_1837 | _T_1857; 
  assign _T_1859 = _T_1838 & _T_1846; 
  assign _T_1860 = _T_1844 & _T_1859; 
  assign _T_1861 = _T_1840 | _T_1860; 
  assign _T_1862 = _T_1838 & _T_1845; 
  assign _T_1863 = _T_1844 & _T_1862; 
  assign _T_1864 = _T_1840 | _T_1863; 
  assign _T_1865 = _T_1841 & _T_1846; 
  assign _T_1866 = _T_1844 & _T_1865; 
  assign _T_1867 = _T_1843 | _T_1866; 
  assign _T_1868 = _T_1841 & _T_1845; 
  assign _T_1869 = _T_1844 & _T_1868; 
  assign _T_1870 = _T_1843 | _T_1869; 
  assign _T_1871 = {_T_1852,_T_1849}; 
  assign _T_1872 = {_T_1858,_T_1855}; 
  assign _T_1873 = {_T_1872,_T_1871}; 
  assign _T_1874 = {_T_1864,_T_1861}; 
  assign _T_1875 = {_T_1870,_T_1867}; 
  assign _T_1876 = {_T_1875,_T_1874}; 
  assign get_mask = {_T_1876,_T_1873}; 
  assign _T_3100 = 5'hf == s2_req_cmd; 
  assign _T_3101_opcode = _T_3100 ? 3'h2 : 3'h0; 
  assign _T_3101_param = _T_3100 ? 3'h3 : 3'h0; 
  assign _T_3101_size = _T_3100 ? _T_1814 : 3'h0; 
  assign _T_3101_source = _T_3100 ? a_source : 1'h0; 
  assign _T_3035_address = s2_req_addr[37:0]; 
  assign _T_3101_address = _T_3100 ? _T_3035_address : 38'h0; 
  assign _T_3101_mask = _T_3100 ? get_mask : 8'h0; 
  assign _T_3101_data = _T_3100 ? pstore1_data : 64'h0; 
  assign _T_3102 = 5'he == s2_req_cmd; 
  assign _T_3103_opcode = _T_3102 ? 3'h2 : _T_3101_opcode; 
  assign _T_3103_param = _T_3102 ? 3'h2 : _T_3101_param; 
  assign _T_3103_size = _T_3102 ? _T_1814 : _T_3101_size; 
  assign _T_3103_source = _T_3102 ? a_source : _T_3101_source; 
  assign _T_3103_address = _T_3102 ? _T_3035_address : _T_3101_address; 
  assign _T_3103_mask = _T_3102 ? get_mask : _T_3101_mask; 
  assign _T_3103_data = _T_3102 ? pstore1_data : _T_3101_data; 
  assign _T_3104 = 5'hd == s2_req_cmd; 
  assign _T_3105_opcode = _T_3104 ? 3'h2 : _T_3103_opcode; 
  assign _T_3105_param = _T_3104 ? 3'h1 : _T_3103_param; 
  assign _T_3105_size = _T_3104 ? _T_1814 : _T_3103_size; 
  assign _T_3105_source = _T_3104 ? a_source : _T_3103_source; 
  assign _T_3105_address = _T_3104 ? _T_3035_address : _T_3103_address; 
  assign _T_3105_mask = _T_3104 ? get_mask : _T_3103_mask; 
  assign _T_3105_data = _T_3104 ? pstore1_data : _T_3103_data; 
  assign _T_3106 = 5'hc == s2_req_cmd; 
  assign _T_3107_opcode = _T_3106 ? 3'h2 : _T_3105_opcode; 
  assign _T_3107_param = _T_3106 ? 3'h0 : _T_3105_param; 
  assign _T_3107_size = _T_3106 ? _T_1814 : _T_3105_size; 
  assign _T_3107_source = _T_3106 ? a_source : _T_3105_source; 
  assign _T_3107_address = _T_3106 ? _T_3035_address : _T_3105_address; 
  assign _T_3107_mask = _T_3106 ? get_mask : _T_3105_mask; 
  assign _T_3107_data = _T_3106 ? pstore1_data : _T_3105_data; 
  assign _T_3108 = 5'h8 == s2_req_cmd; 
  assign _T_3109_opcode = _T_3108 ? 3'h2 : _T_3107_opcode; 
  assign _T_3109_param = _T_3108 ? 3'h4 : _T_3107_param; 
  assign _T_3109_size = _T_3108 ? _T_1814 : _T_3107_size; 
  assign _T_3109_source = _T_3108 ? a_source : _T_3107_source; 
  assign _T_3109_address = _T_3108 ? _T_3035_address : _T_3107_address; 
  assign _T_3109_mask = _T_3108 ? get_mask : _T_3107_mask; 
  assign _T_3109_data = _T_3108 ? pstore1_data : _T_3107_data; 
  assign _T_3110 = 5'hb == s2_req_cmd; 
  assign _T_3111_opcode = _T_3110 ? 3'h3 : _T_3109_opcode; 
  assign _T_3111_param = _T_3110 ? 3'h2 : _T_3109_param; 
  assign _T_3111_size = _T_3110 ? _T_1814 : _T_3109_size; 
  assign _T_3111_source = _T_3110 ? a_source : _T_3109_source; 
  assign _T_3111_address = _T_3110 ? _T_3035_address : _T_3109_address; 
  assign _T_3111_mask = _T_3110 ? get_mask : _T_3109_mask; 
  assign _T_3111_data = _T_3110 ? pstore1_data : _T_3109_data; 
  assign _T_3112 = 5'ha == s2_req_cmd; 
  assign _T_3113_opcode = _T_3112 ? 3'h3 : _T_3111_opcode; 
  assign _T_3113_param = _T_3112 ? 3'h1 : _T_3111_param; 
  assign _T_3113_size = _T_3112 ? _T_1814 : _T_3111_size; 
  assign _T_3113_source = _T_3112 ? a_source : _T_3111_source; 
  assign _T_3113_address = _T_3112 ? _T_3035_address : _T_3111_address; 
  assign _T_3113_mask = _T_3112 ? get_mask : _T_3111_mask; 
  assign _T_3113_data = _T_3112 ? pstore1_data : _T_3111_data; 
  assign _T_3114 = 5'h9 == s2_req_cmd; 
  assign _T_3115_opcode = _T_3114 ? 3'h3 : _T_3113_opcode; 
  assign _T_3115_param = _T_3114 ? 3'h0 : _T_3113_param; 
  assign _T_3115_size = _T_3114 ? _T_1814 : _T_3113_size; 
  assign _T_3115_source = _T_3114 ? a_source : _T_3113_source; 
  assign _T_3115_address = _T_3114 ? _T_3035_address : _T_3113_address; 
  assign _T_3115_mask = _T_3114 ? get_mask : _T_3113_mask; 
  assign _T_3115_data = _T_3114 ? pstore1_data : _T_3113_data; 
  assign _T_3116 = 5'h4 == s2_req_cmd; 
  assign atomics_opcode = _T_3116 ? 3'h3 : _T_3115_opcode; 
  assign atomics_param = _T_3116 ? 3'h3 : _T_3115_param; 
  assign atomics_size = _T_3116 ? _T_1814 : _T_3115_size; 
  assign atomics_source = _T_3116 ? a_source : _T_3115_source; 
  assign atomics_address = _T_3116 ? _T_3035_address : _T_3115_address; 
  assign atomics_mask = _T_3116 ? get_mask : _T_3115_mask; 
  assign atomics_data = _T_3116 ? pstore1_data : _T_3115_data; 
  assign _T_3120 = s2_valid_cached_miss & _T_1219; 
  assign _T_3121 = _T_3120 | s2_valid_uncached_pending; 
  assign tl_out_a_valid = _T_725 & _T_3121; 
  assign _T_3252 = s2_write == 1'h0; 
  assign _T_3253 = s2_read == 1'h0; 
  assign _T_3254_opcode = _T_3253 ? 3'h0 : atomics_opcode; 
  assign _T_3254_param = _T_3253 ? 3'h0 : atomics_param; 
  assign _T_3254_size = _T_3253 ? _T_1814 : atomics_size; 
  assign _T_3254_source = _T_3253 ? a_source : atomics_source; 
  assign _T_3254_address = _T_3253 ? _T_3035_address : atomics_address; 
  assign _T_3254_mask = _T_3253 ? get_mask : atomics_mask; 
  assign _T_3254_data = _T_3253 ? pstore1_data : atomics_data; 
  assign _T_3255_opcode = _T_3252 ? 3'h4 : _T_3254_opcode; 
  assign _T_3255_param = _T_3252 ? 3'h0 : _T_3254_param; 
  assign _T_3255_size = _T_3252 ? _T_1814 : _T_3254_size; 
  assign _T_3255_source = _T_3252 ? a_source : _T_3254_source; 
  assign _T_3255_address = _T_3252 ? _T_3035_address : _T_3254_address; 
  assign _T_3255_mask = _T_3252 ? get_mask : _T_3254_mask; 
  assign _T_3255_data = _T_3252 ? 64'h0 : _T_3254_data; 
  assign _T_3187_param = {{1'd0}, s2_grow_param}; 
  assign _T_3187_address = acquire_address[37:0]; 
  assign _T_3258 = 2'h1 << a_source; 
  assign a_sel = _T_3258[1:1]; 
  assign _T_3260 = auto_out_a_ready & tl_out_a_valid; 
  assign _T_3272 = _T_3271 - 4'h1; 
  assign _T_3273 = $unsigned(_T_3272); 
  assign _T_3274 = _T_3273[3:0]; 
  assign d_done = d_last & _T_3296; 
  assign _T_3277 = ~ _T_3274; 
  assign _T_3278 = _T_3269 & _T_3277; 
  assign _GEN_327 = {{3'd0}, _T_3278}; 
  assign d_address_inc = _GEN_327 << 3; 
  assign grantIsVoluntary = auto_out_d_bits_opcode == 3'h6; 
  assign _T_3289 = blockProbeAfterGrantCount - 3'h1; 
  assign _T_3290 = $unsigned(_T_3289); 
  assign _T_3291 = _T_3290[2:0]; 
  assign _T_3298 = cached_grant_wait | reset; 
  assign _T_3299 = _T_3298 == 1'h0; 
  assign _T_3301 = 2'h1 << auto_out_d_bits_source; 
  assign d_sel = _T_3301[1:1]; 
  assign _T_3305 = d_sel & d_last; 
  assign _T_3307 = uncachedInFlight_0 | reset; 
  assign _T_3308 = _T_3307 == 1'h0; 
  assign _T_3310 = tlb_io_resp_paddr[37:3]; 
  assign _GEN_328 = {{3'd0}, _T_3310}; 
  assign dontCareBits = _GEN_328 << 3; 
  assign _T_3311 = uncachedReqs_0_addr[2:0]; 
  assign _GEN_329 = {{35'd0}, _T_3311}; 
  assign _T_3312 = dontCareBits | _GEN_329; 
  assign _T_3314 = release_ack_wait | reset; 
  assign _T_3315 = _T_3314 == 1'h0; 
  assign _T_3316 = auto_out_d_valid & d_first; 
  assign _T_3317 = _T_3316 & grantIsCached; 
  assign tl_out__e_valid = _T_3332 ? 1'h0 : _T_3317; 
  assign _T_3321 = auto_out_e_ready & tl_out__e_valid; 
  assign _T_3323 = _T_3296 & d_first; 
  assign _T_3324 = _T_3323 & grantIsCached; 
  assign _T_3325 = _T_3321 == _T_3324; 
  assign _T_3327 = _T_3325 | reset; 
  assign _T_3328 = _T_3327 == 1'h0; 
  assign _T_3329 = auto_out_d_valid & grantIsRefill; 
  assign _T_3333 = s2_vaddr[39:6]; 
  assign _GEN_330 = {{6'd0}, _T_3333}; 
  assign _T_3334 = _GEN_330 << 6; 
  assign _GEN_331 = {{33'd0}, d_address_inc}; 
  assign _T_3335 = _T_3334 | _GEN_331; 
  assign _T_3338 = grantIsCached & d_done; 
  assign _T_3339 = auto_out_d_bits_denied == 1'h0; 
  assign _T_3397 = {_T_916,auto_out_d_bits_param}; 
  assign _T_3406 = 4'hc == _T_3397; 
  assign _T_3407 = _T_3406 ? 2'h3 : 2'h0; 
  assign _T_3408 = 4'h4 == _T_3397; 
  assign _T_3409 = _T_3408 ? 2'h2 : _T_3407; 
  assign _T_3410 = 4'h0 == _T_3397; 
  assign _T_3411 = _T_3410 ? 2'h2 : _T_3409; 
  assign _T_3412 = 4'h1 == _T_3397; 
  assign _T_3413 = _T_3412 ? 2'h1 : _T_3411; 
  assign _GEN_170 = auto_out_d_valid ? 1'h0 : _GEN_19; 
  assign _GEN_171 = auto_out_d_valid ? 1'h1 : _T_3329; 
  assign _GEN_172 = auto_out_d_valid ? 1'h0 : 1'h1; 
  assign _T_3429 = _T_3431 | lrscBackingOff; 
  assign _T_3430 = auto_out_b_valid & _T_3429; 
  assign _T_3437 = auto_out_b_bits_address[11:6]; 
  assign _T_3438 = io_cpu_req_bits_addr[39:38]; 
  assign _T_3439 = {_T_3438,auto_out_b_bits_address}; 
  assign _T_3450 = _T_3449 - 4'h1; 
  assign _T_3451 = $unsigned(_T_3450); 
  assign _T_3452 = _T_3451[3:0]; 
  assign c_first = _T_3449 == 4'h0; 
  assign _T_3455 = ~ _T_3452; 
  assign c_count = _T_3447 & _T_3455; 
  assign _T_3457 = auto_out_c_ready == 1'h0; 
  assign releaseRejected = tl_out__c_valid & _T_3457; 
  assign _T_3460 = releaseRejected == 1'h0; 
  assign _T_3463 = {1'h0,c_count}; 
  assign _T_3464 = {1'h0,s2_release_data_valid}; 
  assign _GEN_332 = {{1'd0}, s1_release_data_valid}; 
  assign _T_3466 = _GEN_332 + _T_3464; 
  assign _T_3467 = releaseRejected ? 2'h0 : _T_3466; 
  assign _GEN_333 = {{3'd0}, _T_3467}; 
  assign releaseDataBeat = _T_3463 + _GEN_333; 
  assign _T_3493 = s2_victimize & s2_victim_dirty; 
  assign _T_3494 = s2_valid & s2_hit_valid; 
  assign _T_3497 = _T_3494 == 1'h0; 
  assign _T_3499 = _T_3497 | reset; 
  assign _T_3500 = _T_3499 == 1'h0; 
  assign _T_3501 = s2_req_addr[11:6]; 
  assign _T_3502 = {s2_victim_tag,_T_3501}; 
  assign _GEN_334 = {{6'd0}, _T_3502}; 
  assign res_2_address = _GEN_334 << 6; 
  assign _GEN_180 = _T_3493 ? 3'h1 : release_state; 
  assign _T_3507 = releaseDone ? 3'h7 : 3'h3; 
  assign _T_3509 = releaseDone ? 3'h0 : 3'h5; 
  assign _GEN_191 = _T_3506 ? s2_report_param : 3'h5; 
  assign _GEN_197 = _T_3506 ? _T_3507 : _T_3509; 
  assign _GEN_199 = s2_prb_ack_data ? 3'h2 : _GEN_197; 
  assign _GEN_202 = s2_prb_ack_data ? 3'h5 : _GEN_191; 
  assign _GEN_220 = s2_probe ? _GEN_199 : _GEN_180; 
  assign _GEN_223 = s2_probe ? _GEN_202 : 3'h5; 
  assign _T_3510 = release_state == 3'h4; 
  assign _T_3513 = {_T_3438,probe_bits_address}; 
  assign _GEN_230 = metaArb_io_in_6_ready ? 3'h0 : _GEN_220; 
  assign _GEN_235 = _T_3510 ? _GEN_230 : _GEN_220; 
  assign _GEN_237 = releaseDone ? 3'h0 : _GEN_235; 
  assign _GEN_239 = _T_3514 ? _GEN_237 : _GEN_235; 
  assign _GEN_243 = _T_3515 ? s2_report_param : _GEN_223; 
  assign _GEN_252 = _T_3516 ? s2_report_param : _GEN_243; 
  assign _T_3583 = _T_3440 & c_first; 
  assign newCoh_state = _T_3519 ? voluntaryNewCoh_state : probeNewCoh_state; 
  assign _T_3585 = releaseDataBeat < 5'h8; 
  assign _GEN_342 = {{6'd0}, _T_1208}; 
  assign _T_3588 = _GEN_342 << 6; 
  assign _T_3589 = releaseDataBeat[2:0]; 
  assign _GEN_343 = {{3'd0}, _T_3589}; 
  assign _T_3590 = _GEN_343 << 3; 
  assign _GEN_344 = {{6'd0}, _T_3590}; 
  assign _T_3595 = release_state == 3'h7; 
  assign _T_3599 = probe_bits_address[11:0]; 
  assign _T_3601 = probe_bits_address[37:12]; 
  assign _T_3605 = metaArb_io_in_4_ready & metaArb_io_in_4_valid; 
  assign _T_3610 = s1_valid | s2_valid; 
  assign _T_3611 = _T_3610 | cached_grant_wait; 
  assign _T_3613 = _T_3611 | uncachedInFlight_0; 
  assign _T_3646 = _T_1182 | reset; 
  assign _T_3647 = _T_3646 == 1'h0; 
  assign _T_3649 = s2_req_typ[2]; 
  assign _T_3650 = _T_3649 == 1'h0; 
  assign _T_3653 = s2_data_corrected[63:32]; 
  assign _T_3654 = s2_data_corrected[31:0]; 
  assign _T_3655 = _T_1821 ? _T_3653 : _T_3654; 
  assign _T_3658 = a_size == 2'h2; 
  assign _T_3660 = _T_3655[31]; 
  assign _T_3661 = _T_3650 & _T_3660; 
  assign _T_3663 = _T_3661 ? 32'hffffffff : 32'h0; 
  assign _T_3665 = _T_3658 ? _T_3663 : _T_3653; 
  assign _T_3666 = {_T_3665,_T_3655}; 
  assign _T_3668 = _T_3666[31:16]; 
  assign _T_3669 = _T_3666[15:0]; 
  assign _T_3670 = _T_1830 ? _T_3668 : _T_3669; 
  assign _T_3673 = a_size == 2'h1; 
  assign _T_3675 = _T_3670[15]; 
  assign _T_3676 = _T_3650 & _T_3675; 
  assign _T_3678 = _T_3676 ? 48'hffffffffffff : 48'h0; 
  assign _T_3679 = _T_3666[63:16]; 
  assign _T_3680 = _T_3673 ? _T_3678 : _T_3679; 
  assign _T_3681 = {_T_3680,_T_3670}; 
  assign _T_3683 = _T_3681[15:8]; 
  assign _T_3684 = _T_3681[7:0]; 
  assign _T_3685 = _T_1845 ? _T_3683 : _T_3684; 
  assign _T_3687 = _T_738 ? 8'h0 : _T_3685; 
  assign _T_3688 = a_size == 2'h0; 
  assign _T_3689 = _T_3688 | _T_738; 
  assign _T_3690 = _T_3687[7]; 
  assign _T_3691 = _T_3650 & _T_3690; 
  assign _T_3693 = _T_3691 ? 56'hffffffffffffff : 56'h0; 
  assign _T_3694 = _T_3681[63:8]; 
  assign _T_3695 = _T_3689 ? _T_3693 : _T_3694; 
  assign _T_3696 = {_T_3695,_T_3687}; 
  assign _GEN_345 = {{63'd0}, s2_sc_fail}; 
  assign flushCounterNext = flushCounter + 8'h1; 
  assign _T_3720 = flushCounterNext[8:6]; 
  assign flushDone = _T_3720 == 3'h4; 
  assign _T_3721 = s2_req_cmd == 5'h5; 
  assign _T_3722 = s2_valid_masked & _T_3721; 
  assign _T_3737 = metaArb_io_in_5_ready & metaArb_io_in_5_valid; 
  assign _T_3739 = _T_3737 & _T_627; 
  assign _T_3741 = _T_3739 & _T_1038; 
  assign _T_3743 = _T_3741 & _T_343; 
  assign _GEN_346 = {{6'd0}, metaArb_io_in_5_bits_idx}; 
  assign _T_3748 = _GEN_346 << 6; 
  assign _GEN_295 = resetting ? flushCounterNext : {{1'd0}, flushCounter}; 
  assign _T_3757 = io_ptw_customCSRs_csrs_0_value[0]; 
  assign _T_3758 = _T_3757 | io_cpu_keep_clock_enabled; 
  assign _T_3759 = _T_3758 | metaArb_io_out_valid; 
  assign _T_3760 = _T_3759 | s1_probe; 
  assign _T_3761 = _T_3760 | s2_probe; 
  assign _T_3762 = _T_3761 | s1_valid; 
  assign _T_3763 = _T_3762 | s2_valid_pre_xcpt; 
  assign _T_3764 = _T_3763 | pstore1_held; 
  assign _T_3765 = _T_3764 | pstore2_valid; 
  assign _T_3767 = _T_3765 | _T_721; 
  assign _T_3768 = _T_3767 | release_ack_wait; 
  assign _T_3772 = _T_3768 | _T_524; 
  assign _T_3773 = _T_3772 | cached_grant_wait; 
  assign _T_3775 = _T_3773 | uncachedInFlight_0; 
  assign _T_3777 = _T_3775 | _T_1237; 
  assign _T_3842 = grantIsCached == 1'h0; 
  assign auto_out_a_valid = _T_725 & _T_3121; 
  assign auto_out_a_bits_opcode = _T_1032 ? 3'h6 : _T_3255_opcode; 
  assign auto_out_a_bits_param = _T_1032 ? _T_3187_param : _T_3255_param; 
  assign auto_out_a_bits_size = _T_1032 ? 3'h6 : _T_3255_size; 
  assign auto_out_a_bits_source = _T_1032 ? 1'h0 : _T_3255_source; 
  assign auto_out_a_bits_address = _T_1032 ? _T_3187_address : _T_3255_address; 
  assign auto_out_a_bits_mask = _T_1032 ? 8'hff : _T_3255_mask; 
  assign auto_out_a_bits_data = _T_1032 ? 64'h0 : _T_3255_data; 
  assign auto_out_b_ready = _T_3434 & _T_3435; 
  assign auto_out_c_valid = _T_3515 ? 1'h1 : _GEN_238; 
  assign auto_out_c_bits_opcode = _T_3519 ? 3'h7 : _GEN_251; 
  assign auto_out_c_bits_param = _T_3519 ? s2_shrink_param : _GEN_252; 
  assign auto_out_c_bits_size = _T_3519 ? 3'h6 : probe_bits_size; 
  assign auto_out_c_bits_source = probe_bits_source; 
  assign auto_out_c_bits_address = probe_bits_address; 
  assign auto_out_c_bits_data = {_T_1012,_T_1009}; 
  assign auto_out_d_ready = _T_3421 ? 1'h0 : _GEN_169; 
  assign auto_out_e_valid = _T_3332 ? 1'h0 : _T_3317; 
  assign auto_out_e_bits_sink = auto_out_d_bits_sink; 
  assign io_cpu_req_ready = _T_3421 ? _GEN_170 : _GEN_19; 
  assign io_cpu_s2_nack = _T_3722 ? 1'h0 : _T_1186; 
  assign io_cpu_resp_valid = doUncachedResp ? 1'h1 : s2_valid_hit_pre_data_ecc; 
  assign io_cpu_resp_bits_tag = s2_req_tag; 
  assign io_cpu_resp_bits_typ = s2_req_typ; 
  assign io_cpu_resp_bits_data = _T_3696 | _GEN_345; 
  assign io_cpu_resp_bits_replay = doUncachedResp; 
  assign io_cpu_resp_bits_has_data = _T_739 | _T_756; 
  assign io_cpu_resp_bits_data_word_bypass = {_T_3665,_T_3655}; 
  assign io_cpu_replay_next = _T_3296 & grantIsUncachedData; 
  assign io_cpu_s2_xcpt_ma_ld = _T_3617 ? _T_3619_ma_ld : 1'h0; 
  assign io_cpu_s2_xcpt_ma_st = _T_3617 ? _T_3619_ma_st : 1'h0; 
  assign io_cpu_s2_xcpt_pf_ld = _T_3617 ? _T_3619_pf_ld : 1'h0; 
  assign io_cpu_s2_xcpt_pf_st = _T_3617 ? _T_3619_pf_st : 1'h0; 
  assign io_cpu_s2_xcpt_ae_ld = _T_3617 ? _T_3619_ae_ld : 1'h0; 
  assign io_cpu_s2_xcpt_ae_st = _T_3617 ? _T_3619_ae_st : 1'h0; 
  assign io_cpu_ordered = _T_3613 == 1'h0; 
  assign io_cpu_perf_grant = d_last & _T_3296; 
  assign io_cpu_clock_enabled = clock_en_reg; 
  assign io_ptw_req_valid = tlb_io_ptw_req_valid; 
  assign io_ptw_req_bits_valid = tlb_io_ptw_req_bits_valid; 
  assign io_ptw_req_bits_bits_addr = tlb_io_ptw_req_bits_bits_addr; 
  assign metaArb_io_in_0_valid = resetting; 
  assign metaArb_io_in_0_bits_addr = metaArb_io_in_5_bits_addr; 
  assign metaArb_io_in_0_bits_idx = metaArb_io_in_5_bits_idx; 
  assign metaArb_io_in_0_bits_data = {2'h0,_T_1232_tag}; 
  assign metaArb_io_in_2_valid = _T_1187 | _T_1220; 
  assign metaArb_io_in_2_bits_write = s2_cannot_victimize == 1'h0; 
  assign metaArb_io_in_2_bits_addr = {_T_1211,_T_1225}; 
  assign metaArb_io_in_2_bits_idx = s2_vaddr[11:6]; 
  assign metaArb_io_in_2_bits_way_en = s2_hit_valid ? s2_hit_way : _T_1047; 
  assign metaArb_io_in_2_bits_data = {_T_1230_state,_T_1232_tag}; 
  assign metaArb_io_in_3_valid = _T_3338 & _T_3339; 
  assign metaArb_io_in_3_bits_addr = {_T_1211,_T_1225}; 
  assign metaArb_io_in_3_bits_idx = s2_vaddr[11:6]; 
  assign metaArb_io_in_3_bits_way_en = s2_hit_valid ? s2_hit_way : _T_1047; 
  assign metaArb_io_in_3_bits_data = {_T_3413,_T_1232_tag}; 
  assign metaArb_io_in_4_valid = _T_3518 | _T_3595; 
  assign metaArb_io_in_4_bits_addr = {_T_1211,_T_3599}; 
  assign metaArb_io_in_4_bits_idx = probe_bits_address[11:6]; 
  assign metaArb_io_in_4_bits_way_en = _T_3519 ? s2_victim_way : s2_probe_way; 
  assign metaArb_io_in_4_bits_data = {newCoh_state,_T_3601}; 
  assign metaArb_io_in_5_valid = 1'h0; 
  assign metaArb_io_in_5_bits_addr = {_T_1211,_T_3748}; 
  assign metaArb_io_in_5_bits_idx = flushCounter[5:0]; 
  assign metaArb_io_in_6_valid = _T_3510 ? 1'h1 : _T_3430; 
  assign metaArb_io_in_6_bits_addr = _T_3510 ? _T_3513 : _T_3439; 
  assign metaArb_io_in_6_bits_idx = _T_3510 ? _T_1208 : _T_3437; 
  assign metaArb_io_in_6_bits_way_en = metaArb_io_in_4_bits_way_en; 
  assign metaArb_io_in_6_bits_data = metaArb_io_in_4_bits_data; 
  assign metaArb_io_in_7_valid = io_cpu_req_valid; 
  assign metaArb_io_in_7_bits_addr = io_cpu_req_bits_addr; 
  assign metaArb_io_in_7_bits_idx = io_cpu_req_bits_addr[11:6]; 
  assign metaArb_io_in_7_bits_way_en = metaArb_io_in_4_bits_way_en; 
  assign metaArb_io_in_7_bits_data = metaArb_io_in_4_bits_data; 
  assign metaArb_io_out_ready = clock_en_reg; 
  assign data_clock = gated_clock; 
  assign data_io_req_valid = dataArb_io_out_valid; 
  assign data_io_req_bits_addr = dataArb_io_out_bits_addr; 
  assign data_io_req_bits_write = dataArb_io_out_bits_write; 
  assign data_io_req_bits_wdata = {_T_270,_T_267}; 
  assign data_io_req_bits_eccMask = dataArb_io_out_bits_eccMask; 
  assign data_io_req_bits_way_en = dataArb_io_out_bits_way_en; 
  assign dataArb_io_in_0_valid = pstore_drain_structural | _T_1543; 
  assign dataArb_io_in_0_bits_addr = _T_1546[11:0]; 
  assign dataArb_io_in_0_bits_write = pstore_drain_structural | _T_1446; 
  assign dataArb_io_in_0_bits_wdata = pstore2_valid ? pstore2_storegen_data : pstore1_data; 
  assign dataArb_io_in_0_bits_eccMask = {_T_1573,_T_1570}; 
  assign dataArb_io_in_0_bits_way_en = pstore2_valid ? pstore2_way : pstore1_way; 
  assign dataArb_io_in_1_valid = _T_3421 ? _GEN_171 : _T_3329; 
  assign dataArb_io_in_1_bits_addr = _T_3335[11:0]; 
  assign dataArb_io_in_1_bits_write = _T_3421 ? _GEN_172 : 1'h1; 
  assign dataArb_io_in_1_bits_wdata = auto_out_d_bits_data; 
  assign dataArb_io_in_1_bits_eccMask = 8'hff; 
  assign dataArb_io_in_1_bits_way_en = s2_hit_valid ? s2_hit_way : _T_1047; 
  assign dataArb_io_in_2_valid = inWriteback & _T_3585; 
  assign dataArb_io_in_2_bits_addr = _T_3588 | _GEN_344; 
  assign dataArb_io_in_2_bits_wdata = dataArb_io_in_1_bits_wdata; 
  assign dataArb_io_in_2_bits_eccMask = dataArb_io_in_1_bits_eccMask; 
  assign dataArb_io_in_3_valid = io_cpu_req_valid & res; 
  assign dataArb_io_in_3_bits_addr = io_cpu_req_bits_addr[11:0]; 
  assign dataArb_io_in_3_bits_wdata = dataArb_io_in_1_bits_wdata; 
  assign dataArb_io_in_3_bits_eccMask = dataArb_io_in_1_bits_eccMask; 
  assign tlb_clock = gated_clock; 
  assign tlb_reset = reset; 
  assign tlb_io_req_valid = s1_valid_masked & s1_readwrite; 
  assign tlb_io_req_bits_vaddr = s1_req_addr; 
  assign tlb_io_req_bits_passthrough = s1_req_phys; 
  assign tlb_io_req_bits_size = s1_req_typ[1:0]; 
  assign tlb_io_req_bits_cmd = s1_req_cmd; 
  assign tlb_io_sfence_valid = s1_valid_masked & s1_sfence; 
  assign tlb_io_sfence_bits_rs1 = s1_req_typ[0]; 
  assign tlb_io_sfence_bits_rs2 = s1_req_typ[1]; 
  assign tlb_io_sfence_bits_addr = s1_req_addr[38:0]; 
  assign tlb_io_ptw_req_ready = io_ptw_req_ready; 
  assign tlb_io_ptw_resp_valid = io_ptw_resp_valid; 
  assign tlb_io_ptw_resp_bits_ae = io_ptw_resp_bits_ae; 
  assign tlb_io_ptw_resp_bits_pte_ppn = io_ptw_resp_bits_pte_ppn; 
  assign tlb_io_ptw_resp_bits_pte_d = io_ptw_resp_bits_pte_d; 
  assign tlb_io_ptw_resp_bits_pte_a = io_ptw_resp_bits_pte_a; 
  assign tlb_io_ptw_resp_bits_pte_g = io_ptw_resp_bits_pte_g; 
  assign tlb_io_ptw_resp_bits_pte_u = io_ptw_resp_bits_pte_u; 
  assign tlb_io_ptw_resp_bits_pte_x = io_ptw_resp_bits_pte_x; 
  assign tlb_io_ptw_resp_bits_pte_w = io_ptw_resp_bits_pte_w; 
  assign tlb_io_ptw_resp_bits_pte_r = io_ptw_resp_bits_pte_r; 
  assign tlb_io_ptw_resp_bits_pte_v = io_ptw_resp_bits_pte_v; 
  assign tlb_io_ptw_resp_bits_level = io_ptw_resp_bits_level; 
  assign tlb_io_ptw_resp_bits_fragmented_superpage = io_ptw_resp_bits_fragmented_superpage; 
  assign tlb_io_ptw_resp_bits_homogeneous = io_ptw_resp_bits_homogeneous; 
  assign tlb_io_ptw_ptbr_mode = io_ptw_ptbr_mode; 
  assign tlb_io_ptw_status_dprv = io_ptw_status_dprv; 
  assign tlb_io_ptw_status_mxr = io_ptw_status_mxr; 
  assign tlb_io_ptw_status_sum = io_ptw_status_sum; 
  assign tlb_io_ptw_pmp_0_cfg_l = io_ptw_pmp_0_cfg_l; 
  assign tlb_io_ptw_pmp_0_cfg_a = io_ptw_pmp_0_cfg_a; 
  assign tlb_io_ptw_pmp_0_cfg_x = io_ptw_pmp_0_cfg_x; 
  assign tlb_io_ptw_pmp_0_cfg_w = io_ptw_pmp_0_cfg_w; 
  assign tlb_io_ptw_pmp_0_cfg_r = io_ptw_pmp_0_cfg_r; 
  assign tlb_io_ptw_pmp_0_addr = io_ptw_pmp_0_addr; 
  assign tlb_io_ptw_pmp_0_mask = io_ptw_pmp_0_mask; 
  assign tlb_io_ptw_pmp_1_cfg_l = io_ptw_pmp_1_cfg_l; 
  assign tlb_io_ptw_pmp_1_cfg_a = io_ptw_pmp_1_cfg_a; 
  assign tlb_io_ptw_pmp_1_cfg_x = io_ptw_pmp_1_cfg_x; 
  assign tlb_io_ptw_pmp_1_cfg_w = io_ptw_pmp_1_cfg_w; 
  assign tlb_io_ptw_pmp_1_cfg_r = io_ptw_pmp_1_cfg_r; 
  assign tlb_io_ptw_pmp_1_addr = io_ptw_pmp_1_addr; 
  assign tlb_io_ptw_pmp_1_mask = io_ptw_pmp_1_mask; 
  assign tlb_io_ptw_pmp_2_cfg_l = io_ptw_pmp_2_cfg_l; 
  assign tlb_io_ptw_pmp_2_cfg_a = io_ptw_pmp_2_cfg_a; 
  assign tlb_io_ptw_pmp_2_cfg_x = io_ptw_pmp_2_cfg_x; 
  assign tlb_io_ptw_pmp_2_cfg_w = io_ptw_pmp_2_cfg_w; 
  assign tlb_io_ptw_pmp_2_cfg_r = io_ptw_pmp_2_cfg_r; 
  assign tlb_io_ptw_pmp_2_addr = io_ptw_pmp_2_addr; 
  assign tlb_io_ptw_pmp_2_mask = io_ptw_pmp_2_mask; 
  assign tlb_io_ptw_pmp_3_cfg_l = io_ptw_pmp_3_cfg_l; 
  assign tlb_io_ptw_pmp_3_cfg_a = io_ptw_pmp_3_cfg_a; 
  assign tlb_io_ptw_pmp_3_cfg_x = io_ptw_pmp_3_cfg_x; 
  assign tlb_io_ptw_pmp_3_cfg_w = io_ptw_pmp_3_cfg_w; 
  assign tlb_io_ptw_pmp_3_cfg_r = io_ptw_pmp_3_cfg_r; 
  assign tlb_io_ptw_pmp_3_addr = io_ptw_pmp_3_addr; 
  assign tlb_io_ptw_pmp_3_mask = io_ptw_pmp_3_mask; 
  assign tlb_io_ptw_pmp_4_cfg_l = io_ptw_pmp_4_cfg_l; 
  assign tlb_io_ptw_pmp_4_cfg_a = io_ptw_pmp_4_cfg_a; 
  assign tlb_io_ptw_pmp_4_cfg_x = io_ptw_pmp_4_cfg_x; 
  assign tlb_io_ptw_pmp_4_cfg_w = io_ptw_pmp_4_cfg_w; 
  assign tlb_io_ptw_pmp_4_cfg_r = io_ptw_pmp_4_cfg_r; 
  assign tlb_io_ptw_pmp_4_addr = io_ptw_pmp_4_addr; 
  assign tlb_io_ptw_pmp_4_mask = io_ptw_pmp_4_mask; 
  assign tlb_io_ptw_pmp_5_cfg_l = io_ptw_pmp_5_cfg_l; 
  assign tlb_io_ptw_pmp_5_cfg_a = io_ptw_pmp_5_cfg_a; 
  assign tlb_io_ptw_pmp_5_cfg_x = io_ptw_pmp_5_cfg_x; 
  assign tlb_io_ptw_pmp_5_cfg_w = io_ptw_pmp_5_cfg_w; 
  assign tlb_io_ptw_pmp_5_cfg_r = io_ptw_pmp_5_cfg_r; 
  assign tlb_io_ptw_pmp_5_addr = io_ptw_pmp_5_addr; 
  assign tlb_io_ptw_pmp_5_mask = io_ptw_pmp_5_mask; 
  assign tlb_io_ptw_pmp_6_cfg_l = io_ptw_pmp_6_cfg_l; 
  assign tlb_io_ptw_pmp_6_cfg_a = io_ptw_pmp_6_cfg_a; 
  assign tlb_io_ptw_pmp_6_cfg_x = io_ptw_pmp_6_cfg_x; 
  assign tlb_io_ptw_pmp_6_cfg_w = io_ptw_pmp_6_cfg_w; 
  assign tlb_io_ptw_pmp_6_cfg_r = io_ptw_pmp_6_cfg_r; 
  assign tlb_io_ptw_pmp_6_addr = io_ptw_pmp_6_addr; 
  assign tlb_io_ptw_pmp_6_mask = io_ptw_pmp_6_mask; 
  assign tlb_io_ptw_pmp_7_cfg_l = io_ptw_pmp_7_cfg_l; 
  assign tlb_io_ptw_pmp_7_cfg_a = io_ptw_pmp_7_cfg_a; 
  assign tlb_io_ptw_pmp_7_cfg_x = io_ptw_pmp_7_cfg_x; 
  assign tlb_io_ptw_pmp_7_cfg_w = io_ptw_pmp_7_cfg_w; 
  assign tlb_io_ptw_pmp_7_cfg_r = io_ptw_pmp_7_cfg_r; 
  assign tlb_io_ptw_pmp_7_addr = io_ptw_pmp_7_addr; 
  assign tlb_io_ptw_pmp_7_mask = io_ptw_pmp_7_mask; 
  assign tlb_io_kill = io_cpu_s2_kill; 
  assign amoalu_io_mask = pstore1_mask; 
  assign amoalu_io_cmd = pstore1_cmd; 
  assign amoalu_io_lhs = {_T_1012,_T_1009}; 
  assign amoalu_io_rhs = pstore1_data; 
  assign _GEN_351 = _T_3296 & grantIsCached; 
  assign _GEN_354 = _T_3296 & _T_3842; 
  assign _GEN_355 = _GEN_354 & grantIsUncached; 
  assign _GEN_356 = _GEN_355 & _T_3305; 
  assign _GEN_363 = grantIsUncached == 1'h0; 
  assign _GEN_364 = _GEN_354 & _GEN_363; 
  assign _GEN_365 = _GEN_364 & grantIsVoluntary; 
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
`ifdef RANDOMIZE
  integer initvar;
  initial begin
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
  _RAND_0 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    tag_array_0[initvar] = _RAND_0[27:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_1 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    tag_array_1[initvar] = _RAND_1[27:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_2 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    tag_array_2[initvar] = _RAND_2[27:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_3 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 64; initvar = initvar+1)
    tag_array_3[initvar] = _RAND_3[27:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  clock_en_reg = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  lfsr = _RAND_5[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  blockUncachedGrant = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  s1_valid = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  _T_3271 = _RAND_8[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  s1_probe = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  s2_probe = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  release_state = _RAND_11[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  grantInProgress = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  blockProbeAfterGrantCount = _RAND_13[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  lrscCount = _RAND_14[6:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  s2_valid_pre_xcpt = _RAND_15[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  probe_bits_param = _RAND_16[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  probe_bits_size = _RAND_17[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  probe_bits_source = _RAND_18[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {2{`RANDOM}};
  probe_bits_address = _RAND_19[37:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  s2_probe_state_state = _RAND_20[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{`RANDOM}};
  _T_3449 = _RAND_21[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{`RANDOM}};
  s2_release_data_valid = _RAND_22[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{`RANDOM}};
  s1_req_cmd = _RAND_23[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{`RANDOM}};
  _T_724 = _RAND_24[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{`RANDOM}};
  s2_req_cmd = _RAND_25[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{`RANDOM}};
  s2_hit_state_state = _RAND_26[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {2{`RANDOM}};
  lrscAddr = _RAND_27[33:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {2{`RANDOM}};
  s2_req_addr = _RAND_28[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_29 = {1{`RANDOM}};
  pstore1_held = _RAND_29[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_30 = {2{`RANDOM}};
  pstore1_addr = _RAND_30[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_31 = {2{`RANDOM}};
  s1_req_addr = _RAND_31[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_32 = {1{`RANDOM}};
  pstore1_mask = _RAND_32[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_33 = {1{`RANDOM}};
  s1_req_typ = _RAND_33[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_34 = {1{`RANDOM}};
  pstore2_valid = _RAND_34[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_35 = {2{`RANDOM}};
  pstore2_addr = _RAND_35[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_36 = {1{`RANDOM}};
  mask = _RAND_36[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_37 = {1{`RANDOM}};
  s1_req_tag = _RAND_37[6:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_38 = {1{`RANDOM}};
  s1_req_phys = _RAND_38[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_39 = {1{`RANDOM}};
  s1_flush_valid = _RAND_39[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_40 = {1{`RANDOM}};
  cached_grant_wait = _RAND_40[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_41 = {1{`RANDOM}};
  release_ack_wait = _RAND_41[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_42 = {1{`RANDOM}};
  uncachedInFlight_0 = _RAND_42[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_43 = {2{`RANDOM}};
  uncachedReqs_0_addr = _RAND_43[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_44 = {1{`RANDOM}};
  uncachedReqs_0_tag = _RAND_44[6:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_45 = {1{`RANDOM}};
  uncachedReqs_0_typ = _RAND_45[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_46 = {1{`RANDOM}};
  s2_hit_way = _RAND_46[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_47 = {1{`RANDOM}};
  _T_1046 = _RAND_47[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_48 = {1{`RANDOM}};
  s2_probe_way = _RAND_48[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_49 = {1{`RANDOM}};
  s2_req_tag = _RAND_49[6:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_50 = {1{`RANDOM}};
  s2_req_typ = _RAND_50[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_51 = {1{`RANDOM}};
  s2_uncached = _RAND_51[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_52 = {2{`RANDOM}};
  _T_732 = _RAND_52[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_53 = {1{`RANDOM}};
  s2_flush_valid_pre_tag_ecc = _RAND_53[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_54 = {2{`RANDOM}};
  s2_data = _RAND_54[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_55 = {1{`RANDOM}};
  s2_victim_tag = _RAND_55[25:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_56 = {1{`RANDOM}};
  _T_1054_state = _RAND_56[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_57 = {1{`RANDOM}};
  pstore1_cmd = _RAND_57[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_58 = {2{`RANDOM}};
  pstore1_data = _RAND_58[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_59 = {1{`RANDOM}};
  pstore1_way = _RAND_59[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_60 = {1{`RANDOM}};
  pstore1_rmw = _RAND_60[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_61 = {1{`RANDOM}};
  pstore2_way = _RAND_61[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_62 = {1{`RANDOM}};
  _T_1473 = _RAND_62[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_63 = {1{`RANDOM}};
  _T_1479 = _RAND_63[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_64 = {1{`RANDOM}};
  _T_1485 = _RAND_64[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_65 = {1{`RANDOM}};
  _T_1491 = _RAND_65[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_66 = {1{`RANDOM}};
  _T_1497 = _RAND_66[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_67 = {1{`RANDOM}};
  _T_1503 = _RAND_67[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_68 = {1{`RANDOM}};
  _T_1509 = _RAND_68[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_69 = {1{`RANDOM}};
  _T_1515 = _RAND_69[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_70 = {1{`RANDOM}};
  s1_release_data_valid = _RAND_70[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_71 = {1{`RANDOM}};
  _T_3617 = _RAND_71[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_72 = {1{`RANDOM}};
  _T_3619_pf_ld = _RAND_72[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_73 = {1{`RANDOM}};
  _T_3619_pf_st = _RAND_73[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_74 = {1{`RANDOM}};
  _T_3619_ae_ld = _RAND_74[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_75 = {1{`RANDOM}};
  _T_3619_ae_st = _RAND_75[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_76 = {1{`RANDOM}};
  _T_3619_ma_ld = _RAND_76[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_77 = {1{`RANDOM}};
  _T_3619_ma_st = _RAND_77[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_78 = {1{`RANDOM}};
  doUncachedResp = _RAND_78[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_79 = {1{`RANDOM}};
  resetting = _RAND_79[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_80 = {1{`RANDOM}};
  _T_3716 = _RAND_80[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_81 = {1{`RANDOM}};
  flushCounter = _RAND_81[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_82 = {1{`RANDOM}};
  tag_array_0_s1_meta_addr_pipe_0 = _RAND_82[5:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_83 = {1{`RANDOM}};
  tag_array_1_s1_meta_addr_pipe_0 = _RAND_83[5:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_84 = {1{`RANDOM}};
  tag_array_2_s1_meta_addr_pipe_0 = _RAND_84[5:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_85 = {1{`RANDOM}};
  tag_array_3_s1_meta_addr_pipe_0 = _RAND_85[5:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge gated_clock) begin
    if(tag_array_0__T_553_en & tag_array_0__T_553_mask) begin
      tag_array_0[tag_array_0__T_553_addr] <= tag_array_0__T_553_data; 
    end
    if(tag_array_1__T_553_en & tag_array_1__T_553_mask) begin
      tag_array_1[tag_array_1__T_553_addr] <= tag_array_1__T_553_data; 
    end
    if(tag_array_2__T_553_en & tag_array_2__T_553_mask) begin
      tag_array_2[tag_array_2__T_553_addr] <= tag_array_2__T_553_data; 
    end
    if(tag_array_3__T_553_en & tag_array_3__T_553_mask) begin
      tag_array_3[tag_array_3__T_553_addr] <= tag_array_3__T_553_data; 
    end
    clock_en_reg <= _T_3777 | _T_3426;
    if (reset) begin
      lfsr <= 16'h1;
    end else begin
      if (_GEN_159) begin
        lfsr <= _T_243;
      end
    end
    if (_T_3421) begin
      if (auto_out_d_valid) begin
        blockUncachedGrant <= _T_3331;
      end else begin
        blockUncachedGrant <= dataArb_io_out_valid;
      end
    end else begin
      blockUncachedGrant <= dataArb_io_out_valid;
    end
    if (reset) begin
      s1_valid <= 1'h0;
    end else begin
      s1_valid <= _T_274;
    end
    if (reset) begin
      _T_3271 <= 4'h0;
    end else begin
      if (_T_3296) begin
        if (d_first) begin
          if (_T_3268) begin
            _T_3271 <= _T_3267;
          end else begin
            _T_3271 <= 4'h0;
          end
        end else begin
          _T_3271 <= _T_3274;
        end
      end
    end
    if (reset) begin
      s1_probe <= 1'h0;
    end else begin
      if (_T_3510) begin
        if (metaArb_io_in_6_ready) begin
          s1_probe <= 1'h1;
        end else begin
          s1_probe <= _T_276;
        end
      end else begin
        s1_probe <= _T_276;
      end
    end
    if (reset) begin
      s2_probe <= 1'h0;
    end else begin
      s2_probe <= s1_probe;
    end
    if (reset) begin
      release_state <= 3'h0;
    end else begin
      if (_T_3605) begin
        release_state <= 3'h0;
      end else begin
        if (_T_3519) begin
          if (releaseDone) begin
            release_state <= 3'h6;
          end else begin
            if (_T_3516) begin
              if (releaseDone) begin
                release_state <= 3'h7;
              end else begin
                if (_T_3515) begin
                  if (releaseDone) begin
                    release_state <= 3'h7;
                  end else begin
                    if (_T_3514) begin
                      if (releaseDone) begin
                        release_state <= 3'h0;
                      end else begin
                        if (_T_3510) begin
                          if (metaArb_io_in_6_ready) begin
                            release_state <= 3'h0;
                          end else begin
                            if (s2_probe) begin
                              if (s2_prb_ack_data) begin
                                release_state <= 3'h2;
                              end else begin
                                if (_T_3506) begin
                                  if (releaseDone) begin
                                    release_state <= 3'h7;
                                  end else begin
                                    release_state <= 3'h3;
                                  end
                                end else begin
                                  if (releaseDone) begin
                                    release_state <= 3'h0;
                                  end else begin
                                    release_state <= 3'h5;
                                  end
                                end
                              end
                            end else begin
                              if (_T_3493) begin
                                release_state <= 3'h1;
                              end
                            end
                          end
                        end else begin
                          if (s2_probe) begin
                            if (s2_prb_ack_data) begin
                              release_state <= 3'h2;
                            end else begin
                              if (_T_3506) begin
                                if (releaseDone) begin
                                  release_state <= 3'h7;
                                end else begin
                                  release_state <= 3'h3;
                                end
                              end else begin
                                if (releaseDone) begin
                                  release_state <= 3'h0;
                                end else begin
                                  release_state <= 3'h5;
                                end
                              end
                            end
                          end else begin
                            if (_T_3493) begin
                              release_state <= 3'h1;
                            end
                          end
                        end
                      end
                    end else begin
                      if (_T_3510) begin
                        if (metaArb_io_in_6_ready) begin
                          release_state <= 3'h0;
                        end else begin
                          if (s2_probe) begin
                            if (s2_prb_ack_data) begin
                              release_state <= 3'h2;
                            end else begin
                              if (_T_3506) begin
                                if (releaseDone) begin
                                  release_state <= 3'h7;
                                end else begin
                                  release_state <= 3'h3;
                                end
                              end else begin
                                if (releaseDone) begin
                                  release_state <= 3'h0;
                                end else begin
                                  release_state <= 3'h5;
                                end
                              end
                            end
                          end else begin
                            if (_T_3493) begin
                              release_state <= 3'h1;
                            end
                          end
                        end
                      end else begin
                        if (s2_probe) begin
                          if (s2_prb_ack_data) begin
                            release_state <= 3'h2;
                          end else begin
                            if (_T_3506) begin
                              if (releaseDone) begin
                                release_state <= 3'h7;
                              end else begin
                                release_state <= 3'h3;
                              end
                            end else begin
                              if (releaseDone) begin
                                release_state <= 3'h0;
                              end else begin
                                release_state <= 3'h5;
                              end
                            end
                          end
                        end else begin
                          if (_T_3493) begin
                            release_state <= 3'h1;
                          end
                        end
                      end
                    end
                  end
                end else begin
                  if (_T_3514) begin
                    if (releaseDone) begin
                      release_state <= 3'h0;
                    end else begin
                      if (_T_3510) begin
                        if (metaArb_io_in_6_ready) begin
                          release_state <= 3'h0;
                        end else begin
                          release_state <= _GEN_220;
                        end
                      end else begin
                        release_state <= _GEN_220;
                      end
                    end
                  end else begin
                    if (_T_3510) begin
                      if (metaArb_io_in_6_ready) begin
                        release_state <= 3'h0;
                      end else begin
                        release_state <= _GEN_220;
                      end
                    end else begin
                      release_state <= _GEN_220;
                    end
                  end
                end
              end
            end else begin
              if (_T_3515) begin
                if (releaseDone) begin
                  release_state <= 3'h7;
                end else begin
                  if (_T_3514) begin
                    if (releaseDone) begin
                      release_state <= 3'h0;
                    end else begin
                      release_state <= _GEN_235;
                    end
                  end else begin
                    release_state <= _GEN_235;
                  end
                end
              end else begin
                if (_T_3514) begin
                  if (releaseDone) begin
                    release_state <= 3'h0;
                  end else begin
                    release_state <= _GEN_235;
                  end
                end else begin
                  release_state <= _GEN_235;
                end
              end
            end
          end
        end else begin
          if (_T_3516) begin
            if (releaseDone) begin
              release_state <= 3'h7;
            end else begin
              if (_T_3515) begin
                if (releaseDone) begin
                  release_state <= 3'h7;
                end else begin
                  release_state <= _GEN_239;
                end
              end else begin
                release_state <= _GEN_239;
              end
            end
          end else begin
            if (_T_3515) begin
              if (releaseDone) begin
                release_state <= 3'h7;
              end else begin
                release_state <= _GEN_239;
              end
            end else begin
              release_state <= _GEN_239;
            end
          end
        end
      end
    end
    if (reset) begin
      grantInProgress <= 1'h0;
    end else begin
      if (_T_3296) begin
        if (grantIsCached) begin
          if (d_last) begin
            grantInProgress <= 1'h0;
          end else begin
            grantInProgress <= 1'h1;
          end
        end
      end
    end
    if (reset) begin
      blockProbeAfterGrantCount <= 3'h0;
    end else begin
      if (_T_3296) begin
        if (grantIsCached) begin
          if (d_last) begin
            blockProbeAfterGrantCount <= 3'h7;
          end else begin
            if (_T_3426) begin
              blockProbeAfterGrantCount <= _T_3291;
            end
          end
        end else begin
          if (_T_3426) begin
            blockProbeAfterGrantCount <= _T_3291;
          end
        end
      end else begin
        if (_T_3426) begin
          blockProbeAfterGrantCount <= _T_3291;
        end
      end
    end
    if (reset) begin
      lrscCount <= 7'h0;
    end else begin
      if (s1_probe) begin
        lrscCount <= 7'h0;
      end else begin
        if (_T_1255) begin
          lrscCount <= 7'h3;
        end else begin
          if (_T_1237) begin
            lrscCount <= _T_1254;
          end else begin
            if (_T_1248) begin
              if (s2_hit) begin
                lrscCount <= 7'h4f;
              end else begin
                lrscCount <= 7'h0;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      s2_valid_pre_xcpt <= 1'h0;
    end else begin
      s2_valid_pre_xcpt <= _T_710;
    end
    if (_T_3493) begin
      probe_bits_param <= 2'h0;
    end else begin
      if (_T_276) begin
        probe_bits_param <= auto_out_b_bits_param;
      end
    end
    if (_T_3493) begin
      probe_bits_size <= 3'h0;
    end else begin
      if (_T_276) begin
        probe_bits_size <= auto_out_b_bits_size;
      end
    end
    if (_T_3493) begin
      probe_bits_source <= 1'h0;
    end else begin
      if (_T_276) begin
        probe_bits_source <= auto_out_b_bits_source;
      end
    end
    if (_T_3493) begin
      probe_bits_address <= res_2_address;
    end else begin
      if (_T_276) begin
        probe_bits_address <= auto_out_b_bits_address;
      end
    end
    if (s1_probe) begin
      s2_probe_state_state <= s1_meta_hit_state_state;
    end
    if (reset) begin
      _T_3449 <= 4'h0;
    end else begin
      if (_T_3440) begin
        if (c_first) begin
          if (_T_3446) begin
            _T_3449 <= _T_3445;
          end else begin
            _T_3449 <= 4'h0;
          end
        end else begin
          _T_3449 <= _T_3452;
        end
      end
    end
    s2_release_data_valid <= s1_release_data_valid & _T_3460;
    if (s0_clk_en) begin
      s1_req_cmd <= io_cpu_req_bits_cmd;
    end
    _T_724 <= s1_nack == 1'h0;
    if (_T_3296) begin
      if (grantIsCached) begin
        if (_T_728) begin
          s2_req_cmd <= s1_req_cmd;
        end
      end else begin
        if (grantIsUncached) begin
          if (grantIsUncachedData) begin
            s2_req_cmd <= 5'h0;
          end else begin
            if (_T_728) begin
              s2_req_cmd <= s1_req_cmd;
            end
          end
        end else begin
          if (_T_728) begin
            s2_req_cmd <= s1_req_cmd;
          end
        end
      end
    end else begin
      if (_T_728) begin
        s2_req_cmd <= s1_req_cmd;
      end
    end
    if (_T_728) begin
      s2_hit_state_state <= s1_meta_hit_state_state;
    end
    if (_T_1248) begin
      lrscAddr <= _T_1240;
    end
    if (_T_3296) begin
      if (grantIsCached) begin
        if (_T_728) begin
          s2_req_addr <= {{2'd0}, tlb_io_resp_paddr};
        end
      end else begin
        if (grantIsUncached) begin
          if (grantIsUncachedData) begin
            s2_req_addr <= {{2'd0}, _T_3312};
          end else begin
            if (_T_728) begin
              s2_req_addr <= {{2'd0}, tlb_io_resp_paddr};
            end
          end
        end else begin
          if (_T_728) begin
            s2_req_addr <= {{2'd0}, tlb_io_resp_paddr};
          end
        end
      end
    end else begin
      if (_T_728) begin
        s2_req_addr <= {{2'd0}, tlb_io_resp_paddr};
      end
    end
    pstore1_held <= _T_1456 & _T_1457;
    if (_T_1264) begin
      pstore1_addr <= s1_req_addr;
    end
    if (s0_clk_en) begin
      s1_req_addr <= _T_286;
    end
    if (_T_1264) begin
      if (_T_311) begin
        pstore1_mask <= io_cpu_s1_data_mask;
      end else begin
        pstore1_mask <= _T_708;
      end
    end
    if (s0_clk_en) begin
      s1_req_typ <= io_cpu_req_bits_typ;
    end
    pstore2_valid <= _T_1462 | advance_pstore1;
    if (advance_pstore1) begin
      pstore2_addr <= pstore1_addr;
    end
    if (advance_pstore1) begin
      mask <= _T_1527;
    end
    if (s0_clk_en) begin
      s1_req_tag <= io_cpu_req_bits_tag;
    end
    if (s0_clk_en) begin
      if (_T_287) begin
        s1_req_phys <= 1'h1;
      end else begin
        s1_req_phys <= io_cpu_req_bits_phys;
      end
    end
    s1_flush_valid <= _T_3743 & can_acquire_before_release;
    if (reset) begin
      cached_grant_wait <= 1'h0;
    end else begin
      if (_T_3296) begin
        if (grantIsCached) begin
          if (d_last) begin
            cached_grant_wait <= 1'h0;
          end else begin
            if (_T_3260) begin
              if (!(s2_uncached)) begin
                cached_grant_wait <= 1'h1;
              end
            end
          end
        end else begin
          if (_T_3260) begin
            if (!(s2_uncached)) begin
              cached_grant_wait <= 1'h1;
            end
          end
        end
      end else begin
        if (_T_3260) begin
          if (!(s2_uncached)) begin
            cached_grant_wait <= 1'h1;
          end
        end
      end
    end
    if (reset) begin
      release_ack_wait <= 1'h0;
    end else begin
      if (_T_3519) begin
        if (_T_3583) begin
          release_ack_wait <= 1'h1;
        end else begin
          if (_T_3296) begin
            if (!(grantIsCached)) begin
              if (!(grantIsUncached)) begin
                if (grantIsVoluntary) begin
                  release_ack_wait <= 1'h0;
                end
              end
            end
          end
        end
      end else begin
        if (_T_3296) begin
          if (!(grantIsCached)) begin
            if (!(grantIsUncached)) begin
              if (grantIsVoluntary) begin
                release_ack_wait <= 1'h0;
              end
            end
          end
        end
      end
    end
    if (reset) begin
      uncachedInFlight_0 <= 1'h0;
    end else begin
      if (_T_3296) begin
        if (grantIsCached) begin
          if (_T_3260) begin
            if (s2_uncached) begin
              if (a_sel) begin
                uncachedInFlight_0 <= 1'h1;
              end
            end
          end
        end else begin
          if (grantIsUncached) begin
            if (_T_3305) begin
              uncachedInFlight_0 <= 1'h0;
            end else begin
              if (_T_3260) begin
                if (s2_uncached) begin
                  if (a_sel) begin
                    uncachedInFlight_0 <= 1'h1;
                  end
                end
              end
            end
          end else begin
            if (_T_3260) begin
              if (s2_uncached) begin
                if (a_sel) begin
                  uncachedInFlight_0 <= 1'h1;
                end
              end
            end
          end
        end
      end else begin
        if (_T_3260) begin
          if (s2_uncached) begin
            if (a_sel) begin
              uncachedInFlight_0 <= 1'h1;
            end
          end
        end
      end
    end
    if (_T_3260) begin
      if (s2_uncached) begin
        if (a_sel) begin
          uncachedReqs_0_addr <= s2_req_addr;
        end
      end
    end
    if (_T_3260) begin
      if (s2_uncached) begin
        if (a_sel) begin
          uncachedReqs_0_tag <= s2_req_tag;
        end
      end
    end
    if (_T_3260) begin
      if (s2_uncached) begin
        if (a_sel) begin
          uncachedReqs_0_typ <= s2_req_typ;
        end
      end
    end
    if (s1_valid_not_nacked) begin
      s2_hit_way <= s1_meta_hit_way;
    end
    if (_T_728) begin
      _T_1046 <= s1_victim_way;
    end
    if (s1_probe) begin
      s2_probe_way <= s1_meta_hit_way;
    end
    if (_T_3296) begin
      if (grantIsCached) begin
        if (_T_728) begin
          s2_req_tag <= s1_req_tag;
        end
      end else begin
        if (grantIsUncached) begin
          if (grantIsUncachedData) begin
            s2_req_tag <= uncachedReqs_0_tag;
          end else begin
            if (_T_728) begin
              s2_req_tag <= s1_req_tag;
            end
          end
        end else begin
          if (_T_728) begin
            s2_req_tag <= s1_req_tag;
          end
        end
      end
    end else begin
      if (_T_728) begin
        s2_req_tag <= s1_req_tag;
      end
    end
    if (_T_3296) begin
      if (grantIsCached) begin
        if (_T_728) begin
          s2_req_typ <= s1_req_typ;
        end
      end else begin
        if (grantIsUncached) begin
          if (grantIsUncachedData) begin
            s2_req_typ <= uncachedReqs_0_typ;
          end else begin
            if (_T_728) begin
              s2_req_typ <= s1_req_typ;
            end
          end
        end else begin
          if (_T_728) begin
            s2_req_typ <= s1_req_typ;
          end
        end
      end
    end else begin
      if (_T_728) begin
        s2_req_typ <= s1_req_typ;
      end
    end
    if (_T_728) begin
      s2_uncached <= _T_729;
    end
    if (_T_728) begin
      _T_732 <= s1_req_addr;
    end
    s2_flush_valid_pre_tag_ecc <= s1_flush_valid;
    if (_T_857) begin
      s2_data <= _T_853;
    end
    if (_T_728) begin
      if (_T_655) begin
        s2_victim_tag <= _T_608;
      end else begin
        if (_T_653) begin
          s2_victim_tag <= _T_601;
        end else begin
          if (_T_651) begin
            s2_victim_tag <= _T_594;
          end else begin
            s2_victim_tag <= _T_587;
          end
        end
      end
    end
    if (_T_728) begin
      if (_T_655) begin
        _T_1054_state <= _T_609;
      end else begin
        if (_T_653) begin
          _T_1054_state <= _T_602;
        end else begin
          if (_T_651) begin
            _T_1054_state <= _T_595;
          end else begin
            _T_1054_state <= _T_588;
          end
        end
      end
    end
    if (_T_1264) begin
      pstore1_cmd <= s1_req_cmd;
    end
    if (_T_1264) begin
      pstore1_data <= io_cpu_s1_data_data;
    end
    if (_T_1264) begin
      pstore1_way <= s1_meta_hit_way;
    end
    if (_T_1264) begin
      pstore1_rmw <= _T_1326;
    end
    if (advance_pstore1) begin
      pstore2_way <= pstore1_way;
    end
    if (advance_pstore1) begin
      _T_1473 <= _T_1468;
    end
    if (advance_pstore1) begin
      _T_1479 <= _T_1474;
    end
    if (advance_pstore1) begin
      _T_1485 <= _T_1480;
    end
    if (advance_pstore1) begin
      _T_1491 <= _T_1486;
    end
    if (advance_pstore1) begin
      _T_1497 <= _T_1492;
    end
    if (advance_pstore1) begin
      _T_1503 <= _T_1498;
    end
    if (advance_pstore1) begin
      _T_1509 <= _T_1504;
    end
    if (advance_pstore1) begin
      _T_1515 <= _T_1510;
    end
    s1_release_data_valid <= dataArb_io_in_2_ready & dataArb_io_in_2_valid;
    _T_3617 <= tlb_io_req_valid & _T_282;
    if (s1_valid_not_nacked) begin
      _T_3619_pf_ld <= tlb_io_resp_pf_ld;
    end
    if (s1_valid_not_nacked) begin
      _T_3619_pf_st <= tlb_io_resp_pf_st;
    end
    if (s1_valid_not_nacked) begin
      _T_3619_ae_ld <= tlb_io_resp_ae_ld;
    end
    if (s1_valid_not_nacked) begin
      _T_3619_ae_st <= tlb_io_resp_ae_st;
    end
    if (s1_valid_not_nacked) begin
      _T_3619_ma_ld <= tlb_io_resp_ma_ld;
    end
    if (s1_valid_not_nacked) begin
      _T_3619_ma_st <= tlb_io_resp_ma_st;
    end
    doUncachedResp <= io_cpu_replay_next;
    if (reset) begin
      resetting <= 1'h0;
    end else begin
      if (resetting) begin
        if (flushDone) begin
          resetting <= 1'h0;
        end else begin
          if (_T_3716) begin
            resetting <= 1'h1;
          end
        end
      end else begin
        if (_T_3716) begin
          resetting <= 1'h1;
        end
      end
    end
    _T_3716 <= reset;
    if (reset) begin
      flushCounter <= 8'hc0;
    end else begin
      flushCounter <= _GEN_295[7:0];
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_458) begin
          $fwrite(32'h80000002,"Assertion failed\n    at DCache.scala:913 assert(!needsRead(req) || res)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_458) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_458) begin
          $fwrite(32'h80000002,"Assertion failed\n    at DCache.scala:913 assert(!needsRead(req) || res)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_458) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1428) begin
          $fwrite(32'h80000002,"Assertion failed\n    at DCache.scala:366 assert(pstore1_rmw || pstore1_valid_not_rmw(io.cpu.s2_kill) === pstore1_valid)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1428) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_351 & _T_3299) begin
          $fwrite(32'h80000002,"Assertion failed: A GrantData was unexpected by the dcache.\n    at DCache.scala:500 assert(cached_grant_wait, \"A GrantData was unexpected by the dcache.\")\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_351 & _T_3299) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_356 & _T_3308) begin
          $fwrite(32'h80000002,"Assertion failed: An AccessAck was unexpected by the dcache.\n    at DCache.scala:512 assert(f, \"An AccessAck was unexpected by the dcache.\") // TODO must handle Ack coming back on same cycle!\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_356 & _T_3308) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_365 & _T_3315) begin
          $fwrite(32'h80000002,"Assertion failed: A ReleaseAck was unexpected by the dcache.\n    at DCache.scala:530 assert(release_ack_wait, \"A ReleaseAck was unexpected by the dcache.\") // TODO should handle Ack coming back on same cycle!\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_365 & _T_3315) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_3328) begin
          $fwrite(32'h80000002,"Assertion failed\n    at DCache.scala:538 assert(tl_out.e.fire() === (tl_out.d.fire() && d_first && grantIsCached))\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_3328) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_3493 & _T_3500) begin
          $fwrite(32'h80000002,"Assertion failed\n    at DCache.scala:616 assert(!(s2_valid && s2_hit_valid && !s2_data_error))\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_3493 & _T_3500) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (doUncachedResp & _T_3647) begin
          $fwrite(32'h80000002,"Assertion failed\n    at DCache.scala:723 assert(!s2_valid_hit)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (doUncachedResp & _T_3647) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    if (_GEN_41) begin
      tag_array_0_s1_meta_addr_pipe_0 <= _GEN_29;
    end
    if (_GEN_41) begin
      tag_array_1_s1_meta_addr_pipe_0 <= _GEN_29;
    end
    if (_GEN_41) begin
      tag_array_2_s1_meta_addr_pipe_0 <= _GEN_29;
    end
    if (_GEN_41) begin
      tag_array_3_s1_meta_addr_pipe_0 <= _GEN_29;
    end
  end
endmodule
