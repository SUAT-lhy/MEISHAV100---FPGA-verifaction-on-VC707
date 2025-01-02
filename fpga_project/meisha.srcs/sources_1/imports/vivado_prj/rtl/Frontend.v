module Frontend( 
  input         gated_clock, 
  input         reset, 
  input         auto_icache_master_out_a_ready, 
  output        auto_icache_master_out_a_valid, 
  output [37:0] auto_icache_master_out_a_bits_address, 
  input         auto_icache_master_out_d_valid, 
  input  [2:0]  auto_icache_master_out_d_bits_opcode, 
  input  [2:0]  auto_icache_master_out_d_bits_size, 
  input  [63:0] auto_icache_master_out_d_bits_data, 
  input         auto_icache_master_out_d_bits_corrupt, 
  input  [37:0] io_reset_vector, 
  input         io_cpu_might_request, 
  input         io_cpu_req_valid, 
  input  [39:0] io_cpu_req_bits_pc, 
  input         io_cpu_req_bits_speculative, 
  input         io_cpu_sfence_valid, 
  input         io_cpu_sfence_bits_rs1, 
  input         io_cpu_sfence_bits_rs2, 
  input  [38:0] io_cpu_sfence_bits_addr, 
  input         io_cpu_resp_ready, 
  output        io_cpu_resp_valid, 
  output        io_cpu_resp_bits_btb_taken, 
  output        io_cpu_resp_bits_btb_bridx, 
  output [4:0]  io_cpu_resp_bits_btb_entry, 
  output [7:0]  io_cpu_resp_bits_btb_bht_history, 
  output [39:0] io_cpu_resp_bits_pc, 
  output [31:0] io_cpu_resp_bits_data, 
  output        io_cpu_resp_bits_xcpt_pf_inst, 
  output        io_cpu_resp_bits_xcpt_ae_inst, 
  output        io_cpu_resp_bits_replay, 
  input         io_cpu_btb_update_valid, 
  input  [4:0]  io_cpu_btb_update_bits_prediction_entry, 
  input  [38:0] io_cpu_btb_update_bits_pc, 
  input         io_cpu_btb_update_bits_isValid, 
  input  [38:0] io_cpu_btb_update_bits_br_pc, 
  input  [1:0]  io_cpu_btb_update_bits_cfiType, 
  input         io_cpu_bht_update_valid, 
  input  [7:0]  io_cpu_bht_update_bits_prediction_history, 
  input  [38:0] io_cpu_bht_update_bits_pc, 
  input         io_cpu_bht_update_bits_branch, 
  input         io_cpu_bht_update_bits_taken, 
  input         io_cpu_bht_update_bits_mispredict, 
  input         io_cpu_flush_icache, 
  output [39:0] io_cpu_npc, 
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
  input  [1:0]  io_ptw_status_prv, 
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
  input  [37:0] io_ptw_pmp_7_mask 
);
  wire  icache_clock; 
  wire  icache_reset; 
  wire  icache_auto_master_out_a_ready; 
  wire  icache_auto_master_out_a_valid; 
  wire [37:0] icache_auto_master_out_a_bits_address; 
  wire  icache_auto_master_out_d_valid; 
  wire [2:0] icache_auto_master_out_d_bits_opcode; 
  wire [2:0] icache_auto_master_out_d_bits_size; 
  wire [63:0] icache_auto_master_out_d_bits_data; 
  wire  icache_auto_master_out_d_bits_corrupt; 
  wire  icache_io_req_ready; 
  wire  icache_io_req_valid; 
  wire [38:0] icache_io_req_bits_addr; 
  wire [37:0] icache_io_s1_paddr; 
  wire  icache_io_s1_kill; 
  wire  icache_io_s2_kill; 
  wire  icache_io_resp_valid; 
  wire [31:0] icache_io_resp_bits_data; 
  wire  icache_io_resp_bits_ae; 
  wire  icache_io_invalidate; 
  wire  fq_clock; 
  wire  fq_reset; 
  wire  fq_io_enq_ready; 
  wire  fq_io_enq_valid; 
  wire  fq_io_enq_bits_btb_taken; 
  wire  fq_io_enq_bits_btb_bridx; 
  wire [4:0] fq_io_enq_bits_btb_entry; 
  wire [7:0] fq_io_enq_bits_btb_bht_history; 
  wire [39:0] fq_io_enq_bits_pc; 
  wire [31:0] fq_io_enq_bits_data; 
  wire [1:0] fq_io_enq_bits_mask; 
  wire  fq_io_enq_bits_xcpt_pf_inst; 
  wire  fq_io_enq_bits_xcpt_ae_inst; 
  wire  fq_io_enq_bits_replay; 
  wire  fq_io_deq_ready; 
  wire  fq_io_deq_valid; 
  wire  fq_io_deq_bits_btb_taken; 
  wire  fq_io_deq_bits_btb_bridx; 
  wire [4:0] fq_io_deq_bits_btb_entry; 
  wire [7:0] fq_io_deq_bits_btb_bht_history; 
  wire [39:0] fq_io_deq_bits_pc; 
  wire [31:0] fq_io_deq_bits_data; 
  wire  fq_io_deq_bits_xcpt_pf_inst; 
  wire  fq_io_deq_bits_xcpt_ae_inst; 
  wire  fq_io_deq_bits_replay; 
  wire [4:0] fq_io_mask; 
  wire  tlb_clock; 
  wire  tlb_reset; 
  wire  tlb_io_req_ready; 
  wire  tlb_io_req_valid; 
  wire [39:0] tlb_io_req_bits_vaddr; 
  wire  tlb_io_resp_miss; 
  wire [37:0] tlb_io_resp_paddr; 
  wire  tlb_io_resp_pf_inst; 
  wire  tlb_io_resp_ae_inst; 
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
  wire [1:0] tlb_io_ptw_status_prv; 
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
  wire  btb_clock; 
  wire  btb_reset; 
  wire [38:0] btb_io_req_bits_addr; 
  wire  btb_io_resp_valid; 
  wire  btb_io_resp_bits_taken; 
  wire  btb_io_resp_bits_bridx; 
  wire [38:0] btb_io_resp_bits_target; 
  wire [4:0] btb_io_resp_bits_entry; 
  wire [7:0] btb_io_resp_bits_bht_history; 
  wire  btb_io_resp_bits_bht_value; 
  wire  btb_io_btb_update_valid; 
  wire [4:0] btb_io_btb_update_bits_prediction_entry; 
  wire [38:0] btb_io_btb_update_bits_pc; 
  wire  btb_io_btb_update_bits_isValid; 
  wire [38:0] btb_io_btb_update_bits_br_pc; 
  wire [1:0] btb_io_btb_update_bits_cfiType; 
  wire  btb_io_bht_update_valid; 
  wire [7:0] btb_io_bht_update_bits_prediction_history; 
  wire [38:0] btb_io_bht_update_bits_pc; 
  wire  btb_io_bht_update_bits_branch; 
  wire  btb_io_bht_update_bits_taken; 
  wire  btb_io_bht_update_bits_mispredict; 
  wire  btb_io_bht_advance_valid; 
  wire  btb_io_bht_advance_bits_bht_value; 
  wire  btb_io_ras_update_valid; 
  wire [1:0] btb_io_ras_update_bits_cfiType; 
  wire [38:0] btb_io_ras_update_bits_returnAddr; 
  wire  btb_io_ras_head_valid; 
  wire [38:0] btb_io_ras_head_bits; 
  wire  btb_io_flush; 
  wire  _T_198; 
  wire  _T_199; 
  wire  _T_200; 
  wire  _T_201; 
  wire  _T_202; 
  wire  _T_203; 
  wire  _T_205; 
  wire  _T_206; 
  wire  _T_207; 
  wire  _T_208; 
  wire  s0_valid; 
  reg  s1_valid; 
  reg [31:0] _RAND_0;
  reg [39:0] s1_pc; 
  reg [63:0] _RAND_1;
  reg  s1_speculative; 
  reg [31:0] _RAND_2;
  reg  s2_valid; 
  reg [31:0] _RAND_3;
  wire [37:0] _T_214; 
  wire [37:0] _T_215; 
  wire [37:0] _T_216; 
  reg [39:0] s2_pc; 
  reg [63:0] _RAND_4;
  reg  s2_btb_resp_valid; 
  reg [31:0] _RAND_5;
  reg  s2_btb_resp_bits_taken; 
  reg [31:0] _RAND_6;
  reg  s2_btb_resp_bits_bridx; 
  reg [31:0] _RAND_7;
  reg [4:0] s2_btb_resp_bits_entry; 
  reg [31:0] _RAND_8;
  reg [7:0] s2_btb_resp_bits_bht_history; 
  reg [31:0] _RAND_9;
  reg  s2_btb_resp_bits_bht_value; 
  reg [31:0] _RAND_10;
  wire  s2_btb_taken; 
  reg  s2_tlb_resp_miss; 
  reg [31:0] _RAND_11;
  reg  s2_tlb_resp_pf_inst; 
  reg [31:0] _RAND_12;
  reg  s2_tlb_resp_ae_inst; 
  reg [31:0] _RAND_13;
  reg  s2_tlb_resp_cacheable; 
  reg [31:0] _RAND_14;
  wire  s2_xcpt; 
  reg  s2_speculative; 
  reg [31:0] _RAND_15;
  reg  s2_partial_insn_valid; 
  reg [31:0] _RAND_16;
  reg [15:0] s2_partial_insn; 
  reg [31:0] _RAND_17;
  reg  wrong_path; 
  reg [31:0] _RAND_18;
  wire [39:0] _T_223; 
  wire [39:0] _T_224; 
  wire [39:0] s1_base_pc; 
  wire [39:0] ntpc; 
  wire  _T_229; 
  wire  _T_230; 
  wire  _T_231; 
  wire  _T_232; 
  reg  _T_235; 
  reg [31:0] _RAND_19;
  wire  s2_replay; 
  wire  _T_233; 
  wire [1:0] _T_295; 
  wire  _T_296; 
  wire  _T_297; 
  wire  taken_prevRVI; 
  wire [15:0] taken_bits; 
  wire [31:0] taken_rviBits; 
  wire [6:0] _T_302; 
  wire  taken_rviJump; 
  wire  taken_rviJALR; 
  wire  _T_490; 
  wire  taken_rviBranch; 
  wire  _T_491; 
  wire  _T_492; 
  wire  _T_493; 
  wire  _T_298; 
  wire  _T_299; 
  wire  taken_valid; 
  wire [15:0] _T_318; 
  wire  taken_rvcJump; 
  wire [15:0] _T_360; 
  wire  _T_361; 
  wire [4:0] _T_362; 
  wire  _T_363; 
  wire  taken_rvcJALR; 
  wire  _T_494; 
  wire  _T_354; 
  wire  taken_rvcJR; 
  wire  _T_495; 
  wire  _T_313; 
  wire  _T_315; 
  wire  taken_rvcBranch; 
  wire  _T_496; 
  wire  _T_497; 
  wire  _T_498; 
  wire  taken_taken; 
  wire  taken_idx; 
  wire  _T_798; 
  wire [1:0] _T_562; 
  wire  _T_563; 
  wire  _T_564; 
  wire  taken_prevRVI_1; 
  wire [15:0] taken_bits_1; 
  wire [31:0] taken_rviBits_1; 
  wire [6:0] _T_570; 
  wire  taken_rviJALR_1; 
  wire  _T_571; 
  wire  _T_572; 
  wire  _T_573; 
  wire [4:0] _T_574; 
  wire [4:0] _T_575; 
  wire  _T_576; 
  wire  taken_rviReturn_1; 
  wire  _T_766; 
  wire  _T_565; 
  wire  _T_566; 
  wire  taken_valid_1; 
  wire [15:0] _T_620; 
  wire  _T_621; 
  wire [4:0] _T_622; 
  wire  _T_623; 
  wire  taken_rvcJR_1; 
  wire [4:0] _T_624; 
  wire [4:0] _T_625; 
  wire  _T_626; 
  wire  taken_rvcReturn_1; 
  wire  _T_767; 
  wire  _T_768; 
  wire  taken_predictReturn_1; 
  wire  _T_807; 
  wire  _T_304; 
  wire  _T_305; 
  wire  _T_306; 
  wire [4:0] _T_307; 
  wire [4:0] _T_308; 
  wire  _T_309; 
  wire  taken_rviReturn; 
  wire  _T_499; 
  wire [4:0] _T_357; 
  wire [4:0] _T_358; 
  wire  _T_359; 
  wire  taken_rvcReturn; 
  wire  _T_500; 
  wire  _T_501; 
  wire  taken_predictReturn; 
  wire  _T_540; 
  wire  _GEN_44; 
  wire  _GEN_77; 
  wire  _GEN_80; 
  wire  useRAS; 
  wire  taken_rviBranch_1; 
  wire  _T_771; 
  wire [15:0] _T_579; 
  wire  _T_580; 
  wire  _T_582; 
  wire  taken_rvcBranch_1; 
  wire  _T_772; 
  wire  _T_773; 
  wire  taken_predictBranch_1; 
  wire  taken_rviJump_1; 
  wire  _T_769; 
  wire  taken_rvcJump_1; 
  wire  _T_770; 
  wire  taken_predictJump_1; 
  wire  _T_808; 
  wire  _T_809; 
  wire [39:0] _T_277; 
  wire [39:0] _T_278; 
  wire [39:0] s2_base_pc; 
  wire [39:0] taken_pc_1; 
  wire [40:0] _T_810; 
  wire [40:0] _T_811; 
  wire [39:0] _T_812; 
  wire [39:0] _T_813; 
  wire [39:0] _T_814; 
  wire  _T_631; 
  wire  _T_633; 
  wire  _T_634; 
  wire  _T_689; 
  wire [10:0] _T_639; 
  wire [10:0] _T_688; 
  wire [11:0] _T_690; 
  wire [7:0] _T_643; 
  wire [7:0] _T_644; 
  wire [7:0] _T_686; 
  wire  _T_650; 
  wire  _T_651; 
  wire  _T_654; 
  wire  _T_685; 
  wire [8:0] _T_687; 
  wire [20:0] _T_691; 
  wire [5:0] _T_661; 
  wire [3:0] _T_667; 
  wire [3:0] _T_670; 
  wire [9:0] _T_683; 
  wire [10:0] _T_684; 
  wire [31:0] _T_692; 
  wire [31:0] _T_693; 
  wire [7:0] _T_707; 
  wire [7:0] _T_748; 
  wire  _T_747; 
  wire [8:0] _T_749; 
  wire [20:0] _T_753; 
  wire [9:0] _T_745; 
  wire [10:0] _T_746; 
  wire [31:0] _T_754; 
  wire [31:0] _T_755; 
  wire [31:0] taken_rviImm_1; 
  wire  _T_587; 
  wire  _T_588; 
  wire [4:0] _T_590; 
  wire [1:0] _T_591; 
  wire [6:0] _T_597; 
  wire  _T_592; 
  wire [7:0] _T_598; 
  wire [1:0] _T_593; 
  wire [1:0] _T_594; 
  wire [3:0] _T_595; 
  wire [4:0] _T_596; 
  wire [12:0] _T_599; 
  wire [12:0] _T_600; 
  wire [9:0] _T_603; 
  wire  _T_604; 
  wire [10:0] _T_615; 
  wire [1:0] _T_605; 
  wire [12:0] _T_616; 
  wire  _T_606; 
  wire  _T_607; 
  wire [1:0] _T_614; 
  wire [14:0] _T_617; 
  wire  _T_609; 
  wire [1:0] _T_612; 
  wire [2:0] _T_610; 
  wire [3:0] _T_611; 
  wire [5:0] _T_613; 
  wire [20:0] _T_618; 
  wire [20:0] _T_619; 
  wire [20:0] taken_rvcImm_1; 
  wire [31:0] _T_815; 
  wire [39:0] _GEN_126; 
  wire [39:0] _T_817; 
  wire [39:0] taken_npc_1; 
  wire [39:0] _T_818; 
  wire  _T_504; 
  wire  _T_505; 
  wire  _T_506; 
  wire  taken_predictBranch; 
  wire  _T_502; 
  wire  _T_503; 
  wire  taken_predictJump; 
  wire  _T_541; 
  wire  _T_542; 
  wire [39:0] _T_543; 
  wire  _T_364; 
  wire  _T_366; 
  wire  _T_367; 
  wire  _T_422; 
  wire [10:0] _T_372; 
  wire [10:0] _T_421; 
  wire [11:0] _T_423; 
  wire [7:0] _T_376; 
  wire [7:0] _T_377; 
  wire [7:0] _T_419; 
  wire  _T_383; 
  wire  _T_384; 
  wire  _T_387; 
  wire  _T_418; 
  wire [8:0] _T_420; 
  wire [20:0] _T_424; 
  wire [5:0] _T_394; 
  wire [3:0] _T_400; 
  wire [3:0] _T_403; 
  wire [9:0] _T_416; 
  wire [10:0] _T_417; 
  wire [31:0] _T_425; 
  wire [31:0] _T_426; 
  wire [7:0] _T_440; 
  wire [7:0] _T_481; 
  wire  _T_480; 
  wire [8:0] _T_482; 
  wire [20:0] _T_486; 
  wire [9:0] _T_478; 
  wire [10:0] _T_479; 
  wire [31:0] _T_487; 
  wire [31:0] _T_488; 
  wire [31:0] taken_rviImm; 
  wire [32:0] _T_544; 
  wire  _T_320; 
  wire  _T_321; 
  wire [4:0] _T_323; 
  wire [1:0] _T_324; 
  wire [6:0] _T_330; 
  wire  _T_325; 
  wire [7:0] _T_331; 
  wire [1:0] _T_326; 
  wire [1:0] _T_327; 
  wire [3:0] _T_328; 
  wire [4:0] _T_329; 
  wire [12:0] _T_332; 
  wire [12:0] _T_333; 
  wire [9:0] _T_336; 
  wire  _T_337; 
  wire [10:0] _T_348; 
  wire [1:0] _T_338; 
  wire [12:0] _T_349; 
  wire  _T_339; 
  wire  _T_340; 
  wire [1:0] _T_347; 
  wire [14:0] _T_350; 
  wire  _T_342; 
  wire [1:0] _T_345; 
  wire [2:0] _T_343; 
  wire [3:0] _T_344; 
  wire [5:0] _T_346; 
  wire [20:0] _T_351; 
  wire [20:0] _T_352; 
  wire [20:0] taken_rvcImm; 
  wire [32:0] _T_545; 
  wire [39:0] _GEN_127; 
  wire [39:0] _T_547; 
  wire [39:0] taken_npc; 
  wire [39:0] _T_548; 
  wire  predicted_taken; 
  wire  _T_275; 
  wire [39:0] _T_276; 
  wire [39:0] _GEN_27; 
  wire [39:0] _GEN_42; 
  wire [39:0] _GEN_45; 
  wire [39:0] _GEN_78; 
  wire [39:0] _GEN_81; 
  wire [39:0] _GEN_98; 
  wire [39:0] predicted_npc; 
  wire [39:0] npc; 
  wire  _T_237; 
  wire  _T_238; 
  wire  _T_239; 
  wire  s0_speculative; 
  wire  _T_243; 
  wire  _T_757; 
  wire  _T_758; 
  wire  _T_759; 
  wire  _T_760; 
  wire  _T_628; 
  wire  taken_rvcJALR_1; 
  wire  _T_761; 
  wire  _T_762; 
  wire  _T_763; 
  wire  _T_764; 
  wire  _T_765; 
  wire  taken_taken_1; 
  wire  taken; 
  wire  _GEN_115; 
  wire  _GEN_119; 
  wire  s2_redirect; 
  wire  _T_244; 
  wire  _T_248; 
  wire  _T_250; 
  wire  _T_251; 
  reg  _T_254; 
  reg [31:0] _RAND_20;
  wire  _T_255; 
  wire  _T_256; 
  wire  _T_257; 
  wire  _T_258; 
  wire [39:0] _T_260; 
  wire [39:0] _T_261; 
  wire [39:0] _T_262; 
  wire  _T_264; 
  wire [2:0] _T_265; 
  wire  _T_266; 
  wire  _T_267; 
  wire  _T_268; 
  wire  _T_269; 
  wire  _T_271; 
  wire  _T_283; 
  wire  _T_284; 
  wire  fetch_bubble_likely; 
  wire  _T_286; 
  wire  _T_287; 
  wire  _T_288; 
  wire  _T_825; 
  wire  _T_827; 
  wire  _T_828; 
  wire  _T_829; 
  wire  _T_830; 
  wire  _T_557; 
  wire  _T_558; 
  wire  _T_559; 
  wire  _T_560; 
  wire  _GEN_91; 
  wire  updateBTB; 
  wire  _T_289; 
  wire [1:0] _GEN_128; 
  wire [1:0] _T_290; 
  wire [39:0] _GEN_129; 
  wire [39:0] _T_291; 
  wire [39:0] _GEN_35; 
  wire [39:0] _GEN_36; 
  wire [1:0] after_idx; 
  wire [2:0] _GEN_130; 
  wire [2:0] _T_292; 
  wire [39:0] _GEN_131; 
  wire [39:0] _T_294; 
  wire  _T_310; 
  wire  taken_rviCall; 
  wire  _T_507; 
  wire  _T_508; 
  wire  _T_509; 
  wire  _T_510; 
  wire  _T_512; 
  wire  _GEN_38; 
  wire  _GEN_39; 
  wire  _T_517; 
  wire  _T_518; 
  wire  _T_519; 
  wire  _T_520; 
  wire  _T_521; 
  wire  _T_522; 
  wire  _T_523; 
  wire  _T_524; 
  wire  _T_525; 
  wire  _T_528; 
  wire [1:0] _T_529; 
  wire [1:0] _T_530; 
  wire  _T_533; 
  wire  _T_534; 
  wire  _T_535; 
  wire  _T_536; 
  wire  _T_537; 
  wire  _T_538; 
  wire  _T_539; 
  wire  _GEN_46; 
  wire [1:0] _T_567; 
  wire  taken_rvc_1; 
  wire  _T_577; 
  wire  taken_rviCall_1; 
  wire  _T_776; 
  wire  _T_777; 
  wire  _T_778; 
  wire  _T_779; 
  wire  _T_784; 
  wire  _T_785; 
  wire  _T_786; 
  wire  _T_787; 
  wire  _T_788; 
  wire  _T_789; 
  wire  _T_790; 
  wire  _T_791; 
  wire  _T_792; 
  wire  _T_795; 
  wire [1:0] _T_796; 
  wire [1:0] _T_797; 
  wire  _T_800; 
  wire  _T_801; 
  wire  _T_802; 
  wire  _T_803; 
  wire  _T_804; 
  wire  _T_805; 
  wire  _T_806; 
  wire  _GEN_82; 
  wire  _T_833; 
  wire  _T_835; 
  wire [15:0] _T_836; 
  wire  _T_838; 
  wire  _T_839; 
  wire  _GEN_116; 
  wire  _GEN_117; 
  wire [4:0] _GEN_118; 
  wire  _T_842; 
  wire  _T_844; 
  wire  _T_846; 
  wire  _T_847; 

  assign icache_auto_master_out_a_bits_address[37:32] = 6'h0; 

  ICache icache ( 
    .clock(icache_clock),
    .reset(icache_reset),
    .auto_master_out_a_ready(icache_auto_master_out_a_ready),
    .auto_master_out_a_valid(icache_auto_master_out_a_valid),
    .auto_master_out_a_bits_address({icache_auto_master_out_a_bits_address[31:0]}),
    .auto_master_out_d_valid(icache_auto_master_out_d_valid),
    .auto_master_out_d_bits_opcode(icache_auto_master_out_d_bits_opcode),
    .auto_master_out_d_bits_size({1'b0, icache_auto_master_out_d_bits_size}),
    .auto_master_out_d_bits_data(icache_auto_master_out_d_bits_data),
    .auto_master_out_d_bits_corrupt(icache_auto_master_out_d_bits_corrupt),
    .io_req_ready(icache_io_req_ready),
    .io_req_valid(icache_io_req_valid),
    .io_req_bits_addr(icache_io_req_bits_addr),
    .io_s1_paddr({icache_io_s1_paddr[31:0]}),
    .io_s1_kill(icache_io_s1_kill),
    .io_s2_kill(icache_io_s2_kill),
    .io_resp_valid(icache_io_resp_valid),
    .io_resp_bits_data(icache_io_resp_bits_data),
    .io_resp_bits_ae(icache_io_resp_bits_ae),
    .io_invalidate(icache_io_invalidate)
  );
  ShiftQueue fq ( 
    .clock(fq_clock),
    .reset(fq_reset),
    .io_enq_ready(fq_io_enq_ready),
    .io_enq_valid(fq_io_enq_valid),
    .io_enq_bits_btb_taken(fq_io_enq_bits_btb_taken),
    .io_enq_bits_btb_bridx(fq_io_enq_bits_btb_bridx),
    .io_enq_bits_btb_entry(fq_io_enq_bits_btb_entry),
    .io_enq_bits_btb_bht_history(fq_io_enq_bits_btb_bht_history),
    .io_enq_bits_pc(fq_io_enq_bits_pc),
    .io_enq_bits_data(fq_io_enq_bits_data),
    // .io_enq_bits_mask(fq_io_enq_bits_mask),
    .io_enq_bits_xcpt_pf_inst(fq_io_enq_bits_xcpt_pf_inst),
    .io_enq_bits_xcpt_ae_inst(fq_io_enq_bits_xcpt_ae_inst),
    .io_enq_bits_replay(fq_io_enq_bits_replay),
    .io_deq_ready(fq_io_deq_ready),
    .io_deq_valid(fq_io_deq_valid),
    .io_deq_bits_btb_taken(fq_io_deq_bits_btb_taken),
    .io_deq_bits_btb_bridx(fq_io_deq_bits_btb_bridx),
    .io_deq_bits_btb_entry(fq_io_deq_bits_btb_entry),
    .io_deq_bits_btb_bht_history(fq_io_deq_bits_btb_bht_history),
    .io_deq_bits_pc(fq_io_deq_bits_pc),
    .io_deq_bits_data(fq_io_deq_bits_data),
    .io_deq_bits_xcpt_pf_inst(fq_io_deq_bits_xcpt_pf_inst),
    .io_deq_bits_xcpt_ae_inst(fq_io_deq_bits_xcpt_ae_inst),
    .io_deq_bits_replay(fq_io_deq_bits_replay),
    .io_mask(fq_io_mask)
  );
  TLB_1 tlb ( 
    .clock(tlb_clock),
    .reset(tlb_reset),
    .io_req_ready(tlb_io_req_ready),
    .io_req_valid(tlb_io_req_valid),
    .io_req_bits_vaddr(tlb_io_req_bits_vaddr),
    .io_resp_miss(tlb_io_resp_miss),
    .io_resp_paddr(tlb_io_resp_paddr),
    .io_resp_pf_inst(tlb_io_resp_pf_inst),
    .io_resp_ae_inst(tlb_io_resp_ae_inst),
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
    .io_ptw_status_prv(tlb_io_ptw_status_prv),
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
  BTB btb ( 
    .clock(btb_clock),
    .reset(btb_reset),
    .io_req_bits_addr(btb_io_req_bits_addr),
    .io_resp_valid(btb_io_resp_valid),
    .io_resp_bits_taken(btb_io_resp_bits_taken),
    .io_resp_bits_bridx(btb_io_resp_bits_bridx),
    .io_resp_bits_target(btb_io_resp_bits_target),
    .io_resp_bits_entry(btb_io_resp_bits_entry),
    .io_resp_bits_bht_history(btb_io_resp_bits_bht_history),
    .io_resp_bits_bht_value(btb_io_resp_bits_bht_value),
    .io_btb_update_valid(btb_io_btb_update_valid),
    .io_btb_update_bits_prediction_entry(btb_io_btb_update_bits_prediction_entry),
    .io_btb_update_bits_pc(btb_io_btb_update_bits_pc),
    .io_btb_update_bits_isValid(btb_io_btb_update_bits_isValid),
    .io_btb_update_bits_br_pc(btb_io_btb_update_bits_br_pc),
    .io_btb_update_bits_cfiType(btb_io_btb_update_bits_cfiType),
    .io_bht_update_valid(btb_io_bht_update_valid),
    .io_bht_update_bits_prediction_history(btb_io_bht_update_bits_prediction_history),
    .io_bht_update_bits_pc(btb_io_bht_update_bits_pc),
    .io_bht_update_bits_branch(btb_io_bht_update_bits_branch),
    .io_bht_update_bits_taken(btb_io_bht_update_bits_taken),
    .io_bht_update_bits_mispredict(btb_io_bht_update_bits_mispredict),
    .io_bht_advance_valid(btb_io_bht_advance_valid),
    .io_bht_advance_bits_bht_value(btb_io_bht_advance_bits_bht_value),
    .io_ras_update_valid(btb_io_ras_update_valid),
    .io_ras_update_bits_cfiType(btb_io_ras_update_bits_cfiType),
    .io_ras_update_bits_returnAddr(btb_io_ras_update_bits_returnAddr),
    .io_ras_head_valid(btb_io_ras_head_valid),
    .io_ras_head_bits(btb_io_ras_head_bits),
    .io_flush(btb_io_flush)
  );
  assign _T_198 = io_cpu_req_valid | io_cpu_sfence_valid; 
  assign _T_199 = _T_198 | io_cpu_flush_icache; 
  assign _T_200 = _T_199 | io_cpu_bht_update_valid; 
  assign _T_201 = _T_200 | io_cpu_btb_update_valid; 
  assign _T_202 = _T_201 == 1'h0; 
  assign _T_203 = _T_202 | io_cpu_might_request; 
  assign _T_205 = _T_203 | reset; 
  assign _T_206 = _T_205 == 1'h0; 
  assign _T_207 = fq_io_mask[2]; 
  assign _T_208 = _T_207 == 1'h0; 
  assign s0_valid = io_cpu_req_valid | _T_208; 
  assign _T_214 = ~ io_reset_vector; 
  assign _T_215 = _T_214 | 38'h1; 
  assign _T_216 = ~ _T_215; 
  assign s2_btb_taken = s2_btb_resp_valid & s2_btb_resp_bits_taken; 
  assign s2_xcpt = s2_tlb_resp_ae_inst | s2_tlb_resp_pf_inst; 
  assign _T_223 = ~ s1_pc; 
  assign _T_224 = _T_223 | 40'h3; 
  assign s1_base_pc = ~ _T_224; 
  assign ntpc = s1_base_pc + 40'h4; 
  assign _T_229 = fq_io_enq_ready & fq_io_enq_valid; 
  assign _T_230 = _T_229 == 1'h0; 
  assign _T_231 = s2_valid & _T_230; 
  assign _T_232 = s0_valid == 1'h0; 
  assign s2_replay = _T_231 | _T_235; 
  assign _T_233 = s2_replay & _T_232; 
  assign _T_295 = s2_partial_insn[1:0]; 
  assign _T_296 = _T_295 != 2'h3; 
  assign _T_297 = _T_296 == 1'h0; 
  assign taken_prevRVI = s2_partial_insn_valid & _T_297; 
  assign taken_bits = fq_io_enq_bits_data[15:0]; 
  assign taken_rviBits = {taken_bits,s2_partial_insn}; 
  assign _T_302 = taken_rviBits[6:0]; 
  assign taken_rviJump = _T_302 == 7'h6f; 
  assign taken_rviJALR = _T_302 == 7'h67; 
  assign _T_490 = taken_rviJump | taken_rviJALR; 
  assign taken_rviBranch = _T_302 == 7'h63; 
  assign _T_491 = taken_rviBranch & s2_btb_resp_bits_bht_value; 
  assign _T_492 = _T_490 | _T_491; 
  assign _T_493 = taken_prevRVI & _T_492; 
  assign _T_298 = fq_io_enq_bits_mask[0]; 
  assign _T_299 = taken_prevRVI == 1'h0; 
  assign taken_valid = _T_298 & _T_299; 
  assign _T_318 = taken_bits & 16'he003; 
  assign taken_rvcJump = 16'ha001 == _T_318; 
  assign _T_360 = taken_bits & 16'hf003; 
  assign _T_361 = 16'h9002 == _T_360; 
  assign _T_362 = taken_bits[6:2]; 
  assign _T_363 = _T_362 == 5'h0; 
  assign taken_rvcJALR = _T_361 & _T_363; 
  assign _T_494 = taken_rvcJump | taken_rvcJALR; 
  assign _T_354 = 16'h8002 == _T_360; 
  assign taken_rvcJR = _T_354 & _T_363; 
  assign _T_495 = _T_494 | taken_rvcJR; 
  assign _T_313 = 16'hc001 == _T_318; 
  assign _T_315 = 16'he001 == _T_318; 
  assign taken_rvcBranch = _T_313 | _T_315; 
  assign _T_496 = taken_rvcBranch & s2_btb_resp_bits_bht_value; 
  assign _T_497 = _T_495 | _T_496; 
  assign _T_498 = taken_valid & _T_497; 
  assign taken_taken = _T_493 | _T_498; 
  assign taken_idx = taken_taken == 1'h0; 
  assign _T_798 = s2_btb_taken == 1'h0; 
  assign _T_562 = taken_bits[1:0]; 
  assign _T_563 = _T_562 != 2'h3; 
  assign _T_564 = _T_563 == 1'h0; 
  assign taken_prevRVI_1 = taken_valid & _T_564; 
  assign taken_bits_1 = fq_io_enq_bits_data[31:16]; 
  assign taken_rviBits_1 = {taken_bits_1,taken_bits}; 
  assign _T_570 = taken_rviBits_1[6:0]; 
  assign taken_rviJALR_1 = _T_570 == 7'h67; 
  assign _T_571 = taken_rviBits_1[7]; 
  assign _T_572 = _T_571 == 1'h0; 
  assign _T_573 = taken_rviJALR_1 & _T_572; 
  assign _T_574 = taken_rviBits_1[19:15]; 
  assign _T_575 = _T_574 & 5'h1b; 
  assign _T_576 = 5'h1 == _T_575; 
  assign taken_rviReturn_1 = _T_573 & _T_576; 
  assign _T_766 = taken_prevRVI_1 & taken_rviReturn_1; 
  assign _T_565 = fq_io_enq_bits_mask[1]; 
  assign _T_566 = taken_prevRVI_1 == 1'h0; 
  assign taken_valid_1 = _T_565 & _T_566; 
  assign _T_620 = taken_bits_1 & 16'hf003; 
  assign _T_621 = 16'h8002 == _T_620; 
  assign _T_622 = taken_bits_1[6:2]; 
  assign _T_623 = _T_622 == 5'h0; 
  assign taken_rvcJR_1 = _T_621 & _T_623; 
  assign _T_624 = taken_bits_1[11:7]; 
  assign _T_625 = _T_624 & 5'h1b; 
  assign _T_626 = 5'h1 == _T_625; 
  assign taken_rvcReturn_1 = taken_rvcJR_1 & _T_626; 
  assign _T_767 = taken_valid_1 & taken_rvcReturn_1; 
  assign _T_768 = _T_766 | _T_767; 
  assign taken_predictReturn_1 = btb_io_ras_head_valid & _T_768; 
  assign _T_807 = s2_valid & taken_predictReturn_1; 
  assign _T_304 = taken_rviBits[7]; 
  assign _T_305 = _T_304 == 1'h0; 
  assign _T_306 = taken_rviJALR & _T_305; 
  assign _T_307 = taken_rviBits[19:15]; 
  assign _T_308 = _T_307 & 5'h1b; 
  assign _T_309 = 5'h1 == _T_308; 
  assign taken_rviReturn = _T_306 & _T_309; 
  assign _T_499 = taken_prevRVI & taken_rviReturn; 
  assign _T_357 = taken_bits[11:7]; 
  assign _T_358 = _T_357 & 5'h1b; 
  assign _T_359 = 5'h1 == _T_358; 
  assign taken_rvcReturn = taken_rvcJR & _T_359; 
  assign _T_500 = taken_valid & taken_rvcReturn; 
  assign _T_501 = _T_499 | _T_500; 
  assign taken_predictReturn = btb_io_ras_head_valid & _T_501; 
  assign _T_540 = s2_valid & taken_predictReturn; 
  assign _GEN_44 = _T_798 ? _T_540 : 1'h0; 
  assign _GEN_77 = _T_807 ? 1'h1 : _GEN_44; 
  assign _GEN_80 = _T_798 ? _GEN_77 : _GEN_44; 
  assign useRAS = taken_idx ? _GEN_80 : _GEN_44; 
  assign taken_rviBranch_1 = _T_570 == 7'h63; 
  assign _T_771 = taken_prevRVI_1 & taken_rviBranch_1; 
  assign _T_579 = taken_bits_1 & 16'he003; 
  assign _T_580 = 16'hc001 == _T_579; 
  assign _T_582 = 16'he001 == _T_579; 
  assign taken_rvcBranch_1 = _T_580 | _T_582; 
  assign _T_772 = taken_valid_1 & taken_rvcBranch_1; 
  assign _T_773 = _T_771 | _T_772; 
  assign taken_predictBranch_1 = s2_btb_resp_bits_bht_value & _T_773; 
  assign taken_rviJump_1 = _T_570 == 7'h6f; 
  assign _T_769 = taken_prevRVI_1 & taken_rviJump_1; 
  assign taken_rvcJump_1 = 16'ha001 == _T_579; 
  assign _T_770 = taken_valid_1 & taken_rvcJump_1; 
  assign taken_predictJump_1 = _T_769 | _T_770; 
  assign _T_808 = taken_predictBranch_1 | taken_predictJump_1; 
  assign _T_809 = s2_valid & _T_808; 
  assign _T_277 = ~ s2_pc; 
  assign _T_278 = _T_277 | 40'h3; 
  assign s2_base_pc = ~ _T_278; 
  assign taken_pc_1 = s2_base_pc | 40'h2; 
  assign _T_810 = taken_pc_1 - 40'h2; 
  assign _T_811 = $unsigned(_T_810); 
  assign _T_812 = _T_811[39:0]; 
  assign _T_813 = taken_prevRVI_1 ? _T_812 : taken_pc_1; 
  assign _T_814 = $signed(_T_813); 
  assign _T_631 = taken_rviBits_1[3]; 
  assign _T_633 = taken_rviBits_1[31]; 
  assign _T_634 = $signed(_T_633); 
  assign _T_689 = $unsigned(_T_634); 
  assign _T_639 = {11{_T_634}}; 
  assign _T_688 = $unsigned(_T_639); 
  assign _T_690 = {_T_689,_T_688}; 
  assign _T_643 = taken_rviBits_1[19:12]; 
  assign _T_644 = $signed(_T_643); 
  assign _T_686 = $unsigned(_T_644); 
  assign _T_650 = taken_rviBits_1[20]; 
  assign _T_651 = $signed(_T_650); 
  assign _T_654 = $signed(_T_571); 
  assign _T_685 = $unsigned(_T_651); 
  assign _T_687 = {_T_686,_T_685}; 
  assign _T_691 = {_T_690,_T_687}; 
  assign _T_661 = taken_rviBits_1[30:25]; 
  assign _T_667 = taken_rviBits_1[11:8]; 
  assign _T_670 = taken_rviBits_1[24:21]; 
  assign _T_683 = {_T_661,_T_670}; 
  assign _T_684 = {_T_683,1'h0}; 
  assign _T_692 = {_T_691,_T_684}; 
  assign _T_693 = $signed(_T_692); 
  assign _T_707 = {8{_T_634}}; 
  assign _T_748 = $unsigned(_T_707); 
  assign _T_747 = $unsigned(_T_654); 
  assign _T_749 = {_T_748,_T_747}; 
  assign _T_753 = {_T_690,_T_749}; 
  assign _T_745 = {_T_661,_T_667}; 
  assign _T_746 = {_T_745,1'h0}; 
  assign _T_754 = {_T_753,_T_746}; 
  assign _T_755 = $signed(_T_754); 
  assign taken_rviImm_1 = _T_631 ? $signed(_T_693) : $signed(_T_755); 
  assign _T_587 = taken_bits_1[14]; 
  assign _T_588 = taken_bits_1[12]; 
  assign _T_590 = _T_588 ? 5'h1f : 5'h0; 
  assign _T_591 = taken_bits_1[6:5]; 
  assign _T_597 = {_T_590,_T_591}; 
  assign _T_592 = taken_bits_1[2]; 
  assign _T_598 = {_T_597,_T_592}; 
  assign _T_593 = taken_bits_1[11:10]; 
  assign _T_594 = taken_bits_1[4:3]; 
  assign _T_595 = {_T_593,_T_594}; 
  assign _T_596 = {_T_595,1'h0}; 
  assign _T_599 = {_T_598,_T_596}; 
  assign _T_600 = $signed(_T_599); 
  assign _T_603 = _T_588 ? 10'h3ff : 10'h0; 
  assign _T_604 = taken_bits_1[8]; 
  assign _T_615 = {_T_603,_T_604}; 
  assign _T_605 = taken_bits_1[10:9]; 
  assign _T_616 = {_T_615,_T_605}; 
  assign _T_606 = taken_bits_1[6]; 
  assign _T_607 = taken_bits_1[7]; 
  assign _T_614 = {_T_606,_T_607}; 
  assign _T_617 = {_T_616,_T_614}; 
  assign _T_609 = taken_bits_1[11]; 
  assign _T_612 = {_T_592,_T_609}; 
  assign _T_610 = taken_bits_1[5:3]; 
  assign _T_611 = {_T_610,1'h0}; 
  assign _T_613 = {_T_612,_T_611}; 
  assign _T_618 = {_T_617,_T_613}; 
  assign _T_619 = $signed(_T_618); 
  assign taken_rvcImm_1 = _T_587 ? $signed({{8{_T_600[12]}},_T_600}) : $signed(_T_619); 
  assign _T_815 = taken_prevRVI_1 ? $signed(taken_rviImm_1) : $signed({{11{taken_rvcImm_1[20]}},taken_rvcImm_1}); 
  assign _GEN_126 = {{8{_T_815[31]}},_T_815}; 
  assign _T_817 = $signed(_T_814) + $signed(_GEN_126); 
  assign taken_npc_1 = $signed(_T_817); 
  assign _T_818 = $unsigned(taken_npc_1); 
  assign _T_504 = taken_prevRVI & taken_rviBranch; 
  assign _T_505 = taken_valid & taken_rvcBranch; 
  assign _T_506 = _T_504 | _T_505; 
  assign taken_predictBranch = s2_btb_resp_bits_bht_value & _T_506; 
  assign _T_502 = taken_prevRVI & taken_rviJump; 
  assign _T_503 = taken_valid & taken_rvcJump; 
  assign taken_predictJump = _T_502 | _T_503; 
  assign _T_541 = taken_predictBranch | taken_predictJump; 
  assign _T_542 = s2_valid & _T_541; 
  assign _T_543 = $signed(s2_base_pc); 
  assign _T_364 = taken_rviBits[3]; 
  assign _T_366 = taken_rviBits[31]; 
  assign _T_367 = $signed(_T_366); 
  assign _T_422 = $unsigned(_T_367); 
  assign _T_372 = {11{_T_367}}; 
  assign _T_421 = $unsigned(_T_372); 
  assign _T_423 = {_T_422,_T_421}; 
  assign _T_376 = taken_rviBits[19:12]; 
  assign _T_377 = $signed(_T_376); 
  assign _T_419 = $unsigned(_T_377); 
  assign _T_383 = taken_rviBits[20]; 
  assign _T_384 = $signed(_T_383); 
  assign _T_387 = $signed(_T_304); 
  assign _T_418 = $unsigned(_T_384); 
  assign _T_420 = {_T_419,_T_418}; 
  assign _T_424 = {_T_423,_T_420}; 
  assign _T_394 = taken_rviBits[30:25]; 
  assign _T_400 = taken_rviBits[11:8]; 
  assign _T_403 = taken_rviBits[24:21]; 
  assign _T_416 = {_T_394,_T_403}; 
  assign _T_417 = {_T_416,1'h0}; 
  assign _T_425 = {_T_424,_T_417}; 
  assign _T_426 = $signed(_T_425); 
  assign _T_440 = {8{_T_367}}; 
  assign _T_481 = $unsigned(_T_440); 
  assign _T_480 = $unsigned(_T_387); 
  assign _T_482 = {_T_481,_T_480}; 
  assign _T_486 = {_T_423,_T_482}; 
  assign _T_478 = {_T_394,_T_400}; 
  assign _T_479 = {_T_478,1'h0}; 
  assign _T_487 = {_T_486,_T_479}; 
  assign _T_488 = $signed(_T_487); 
  assign taken_rviImm = _T_364 ? $signed(_T_426) : $signed(_T_488); 
  assign _T_544 = $signed(taken_rviImm) - $signed(32'sh2); 
  assign _T_320 = taken_bits[14]; 
  assign _T_321 = taken_bits[12]; 
  assign _T_323 = _T_321 ? 5'h1f : 5'h0; 
  assign _T_324 = taken_bits[6:5]; 
  assign _T_330 = {_T_323,_T_324}; 
  assign _T_325 = taken_bits[2]; 
  assign _T_331 = {_T_330,_T_325}; 
  assign _T_326 = taken_bits[11:10]; 
  assign _T_327 = taken_bits[4:3]; 
  assign _T_328 = {_T_326,_T_327}; 
  assign _T_329 = {_T_328,1'h0}; 
  assign _T_332 = {_T_331,_T_329}; 
  assign _T_333 = $signed(_T_332); 
  assign _T_336 = _T_321 ? 10'h3ff : 10'h0; 
  assign _T_337 = taken_bits[8]; 
  assign _T_348 = {_T_336,_T_337}; 
  assign _T_338 = taken_bits[10:9]; 
  assign _T_349 = {_T_348,_T_338}; 
  assign _T_339 = taken_bits[6]; 
  assign _T_340 = taken_bits[7]; 
  assign _T_347 = {_T_339,_T_340}; 
  assign _T_350 = {_T_349,_T_347}; 
  assign _T_342 = taken_bits[11]; 
  assign _T_345 = {_T_325,_T_342}; 
  assign _T_343 = taken_bits[5:3]; 
  assign _T_344 = {_T_343,1'h0}; 
  assign _T_346 = {_T_345,_T_344}; 
  assign _T_351 = {_T_350,_T_346}; 
  assign _T_352 = $signed(_T_351); 
  assign taken_rvcImm = _T_320 ? $signed({{8{_T_333[12]}},_T_333}) : $signed(_T_352); 
  assign _T_545 = taken_prevRVI ? $signed(_T_544) : $signed({{12{taken_rvcImm[20]}},taken_rvcImm}); 
  assign _GEN_127 = {{7{_T_545[32]}},_T_545}; 
  assign _T_547 = $signed(_T_543) + $signed(_GEN_127); 
  assign taken_npc = $signed(_T_547); 
  assign _T_548 = $unsigned(taken_npc); 
  assign predicted_taken = btb_io_resp_valid & btb_io_resp_bits_taken; 
  assign _T_275 = btb_io_resp_bits_target[38]; 
  assign _T_276 = {_T_275,btb_io_resp_bits_target}; 
  assign _GEN_27 = predicted_taken ? _T_276 : ntpc; 
  assign _GEN_42 = _T_542 ? _T_548 : _GEN_27; 
  assign _GEN_45 = _T_798 ? _GEN_42 : _GEN_27; 
  assign _GEN_78 = _T_809 ? _T_818 : _GEN_45; 
  assign _GEN_81 = _T_798 ? _GEN_78 : _GEN_45; 
  assign _GEN_98 = taken_idx ? _GEN_81 : _GEN_45; 
  assign predicted_npc = useRAS ? {{1'd0}, btb_io_ras_head_bits} : _GEN_98; 
  assign npc = s2_replay ? s2_pc : predicted_npc; 
  assign _T_237 = s2_speculative == 1'h0; 
  assign _T_238 = s2_valid & _T_237; 
  assign _T_239 = s1_speculative | _T_238; 
  assign s0_speculative = _T_239 | predicted_taken; 
  assign _T_243 = s2_replay == 1'h0; 
  assign _T_757 = taken_rviJump_1 | taken_rviJALR_1; 
  assign _T_758 = taken_rviBranch_1 & s2_btb_resp_bits_bht_value; 
  assign _T_759 = _T_757 | _T_758; 
  assign _T_760 = taken_prevRVI_1 & _T_759; 
  assign _T_628 = 16'h9002 == _T_620; 
  assign taken_rvcJALR_1 = _T_628 & _T_623; 
  assign _T_761 = taken_rvcJump_1 | taken_rvcJALR_1; 
  assign _T_762 = _T_761 | taken_rvcJR_1; 
  assign _T_763 = taken_rvcBranch_1 & s2_btb_resp_bits_bht_value; 
  assign _T_764 = _T_762 | _T_763; 
  assign _T_765 = taken_valid_1 & _T_764; 
  assign taken_taken_1 = _T_760 | _T_765; 
  assign taken = taken_taken | taken_taken_1; 
  assign _GEN_115 = _T_229 ? 1'h1 : io_cpu_req_valid; 
  assign _GEN_119 = taken ? _GEN_115 : io_cpu_req_valid; 
  assign s2_redirect = _T_798 ? _GEN_119 : io_cpu_req_valid; 
  assign _T_244 = s2_redirect == 1'h0; 
  assign _T_248 = s2_redirect | tlb_io_resp_miss; 
  assign _T_250 = s2_tlb_resp_cacheable == 1'h0; 
  assign _T_251 = s2_speculative & _T_250; 
  assign _T_255 = _T_254 & s2_valid; 
  assign _T_256 = s2_tlb_resp_miss == 1'h0; 
  assign _T_257 = _T_256 & icache_io_s2_kill; 
  assign _T_258 = icache_io_resp_valid | _T_257; 
  assign _T_260 = io_cpu_req_valid ? io_cpu_req_bits_pc : npc; 
  assign _T_261 = ~ _T_260; 
  assign _T_262 = _T_261 | 40'h1; 
  assign _T_264 = s2_pc[1]; 
  assign _T_265 = 3'h3 << _T_264; 
  assign _T_266 = icache_io_resp_valid == 1'h0; 
  assign _T_267 = icache_io_s2_kill & _T_266; 
  assign _T_268 = s2_xcpt == 1'h0; 
  assign _T_269 = _T_267 & _T_268; 
  assign _T_271 = icache_io_resp_valid & icache_io_resp_bits_ae; 
  assign _T_283 = io_cpu_btb_update_valid == 1'h0; 
  assign _T_284 = fq_io_mask[1]; 
  assign fetch_bubble_likely = _T_284 == 1'h0; 
  assign _T_286 = wrong_path == 1'h0; 
  assign _T_287 = _T_229 & _T_286; 
  assign _T_288 = _T_287 & fetch_bubble_likely; 
  assign _T_825 = s2_btb_resp_valid == 1'h0; 
  assign _T_827 = taken_predictBranch_1 & s2_btb_resp_bits_bht_value; 
  assign _T_828 = _T_827 | taken_predictJump_1; 
  assign _T_829 = _T_828 | taken_predictReturn_1; 
  assign _T_830 = _T_825 & _T_829; 
  assign _T_557 = taken_predictBranch & s2_btb_resp_bits_bht_value; 
  assign _T_558 = _T_557 | taken_predictJump; 
  assign _T_559 = _T_558 | taken_predictReturn; 
  assign _T_560 = _T_825 & _T_559; 
  assign _GEN_91 = _T_830 ? 1'h1 : _T_560; 
  assign updateBTB = taken_idx ? _GEN_91 : _T_560; 
  assign _T_289 = _T_288 & updateBTB; 
  assign _GEN_128 = {{1'd0}, taken_idx}; 
  assign _T_290 = _GEN_128 << 1; 
  assign _GEN_129 = {{38'd0}, _T_290}; 
  assign _T_291 = s2_base_pc | _GEN_129; 
  assign _GEN_35 = _T_283 ? _T_291 : {{1'd0}, io_cpu_btb_update_bits_br_pc}; 
  assign _GEN_36 = _T_283 ? s2_base_pc : {{1'd0}, io_cpu_btb_update_bits_pc}; 
  assign after_idx = taken_idx ? 2'h2 : 2'h1; 
  assign _GEN_130 = {{1'd0}, after_idx}; 
  assign _T_292 = _GEN_130 << 1; 
  assign _GEN_131 = {{37'd0}, _T_292}; 
  assign _T_294 = s2_base_pc + _GEN_131; 
  assign _T_310 = taken_rviJALR | taken_rviJump; 
  assign taken_rviCall = _T_310 & _T_304; 
  assign _T_507 = s2_valid & s2_btb_resp_valid; 
  assign _T_508 = s2_btb_resp_bits_bridx == 1'h0; 
  assign _T_509 = _T_507 & _T_508; 
  assign _T_510 = _T_509 & taken_valid; 
  assign _T_512 = _T_510 & _T_564; 
  assign _GEN_38 = _T_512 ? 1'h1 : _T_269; 
  assign _GEN_39 = _T_512 ? 1'h1 : wrong_path; 
  assign _T_517 = taken_rviCall | taken_rviReturn; 
  assign _T_518 = taken_prevRVI & _T_517; 
  assign _T_519 = taken_rvcJALR | taken_rvcReturn; 
  assign _T_520 = taken_valid & _T_519; 
  assign _T_521 = _T_518 | _T_520; 
  assign _T_522 = _T_287 & _T_521; 
  assign _T_523 = taken_prevRVI ? taken_rviReturn : taken_rvcReturn; 
  assign _T_524 = taken_prevRVI ? taken_rviCall : taken_rvcJALR; 
  assign _T_525 = taken_prevRVI ? taken_rviBranch : taken_rvcBranch; 
  assign _T_528 = _T_525 ? 1'h0 : 1'h1; 
  assign _T_529 = _T_524 ? 2'h2 : {{1'd0}, _T_528}; 
  assign _T_530 = _T_523 ? 2'h3 : _T_529; 
  assign _T_533 = _T_229 & taken_taken; 
  assign _T_534 = taken_predictBranch == 1'h0; 
  assign _T_535 = _T_533 & _T_534; 
  assign _T_536 = taken_predictJump == 1'h0; 
  assign _T_537 = _T_535 & _T_536; 
  assign _T_538 = taken_predictReturn == 1'h0; 
  assign _T_539 = _T_537 & _T_538; 
  assign _GEN_46 = _T_506 ? _T_287 : 1'h0; 
  assign _T_567 = taken_bits_1[1:0]; 
  assign taken_rvc_1 = _T_567 != 2'h3; 
  assign _T_577 = taken_rviJALR_1 | taken_rviJump_1; 
  assign taken_rviCall_1 = _T_577 & _T_571; 
  assign _T_776 = _T_507 & s2_btb_resp_bits_bridx; 
  assign _T_777 = _T_776 & taken_valid_1; 
  assign _T_778 = taken_rvc_1 == 1'h0; 
  assign _T_779 = _T_777 & _T_778; 
  assign _T_784 = taken_rviCall_1 | taken_rviReturn_1; 
  assign _T_785 = taken_prevRVI_1 & _T_784; 
  assign _T_786 = taken_rvcJALR_1 | taken_rvcReturn_1; 
  assign _T_787 = taken_valid_1 & _T_786; 
  assign _T_788 = _T_785 | _T_787; 
  assign _T_789 = _T_287 & _T_788; 
  assign _T_790 = taken_prevRVI_1 ? taken_rviReturn_1 : taken_rvcReturn_1; 
  assign _T_791 = taken_prevRVI_1 ? taken_rviCall_1 : taken_rvcJALR_1; 
  assign _T_792 = taken_prevRVI_1 ? taken_rviBranch_1 : taken_rvcBranch_1; 
  assign _T_795 = _T_792 ? 1'h0 : 1'h1; 
  assign _T_796 = _T_791 ? 2'h2 : {{1'd0}, _T_795}; 
  assign _T_797 = _T_790 ? 2'h3 : _T_796; 
  assign _T_800 = _T_229 & taken_taken_1; 
  assign _T_801 = taken_predictBranch_1 == 1'h0; 
  assign _T_802 = _T_800 & _T_801; 
  assign _T_803 = taken_predictJump_1 == 1'h0; 
  assign _T_804 = _T_802 & _T_803; 
  assign _T_805 = taken_predictReturn_1 == 1'h0; 
  assign _T_806 = _T_804 & _T_805; 
  assign _GEN_82 = _T_773 ? _T_287 : _GEN_46; 
  assign _T_833 = taken_valid_1 & taken_idx; 
  assign _T_835 = _T_833 & _T_778; 
  assign _T_836 = taken_bits_1 | 16'h3; 
  assign _T_838 = s2_btb_taken | taken; 
  assign _T_839 = _T_229 & _T_838; 
  assign _GEN_116 = taken ? taken_idx : s2_btb_resp_bits_bridx; 
  assign _GEN_117 = taken ? 1'h1 : s2_btb_taken; 
  assign _GEN_118 = taken ? 5'h1c : s2_btb_resp_bits_entry; 
  assign _T_842 = s2_partial_insn_valid == 1'h0; 
  assign _T_844 = _T_842 | _T_298; 
  assign _T_846 = _T_844 | reset; 
  assign _T_847 = _T_846 == 1'h0; 
  assign auto_icache_master_out_a_valid = icache_auto_master_out_a_valid; 
  assign auto_icache_master_out_a_bits_address = icache_auto_master_out_a_bits_address; 
  assign io_cpu_resp_valid = fq_io_deq_valid; 
  assign io_cpu_resp_bits_btb_taken = fq_io_deq_bits_btb_taken; 
  assign io_cpu_resp_bits_btb_bridx = fq_io_deq_bits_btb_bridx; 
  assign io_cpu_resp_bits_btb_entry = fq_io_deq_bits_btb_entry; 
  assign io_cpu_resp_bits_btb_bht_history = fq_io_deq_bits_btb_bht_history; 
  assign io_cpu_resp_bits_pc = fq_io_deq_bits_pc; 
  assign io_cpu_resp_bits_data = fq_io_deq_bits_data; 
  assign io_cpu_resp_bits_xcpt_pf_inst = fq_io_deq_bits_xcpt_pf_inst; 
  assign io_cpu_resp_bits_xcpt_ae_inst = fq_io_deq_bits_xcpt_ae_inst; 
  assign io_cpu_resp_bits_replay = fq_io_deq_bits_replay; 
  assign io_cpu_npc = ~ _T_262; 
  assign io_ptw_req_valid = tlb_io_ptw_req_valid; 
  assign io_ptw_req_bits_valid = tlb_io_ptw_req_bits_valid; 
  assign io_ptw_req_bits_bits_addr = tlb_io_ptw_req_bits_bits_addr; 
  assign icache_clock = gated_clock; 
  assign icache_reset = reset; 
  assign icache_auto_master_out_a_ready = auto_icache_master_out_a_ready; 
  assign icache_auto_master_out_d_valid = auto_icache_master_out_d_valid; 
  assign icache_auto_master_out_d_bits_opcode = auto_icache_master_out_d_bits_opcode; 
  assign icache_auto_master_out_d_bits_size = auto_icache_master_out_d_bits_size; 
  assign icache_auto_master_out_d_bits_data = auto_icache_master_out_d_bits_data; 
  assign icache_auto_master_out_d_bits_corrupt = auto_icache_master_out_d_bits_corrupt; 
  assign icache_io_req_valid = io_cpu_req_valid | _T_208; 
  assign icache_io_req_bits_addr = io_cpu_npc[38:0]; 
  assign icache_io_s1_paddr = tlb_io_resp_paddr; 
  assign icache_io_s1_kill = _T_248 | s2_replay; 
  assign icache_io_s2_kill = _T_251 | s2_xcpt; 
  assign icache_io_invalidate = io_cpu_flush_icache; 
  assign fq_clock = gated_clock; 
  assign fq_reset = reset | io_cpu_req_valid; 
  assign fq_io_enq_valid = _T_255 & _T_258; 
  assign fq_io_enq_bits_btb_taken = _T_798 ? _GEN_117 : s2_btb_taken; 
  assign fq_io_enq_bits_btb_bridx = _T_798 ? _GEN_116 : s2_btb_resp_bits_bridx; 
  assign fq_io_enq_bits_btb_entry = _T_798 ? _GEN_118 : s2_btb_resp_bits_entry; 
  assign fq_io_enq_bits_btb_bht_history = s2_btb_resp_bits_bht_history; 
  assign fq_io_enq_bits_pc = s2_pc; 
  assign fq_io_enq_bits_data = icache_io_resp_bits_data; 
  assign fq_io_enq_bits_mask = _T_265[1:0]; 
  assign fq_io_enq_bits_xcpt_pf_inst = s2_tlb_resp_pf_inst; 
  assign fq_io_enq_bits_xcpt_ae_inst = _T_271 ? 1'h1 : s2_tlb_resp_ae_inst; 
  assign fq_io_enq_bits_replay = _T_779 ? 1'h1 : _GEN_38; 
  assign fq_io_deq_ready = io_cpu_resp_ready; 
  assign tlb_clock = gated_clock; 
  assign tlb_reset = reset; 
  assign tlb_io_req_valid = s1_valid & _T_243; 
  assign tlb_io_req_bits_vaddr = s1_pc; 
  assign tlb_io_sfence_valid = io_cpu_sfence_valid; 
  assign tlb_io_sfence_bits_rs1 = io_cpu_sfence_bits_rs1; 
  assign tlb_io_sfence_bits_rs2 = io_cpu_sfence_bits_rs2; 
  assign tlb_io_sfence_bits_addr = io_cpu_sfence_bits_addr; 
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
  assign tlb_io_ptw_status_prv = io_ptw_status_prv; 
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
  assign tlb_io_kill = s2_valid == 1'h0; 
  assign btb_clock = gated_clock; 
  assign btb_reset = reset; 
  assign btb_io_req_bits_addr = s1_pc[38:0]; 
  assign btb_io_btb_update_valid = _T_283 ? _T_289 : io_cpu_btb_update_valid; 
  assign btb_io_btb_update_bits_prediction_entry = _T_283 ? 5'h1c : io_cpu_btb_update_bits_prediction_entry; 
  assign btb_io_btb_update_bits_pc = _GEN_36[38:0]; 
  assign btb_io_btb_update_bits_isValid = _T_283 ? 1'h1 : io_cpu_btb_update_bits_isValid; 
  assign btb_io_btb_update_bits_br_pc = _GEN_35[38:0]; 
  assign btb_io_btb_update_bits_cfiType = _T_283 ? btb_io_ras_update_bits_cfiType : io_cpu_btb_update_bits_cfiType; 
  assign btb_io_bht_update_valid = io_cpu_bht_update_valid; 
  assign btb_io_bht_update_bits_prediction_history = io_cpu_bht_update_bits_prediction_history; 
  assign btb_io_bht_update_bits_pc = io_cpu_bht_update_bits_pc; 
  assign btb_io_bht_update_bits_branch = io_cpu_bht_update_bits_branch; 
  assign btb_io_bht_update_bits_taken = io_cpu_bht_update_bits_taken; 
  assign btb_io_bht_update_bits_mispredict = io_cpu_bht_update_bits_mispredict; 
  assign btb_io_bht_advance_valid = taken_idx ? _GEN_82 : _GEN_46; 
  assign btb_io_bht_advance_bits_bht_value = s2_btb_resp_bits_bht_value; 
  assign btb_io_ras_update_valid = taken_idx ? _T_789 : _T_522; 
  assign btb_io_ras_update_bits_cfiType = taken_idx ? _T_797 : _T_530; 
  assign btb_io_ras_update_bits_returnAddr = _T_294[38:0]; 
  assign btb_io_flush = _T_779 ? 1'h1 : _T_512; 
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
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  s1_valid = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {2{`RANDOM}};
  s1_pc = _RAND_1[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  s1_speculative = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  s2_valid = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {2{`RANDOM}};
  s2_pc = _RAND_4[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  s2_btb_resp_valid = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  s2_btb_resp_bits_taken = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  s2_btb_resp_bits_bridx = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  s2_btb_resp_bits_entry = _RAND_8[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  s2_btb_resp_bits_bht_history = _RAND_9[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  s2_btb_resp_bits_bht_value = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  s2_tlb_resp_miss = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  s2_tlb_resp_pf_inst = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  s2_tlb_resp_ae_inst = _RAND_13[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  s2_tlb_resp_cacheable = _RAND_14[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  s2_speculative = _RAND_15[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  s2_partial_insn_valid = _RAND_16[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  s2_partial_insn = _RAND_17[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  wrong_path = _RAND_18[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  _T_235 = _RAND_19[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  _T_254 = _RAND_20[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge gated_clock) begin
    s1_valid <= io_cpu_req_valid | _T_208;
    s1_pc <= io_cpu_npc;
    if (io_cpu_req_valid) begin
      s1_speculative <= io_cpu_req_bits_speculative;
    end else begin
      if (s2_replay) begin
        s1_speculative <= s2_speculative;
      end else begin
        s1_speculative <= s0_speculative;
      end
    end
    if (reset) begin
      s2_valid <= 1'h0;
    end else begin
      if (_T_243) begin
        s2_valid <= _T_244;
      end else begin
        s2_valid <= 1'h0;
      end
    end
    if (reset) begin
      s2_pc <= {{2'd0}, _T_216};
    end else begin
      if (_T_243) begin
        s2_pc <= s1_pc;
      end
    end
    if (_T_243) begin
      s2_btb_resp_valid <= btb_io_resp_valid;
    end
    if (_T_243) begin
      s2_btb_resp_bits_taken <= btb_io_resp_bits_taken;
    end
    if (_T_243) begin
      s2_btb_resp_bits_bridx <= btb_io_resp_bits_bridx;
    end
    if (_T_243) begin
      s2_btb_resp_bits_entry <= btb_io_resp_bits_entry;
    end
    if (_T_243) begin
      s2_btb_resp_bits_bht_history <= btb_io_resp_bits_bht_history;
    end
    if (_T_243) begin
      s2_btb_resp_bits_bht_value <= btb_io_resp_bits_bht_value;
    end
    if (_T_243) begin
      s2_tlb_resp_miss <= tlb_io_resp_miss;
    end
    if (_T_243) begin
      s2_tlb_resp_pf_inst <= tlb_io_resp_pf_inst;
    end
    if (_T_243) begin
      s2_tlb_resp_ae_inst <= tlb_io_resp_ae_inst;
    end
    if (_T_243) begin
      s2_tlb_resp_cacheable <= tlb_io_resp_cacheable;
    end
    if (reset) begin
      s2_speculative <= 1'h0;
    end else begin
      if (_T_243) begin
        s2_speculative <= s1_speculative;
      end
    end
    if (reset) begin
      s2_partial_insn_valid <= 1'h0;
    end else begin
      if (s2_redirect) begin
        s2_partial_insn_valid <= 1'h0;
      end else begin
        if (_T_839) begin
          s2_partial_insn_valid <= 1'h0;
        end else begin
          if (_T_229) begin
            s2_partial_insn_valid <= _T_835;
          end
        end
      end
    end
    if (_T_229) begin
      if (_T_835) begin
        s2_partial_insn <= _T_836;
      end
    end
    if (io_cpu_req_valid) begin
      wrong_path <= 1'h0;
    end else begin
      if (taken_idx) begin
        if (_T_798) begin
          if (_T_806) begin
            wrong_path <= 1'h1;
          end else begin
            if (_T_779) begin
              wrong_path <= 1'h1;
            end else begin
              if (_T_798) begin
                if (_T_539) begin
                  wrong_path <= 1'h1;
                end else begin
                  if (_T_512) begin
                    wrong_path <= 1'h1;
                  end
                end
              end else begin
                if (_T_512) begin
                  wrong_path <= 1'h1;
                end
              end
            end
          end
        end else begin
          if (_T_779) begin
            wrong_path <= 1'h1;
          end else begin
            if (_T_798) begin
              if (_T_539) begin
                wrong_path <= 1'h1;
              end else begin
                if (_T_512) begin
                  wrong_path <= 1'h1;
                end
              end
            end else begin
              if (_T_512) begin
                wrong_path <= 1'h1;
              end
            end
          end
        end
      end else begin
        if (_T_779) begin
          wrong_path <= 1'h1;
        end else begin
          if (_T_798) begin
            if (_T_539) begin
              wrong_path <= 1'h1;
            end else begin
              wrong_path <= _GEN_39;
            end
          end else begin
            wrong_path <= _GEN_39;
          end
        end
      end
    end
    if (reset) begin
      _T_235 <= 1'h1;
    end else begin
      _T_235 <= _T_233;
    end
    _T_254 <= s1_valid;
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_206) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Frontend.scala:86 assert(!(io.cpu.req.valid || io.cpu.sfence.valid || io.cpu.flush_icache || io.cpu.bht_update.valid || io.cpu.btb_update.valid) || io.cpu.might_request)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_206) begin
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
        if (_T_847) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Frontend.scala:311 assert(!s2_partial_insn_valid || fq.io.enq.bits.mask(0))\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_847) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
