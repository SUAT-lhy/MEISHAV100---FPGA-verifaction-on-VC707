module RocketTile( 
  input wire debug_mode_sel_latch,
  input wire [31:0] reset_vector_msb_32,
  input         clock, 
  input         reset, 
  input         auto_intsink_in_sync_0, 
  input         auto_int_in_xing_in_2_sync_0, 
  input         auto_int_in_xing_in_1_sync_0, 
  input         auto_int_in_xing_in_0_sync_0, 
  input         auto_int_in_xing_in_0_sync_1, 
  input         auto_tl_master_xing_out_a_ready, 
  output        auto_tl_master_xing_out_a_valid, 
  output [2:0]  auto_tl_master_xing_out_a_bits_opcode, 
  output [2:0]  auto_tl_master_xing_out_a_bits_param, 
  output [2:0]  auto_tl_master_xing_out_a_bits_size, 
  output [1:0]  auto_tl_master_xing_out_a_bits_source, 
  output [37:0] auto_tl_master_xing_out_a_bits_address, 
  output [7:0]  auto_tl_master_xing_out_a_bits_mask, 
  output [63:0] auto_tl_master_xing_out_a_bits_data, 
  output        auto_tl_master_xing_out_a_bits_corrupt, 
  output        auto_tl_master_xing_out_b_ready, 
  input         auto_tl_master_xing_out_b_valid, 
  input  [2:0]  auto_tl_master_xing_out_b_bits_opcode, 
  input  [1:0]  auto_tl_master_xing_out_b_bits_param, 
  input  [2:0]  auto_tl_master_xing_out_b_bits_size, 
  input  [1:0]  auto_tl_master_xing_out_b_bits_source, 
  input  [37:0] auto_tl_master_xing_out_b_bits_address, 
  input  [7:0]  auto_tl_master_xing_out_b_bits_mask, 
  input         auto_tl_master_xing_out_b_bits_corrupt, 
  input         auto_tl_master_xing_out_c_ready, 
  output        auto_tl_master_xing_out_c_valid, 
  output [2:0]  auto_tl_master_xing_out_c_bits_opcode, 
  output [2:0]  auto_tl_master_xing_out_c_bits_param, 
  output [2:0]  auto_tl_master_xing_out_c_bits_size, 
  output [1:0]  auto_tl_master_xing_out_c_bits_source, 
  output [37:0] auto_tl_master_xing_out_c_bits_address, 
  output [63:0] auto_tl_master_xing_out_c_bits_data, 
  output        auto_tl_master_xing_out_c_bits_corrupt, 
  output        auto_tl_master_xing_out_d_ready, 
  input         auto_tl_master_xing_out_d_valid, 
  input  [2:0]  auto_tl_master_xing_out_d_bits_opcode, 
  input  [1:0]  auto_tl_master_xing_out_d_bits_param, 
  input  [2:0]  auto_tl_master_xing_out_d_bits_size, 
  input  [1:0]  auto_tl_master_xing_out_d_bits_source, 
  input  [2:0]  auto_tl_master_xing_out_d_bits_sink, 
  input         auto_tl_master_xing_out_d_bits_denied, 
  input  [63:0] auto_tl_master_xing_out_d_bits_data, 
  input         auto_tl_master_xing_out_d_bits_corrupt, 
  input         auto_tl_master_xing_out_e_ready, 
  output        auto_tl_master_xing_out_e_valid, 
  output [2:0]  auto_tl_master_xing_out_e_bits_sink, 
  input  [1:0]  constants_hartid 
);
  wire  tlMasterXbar_clock; 
  wire  tlMasterXbar_reset; 
  wire  tlMasterXbar_auto_in_1_a_ready; 
  wire  tlMasterXbar_auto_in_1_a_valid; 
  wire [2:0] tlMasterXbar_auto_in_1_a_bits_opcode; 
  wire [2:0] tlMasterXbar_auto_in_1_a_bits_param; 
  wire [2:0] tlMasterXbar_auto_in_1_a_bits_size; 
  wire  tlMasterXbar_auto_in_1_a_bits_source; 
  wire [37:0] tlMasterXbar_auto_in_1_a_bits_address; 
  wire [7:0] tlMasterXbar_auto_in_1_a_bits_mask; 
  wire [63:0] tlMasterXbar_auto_in_1_a_bits_data; 
  wire  tlMasterXbar_auto_in_1_a_bits_corrupt; 
  wire  tlMasterXbar_auto_in_1_c_valid; 
  wire  tlMasterXbar_auto_in_1_d_ready; 
  wire  tlMasterXbar_auto_in_1_d_valid; 
  wire [2:0] tlMasterXbar_auto_in_1_d_bits_opcode; 
  wire [2:0] tlMasterXbar_auto_in_1_d_bits_size; 
  wire [63:0] tlMasterXbar_auto_in_1_d_bits_data; 
  wire  tlMasterXbar_auto_in_1_d_bits_corrupt; 
  wire  tlMasterXbar_auto_in_1_e_valid; 
  wire  tlMasterXbar_auto_in_0_a_ready; 
  wire  tlMasterXbar_auto_in_0_a_valid; 
  wire [2:0] tlMasterXbar_auto_in_0_a_bits_opcode; 
  wire [2:0] tlMasterXbar_auto_in_0_a_bits_param; 
  wire [2:0] tlMasterXbar_auto_in_0_a_bits_size; 
  wire  tlMasterXbar_auto_in_0_a_bits_source; 
  wire [37:0] tlMasterXbar_auto_in_0_a_bits_address; 
  wire [7:0] tlMasterXbar_auto_in_0_a_bits_mask; 
  wire [63:0] tlMasterXbar_auto_in_0_a_bits_data; 
  wire  tlMasterXbar_auto_in_0_a_bits_corrupt; 
  wire  tlMasterXbar_auto_in_0_b_ready; 
  wire  tlMasterXbar_auto_in_0_b_valid; 
  wire [1:0] tlMasterXbar_auto_in_0_b_bits_param; 
  wire [2:0] tlMasterXbar_auto_in_0_b_bits_size; 
  wire  tlMasterXbar_auto_in_0_b_bits_source; 
  wire [37:0] tlMasterXbar_auto_in_0_b_bits_address; 
  wire  tlMasterXbar_auto_in_0_c_ready; 
  wire  tlMasterXbar_auto_in_0_c_valid; 
  wire [2:0] tlMasterXbar_auto_in_0_c_bits_opcode; 
  wire [2:0] tlMasterXbar_auto_in_0_c_bits_param; 
  wire [2:0] tlMasterXbar_auto_in_0_c_bits_size; 
  wire  tlMasterXbar_auto_in_0_c_bits_source; 
  wire [37:0] tlMasterXbar_auto_in_0_c_bits_address; 
  wire [63:0] tlMasterXbar_auto_in_0_c_bits_data; 
  wire  tlMasterXbar_auto_in_0_c_bits_corrupt; 
  wire  tlMasterXbar_auto_in_0_d_ready; 
  wire  tlMasterXbar_auto_in_0_d_valid; 
  wire [2:0] tlMasterXbar_auto_in_0_d_bits_opcode; 
  wire [1:0] tlMasterXbar_auto_in_0_d_bits_param; 
  wire [2:0] tlMasterXbar_auto_in_0_d_bits_size; 
  wire  tlMasterXbar_auto_in_0_d_bits_source; 
  wire [2:0] tlMasterXbar_auto_in_0_d_bits_sink; 
  wire  tlMasterXbar_auto_in_0_d_bits_denied; 
  wire [63:0] tlMasterXbar_auto_in_0_d_bits_data; 
  wire  tlMasterXbar_auto_in_0_e_ready; 
  wire  tlMasterXbar_auto_in_0_e_valid; 
  wire [2:0] tlMasterXbar_auto_in_0_e_bits_sink; 
  wire  tlMasterXbar_auto_out_a_ready; 
  wire  tlMasterXbar_auto_out_a_valid; 
  wire [2:0] tlMasterXbar_auto_out_a_bits_opcode; 
  wire [2:0] tlMasterXbar_auto_out_a_bits_param; 
  wire [2:0] tlMasterXbar_auto_out_a_bits_size; 
  wire [1:0] tlMasterXbar_auto_out_a_bits_source; 
  wire [37:0] tlMasterXbar_auto_out_a_bits_address; 
  wire [7:0] tlMasterXbar_auto_out_a_bits_mask; 
  wire [63:0] tlMasterXbar_auto_out_a_bits_data; 
  wire  tlMasterXbar_auto_out_a_bits_corrupt; 
  wire  tlMasterXbar_auto_out_b_ready; 
  wire  tlMasterXbar_auto_out_b_valid; 
  wire [2:0] tlMasterXbar_auto_out_b_bits_opcode; 
  wire [1:0] tlMasterXbar_auto_out_b_bits_param; 
  wire [2:0] tlMasterXbar_auto_out_b_bits_size; 
  wire [1:0] tlMasterXbar_auto_out_b_bits_source; 
  wire [37:0] tlMasterXbar_auto_out_b_bits_address; 
  wire [7:0] tlMasterXbar_auto_out_b_bits_mask; 
  wire  tlMasterXbar_auto_out_b_bits_corrupt; 
  wire  tlMasterXbar_auto_out_c_ready; 
  wire  tlMasterXbar_auto_out_c_valid; 
  wire [2:0] tlMasterXbar_auto_out_c_bits_opcode; 
  wire [2:0] tlMasterXbar_auto_out_c_bits_param; 
  wire [2:0] tlMasterXbar_auto_out_c_bits_size; 
  wire [1:0] tlMasterXbar_auto_out_c_bits_source; 
  wire [37:0] tlMasterXbar_auto_out_c_bits_address; 
  wire [63:0] tlMasterXbar_auto_out_c_bits_data; 
  wire  tlMasterXbar_auto_out_c_bits_corrupt; 
  wire  tlMasterXbar_auto_out_d_ready; 
  wire  tlMasterXbar_auto_out_d_valid; 
  wire [2:0] tlMasterXbar_auto_out_d_bits_opcode; 
  wire [1:0] tlMasterXbar_auto_out_d_bits_param; 
  wire [2:0] tlMasterXbar_auto_out_d_bits_size; 
  wire [1:0] tlMasterXbar_auto_out_d_bits_source; 
  wire [2:0] tlMasterXbar_auto_out_d_bits_sink; 
  wire  tlMasterXbar_auto_out_d_bits_denied; 
  wire [63:0] tlMasterXbar_auto_out_d_bits_data; 
  wire  tlMasterXbar_auto_out_d_bits_corrupt; 
  wire  tlMasterXbar_auto_out_e_ready; 
  wire  tlMasterXbar_auto_out_e_valid; 
  wire [2:0] tlMasterXbar_auto_out_e_bits_sink; 
  wire  intXbar_auto_int_in_3_0; 
  wire  intXbar_auto_int_in_2_0; 
  wire  intXbar_auto_int_in_1_0; 
  wire  intXbar_auto_int_in_1_1; 
  wire  intXbar_auto_int_in_0_0; 
  wire  intXbar_auto_int_out_0; 
  wire  intXbar_auto_int_out_1; 
  wire  intXbar_auto_int_out_2; 
  wire  intXbar_auto_int_out_3; 
  wire  intXbar_auto_int_out_4; 
  wire  dcache_gated_clock; 
  wire  dcache_reset; 
  wire  dcache_auto_out_a_ready; 
  wire  dcache_auto_out_a_valid; 
  wire [2:0] dcache_auto_out_a_bits_opcode; 
  wire [2:0] dcache_auto_out_a_bits_param; 
  wire [2:0] dcache_auto_out_a_bits_size; 
  wire  dcache_auto_out_a_bits_source; 
  wire [37:0] dcache_auto_out_a_bits_address; 
  wire [7:0] dcache_auto_out_a_bits_mask; 
  wire [63:0] dcache_auto_out_a_bits_data; 
  wire  dcache_auto_out_b_ready; 
  wire  dcache_auto_out_b_valid; 
  wire [1:0] dcache_auto_out_b_bits_param; 
  wire [2:0] dcache_auto_out_b_bits_size; 
  wire  dcache_auto_out_b_bits_source; 
  wire [37:0] dcache_auto_out_b_bits_address; 
  wire  dcache_auto_out_c_ready; 
  wire  dcache_auto_out_c_valid; 
  wire [2:0] dcache_auto_out_c_bits_opcode; 
  wire [2:0] dcache_auto_out_c_bits_param; 
  wire [2:0] dcache_auto_out_c_bits_size; 
  wire  dcache_auto_out_c_bits_source; 
  wire [37:0] dcache_auto_out_c_bits_address; 
  wire [63:0] dcache_auto_out_c_bits_data; 
  wire  dcache_auto_out_d_ready; 
  wire  dcache_auto_out_d_valid; 
  wire [2:0] dcache_auto_out_d_bits_opcode; 
  wire [1:0] dcache_auto_out_d_bits_param; 
  wire [2:0] dcache_auto_out_d_bits_size; 
  wire  dcache_auto_out_d_bits_source; 
  wire [2:0] dcache_auto_out_d_bits_sink; 
  wire  dcache_auto_out_d_bits_denied; 
  wire [63:0] dcache_auto_out_d_bits_data; 
  wire  dcache_auto_out_e_ready; 
  wire  dcache_auto_out_e_valid; 
  wire [2:0] dcache_auto_out_e_bits_sink; 
  wire  dcache_io_cpu_req_ready; 
  wire  dcache_io_cpu_req_valid; 
  wire [39:0] dcache_io_cpu_req_bits_addr; 
  wire [6:0] dcache_io_cpu_req_bits_tag; 
  wire [4:0] dcache_io_cpu_req_bits_cmd; 
  wire [2:0] dcache_io_cpu_req_bits_typ; 
  wire  dcache_io_cpu_req_bits_phys; 
  wire  dcache_io_cpu_s1_kill; 
  wire [63:0] dcache_io_cpu_s1_data_data; 
  wire [7:0] dcache_io_cpu_s1_data_mask; 
  wire  dcache_io_cpu_s2_nack; 
  wire  dcache_io_cpu_s2_kill; 
  wire  dcache_io_cpu_resp_valid; 
  wire [6:0] dcache_io_cpu_resp_bits_tag; 
  wire [2:0] dcache_io_cpu_resp_bits_typ; 
  wire [63:0] dcache_io_cpu_resp_bits_data; 
  wire  dcache_io_cpu_resp_bits_replay; 
  wire  dcache_io_cpu_resp_bits_has_data; 
  wire [63:0] dcache_io_cpu_resp_bits_data_word_bypass; 
  wire  dcache_io_cpu_replay_next; 
  wire  dcache_io_cpu_s2_xcpt_ma_ld; 
  wire  dcache_io_cpu_s2_xcpt_ma_st; 
  wire  dcache_io_cpu_s2_xcpt_pf_ld; 
  wire  dcache_io_cpu_s2_xcpt_pf_st; 
  wire  dcache_io_cpu_s2_xcpt_ae_ld; 
  wire  dcache_io_cpu_s2_xcpt_ae_st; 
  wire  dcache_io_cpu_ordered; 
  wire  dcache_io_cpu_perf_grant; 
  wire  dcache_io_cpu_keep_clock_enabled; 
  wire  dcache_io_cpu_clock_enabled; 
  wire  dcache_io_ptw_req_ready; 
  wire  dcache_io_ptw_req_valid; 
  wire  dcache_io_ptw_req_bits_valid; 
  wire [26:0] dcache_io_ptw_req_bits_bits_addr; 
  wire  dcache_io_ptw_resp_valid; 
  wire  dcache_io_ptw_resp_bits_ae; 
  wire [53:0] dcache_io_ptw_resp_bits_pte_ppn; 
  wire  dcache_io_ptw_resp_bits_pte_d; 
  wire  dcache_io_ptw_resp_bits_pte_a; 
  wire  dcache_io_ptw_resp_bits_pte_g; 
  wire  dcache_io_ptw_resp_bits_pte_u; 
  wire  dcache_io_ptw_resp_bits_pte_x; 
  wire  dcache_io_ptw_resp_bits_pte_w; 
  wire  dcache_io_ptw_resp_bits_pte_r; 
  wire  dcache_io_ptw_resp_bits_pte_v; 
  wire [1:0] dcache_io_ptw_resp_bits_level; 
  wire  dcache_io_ptw_resp_bits_fragmented_superpage; 
  wire  dcache_io_ptw_resp_bits_homogeneous; 
  wire [3:0] dcache_io_ptw_ptbr_mode; 
  wire [1:0] dcache_io_ptw_status_dprv; 
  wire  dcache_io_ptw_status_mxr; 
  wire  dcache_io_ptw_status_sum; 
  wire  dcache_io_ptw_pmp_0_cfg_l; 
  wire [1:0] dcache_io_ptw_pmp_0_cfg_a; 
  wire  dcache_io_ptw_pmp_0_cfg_x; 
  wire  dcache_io_ptw_pmp_0_cfg_w; 
  wire  dcache_io_ptw_pmp_0_cfg_r; 
  wire [35:0] dcache_io_ptw_pmp_0_addr; 
  wire [37:0] dcache_io_ptw_pmp_0_mask; 
  wire  dcache_io_ptw_pmp_1_cfg_l; 
  wire [1:0] dcache_io_ptw_pmp_1_cfg_a; 
  wire  dcache_io_ptw_pmp_1_cfg_x; 
  wire  dcache_io_ptw_pmp_1_cfg_w; 
  wire  dcache_io_ptw_pmp_1_cfg_r; 
  wire [35:0] dcache_io_ptw_pmp_1_addr; 
  wire [37:0] dcache_io_ptw_pmp_1_mask; 
  wire  dcache_io_ptw_pmp_2_cfg_l; 
  wire [1:0] dcache_io_ptw_pmp_2_cfg_a; 
  wire  dcache_io_ptw_pmp_2_cfg_x; 
  wire  dcache_io_ptw_pmp_2_cfg_w; 
  wire  dcache_io_ptw_pmp_2_cfg_r; 
  wire [35:0] dcache_io_ptw_pmp_2_addr; 
  wire [37:0] dcache_io_ptw_pmp_2_mask; 
  wire  dcache_io_ptw_pmp_3_cfg_l; 
  wire [1:0] dcache_io_ptw_pmp_3_cfg_a; 
  wire  dcache_io_ptw_pmp_3_cfg_x; 
  wire  dcache_io_ptw_pmp_3_cfg_w; 
  wire  dcache_io_ptw_pmp_3_cfg_r; 
  wire [35:0] dcache_io_ptw_pmp_3_addr; 
  wire [37:0] dcache_io_ptw_pmp_3_mask; 
  wire  dcache_io_ptw_pmp_4_cfg_l; 
  wire [1:0] dcache_io_ptw_pmp_4_cfg_a; 
  wire  dcache_io_ptw_pmp_4_cfg_x; 
  wire  dcache_io_ptw_pmp_4_cfg_w; 
  wire  dcache_io_ptw_pmp_4_cfg_r; 
  wire [35:0] dcache_io_ptw_pmp_4_addr; 
  wire [37:0] dcache_io_ptw_pmp_4_mask; 
  wire  dcache_io_ptw_pmp_5_cfg_l; 
  wire [1:0] dcache_io_ptw_pmp_5_cfg_a; 
  wire  dcache_io_ptw_pmp_5_cfg_x; 
  wire  dcache_io_ptw_pmp_5_cfg_w; 
  wire  dcache_io_ptw_pmp_5_cfg_r; 
  wire [35:0] dcache_io_ptw_pmp_5_addr; 
  wire [37:0] dcache_io_ptw_pmp_5_mask; 
  wire  dcache_io_ptw_pmp_6_cfg_l; 
  wire [1:0] dcache_io_ptw_pmp_6_cfg_a; 
  wire  dcache_io_ptw_pmp_6_cfg_x; 
  wire  dcache_io_ptw_pmp_6_cfg_w; 
  wire  dcache_io_ptw_pmp_6_cfg_r; 
  wire [35:0] dcache_io_ptw_pmp_6_addr; 
  wire [37:0] dcache_io_ptw_pmp_6_mask; 
  wire  dcache_io_ptw_pmp_7_cfg_l; 
  wire [1:0] dcache_io_ptw_pmp_7_cfg_a; 
  wire  dcache_io_ptw_pmp_7_cfg_x; 
  wire  dcache_io_ptw_pmp_7_cfg_w; 
  wire  dcache_io_ptw_pmp_7_cfg_r; 
  wire [35:0] dcache_io_ptw_pmp_7_addr; 
  wire [37:0] dcache_io_ptw_pmp_7_mask; 
  wire [63:0] dcache_io_ptw_customCSRs_csrs_0_value; 
  wire  frontend_gated_clock; 
  wire  frontend_reset; 
  wire  frontend_auto_icache_master_out_a_ready; 
  wire  frontend_auto_icache_master_out_a_valid; 
  wire [37:0] frontend_auto_icache_master_out_a_bits_address; 
  wire  frontend_auto_icache_master_out_d_valid; 
  wire [2:0] frontend_auto_icache_master_out_d_bits_opcode; 
  wire [2:0] frontend_auto_icache_master_out_d_bits_size; 
  wire [63:0] frontend_auto_icache_master_out_d_bits_data; 
  wire  frontend_auto_icache_master_out_d_bits_corrupt; 
  wire [37:0] frontend_io_reset_vector; 
  wire  frontend_io_cpu_might_request; 
  wire  frontend_io_cpu_req_valid; 
  wire [39:0] frontend_io_cpu_req_bits_pc; 
  wire  frontend_io_cpu_req_bits_speculative; 
  wire  frontend_io_cpu_sfence_valid; 
  wire  frontend_io_cpu_sfence_bits_rs1; 
  wire  frontend_io_cpu_sfence_bits_rs2; 
  wire [38:0] frontend_io_cpu_sfence_bits_addr; 
  wire  frontend_io_cpu_resp_ready; 
  wire  frontend_io_cpu_resp_valid; 
  wire  frontend_io_cpu_resp_bits_btb_taken; 
  wire  frontend_io_cpu_resp_bits_btb_bridx; 
  wire [4:0] frontend_io_cpu_resp_bits_btb_entry; 
  wire [7:0] frontend_io_cpu_resp_bits_btb_bht_history; 
  wire [39:0] frontend_io_cpu_resp_bits_pc; 
  wire [31:0] frontend_io_cpu_resp_bits_data; 
  wire  frontend_io_cpu_resp_bits_xcpt_pf_inst; 
  wire  frontend_io_cpu_resp_bits_xcpt_ae_inst; 
  wire  frontend_io_cpu_resp_bits_replay; 
  wire  frontend_io_cpu_btb_update_valid; 
  wire [4:0] frontend_io_cpu_btb_update_bits_prediction_entry; 
  wire [38:0] frontend_io_cpu_btb_update_bits_pc; 
  wire  frontend_io_cpu_btb_update_bits_isValid; 
  wire [38:0] frontend_io_cpu_btb_update_bits_br_pc; 
  wire [1:0] frontend_io_cpu_btb_update_bits_cfiType; 
  wire  frontend_io_cpu_bht_update_valid; 
  wire [7:0] frontend_io_cpu_bht_update_bits_prediction_history; 
  wire [38:0] frontend_io_cpu_bht_update_bits_pc; 
  wire  frontend_io_cpu_bht_update_bits_branch; 
  wire  frontend_io_cpu_bht_update_bits_taken; 
  wire  frontend_io_cpu_bht_update_bits_mispredict; 
  wire  frontend_io_cpu_flush_icache; 
  wire [39:0] frontend_io_cpu_npc; 
  wire  frontend_io_ptw_req_ready; 
  wire  frontend_io_ptw_req_valid; 
  wire  frontend_io_ptw_req_bits_valid; 
  wire [26:0] frontend_io_ptw_req_bits_bits_addr; 
  wire  frontend_io_ptw_resp_valid; 
  wire  frontend_io_ptw_resp_bits_ae; 
  wire [53:0] frontend_io_ptw_resp_bits_pte_ppn; 
  wire  frontend_io_ptw_resp_bits_pte_d; 
  wire  frontend_io_ptw_resp_bits_pte_a; 
  wire  frontend_io_ptw_resp_bits_pte_g; 
  wire  frontend_io_ptw_resp_bits_pte_u; 
  wire  frontend_io_ptw_resp_bits_pte_x; 
  wire  frontend_io_ptw_resp_bits_pte_w; 
  wire  frontend_io_ptw_resp_bits_pte_r; 
  wire  frontend_io_ptw_resp_bits_pte_v; 
  wire [1:0] frontend_io_ptw_resp_bits_level; 
  wire  frontend_io_ptw_resp_bits_fragmented_superpage; 
  wire  frontend_io_ptw_resp_bits_homogeneous; 
  wire [3:0] frontend_io_ptw_ptbr_mode; 
  wire [1:0] frontend_io_ptw_status_prv; 
  wire  frontend_io_ptw_pmp_0_cfg_l; 
  wire [1:0] frontend_io_ptw_pmp_0_cfg_a; 
  wire  frontend_io_ptw_pmp_0_cfg_x; 
  wire  frontend_io_ptw_pmp_0_cfg_w; 
  wire  frontend_io_ptw_pmp_0_cfg_r; 
  wire [35:0] frontend_io_ptw_pmp_0_addr; 
  wire [37:0] frontend_io_ptw_pmp_0_mask; 
  wire  frontend_io_ptw_pmp_1_cfg_l; 
  wire [1:0] frontend_io_ptw_pmp_1_cfg_a; 
  wire  frontend_io_ptw_pmp_1_cfg_x; 
  wire  frontend_io_ptw_pmp_1_cfg_w; 
  wire  frontend_io_ptw_pmp_1_cfg_r; 
  wire [35:0] frontend_io_ptw_pmp_1_addr; 
  wire [37:0] frontend_io_ptw_pmp_1_mask; 
  wire  frontend_io_ptw_pmp_2_cfg_l; 
  wire [1:0] frontend_io_ptw_pmp_2_cfg_a; 
  wire  frontend_io_ptw_pmp_2_cfg_x; 
  wire  frontend_io_ptw_pmp_2_cfg_w; 
  wire  frontend_io_ptw_pmp_2_cfg_r; 
  wire [35:0] frontend_io_ptw_pmp_2_addr; 
  wire [37:0] frontend_io_ptw_pmp_2_mask; 
  wire  frontend_io_ptw_pmp_3_cfg_l; 
  wire [1:0] frontend_io_ptw_pmp_3_cfg_a; 
  wire  frontend_io_ptw_pmp_3_cfg_x; 
  wire  frontend_io_ptw_pmp_3_cfg_w; 
  wire  frontend_io_ptw_pmp_3_cfg_r; 
  wire [35:0] frontend_io_ptw_pmp_3_addr; 
  wire [37:0] frontend_io_ptw_pmp_3_mask; 
  wire  frontend_io_ptw_pmp_4_cfg_l; 
  wire [1:0] frontend_io_ptw_pmp_4_cfg_a; 
  wire  frontend_io_ptw_pmp_4_cfg_x; 
  wire  frontend_io_ptw_pmp_4_cfg_w; 
  wire  frontend_io_ptw_pmp_4_cfg_r; 
  wire [35:0] frontend_io_ptw_pmp_4_addr; 
  wire [37:0] frontend_io_ptw_pmp_4_mask; 
  wire  frontend_io_ptw_pmp_5_cfg_l; 
  wire [1:0] frontend_io_ptw_pmp_5_cfg_a; 
  wire  frontend_io_ptw_pmp_5_cfg_x; 
  wire  frontend_io_ptw_pmp_5_cfg_w; 
  wire  frontend_io_ptw_pmp_5_cfg_r; 
  wire [35:0] frontend_io_ptw_pmp_5_addr; 
  wire [37:0] frontend_io_ptw_pmp_5_mask; 
  wire  frontend_io_ptw_pmp_6_cfg_l; 
  wire [1:0] frontend_io_ptw_pmp_6_cfg_a; 
  wire  frontend_io_ptw_pmp_6_cfg_x; 
  wire  frontend_io_ptw_pmp_6_cfg_w; 
  wire  frontend_io_ptw_pmp_6_cfg_r; 
  wire [35:0] frontend_io_ptw_pmp_6_addr; 
  wire [37:0] frontend_io_ptw_pmp_6_mask; 
  wire  frontend_io_ptw_pmp_7_cfg_l; 
  wire [1:0] frontend_io_ptw_pmp_7_cfg_a; 
  wire  frontend_io_ptw_pmp_7_cfg_x; 
  wire  frontend_io_ptw_pmp_7_cfg_w; 
  wire  frontend_io_ptw_pmp_7_cfg_r; 
  wire [35:0] frontend_io_ptw_pmp_7_addr; 
  wire [37:0] frontend_io_ptw_pmp_7_mask; 
  wire  buffer_clock; 
  wire  buffer_reset; 
  wire  buffer_auto_in_a_ready; 
  wire  buffer_auto_in_a_valid; 
  wire [2:0] buffer_auto_in_a_bits_opcode; 
  wire [2:0] buffer_auto_in_a_bits_param; 
  wire [2:0] buffer_auto_in_a_bits_size; 
  wire [1:0] buffer_auto_in_a_bits_source; 
  wire [37:0] buffer_auto_in_a_bits_address; 
  wire [7:0] buffer_auto_in_a_bits_mask; 
  wire [63:0] buffer_auto_in_a_bits_data; 
  wire  buffer_auto_in_a_bits_corrupt; 
  wire  buffer_auto_in_b_ready; 
  wire  buffer_auto_in_b_valid; 
  wire [2:0] buffer_auto_in_b_bits_opcode; 
  wire [1:0] buffer_auto_in_b_bits_param; 
  wire [2:0] buffer_auto_in_b_bits_size; 
  wire [1:0] buffer_auto_in_b_bits_source; 
  wire [37:0] buffer_auto_in_b_bits_address; 
  wire [7:0] buffer_auto_in_b_bits_mask; 
  wire  buffer_auto_in_b_bits_corrupt; 
  wire  buffer_auto_in_c_ready; 
  wire  buffer_auto_in_c_valid; 
  wire [2:0] buffer_auto_in_c_bits_opcode; 
  wire [2:0] buffer_auto_in_c_bits_param; 
  wire [2:0] buffer_auto_in_c_bits_size; 
  wire [1:0] buffer_auto_in_c_bits_source; 
  wire [37:0] buffer_auto_in_c_bits_address; 
  wire [63:0] buffer_auto_in_c_bits_data; 
  wire  buffer_auto_in_c_bits_corrupt; 
  wire  buffer_auto_in_d_ready; 
  wire  buffer_auto_in_d_valid; 
  wire [2:0] buffer_auto_in_d_bits_opcode; 
  wire [1:0] buffer_auto_in_d_bits_param; 
  wire [2:0] buffer_auto_in_d_bits_size; 
  wire [1:0] buffer_auto_in_d_bits_source; 
  wire [2:0] buffer_auto_in_d_bits_sink; 
  wire  buffer_auto_in_d_bits_denied; 
  wire [63:0] buffer_auto_in_d_bits_data; 
  wire  buffer_auto_in_d_bits_corrupt; 
  wire  buffer_auto_in_e_ready; 
  wire  buffer_auto_in_e_valid; 
  wire [2:0] buffer_auto_in_e_bits_sink; 
  wire  buffer_auto_out_a_ready; 
  wire  buffer_auto_out_a_valid; 
  wire [2:0] buffer_auto_out_a_bits_opcode; 
  wire [2:0] buffer_auto_out_a_bits_param; 
  wire [2:0] buffer_auto_out_a_bits_size; 
  wire [1:0] buffer_auto_out_a_bits_source; 
  wire [37:0] buffer_auto_out_a_bits_address; 
  wire [7:0] buffer_auto_out_a_bits_mask; 
  wire [63:0] buffer_auto_out_a_bits_data; 
  wire  buffer_auto_out_a_bits_corrupt; 
  wire  buffer_auto_out_b_ready; 
  wire  buffer_auto_out_b_valid; 
  wire [2:0] buffer_auto_out_b_bits_opcode; 
  wire [1:0] buffer_auto_out_b_bits_param; 
  wire [2:0] buffer_auto_out_b_bits_size; 
  wire [1:0] buffer_auto_out_b_bits_source; 
  wire [37:0] buffer_auto_out_b_bits_address; 
  wire [7:0] buffer_auto_out_b_bits_mask; 
  wire  buffer_auto_out_b_bits_corrupt; 
  wire  buffer_auto_out_c_ready; 
  wire  buffer_auto_out_c_valid; 
  wire [2:0] buffer_auto_out_c_bits_opcode; 
  wire [2:0] buffer_auto_out_c_bits_param; 
  wire [2:0] buffer_auto_out_c_bits_size; 
  wire [1:0] buffer_auto_out_c_bits_source; 
  wire [37:0] buffer_auto_out_c_bits_address; 
  wire [63:0] buffer_auto_out_c_bits_data; 
  wire  buffer_auto_out_c_bits_corrupt; 
  wire  buffer_auto_out_d_ready; 
  wire  buffer_auto_out_d_valid; 
  wire [2:0] buffer_auto_out_d_bits_opcode; 
  wire [1:0] buffer_auto_out_d_bits_param; 
  wire [2:0] buffer_auto_out_d_bits_size; 
  wire [1:0] buffer_auto_out_d_bits_source; 
  wire [2:0] buffer_auto_out_d_bits_sink; 
  wire  buffer_auto_out_d_bits_denied; 
  wire [63:0] buffer_auto_out_d_bits_data; 
  wire  buffer_auto_out_d_bits_corrupt; 
  wire  buffer_auto_out_e_ready; 
  wire  buffer_auto_out_e_valid; 
  wire [2:0] buffer_auto_out_e_bits_sink; 
  wire  intsink_clock; 
  wire  intsink_auto_in_sync_0; 
  wire  intsink_auto_out_0; 
  wire  intsink_1_auto_in_sync_0; 
  wire  intsink_1_auto_in_sync_1; 
  wire  intsink_1_auto_out_0; 
  wire  intsink_1_auto_out_1; 
  wire  intsink_2_auto_in_sync_0; 
  wire  intsink_2_auto_out_0; 
  wire  intsink_3_auto_in_sync_0; 
  wire  intsink_3_auto_out_0; 
  wire  fpuOpt_clock; 
  wire  fpuOpt_reset; 
  wire [31:0] fpuOpt_io_inst; 
  wire [63:0] fpuOpt_io_fromint_data; 
  wire [2:0] fpuOpt_io_fcsr_rm; 
  wire  fpuOpt_io_fcsr_flags_valid; 
  wire [4:0] fpuOpt_io_fcsr_flags_bits; 
  wire [63:0] fpuOpt_io_store_data; 
  wire [63:0] fpuOpt_io_toint_data; 
  wire  fpuOpt_io_dmem_resp_val; 
  wire [2:0] fpuOpt_io_dmem_resp_type; 
  wire [4:0] fpuOpt_io_dmem_resp_tag; 
  wire [63:0] fpuOpt_io_dmem_resp_data; 
  wire  fpuOpt_io_valid; 
  wire  fpuOpt_io_fcsr_rdy; 
  wire  fpuOpt_io_nack_mem; 
  wire  fpuOpt_io_illegal_rm; 
  wire  fpuOpt_io_killx; 
  wire  fpuOpt_io_killm; 
  wire  fpuOpt_io_dec_wen; 
  wire  fpuOpt_io_dec_ren1; 
  wire  fpuOpt_io_dec_ren2; 
  wire  fpuOpt_io_dec_ren3; 
  wire  fpuOpt_io_sboard_set; 
  wire  fpuOpt_io_sboard_clr; 
  wire [4:0] fpuOpt_io_sboard_clra; 
  wire  fpuOpt_io_cp_req_ready; 
  wire  fpuOpt_io_cp_req_valid; 
  wire  fpuOpt_io_cp_req_bits_ren2; 
  wire  fpuOpt_io_cp_req_bits_ren3; 
  wire  fpuOpt_io_cp_req_bits_swap23; 
  wire  fpuOpt_io_cp_req_bits_singleIn; 
  wire  fpuOpt_io_cp_req_bits_singleOut; 
  wire  fpuOpt_io_cp_req_bits_fromint; 
  wire  fpuOpt_io_cp_req_bits_toint; 
  wire  fpuOpt_io_cp_req_bits_fastpipe; 
  wire  fpuOpt_io_cp_req_bits_fma; 
  wire  fpuOpt_io_cp_req_bits_div; 
  wire  fpuOpt_io_cp_req_bits_sqrt; 
  wire  fpuOpt_io_cp_req_bits_wflags; 
  wire [2:0] fpuOpt_io_cp_req_bits_rm; 
  wire [1:0] fpuOpt_io_cp_req_bits_fmaCmd; 
  wire [1:0] fpuOpt_io_cp_req_bits_typ; 
  wire [64:0] fpuOpt_io_cp_req_bits_in1; 
  wire [64:0] fpuOpt_io_cp_req_bits_in2; 
  wire [64:0] fpuOpt_io_cp_req_bits_in3; 
  wire  dcacheArb_clock; 
  wire  dcacheArb_io_requestor_0_req_ready; 
  wire  dcacheArb_io_requestor_0_req_valid; 
  wire [39:0] dcacheArb_io_requestor_0_req_bits_addr; 
  wire [6:0] dcacheArb_io_requestor_0_req_bits_tag; 
  wire [4:0] dcacheArb_io_requestor_0_req_bits_cmd; 
  wire [2:0] dcacheArb_io_requestor_0_req_bits_typ; 
  wire  dcacheArb_io_requestor_0_req_bits_phys; 
  wire  dcacheArb_io_requestor_0_s1_kill; 
  wire [63:0] dcacheArb_io_requestor_0_s1_data_data; 
  wire [7:0] dcacheArb_io_requestor_0_s1_data_mask; 
  wire  dcacheArb_io_requestor_0_s2_nack; 
  wire  dcacheArb_io_requestor_0_s2_kill; 
  wire  dcacheArb_io_requestor_0_resp_valid; 
  wire [63:0] dcacheArb_io_requestor_0_resp_bits_data_word_bypass; 
  wire  dcacheArb_io_requestor_0_s2_xcpt_ae_ld; 
  wire  dcacheArb_io_requestor_0_keep_clock_enabled; 
  wire  dcacheArb_io_requestor_1_req_ready; 
  wire  dcacheArb_io_requestor_1_req_valid; 
  wire [39:0] dcacheArb_io_requestor_1_req_bits_addr; 
  wire [6:0] dcacheArb_io_requestor_1_req_bits_tag; 
  wire [4:0] dcacheArb_io_requestor_1_req_bits_cmd; 
  wire [2:0] dcacheArb_io_requestor_1_req_bits_typ; 
  wire  dcacheArb_io_requestor_1_req_bits_phys; 
  wire  dcacheArb_io_requestor_1_s1_kill; 
  wire [63:0] dcacheArb_io_requestor_1_s1_data_data; 
  wire [7:0] dcacheArb_io_requestor_1_s1_data_mask; 
  wire  dcacheArb_io_requestor_1_s2_nack; 
  wire  dcacheArb_io_requestor_1_s2_kill; 
  wire  dcacheArb_io_requestor_1_resp_valid; 
  wire [6:0] dcacheArb_io_requestor_1_resp_bits_tag; 
  wire [2:0] dcacheArb_io_requestor_1_resp_bits_typ; 
  wire [63:0] dcacheArb_io_requestor_1_resp_bits_data; 
  wire  dcacheArb_io_requestor_1_resp_bits_replay; 
  wire  dcacheArb_io_requestor_1_resp_bits_has_data; 
  wire [63:0] dcacheArb_io_requestor_1_resp_bits_data_word_bypass; 
  wire  dcacheArb_io_requestor_1_replay_next; 
  wire  dcacheArb_io_requestor_1_s2_xcpt_ma_ld; 
  wire  dcacheArb_io_requestor_1_s2_xcpt_ma_st; 
  wire  dcacheArb_io_requestor_1_s2_xcpt_pf_ld; 
  wire  dcacheArb_io_requestor_1_s2_xcpt_pf_st; 
  wire  dcacheArb_io_requestor_1_s2_xcpt_ae_ld; 
  wire  dcacheArb_io_requestor_1_s2_xcpt_ae_st; 
  wire  dcacheArb_io_requestor_1_ordered; 
  wire  dcacheArb_io_requestor_1_perf_grant; 
  wire  dcacheArb_io_requestor_1_keep_clock_enabled; 
  wire  dcacheArb_io_requestor_1_clock_enabled; 
  wire  dcacheArb_io_mem_req_ready; 
  wire  dcacheArb_io_mem_req_valid; 
  wire [39:0] dcacheArb_io_mem_req_bits_addr; 
  wire [6:0] dcacheArb_io_mem_req_bits_tag; 
  wire [4:0] dcacheArb_io_mem_req_bits_cmd; 
  wire [2:0] dcacheArb_io_mem_req_bits_typ; 
  wire  dcacheArb_io_mem_req_bits_phys; 
  wire  dcacheArb_io_mem_s1_kill; 
  wire [63:0] dcacheArb_io_mem_s1_data_data; 
  wire [7:0] dcacheArb_io_mem_s1_data_mask; 
  wire  dcacheArb_io_mem_s2_nack; 
  wire  dcacheArb_io_mem_s2_kill; 
  wire  dcacheArb_io_mem_resp_valid; 
  wire [6:0] dcacheArb_io_mem_resp_bits_tag; 
  wire [2:0] dcacheArb_io_mem_resp_bits_typ; 
  wire [63:0] dcacheArb_io_mem_resp_bits_data; 
  wire  dcacheArb_io_mem_resp_bits_replay; 
  wire  dcacheArb_io_mem_resp_bits_has_data; 
  wire [63:0] dcacheArb_io_mem_resp_bits_data_word_bypass; 
  wire  dcacheArb_io_mem_replay_next; 
  wire  dcacheArb_io_mem_s2_xcpt_ma_ld; 
  wire  dcacheArb_io_mem_s2_xcpt_ma_st; 
  wire  dcacheArb_io_mem_s2_xcpt_pf_ld; 
  wire  dcacheArb_io_mem_s2_xcpt_pf_st; 
  wire  dcacheArb_io_mem_s2_xcpt_ae_ld; 
  wire  dcacheArb_io_mem_s2_xcpt_ae_st; 
  wire  dcacheArb_io_mem_ordered; 
  wire  dcacheArb_io_mem_perf_grant; 
  wire  dcacheArb_io_mem_keep_clock_enabled; 
  wire  dcacheArb_io_mem_clock_enabled; 
  wire  ptw_clock; 
  wire  ptw_reset; 
  wire  ptw_io_requestor_0_req_ready; 
  wire  ptw_io_requestor_0_req_valid; 
  wire  ptw_io_requestor_0_req_bits_valid; 
  wire [26:0] ptw_io_requestor_0_req_bits_bits_addr; 
  wire  ptw_io_requestor_0_resp_valid; 
  wire  ptw_io_requestor_0_resp_bits_ae; 
  wire [53:0] ptw_io_requestor_0_resp_bits_pte_ppn; 
  wire  ptw_io_requestor_0_resp_bits_pte_d; 
  wire  ptw_io_requestor_0_resp_bits_pte_a; 
  wire  ptw_io_requestor_0_resp_bits_pte_g; 
  wire  ptw_io_requestor_0_resp_bits_pte_u; 
  wire  ptw_io_requestor_0_resp_bits_pte_x; 
  wire  ptw_io_requestor_0_resp_bits_pte_w; 
  wire  ptw_io_requestor_0_resp_bits_pte_r; 
  wire  ptw_io_requestor_0_resp_bits_pte_v; 
  wire [1:0] ptw_io_requestor_0_resp_bits_level; 
  wire  ptw_io_requestor_0_resp_bits_homogeneous; 
  wire [3:0] ptw_io_requestor_0_ptbr_mode; 
  wire [1:0] ptw_io_requestor_0_status_dprv; 
  wire  ptw_io_requestor_0_status_mxr; 
  wire  ptw_io_requestor_0_status_sum; 
  wire  ptw_io_requestor_0_pmp_0_cfg_l; 
  wire [1:0] ptw_io_requestor_0_pmp_0_cfg_a; 
  wire  ptw_io_requestor_0_pmp_0_cfg_x; 
  wire  ptw_io_requestor_0_pmp_0_cfg_w; 
  wire  ptw_io_requestor_0_pmp_0_cfg_r; 
  wire [35:0] ptw_io_requestor_0_pmp_0_addr; 
  wire [37:0] ptw_io_requestor_0_pmp_0_mask; 
  wire  ptw_io_requestor_0_pmp_1_cfg_l; 
  wire [1:0] ptw_io_requestor_0_pmp_1_cfg_a; 
  wire  ptw_io_requestor_0_pmp_1_cfg_x; 
  wire  ptw_io_requestor_0_pmp_1_cfg_w; 
  wire  ptw_io_requestor_0_pmp_1_cfg_r; 
  wire [35:0] ptw_io_requestor_0_pmp_1_addr; 
  wire [37:0] ptw_io_requestor_0_pmp_1_mask; 
  wire  ptw_io_requestor_0_pmp_2_cfg_l; 
  wire [1:0] ptw_io_requestor_0_pmp_2_cfg_a; 
  wire  ptw_io_requestor_0_pmp_2_cfg_x; 
  wire  ptw_io_requestor_0_pmp_2_cfg_w; 
  wire  ptw_io_requestor_0_pmp_2_cfg_r; 
  wire [35:0] ptw_io_requestor_0_pmp_2_addr; 
  wire [37:0] ptw_io_requestor_0_pmp_2_mask; 
  wire  ptw_io_requestor_0_pmp_3_cfg_l; 
  wire [1:0] ptw_io_requestor_0_pmp_3_cfg_a; 
  wire  ptw_io_requestor_0_pmp_3_cfg_x; 
  wire  ptw_io_requestor_0_pmp_3_cfg_w; 
  wire  ptw_io_requestor_0_pmp_3_cfg_r; 
  wire [35:0] ptw_io_requestor_0_pmp_3_addr; 
  wire [37:0] ptw_io_requestor_0_pmp_3_mask; 
  wire  ptw_io_requestor_0_pmp_4_cfg_l; 
  wire [1:0] ptw_io_requestor_0_pmp_4_cfg_a; 
  wire  ptw_io_requestor_0_pmp_4_cfg_x; 
  wire  ptw_io_requestor_0_pmp_4_cfg_w; 
  wire  ptw_io_requestor_0_pmp_4_cfg_r; 
  wire [35:0] ptw_io_requestor_0_pmp_4_addr; 
  wire [37:0] ptw_io_requestor_0_pmp_4_mask; 
  wire  ptw_io_requestor_0_pmp_5_cfg_l; 
  wire [1:0] ptw_io_requestor_0_pmp_5_cfg_a; 
  wire  ptw_io_requestor_0_pmp_5_cfg_x; 
  wire  ptw_io_requestor_0_pmp_5_cfg_w; 
  wire  ptw_io_requestor_0_pmp_5_cfg_r; 
  wire [35:0] ptw_io_requestor_0_pmp_5_addr; 
  wire [37:0] ptw_io_requestor_0_pmp_5_mask; 
  wire  ptw_io_requestor_0_pmp_6_cfg_l; 
  wire [1:0] ptw_io_requestor_0_pmp_6_cfg_a; 
  wire  ptw_io_requestor_0_pmp_6_cfg_x; 
  wire  ptw_io_requestor_0_pmp_6_cfg_w; 
  wire  ptw_io_requestor_0_pmp_6_cfg_r; 
  wire [35:0] ptw_io_requestor_0_pmp_6_addr; 
  wire [37:0] ptw_io_requestor_0_pmp_6_mask; 
  wire  ptw_io_requestor_0_pmp_7_cfg_l; 
  wire [1:0] ptw_io_requestor_0_pmp_7_cfg_a; 
  wire  ptw_io_requestor_0_pmp_7_cfg_x; 
  wire  ptw_io_requestor_0_pmp_7_cfg_w; 
  wire  ptw_io_requestor_0_pmp_7_cfg_r; 
  wire [35:0] ptw_io_requestor_0_pmp_7_addr; 
  wire [37:0] ptw_io_requestor_0_pmp_7_mask; 
  wire [63:0] ptw_io_requestor_0_customCSRs_csrs_0_value; 
  wire  ptw_io_requestor_1_req_ready; 
  wire  ptw_io_requestor_1_req_valid; 
  wire  ptw_io_requestor_1_req_bits_valid; 
  wire [26:0] ptw_io_requestor_1_req_bits_bits_addr; 
  wire  ptw_io_requestor_1_resp_valid; 
  wire  ptw_io_requestor_1_resp_bits_ae; 
  wire [53:0] ptw_io_requestor_1_resp_bits_pte_ppn; 
  wire  ptw_io_requestor_1_resp_bits_pte_d; 
  wire  ptw_io_requestor_1_resp_bits_pte_a; 
  wire  ptw_io_requestor_1_resp_bits_pte_g; 
  wire  ptw_io_requestor_1_resp_bits_pte_u; 
  wire  ptw_io_requestor_1_resp_bits_pte_x; 
  wire  ptw_io_requestor_1_resp_bits_pte_w; 
  wire  ptw_io_requestor_1_resp_bits_pte_r; 
  wire  ptw_io_requestor_1_resp_bits_pte_v; 
  wire [1:0] ptw_io_requestor_1_resp_bits_level; 
  wire  ptw_io_requestor_1_resp_bits_homogeneous; 
  wire [3:0] ptw_io_requestor_1_ptbr_mode; 
  wire [1:0] ptw_io_requestor_1_status_prv; 
  wire  ptw_io_requestor_1_pmp_0_cfg_l; 
  wire [1:0] ptw_io_requestor_1_pmp_0_cfg_a; 
  wire  ptw_io_requestor_1_pmp_0_cfg_x; 
  wire  ptw_io_requestor_1_pmp_0_cfg_w; 
  wire  ptw_io_requestor_1_pmp_0_cfg_r; 
  wire [35:0] ptw_io_requestor_1_pmp_0_addr; 
  wire [37:0] ptw_io_requestor_1_pmp_0_mask; 
  wire  ptw_io_requestor_1_pmp_1_cfg_l; 
  wire [1:0] ptw_io_requestor_1_pmp_1_cfg_a; 
  wire  ptw_io_requestor_1_pmp_1_cfg_x; 
  wire  ptw_io_requestor_1_pmp_1_cfg_w; 
  wire  ptw_io_requestor_1_pmp_1_cfg_r; 
  wire [35:0] ptw_io_requestor_1_pmp_1_addr; 
  wire [37:0] ptw_io_requestor_1_pmp_1_mask; 
  wire  ptw_io_requestor_1_pmp_2_cfg_l; 
  wire [1:0] ptw_io_requestor_1_pmp_2_cfg_a; 
  wire  ptw_io_requestor_1_pmp_2_cfg_x; 
  wire  ptw_io_requestor_1_pmp_2_cfg_w; 
  wire  ptw_io_requestor_1_pmp_2_cfg_r; 
  wire [35:0] ptw_io_requestor_1_pmp_2_addr; 
  wire [37:0] ptw_io_requestor_1_pmp_2_mask; 
  wire  ptw_io_requestor_1_pmp_3_cfg_l; 
  wire [1:0] ptw_io_requestor_1_pmp_3_cfg_a; 
  wire  ptw_io_requestor_1_pmp_3_cfg_x; 
  wire  ptw_io_requestor_1_pmp_3_cfg_w; 
  wire  ptw_io_requestor_1_pmp_3_cfg_r; 
  wire [35:0] ptw_io_requestor_1_pmp_3_addr; 
  wire [37:0] ptw_io_requestor_1_pmp_3_mask; 
  wire  ptw_io_requestor_1_pmp_4_cfg_l; 
  wire [1:0] ptw_io_requestor_1_pmp_4_cfg_a; 
  wire  ptw_io_requestor_1_pmp_4_cfg_x; 
  wire  ptw_io_requestor_1_pmp_4_cfg_w; 
  wire  ptw_io_requestor_1_pmp_4_cfg_r; 
  wire [35:0] ptw_io_requestor_1_pmp_4_addr; 
  wire [37:0] ptw_io_requestor_1_pmp_4_mask; 
  wire  ptw_io_requestor_1_pmp_5_cfg_l; 
  wire [1:0] ptw_io_requestor_1_pmp_5_cfg_a; 
  wire  ptw_io_requestor_1_pmp_5_cfg_x; 
  wire  ptw_io_requestor_1_pmp_5_cfg_w; 
  wire  ptw_io_requestor_1_pmp_5_cfg_r; 
  wire [35:0] ptw_io_requestor_1_pmp_5_addr; 
  wire [37:0] ptw_io_requestor_1_pmp_5_mask; 
  wire  ptw_io_requestor_1_pmp_6_cfg_l; 
  wire [1:0] ptw_io_requestor_1_pmp_6_cfg_a; 
  wire  ptw_io_requestor_1_pmp_6_cfg_x; 
  wire  ptw_io_requestor_1_pmp_6_cfg_w; 
  wire  ptw_io_requestor_1_pmp_6_cfg_r; 
  wire [35:0] ptw_io_requestor_1_pmp_6_addr; 
  wire [37:0] ptw_io_requestor_1_pmp_6_mask; 
  wire  ptw_io_requestor_1_pmp_7_cfg_l; 
  wire [1:0] ptw_io_requestor_1_pmp_7_cfg_a; 
  wire  ptw_io_requestor_1_pmp_7_cfg_x; 
  wire  ptw_io_requestor_1_pmp_7_cfg_w; 
  wire  ptw_io_requestor_1_pmp_7_cfg_r; 
  wire [35:0] ptw_io_requestor_1_pmp_7_addr; 
  wire [37:0] ptw_io_requestor_1_pmp_7_mask; 
  wire  ptw_io_mem_req_ready; 
  wire  ptw_io_mem_req_valid; 
  wire [39:0] ptw_io_mem_req_bits_addr; 
  wire  ptw_io_mem_s1_kill; 
  wire  ptw_io_mem_s2_nack; 
  wire  ptw_io_mem_resp_valid; 
  wire [63:0] ptw_io_mem_resp_bits_data_word_bypass; 
  wire  ptw_io_mem_s2_xcpt_ae_ld; 
  wire [3:0] ptw_io_dpath_ptbr_mode; 
  wire [43:0] ptw_io_dpath_ptbr_ppn; 
  wire  ptw_io_dpath_sfence_valid; 
  wire  ptw_io_dpath_sfence_bits_rs1; 
  wire [1:0] ptw_io_dpath_status_dprv; 
  wire [1:0] ptw_io_dpath_status_prv; 
  wire  ptw_io_dpath_status_mxr; 
  wire  ptw_io_dpath_status_sum; 
  wire  ptw_io_dpath_pmp_0_cfg_l; 
  wire [1:0] ptw_io_dpath_pmp_0_cfg_a; 
  wire  ptw_io_dpath_pmp_0_cfg_x; 
  wire  ptw_io_dpath_pmp_0_cfg_w; 
  wire  ptw_io_dpath_pmp_0_cfg_r; 
  wire [35:0] ptw_io_dpath_pmp_0_addr; 
  wire [37:0] ptw_io_dpath_pmp_0_mask; 
  wire  ptw_io_dpath_pmp_1_cfg_l; 
  wire [1:0] ptw_io_dpath_pmp_1_cfg_a; 
  wire  ptw_io_dpath_pmp_1_cfg_x; 
  wire  ptw_io_dpath_pmp_1_cfg_w; 
  wire  ptw_io_dpath_pmp_1_cfg_r; 
  wire [35:0] ptw_io_dpath_pmp_1_addr; 
  wire [37:0] ptw_io_dpath_pmp_1_mask; 
  wire  ptw_io_dpath_pmp_2_cfg_l; 
  wire [1:0] ptw_io_dpath_pmp_2_cfg_a; 
  wire  ptw_io_dpath_pmp_2_cfg_x; 
  wire  ptw_io_dpath_pmp_2_cfg_w; 
  wire  ptw_io_dpath_pmp_2_cfg_r; 
  wire [35:0] ptw_io_dpath_pmp_2_addr; 
  wire [37:0] ptw_io_dpath_pmp_2_mask; 
  wire  ptw_io_dpath_pmp_3_cfg_l; 
  wire [1:0] ptw_io_dpath_pmp_3_cfg_a; 
  wire  ptw_io_dpath_pmp_3_cfg_x; 
  wire  ptw_io_dpath_pmp_3_cfg_w; 
  wire  ptw_io_dpath_pmp_3_cfg_r; 
  wire [35:0] ptw_io_dpath_pmp_3_addr; 
  wire [37:0] ptw_io_dpath_pmp_3_mask; 
  wire  ptw_io_dpath_pmp_4_cfg_l; 
  wire [1:0] ptw_io_dpath_pmp_4_cfg_a; 
  wire  ptw_io_dpath_pmp_4_cfg_x; 
  wire  ptw_io_dpath_pmp_4_cfg_w; 
  wire  ptw_io_dpath_pmp_4_cfg_r; 
  wire [35:0] ptw_io_dpath_pmp_4_addr; 
  wire [37:0] ptw_io_dpath_pmp_4_mask; 
  wire  ptw_io_dpath_pmp_5_cfg_l; 
  wire [1:0] ptw_io_dpath_pmp_5_cfg_a; 
  wire  ptw_io_dpath_pmp_5_cfg_x; 
  wire  ptw_io_dpath_pmp_5_cfg_w; 
  wire  ptw_io_dpath_pmp_5_cfg_r; 
  wire [35:0] ptw_io_dpath_pmp_5_addr; 
  wire [37:0] ptw_io_dpath_pmp_5_mask; 
  wire  ptw_io_dpath_pmp_6_cfg_l; 
  wire [1:0] ptw_io_dpath_pmp_6_cfg_a; 
  wire  ptw_io_dpath_pmp_6_cfg_x; 
  wire  ptw_io_dpath_pmp_6_cfg_w; 
  wire  ptw_io_dpath_pmp_6_cfg_r; 
  wire [35:0] ptw_io_dpath_pmp_6_addr; 
  wire [37:0] ptw_io_dpath_pmp_6_mask; 
  wire  ptw_io_dpath_pmp_7_cfg_l; 
  wire [1:0] ptw_io_dpath_pmp_7_cfg_a; 
  wire  ptw_io_dpath_pmp_7_cfg_x; 
  wire  ptw_io_dpath_pmp_7_cfg_w; 
  wire  ptw_io_dpath_pmp_7_cfg_r; 
  wire [35:0] ptw_io_dpath_pmp_7_addr; 
  wire [37:0] ptw_io_dpath_pmp_7_mask; 
  wire [63:0] ptw_io_dpath_customCSRs_csrs_0_value; 
  wire  core_clock; 
  wire  core_reset; 
  wire [1:0] core_io_hartid; 
  wire  core_io_interrupts_debug; 
  wire  core_io_interrupts_mtip; 
  wire  core_io_interrupts_msip; 
  wire  core_io_interrupts_meip; 
  wire  core_io_interrupts_seip; 
  wire  core_io_imem_might_request; 
  wire  core_io_imem_req_valid; 
  wire [39:0] core_io_imem_req_bits_pc; 
  wire  core_io_imem_req_bits_speculative; 
  wire  core_io_imem_sfence_valid; 
  wire  core_io_imem_sfence_bits_rs1; 
  wire  core_io_imem_sfence_bits_rs2; 
  wire [38:0] core_io_imem_sfence_bits_addr; 
  wire  core_io_imem_resp_ready; 
  wire  core_io_imem_resp_valid; 
  wire  core_io_imem_resp_bits_btb_taken; 
  wire  core_io_imem_resp_bits_btb_bridx; 
  wire [4:0] core_io_imem_resp_bits_btb_entry; 
  wire [7:0] core_io_imem_resp_bits_btb_bht_history; 
  wire [39:0] core_io_imem_resp_bits_pc; 
  wire [31:0] core_io_imem_resp_bits_data; 
  wire  core_io_imem_resp_bits_xcpt_pf_inst; 
  wire  core_io_imem_resp_bits_xcpt_ae_inst; 
  wire  core_io_imem_resp_bits_replay; 
  wire  core_io_imem_btb_update_valid; 
  wire [4:0] core_io_imem_btb_update_bits_prediction_entry; 
  wire [38:0] core_io_imem_btb_update_bits_pc; 
  wire  core_io_imem_btb_update_bits_isValid; 
  wire [38:0] core_io_imem_btb_update_bits_br_pc; 
  wire [1:0] core_io_imem_btb_update_bits_cfiType; 
  wire  core_io_imem_bht_update_valid; 
  wire [7:0] core_io_imem_bht_update_bits_prediction_history; 
  wire [38:0] core_io_imem_bht_update_bits_pc; 
  wire  core_io_imem_bht_update_bits_branch; 
  wire  core_io_imem_bht_update_bits_taken; 
  wire  core_io_imem_bht_update_bits_mispredict; 
  wire  core_io_imem_flush_icache; 
  wire  core_io_dmem_req_ready; 
  wire  core_io_dmem_req_valid; 
  wire [39:0] core_io_dmem_req_bits_addr; 
  wire [6:0] core_io_dmem_req_bits_tag; 
  wire [4:0] core_io_dmem_req_bits_cmd; 
  wire [2:0] core_io_dmem_req_bits_typ; 
  wire  core_io_dmem_s1_kill; 
  wire [63:0] core_io_dmem_s1_data_data; 
  wire  core_io_dmem_s2_nack; 
  wire  core_io_dmem_resp_valid; 
  wire [6:0] core_io_dmem_resp_bits_tag; 
  wire [2:0] core_io_dmem_resp_bits_typ; 
  wire [63:0] core_io_dmem_resp_bits_data; 
  wire  core_io_dmem_resp_bits_replay; 
  wire  core_io_dmem_resp_bits_has_data; 
  wire [63:0] core_io_dmem_resp_bits_data_word_bypass; 
  wire  core_io_dmem_replay_next; 
  wire  core_io_dmem_s2_xcpt_ma_ld; 
  wire  core_io_dmem_s2_xcpt_ma_st; 
  wire  core_io_dmem_s2_xcpt_pf_ld; 
  wire  core_io_dmem_s2_xcpt_pf_st; 
  wire  core_io_dmem_s2_xcpt_ae_ld; 
  wire  core_io_dmem_s2_xcpt_ae_st; 
  wire  core_io_dmem_ordered; 
  wire  core_io_dmem_perf_grant; 
  wire  core_io_dmem_keep_clock_enabled; 
  wire  core_io_dmem_clock_enabled; 
  wire [3:0] core_io_ptw_ptbr_mode; 
  wire [43:0] core_io_ptw_ptbr_ppn; 
  wire  core_io_ptw_sfence_valid; 
  wire  core_io_ptw_sfence_bits_rs1; 
  wire [1:0] core_io_ptw_status_dprv; 
  wire [1:0] core_io_ptw_status_prv; 
  wire  core_io_ptw_status_mxr; 
  wire  core_io_ptw_status_sum; 
  wire  core_io_ptw_pmp_0_cfg_l; 
  wire [1:0] core_io_ptw_pmp_0_cfg_a; 
  wire  core_io_ptw_pmp_0_cfg_x; 
  wire  core_io_ptw_pmp_0_cfg_w; 
  wire  core_io_ptw_pmp_0_cfg_r; 
  wire [35:0] core_io_ptw_pmp_0_addr; 
  wire [37:0] core_io_ptw_pmp_0_mask; 
  wire  core_io_ptw_pmp_1_cfg_l; 
  wire [1:0] core_io_ptw_pmp_1_cfg_a; 
  wire  core_io_ptw_pmp_1_cfg_x; 
  wire  core_io_ptw_pmp_1_cfg_w; 
  wire  core_io_ptw_pmp_1_cfg_r; 
  wire [35:0] core_io_ptw_pmp_1_addr; 
  wire [37:0] core_io_ptw_pmp_1_mask; 
  wire  core_io_ptw_pmp_2_cfg_l; 
  wire [1:0] core_io_ptw_pmp_2_cfg_a; 
  wire  core_io_ptw_pmp_2_cfg_x; 
  wire  core_io_ptw_pmp_2_cfg_w; 
  wire  core_io_ptw_pmp_2_cfg_r; 
  wire [35:0] core_io_ptw_pmp_2_addr; 
  wire [37:0] core_io_ptw_pmp_2_mask; 
  wire  core_io_ptw_pmp_3_cfg_l; 
  wire [1:0] core_io_ptw_pmp_3_cfg_a; 
  wire  core_io_ptw_pmp_3_cfg_x; 
  wire  core_io_ptw_pmp_3_cfg_w; 
  wire  core_io_ptw_pmp_3_cfg_r; 
  wire [35:0] core_io_ptw_pmp_3_addr; 
  wire [37:0] core_io_ptw_pmp_3_mask; 
  wire  core_io_ptw_pmp_4_cfg_l; 
  wire [1:0] core_io_ptw_pmp_4_cfg_a; 
  wire  core_io_ptw_pmp_4_cfg_x; 
  wire  core_io_ptw_pmp_4_cfg_w; 
  wire  core_io_ptw_pmp_4_cfg_r; 
  wire [35:0] core_io_ptw_pmp_4_addr; 
  wire [37:0] core_io_ptw_pmp_4_mask; 
  wire  core_io_ptw_pmp_5_cfg_l; 
  wire [1:0] core_io_ptw_pmp_5_cfg_a; 
  wire  core_io_ptw_pmp_5_cfg_x; 
  wire  core_io_ptw_pmp_5_cfg_w; 
  wire  core_io_ptw_pmp_5_cfg_r; 
  wire [35:0] core_io_ptw_pmp_5_addr; 
  wire [37:0] core_io_ptw_pmp_5_mask; 
  wire  core_io_ptw_pmp_6_cfg_l; 
  wire [1:0] core_io_ptw_pmp_6_cfg_a; 
  wire  core_io_ptw_pmp_6_cfg_x; 
  wire  core_io_ptw_pmp_6_cfg_w; 
  wire  core_io_ptw_pmp_6_cfg_r; 
  wire [35:0] core_io_ptw_pmp_6_addr; 
  wire [37:0] core_io_ptw_pmp_6_mask; 
  wire  core_io_ptw_pmp_7_cfg_l; 
  wire [1:0] core_io_ptw_pmp_7_cfg_a; 
  wire  core_io_ptw_pmp_7_cfg_x; 
  wire  core_io_ptw_pmp_7_cfg_w; 
  wire  core_io_ptw_pmp_7_cfg_r; 
  wire [35:0] core_io_ptw_pmp_7_addr; 
  wire [37:0] core_io_ptw_pmp_7_mask; 
  wire [63:0] core_io_ptw_customCSRs_csrs_0_value; 
  wire [31:0] core_io_fpu_inst; 
  wire [63:0] core_io_fpu_fromint_data; 
  wire [2:0] core_io_fpu_fcsr_rm; 
  wire  core_io_fpu_fcsr_flags_valid; 
  wire [4:0] core_io_fpu_fcsr_flags_bits; 
  wire [63:0] core_io_fpu_store_data; 
  wire [63:0] core_io_fpu_toint_data; 
  wire  core_io_fpu_dmem_resp_val; 
  wire [2:0] core_io_fpu_dmem_resp_type; 
  wire [4:0] core_io_fpu_dmem_resp_tag; 
  wire [63:0] core_io_fpu_dmem_resp_data; 
  wire  core_io_fpu_valid; 
  wire  core_io_fpu_fcsr_rdy; 
  wire  core_io_fpu_nack_mem; 
  wire  core_io_fpu_illegal_rm; 
  wire  core_io_fpu_killx; 
  wire  core_io_fpu_killm; 
  wire  core_io_fpu_dec_wen; 
  wire  core_io_fpu_dec_ren1; 
  wire  core_io_fpu_dec_ren2; 
  wire  core_io_fpu_dec_ren3; 
  wire  core_io_fpu_sboard_set; 
  wire  core_io_fpu_sboard_clr; 
  wire [4:0] core_io_fpu_sboard_clra; 
  wire  core_io_rocc_cmd_ready; 
  wire  core_io_rocc_interrupt; 
  TLXbar_8 tlMasterXbar ( 
    .clock(tlMasterXbar_clock),
    .reset(tlMasterXbar_reset),
    .auto_in_1_a_ready(tlMasterXbar_auto_in_1_a_ready),
    .auto_in_1_a_valid(tlMasterXbar_auto_in_1_a_valid),
    .auto_in_1_a_bits_opcode(tlMasterXbar_auto_in_1_a_bits_opcode),
    .auto_in_1_a_bits_param(tlMasterXbar_auto_in_1_a_bits_param),
    .auto_in_1_a_bits_size(tlMasterXbar_auto_in_1_a_bits_size),
    .auto_in_1_a_bits_source(tlMasterXbar_auto_in_1_a_bits_source),
    .auto_in_1_a_bits_address(tlMasterXbar_auto_in_1_a_bits_address),
    .auto_in_1_a_bits_mask(tlMasterXbar_auto_in_1_a_bits_mask),
    .auto_in_1_a_bits_data(tlMasterXbar_auto_in_1_a_bits_data),
    .auto_in_1_a_bits_corrupt(tlMasterXbar_auto_in_1_a_bits_corrupt),
    .auto_in_1_c_valid(tlMasterXbar_auto_in_1_c_valid),
    .auto_in_1_d_ready(tlMasterXbar_auto_in_1_d_ready),
    .auto_in_1_d_valid(tlMasterXbar_auto_in_1_d_valid),
    .auto_in_1_d_bits_opcode(tlMasterXbar_auto_in_1_d_bits_opcode),
    .auto_in_1_d_bits_size(tlMasterXbar_auto_in_1_d_bits_size),
    .auto_in_1_d_bits_data(tlMasterXbar_auto_in_1_d_bits_data),
    .auto_in_1_d_bits_corrupt(tlMasterXbar_auto_in_1_d_bits_corrupt),
    .auto_in_1_e_valid(tlMasterXbar_auto_in_1_e_valid),
    .auto_in_0_a_ready(tlMasterXbar_auto_in_0_a_ready),
    .auto_in_0_a_valid(tlMasterXbar_auto_in_0_a_valid),
    .auto_in_0_a_bits_opcode(tlMasterXbar_auto_in_0_a_bits_opcode),
    .auto_in_0_a_bits_param(tlMasterXbar_auto_in_0_a_bits_param),
    .auto_in_0_a_bits_size(tlMasterXbar_auto_in_0_a_bits_size),
    .auto_in_0_a_bits_source(tlMasterXbar_auto_in_0_a_bits_source),
    .auto_in_0_a_bits_address(tlMasterXbar_auto_in_0_a_bits_address),
    .auto_in_0_a_bits_mask(tlMasterXbar_auto_in_0_a_bits_mask),
    .auto_in_0_a_bits_data(tlMasterXbar_auto_in_0_a_bits_data),
    .auto_in_0_a_bits_corrupt(tlMasterXbar_auto_in_0_a_bits_corrupt),
    .auto_in_0_b_ready(tlMasterXbar_auto_in_0_b_ready),
    .auto_in_0_b_valid(tlMasterXbar_auto_in_0_b_valid),
    .auto_in_0_b_bits_param(tlMasterXbar_auto_in_0_b_bits_param),
    .auto_in_0_b_bits_size(tlMasterXbar_auto_in_0_b_bits_size),
    .auto_in_0_b_bits_source(tlMasterXbar_auto_in_0_b_bits_source),
    .auto_in_0_b_bits_address(tlMasterXbar_auto_in_0_b_bits_address),
    .auto_in_0_c_ready(tlMasterXbar_auto_in_0_c_ready),
    .auto_in_0_c_valid(tlMasterXbar_auto_in_0_c_valid),
    .auto_in_0_c_bits_opcode(tlMasterXbar_auto_in_0_c_bits_opcode),
    .auto_in_0_c_bits_param(tlMasterXbar_auto_in_0_c_bits_param),
    .auto_in_0_c_bits_size(tlMasterXbar_auto_in_0_c_bits_size),
    .auto_in_0_c_bits_source(tlMasterXbar_auto_in_0_c_bits_source),
    .auto_in_0_c_bits_address(tlMasterXbar_auto_in_0_c_bits_address),
    .auto_in_0_c_bits_data(tlMasterXbar_auto_in_0_c_bits_data),
    .auto_in_0_c_bits_corrupt(tlMasterXbar_auto_in_0_c_bits_corrupt),
    .auto_in_0_d_ready(tlMasterXbar_auto_in_0_d_ready),
    .auto_in_0_d_valid(tlMasterXbar_auto_in_0_d_valid),
    .auto_in_0_d_bits_opcode(tlMasterXbar_auto_in_0_d_bits_opcode),
    .auto_in_0_d_bits_param(tlMasterXbar_auto_in_0_d_bits_param),
    .auto_in_0_d_bits_size(tlMasterXbar_auto_in_0_d_bits_size),
    .auto_in_0_d_bits_source(tlMasterXbar_auto_in_0_d_bits_source),
    .auto_in_0_d_bits_sink(tlMasterXbar_auto_in_0_d_bits_sink),
    .auto_in_0_d_bits_denied(tlMasterXbar_auto_in_0_d_bits_denied),
    .auto_in_0_d_bits_data(tlMasterXbar_auto_in_0_d_bits_data),
    .auto_in_0_e_ready(tlMasterXbar_auto_in_0_e_ready),
    .auto_in_0_e_valid(tlMasterXbar_auto_in_0_e_valid),
    .auto_in_0_e_bits_sink(tlMasterXbar_auto_in_0_e_bits_sink),
    .auto_out_a_ready(tlMasterXbar_auto_out_a_ready),
    .auto_out_a_valid(tlMasterXbar_auto_out_a_valid),
    .auto_out_a_bits_opcode(tlMasterXbar_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(tlMasterXbar_auto_out_a_bits_param),
    .auto_out_a_bits_size(tlMasterXbar_auto_out_a_bits_size),
    .auto_out_a_bits_source(tlMasterXbar_auto_out_a_bits_source),
    .auto_out_a_bits_address(tlMasterXbar_auto_out_a_bits_address),
    .auto_out_a_bits_mask(tlMasterXbar_auto_out_a_bits_mask),
    .auto_out_a_bits_data(tlMasterXbar_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(tlMasterXbar_auto_out_a_bits_corrupt),
    .auto_out_b_ready(tlMasterXbar_auto_out_b_ready),
    .auto_out_b_valid(tlMasterXbar_auto_out_b_valid),
    .auto_out_b_bits_opcode(tlMasterXbar_auto_out_b_bits_opcode),
    .auto_out_b_bits_param(tlMasterXbar_auto_out_b_bits_param),
    .auto_out_b_bits_size(tlMasterXbar_auto_out_b_bits_size),
    .auto_out_b_bits_source(tlMasterXbar_auto_out_b_bits_source),
    .auto_out_b_bits_address(tlMasterXbar_auto_out_b_bits_address),
    .auto_out_b_bits_mask(tlMasterXbar_auto_out_b_bits_mask),
    .auto_out_b_bits_corrupt(tlMasterXbar_auto_out_b_bits_corrupt),
    .auto_out_c_ready(tlMasterXbar_auto_out_c_ready),
    .auto_out_c_valid(tlMasterXbar_auto_out_c_valid),
    .auto_out_c_bits_opcode(tlMasterXbar_auto_out_c_bits_opcode),
    .auto_out_c_bits_param(tlMasterXbar_auto_out_c_bits_param),
    .auto_out_c_bits_size(tlMasterXbar_auto_out_c_bits_size),
    .auto_out_c_bits_source(tlMasterXbar_auto_out_c_bits_source),
    .auto_out_c_bits_address(tlMasterXbar_auto_out_c_bits_address),
    .auto_out_c_bits_data(tlMasterXbar_auto_out_c_bits_data),
    .auto_out_c_bits_corrupt(tlMasterXbar_auto_out_c_bits_corrupt),
    .auto_out_d_ready(tlMasterXbar_auto_out_d_ready),
    .auto_out_d_valid(tlMasterXbar_auto_out_d_valid),
    .auto_out_d_bits_opcode(tlMasterXbar_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(tlMasterXbar_auto_out_d_bits_param),
    .auto_out_d_bits_size(tlMasterXbar_auto_out_d_bits_size),
    .auto_out_d_bits_source(tlMasterXbar_auto_out_d_bits_source),
    .auto_out_d_bits_sink(tlMasterXbar_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(tlMasterXbar_auto_out_d_bits_denied),
    .auto_out_d_bits_data(tlMasterXbar_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(tlMasterXbar_auto_out_d_bits_corrupt),
    .auto_out_e_ready(tlMasterXbar_auto_out_e_ready),
    .auto_out_e_valid(tlMasterXbar_auto_out_e_valid),
    .auto_out_e_bits_sink(tlMasterXbar_auto_out_e_bits_sink)
  );
  IntXbar_1 intXbar ( 
    .auto_int_in_3_0(intXbar_auto_int_in_3_0),
    .auto_int_in_2_0(intXbar_auto_int_in_2_0),
    .auto_int_in_1_0(intXbar_auto_int_in_1_0),
    .auto_int_in_1_1(intXbar_auto_int_in_1_1),
    .auto_int_in_0_0(intXbar_auto_int_in_0_0),
    .auto_int_out_0(intXbar_auto_int_out_0),
    .auto_int_out_1(intXbar_auto_int_out_1),
    .auto_int_out_2(intXbar_auto_int_out_2),
    .auto_int_out_3(intXbar_auto_int_out_3),
    .auto_int_out_4(intXbar_auto_int_out_4)
  );
  DCache dcache ( 
    .gated_clock(dcache_gated_clock),
    .reset(dcache_reset),
    .auto_out_a_ready(dcache_auto_out_a_ready),
    .auto_out_a_valid(dcache_auto_out_a_valid),
    .auto_out_a_bits_opcode(dcache_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(dcache_auto_out_a_bits_param),
    .auto_out_a_bits_size(dcache_auto_out_a_bits_size),
    .auto_out_a_bits_source(dcache_auto_out_a_bits_source),
    .auto_out_a_bits_address(dcache_auto_out_a_bits_address),
    .auto_out_a_bits_mask(dcache_auto_out_a_bits_mask),
    .auto_out_a_bits_data(dcache_auto_out_a_bits_data),
    .auto_out_b_ready(dcache_auto_out_b_ready),
    .auto_out_b_valid(dcache_auto_out_b_valid),
    .auto_out_b_bits_param(dcache_auto_out_b_bits_param),
    .auto_out_b_bits_size(dcache_auto_out_b_bits_size),
    .auto_out_b_bits_source(dcache_auto_out_b_bits_source),
    .auto_out_b_bits_address(dcache_auto_out_b_bits_address),
    .auto_out_c_ready(dcache_auto_out_c_ready),
    .auto_out_c_valid(dcache_auto_out_c_valid),
    .auto_out_c_bits_opcode(dcache_auto_out_c_bits_opcode),
    .auto_out_c_bits_param(dcache_auto_out_c_bits_param),
    .auto_out_c_bits_size(dcache_auto_out_c_bits_size),
    .auto_out_c_bits_source(dcache_auto_out_c_bits_source),
    .auto_out_c_bits_address(dcache_auto_out_c_bits_address),
    .auto_out_c_bits_data(dcache_auto_out_c_bits_data),
    .auto_out_d_ready(dcache_auto_out_d_ready),
    .auto_out_d_valid(dcache_auto_out_d_valid),
    .auto_out_d_bits_opcode(dcache_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(dcache_auto_out_d_bits_param),
    .auto_out_d_bits_size(dcache_auto_out_d_bits_size),
    .auto_out_d_bits_source(dcache_auto_out_d_bits_source),
    .auto_out_d_bits_sink(dcache_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(dcache_auto_out_d_bits_denied),
    .auto_out_d_bits_data(dcache_auto_out_d_bits_data),
    .auto_out_e_ready(dcache_auto_out_e_ready),
    .auto_out_e_valid(dcache_auto_out_e_valid),
    .auto_out_e_bits_sink(dcache_auto_out_e_bits_sink),
    .io_cpu_req_ready(dcache_io_cpu_req_ready),
    .io_cpu_req_valid(dcache_io_cpu_req_valid),
    .io_cpu_req_bits_addr(dcache_io_cpu_req_bits_addr),
    .io_cpu_req_bits_tag(dcache_io_cpu_req_bits_tag),
    .io_cpu_req_bits_cmd(dcache_io_cpu_req_bits_cmd),
    .io_cpu_req_bits_typ(dcache_io_cpu_req_bits_typ),
    .io_cpu_req_bits_phys(dcache_io_cpu_req_bits_phys),
    .io_cpu_s1_kill(dcache_io_cpu_s1_kill),
    .io_cpu_s1_data_data(dcache_io_cpu_s1_data_data),
    .io_cpu_s1_data_mask(dcache_io_cpu_s1_data_mask),
    .io_cpu_s2_nack(dcache_io_cpu_s2_nack),
    .io_cpu_s2_kill(dcache_io_cpu_s2_kill),
    .io_cpu_resp_valid(dcache_io_cpu_resp_valid),
    .io_cpu_resp_bits_tag(dcache_io_cpu_resp_bits_tag),
    .io_cpu_resp_bits_typ(dcache_io_cpu_resp_bits_typ),
    .io_cpu_resp_bits_data(dcache_io_cpu_resp_bits_data),
    .io_cpu_resp_bits_replay(dcache_io_cpu_resp_bits_replay),
    .io_cpu_resp_bits_has_data(dcache_io_cpu_resp_bits_has_data),
    .io_cpu_resp_bits_data_word_bypass(dcache_io_cpu_resp_bits_data_word_bypass),
    .io_cpu_replay_next(dcache_io_cpu_replay_next),
    .io_cpu_s2_xcpt_ma_ld(dcache_io_cpu_s2_xcpt_ma_ld),
    .io_cpu_s2_xcpt_ma_st(dcache_io_cpu_s2_xcpt_ma_st),
    .io_cpu_s2_xcpt_pf_ld(dcache_io_cpu_s2_xcpt_pf_ld),
    .io_cpu_s2_xcpt_pf_st(dcache_io_cpu_s2_xcpt_pf_st),
    .io_cpu_s2_xcpt_ae_ld(dcache_io_cpu_s2_xcpt_ae_ld),
    .io_cpu_s2_xcpt_ae_st(dcache_io_cpu_s2_xcpt_ae_st),
    .io_cpu_ordered(dcache_io_cpu_ordered),
    .io_cpu_perf_grant(dcache_io_cpu_perf_grant),
    .io_cpu_keep_clock_enabled(dcache_io_cpu_keep_clock_enabled),
    .io_cpu_clock_enabled(dcache_io_cpu_clock_enabled),
    .io_ptw_req_ready(dcache_io_ptw_req_ready),
    .io_ptw_req_valid(dcache_io_ptw_req_valid),
    .io_ptw_req_bits_valid(dcache_io_ptw_req_bits_valid),
    .io_ptw_req_bits_bits_addr(dcache_io_ptw_req_bits_bits_addr),
    .io_ptw_resp_valid(dcache_io_ptw_resp_valid),
    .io_ptw_resp_bits_ae(dcache_io_ptw_resp_bits_ae),
    .io_ptw_resp_bits_pte_ppn(dcache_io_ptw_resp_bits_pte_ppn),
    .io_ptw_resp_bits_pte_d(dcache_io_ptw_resp_bits_pte_d),
    .io_ptw_resp_bits_pte_a(dcache_io_ptw_resp_bits_pte_a),
    .io_ptw_resp_bits_pte_g(dcache_io_ptw_resp_bits_pte_g),
    .io_ptw_resp_bits_pte_u(dcache_io_ptw_resp_bits_pte_u),
    .io_ptw_resp_bits_pte_x(dcache_io_ptw_resp_bits_pte_x),
    .io_ptw_resp_bits_pte_w(dcache_io_ptw_resp_bits_pte_w),
    .io_ptw_resp_bits_pte_r(dcache_io_ptw_resp_bits_pte_r),
    .io_ptw_resp_bits_pte_v(dcache_io_ptw_resp_bits_pte_v),
    .io_ptw_resp_bits_level(dcache_io_ptw_resp_bits_level),
    .io_ptw_resp_bits_fragmented_superpage(dcache_io_ptw_resp_bits_fragmented_superpage),
    .io_ptw_resp_bits_homogeneous(dcache_io_ptw_resp_bits_homogeneous),
    .io_ptw_ptbr_mode(dcache_io_ptw_ptbr_mode),
    .io_ptw_status_dprv(dcache_io_ptw_status_dprv),
    .io_ptw_status_mxr(dcache_io_ptw_status_mxr),
    .io_ptw_status_sum(dcache_io_ptw_status_sum),
    .io_ptw_pmp_0_cfg_l(dcache_io_ptw_pmp_0_cfg_l),
    .io_ptw_pmp_0_cfg_a(dcache_io_ptw_pmp_0_cfg_a),
    .io_ptw_pmp_0_cfg_x(dcache_io_ptw_pmp_0_cfg_x),
    .io_ptw_pmp_0_cfg_w(dcache_io_ptw_pmp_0_cfg_w),
    .io_ptw_pmp_0_cfg_r(dcache_io_ptw_pmp_0_cfg_r),
    .io_ptw_pmp_0_addr(dcache_io_ptw_pmp_0_addr),
    .io_ptw_pmp_0_mask(dcache_io_ptw_pmp_0_mask),
    .io_ptw_pmp_1_cfg_l(dcache_io_ptw_pmp_1_cfg_l),
    .io_ptw_pmp_1_cfg_a(dcache_io_ptw_pmp_1_cfg_a),
    .io_ptw_pmp_1_cfg_x(dcache_io_ptw_pmp_1_cfg_x),
    .io_ptw_pmp_1_cfg_w(dcache_io_ptw_pmp_1_cfg_w),
    .io_ptw_pmp_1_cfg_r(dcache_io_ptw_pmp_1_cfg_r),
    .io_ptw_pmp_1_addr(dcache_io_ptw_pmp_1_addr),
    .io_ptw_pmp_1_mask(dcache_io_ptw_pmp_1_mask),
    .io_ptw_pmp_2_cfg_l(dcache_io_ptw_pmp_2_cfg_l),
    .io_ptw_pmp_2_cfg_a(dcache_io_ptw_pmp_2_cfg_a),
    .io_ptw_pmp_2_cfg_x(dcache_io_ptw_pmp_2_cfg_x),
    .io_ptw_pmp_2_cfg_w(dcache_io_ptw_pmp_2_cfg_w),
    .io_ptw_pmp_2_cfg_r(dcache_io_ptw_pmp_2_cfg_r),
    .io_ptw_pmp_2_addr(dcache_io_ptw_pmp_2_addr),
    .io_ptw_pmp_2_mask(dcache_io_ptw_pmp_2_mask),
    .io_ptw_pmp_3_cfg_l(dcache_io_ptw_pmp_3_cfg_l),
    .io_ptw_pmp_3_cfg_a(dcache_io_ptw_pmp_3_cfg_a),
    .io_ptw_pmp_3_cfg_x(dcache_io_ptw_pmp_3_cfg_x),
    .io_ptw_pmp_3_cfg_w(dcache_io_ptw_pmp_3_cfg_w),
    .io_ptw_pmp_3_cfg_r(dcache_io_ptw_pmp_3_cfg_r),
    .io_ptw_pmp_3_addr(dcache_io_ptw_pmp_3_addr),
    .io_ptw_pmp_3_mask(dcache_io_ptw_pmp_3_mask),
    .io_ptw_pmp_4_cfg_l(dcache_io_ptw_pmp_4_cfg_l),
    .io_ptw_pmp_4_cfg_a(dcache_io_ptw_pmp_4_cfg_a),
    .io_ptw_pmp_4_cfg_x(dcache_io_ptw_pmp_4_cfg_x),
    .io_ptw_pmp_4_cfg_w(dcache_io_ptw_pmp_4_cfg_w),
    .io_ptw_pmp_4_cfg_r(dcache_io_ptw_pmp_4_cfg_r),
    .io_ptw_pmp_4_addr(dcache_io_ptw_pmp_4_addr),
    .io_ptw_pmp_4_mask(dcache_io_ptw_pmp_4_mask),
    .io_ptw_pmp_5_cfg_l(dcache_io_ptw_pmp_5_cfg_l),
    .io_ptw_pmp_5_cfg_a(dcache_io_ptw_pmp_5_cfg_a),
    .io_ptw_pmp_5_cfg_x(dcache_io_ptw_pmp_5_cfg_x),
    .io_ptw_pmp_5_cfg_w(dcache_io_ptw_pmp_5_cfg_w),
    .io_ptw_pmp_5_cfg_r(dcache_io_ptw_pmp_5_cfg_r),
    .io_ptw_pmp_5_addr(dcache_io_ptw_pmp_5_addr),
    .io_ptw_pmp_5_mask(dcache_io_ptw_pmp_5_mask),
    .io_ptw_pmp_6_cfg_l(dcache_io_ptw_pmp_6_cfg_l),
    .io_ptw_pmp_6_cfg_a(dcache_io_ptw_pmp_6_cfg_a),
    .io_ptw_pmp_6_cfg_x(dcache_io_ptw_pmp_6_cfg_x),
    .io_ptw_pmp_6_cfg_w(dcache_io_ptw_pmp_6_cfg_w),
    .io_ptw_pmp_6_cfg_r(dcache_io_ptw_pmp_6_cfg_r),
    .io_ptw_pmp_6_addr(dcache_io_ptw_pmp_6_addr),
    .io_ptw_pmp_6_mask(dcache_io_ptw_pmp_6_mask),
    .io_ptw_pmp_7_cfg_l(dcache_io_ptw_pmp_7_cfg_l),
    .io_ptw_pmp_7_cfg_a(dcache_io_ptw_pmp_7_cfg_a),
    .io_ptw_pmp_7_cfg_x(dcache_io_ptw_pmp_7_cfg_x),
    .io_ptw_pmp_7_cfg_w(dcache_io_ptw_pmp_7_cfg_w),
    .io_ptw_pmp_7_cfg_r(dcache_io_ptw_pmp_7_cfg_r),
    .io_ptw_pmp_7_addr(dcache_io_ptw_pmp_7_addr),
    .io_ptw_pmp_7_mask(dcache_io_ptw_pmp_7_mask),
    .io_ptw_customCSRs_csrs_0_value(dcache_io_ptw_customCSRs_csrs_0_value)
  );
  Frontend frontend ( 
    .gated_clock(frontend_gated_clock),
    .reset(frontend_reset),
    .auto_icache_master_out_a_ready(frontend_auto_icache_master_out_a_ready),
    .auto_icache_master_out_a_valid(frontend_auto_icache_master_out_a_valid),
    .auto_icache_master_out_a_bits_address(frontend_auto_icache_master_out_a_bits_address),
    .auto_icache_master_out_d_valid(frontend_auto_icache_master_out_d_valid),
    .auto_icache_master_out_d_bits_opcode(frontend_auto_icache_master_out_d_bits_opcode),
    .auto_icache_master_out_d_bits_size(frontend_auto_icache_master_out_d_bits_size),
    .auto_icache_master_out_d_bits_data(frontend_auto_icache_master_out_d_bits_data),
    .auto_icache_master_out_d_bits_corrupt(frontend_auto_icache_master_out_d_bits_corrupt),
    .io_reset_vector(frontend_io_reset_vector),
    .io_cpu_might_request(frontend_io_cpu_might_request),
    .io_cpu_req_valid(frontend_io_cpu_req_valid),
    .io_cpu_req_bits_pc(frontend_io_cpu_req_bits_pc),
    .io_cpu_req_bits_speculative(frontend_io_cpu_req_bits_speculative),
    .io_cpu_sfence_valid(frontend_io_cpu_sfence_valid),
    .io_cpu_sfence_bits_rs1(frontend_io_cpu_sfence_bits_rs1),
    .io_cpu_sfence_bits_rs2(frontend_io_cpu_sfence_bits_rs2),
    .io_cpu_sfence_bits_addr(frontend_io_cpu_sfence_bits_addr),
    .io_cpu_resp_ready(frontend_io_cpu_resp_ready),
    .io_cpu_resp_valid(frontend_io_cpu_resp_valid),
    .io_cpu_resp_bits_btb_taken(frontend_io_cpu_resp_bits_btb_taken),
    .io_cpu_resp_bits_btb_bridx(frontend_io_cpu_resp_bits_btb_bridx),
    .io_cpu_resp_bits_btb_entry(frontend_io_cpu_resp_bits_btb_entry),
    .io_cpu_resp_bits_btb_bht_history(frontend_io_cpu_resp_bits_btb_bht_history),
    .io_cpu_resp_bits_pc(frontend_io_cpu_resp_bits_pc),
    .io_cpu_resp_bits_data(frontend_io_cpu_resp_bits_data),
    .io_cpu_resp_bits_xcpt_pf_inst(frontend_io_cpu_resp_bits_xcpt_pf_inst),
    .io_cpu_resp_bits_xcpt_ae_inst(frontend_io_cpu_resp_bits_xcpt_ae_inst),
    .io_cpu_resp_bits_replay(frontend_io_cpu_resp_bits_replay),
    .io_cpu_btb_update_valid(frontend_io_cpu_btb_update_valid),
    .io_cpu_btb_update_bits_prediction_entry(frontend_io_cpu_btb_update_bits_prediction_entry),
    .io_cpu_btb_update_bits_pc(frontend_io_cpu_btb_update_bits_pc),
    .io_cpu_btb_update_bits_isValid(frontend_io_cpu_btb_update_bits_isValid),
    .io_cpu_btb_update_bits_br_pc(frontend_io_cpu_btb_update_bits_br_pc),
    .io_cpu_btb_update_bits_cfiType(frontend_io_cpu_btb_update_bits_cfiType),
    .io_cpu_bht_update_valid(frontend_io_cpu_bht_update_valid),
    .io_cpu_bht_update_bits_prediction_history(frontend_io_cpu_bht_update_bits_prediction_history),
    .io_cpu_bht_update_bits_pc(frontend_io_cpu_bht_update_bits_pc),
    .io_cpu_bht_update_bits_branch(frontend_io_cpu_bht_update_bits_branch),
    .io_cpu_bht_update_bits_taken(frontend_io_cpu_bht_update_bits_taken),
    .io_cpu_bht_update_bits_mispredict(frontend_io_cpu_bht_update_bits_mispredict),
    .io_cpu_flush_icache(frontend_io_cpu_flush_icache),
    .io_cpu_npc(frontend_io_cpu_npc),
    .io_ptw_req_ready(frontend_io_ptw_req_ready),
    .io_ptw_req_valid(frontend_io_ptw_req_valid),
    .io_ptw_req_bits_valid(frontend_io_ptw_req_bits_valid),
    .io_ptw_req_bits_bits_addr(frontend_io_ptw_req_bits_bits_addr),
    .io_ptw_resp_valid(frontend_io_ptw_resp_valid),
    .io_ptw_resp_bits_ae(frontend_io_ptw_resp_bits_ae),
    .io_ptw_resp_bits_pte_ppn(frontend_io_ptw_resp_bits_pte_ppn),
    .io_ptw_resp_bits_pte_d(frontend_io_ptw_resp_bits_pte_d),
    .io_ptw_resp_bits_pte_a(frontend_io_ptw_resp_bits_pte_a),
    .io_ptw_resp_bits_pte_g(frontend_io_ptw_resp_bits_pte_g),
    .io_ptw_resp_bits_pte_u(frontend_io_ptw_resp_bits_pte_u),
    .io_ptw_resp_bits_pte_x(frontend_io_ptw_resp_bits_pte_x),
    .io_ptw_resp_bits_pte_w(frontend_io_ptw_resp_bits_pte_w),
    .io_ptw_resp_bits_pte_r(frontend_io_ptw_resp_bits_pte_r),
    .io_ptw_resp_bits_pte_v(frontend_io_ptw_resp_bits_pte_v),
    .io_ptw_resp_bits_level(frontend_io_ptw_resp_bits_level),
    .io_ptw_resp_bits_fragmented_superpage(frontend_io_ptw_resp_bits_fragmented_superpage),
    .io_ptw_resp_bits_homogeneous(frontend_io_ptw_resp_bits_homogeneous),
    .io_ptw_ptbr_mode(frontend_io_ptw_ptbr_mode),
    .io_ptw_status_prv(frontend_io_ptw_status_prv),
    .io_ptw_pmp_0_cfg_l(frontend_io_ptw_pmp_0_cfg_l),
    .io_ptw_pmp_0_cfg_a(frontend_io_ptw_pmp_0_cfg_a),
    .io_ptw_pmp_0_cfg_x(frontend_io_ptw_pmp_0_cfg_x),
    .io_ptw_pmp_0_cfg_w(frontend_io_ptw_pmp_0_cfg_w),
    .io_ptw_pmp_0_cfg_r(frontend_io_ptw_pmp_0_cfg_r),
    .io_ptw_pmp_0_addr(frontend_io_ptw_pmp_0_addr),
    .io_ptw_pmp_0_mask(frontend_io_ptw_pmp_0_mask),
    .io_ptw_pmp_1_cfg_l(frontend_io_ptw_pmp_1_cfg_l),
    .io_ptw_pmp_1_cfg_a(frontend_io_ptw_pmp_1_cfg_a),
    .io_ptw_pmp_1_cfg_x(frontend_io_ptw_pmp_1_cfg_x),
    .io_ptw_pmp_1_cfg_w(frontend_io_ptw_pmp_1_cfg_w),
    .io_ptw_pmp_1_cfg_r(frontend_io_ptw_pmp_1_cfg_r),
    .io_ptw_pmp_1_addr(frontend_io_ptw_pmp_1_addr),
    .io_ptw_pmp_1_mask(frontend_io_ptw_pmp_1_mask),
    .io_ptw_pmp_2_cfg_l(frontend_io_ptw_pmp_2_cfg_l),
    .io_ptw_pmp_2_cfg_a(frontend_io_ptw_pmp_2_cfg_a),
    .io_ptw_pmp_2_cfg_x(frontend_io_ptw_pmp_2_cfg_x),
    .io_ptw_pmp_2_cfg_w(frontend_io_ptw_pmp_2_cfg_w),
    .io_ptw_pmp_2_cfg_r(frontend_io_ptw_pmp_2_cfg_r),
    .io_ptw_pmp_2_addr(frontend_io_ptw_pmp_2_addr),
    .io_ptw_pmp_2_mask(frontend_io_ptw_pmp_2_mask),
    .io_ptw_pmp_3_cfg_l(frontend_io_ptw_pmp_3_cfg_l),
    .io_ptw_pmp_3_cfg_a(frontend_io_ptw_pmp_3_cfg_a),
    .io_ptw_pmp_3_cfg_x(frontend_io_ptw_pmp_3_cfg_x),
    .io_ptw_pmp_3_cfg_w(frontend_io_ptw_pmp_3_cfg_w),
    .io_ptw_pmp_3_cfg_r(frontend_io_ptw_pmp_3_cfg_r),
    .io_ptw_pmp_3_addr(frontend_io_ptw_pmp_3_addr),
    .io_ptw_pmp_3_mask(frontend_io_ptw_pmp_3_mask),
    .io_ptw_pmp_4_cfg_l(frontend_io_ptw_pmp_4_cfg_l),
    .io_ptw_pmp_4_cfg_a(frontend_io_ptw_pmp_4_cfg_a),
    .io_ptw_pmp_4_cfg_x(frontend_io_ptw_pmp_4_cfg_x),
    .io_ptw_pmp_4_cfg_w(frontend_io_ptw_pmp_4_cfg_w),
    .io_ptw_pmp_4_cfg_r(frontend_io_ptw_pmp_4_cfg_r),
    .io_ptw_pmp_4_addr(frontend_io_ptw_pmp_4_addr),
    .io_ptw_pmp_4_mask(frontend_io_ptw_pmp_4_mask),
    .io_ptw_pmp_5_cfg_l(frontend_io_ptw_pmp_5_cfg_l),
    .io_ptw_pmp_5_cfg_a(frontend_io_ptw_pmp_5_cfg_a),
    .io_ptw_pmp_5_cfg_x(frontend_io_ptw_pmp_5_cfg_x),
    .io_ptw_pmp_5_cfg_w(frontend_io_ptw_pmp_5_cfg_w),
    .io_ptw_pmp_5_cfg_r(frontend_io_ptw_pmp_5_cfg_r),
    .io_ptw_pmp_5_addr(frontend_io_ptw_pmp_5_addr),
    .io_ptw_pmp_5_mask(frontend_io_ptw_pmp_5_mask),
    .io_ptw_pmp_6_cfg_l(frontend_io_ptw_pmp_6_cfg_l),
    .io_ptw_pmp_6_cfg_a(frontend_io_ptw_pmp_6_cfg_a),
    .io_ptw_pmp_6_cfg_x(frontend_io_ptw_pmp_6_cfg_x),
    .io_ptw_pmp_6_cfg_w(frontend_io_ptw_pmp_6_cfg_w),
    .io_ptw_pmp_6_cfg_r(frontend_io_ptw_pmp_6_cfg_r),
    .io_ptw_pmp_6_addr(frontend_io_ptw_pmp_6_addr),
    .io_ptw_pmp_6_mask(frontend_io_ptw_pmp_6_mask),
    .io_ptw_pmp_7_cfg_l(frontend_io_ptw_pmp_7_cfg_l),
    .io_ptw_pmp_7_cfg_a(frontend_io_ptw_pmp_7_cfg_a),
    .io_ptw_pmp_7_cfg_x(frontend_io_ptw_pmp_7_cfg_x),
    .io_ptw_pmp_7_cfg_w(frontend_io_ptw_pmp_7_cfg_w),
    .io_ptw_pmp_7_cfg_r(frontend_io_ptw_pmp_7_cfg_r),
    .io_ptw_pmp_7_addr(frontend_io_ptw_pmp_7_addr),
    .io_ptw_pmp_7_mask(frontend_io_ptw_pmp_7_mask)
  );
  TLBuffer_23 buffer ( 
    .clock(buffer_clock),
    .reset(buffer_reset),
    .auto_in_a_ready(buffer_auto_in_a_ready),
    .auto_in_a_valid(buffer_auto_in_a_valid),
    .auto_in_a_bits_opcode(buffer_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(buffer_auto_in_a_bits_param),
    .auto_in_a_bits_size(buffer_auto_in_a_bits_size),
    .auto_in_a_bits_source(buffer_auto_in_a_bits_source),
    .auto_in_a_bits_address(buffer_auto_in_a_bits_address),
    .auto_in_a_bits_mask(buffer_auto_in_a_bits_mask),
    .auto_in_a_bits_data(buffer_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(buffer_auto_in_a_bits_corrupt),
    .auto_in_b_ready(buffer_auto_in_b_ready),
    .auto_in_b_valid(buffer_auto_in_b_valid),
    .auto_in_b_bits_opcode(buffer_auto_in_b_bits_opcode),
    .auto_in_b_bits_param(buffer_auto_in_b_bits_param),
    .auto_in_b_bits_size(buffer_auto_in_b_bits_size),
    .auto_in_b_bits_source(buffer_auto_in_b_bits_source),
    .auto_in_b_bits_address(buffer_auto_in_b_bits_address),
    .auto_in_b_bits_mask(buffer_auto_in_b_bits_mask),
    .auto_in_b_bits_corrupt(buffer_auto_in_b_bits_corrupt),
    .auto_in_c_ready(buffer_auto_in_c_ready),
    .auto_in_c_valid(buffer_auto_in_c_valid),
    .auto_in_c_bits_opcode(buffer_auto_in_c_bits_opcode),
    .auto_in_c_bits_param(buffer_auto_in_c_bits_param),
    .auto_in_c_bits_size(buffer_auto_in_c_bits_size),
    .auto_in_c_bits_source(buffer_auto_in_c_bits_source),
    .auto_in_c_bits_address(buffer_auto_in_c_bits_address),
    .auto_in_c_bits_data(buffer_auto_in_c_bits_data),
    .auto_in_c_bits_corrupt(buffer_auto_in_c_bits_corrupt),
    .auto_in_d_ready(buffer_auto_in_d_ready),
    .auto_in_d_valid(buffer_auto_in_d_valid),
    .auto_in_d_bits_opcode(buffer_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(buffer_auto_in_d_bits_param),
    .auto_in_d_bits_size(buffer_auto_in_d_bits_size),
    .auto_in_d_bits_source(buffer_auto_in_d_bits_source),
    .auto_in_d_bits_sink(buffer_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(buffer_auto_in_d_bits_denied),
    .auto_in_d_bits_data(buffer_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(buffer_auto_in_d_bits_corrupt),
    .auto_in_e_ready(buffer_auto_in_e_ready),
    .auto_in_e_valid(buffer_auto_in_e_valid),
    .auto_in_e_bits_sink(buffer_auto_in_e_bits_sink),
    .auto_out_a_ready(buffer_auto_out_a_ready),
    .auto_out_a_valid(buffer_auto_out_a_valid),
    .auto_out_a_bits_opcode(buffer_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(buffer_auto_out_a_bits_param),
    .auto_out_a_bits_size(buffer_auto_out_a_bits_size),
    .auto_out_a_bits_source(buffer_auto_out_a_bits_source),
    .auto_out_a_bits_address(buffer_auto_out_a_bits_address),
    .auto_out_a_bits_mask(buffer_auto_out_a_bits_mask),
    .auto_out_a_bits_data(buffer_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(buffer_auto_out_a_bits_corrupt),
    .auto_out_b_ready(buffer_auto_out_b_ready),
    .auto_out_b_valid(buffer_auto_out_b_valid),
    .auto_out_b_bits_opcode(buffer_auto_out_b_bits_opcode),
    .auto_out_b_bits_param(buffer_auto_out_b_bits_param),
    .auto_out_b_bits_size(buffer_auto_out_b_bits_size),
    .auto_out_b_bits_source(buffer_auto_out_b_bits_source),
    .auto_out_b_bits_address(buffer_auto_out_b_bits_address),
    .auto_out_b_bits_mask(buffer_auto_out_b_bits_mask),
    .auto_out_b_bits_corrupt(buffer_auto_out_b_bits_corrupt),
    .auto_out_c_ready(buffer_auto_out_c_ready),
    .auto_out_c_valid(buffer_auto_out_c_valid),
    .auto_out_c_bits_opcode(buffer_auto_out_c_bits_opcode),
    .auto_out_c_bits_param(buffer_auto_out_c_bits_param),
    .auto_out_c_bits_size(buffer_auto_out_c_bits_size),
    .auto_out_c_bits_source(buffer_auto_out_c_bits_source),
    .auto_out_c_bits_address(buffer_auto_out_c_bits_address),
    .auto_out_c_bits_data(buffer_auto_out_c_bits_data),
    .auto_out_c_bits_corrupt(buffer_auto_out_c_bits_corrupt),
    .auto_out_d_ready(buffer_auto_out_d_ready),
    .auto_out_d_valid(buffer_auto_out_d_valid),
    .auto_out_d_bits_opcode(buffer_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(buffer_auto_out_d_bits_param),
    .auto_out_d_bits_size(buffer_auto_out_d_bits_size),
    .auto_out_d_bits_source(buffer_auto_out_d_bits_source),
    .auto_out_d_bits_sink(buffer_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(buffer_auto_out_d_bits_denied),
    .auto_out_d_bits_data(buffer_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(buffer_auto_out_d_bits_corrupt),
    .auto_out_e_ready(buffer_auto_out_e_ready),
    .auto_out_e_valid(buffer_auto_out_e_valid),
    .auto_out_e_bits_sink(buffer_auto_out_e_bits_sink)
  );
  IntSyncCrossingSink intsink ( 
    .clock(intsink_clock),
    .auto_in_sync_0(intsink_auto_in_sync_0),
    .auto_out_0(intsink_auto_out_0)
  );
  IntSyncCrossingSink_1 intsink_1 ( 
    .auto_in_sync_0(intsink_1_auto_in_sync_0),
    .auto_in_sync_1(intsink_1_auto_in_sync_1),
    .auto_out_0(intsink_1_auto_out_0),
    .auto_out_1(intsink_1_auto_out_1)
  );
  IntSyncCrossingSink_2 intsink_2 ( 
    .auto_in_sync_0(intsink_2_auto_in_sync_0),
    .auto_out_0(intsink_2_auto_out_0)
  );
  IntSyncCrossingSink_2 intsink_3 ( 
    .auto_in_sync_0(intsink_3_auto_in_sync_0),
    .auto_out_0(intsink_3_auto_out_0)
  );
  FPU fpuOpt ( 
    .clock(fpuOpt_clock),
    .reset(fpuOpt_reset),
    .io_inst(fpuOpt_io_inst),
    .io_fromint_data(fpuOpt_io_fromint_data),
    .io_fcsr_rm(fpuOpt_io_fcsr_rm),
    .io_fcsr_flags_valid(fpuOpt_io_fcsr_flags_valid),
    .io_fcsr_flags_bits(fpuOpt_io_fcsr_flags_bits),
    .io_store_data(fpuOpt_io_store_data),
    .io_toint_data(fpuOpt_io_toint_data),
    .io_dmem_resp_val(fpuOpt_io_dmem_resp_val),
    .io_dmem_resp_type(fpuOpt_io_dmem_resp_type),
    .io_dmem_resp_tag(fpuOpt_io_dmem_resp_tag),
    .io_dmem_resp_data(fpuOpt_io_dmem_resp_data),
    .io_valid(fpuOpt_io_valid),
    .io_fcsr_rdy(fpuOpt_io_fcsr_rdy),
    .io_nack_mem(fpuOpt_io_nack_mem),
    .io_illegal_rm(fpuOpt_io_illegal_rm),
    .io_killx(fpuOpt_io_killx),
    .io_killm(fpuOpt_io_killm),
    .io_dec_wen(fpuOpt_io_dec_wen),
    .io_dec_ren1(fpuOpt_io_dec_ren1),
    .io_dec_ren2(fpuOpt_io_dec_ren2),
    .io_dec_ren3(fpuOpt_io_dec_ren3),
    .io_sboard_set(fpuOpt_io_sboard_set),
    .io_sboard_clr(fpuOpt_io_sboard_clr),
    .io_sboard_clra(fpuOpt_io_sboard_clra),
    .io_cp_req_ready(fpuOpt_io_cp_req_ready),
    .io_cp_req_valid(fpuOpt_io_cp_req_valid),
    .io_cp_req_bits_ren2(fpuOpt_io_cp_req_bits_ren2),
    .io_cp_req_bits_ren3(fpuOpt_io_cp_req_bits_ren3),
    .io_cp_req_bits_swap23(fpuOpt_io_cp_req_bits_swap23),
    .io_cp_req_bits_singleIn(fpuOpt_io_cp_req_bits_singleIn),
    .io_cp_req_bits_singleOut(fpuOpt_io_cp_req_bits_singleOut),
    .io_cp_req_bits_fromint(fpuOpt_io_cp_req_bits_fromint),
    .io_cp_req_bits_toint(fpuOpt_io_cp_req_bits_toint),
    .io_cp_req_bits_fastpipe(fpuOpt_io_cp_req_bits_fastpipe),
    .io_cp_req_bits_fma(fpuOpt_io_cp_req_bits_fma),
    .io_cp_req_bits_div(fpuOpt_io_cp_req_bits_div),
    .io_cp_req_bits_sqrt(fpuOpt_io_cp_req_bits_sqrt),
    .io_cp_req_bits_wflags(fpuOpt_io_cp_req_bits_wflags),
    .io_cp_req_bits_rm(fpuOpt_io_cp_req_bits_rm),
    .io_cp_req_bits_fmaCmd(fpuOpt_io_cp_req_bits_fmaCmd),
    .io_cp_req_bits_typ(fpuOpt_io_cp_req_bits_typ),
    .io_cp_req_bits_in1(fpuOpt_io_cp_req_bits_in1),
    .io_cp_req_bits_in2(fpuOpt_io_cp_req_bits_in2),
    .io_cp_req_bits_in3(fpuOpt_io_cp_req_bits_in3)
  );
  HellaCacheArbiter dcacheArb ( 
    .clock(dcacheArb_clock),
    .io_requestor_0_req_ready(dcacheArb_io_requestor_0_req_ready),
    .io_requestor_0_req_valid(dcacheArb_io_requestor_0_req_valid),
    .io_requestor_0_req_bits_addr(dcacheArb_io_requestor_0_req_bits_addr),
    .io_requestor_0_req_bits_tag(dcacheArb_io_requestor_0_req_bits_tag),
    .io_requestor_0_req_bits_cmd(dcacheArb_io_requestor_0_req_bits_cmd),
    .io_requestor_0_req_bits_typ(dcacheArb_io_requestor_0_req_bits_typ),
    .io_requestor_0_req_bits_phys(dcacheArb_io_requestor_0_req_bits_phys),
    .io_requestor_0_s1_kill(dcacheArb_io_requestor_0_s1_kill),
    .io_requestor_0_s1_data_data(dcacheArb_io_requestor_0_s1_data_data),
    .io_requestor_0_s1_data_mask(dcacheArb_io_requestor_0_s1_data_mask),
    .io_requestor_0_s2_nack(dcacheArb_io_requestor_0_s2_nack),
    .io_requestor_0_s2_kill(dcacheArb_io_requestor_0_s2_kill),
    .io_requestor_0_resp_valid(dcacheArb_io_requestor_0_resp_valid),
    .io_requestor_0_resp_bits_data_word_bypass(dcacheArb_io_requestor_0_resp_bits_data_word_bypass),
    .io_requestor_0_s2_xcpt_ae_ld(dcacheArb_io_requestor_0_s2_xcpt_ae_ld),
    .io_requestor_0_keep_clock_enabled(dcacheArb_io_requestor_0_keep_clock_enabled),
    .io_requestor_1_req_ready(dcacheArb_io_requestor_1_req_ready),
    .io_requestor_1_req_valid(dcacheArb_io_requestor_1_req_valid),
    .io_requestor_1_req_bits_addr(dcacheArb_io_requestor_1_req_bits_addr),
    .io_requestor_1_req_bits_tag(dcacheArb_io_requestor_1_req_bits_tag),
    .io_requestor_1_req_bits_cmd(dcacheArb_io_requestor_1_req_bits_cmd),
    .io_requestor_1_req_bits_typ(dcacheArb_io_requestor_1_req_bits_typ),
    .io_requestor_1_req_bits_phys(dcacheArb_io_requestor_1_req_bits_phys),
    .io_requestor_1_s1_kill(dcacheArb_io_requestor_1_s1_kill),
    .io_requestor_1_s1_data_data(dcacheArb_io_requestor_1_s1_data_data),
    .io_requestor_1_s1_data_mask(dcacheArb_io_requestor_1_s1_data_mask),
    .io_requestor_1_s2_nack(dcacheArb_io_requestor_1_s2_nack),
    .io_requestor_1_s2_kill(dcacheArb_io_requestor_1_s2_kill),
    .io_requestor_1_resp_valid(dcacheArb_io_requestor_1_resp_valid),
    .io_requestor_1_resp_bits_tag(dcacheArb_io_requestor_1_resp_bits_tag),
    .io_requestor_1_resp_bits_typ(dcacheArb_io_requestor_1_resp_bits_typ),
    .io_requestor_1_resp_bits_data(dcacheArb_io_requestor_1_resp_bits_data),
    .io_requestor_1_resp_bits_replay(dcacheArb_io_requestor_1_resp_bits_replay),
    .io_requestor_1_resp_bits_has_data(dcacheArb_io_requestor_1_resp_bits_has_data),
    .io_requestor_1_resp_bits_data_word_bypass(dcacheArb_io_requestor_1_resp_bits_data_word_bypass),
    .io_requestor_1_replay_next(dcacheArb_io_requestor_1_replay_next),
    .io_requestor_1_s2_xcpt_ma_ld(dcacheArb_io_requestor_1_s2_xcpt_ma_ld),
    .io_requestor_1_s2_xcpt_ma_st(dcacheArb_io_requestor_1_s2_xcpt_ma_st),
    .io_requestor_1_s2_xcpt_pf_ld(dcacheArb_io_requestor_1_s2_xcpt_pf_ld),
    .io_requestor_1_s2_xcpt_pf_st(dcacheArb_io_requestor_1_s2_xcpt_pf_st),
    .io_requestor_1_s2_xcpt_ae_ld(dcacheArb_io_requestor_1_s2_xcpt_ae_ld),
    .io_requestor_1_s2_xcpt_ae_st(dcacheArb_io_requestor_1_s2_xcpt_ae_st),
    .io_requestor_1_ordered(dcacheArb_io_requestor_1_ordered),
    .io_requestor_1_perf_grant(dcacheArb_io_requestor_1_perf_grant),
    .io_requestor_1_keep_clock_enabled(dcacheArb_io_requestor_1_keep_clock_enabled),
    .io_requestor_1_clock_enabled(dcacheArb_io_requestor_1_clock_enabled),
    .io_mem_req_ready(dcacheArb_io_mem_req_ready),
    .io_mem_req_valid(dcacheArb_io_mem_req_valid),
    .io_mem_req_bits_addr(dcacheArb_io_mem_req_bits_addr),
    .io_mem_req_bits_tag(dcacheArb_io_mem_req_bits_tag),
    .io_mem_req_bits_cmd(dcacheArb_io_mem_req_bits_cmd),
    .io_mem_req_bits_typ(dcacheArb_io_mem_req_bits_typ),
    .io_mem_req_bits_phys(dcacheArb_io_mem_req_bits_phys),
    .io_mem_s1_kill(dcacheArb_io_mem_s1_kill),
    .io_mem_s1_data_data(dcacheArb_io_mem_s1_data_data),
    .io_mem_s1_data_mask(dcacheArb_io_mem_s1_data_mask),
    .io_mem_s2_nack(dcacheArb_io_mem_s2_nack),
    .io_mem_s2_kill(dcacheArb_io_mem_s2_kill),
    .io_mem_resp_valid(dcacheArb_io_mem_resp_valid),
    .io_mem_resp_bits_tag(dcacheArb_io_mem_resp_bits_tag),
    .io_mem_resp_bits_typ(dcacheArb_io_mem_resp_bits_typ),
    .io_mem_resp_bits_data(dcacheArb_io_mem_resp_bits_data),
    .io_mem_resp_bits_replay(dcacheArb_io_mem_resp_bits_replay),
    .io_mem_resp_bits_has_data(dcacheArb_io_mem_resp_bits_has_data),
    .io_mem_resp_bits_data_word_bypass(dcacheArb_io_mem_resp_bits_data_word_bypass),
    .io_mem_replay_next(dcacheArb_io_mem_replay_next),
    .io_mem_s2_xcpt_ma_ld(dcacheArb_io_mem_s2_xcpt_ma_ld),
    .io_mem_s2_xcpt_ma_st(dcacheArb_io_mem_s2_xcpt_ma_st),
    .io_mem_s2_xcpt_pf_ld(dcacheArb_io_mem_s2_xcpt_pf_ld),
    .io_mem_s2_xcpt_pf_st(dcacheArb_io_mem_s2_xcpt_pf_st),
    .io_mem_s2_xcpt_ae_ld(dcacheArb_io_mem_s2_xcpt_ae_ld),
    .io_mem_s2_xcpt_ae_st(dcacheArb_io_mem_s2_xcpt_ae_st),
    .io_mem_ordered(dcacheArb_io_mem_ordered),
    .io_mem_perf_grant(dcacheArb_io_mem_perf_grant),
    .io_mem_keep_clock_enabled(dcacheArb_io_mem_keep_clock_enabled),
    .io_mem_clock_enabled(dcacheArb_io_mem_clock_enabled)
  );
  PTW ptw ( 
    .clock(ptw_clock),
    .reset(ptw_reset),
    .io_requestor_0_req_ready(ptw_io_requestor_0_req_ready),
    .io_requestor_0_req_valid(ptw_io_requestor_0_req_valid),
    .io_requestor_0_req_bits_valid(ptw_io_requestor_0_req_bits_valid),
    .io_requestor_0_req_bits_bits_addr(ptw_io_requestor_0_req_bits_bits_addr),
    .io_requestor_0_resp_valid(ptw_io_requestor_0_resp_valid),
    .io_requestor_0_resp_bits_ae(ptw_io_requestor_0_resp_bits_ae),
    .io_requestor_0_resp_bits_pte_ppn(ptw_io_requestor_0_resp_bits_pte_ppn),
    .io_requestor_0_resp_bits_pte_d(ptw_io_requestor_0_resp_bits_pte_d),
    .io_requestor_0_resp_bits_pte_a(ptw_io_requestor_0_resp_bits_pte_a),
    .io_requestor_0_resp_bits_pte_g(ptw_io_requestor_0_resp_bits_pte_g),
    .io_requestor_0_resp_bits_pte_u(ptw_io_requestor_0_resp_bits_pte_u),
    .io_requestor_0_resp_bits_pte_x(ptw_io_requestor_0_resp_bits_pte_x),
    .io_requestor_0_resp_bits_pte_w(ptw_io_requestor_0_resp_bits_pte_w),
    .io_requestor_0_resp_bits_pte_r(ptw_io_requestor_0_resp_bits_pte_r),
    .io_requestor_0_resp_bits_pte_v(ptw_io_requestor_0_resp_bits_pte_v),
    .io_requestor_0_resp_bits_level(ptw_io_requestor_0_resp_bits_level),
    .io_requestor_0_resp_bits_homogeneous(ptw_io_requestor_0_resp_bits_homogeneous),
    .io_requestor_0_ptbr_mode(ptw_io_requestor_0_ptbr_mode),
    .io_requestor_0_status_dprv(ptw_io_requestor_0_status_dprv),
    .io_requestor_0_status_mxr(ptw_io_requestor_0_status_mxr),
    .io_requestor_0_status_sum(ptw_io_requestor_0_status_sum),
    .io_requestor_0_pmp_0_cfg_l(ptw_io_requestor_0_pmp_0_cfg_l),
    .io_requestor_0_pmp_0_cfg_a(ptw_io_requestor_0_pmp_0_cfg_a),
    .io_requestor_0_pmp_0_cfg_x(ptw_io_requestor_0_pmp_0_cfg_x),
    .io_requestor_0_pmp_0_cfg_w(ptw_io_requestor_0_pmp_0_cfg_w),
    .io_requestor_0_pmp_0_cfg_r(ptw_io_requestor_0_pmp_0_cfg_r),
    .io_requestor_0_pmp_0_addr(ptw_io_requestor_0_pmp_0_addr),
    .io_requestor_0_pmp_0_mask(ptw_io_requestor_0_pmp_0_mask),
    .io_requestor_0_pmp_1_cfg_l(ptw_io_requestor_0_pmp_1_cfg_l),
    .io_requestor_0_pmp_1_cfg_a(ptw_io_requestor_0_pmp_1_cfg_a),
    .io_requestor_0_pmp_1_cfg_x(ptw_io_requestor_0_pmp_1_cfg_x),
    .io_requestor_0_pmp_1_cfg_w(ptw_io_requestor_0_pmp_1_cfg_w),
    .io_requestor_0_pmp_1_cfg_r(ptw_io_requestor_0_pmp_1_cfg_r),
    .io_requestor_0_pmp_1_addr(ptw_io_requestor_0_pmp_1_addr),
    .io_requestor_0_pmp_1_mask(ptw_io_requestor_0_pmp_1_mask),
    .io_requestor_0_pmp_2_cfg_l(ptw_io_requestor_0_pmp_2_cfg_l),
    .io_requestor_0_pmp_2_cfg_a(ptw_io_requestor_0_pmp_2_cfg_a),
    .io_requestor_0_pmp_2_cfg_x(ptw_io_requestor_0_pmp_2_cfg_x),
    .io_requestor_0_pmp_2_cfg_w(ptw_io_requestor_0_pmp_2_cfg_w),
    .io_requestor_0_pmp_2_cfg_r(ptw_io_requestor_0_pmp_2_cfg_r),
    .io_requestor_0_pmp_2_addr(ptw_io_requestor_0_pmp_2_addr),
    .io_requestor_0_pmp_2_mask(ptw_io_requestor_0_pmp_2_mask),
    .io_requestor_0_pmp_3_cfg_l(ptw_io_requestor_0_pmp_3_cfg_l),
    .io_requestor_0_pmp_3_cfg_a(ptw_io_requestor_0_pmp_3_cfg_a),
    .io_requestor_0_pmp_3_cfg_x(ptw_io_requestor_0_pmp_3_cfg_x),
    .io_requestor_0_pmp_3_cfg_w(ptw_io_requestor_0_pmp_3_cfg_w),
    .io_requestor_0_pmp_3_cfg_r(ptw_io_requestor_0_pmp_3_cfg_r),
    .io_requestor_0_pmp_3_addr(ptw_io_requestor_0_pmp_3_addr),
    .io_requestor_0_pmp_3_mask(ptw_io_requestor_0_pmp_3_mask),
    .io_requestor_0_pmp_4_cfg_l(ptw_io_requestor_0_pmp_4_cfg_l),
    .io_requestor_0_pmp_4_cfg_a(ptw_io_requestor_0_pmp_4_cfg_a),
    .io_requestor_0_pmp_4_cfg_x(ptw_io_requestor_0_pmp_4_cfg_x),
    .io_requestor_0_pmp_4_cfg_w(ptw_io_requestor_0_pmp_4_cfg_w),
    .io_requestor_0_pmp_4_cfg_r(ptw_io_requestor_0_pmp_4_cfg_r),
    .io_requestor_0_pmp_4_addr(ptw_io_requestor_0_pmp_4_addr),
    .io_requestor_0_pmp_4_mask(ptw_io_requestor_0_pmp_4_mask),
    .io_requestor_0_pmp_5_cfg_l(ptw_io_requestor_0_pmp_5_cfg_l),
    .io_requestor_0_pmp_5_cfg_a(ptw_io_requestor_0_pmp_5_cfg_a),
    .io_requestor_0_pmp_5_cfg_x(ptw_io_requestor_0_pmp_5_cfg_x),
    .io_requestor_0_pmp_5_cfg_w(ptw_io_requestor_0_pmp_5_cfg_w),
    .io_requestor_0_pmp_5_cfg_r(ptw_io_requestor_0_pmp_5_cfg_r),
    .io_requestor_0_pmp_5_addr(ptw_io_requestor_0_pmp_5_addr),
    .io_requestor_0_pmp_5_mask(ptw_io_requestor_0_pmp_5_mask),
    .io_requestor_0_pmp_6_cfg_l(ptw_io_requestor_0_pmp_6_cfg_l),
    .io_requestor_0_pmp_6_cfg_a(ptw_io_requestor_0_pmp_6_cfg_a),
    .io_requestor_0_pmp_6_cfg_x(ptw_io_requestor_0_pmp_6_cfg_x),
    .io_requestor_0_pmp_6_cfg_w(ptw_io_requestor_0_pmp_6_cfg_w),
    .io_requestor_0_pmp_6_cfg_r(ptw_io_requestor_0_pmp_6_cfg_r),
    .io_requestor_0_pmp_6_addr(ptw_io_requestor_0_pmp_6_addr),
    .io_requestor_0_pmp_6_mask(ptw_io_requestor_0_pmp_6_mask),
    .io_requestor_0_pmp_7_cfg_l(ptw_io_requestor_0_pmp_7_cfg_l),
    .io_requestor_0_pmp_7_cfg_a(ptw_io_requestor_0_pmp_7_cfg_a),
    .io_requestor_0_pmp_7_cfg_x(ptw_io_requestor_0_pmp_7_cfg_x),
    .io_requestor_0_pmp_7_cfg_w(ptw_io_requestor_0_pmp_7_cfg_w),
    .io_requestor_0_pmp_7_cfg_r(ptw_io_requestor_0_pmp_7_cfg_r),
    .io_requestor_0_pmp_7_addr(ptw_io_requestor_0_pmp_7_addr),
    .io_requestor_0_pmp_7_mask(ptw_io_requestor_0_pmp_7_mask),
    .io_requestor_0_customCSRs_csrs_0_value(ptw_io_requestor_0_customCSRs_csrs_0_value),
    .io_requestor_1_req_ready(ptw_io_requestor_1_req_ready),
    .io_requestor_1_req_valid(ptw_io_requestor_1_req_valid),
    .io_requestor_1_req_bits_valid(ptw_io_requestor_1_req_bits_valid),
    .io_requestor_1_req_bits_bits_addr(ptw_io_requestor_1_req_bits_bits_addr),
    .io_requestor_1_resp_valid(ptw_io_requestor_1_resp_valid),
    .io_requestor_1_resp_bits_ae(ptw_io_requestor_1_resp_bits_ae),
    .io_requestor_1_resp_bits_pte_ppn(ptw_io_requestor_1_resp_bits_pte_ppn),
    .io_requestor_1_resp_bits_pte_d(ptw_io_requestor_1_resp_bits_pte_d),
    .io_requestor_1_resp_bits_pte_a(ptw_io_requestor_1_resp_bits_pte_a),
    .io_requestor_1_resp_bits_pte_g(ptw_io_requestor_1_resp_bits_pte_g),
    .io_requestor_1_resp_bits_pte_u(ptw_io_requestor_1_resp_bits_pte_u),
    .io_requestor_1_resp_bits_pte_x(ptw_io_requestor_1_resp_bits_pte_x),
    .io_requestor_1_resp_bits_pte_w(ptw_io_requestor_1_resp_bits_pte_w),
    .io_requestor_1_resp_bits_pte_r(ptw_io_requestor_1_resp_bits_pte_r),
    .io_requestor_1_resp_bits_pte_v(ptw_io_requestor_1_resp_bits_pte_v),
    .io_requestor_1_resp_bits_level(ptw_io_requestor_1_resp_bits_level),
    .io_requestor_1_resp_bits_homogeneous(ptw_io_requestor_1_resp_bits_homogeneous),
    .io_requestor_1_ptbr_mode(ptw_io_requestor_1_ptbr_mode),
    .io_requestor_1_status_prv(ptw_io_requestor_1_status_prv),
    .io_requestor_1_pmp_0_cfg_l(ptw_io_requestor_1_pmp_0_cfg_l),
    .io_requestor_1_pmp_0_cfg_a(ptw_io_requestor_1_pmp_0_cfg_a),
    .io_requestor_1_pmp_0_cfg_x(ptw_io_requestor_1_pmp_0_cfg_x),
    .io_requestor_1_pmp_0_cfg_w(ptw_io_requestor_1_pmp_0_cfg_w),
    .io_requestor_1_pmp_0_cfg_r(ptw_io_requestor_1_pmp_0_cfg_r),
    .io_requestor_1_pmp_0_addr(ptw_io_requestor_1_pmp_0_addr),
    .io_requestor_1_pmp_0_mask(ptw_io_requestor_1_pmp_0_mask),
    .io_requestor_1_pmp_1_cfg_l(ptw_io_requestor_1_pmp_1_cfg_l),
    .io_requestor_1_pmp_1_cfg_a(ptw_io_requestor_1_pmp_1_cfg_a),
    .io_requestor_1_pmp_1_cfg_x(ptw_io_requestor_1_pmp_1_cfg_x),
    .io_requestor_1_pmp_1_cfg_w(ptw_io_requestor_1_pmp_1_cfg_w),
    .io_requestor_1_pmp_1_cfg_r(ptw_io_requestor_1_pmp_1_cfg_r),
    .io_requestor_1_pmp_1_addr(ptw_io_requestor_1_pmp_1_addr),
    .io_requestor_1_pmp_1_mask(ptw_io_requestor_1_pmp_1_mask),
    .io_requestor_1_pmp_2_cfg_l(ptw_io_requestor_1_pmp_2_cfg_l),
    .io_requestor_1_pmp_2_cfg_a(ptw_io_requestor_1_pmp_2_cfg_a),
    .io_requestor_1_pmp_2_cfg_x(ptw_io_requestor_1_pmp_2_cfg_x),
    .io_requestor_1_pmp_2_cfg_w(ptw_io_requestor_1_pmp_2_cfg_w),
    .io_requestor_1_pmp_2_cfg_r(ptw_io_requestor_1_pmp_2_cfg_r),
    .io_requestor_1_pmp_2_addr(ptw_io_requestor_1_pmp_2_addr),
    .io_requestor_1_pmp_2_mask(ptw_io_requestor_1_pmp_2_mask),
    .io_requestor_1_pmp_3_cfg_l(ptw_io_requestor_1_pmp_3_cfg_l),
    .io_requestor_1_pmp_3_cfg_a(ptw_io_requestor_1_pmp_3_cfg_a),
    .io_requestor_1_pmp_3_cfg_x(ptw_io_requestor_1_pmp_3_cfg_x),
    .io_requestor_1_pmp_3_cfg_w(ptw_io_requestor_1_pmp_3_cfg_w),
    .io_requestor_1_pmp_3_cfg_r(ptw_io_requestor_1_pmp_3_cfg_r),
    .io_requestor_1_pmp_3_addr(ptw_io_requestor_1_pmp_3_addr),
    .io_requestor_1_pmp_3_mask(ptw_io_requestor_1_pmp_3_mask),
    .io_requestor_1_pmp_4_cfg_l(ptw_io_requestor_1_pmp_4_cfg_l),
    .io_requestor_1_pmp_4_cfg_a(ptw_io_requestor_1_pmp_4_cfg_a),
    .io_requestor_1_pmp_4_cfg_x(ptw_io_requestor_1_pmp_4_cfg_x),
    .io_requestor_1_pmp_4_cfg_w(ptw_io_requestor_1_pmp_4_cfg_w),
    .io_requestor_1_pmp_4_cfg_r(ptw_io_requestor_1_pmp_4_cfg_r),
    .io_requestor_1_pmp_4_addr(ptw_io_requestor_1_pmp_4_addr),
    .io_requestor_1_pmp_4_mask(ptw_io_requestor_1_pmp_4_mask),
    .io_requestor_1_pmp_5_cfg_l(ptw_io_requestor_1_pmp_5_cfg_l),
    .io_requestor_1_pmp_5_cfg_a(ptw_io_requestor_1_pmp_5_cfg_a),
    .io_requestor_1_pmp_5_cfg_x(ptw_io_requestor_1_pmp_5_cfg_x),
    .io_requestor_1_pmp_5_cfg_w(ptw_io_requestor_1_pmp_5_cfg_w),
    .io_requestor_1_pmp_5_cfg_r(ptw_io_requestor_1_pmp_5_cfg_r),
    .io_requestor_1_pmp_5_addr(ptw_io_requestor_1_pmp_5_addr),
    .io_requestor_1_pmp_5_mask(ptw_io_requestor_1_pmp_5_mask),
    .io_requestor_1_pmp_6_cfg_l(ptw_io_requestor_1_pmp_6_cfg_l),
    .io_requestor_1_pmp_6_cfg_a(ptw_io_requestor_1_pmp_6_cfg_a),
    .io_requestor_1_pmp_6_cfg_x(ptw_io_requestor_1_pmp_6_cfg_x),
    .io_requestor_1_pmp_6_cfg_w(ptw_io_requestor_1_pmp_6_cfg_w),
    .io_requestor_1_pmp_6_cfg_r(ptw_io_requestor_1_pmp_6_cfg_r),
    .io_requestor_1_pmp_6_addr(ptw_io_requestor_1_pmp_6_addr),
    .io_requestor_1_pmp_6_mask(ptw_io_requestor_1_pmp_6_mask),
    .io_requestor_1_pmp_7_cfg_l(ptw_io_requestor_1_pmp_7_cfg_l),
    .io_requestor_1_pmp_7_cfg_a(ptw_io_requestor_1_pmp_7_cfg_a),
    .io_requestor_1_pmp_7_cfg_x(ptw_io_requestor_1_pmp_7_cfg_x),
    .io_requestor_1_pmp_7_cfg_w(ptw_io_requestor_1_pmp_7_cfg_w),
    .io_requestor_1_pmp_7_cfg_r(ptw_io_requestor_1_pmp_7_cfg_r),
    .io_requestor_1_pmp_7_addr(ptw_io_requestor_1_pmp_7_addr),
    .io_requestor_1_pmp_7_mask(ptw_io_requestor_1_pmp_7_mask),
    .io_mem_req_ready(ptw_io_mem_req_ready),
    .io_mem_req_valid(ptw_io_mem_req_valid),
    .io_mem_req_bits_addr(ptw_io_mem_req_bits_addr),
    .io_mem_s1_kill(ptw_io_mem_s1_kill),
    .io_mem_s2_nack(ptw_io_mem_s2_nack),
    .io_mem_resp_valid(ptw_io_mem_resp_valid),
    .io_mem_resp_bits_data_word_bypass(ptw_io_mem_resp_bits_data_word_bypass),
    .io_mem_s2_xcpt_ae_ld(ptw_io_mem_s2_xcpt_ae_ld),
    .io_dpath_ptbr_mode(ptw_io_dpath_ptbr_mode),
    .io_dpath_ptbr_ppn(ptw_io_dpath_ptbr_ppn),
    .io_dpath_sfence_valid(ptw_io_dpath_sfence_valid),
    .io_dpath_sfence_bits_rs1(ptw_io_dpath_sfence_bits_rs1),
    .io_dpath_status_dprv(ptw_io_dpath_status_dprv),
    .io_dpath_status_prv(ptw_io_dpath_status_prv),
    .io_dpath_status_mxr(ptw_io_dpath_status_mxr),
    .io_dpath_status_sum(ptw_io_dpath_status_sum),
    .io_dpath_pmp_0_cfg_l(ptw_io_dpath_pmp_0_cfg_l),
    .io_dpath_pmp_0_cfg_a(ptw_io_dpath_pmp_0_cfg_a),
    .io_dpath_pmp_0_cfg_x(ptw_io_dpath_pmp_0_cfg_x),
    .io_dpath_pmp_0_cfg_w(ptw_io_dpath_pmp_0_cfg_w),
    .io_dpath_pmp_0_cfg_r(ptw_io_dpath_pmp_0_cfg_r),
    .io_dpath_pmp_0_addr(ptw_io_dpath_pmp_0_addr),
    .io_dpath_pmp_0_mask(ptw_io_dpath_pmp_0_mask),
    .io_dpath_pmp_1_cfg_l(ptw_io_dpath_pmp_1_cfg_l),
    .io_dpath_pmp_1_cfg_a(ptw_io_dpath_pmp_1_cfg_a),
    .io_dpath_pmp_1_cfg_x(ptw_io_dpath_pmp_1_cfg_x),
    .io_dpath_pmp_1_cfg_w(ptw_io_dpath_pmp_1_cfg_w),
    .io_dpath_pmp_1_cfg_r(ptw_io_dpath_pmp_1_cfg_r),
    .io_dpath_pmp_1_addr(ptw_io_dpath_pmp_1_addr),
    .io_dpath_pmp_1_mask(ptw_io_dpath_pmp_1_mask),
    .io_dpath_pmp_2_cfg_l(ptw_io_dpath_pmp_2_cfg_l),
    .io_dpath_pmp_2_cfg_a(ptw_io_dpath_pmp_2_cfg_a),
    .io_dpath_pmp_2_cfg_x(ptw_io_dpath_pmp_2_cfg_x),
    .io_dpath_pmp_2_cfg_w(ptw_io_dpath_pmp_2_cfg_w),
    .io_dpath_pmp_2_cfg_r(ptw_io_dpath_pmp_2_cfg_r),
    .io_dpath_pmp_2_addr(ptw_io_dpath_pmp_2_addr),
    .io_dpath_pmp_2_mask(ptw_io_dpath_pmp_2_mask),
    .io_dpath_pmp_3_cfg_l(ptw_io_dpath_pmp_3_cfg_l),
    .io_dpath_pmp_3_cfg_a(ptw_io_dpath_pmp_3_cfg_a),
    .io_dpath_pmp_3_cfg_x(ptw_io_dpath_pmp_3_cfg_x),
    .io_dpath_pmp_3_cfg_w(ptw_io_dpath_pmp_3_cfg_w),
    .io_dpath_pmp_3_cfg_r(ptw_io_dpath_pmp_3_cfg_r),
    .io_dpath_pmp_3_addr(ptw_io_dpath_pmp_3_addr),
    .io_dpath_pmp_3_mask(ptw_io_dpath_pmp_3_mask),
    .io_dpath_pmp_4_cfg_l(ptw_io_dpath_pmp_4_cfg_l),
    .io_dpath_pmp_4_cfg_a(ptw_io_dpath_pmp_4_cfg_a),
    .io_dpath_pmp_4_cfg_x(ptw_io_dpath_pmp_4_cfg_x),
    .io_dpath_pmp_4_cfg_w(ptw_io_dpath_pmp_4_cfg_w),
    .io_dpath_pmp_4_cfg_r(ptw_io_dpath_pmp_4_cfg_r),
    .io_dpath_pmp_4_addr(ptw_io_dpath_pmp_4_addr),
    .io_dpath_pmp_4_mask(ptw_io_dpath_pmp_4_mask),
    .io_dpath_pmp_5_cfg_l(ptw_io_dpath_pmp_5_cfg_l),
    .io_dpath_pmp_5_cfg_a(ptw_io_dpath_pmp_5_cfg_a),
    .io_dpath_pmp_5_cfg_x(ptw_io_dpath_pmp_5_cfg_x),
    .io_dpath_pmp_5_cfg_w(ptw_io_dpath_pmp_5_cfg_w),
    .io_dpath_pmp_5_cfg_r(ptw_io_dpath_pmp_5_cfg_r),
    .io_dpath_pmp_5_addr(ptw_io_dpath_pmp_5_addr),
    .io_dpath_pmp_5_mask(ptw_io_dpath_pmp_5_mask),
    .io_dpath_pmp_6_cfg_l(ptw_io_dpath_pmp_6_cfg_l),
    .io_dpath_pmp_6_cfg_a(ptw_io_dpath_pmp_6_cfg_a),
    .io_dpath_pmp_6_cfg_x(ptw_io_dpath_pmp_6_cfg_x),
    .io_dpath_pmp_6_cfg_w(ptw_io_dpath_pmp_6_cfg_w),
    .io_dpath_pmp_6_cfg_r(ptw_io_dpath_pmp_6_cfg_r),
    .io_dpath_pmp_6_addr(ptw_io_dpath_pmp_6_addr),
    .io_dpath_pmp_6_mask(ptw_io_dpath_pmp_6_mask),
    .io_dpath_pmp_7_cfg_l(ptw_io_dpath_pmp_7_cfg_l),
    .io_dpath_pmp_7_cfg_a(ptw_io_dpath_pmp_7_cfg_a),
    .io_dpath_pmp_7_cfg_x(ptw_io_dpath_pmp_7_cfg_x),
    .io_dpath_pmp_7_cfg_w(ptw_io_dpath_pmp_7_cfg_w),
    .io_dpath_pmp_7_cfg_r(ptw_io_dpath_pmp_7_cfg_r),
    .io_dpath_pmp_7_addr(ptw_io_dpath_pmp_7_addr),
    .io_dpath_pmp_7_mask(ptw_io_dpath_pmp_7_mask),
    .io_dpath_customCSRs_csrs_0_value(ptw_io_dpath_customCSRs_csrs_0_value)
  );
  Rocket core ( 
    .clock(core_clock),
    .reset(core_reset),
    .io_hartid(core_io_hartid),
    .io_interrupts_debug(core_io_interrupts_debug),
    .io_interrupts_mtip(core_io_interrupts_mtip),
    .io_interrupts_msip(core_io_interrupts_msip),
    .io_interrupts_meip(core_io_interrupts_meip),
    .io_interrupts_seip(core_io_interrupts_seip),
    .io_imem_might_request(core_io_imem_might_request),
    .io_imem_req_valid(core_io_imem_req_valid),
    .io_imem_req_bits_pc(core_io_imem_req_bits_pc),
    .io_imem_req_bits_speculative(core_io_imem_req_bits_speculative),
    .io_imem_sfence_valid(core_io_imem_sfence_valid),
    .io_imem_sfence_bits_rs1(core_io_imem_sfence_bits_rs1),
    .io_imem_sfence_bits_rs2(core_io_imem_sfence_bits_rs2),
    .io_imem_sfence_bits_addr(core_io_imem_sfence_bits_addr),
    .io_imem_resp_ready(core_io_imem_resp_ready),
    .io_imem_resp_valid(core_io_imem_resp_valid),
    .io_imem_resp_bits_btb_taken(core_io_imem_resp_bits_btb_taken),
    .io_imem_resp_bits_btb_bridx(core_io_imem_resp_bits_btb_bridx),
    .io_imem_resp_bits_btb_entry(core_io_imem_resp_bits_btb_entry),
    .io_imem_resp_bits_btb_bht_history(core_io_imem_resp_bits_btb_bht_history),
    .io_imem_resp_bits_pc(core_io_imem_resp_bits_pc),
    .io_imem_resp_bits_data(core_io_imem_resp_bits_data),
    .io_imem_resp_bits_xcpt_pf_inst(core_io_imem_resp_bits_xcpt_pf_inst),
    .io_imem_resp_bits_xcpt_ae_inst(core_io_imem_resp_bits_xcpt_ae_inst),
    .io_imem_resp_bits_replay(core_io_imem_resp_bits_replay),
    .io_imem_btb_update_valid(core_io_imem_btb_update_valid),
    .io_imem_btb_update_bits_prediction_entry(core_io_imem_btb_update_bits_prediction_entry),
    .io_imem_btb_update_bits_pc(core_io_imem_btb_update_bits_pc),
    .io_imem_btb_update_bits_isValid(core_io_imem_btb_update_bits_isValid),
    .io_imem_btb_update_bits_br_pc(core_io_imem_btb_update_bits_br_pc),
    .io_imem_btb_update_bits_cfiType(core_io_imem_btb_update_bits_cfiType),
    .io_imem_bht_update_valid(core_io_imem_bht_update_valid),
    .io_imem_bht_update_bits_prediction_history(core_io_imem_bht_update_bits_prediction_history),
    .io_imem_bht_update_bits_pc(core_io_imem_bht_update_bits_pc),
    .io_imem_bht_update_bits_branch(core_io_imem_bht_update_bits_branch),
    .io_imem_bht_update_bits_taken(core_io_imem_bht_update_bits_taken),
    .io_imem_bht_update_bits_mispredict(core_io_imem_bht_update_bits_mispredict),
    .io_imem_flush_icache(core_io_imem_flush_icache),
    .io_dmem_req_ready(core_io_dmem_req_ready),
    .io_dmem_req_valid(core_io_dmem_req_valid),
    .io_dmem_req_bits_addr(core_io_dmem_req_bits_addr),
    .io_dmem_req_bits_tag(core_io_dmem_req_bits_tag),
    .io_dmem_req_bits_cmd(core_io_dmem_req_bits_cmd),
    .io_dmem_req_bits_typ(core_io_dmem_req_bits_typ),
    .io_dmem_s1_kill(core_io_dmem_s1_kill),
    .io_dmem_s1_data_data(core_io_dmem_s1_data_data),
    .io_dmem_s2_nack(core_io_dmem_s2_nack),
    .io_dmem_resp_valid(core_io_dmem_resp_valid),
    .io_dmem_resp_bits_tag(core_io_dmem_resp_bits_tag),
    .io_dmem_resp_bits_typ(core_io_dmem_resp_bits_typ),
    .io_dmem_resp_bits_data(core_io_dmem_resp_bits_data),
    .io_dmem_resp_bits_replay(core_io_dmem_resp_bits_replay),
    .io_dmem_resp_bits_has_data(core_io_dmem_resp_bits_has_data),
    .io_dmem_resp_bits_data_word_bypass(core_io_dmem_resp_bits_data_word_bypass),
    .io_dmem_replay_next(core_io_dmem_replay_next),
    .io_dmem_s2_xcpt_ma_ld(core_io_dmem_s2_xcpt_ma_ld),
    .io_dmem_s2_xcpt_ma_st(core_io_dmem_s2_xcpt_ma_st),
    .io_dmem_s2_xcpt_pf_ld(core_io_dmem_s2_xcpt_pf_ld),
    .io_dmem_s2_xcpt_pf_st(core_io_dmem_s2_xcpt_pf_st),
    .io_dmem_s2_xcpt_ae_ld(core_io_dmem_s2_xcpt_ae_ld),
    .io_dmem_s2_xcpt_ae_st(core_io_dmem_s2_xcpt_ae_st),
    .io_dmem_ordered(core_io_dmem_ordered),
    .io_dmem_perf_grant(core_io_dmem_perf_grant),
    .io_dmem_keep_clock_enabled(core_io_dmem_keep_clock_enabled),
    .io_dmem_clock_enabled(core_io_dmem_clock_enabled),
    .io_ptw_ptbr_mode(core_io_ptw_ptbr_mode),
    .io_ptw_ptbr_ppn(core_io_ptw_ptbr_ppn),
    .io_ptw_sfence_valid(core_io_ptw_sfence_valid),
    .io_ptw_sfence_bits_rs1(core_io_ptw_sfence_bits_rs1),
    .io_ptw_status_dprv(core_io_ptw_status_dprv),
    .io_ptw_status_prv(core_io_ptw_status_prv),
    .io_ptw_status_mxr(core_io_ptw_status_mxr),
    .io_ptw_status_sum(core_io_ptw_status_sum),
    .io_ptw_pmp_0_cfg_l(core_io_ptw_pmp_0_cfg_l),
    .io_ptw_pmp_0_cfg_a(core_io_ptw_pmp_0_cfg_a),
    .io_ptw_pmp_0_cfg_x(core_io_ptw_pmp_0_cfg_x),
    .io_ptw_pmp_0_cfg_w(core_io_ptw_pmp_0_cfg_w),
    .io_ptw_pmp_0_cfg_r(core_io_ptw_pmp_0_cfg_r),
    .io_ptw_pmp_0_addr(core_io_ptw_pmp_0_addr),
    .io_ptw_pmp_0_mask(core_io_ptw_pmp_0_mask),
    .io_ptw_pmp_1_cfg_l(core_io_ptw_pmp_1_cfg_l),
    .io_ptw_pmp_1_cfg_a(core_io_ptw_pmp_1_cfg_a),
    .io_ptw_pmp_1_cfg_x(core_io_ptw_pmp_1_cfg_x),
    .io_ptw_pmp_1_cfg_w(core_io_ptw_pmp_1_cfg_w),
    .io_ptw_pmp_1_cfg_r(core_io_ptw_pmp_1_cfg_r),
    .io_ptw_pmp_1_addr(core_io_ptw_pmp_1_addr),
    .io_ptw_pmp_1_mask(core_io_ptw_pmp_1_mask),
    .io_ptw_pmp_2_cfg_l(core_io_ptw_pmp_2_cfg_l),
    .io_ptw_pmp_2_cfg_a(core_io_ptw_pmp_2_cfg_a),
    .io_ptw_pmp_2_cfg_x(core_io_ptw_pmp_2_cfg_x),
    .io_ptw_pmp_2_cfg_w(core_io_ptw_pmp_2_cfg_w),
    .io_ptw_pmp_2_cfg_r(core_io_ptw_pmp_2_cfg_r),
    .io_ptw_pmp_2_addr(core_io_ptw_pmp_2_addr),
    .io_ptw_pmp_2_mask(core_io_ptw_pmp_2_mask),
    .io_ptw_pmp_3_cfg_l(core_io_ptw_pmp_3_cfg_l),
    .io_ptw_pmp_3_cfg_a(core_io_ptw_pmp_3_cfg_a),
    .io_ptw_pmp_3_cfg_x(core_io_ptw_pmp_3_cfg_x),
    .io_ptw_pmp_3_cfg_w(core_io_ptw_pmp_3_cfg_w),
    .io_ptw_pmp_3_cfg_r(core_io_ptw_pmp_3_cfg_r),
    .io_ptw_pmp_3_addr(core_io_ptw_pmp_3_addr),
    .io_ptw_pmp_3_mask(core_io_ptw_pmp_3_mask),
    .io_ptw_pmp_4_cfg_l(core_io_ptw_pmp_4_cfg_l),
    .io_ptw_pmp_4_cfg_a(core_io_ptw_pmp_4_cfg_a),
    .io_ptw_pmp_4_cfg_x(core_io_ptw_pmp_4_cfg_x),
    .io_ptw_pmp_4_cfg_w(core_io_ptw_pmp_4_cfg_w),
    .io_ptw_pmp_4_cfg_r(core_io_ptw_pmp_4_cfg_r),
    .io_ptw_pmp_4_addr(core_io_ptw_pmp_4_addr),
    .io_ptw_pmp_4_mask(core_io_ptw_pmp_4_mask),
    .io_ptw_pmp_5_cfg_l(core_io_ptw_pmp_5_cfg_l),
    .io_ptw_pmp_5_cfg_a(core_io_ptw_pmp_5_cfg_a),
    .io_ptw_pmp_5_cfg_x(core_io_ptw_pmp_5_cfg_x),
    .io_ptw_pmp_5_cfg_w(core_io_ptw_pmp_5_cfg_w),
    .io_ptw_pmp_5_cfg_r(core_io_ptw_pmp_5_cfg_r),
    .io_ptw_pmp_5_addr(core_io_ptw_pmp_5_addr),
    .io_ptw_pmp_5_mask(core_io_ptw_pmp_5_mask),
    .io_ptw_pmp_6_cfg_l(core_io_ptw_pmp_6_cfg_l),
    .io_ptw_pmp_6_cfg_a(core_io_ptw_pmp_6_cfg_a),
    .io_ptw_pmp_6_cfg_x(core_io_ptw_pmp_6_cfg_x),
    .io_ptw_pmp_6_cfg_w(core_io_ptw_pmp_6_cfg_w),
    .io_ptw_pmp_6_cfg_r(core_io_ptw_pmp_6_cfg_r),
    .io_ptw_pmp_6_addr(core_io_ptw_pmp_6_addr),
    .io_ptw_pmp_6_mask(core_io_ptw_pmp_6_mask),
    .io_ptw_pmp_7_cfg_l(core_io_ptw_pmp_7_cfg_l),
    .io_ptw_pmp_7_cfg_a(core_io_ptw_pmp_7_cfg_a),
    .io_ptw_pmp_7_cfg_x(core_io_ptw_pmp_7_cfg_x),
    .io_ptw_pmp_7_cfg_w(core_io_ptw_pmp_7_cfg_w),
    .io_ptw_pmp_7_cfg_r(core_io_ptw_pmp_7_cfg_r),
    .io_ptw_pmp_7_addr(core_io_ptw_pmp_7_addr),
    .io_ptw_pmp_7_mask(core_io_ptw_pmp_7_mask),
    .io_ptw_customCSRs_csrs_0_value(core_io_ptw_customCSRs_csrs_0_value),
    .io_fpu_inst(core_io_fpu_inst),
    .io_fpu_fromint_data(core_io_fpu_fromint_data),
    .io_fpu_fcsr_rm(core_io_fpu_fcsr_rm),
    .io_fpu_fcsr_flags_valid(core_io_fpu_fcsr_flags_valid),
    .io_fpu_fcsr_flags_bits(core_io_fpu_fcsr_flags_bits),
    .io_fpu_store_data(core_io_fpu_store_data),
    .io_fpu_toint_data(core_io_fpu_toint_data),
    .io_fpu_dmem_resp_val(core_io_fpu_dmem_resp_val),
    .io_fpu_dmem_resp_type(core_io_fpu_dmem_resp_type),
    .io_fpu_dmem_resp_tag(core_io_fpu_dmem_resp_tag),
    .io_fpu_dmem_resp_data(core_io_fpu_dmem_resp_data),
    .io_fpu_valid(core_io_fpu_valid),
    .io_fpu_fcsr_rdy(core_io_fpu_fcsr_rdy),
    .io_fpu_nack_mem(core_io_fpu_nack_mem),
    .io_fpu_illegal_rm(core_io_fpu_illegal_rm),
    .io_fpu_killx(core_io_fpu_killx),
    .io_fpu_killm(core_io_fpu_killm),
    .io_fpu_dec_wen(core_io_fpu_dec_wen),
    .io_fpu_dec_ren1(core_io_fpu_dec_ren1),
    .io_fpu_dec_ren2(core_io_fpu_dec_ren2),
    .io_fpu_dec_ren3(core_io_fpu_dec_ren3),
    .io_fpu_sboard_set(core_io_fpu_sboard_set),
    .io_fpu_sboard_clr(core_io_fpu_sboard_clr),
    .io_fpu_sboard_clra(core_io_fpu_sboard_clra),
    .io_rocc_cmd_ready(core_io_rocc_cmd_ready),
    .io_rocc_interrupt(core_io_rocc_interrupt)
  );
  assign auto_tl_master_xing_out_a_valid = buffer_auto_out_a_valid; 
  assign auto_tl_master_xing_out_a_bits_opcode = buffer_auto_out_a_bits_opcode; 
  assign auto_tl_master_xing_out_a_bits_param = buffer_auto_out_a_bits_param; 
  assign auto_tl_master_xing_out_a_bits_size = buffer_auto_out_a_bits_size; 
  assign auto_tl_master_xing_out_a_bits_source = buffer_auto_out_a_bits_source; 
  assign auto_tl_master_xing_out_a_bits_address = buffer_auto_out_a_bits_address; 
  assign auto_tl_master_xing_out_a_bits_mask = buffer_auto_out_a_bits_mask; 
  assign auto_tl_master_xing_out_a_bits_data = buffer_auto_out_a_bits_data; 
  assign auto_tl_master_xing_out_a_bits_corrupt = buffer_auto_out_a_bits_corrupt; 
  assign auto_tl_master_xing_out_b_ready = buffer_auto_out_b_ready; 
  assign auto_tl_master_xing_out_c_valid = buffer_auto_out_c_valid; 
  assign auto_tl_master_xing_out_c_bits_opcode = buffer_auto_out_c_bits_opcode; 
  assign auto_tl_master_xing_out_c_bits_param = buffer_auto_out_c_bits_param; 
  assign auto_tl_master_xing_out_c_bits_size = buffer_auto_out_c_bits_size; 
  assign auto_tl_master_xing_out_c_bits_source = buffer_auto_out_c_bits_source; 
  assign auto_tl_master_xing_out_c_bits_address = buffer_auto_out_c_bits_address; 
  assign auto_tl_master_xing_out_c_bits_data = buffer_auto_out_c_bits_data; 
  assign auto_tl_master_xing_out_c_bits_corrupt = buffer_auto_out_c_bits_corrupt; 
  assign auto_tl_master_xing_out_d_ready = buffer_auto_out_d_ready; 
  assign auto_tl_master_xing_out_e_valid = buffer_auto_out_e_valid; 
  assign auto_tl_master_xing_out_e_bits_sink = buffer_auto_out_e_bits_sink; 
  assign tlMasterXbar_clock = clock; 
  assign tlMasterXbar_reset = reset; 
  assign tlMasterXbar_auto_in_1_a_valid = frontend_auto_icache_master_out_a_valid; 
  assign tlMasterXbar_auto_in_1_a_bits_opcode = 3'h4; 
  assign tlMasterXbar_auto_in_1_a_bits_param = 3'h0; 
  assign tlMasterXbar_auto_in_1_a_bits_size = 3'h6; 
  assign tlMasterXbar_auto_in_1_a_bits_source = 1'h0; 
  assign tlMasterXbar_auto_in_1_a_bits_address = frontend_auto_icache_master_out_a_bits_address; 
  assign tlMasterXbar_auto_in_1_a_bits_mask = 8'hff; 
  assign tlMasterXbar_auto_in_1_a_bits_data = 64'h0; 
  assign tlMasterXbar_auto_in_1_a_bits_corrupt = 1'h0; 
  assign tlMasterXbar_auto_in_1_c_valid = 1'h0; 
  assign tlMasterXbar_auto_in_1_d_ready = 1'h1; 
  assign tlMasterXbar_auto_in_1_e_valid = 1'h0; 
  assign tlMasterXbar_auto_in_0_a_valid = dcache_auto_out_a_valid; 
  assign tlMasterXbar_auto_in_0_a_bits_opcode = dcache_auto_out_a_bits_opcode; 
  assign tlMasterXbar_auto_in_0_a_bits_param = dcache_auto_out_a_bits_param; 
  assign tlMasterXbar_auto_in_0_a_bits_size = dcache_auto_out_a_bits_size; 
  assign tlMasterXbar_auto_in_0_a_bits_source = dcache_auto_out_a_bits_source; 
  assign tlMasterXbar_auto_in_0_a_bits_address = dcache_auto_out_a_bits_address; 
  assign tlMasterXbar_auto_in_0_a_bits_mask = dcache_auto_out_a_bits_mask; 
  assign tlMasterXbar_auto_in_0_a_bits_data = dcache_auto_out_a_bits_data; 
  assign tlMasterXbar_auto_in_0_a_bits_corrupt = 1'h0; 
  assign tlMasterXbar_auto_in_0_b_ready = dcache_auto_out_b_ready; 
  assign tlMasterXbar_auto_in_0_c_valid = dcache_auto_out_c_valid; 
  assign tlMasterXbar_auto_in_0_c_bits_opcode = dcache_auto_out_c_bits_opcode; 
  assign tlMasterXbar_auto_in_0_c_bits_param = dcache_auto_out_c_bits_param; 
  assign tlMasterXbar_auto_in_0_c_bits_size = dcache_auto_out_c_bits_size; 
  assign tlMasterXbar_auto_in_0_c_bits_source = dcache_auto_out_c_bits_source; 
  assign tlMasterXbar_auto_in_0_c_bits_address = dcache_auto_out_c_bits_address; 
  assign tlMasterXbar_auto_in_0_c_bits_data = dcache_auto_out_c_bits_data; 
  assign tlMasterXbar_auto_in_0_c_bits_corrupt = 1'h0; 
  assign tlMasterXbar_auto_in_0_d_ready = dcache_auto_out_d_ready; 
  assign tlMasterXbar_auto_in_0_e_valid = dcache_auto_out_e_valid; 
  assign tlMasterXbar_auto_in_0_e_bits_sink = dcache_auto_out_e_bits_sink; 
  assign tlMasterXbar_auto_out_a_ready = buffer_auto_in_a_ready; 
  assign tlMasterXbar_auto_out_b_valid = buffer_auto_in_b_valid; 
  assign tlMasterXbar_auto_out_b_bits_opcode = buffer_auto_in_b_bits_opcode; 
  assign tlMasterXbar_auto_out_b_bits_param = buffer_auto_in_b_bits_param; 
  assign tlMasterXbar_auto_out_b_bits_size = buffer_auto_in_b_bits_size; 
  assign tlMasterXbar_auto_out_b_bits_source = buffer_auto_in_b_bits_source; 
  assign tlMasterXbar_auto_out_b_bits_address = buffer_auto_in_b_bits_address; 
  assign tlMasterXbar_auto_out_b_bits_mask = buffer_auto_in_b_bits_mask; 
  assign tlMasterXbar_auto_out_b_bits_corrupt = buffer_auto_in_b_bits_corrupt; 
  assign tlMasterXbar_auto_out_c_ready = buffer_auto_in_c_ready; 
  assign tlMasterXbar_auto_out_d_valid = buffer_auto_in_d_valid; 
  assign tlMasterXbar_auto_out_d_bits_opcode = buffer_auto_in_d_bits_opcode; 
  assign tlMasterXbar_auto_out_d_bits_param = buffer_auto_in_d_bits_param; 
  assign tlMasterXbar_auto_out_d_bits_size = buffer_auto_in_d_bits_size; 
  assign tlMasterXbar_auto_out_d_bits_source = buffer_auto_in_d_bits_source; 
  assign tlMasterXbar_auto_out_d_bits_sink = buffer_auto_in_d_bits_sink; 
  assign tlMasterXbar_auto_out_d_bits_denied = buffer_auto_in_d_bits_denied; 
  assign tlMasterXbar_auto_out_d_bits_data = buffer_auto_in_d_bits_data; 
  assign tlMasterXbar_auto_out_d_bits_corrupt = buffer_auto_in_d_bits_corrupt; 
  assign tlMasterXbar_auto_out_e_ready = buffer_auto_in_e_ready; 
  assign intXbar_auto_int_in_3_0 = intsink_3_auto_out_0; 
  assign intXbar_auto_int_in_2_0 = intsink_2_auto_out_0; 
  assign intXbar_auto_int_in_1_0 = intsink_1_auto_out_0; 
  assign intXbar_auto_int_in_1_1 = intsink_1_auto_out_1; 
  assign intXbar_auto_int_in_0_0 = intsink_auto_out_0; 
  assign dcache_gated_clock = clock; 
  assign dcache_reset = reset; 
  assign dcache_auto_out_a_ready = tlMasterXbar_auto_in_0_a_ready; 
  assign dcache_auto_out_b_valid = tlMasterXbar_auto_in_0_b_valid; 
  assign dcache_auto_out_b_bits_param = tlMasterXbar_auto_in_0_b_bits_param; 
  assign dcache_auto_out_b_bits_size = tlMasterXbar_auto_in_0_b_bits_size; 
  assign dcache_auto_out_b_bits_source = tlMasterXbar_auto_in_0_b_bits_source; 
  assign dcache_auto_out_b_bits_address = tlMasterXbar_auto_in_0_b_bits_address; 
  assign dcache_auto_out_c_ready = tlMasterXbar_auto_in_0_c_ready; 
  assign dcache_auto_out_d_valid = tlMasterXbar_auto_in_0_d_valid; 
  assign dcache_auto_out_d_bits_opcode = tlMasterXbar_auto_in_0_d_bits_opcode; 
  assign dcache_auto_out_d_bits_param = tlMasterXbar_auto_in_0_d_bits_param; 
  assign dcache_auto_out_d_bits_size = tlMasterXbar_auto_in_0_d_bits_size; 
  assign dcache_auto_out_d_bits_source = tlMasterXbar_auto_in_0_d_bits_source; 
  assign dcache_auto_out_d_bits_sink = tlMasterXbar_auto_in_0_d_bits_sink; 
  assign dcache_auto_out_d_bits_denied = tlMasterXbar_auto_in_0_d_bits_denied; 
  assign dcache_auto_out_d_bits_data = tlMasterXbar_auto_in_0_d_bits_data; 
  assign dcache_auto_out_e_ready = tlMasterXbar_auto_in_0_e_ready; 
  assign dcache_io_cpu_req_valid = dcacheArb_io_mem_req_valid; 
  assign dcache_io_cpu_req_bits_addr = dcacheArb_io_mem_req_bits_addr; 
  assign dcache_io_cpu_req_bits_tag = dcacheArb_io_mem_req_bits_tag; 
  assign dcache_io_cpu_req_bits_cmd = dcacheArb_io_mem_req_bits_cmd; 
  assign dcache_io_cpu_req_bits_typ = dcacheArb_io_mem_req_bits_typ; 
  assign dcache_io_cpu_req_bits_phys = dcacheArb_io_mem_req_bits_phys; 
  assign dcache_io_cpu_s1_kill = dcacheArb_io_mem_s1_kill; 
  assign dcache_io_cpu_s1_data_data = dcacheArb_io_mem_s1_data_data; 
  assign dcache_io_cpu_s1_data_mask = dcacheArb_io_mem_s1_data_mask; 
  assign dcache_io_cpu_s2_kill = dcacheArb_io_mem_s2_kill; 
  assign dcache_io_cpu_keep_clock_enabled = dcacheArb_io_mem_keep_clock_enabled; 
  assign dcache_io_ptw_req_ready = ptw_io_requestor_0_req_ready; 
  assign dcache_io_ptw_resp_valid = ptw_io_requestor_0_resp_valid; 
  assign dcache_io_ptw_resp_bits_ae = ptw_io_requestor_0_resp_bits_ae; 
  assign dcache_io_ptw_resp_bits_pte_ppn = ptw_io_requestor_0_resp_bits_pte_ppn; 
  assign dcache_io_ptw_resp_bits_pte_d = ptw_io_requestor_0_resp_bits_pte_d; 
  assign dcache_io_ptw_resp_bits_pte_a = ptw_io_requestor_0_resp_bits_pte_a; 
  assign dcache_io_ptw_resp_bits_pte_g = ptw_io_requestor_0_resp_bits_pte_g; 
  assign dcache_io_ptw_resp_bits_pte_u = ptw_io_requestor_0_resp_bits_pte_u; 
  assign dcache_io_ptw_resp_bits_pte_x = ptw_io_requestor_0_resp_bits_pte_x; 
  assign dcache_io_ptw_resp_bits_pte_w = ptw_io_requestor_0_resp_bits_pte_w; 
  assign dcache_io_ptw_resp_bits_pte_r = ptw_io_requestor_0_resp_bits_pte_r; 
  assign dcache_io_ptw_resp_bits_pte_v = ptw_io_requestor_0_resp_bits_pte_v; 
  assign dcache_io_ptw_resp_bits_level = ptw_io_requestor_0_resp_bits_level; 
  assign dcache_io_ptw_resp_bits_fragmented_superpage = 1'h0; 
  assign dcache_io_ptw_resp_bits_homogeneous = ptw_io_requestor_0_resp_bits_homogeneous; 
  assign dcache_io_ptw_ptbr_mode = ptw_io_requestor_0_ptbr_mode; 
  assign dcache_io_ptw_status_dprv = ptw_io_requestor_0_status_dprv; 
  assign dcache_io_ptw_status_mxr = ptw_io_requestor_0_status_mxr; 
  assign dcache_io_ptw_status_sum = ptw_io_requestor_0_status_sum; 
  assign dcache_io_ptw_pmp_0_cfg_l = ptw_io_requestor_0_pmp_0_cfg_l; 
  assign dcache_io_ptw_pmp_0_cfg_a = ptw_io_requestor_0_pmp_0_cfg_a; 
  assign dcache_io_ptw_pmp_0_cfg_x = ptw_io_requestor_0_pmp_0_cfg_x; 
  assign dcache_io_ptw_pmp_0_cfg_w = ptw_io_requestor_0_pmp_0_cfg_w; 
  assign dcache_io_ptw_pmp_0_cfg_r = ptw_io_requestor_0_pmp_0_cfg_r; 
  assign dcache_io_ptw_pmp_0_addr = ptw_io_requestor_0_pmp_0_addr; 
  assign dcache_io_ptw_pmp_0_mask = ptw_io_requestor_0_pmp_0_mask; 
  assign dcache_io_ptw_pmp_1_cfg_l = ptw_io_requestor_0_pmp_1_cfg_l; 
  assign dcache_io_ptw_pmp_1_cfg_a = ptw_io_requestor_0_pmp_1_cfg_a; 
  assign dcache_io_ptw_pmp_1_cfg_x = ptw_io_requestor_0_pmp_1_cfg_x; 
  assign dcache_io_ptw_pmp_1_cfg_w = ptw_io_requestor_0_pmp_1_cfg_w; 
  assign dcache_io_ptw_pmp_1_cfg_r = ptw_io_requestor_0_pmp_1_cfg_r; 
  assign dcache_io_ptw_pmp_1_addr = ptw_io_requestor_0_pmp_1_addr; 
  assign dcache_io_ptw_pmp_1_mask = ptw_io_requestor_0_pmp_1_mask; 
  assign dcache_io_ptw_pmp_2_cfg_l = ptw_io_requestor_0_pmp_2_cfg_l; 
  assign dcache_io_ptw_pmp_2_cfg_a = ptw_io_requestor_0_pmp_2_cfg_a; 
  assign dcache_io_ptw_pmp_2_cfg_x = ptw_io_requestor_0_pmp_2_cfg_x; 
  assign dcache_io_ptw_pmp_2_cfg_w = ptw_io_requestor_0_pmp_2_cfg_w; 
  assign dcache_io_ptw_pmp_2_cfg_r = ptw_io_requestor_0_pmp_2_cfg_r; 
  assign dcache_io_ptw_pmp_2_addr = ptw_io_requestor_0_pmp_2_addr; 
  assign dcache_io_ptw_pmp_2_mask = ptw_io_requestor_0_pmp_2_mask; 
  assign dcache_io_ptw_pmp_3_cfg_l = ptw_io_requestor_0_pmp_3_cfg_l; 
  assign dcache_io_ptw_pmp_3_cfg_a = ptw_io_requestor_0_pmp_3_cfg_a; 
  assign dcache_io_ptw_pmp_3_cfg_x = ptw_io_requestor_0_pmp_3_cfg_x; 
  assign dcache_io_ptw_pmp_3_cfg_w = ptw_io_requestor_0_pmp_3_cfg_w; 
  assign dcache_io_ptw_pmp_3_cfg_r = ptw_io_requestor_0_pmp_3_cfg_r; 
  assign dcache_io_ptw_pmp_3_addr = ptw_io_requestor_0_pmp_3_addr; 
  assign dcache_io_ptw_pmp_3_mask = ptw_io_requestor_0_pmp_3_mask; 
  assign dcache_io_ptw_pmp_4_cfg_l = ptw_io_requestor_0_pmp_4_cfg_l; 
  assign dcache_io_ptw_pmp_4_cfg_a = ptw_io_requestor_0_pmp_4_cfg_a; 
  assign dcache_io_ptw_pmp_4_cfg_x = ptw_io_requestor_0_pmp_4_cfg_x; 
  assign dcache_io_ptw_pmp_4_cfg_w = ptw_io_requestor_0_pmp_4_cfg_w; 
  assign dcache_io_ptw_pmp_4_cfg_r = ptw_io_requestor_0_pmp_4_cfg_r; 
  assign dcache_io_ptw_pmp_4_addr = ptw_io_requestor_0_pmp_4_addr; 
  assign dcache_io_ptw_pmp_4_mask = ptw_io_requestor_0_pmp_4_mask; 
  assign dcache_io_ptw_pmp_5_cfg_l = ptw_io_requestor_0_pmp_5_cfg_l; 
  assign dcache_io_ptw_pmp_5_cfg_a = ptw_io_requestor_0_pmp_5_cfg_a; 
  assign dcache_io_ptw_pmp_5_cfg_x = ptw_io_requestor_0_pmp_5_cfg_x; 
  assign dcache_io_ptw_pmp_5_cfg_w = ptw_io_requestor_0_pmp_5_cfg_w; 
  assign dcache_io_ptw_pmp_5_cfg_r = ptw_io_requestor_0_pmp_5_cfg_r; 
  assign dcache_io_ptw_pmp_5_addr = ptw_io_requestor_0_pmp_5_addr; 
  assign dcache_io_ptw_pmp_5_mask = ptw_io_requestor_0_pmp_5_mask; 
  assign dcache_io_ptw_pmp_6_cfg_l = ptw_io_requestor_0_pmp_6_cfg_l; 
  assign dcache_io_ptw_pmp_6_cfg_a = ptw_io_requestor_0_pmp_6_cfg_a; 
  assign dcache_io_ptw_pmp_6_cfg_x = ptw_io_requestor_0_pmp_6_cfg_x; 
  assign dcache_io_ptw_pmp_6_cfg_w = ptw_io_requestor_0_pmp_6_cfg_w; 
  assign dcache_io_ptw_pmp_6_cfg_r = ptw_io_requestor_0_pmp_6_cfg_r; 
  assign dcache_io_ptw_pmp_6_addr = ptw_io_requestor_0_pmp_6_addr; 
  assign dcache_io_ptw_pmp_6_mask = ptw_io_requestor_0_pmp_6_mask; 
  assign dcache_io_ptw_pmp_7_cfg_l = ptw_io_requestor_0_pmp_7_cfg_l; 
  assign dcache_io_ptw_pmp_7_cfg_a = ptw_io_requestor_0_pmp_7_cfg_a; 
  assign dcache_io_ptw_pmp_7_cfg_x = ptw_io_requestor_0_pmp_7_cfg_x; 
  assign dcache_io_ptw_pmp_7_cfg_w = ptw_io_requestor_0_pmp_7_cfg_w; 
  assign dcache_io_ptw_pmp_7_cfg_r = ptw_io_requestor_0_pmp_7_cfg_r; 
  assign dcache_io_ptw_pmp_7_addr = ptw_io_requestor_0_pmp_7_addr; 
  assign dcache_io_ptw_pmp_7_mask = ptw_io_requestor_0_pmp_7_mask; 
  assign dcache_io_ptw_customCSRs_csrs_0_value = ptw_io_requestor_0_customCSRs_csrs_0_value; 
  assign frontend_gated_clock = clock; 
  assign frontend_reset = reset; 
  assign frontend_auto_icache_master_out_a_ready = tlMasterXbar_auto_in_1_a_ready; 
  assign frontend_auto_icache_master_out_d_valid = tlMasterXbar_auto_in_1_d_valid; 
  assign frontend_auto_icache_master_out_d_bits_opcode = tlMasterXbar_auto_in_1_d_bits_opcode; 
  assign frontend_auto_icache_master_out_d_bits_size = tlMasterXbar_auto_in_1_d_bits_size; 
  assign frontend_auto_icache_master_out_d_bits_data = tlMasterXbar_auto_in_1_d_bits_data; 
  assign frontend_auto_icache_master_out_d_bits_corrupt = tlMasterXbar_auto_in_1_d_bits_corrupt; 
  assign frontend_io_reset_vector = debug_mode_sel_latch ? {6'h0, reset_vector_msb_32[31:0]} : 38'h10000; 
  assign frontend_io_cpu_might_request = core_io_imem_might_request; 
  assign frontend_io_cpu_req_valid = core_io_imem_req_valid; 
  assign frontend_io_cpu_req_bits_pc = core_io_imem_req_bits_pc; 
  assign frontend_io_cpu_req_bits_speculative = core_io_imem_req_bits_speculative; 
  assign frontend_io_cpu_sfence_valid = core_io_imem_sfence_valid; 
  assign frontend_io_cpu_sfence_bits_rs1 = core_io_imem_sfence_bits_rs1; 
  assign frontend_io_cpu_sfence_bits_rs2 = core_io_imem_sfence_bits_rs2; 
  assign frontend_io_cpu_sfence_bits_addr = core_io_imem_sfence_bits_addr; 
  assign frontend_io_cpu_resp_ready = core_io_imem_resp_ready; 
  assign frontend_io_cpu_btb_update_valid = core_io_imem_btb_update_valid; 
  assign frontend_io_cpu_btb_update_bits_prediction_entry = core_io_imem_btb_update_bits_prediction_entry; 
  assign frontend_io_cpu_btb_update_bits_pc = core_io_imem_btb_update_bits_pc; 
  assign frontend_io_cpu_btb_update_bits_isValid = core_io_imem_btb_update_bits_isValid; 
  assign frontend_io_cpu_btb_update_bits_br_pc = core_io_imem_btb_update_bits_br_pc; 
  assign frontend_io_cpu_btb_update_bits_cfiType = core_io_imem_btb_update_bits_cfiType; 
  assign frontend_io_cpu_bht_update_valid = core_io_imem_bht_update_valid; 
  assign frontend_io_cpu_bht_update_bits_prediction_history = core_io_imem_bht_update_bits_prediction_history; 
  assign frontend_io_cpu_bht_update_bits_pc = core_io_imem_bht_update_bits_pc; 
  assign frontend_io_cpu_bht_update_bits_branch = core_io_imem_bht_update_bits_branch; 
  assign frontend_io_cpu_bht_update_bits_taken = core_io_imem_bht_update_bits_taken; 
  assign frontend_io_cpu_bht_update_bits_mispredict = core_io_imem_bht_update_bits_mispredict; 
  assign frontend_io_cpu_flush_icache = core_io_imem_flush_icache; 
  assign frontend_io_ptw_req_ready = ptw_io_requestor_1_req_ready; 
  assign frontend_io_ptw_resp_valid = ptw_io_requestor_1_resp_valid; 
  assign frontend_io_ptw_resp_bits_ae = ptw_io_requestor_1_resp_bits_ae; 
  assign frontend_io_ptw_resp_bits_pte_ppn = ptw_io_requestor_1_resp_bits_pte_ppn; 
  assign frontend_io_ptw_resp_bits_pte_d = ptw_io_requestor_1_resp_bits_pte_d; 
  assign frontend_io_ptw_resp_bits_pte_a = ptw_io_requestor_1_resp_bits_pte_a; 
  assign frontend_io_ptw_resp_bits_pte_g = ptw_io_requestor_1_resp_bits_pte_g; 
  assign frontend_io_ptw_resp_bits_pte_u = ptw_io_requestor_1_resp_bits_pte_u; 
  assign frontend_io_ptw_resp_bits_pte_x = ptw_io_requestor_1_resp_bits_pte_x; 
  assign frontend_io_ptw_resp_bits_pte_w = ptw_io_requestor_1_resp_bits_pte_w; 
  assign frontend_io_ptw_resp_bits_pte_r = ptw_io_requestor_1_resp_bits_pte_r; 
  assign frontend_io_ptw_resp_bits_pte_v = ptw_io_requestor_1_resp_bits_pte_v; 
  assign frontend_io_ptw_resp_bits_level = ptw_io_requestor_1_resp_bits_level; 
  assign frontend_io_ptw_resp_bits_fragmented_superpage = 1'h0; 
  assign frontend_io_ptw_resp_bits_homogeneous = ptw_io_requestor_1_resp_bits_homogeneous; 
  assign frontend_io_ptw_ptbr_mode = ptw_io_requestor_1_ptbr_mode; 
  assign frontend_io_ptw_status_prv = ptw_io_requestor_1_status_prv; 
  assign frontend_io_ptw_pmp_0_cfg_l = ptw_io_requestor_1_pmp_0_cfg_l; 
  assign frontend_io_ptw_pmp_0_cfg_a = ptw_io_requestor_1_pmp_0_cfg_a; 
  assign frontend_io_ptw_pmp_0_cfg_x = ptw_io_requestor_1_pmp_0_cfg_x; 
  assign frontend_io_ptw_pmp_0_cfg_w = ptw_io_requestor_1_pmp_0_cfg_w; 
  assign frontend_io_ptw_pmp_0_cfg_r = ptw_io_requestor_1_pmp_0_cfg_r; 
  assign frontend_io_ptw_pmp_0_addr = ptw_io_requestor_1_pmp_0_addr; 
  assign frontend_io_ptw_pmp_0_mask = ptw_io_requestor_1_pmp_0_mask; 
  assign frontend_io_ptw_pmp_1_cfg_l = ptw_io_requestor_1_pmp_1_cfg_l; 
  assign frontend_io_ptw_pmp_1_cfg_a = ptw_io_requestor_1_pmp_1_cfg_a; 
  assign frontend_io_ptw_pmp_1_cfg_x = ptw_io_requestor_1_pmp_1_cfg_x; 
  assign frontend_io_ptw_pmp_1_cfg_w = ptw_io_requestor_1_pmp_1_cfg_w; 
  assign frontend_io_ptw_pmp_1_cfg_r = ptw_io_requestor_1_pmp_1_cfg_r; 
  assign frontend_io_ptw_pmp_1_addr = ptw_io_requestor_1_pmp_1_addr; 
  assign frontend_io_ptw_pmp_1_mask = ptw_io_requestor_1_pmp_1_mask; 
  assign frontend_io_ptw_pmp_2_cfg_l = ptw_io_requestor_1_pmp_2_cfg_l; 
  assign frontend_io_ptw_pmp_2_cfg_a = ptw_io_requestor_1_pmp_2_cfg_a; 
  assign frontend_io_ptw_pmp_2_cfg_x = ptw_io_requestor_1_pmp_2_cfg_x; 
  assign frontend_io_ptw_pmp_2_cfg_w = ptw_io_requestor_1_pmp_2_cfg_w; 
  assign frontend_io_ptw_pmp_2_cfg_r = ptw_io_requestor_1_pmp_2_cfg_r; 
  assign frontend_io_ptw_pmp_2_addr = ptw_io_requestor_1_pmp_2_addr; 
  assign frontend_io_ptw_pmp_2_mask = ptw_io_requestor_1_pmp_2_mask; 
  assign frontend_io_ptw_pmp_3_cfg_l = ptw_io_requestor_1_pmp_3_cfg_l; 
  assign frontend_io_ptw_pmp_3_cfg_a = ptw_io_requestor_1_pmp_3_cfg_a; 
  assign frontend_io_ptw_pmp_3_cfg_x = ptw_io_requestor_1_pmp_3_cfg_x; 
  assign frontend_io_ptw_pmp_3_cfg_w = ptw_io_requestor_1_pmp_3_cfg_w; 
  assign frontend_io_ptw_pmp_3_cfg_r = ptw_io_requestor_1_pmp_3_cfg_r; 
  assign frontend_io_ptw_pmp_3_addr = ptw_io_requestor_1_pmp_3_addr; 
  assign frontend_io_ptw_pmp_3_mask = ptw_io_requestor_1_pmp_3_mask; 
  assign frontend_io_ptw_pmp_4_cfg_l = ptw_io_requestor_1_pmp_4_cfg_l; 
  assign frontend_io_ptw_pmp_4_cfg_a = ptw_io_requestor_1_pmp_4_cfg_a; 
  assign frontend_io_ptw_pmp_4_cfg_x = ptw_io_requestor_1_pmp_4_cfg_x; 
  assign frontend_io_ptw_pmp_4_cfg_w = ptw_io_requestor_1_pmp_4_cfg_w; 
  assign frontend_io_ptw_pmp_4_cfg_r = ptw_io_requestor_1_pmp_4_cfg_r; 
  assign frontend_io_ptw_pmp_4_addr = ptw_io_requestor_1_pmp_4_addr; 
  assign frontend_io_ptw_pmp_4_mask = ptw_io_requestor_1_pmp_4_mask; 
  assign frontend_io_ptw_pmp_5_cfg_l = ptw_io_requestor_1_pmp_5_cfg_l; 
  assign frontend_io_ptw_pmp_5_cfg_a = ptw_io_requestor_1_pmp_5_cfg_a; 
  assign frontend_io_ptw_pmp_5_cfg_x = ptw_io_requestor_1_pmp_5_cfg_x; 
  assign frontend_io_ptw_pmp_5_cfg_w = ptw_io_requestor_1_pmp_5_cfg_w; 
  assign frontend_io_ptw_pmp_5_cfg_r = ptw_io_requestor_1_pmp_5_cfg_r; 
  assign frontend_io_ptw_pmp_5_addr = ptw_io_requestor_1_pmp_5_addr; 
  assign frontend_io_ptw_pmp_5_mask = ptw_io_requestor_1_pmp_5_mask; 
  assign frontend_io_ptw_pmp_6_cfg_l = ptw_io_requestor_1_pmp_6_cfg_l; 
  assign frontend_io_ptw_pmp_6_cfg_a = ptw_io_requestor_1_pmp_6_cfg_a; 
  assign frontend_io_ptw_pmp_6_cfg_x = ptw_io_requestor_1_pmp_6_cfg_x; 
  assign frontend_io_ptw_pmp_6_cfg_w = ptw_io_requestor_1_pmp_6_cfg_w; 
  assign frontend_io_ptw_pmp_6_cfg_r = ptw_io_requestor_1_pmp_6_cfg_r; 
  assign frontend_io_ptw_pmp_6_addr = ptw_io_requestor_1_pmp_6_addr; 
  assign frontend_io_ptw_pmp_6_mask = ptw_io_requestor_1_pmp_6_mask; 
  assign frontend_io_ptw_pmp_7_cfg_l = ptw_io_requestor_1_pmp_7_cfg_l; 
  assign frontend_io_ptw_pmp_7_cfg_a = ptw_io_requestor_1_pmp_7_cfg_a; 
  assign frontend_io_ptw_pmp_7_cfg_x = ptw_io_requestor_1_pmp_7_cfg_x; 
  assign frontend_io_ptw_pmp_7_cfg_w = ptw_io_requestor_1_pmp_7_cfg_w; 
  assign frontend_io_ptw_pmp_7_cfg_r = ptw_io_requestor_1_pmp_7_cfg_r; 
  assign frontend_io_ptw_pmp_7_addr = ptw_io_requestor_1_pmp_7_addr; 
  assign frontend_io_ptw_pmp_7_mask = ptw_io_requestor_1_pmp_7_mask; 
  assign buffer_clock = clock; 
  assign buffer_reset = reset; 
  assign buffer_auto_in_a_valid = tlMasterXbar_auto_out_a_valid; 
  assign buffer_auto_in_a_bits_opcode = tlMasterXbar_auto_out_a_bits_opcode; 
  assign buffer_auto_in_a_bits_param = tlMasterXbar_auto_out_a_bits_param; 
  assign buffer_auto_in_a_bits_size = tlMasterXbar_auto_out_a_bits_size; 
  assign buffer_auto_in_a_bits_source = tlMasterXbar_auto_out_a_bits_source; 
  assign buffer_auto_in_a_bits_address = tlMasterXbar_auto_out_a_bits_address; 
  assign buffer_auto_in_a_bits_mask = tlMasterXbar_auto_out_a_bits_mask; 
  assign buffer_auto_in_a_bits_data = tlMasterXbar_auto_out_a_bits_data; 
  assign buffer_auto_in_a_bits_corrupt = tlMasterXbar_auto_out_a_bits_corrupt; 
  assign buffer_auto_in_b_ready = tlMasterXbar_auto_out_b_ready; 
  assign buffer_auto_in_c_valid = tlMasterXbar_auto_out_c_valid; 
  assign buffer_auto_in_c_bits_opcode = tlMasterXbar_auto_out_c_bits_opcode; 
  assign buffer_auto_in_c_bits_param = tlMasterXbar_auto_out_c_bits_param; 
  assign buffer_auto_in_c_bits_size = tlMasterXbar_auto_out_c_bits_size; 
  assign buffer_auto_in_c_bits_source = tlMasterXbar_auto_out_c_bits_source; 
  assign buffer_auto_in_c_bits_address = tlMasterXbar_auto_out_c_bits_address; 
  assign buffer_auto_in_c_bits_data = tlMasterXbar_auto_out_c_bits_data; 
  assign buffer_auto_in_c_bits_corrupt = tlMasterXbar_auto_out_c_bits_corrupt; 
  assign buffer_auto_in_d_ready = tlMasterXbar_auto_out_d_ready; 
  assign buffer_auto_in_e_valid = tlMasterXbar_auto_out_e_valid; 
  assign buffer_auto_in_e_bits_sink = tlMasterXbar_auto_out_e_bits_sink; 
  assign buffer_auto_out_a_ready = auto_tl_master_xing_out_a_ready; 
  assign buffer_auto_out_b_valid = auto_tl_master_xing_out_b_valid; 
  assign buffer_auto_out_b_bits_opcode = auto_tl_master_xing_out_b_bits_opcode; 
  assign buffer_auto_out_b_bits_param = auto_tl_master_xing_out_b_bits_param; 
  assign buffer_auto_out_b_bits_size = auto_tl_master_xing_out_b_bits_size; 
  assign buffer_auto_out_b_bits_source = auto_tl_master_xing_out_b_bits_source; 
  assign buffer_auto_out_b_bits_address = auto_tl_master_xing_out_b_bits_address; 
  assign buffer_auto_out_b_bits_mask = auto_tl_master_xing_out_b_bits_mask; 
  assign buffer_auto_out_b_bits_corrupt = auto_tl_master_xing_out_b_bits_corrupt; 
  assign buffer_auto_out_c_ready = auto_tl_master_xing_out_c_ready; 
  assign buffer_auto_out_d_valid = auto_tl_master_xing_out_d_valid; 
  assign buffer_auto_out_d_bits_opcode = auto_tl_master_xing_out_d_bits_opcode; 
  assign buffer_auto_out_d_bits_param = auto_tl_master_xing_out_d_bits_param; 
  assign buffer_auto_out_d_bits_size = auto_tl_master_xing_out_d_bits_size; 
  assign buffer_auto_out_d_bits_source = auto_tl_master_xing_out_d_bits_source; 
  assign buffer_auto_out_d_bits_sink = auto_tl_master_xing_out_d_bits_sink; 
  assign buffer_auto_out_d_bits_denied = auto_tl_master_xing_out_d_bits_denied; 
  assign buffer_auto_out_d_bits_data = auto_tl_master_xing_out_d_bits_data; 
  assign buffer_auto_out_d_bits_corrupt = auto_tl_master_xing_out_d_bits_corrupt; 
  assign buffer_auto_out_e_ready = auto_tl_master_xing_out_e_ready; 
  assign intsink_clock = clock; 
  assign intsink_auto_in_sync_0 = auto_intsink_in_sync_0; 
  assign intsink_1_auto_in_sync_0 = auto_int_in_xing_in_0_sync_0; 
  assign intsink_1_auto_in_sync_1 = auto_int_in_xing_in_0_sync_1; 
  assign intsink_2_auto_in_sync_0 = auto_int_in_xing_in_1_sync_0; 
  assign intsink_3_auto_in_sync_0 = auto_int_in_xing_in_2_sync_0; 
  assign fpuOpt_clock = clock; 
  assign fpuOpt_reset = reset; 
  assign fpuOpt_io_inst = core_io_fpu_inst; 
  assign fpuOpt_io_fromint_data = core_io_fpu_fromint_data; 
  assign fpuOpt_io_fcsr_rm = core_io_fpu_fcsr_rm; 
  assign fpuOpt_io_dmem_resp_val = core_io_fpu_dmem_resp_val; 
  assign fpuOpt_io_dmem_resp_type = core_io_fpu_dmem_resp_type; 
  assign fpuOpt_io_dmem_resp_tag = core_io_fpu_dmem_resp_tag; 
  assign fpuOpt_io_dmem_resp_data = core_io_fpu_dmem_resp_data; 
  assign fpuOpt_io_valid = core_io_fpu_valid; 
  assign fpuOpt_io_killx = core_io_fpu_killx; 
  assign fpuOpt_io_killm = core_io_fpu_killm; 
  assign fpuOpt_io_cp_req_valid = 1'h0;
  assign fpuOpt_io_cp_req_bits_ren2 = 1'h0;
  assign fpuOpt_io_cp_req_bits_ren3 = 1'h0;
  assign fpuOpt_io_cp_req_bits_swap23 = 1'h0;
  assign fpuOpt_io_cp_req_bits_singleIn = 1'h0;
  assign fpuOpt_io_cp_req_bits_singleOut = 1'h0;
  assign fpuOpt_io_cp_req_bits_fromint = 1'h0;
  assign fpuOpt_io_cp_req_bits_toint = 1'h0;
  assign fpuOpt_io_cp_req_bits_fastpipe = 1'h0;
  assign fpuOpt_io_cp_req_bits_fma = 1'h0;
  assign fpuOpt_io_cp_req_bits_div = 1'h0;
  assign fpuOpt_io_cp_req_bits_sqrt = 1'h0;
  assign fpuOpt_io_cp_req_bits_wflags = 1'h0;
  assign fpuOpt_io_cp_req_bits_rm = 3'h0;
  assign fpuOpt_io_cp_req_bits_fmaCmd = 2'h0;
  assign fpuOpt_io_cp_req_bits_typ = 2'h0;
  assign fpuOpt_io_cp_req_bits_in1 = 65'h0;
  assign fpuOpt_io_cp_req_bits_in2 = 65'h0;
  assign fpuOpt_io_cp_req_bits_in3 = 65'h0;
  assign dcacheArb_clock = clock; 
  assign dcacheArb_io_requestor_0_req_valid = ptw_io_mem_req_valid; 
  assign dcacheArb_io_requestor_0_req_bits_addr = ptw_io_mem_req_bits_addr; 
  assign dcacheArb_io_requestor_0_req_bits_tag = 7'h0; 
  assign dcacheArb_io_requestor_0_req_bits_cmd = 5'h0; 
  assign dcacheArb_io_requestor_0_req_bits_typ = 3'h3; 
  assign dcacheArb_io_requestor_0_req_bits_phys = 1'h1; 
  assign dcacheArb_io_requestor_0_s1_kill = ptw_io_mem_s1_kill; 
  assign dcacheArb_io_requestor_0_s1_data_data = 64'h0; 
  assign dcacheArb_io_requestor_0_s1_data_mask = 8'h0; 
  assign dcacheArb_io_requestor_0_s2_kill = 1'h0; 
  assign dcacheArb_io_requestor_0_keep_clock_enabled = 1'h0; 
  assign dcacheArb_io_requestor_1_req_valid = core_io_dmem_req_valid; 
  assign dcacheArb_io_requestor_1_req_bits_addr = core_io_dmem_req_bits_addr; 
  assign dcacheArb_io_requestor_1_req_bits_tag = core_io_dmem_req_bits_tag; 
  assign dcacheArb_io_requestor_1_req_bits_cmd = core_io_dmem_req_bits_cmd; 
  assign dcacheArb_io_requestor_1_req_bits_typ = core_io_dmem_req_bits_typ; 
  assign dcacheArb_io_requestor_1_req_bits_phys = 1'h0; 
  assign dcacheArb_io_requestor_1_s1_kill = core_io_dmem_s1_kill; 
  assign dcacheArb_io_requestor_1_s1_data_data = core_io_dmem_s1_data_data; 
  assign dcacheArb_io_requestor_1_s1_data_mask = 8'h0; 
  assign dcacheArb_io_requestor_1_s2_kill = 1'h0; 
  assign dcacheArb_io_requestor_1_keep_clock_enabled = core_io_dmem_keep_clock_enabled; 
  assign dcacheArb_io_mem_req_ready = dcache_io_cpu_req_ready; 
  assign dcacheArb_io_mem_s2_nack = dcache_io_cpu_s2_nack; 
  assign dcacheArb_io_mem_resp_valid = dcache_io_cpu_resp_valid; 
  assign dcacheArb_io_mem_resp_bits_tag = dcache_io_cpu_resp_bits_tag; 
  assign dcacheArb_io_mem_resp_bits_typ = dcache_io_cpu_resp_bits_typ; 
  assign dcacheArb_io_mem_resp_bits_data = dcache_io_cpu_resp_bits_data; 
  assign dcacheArb_io_mem_resp_bits_replay = dcache_io_cpu_resp_bits_replay; 
  assign dcacheArb_io_mem_resp_bits_has_data = dcache_io_cpu_resp_bits_has_data; 
  assign dcacheArb_io_mem_resp_bits_data_word_bypass = dcache_io_cpu_resp_bits_data_word_bypass; 
  assign dcacheArb_io_mem_replay_next = dcache_io_cpu_replay_next; 
  assign dcacheArb_io_mem_s2_xcpt_ma_ld = dcache_io_cpu_s2_xcpt_ma_ld; 
  assign dcacheArb_io_mem_s2_xcpt_ma_st = dcache_io_cpu_s2_xcpt_ma_st; 
  assign dcacheArb_io_mem_s2_xcpt_pf_ld = dcache_io_cpu_s2_xcpt_pf_ld; 
  assign dcacheArb_io_mem_s2_xcpt_pf_st = dcache_io_cpu_s2_xcpt_pf_st; 
  assign dcacheArb_io_mem_s2_xcpt_ae_ld = dcache_io_cpu_s2_xcpt_ae_ld; 
  assign dcacheArb_io_mem_s2_xcpt_ae_st = dcache_io_cpu_s2_xcpt_ae_st; 
  assign dcacheArb_io_mem_ordered = dcache_io_cpu_ordered; 
  assign dcacheArb_io_mem_perf_grant = dcache_io_cpu_perf_grant; 
  assign dcacheArb_io_mem_clock_enabled = dcache_io_cpu_clock_enabled; 
  assign ptw_clock = clock; 
  assign ptw_reset = reset; 
  assign ptw_io_requestor_0_req_valid = dcache_io_ptw_req_valid; 
  assign ptw_io_requestor_0_req_bits_valid = dcache_io_ptw_req_bits_valid; 
  assign ptw_io_requestor_0_req_bits_bits_addr = dcache_io_ptw_req_bits_bits_addr; 
  assign ptw_io_requestor_1_req_valid = frontend_io_ptw_req_valid; 
  assign ptw_io_requestor_1_req_bits_valid = frontend_io_ptw_req_bits_valid; 
  assign ptw_io_requestor_1_req_bits_bits_addr = frontend_io_ptw_req_bits_bits_addr; 
  assign ptw_io_mem_req_ready = dcacheArb_io_requestor_0_req_ready; 
  assign ptw_io_mem_s2_nack = dcacheArb_io_requestor_0_s2_nack; 
  assign ptw_io_mem_resp_valid = dcacheArb_io_requestor_0_resp_valid; 
  assign ptw_io_mem_resp_bits_data_word_bypass = dcacheArb_io_requestor_0_resp_bits_data_word_bypass; 
  assign ptw_io_mem_s2_xcpt_ae_ld = dcacheArb_io_requestor_0_s2_xcpt_ae_ld; 
  assign ptw_io_dpath_ptbr_mode = core_io_ptw_ptbr_mode; 
  assign ptw_io_dpath_ptbr_ppn = core_io_ptw_ptbr_ppn; 
  assign ptw_io_dpath_sfence_valid = core_io_ptw_sfence_valid; 
  assign ptw_io_dpath_sfence_bits_rs1 = core_io_ptw_sfence_bits_rs1; 
  assign ptw_io_dpath_status_dprv = core_io_ptw_status_dprv; 
  assign ptw_io_dpath_status_prv = core_io_ptw_status_prv; 
  assign ptw_io_dpath_status_mxr = core_io_ptw_status_mxr; 
  assign ptw_io_dpath_status_sum = core_io_ptw_status_sum; 
  assign ptw_io_dpath_pmp_0_cfg_l = core_io_ptw_pmp_0_cfg_l; 
  assign ptw_io_dpath_pmp_0_cfg_a = core_io_ptw_pmp_0_cfg_a; 
  assign ptw_io_dpath_pmp_0_cfg_x = core_io_ptw_pmp_0_cfg_x; 
  assign ptw_io_dpath_pmp_0_cfg_w = core_io_ptw_pmp_0_cfg_w; 
  assign ptw_io_dpath_pmp_0_cfg_r = core_io_ptw_pmp_0_cfg_r; 
  assign ptw_io_dpath_pmp_0_addr = core_io_ptw_pmp_0_addr; 
  assign ptw_io_dpath_pmp_0_mask = core_io_ptw_pmp_0_mask; 
  assign ptw_io_dpath_pmp_1_cfg_l = core_io_ptw_pmp_1_cfg_l; 
  assign ptw_io_dpath_pmp_1_cfg_a = core_io_ptw_pmp_1_cfg_a; 
  assign ptw_io_dpath_pmp_1_cfg_x = core_io_ptw_pmp_1_cfg_x; 
  assign ptw_io_dpath_pmp_1_cfg_w = core_io_ptw_pmp_1_cfg_w; 
  assign ptw_io_dpath_pmp_1_cfg_r = core_io_ptw_pmp_1_cfg_r; 
  assign ptw_io_dpath_pmp_1_addr = core_io_ptw_pmp_1_addr; 
  assign ptw_io_dpath_pmp_1_mask = core_io_ptw_pmp_1_mask; 
  assign ptw_io_dpath_pmp_2_cfg_l = core_io_ptw_pmp_2_cfg_l; 
  assign ptw_io_dpath_pmp_2_cfg_a = core_io_ptw_pmp_2_cfg_a; 
  assign ptw_io_dpath_pmp_2_cfg_x = core_io_ptw_pmp_2_cfg_x; 
  assign ptw_io_dpath_pmp_2_cfg_w = core_io_ptw_pmp_2_cfg_w; 
  assign ptw_io_dpath_pmp_2_cfg_r = core_io_ptw_pmp_2_cfg_r; 
  assign ptw_io_dpath_pmp_2_addr = core_io_ptw_pmp_2_addr; 
  assign ptw_io_dpath_pmp_2_mask = core_io_ptw_pmp_2_mask; 
  assign ptw_io_dpath_pmp_3_cfg_l = core_io_ptw_pmp_3_cfg_l; 
  assign ptw_io_dpath_pmp_3_cfg_a = core_io_ptw_pmp_3_cfg_a; 
  assign ptw_io_dpath_pmp_3_cfg_x = core_io_ptw_pmp_3_cfg_x; 
  assign ptw_io_dpath_pmp_3_cfg_w = core_io_ptw_pmp_3_cfg_w; 
  assign ptw_io_dpath_pmp_3_cfg_r = core_io_ptw_pmp_3_cfg_r; 
  assign ptw_io_dpath_pmp_3_addr = core_io_ptw_pmp_3_addr; 
  assign ptw_io_dpath_pmp_3_mask = core_io_ptw_pmp_3_mask; 
  assign ptw_io_dpath_pmp_4_cfg_l = core_io_ptw_pmp_4_cfg_l; 
  assign ptw_io_dpath_pmp_4_cfg_a = core_io_ptw_pmp_4_cfg_a; 
  assign ptw_io_dpath_pmp_4_cfg_x = core_io_ptw_pmp_4_cfg_x; 
  assign ptw_io_dpath_pmp_4_cfg_w = core_io_ptw_pmp_4_cfg_w; 
  assign ptw_io_dpath_pmp_4_cfg_r = core_io_ptw_pmp_4_cfg_r; 
  assign ptw_io_dpath_pmp_4_addr = core_io_ptw_pmp_4_addr; 
  assign ptw_io_dpath_pmp_4_mask = core_io_ptw_pmp_4_mask; 
  assign ptw_io_dpath_pmp_5_cfg_l = core_io_ptw_pmp_5_cfg_l; 
  assign ptw_io_dpath_pmp_5_cfg_a = core_io_ptw_pmp_5_cfg_a; 
  assign ptw_io_dpath_pmp_5_cfg_x = core_io_ptw_pmp_5_cfg_x; 
  assign ptw_io_dpath_pmp_5_cfg_w = core_io_ptw_pmp_5_cfg_w; 
  assign ptw_io_dpath_pmp_5_cfg_r = core_io_ptw_pmp_5_cfg_r; 
  assign ptw_io_dpath_pmp_5_addr = core_io_ptw_pmp_5_addr; 
  assign ptw_io_dpath_pmp_5_mask = core_io_ptw_pmp_5_mask; 
  assign ptw_io_dpath_pmp_6_cfg_l = core_io_ptw_pmp_6_cfg_l; 
  assign ptw_io_dpath_pmp_6_cfg_a = core_io_ptw_pmp_6_cfg_a; 
  assign ptw_io_dpath_pmp_6_cfg_x = core_io_ptw_pmp_6_cfg_x; 
  assign ptw_io_dpath_pmp_6_cfg_w = core_io_ptw_pmp_6_cfg_w; 
  assign ptw_io_dpath_pmp_6_cfg_r = core_io_ptw_pmp_6_cfg_r; 
  assign ptw_io_dpath_pmp_6_addr = core_io_ptw_pmp_6_addr; 
  assign ptw_io_dpath_pmp_6_mask = core_io_ptw_pmp_6_mask; 
  assign ptw_io_dpath_pmp_7_cfg_l = core_io_ptw_pmp_7_cfg_l; 
  assign ptw_io_dpath_pmp_7_cfg_a = core_io_ptw_pmp_7_cfg_a; 
  assign ptw_io_dpath_pmp_7_cfg_x = core_io_ptw_pmp_7_cfg_x; 
  assign ptw_io_dpath_pmp_7_cfg_w = core_io_ptw_pmp_7_cfg_w; 
  assign ptw_io_dpath_pmp_7_cfg_r = core_io_ptw_pmp_7_cfg_r; 
  assign ptw_io_dpath_pmp_7_addr = core_io_ptw_pmp_7_addr; 
  assign ptw_io_dpath_pmp_7_mask = core_io_ptw_pmp_7_mask; 
  assign ptw_io_dpath_customCSRs_csrs_0_value = 64'h0; 
  assign core_clock = clock; 
  assign core_reset = reset; 
  assign core_io_hartid = constants_hartid; 
  assign core_io_interrupts_debug = intXbar_auto_int_out_0; 
  assign core_io_interrupts_mtip = intXbar_auto_int_out_2; 
  assign core_io_interrupts_msip = intXbar_auto_int_out_1; 
  assign core_io_interrupts_meip = intXbar_auto_int_out_3; 
  assign core_io_interrupts_seip = intXbar_auto_int_out_4; 
  assign core_io_imem_resp_valid = frontend_io_cpu_resp_valid; 
  assign core_io_imem_resp_bits_btb_taken = frontend_io_cpu_resp_bits_btb_taken; 
  assign core_io_imem_resp_bits_btb_bridx = frontend_io_cpu_resp_bits_btb_bridx; 
  assign core_io_imem_resp_bits_btb_entry = frontend_io_cpu_resp_bits_btb_entry; 
  assign core_io_imem_resp_bits_btb_bht_history = frontend_io_cpu_resp_bits_btb_bht_history; 
  assign core_io_imem_resp_bits_pc = frontend_io_cpu_resp_bits_pc; 
  assign core_io_imem_resp_bits_data = frontend_io_cpu_resp_bits_data; 
  assign core_io_imem_resp_bits_xcpt_pf_inst = frontend_io_cpu_resp_bits_xcpt_pf_inst; 
  assign core_io_imem_resp_bits_xcpt_ae_inst = frontend_io_cpu_resp_bits_xcpt_ae_inst; 
  assign core_io_imem_resp_bits_replay = frontend_io_cpu_resp_bits_replay; 
  assign core_io_dmem_req_ready = dcacheArb_io_requestor_1_req_ready; 
  assign core_io_dmem_s2_nack = dcacheArb_io_requestor_1_s2_nack; 
  assign core_io_dmem_resp_valid = dcacheArb_io_requestor_1_resp_valid; 
  assign core_io_dmem_resp_bits_tag = dcacheArb_io_requestor_1_resp_bits_tag; 
  assign core_io_dmem_resp_bits_typ = dcacheArb_io_requestor_1_resp_bits_typ; 
  assign core_io_dmem_resp_bits_data = dcacheArb_io_requestor_1_resp_bits_data; 
  assign core_io_dmem_resp_bits_replay = dcacheArb_io_requestor_1_resp_bits_replay; 
  assign core_io_dmem_resp_bits_has_data = dcacheArb_io_requestor_1_resp_bits_has_data; 
  assign core_io_dmem_resp_bits_data_word_bypass = dcacheArb_io_requestor_1_resp_bits_data_word_bypass; 
  assign core_io_dmem_replay_next = dcacheArb_io_requestor_1_replay_next; 
  assign core_io_dmem_s2_xcpt_ma_ld = dcacheArb_io_requestor_1_s2_xcpt_ma_ld; 
  assign core_io_dmem_s2_xcpt_ma_st = dcacheArb_io_requestor_1_s2_xcpt_ma_st; 
  assign core_io_dmem_s2_xcpt_pf_ld = dcacheArb_io_requestor_1_s2_xcpt_pf_ld; 
  assign core_io_dmem_s2_xcpt_pf_st = dcacheArb_io_requestor_1_s2_xcpt_pf_st; 
  assign core_io_dmem_s2_xcpt_ae_ld = dcacheArb_io_requestor_1_s2_xcpt_ae_ld; 
  assign core_io_dmem_s2_xcpt_ae_st = dcacheArb_io_requestor_1_s2_xcpt_ae_st; 
  assign core_io_dmem_ordered = dcacheArb_io_requestor_1_ordered; 
  assign core_io_dmem_perf_grant = dcacheArb_io_requestor_1_perf_grant; 
  assign core_io_dmem_clock_enabled = dcacheArb_io_requestor_1_clock_enabled; 
  assign core_io_fpu_fcsr_flags_valid = fpuOpt_io_fcsr_flags_valid; 
  assign core_io_fpu_fcsr_flags_bits = fpuOpt_io_fcsr_flags_bits; 
  assign core_io_fpu_store_data = fpuOpt_io_store_data; 
  assign core_io_fpu_toint_data = fpuOpt_io_toint_data; 
  assign core_io_fpu_fcsr_rdy = fpuOpt_io_fcsr_rdy; 
  assign core_io_fpu_nack_mem = fpuOpt_io_nack_mem; 
  assign core_io_fpu_illegal_rm = fpuOpt_io_illegal_rm; 
  assign core_io_fpu_dec_wen = fpuOpt_io_dec_wen; 
  assign core_io_fpu_dec_ren1 = fpuOpt_io_dec_ren1; 
  assign core_io_fpu_dec_ren2 = fpuOpt_io_dec_ren2; 
  assign core_io_fpu_dec_ren3 = fpuOpt_io_dec_ren3; 
  assign core_io_fpu_sboard_set = fpuOpt_io_sboard_set; 
  assign core_io_fpu_sboard_clr = fpuOpt_io_sboard_clr; 
  assign core_io_fpu_sboard_clra = fpuOpt_io_sboard_clra; 
  assign core_io_rocc_cmd_ready = 1'h0;
  assign core_io_rocc_interrupt = 1'h0;
endmodule
