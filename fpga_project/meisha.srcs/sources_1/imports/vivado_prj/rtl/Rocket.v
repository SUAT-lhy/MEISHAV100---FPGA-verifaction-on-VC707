module Rocket( 
  input         clock, 
  input         reset, 
  input  [1:0]  io_hartid, 
  input         io_interrupts_debug, 
  input         io_interrupts_mtip, 
  input         io_interrupts_msip, 
  input         io_interrupts_meip, 
  input         io_interrupts_seip, 
  output        io_imem_might_request, 
  output        io_imem_req_valid, 
  output [39:0] io_imem_req_bits_pc, 
  output        io_imem_req_bits_speculative, 
  output        io_imem_sfence_valid, 
  output        io_imem_sfence_bits_rs1, 
  output        io_imem_sfence_bits_rs2, 
  output [38:0] io_imem_sfence_bits_addr, 
  output        io_imem_resp_ready, 
  input         io_imem_resp_valid, 
  input         io_imem_resp_bits_btb_taken, 
  input         io_imem_resp_bits_btb_bridx, 
  input  [4:0]  io_imem_resp_bits_btb_entry, 
  input  [7:0]  io_imem_resp_bits_btb_bht_history, 
  input  [39:0] io_imem_resp_bits_pc, 
  input  [31:0] io_imem_resp_bits_data, 
  input         io_imem_resp_bits_xcpt_pf_inst, 
  input         io_imem_resp_bits_xcpt_ae_inst, 
  input         io_imem_resp_bits_replay, 
  output        io_imem_btb_update_valid, 
  output [4:0]  io_imem_btb_update_bits_prediction_entry, 
  output [38:0] io_imem_btb_update_bits_pc, 
  output        io_imem_btb_update_bits_isValid, 
  output [38:0] io_imem_btb_update_bits_br_pc, 
  output [1:0]  io_imem_btb_update_bits_cfiType, 
  output        io_imem_bht_update_valid, 
  output [7:0]  io_imem_bht_update_bits_prediction_history, 
  output [38:0] io_imem_bht_update_bits_pc, 
  output        io_imem_bht_update_bits_branch, 
  output        io_imem_bht_update_bits_taken, 
  output        io_imem_bht_update_bits_mispredict, 
  output        io_imem_flush_icache, 
  input         io_dmem_req_ready, 
  output        io_dmem_req_valid, 
  output [39:0] io_dmem_req_bits_addr, 
  output [6:0]  io_dmem_req_bits_tag, 
  output [4:0]  io_dmem_req_bits_cmd, 
  output [2:0]  io_dmem_req_bits_typ, 
  output        io_dmem_s1_kill, 
  output [63:0] io_dmem_s1_data_data, 
  input         io_dmem_s2_nack, 
  input         io_dmem_resp_valid, 
  input  [6:0]  io_dmem_resp_bits_tag, 
  input  [2:0]  io_dmem_resp_bits_typ, 
  input  [63:0] io_dmem_resp_bits_data, 
  input         io_dmem_resp_bits_replay, 
  input         io_dmem_resp_bits_has_data, 
  input  [63:0] io_dmem_resp_bits_data_word_bypass, 
  input         io_dmem_replay_next, 
  input         io_dmem_s2_xcpt_ma_ld, 
  input         io_dmem_s2_xcpt_ma_st, 
  input         io_dmem_s2_xcpt_pf_ld, 
  input         io_dmem_s2_xcpt_pf_st, 
  input         io_dmem_s2_xcpt_ae_ld, 
  input         io_dmem_s2_xcpt_ae_st, 
  input         io_dmem_ordered, 
  input         io_dmem_perf_grant, 
  output        io_dmem_keep_clock_enabled, 
  input         io_dmem_clock_enabled, 
  output [3:0]  io_ptw_ptbr_mode, 
  output [43:0] io_ptw_ptbr_ppn, 
  output        io_ptw_sfence_valid, 
  output        io_ptw_sfence_bits_rs1, 
  output [1:0]  io_ptw_status_dprv, 
  output [1:0]  io_ptw_status_prv, 
  output        io_ptw_status_mxr, 
  output        io_ptw_status_sum, 
  output        io_ptw_pmp_0_cfg_l, 
  output [1:0]  io_ptw_pmp_0_cfg_a, 
  output        io_ptw_pmp_0_cfg_x, 
  output        io_ptw_pmp_0_cfg_w, 
  output        io_ptw_pmp_0_cfg_r, 
  output [35:0] io_ptw_pmp_0_addr, 
  output [37:0] io_ptw_pmp_0_mask, 
  output        io_ptw_pmp_1_cfg_l, 
  output [1:0]  io_ptw_pmp_1_cfg_a, 
  output        io_ptw_pmp_1_cfg_x, 
  output        io_ptw_pmp_1_cfg_w, 
  output        io_ptw_pmp_1_cfg_r, 
  output [35:0] io_ptw_pmp_1_addr, 
  output [37:0] io_ptw_pmp_1_mask, 
  output        io_ptw_pmp_2_cfg_l, 
  output [1:0]  io_ptw_pmp_2_cfg_a, 
  output        io_ptw_pmp_2_cfg_x, 
  output        io_ptw_pmp_2_cfg_w, 
  output        io_ptw_pmp_2_cfg_r, 
  output [35:0] io_ptw_pmp_2_addr, 
  output [37:0] io_ptw_pmp_2_mask, 
  output        io_ptw_pmp_3_cfg_l, 
  output [1:0]  io_ptw_pmp_3_cfg_a, 
  output        io_ptw_pmp_3_cfg_x, 
  output        io_ptw_pmp_3_cfg_w, 
  output        io_ptw_pmp_3_cfg_r, 
  output [35:0] io_ptw_pmp_3_addr, 
  output [37:0] io_ptw_pmp_3_mask, 
  output        io_ptw_pmp_4_cfg_l, 
  output [1:0]  io_ptw_pmp_4_cfg_a, 
  output        io_ptw_pmp_4_cfg_x, 
  output        io_ptw_pmp_4_cfg_w, 
  output        io_ptw_pmp_4_cfg_r, 
  output [35:0] io_ptw_pmp_4_addr, 
  output [37:0] io_ptw_pmp_4_mask, 
  output        io_ptw_pmp_5_cfg_l, 
  output [1:0]  io_ptw_pmp_5_cfg_a, 
  output        io_ptw_pmp_5_cfg_x, 
  output        io_ptw_pmp_5_cfg_w, 
  output        io_ptw_pmp_5_cfg_r, 
  output [35:0] io_ptw_pmp_5_addr, 
  output [37:0] io_ptw_pmp_5_mask, 
  output        io_ptw_pmp_6_cfg_l, 
  output [1:0]  io_ptw_pmp_6_cfg_a, 
  output        io_ptw_pmp_6_cfg_x, 
  output        io_ptw_pmp_6_cfg_w, 
  output        io_ptw_pmp_6_cfg_r, 
  output [35:0] io_ptw_pmp_6_addr, 
  output [37:0] io_ptw_pmp_6_mask, 
  output        io_ptw_pmp_7_cfg_l, 
  output [1:0]  io_ptw_pmp_7_cfg_a, 
  output        io_ptw_pmp_7_cfg_x, 
  output        io_ptw_pmp_7_cfg_w, 
  output        io_ptw_pmp_7_cfg_r, 
  output [35:0] io_ptw_pmp_7_addr, 
  output [37:0] io_ptw_pmp_7_mask, 
  output [63:0] io_ptw_customCSRs_csrs_0_value, 
  output [31:0] io_fpu_inst, 
  output [63:0] io_fpu_fromint_data, 
  output [2:0]  io_fpu_fcsr_rm, 
  input         io_fpu_fcsr_flags_valid, 
  input  [4:0]  io_fpu_fcsr_flags_bits, 
  input  [63:0] io_fpu_store_data, 
  input  [63:0] io_fpu_toint_data, 
  output        io_fpu_dmem_resp_val, 
  output [2:0]  io_fpu_dmem_resp_type, 
  output [4:0]  io_fpu_dmem_resp_tag, 
  output [63:0] io_fpu_dmem_resp_data, 
  output        io_fpu_valid, 
  input         io_fpu_fcsr_rdy, 
  input         io_fpu_nack_mem, 
  input         io_fpu_illegal_rm, 
  output        io_fpu_killx, 
  output        io_fpu_killm, 
  input         io_fpu_dec_wen, 
  input         io_fpu_dec_ren1, 
  input         io_fpu_dec_ren2, 
  input         io_fpu_dec_ren3, 
  input         io_fpu_sboard_set, 
  input         io_fpu_sboard_clr, 
  input  [4:0]  io_fpu_sboard_clra, 
  input         io_rocc_cmd_ready, 
  input         io_rocc_interrupt 
);
  wire  ibuf_clock; 
  wire  ibuf_reset; 
  wire  ibuf_io_imem_ready; 
  wire  ibuf_io_imem_valid; 
  wire  ibuf_io_imem_bits_btb_taken; 
  wire  ibuf_io_imem_bits_btb_bridx; 
  wire [4:0] ibuf_io_imem_bits_btb_entry; 
  wire [7:0] ibuf_io_imem_bits_btb_bht_history; 
  wire [39:0] ibuf_io_imem_bits_pc; 
  wire [31:0] ibuf_io_imem_bits_data; 
  wire  ibuf_io_imem_bits_xcpt_pf_inst; 
  wire  ibuf_io_imem_bits_xcpt_ae_inst; 
  wire  ibuf_io_imem_bits_replay; 
  wire  ibuf_io_kill; 
  wire [39:0] ibuf_io_pc; 
  wire [4:0] ibuf_io_btb_resp_entry; 
  wire [7:0] ibuf_io_btb_resp_bht_history; 
  wire  ibuf_io_inst_0_ready; 
  wire  ibuf_io_inst_0_valid; 
  wire  ibuf_io_inst_0_bits_xcpt0_pf_inst; 
  wire  ibuf_io_inst_0_bits_xcpt0_ae_inst; 
  wire  ibuf_io_inst_0_bits_xcpt1_pf_inst; 
  wire  ibuf_io_inst_0_bits_xcpt1_ae_inst; 
  wire  ibuf_io_inst_0_bits_replay; 
  wire  ibuf_io_inst_0_bits_rvc; 
  wire [31:0] ibuf_io_inst_0_bits_inst_bits; 
  wire [4:0] ibuf_io_inst_0_bits_inst_rd; 
  wire [4:0] ibuf_io_inst_0_bits_inst_rs1; 
  wire [4:0] ibuf_io_inst_0_bits_inst_rs2; 
  wire [4:0] ibuf_io_inst_0_bits_inst_rs3; 
  wire [31:0] ibuf_io_inst_0_bits_raw; 
  reg [63:0] _T_714 [0:30]; 
  reg [63:0] _RAND_0;
  wire [63:0] _T_714__T_721_data; 
  wire [4:0] _T_714__T_721_addr; 
  reg [63:0] _RAND_1;
  wire [63:0] _T_714__T_729_data; 
  wire [4:0] _T_714__T_729_addr; 
  reg [63:0] _RAND_2;
  wire [63:0] _T_714__T_1453_data; 
  wire [4:0] _T_714__T_1453_addr; 
  wire  _T_714__T_1453_mask; 
  wire  _T_714__T_1453_en; 
  wire  csr_clock; 
  wire  csr_reset; 
  wire  csr_io_ungated_clock; 
  wire  csr_io_interrupts_debug; 
  wire  csr_io_interrupts_mtip; 
  wire  csr_io_interrupts_msip; 
  wire  csr_io_interrupts_meip; 
  wire  csr_io_interrupts_seip; 
  wire [1:0] csr_io_hartid; 
  wire [11:0] csr_io_rw_addr; 
  wire [2:0] csr_io_rw_cmd; 
  wire [63:0] csr_io_rw_rdata; 
  wire [63:0] csr_io_rw_wdata; 
  wire [11:0] csr_io_decode_0_csr; 
  wire  csr_io_decode_0_fp_illegal; 
  wire  csr_io_decode_0_fp_csr; 
  wire  csr_io_decode_0_read_illegal; 
  wire  csr_io_decode_0_write_illegal; 
  wire  csr_io_decode_0_write_flush; 
  wire  csr_io_decode_0_system_illegal; 
  wire  csr_io_csr_stall; 
  wire  csr_io_eret; 
  wire  csr_io_singleStep; 
  wire  csr_io_status_debug; 
  wire [31:0] csr_io_status_isa; 
  wire [1:0] csr_io_status_dprv; 
  wire [1:0] csr_io_status_prv; 
  wire  csr_io_status_sd; 
  wire [26:0] csr_io_status_zero2; 
  wire [1:0] csr_io_status_sxl; 
  wire [1:0] csr_io_status_uxl; 
  wire  csr_io_status_sd_rv32; 
  wire [7:0] csr_io_status_zero1; 
  wire  csr_io_status_tsr; 
  wire  csr_io_status_tw; 
  wire  csr_io_status_tvm; 
  wire  csr_io_status_mxr; 
  wire  csr_io_status_sum; 
  wire  csr_io_status_mprv; 
  wire [1:0] csr_io_status_xs; 
  wire [1:0] csr_io_status_fs; 
  wire [1:0] csr_io_status_mpp; 
  wire [1:0] csr_io_status_hpp; 
  wire  csr_io_status_spp; 
  wire  csr_io_status_mpie; 
  wire  csr_io_status_hpie; 
  wire  csr_io_status_spie; 
  wire  csr_io_status_upie; 
  wire  csr_io_status_mie; 
  wire  csr_io_status_hie; 
  wire  csr_io_status_sie; 
  wire  csr_io_status_uie; 
  wire [3:0] csr_io_ptbr_mode; 
  wire [43:0] csr_io_ptbr_ppn; 
  wire [39:0] csr_io_evec; 
  wire  csr_io_exception; 
  wire  csr_io_retire; 
  wire [63:0] csr_io_cause; 
  wire [39:0] csr_io_pc; 
  wire [39:0] csr_io_tval; 
  wire [63:0] csr_io_time; 
  wire [2:0] csr_io_fcsr_rm; 
  wire  csr_io_fcsr_flags_valid; 
  wire [4:0] csr_io_fcsr_flags_bits; 
  wire  csr_io_rocc_interrupt; 
  wire  csr_io_interrupt; 
  wire [63:0] csr_io_interrupt_cause; 
  wire  csr_io_bp_0_control_action; 
  wire [1:0] csr_io_bp_0_control_tmatch; 
  wire  csr_io_bp_0_control_m; 
  wire  csr_io_bp_0_control_s; 
  wire  csr_io_bp_0_control_u; 
  wire  csr_io_bp_0_control_x; 
  wire  csr_io_bp_0_control_w; 
  wire  csr_io_bp_0_control_r; 
  wire [38:0] csr_io_bp_0_address; 
  wire  csr_io_pmp_0_cfg_l; 
  wire [1:0] csr_io_pmp_0_cfg_a; 
  wire  csr_io_pmp_0_cfg_x; 
  wire  csr_io_pmp_0_cfg_w; 
  wire  csr_io_pmp_0_cfg_r; 
  wire [35:0] csr_io_pmp_0_addr; 
  wire [37:0] csr_io_pmp_0_mask; 
  wire  csr_io_pmp_1_cfg_l; 
  wire [1:0] csr_io_pmp_1_cfg_a; 
  wire  csr_io_pmp_1_cfg_x; 
  wire  csr_io_pmp_1_cfg_w; 
  wire  csr_io_pmp_1_cfg_r; 
  wire [35:0] csr_io_pmp_1_addr; 
  wire [37:0] csr_io_pmp_1_mask; 
  wire  csr_io_pmp_2_cfg_l; 
  wire [1:0] csr_io_pmp_2_cfg_a; 
  wire  csr_io_pmp_2_cfg_x; 
  wire  csr_io_pmp_2_cfg_w; 
  wire  csr_io_pmp_2_cfg_r; 
  wire [35:0] csr_io_pmp_2_addr; 
  wire [37:0] csr_io_pmp_2_mask; 
  wire  csr_io_pmp_3_cfg_l; 
  wire [1:0] csr_io_pmp_3_cfg_a; 
  wire  csr_io_pmp_3_cfg_x; 
  wire  csr_io_pmp_3_cfg_w; 
  wire  csr_io_pmp_3_cfg_r; 
  wire [35:0] csr_io_pmp_3_addr; 
  wire [37:0] csr_io_pmp_3_mask; 
  wire  csr_io_pmp_4_cfg_l; 
  wire [1:0] csr_io_pmp_4_cfg_a; 
  wire  csr_io_pmp_4_cfg_x; 
  wire  csr_io_pmp_4_cfg_w; 
  wire  csr_io_pmp_4_cfg_r; 
  wire [35:0] csr_io_pmp_4_addr; 
  wire [37:0] csr_io_pmp_4_mask; 
  wire  csr_io_pmp_5_cfg_l; 
  wire [1:0] csr_io_pmp_5_cfg_a; 
  wire  csr_io_pmp_5_cfg_x; 
  wire  csr_io_pmp_5_cfg_w; 
  wire  csr_io_pmp_5_cfg_r; 
  wire [35:0] csr_io_pmp_5_addr; 
  wire [37:0] csr_io_pmp_5_mask; 
  wire  csr_io_pmp_6_cfg_l; 
  wire [1:0] csr_io_pmp_6_cfg_a; 
  wire  csr_io_pmp_6_cfg_x; 
  wire  csr_io_pmp_6_cfg_w; 
  wire  csr_io_pmp_6_cfg_r; 
  wire [35:0] csr_io_pmp_6_addr; 
  wire [37:0] csr_io_pmp_6_mask; 
  wire  csr_io_pmp_7_cfg_l; 
  wire [1:0] csr_io_pmp_7_cfg_a; 
  wire  csr_io_pmp_7_cfg_x; 
  wire  csr_io_pmp_7_cfg_w; 
  wire  csr_io_pmp_7_cfg_r; 
  wire [35:0] csr_io_pmp_7_addr; 
  wire [37:0] csr_io_pmp_7_mask; 
  wire [31:0] csr_io_inst_0; 
  wire  csr_io_trace_0_valid; 
  wire [39:0] csr_io_trace_0_iaddr; 
  wire [31:0] csr_io_trace_0_insn; 
  wire  csr_io_trace_0_exception; 
  wire  bpu_io_status_debug; 
  wire [1:0] bpu_io_status_prv; 
  wire  bpu_io_bp_0_control_action; 
  wire [1:0] bpu_io_bp_0_control_tmatch; 
  wire  bpu_io_bp_0_control_m; 
  wire  bpu_io_bp_0_control_s; 
  wire  bpu_io_bp_0_control_u; 
  wire  bpu_io_bp_0_control_x; 
  wire  bpu_io_bp_0_control_w; 
  wire  bpu_io_bp_0_control_r; 
  wire [38:0] bpu_io_bp_0_address; 
  wire [38:0] bpu_io_pc; 
  wire [38:0] bpu_io_ea; 
  wire  bpu_io_xcpt_if; 
  wire  bpu_io_xcpt_ld; 
  wire  bpu_io_xcpt_st; 
  wire  bpu_io_debug_if; 
  wire  bpu_io_debug_ld; 
  wire  bpu_io_debug_st; 
  wire  alu_io_dw; 
  wire [3:0] alu_io_fn; 
  wire [63:0] alu_io_in2; 
  wire [63:0] alu_io_in1; 
  wire [63:0] alu_io_out; 
  wire [63:0] alu_io_adder_out; 
  wire  alu_io_cmp_out; 
  wire  div_clock; 
  wire  div_reset; 
  wire  div_io_req_ready; 
  wire  div_io_req_valid; 
  wire [3:0] div_io_req_bits_fn; 
  wire  div_io_req_bits_dw; 
  wire [63:0] div_io_req_bits_in1; 
  wire [63:0] div_io_req_bits_in2; 
  wire [4:0] div_io_req_bits_tag; 
  wire  div_io_kill; 
  wire  div_io_resp_ready; 
  wire  div_io_resp_valid; 
  wire [63:0] div_io_resp_bits_data; 
  wire [4:0] div_io_resp_bits_tag; 
  wire  PlusArgTimeout_clock; 
  wire  PlusArgTimeout_reset; 
  wire [31:0] PlusArgTimeout_io_count; 
  reg  imem_might_request_reg; 
  reg [31:0] _RAND_3;
  reg  ex_ctrl_fp; 
  reg [31:0] _RAND_4;
  reg  ex_ctrl_branch; 
  reg [31:0] _RAND_5;
  reg  ex_ctrl_jal; 
  reg [31:0] _RAND_6;
  reg  ex_ctrl_jalr; 
  reg [31:0] _RAND_7;
  reg  ex_ctrl_rxs2; 
  reg [31:0] _RAND_8;
  reg [1:0] ex_ctrl_sel_alu2; 
  reg [31:0] _RAND_9;
  reg [1:0] ex_ctrl_sel_alu1; 
  reg [31:0] _RAND_10;
  reg [2:0] ex_ctrl_sel_imm; 
  reg [31:0] _RAND_11;
  reg  ex_ctrl_alu_dw; 
  reg [31:0] _RAND_12;
  reg [3:0] ex_ctrl_alu_fn; 
  reg [31:0] _RAND_13;
  reg  ex_ctrl_mem; 
  reg [31:0] _RAND_14;
  reg [4:0] ex_ctrl_mem_cmd; 
  reg [31:0] _RAND_15;
  reg [2:0] ex_ctrl_mem_type; 
  reg [31:0] _RAND_16;
  reg  ex_ctrl_wfd; 
  reg [31:0] _RAND_17;
  reg  ex_ctrl_div; 
  reg [31:0] _RAND_18;
  reg  ex_ctrl_wxd; 
  reg [31:0] _RAND_19;
  reg [2:0] ex_ctrl_csr; 
  reg [31:0] _RAND_20;
  reg  ex_ctrl_fence_i; 
  reg [31:0] _RAND_21;
  reg  mem_ctrl_fp; 
  reg [31:0] _RAND_22;
  reg  mem_ctrl_rocc; 
  reg [31:0] _RAND_23;
  reg  mem_ctrl_branch; 
  reg [31:0] _RAND_24;
  reg  mem_ctrl_jal; 
  reg [31:0] _RAND_25;
  reg  mem_ctrl_jalr; 
  reg [31:0] _RAND_26;
  reg  mem_ctrl_mem; 
  reg [31:0] _RAND_27;
  reg [2:0] mem_ctrl_mem_type; 
  reg [31:0] _RAND_28;
  reg  mem_ctrl_wfd; 
  reg [31:0] _RAND_29;
  reg  mem_ctrl_mul; 
  reg [31:0] _RAND_30;
  reg  mem_ctrl_div; 
  reg [31:0] _RAND_31;
  reg  mem_ctrl_wxd; 
  reg [31:0] _RAND_32;
  reg [2:0] mem_ctrl_csr; 
  reg [31:0] _RAND_33;
  reg  mem_ctrl_fence_i; 
  reg [31:0] _RAND_34;
  reg  wb_ctrl_rocc; 
  reg [31:0] _RAND_35;
  reg  wb_ctrl_mem; 
  reg [31:0] _RAND_36;
  reg [2:0] wb_ctrl_mem_type; 
  reg [31:0] _RAND_37;
  reg  wb_ctrl_wfd; 
  reg [31:0] _RAND_38;
  reg  wb_ctrl_div; 
  reg [31:0] _RAND_39;
  reg  wb_ctrl_wxd; 
  reg [31:0] _RAND_40;
  reg [2:0] wb_ctrl_csr; 
  reg [31:0] _RAND_41;
  reg  wb_ctrl_fence_i; 
  reg [31:0] _RAND_42;
  reg  ex_reg_xcpt_interrupt; 
  reg [31:0] _RAND_43;
  reg  ex_reg_valid; 
  reg [31:0] _RAND_44;
  reg  ex_reg_rvc; 
  reg [31:0] _RAND_45;
  reg [4:0] ex_reg_btb_resp_entry; 
  reg [31:0] _RAND_46;
  reg [7:0] ex_reg_btb_resp_bht_history; 
  reg [31:0] _RAND_47;
  reg  ex_reg_xcpt; 
  reg [31:0] _RAND_48;
  reg  ex_reg_flush_pipe; 
  reg [31:0] _RAND_49;
  reg  ex_reg_load_use; 
  reg [31:0] _RAND_50;
  reg [63:0] ex_reg_cause; 
  reg [63:0] _RAND_51;
  reg  ex_reg_replay; 
  reg [31:0] _RAND_52;
  reg [39:0] ex_reg_pc; 
  reg [63:0] _RAND_53;
  reg [31:0] ex_reg_inst; 
  reg [31:0] _RAND_54;
  reg [31:0] ex_reg_raw_inst; 
  reg [31:0] _RAND_55;
  reg  mem_reg_xcpt_interrupt; 
  reg [31:0] _RAND_56;
  reg  mem_reg_valid; 
  reg [31:0] _RAND_57;
  reg  mem_reg_rvc; 
  reg [31:0] _RAND_58;
  reg [4:0] mem_reg_btb_resp_entry; 
  reg [31:0] _RAND_59;
  reg [7:0] mem_reg_btb_resp_bht_history; 
  reg [31:0] _RAND_60;
  reg  mem_reg_xcpt; 
  reg [31:0] _RAND_61;
  reg  mem_reg_replay; 
  reg [31:0] _RAND_62;
  reg  mem_reg_flush_pipe; 
  reg [31:0] _RAND_63;
  reg [63:0] mem_reg_cause; 
  reg [63:0] _RAND_64;
  reg  mem_reg_slow_bypass; 
  reg [31:0] _RAND_65;
  reg  mem_reg_load; 
  reg [31:0] _RAND_66;
  reg  mem_reg_store; 
  reg [31:0] _RAND_67;
  reg  mem_reg_sfence; 
  reg [31:0] _RAND_68;
  reg [39:0] mem_reg_pc; 
  reg [63:0] _RAND_69;
  reg [31:0] mem_reg_inst; 
  reg [31:0] _RAND_70;
  reg [31:0] mem_reg_raw_inst; 
  reg [31:0] _RAND_71;
  reg [63:0] mem_reg_wdata; 
  reg [63:0] _RAND_72;
  reg [63:0] mem_reg_rs2; 
  reg [63:0] _RAND_73;
  reg  mem_br_taken; 
  reg [31:0] _RAND_74;
  reg  wb_reg_valid; 
  reg [31:0] _RAND_75;
  reg  wb_reg_xcpt; 
  reg [31:0] _RAND_76;
  reg  wb_reg_replay; 
  reg [31:0] _RAND_77;
  reg  wb_reg_flush_pipe; 
  reg [31:0] _RAND_78;
  reg [63:0] wb_reg_cause; 
  reg [63:0] _RAND_79;
  reg  wb_reg_sfence; 
  reg [31:0] _RAND_80;
  reg [39:0] wb_reg_pc; 
  reg [63:0] _RAND_81;
  reg [31:0] wb_reg_inst; 
  reg [31:0] _RAND_82;
  reg [31:0] wb_reg_raw_inst; 
  reg [31:0] _RAND_83;
  reg [63:0] wb_reg_wdata; 
  reg [63:0] _RAND_84;
  wire  replay_wb_common; 
  wire  _T_1427; 
  wire  _T_1428; 
  wire  replay_wb_rocc; 
  wire  replay_wb; 
  wire  _T_1391; 
  wire  _T_1392; 
  wire  _T_1403; 
  wire  _T_1394; 
  wire  _T_1404; 
  wire  _T_1396; 
  wire  _T_1405; 
  wire  _T_1398; 
  wire  _T_1406; 
  wire  _T_1400; 
  wire  _T_1407; 
  wire  _T_1402; 
  wire  wb_xcpt; 
  wire  _T_1429; 
  wire  _T_1430; 
  wire  take_pc_wb; 
  wire  _T_1063; 
  wire  ex_pc_valid; 
  wire  _T_1236; 
  wire [63:0] _T_1237; 
  wire [24:0] a; 
  wire  _T_1238; 
  wire  _T_1239; 
  wire  _T_1240; 
  wire  _T_1241; 
  wire  _T_1242; 
  wire  _T_1243; 
  wire  msb; 
  wire [38:0] _T_1244; 
  wire [39:0] _T_1245; 
  wire [39:0] _T_1246; 
  wire [39:0] _T_1105; 
  wire  _T_1106; 
  wire  _T_1108; 
  wire  _T_1109; 
  wire  _T_1164; 
  wire [10:0] _T_1114; 
  wire [10:0] _T_1163; 
  wire [11:0] _T_1165; 
  wire [7:0] _T_1118; 
  wire [7:0] _T_1119; 
  wire [7:0] _T_1120; 
  wire [7:0] _T_1161; 
  wire  _T_1125; 
  wire  _T_1126; 
  wire  _T_1128; 
  wire  _T_1129; 
  wire  _T_1160; 
  wire [8:0] _T_1162; 
  wire [20:0] _T_1166; 
  wire [5:0] _T_1136; 
  wire [3:0] _T_1142; 
  wire [3:0] _T_1145; 
  wire [9:0] _T_1158; 
  wire [10:0] _T_1159; 
  wire [31:0] _T_1167; 
  wire [31:0] _T_1168; 
  wire [7:0] _T_1223; 
  wire  _T_1222; 
  wire [8:0] _T_1224; 
  wire [20:0] _T_1228; 
  wire [9:0] _T_1220; 
  wire [10:0] _T_1221; 
  wire [31:0] _T_1229; 
  wire [31:0] _T_1230; 
  wire [3:0] _T_1231; 
  wire [31:0] _T_1232; 
  wire [31:0] _T_1233; 
  wire [39:0] _GEN_243; 
  wire [39:0] _T_1235; 
  wire [39:0] mem_br_target; 
  wire [39:0] _T_1247; 
  wire [39:0] _T_1248; 
  wire [39:0] _T_1249; 
  wire [39:0] mem_npc; 
  wire  _T_1250; 
  wire  _T_1251; 
  wire  _T_1252; 
  wire  _T_1253; 
  wire  mem_wrong_npc; 
  wire  _T_1269; 
  wire  take_pc_mem; 
  wire  take_pc_mem_wb; 
  wire [31:0] _T_263; 
  wire  _T_264; 
  wire [31:0] _T_265; 
  wire  _T_266; 
  wire [31:0] _T_267; 
  wire  _T_268; 
  wire [31:0] _T_269; 
  wire  _T_270; 
  wire [31:0] _T_271; 
  wire  _T_272; 
  wire [31:0] _T_273; 
  wire  _T_274; 
  wire [31:0] _T_275; 
  wire  _T_276; 
  wire [31:0] _T_277; 
  wire  _T_278; 
  wire [31:0] _T_279; 
  wire  _T_280; 
  wire [31:0] _T_281; 
  wire  _T_282; 
  wire [31:0] _T_283; 
  wire  _T_284; 
  wire [31:0] _T_285; 
  wire  _T_286; 
  wire [31:0] _T_287; 
  wire  _T_288; 
  wire [31:0] _T_289; 
  wire  _T_290; 
  wire [31:0] _T_291; 
  wire  _T_292; 
  wire  _T_294; 
  wire [31:0] _T_295; 
  wire  _T_296; 
  wire  _T_298; 
  wire [31:0] _T_299; 
  wire  _T_300; 
  wire [31:0] _T_301; 
  wire  _T_302; 
  wire  _T_304; 
  wire [31:0] _T_305; 
  wire  _T_306; 
  wire [31:0] _T_307; 
  wire  _T_308; 
  wire [31:0] _T_309; 
  wire  _T_310; 
  wire [31:0] _T_311; 
  wire  _T_312; 
  wire  _T_313; 
  wire [31:0] _T_314; 
  wire  _T_315; 
  wire [31:0] _T_316; 
  wire  _T_317; 
  wire [31:0] _T_318; 
  wire  _T_319; 
  wire [31:0] _T_320; 
  wire  _T_321; 
  wire [31:0] _T_322; 
  wire  _T_323; 
  wire  _T_325; 
  wire [31:0] _T_326; 
  wire  _T_327; 
  wire  _T_328; 
  wire [31:0] _T_329; 
  wire  _T_330; 
  wire [31:0] _T_331; 
  wire  _T_332; 
  wire [31:0] _T_333; 
  wire  _T_334; 
  wire [31:0] _T_335; 
  wire  _T_336; 
  wire [31:0] _T_337; 
  wire  _T_338; 
  wire [31:0] _T_339; 
  wire  _T_340; 
  wire [31:0] _T_341; 
  wire  _T_342; 
  wire  _T_344; 
  wire  _T_345; 
  wire  _T_346; 
  wire  _T_347; 
  wire  _T_348; 
  wire  _T_349; 
  wire  _T_350; 
  wire  _T_351; 
  wire  _T_352; 
  wire  _T_353; 
  wire  _T_354; 
  wire  _T_355; 
  wire  _T_356; 
  wire  _T_357; 
  wire  _T_358; 
  wire  _T_359; 
  wire  _T_360; 
  wire  _T_361; 
  wire  _T_362; 
  wire  _T_363; 
  wire  _T_364; 
  wire  _T_365; 
  wire  _T_366; 
  wire  _T_367; 
  wire  _T_368; 
  wire  _T_369; 
  wire  _T_370; 
  wire  _T_371; 
  wire  _T_372; 
  wire  _T_373; 
  wire  _T_374; 
  wire  _T_375; 
  wire  _T_376; 
  wire  _T_377; 
  wire  _T_378; 
  wire  _T_379; 
  wire  _T_380; 
  wire  _T_381; 
  wire  _T_382; 
  wire  id_ctrl_legal; 
  wire [31:0] _T_384; 
  wire  _T_385; 
  wire [31:0] _T_386; 
  wire  _T_387; 
  wire  id_ctrl_fp; 
  wire [31:0] _T_390; 
  wire  id_ctrl_branch; 
  wire [31:0] _T_393; 
  wire  id_ctrl_jal; 
  wire [31:0] _T_396; 
  wire  id_ctrl_jalr; 
  wire [31:0] _T_399; 
  wire  _T_400; 
  wire [31:0] _T_401; 
  wire  _T_402; 
  wire [31:0] _T_403; 
  wire  _T_404; 
  wire [31:0] _T_405; 
  wire  _T_406; 
  wire  _T_408; 
  wire  _T_409; 
  wire  id_ctrl_rxs2; 
  wire [31:0] _T_411; 
  wire  _T_412; 
  wire [31:0] _T_413; 
  wire  _T_414; 
  wire [31:0] _T_415; 
  wire  _T_416; 
  wire [31:0] _T_417; 
  wire  _T_418; 
  wire [31:0] _T_419; 
  wire  _T_420; 
  wire  _T_422; 
  wire  _T_423; 
  wire  _T_424; 
  wire  id_ctrl_rxs1; 
  wire [31:0] _T_426; 
  wire  _T_427; 
  wire [31:0] _T_428; 
  wire  _T_429; 
  wire [31:0] _T_430; 
  wire  _T_431; 
  wire [31:0] _T_432; 
  wire  _T_433; 
  wire [31:0] _T_434; 
  wire  _T_435; 
  wire  _T_437; 
  wire  _T_438; 
  wire  _T_439; 
  wire  _T_440; 
  wire  _T_442; 
  wire [31:0] _T_443; 
  wire  _T_444; 
  wire [31:0] _T_445; 
  wire  _T_446; 
  wire  _T_448; 
  wire  _T_449; 
  wire  _T_450; 
  wire [1:0] id_ctrl_sel_alu2; 
  wire [31:0] _T_452; 
  wire  _T_453; 
  wire [31:0] _T_454; 
  wire  _T_455; 
  wire [31:0] _T_456; 
  wire  _T_457; 
  wire  _T_459; 
  wire  _T_460; 
  wire  _T_461; 
  wire  _T_462; 
  wire  _T_464; 
  wire  _T_466; 
  wire [1:0] id_ctrl_sel_alu1; 
  wire  _T_469; 
  wire  _T_471; 
  wire  _T_473; 
  wire [31:0] _T_474; 
  wire  _T_475; 
  wire  _T_477; 
  wire [31:0] _T_478; 
  wire  _T_479; 
  wire [31:0] _T_480; 
  wire  _T_481; 
  wire  _T_483; 
  wire  _T_485; 
  wire  _T_486; 
  wire [1:0] _T_487; 
  wire [2:0] id_ctrl_sel_imm; 
  wire [31:0] _T_489; 
  wire  _T_490; 
  wire [31:0] _T_491; 
  wire  _T_492; 
  wire  id_ctrl_alu_dw; 
  wire [31:0] _T_495; 
  wire  _T_496; 
  wire [31:0] _T_497; 
  wire  _T_498; 
  wire [31:0] _T_499; 
  wire  _T_500; 
  wire [31:0] _T_501; 
  wire  _T_502; 
  wire  _T_504; 
  wire  _T_505; 
  wire  _T_506; 
  wire [31:0] _T_507; 
  wire  _T_508; 
  wire [31:0] _T_509; 
  wire  _T_510; 
  wire  _T_512; 
  wire [31:0] _T_513; 
  wire  _T_514; 
  wire [31:0] _T_515; 
  wire  _T_516; 
  wire [31:0] _T_517; 
  wire  _T_518; 
  wire [31:0] _T_519; 
  wire  _T_520; 
  wire  _T_522; 
  wire  _T_523; 
  wire  _T_524; 
  wire  _T_525; 
  wire  _T_526; 
  wire  _T_527; 
  wire [31:0] _T_528; 
  wire  _T_529; 
  wire [31:0] _T_530; 
  wire  _T_531; 
  wire [31:0] _T_532; 
  wire  _T_533; 
  wire [31:0] _T_534; 
  wire  _T_535; 
  wire [31:0] _T_536; 
  wire  _T_537; 
  wire  _T_539; 
  wire  _T_540; 
  wire  _T_541; 
  wire  _T_542; 
  wire [31:0] _T_543; 
  wire  _T_544; 
  wire [31:0] _T_545; 
  wire  _T_546; 
  wire [31:0] _T_547; 
  wire  _T_548; 
  wire  _T_550; 
  wire  _T_551; 
  wire  _T_552; 
  wire  _T_553; 
  wire [1:0] _T_554; 
  wire [1:0] _T_555; 
  wire [3:0] id_ctrl_alu_fn; 
  wire [31:0] _T_557; 
  wire  _T_558; 
  wire [31:0] _T_559; 
  wire  _T_560; 
  wire  _T_562; 
  wire  _T_563; 
  wire  _T_564; 
  wire  _T_565; 
  wire  _T_566; 
  wire  _T_567; 
  wire  _T_568; 
  wire  id_ctrl_mem; 
  wire [31:0] _T_570; 
  wire  _T_571; 
  wire  _T_573; 
  wire [31:0] _T_574; 
  wire  _T_575; 
  wire [31:0] _T_576; 
  wire  _T_577; 
  wire  _T_579; 
  wire  _T_580; 
  wire  _T_581; 
  wire [31:0] _T_582; 
  wire  _T_583; 
  wire [31:0] _T_584; 
  wire  _T_585; 
  wire  _T_587; 
  wire [31:0] _T_588; 
  wire  _T_589; 
  wire [31:0] _T_590; 
  wire  _T_591; 
  wire [31:0] _T_592; 
  wire  _T_593; 
  wire [31:0] _T_594; 
  wire  _T_595; 
  wire  _T_597; 
  wire  _T_598; 
  wire  _T_599; 
  wire  _T_600; 
  wire [31:0] _T_601; 
  wire  _T_602; 
  wire [1:0] _T_605; 
  wire [1:0] _T_606; 
  wire [2:0] _T_607; 
  wire [4:0] id_ctrl_mem_cmd; 
  wire [31:0] _T_609; 
  wire  _T_610; 
  wire [31:0] _T_612; 
  wire  _T_613; 
  wire  _T_615; 
  wire [31:0] _T_616; 
  wire  _T_617; 
  wire [1:0] _T_619; 
  wire [2:0] id_ctrl_mem_type; 
  wire [31:0] _T_621; 
  wire  _T_622; 
  wire [31:0] _T_623; 
  wire [31:0] _T_625; 
  wire  id_ctrl_rfs3; 
  wire [31:0] _T_641; 
  wire  _T_642; 
  wire  _T_644; 
  wire  _T_646; 
  wire  _T_647; 
  wire  id_ctrl_wfd; 
  wire [31:0] _T_649; 
  wire  id_ctrl_div; 
  wire  _T_653; 
  wire  _T_655; 
  wire [31:0] _T_656; 
  wire  _T_657; 
  wire [31:0] _T_658; 
  wire  _T_659; 
  wire [31:0] _T_660; 
  wire  _T_661; 
  wire [31:0] _T_662; 
  wire  _T_663; 
  wire [31:0] _T_664; 
  wire  _T_665; 
  wire  _T_667; 
  wire  _T_668; 
  wire  _T_669; 
  wire  _T_670; 
  wire  _T_671; 
  wire  id_ctrl_wxd; 
  wire [31:0] _T_673; 
  wire  _T_674; 
  wire [31:0] _T_676; 
  wire  _T_677; 
  wire [31:0] _T_679; 
  wire  _T_680; 
  wire [31:0] _T_681; 
  wire  _T_682; 
  wire [31:0] _T_683; 
  wire  _T_684; 
  wire  _T_686; 
  wire  _T_687; 
  wire  _T_688; 
  wire  _T_689; 
  wire [1:0] _T_690; 
  wire [2:0] id_ctrl_csr; 
  wire [31:0] _T_692; 
  wire  id_ctrl_fence_i; 
  wire  id_ctrl_fence; 
  wire [31:0] _T_698; 
  wire  id_ctrl_amo; 
  wire [31:0] _T_701; 
  wire  _T_702; 
  wire [31:0] _T_703; 
  wire  _T_704; 
  wire [31:0] _T_705; 
  wire  _T_706; 
  wire  _T_708; 
  wire  id_ctrl_dp; 
  reg  id_reg_fence; 
  reg [31:0] _RAND_85;
  wire  _T_717; 
  wire [4:0] _T_719; 
  wire [63:0] _T_722; 
  wire [4:0] _T_727; 
  wire [63:0] _T_730; 
  wire  _T_801; 
  wire  _T_802; 
  wire  _T_803; 
  wire  _T_804; 
  wire  id_csr_en; 
  wire  id_system_insn; 
  wire  id_csr_ren; 
  wire  _T_809; 
  wire  id_sfence; 
  wire  _T_810; 
  wire  _T_811; 
  wire  _T_812; 
  wire  _T_813; 
  wire  id_csr_flush; 
  wire  _T_814; 
  wire  _T_816; 
  wire  _T_817; 
  wire  _T_818; 
  wire  _T_819; 
  wire  _T_820; 
  wire  _T_821; 
  wire  _T_822; 
  wire  _T_823; 
  wire  _T_824; 
  wire  _T_825; 
  wire  _T_826; 
  wire  _T_827; 
  wire  _T_828; 
  wire  _T_829; 
  wire  _T_830; 
  wire  _T_831; 
  wire  _T_832; 
  wire  _T_833; 
  wire  _T_834; 
  wire  _T_840; 
  wire  _T_841; 
  wire  _T_842; 
  wire  _T_843; 
  wire  _T_844; 
  wire  _T_846; 
  wire  _T_847; 
  wire  id_illegal_insn; 
  wire  id_amo_aq; 
  wire  id_amo_rl; 
  wire  _T_848; 
  wire  id_fence_next; 
  wire  _T_849; 
  wire  id_mem_busy; 
  wire  _T_850; 
  wire  _T_858; 
  wire  _T_859; 
  wire  _T_861; 
  wire  _T_862; 
  wire  id_do_fence; 
  wire  _T_866; 
  wire  _T_867; 
  wire  _T_868; 
  wire  _T_869; 
  wire  _T_870; 
  wire  _T_871; 
  wire  id_xcpt; 
  wire [1:0] _T_872; 
  wire [3:0] _T_873; 
  wire [3:0] _T_874; 
  wire [3:0] _T_875; 
  wire [3:0] _T_876; 
  wire [3:0] _T_877; 
  wire [4:0] ex_waddr; 
  wire [4:0] mem_waddr; 
  wire [4:0] wb_waddr; 
  wire  _T_888; 
  wire  _T_889; 
  wire  _T_890; 
  wire  _T_891; 
  wire  _T_893; 
  wire  _T_895; 
  wire  _T_896; 
  wire  _T_897; 
  wire  _T_898; 
  wire  _T_900; 
  wire  _T_901; 
  wire  _T_903; 
  wire  _T_904; 
  wire  _T_905; 
  wire  _T_906; 
  wire  _T_908; 
  reg  ex_reg_rs_bypass_0; 
  reg [31:0] _RAND_86;
  reg  ex_reg_rs_bypass_1; 
  reg [31:0] _RAND_87;
  reg [1:0] ex_reg_rs_lsb_0; 
  reg [31:0] _RAND_88;
  reg [1:0] ex_reg_rs_lsb_1; 
  reg [31:0] _RAND_89;
  reg [61:0] ex_reg_rs_msb_0; 
  reg [63:0] _RAND_90;
  reg [61:0] ex_reg_rs_msb_1; 
  reg [63:0] _RAND_91;
  wire  _T_930; 
  wire [63:0] _T_931; 
  wire  _T_932; 
  wire [63:0] _T_933; 
  wire  _T_934; 
  wire [63:0] _T_935; 
  wire [63:0] _T_936; 
  wire [63:0] _T_937; 
  wire  _T_938; 
  wire [63:0] _T_939; 
  wire  _T_940; 
  wire [63:0] _T_941; 
  wire  _T_942; 
  wire [63:0] _T_943; 
  wire [63:0] _T_944; 
  wire [63:0] _T_945; 
  wire  _T_946; 
  wire  _T_947; 
  wire  _T_948; 
  wire  _T_949; 
  wire  _T_950; 
  wire [10:0] _T_951; 
  wire [10:0] _T_952; 
  wire [10:0] _T_953; 
  wire  _T_954; 
  wire  _T_955; 
  wire  _T_956; 
  wire [7:0] _T_957; 
  wire [7:0] _T_958; 
  wire [7:0] _T_959; 
  wire  _T_962; 
  wire  _T_963; 
  wire  _T_964; 
  wire  _T_965; 
  wire  _T_966; 
  wire  _T_967; 
  wire  _T_968; 
  wire  _T_969; 
  wire  _T_970; 
  wire  _T_971; 
  wire [5:0] _T_975; 
  wire [5:0] _T_976; 
  wire  _T_978; 
  wire  _T_980; 
  wire [3:0] _T_981; 
  wire [3:0] _T_983; 
  wire [3:0] _T_984; 
  wire [3:0] _T_985; 
  wire [3:0] _T_986; 
  wire [3:0] _T_987; 
  wire  _T_990; 
  wire  _T_993; 
  wire  _T_994; 
  wire  _T_995; 
  wire  _T_996; 
  wire [9:0] _T_997; 
  wire [10:0] _T_998; 
  wire  _T_999; 
  wire [7:0] _T_1000; 
  wire [8:0] _T_1001; 
  wire [10:0] _T_1002; 
  wire  _T_1003; 
  wire [11:0] _T_1004; 
  wire [20:0] _T_1005; 
  wire [31:0] _T_1006; 
  wire [31:0] ex_imm; 
  wire [63:0] _T_1007; 
  wire [39:0] _T_1008; 
  wire  _T_1009; 
  wire [39:0] _T_1010; 
  wire  _T_1011; 
  wire [63:0] ex_op1; 
  wire [63:0] _T_1012; 
  wire [3:0] _T_1013; 
  wire  _T_1014; 
  wire [3:0] _T_1015; 
  wire  _T_1016; 
  wire [31:0] _T_1017; 
  wire  _T_1018; 
  wire [63:0] ex_op2; 
  wire  _T_1692; 
  wire  _T_1693; 
  wire  _T_1694; 
  wire  _T_1497; 
  wire  _T_1498; 
  wire  _T_1545; 
  wire  _T_1546; 
  wire  _T_1499; 
  wire  _T_1500; 
  wire  _T_1547; 
  wire  _T_1548; 
  wire  _T_1551; 
  wire  _T_1501; 
  wire  _T_1502; 
  wire  _T_1549; 
  wire  _T_1550; 
  wire  _T_1552; 
  wire  data_hazard_ex; 
  wire  _T_1539; 
  wire  _T_1540; 
  wire  _T_1541; 
  wire  _T_1543; 
  wire  ex_cannot_bypass; 
  wire  _T_1564; 
  wire  _T_1554; 
  wire  _T_1556; 
  wire  _T_1561; 
  wire  _T_1557; 
  wire  _T_1558; 
  wire  _T_1562; 
  wire  _T_1560; 
  wire  _T_1563; 
  wire  fp_data_hazard_ex; 
  wire  _T_1565; 
  wire  id_ex_hazard; 
  wire  _T_1572; 
  wire  _T_1573; 
  wire  _T_1574; 
  wire  _T_1575; 
  wire  _T_1578; 
  wire  _T_1576; 
  wire  _T_1577; 
  wire  _T_1579; 
  wire  data_hazard_mem; 
  wire  _T_1566; 
  wire  _T_1567; 
  wire  _T_1568; 
  wire  _T_1569; 
  wire  _T_1570; 
  wire  _T_1571; 
  wire  mem_cannot_bypass; 
  wire  _T_1591; 
  wire  _T_1581; 
  wire  _T_1583; 
  wire  _T_1588; 
  wire  _T_1584; 
  wire  _T_1585; 
  wire  _T_1589; 
  wire  _T_1587; 
  wire  _T_1590; 
  wire  fp_data_hazard_mem; 
  wire  _T_1592; 
  wire  id_mem_hazard; 
  wire  _T_1665; 
  wire  _T_1595; 
  wire  _T_1596; 
  wire  _T_1597; 
  wire  _T_1598; 
  wire  _T_1601; 
  wire  _T_1599; 
  wire  _T_1600; 
  wire  _T_1602; 
  wire  data_hazard_wb; 
  wire  _T_1064; 
  wire  wb_dcache_miss; 
  wire  _T_1426; 
  wire  wb_set_sboard; 
  wire  _T_1614; 
  wire  _T_1604; 
  wire  _T_1606; 
  wire  _T_1611; 
  wire  _T_1607; 
  wire  _T_1608; 
  wire  _T_1612; 
  wire  _T_1610; 
  wire  _T_1613; 
  wire  fp_data_hazard_wb; 
  wire  _T_1615; 
  wire  id_wb_hazard; 
  wire  _T_1666; 
  reg [31:0] _T_1504; 
  reg [31:0] _RAND_92;
  wire [30:0] _T_1505; 
  wire [31:0] _GEN_245; 
  wire [31:0] _T_1506; 
  wire [31:0] _T_1512; 
  wire  _T_1513; 
  wire  dmem_resp_valid; 
  wire  dmem_resp_replay; 
  wire  _T_1432; 
  wire  dmem_resp_xpu; 
  wire  _T_1440; 
  wire  _T_1438; 
  wire  ll_wen; 
  wire [4:0] dmem_resp_waddr; 
  wire [4:0] ll_waddr; 
  wire  _T_1514; 
  wire  _T_1515; 
  wire  _T_1516; 
  wire  _T_1517; 
  wire  _T_1518; 
  wire [31:0] _T_1519; 
  wire  _T_1520; 
  wire  _T_1521; 
  wire  _T_1522; 
  wire  _T_1523; 
  wire  _T_1524; 
  wire  _T_1525; 
  wire  _T_1533; 
  wire [31:0] _T_1526; 
  wire  _T_1527; 
  wire  _T_1528; 
  wire  _T_1529; 
  wire  _T_1530; 
  wire  _T_1531; 
  wire  _T_1532; 
  wire  id_sboard_hazard; 
  wire  _T_1667; 
  wire  _T_1668; 
  wire  _T_1669; 
  wire  _T_1670; 
  wire  _T_1671; 
  wire  _T_1672; 
  wire  _T_1673; 
  wire  _T_1674; 
  wire  _T_1675; 
  reg [31:0] _T_1617; 
  reg [31:0] _RAND_93;
  wire [31:0] _T_1636; 
  wire  _T_1637; 
  wire  _T_1638; 
  wire [31:0] _T_1639; 
  wire  _T_1640; 
  wire  _T_1641; 
  wire  _T_1648; 
  wire [31:0] _T_1642; 
  wire  _T_1643; 
  wire  _T_1644; 
  wire  _T_1649; 
  wire [31:0] _T_1645; 
  wire  _T_1646; 
  wire  _T_1647; 
  wire  id_stall_fpu; 
  wire  _T_1676; 
  wire  _T_1677; 
  reg  blocked; 
  reg [31:0] _RAND_94;
  wire  _T_1658; 
  wire  dcache_blocked; 
  wire  _T_1678; 
  wire  _T_1679; 
  wire  wb_wxd; 
  wire  _T_1682; 
  wire  _T_1683; 
  wire  _T_1684; 
  wire  _T_1685; 
  wire  _T_1686; 
  wire  _T_1687; 
  wire  _T_1688; 
  wire  _T_1691; 
  wire  ctrl_stalld; 
  wire  _T_1695; 
  wire  ctrl_killd; 
  wire  _T_1022; 
  wire  _T_1023; 
  wire  _T_1024; 
  wire [1:0] _T_1032; 
  wire  _T_1033; 
  wire [1:0] _T_1034; 
  wire  _T_1035; 
  wire  _T_1036; 
  wire  _T_1037; 
  wire [1:0] _T_1040; 
  wire  _T_1041; 
  wire  _T_1042; 
  wire  do_bypass; 
  wire  _T_1045; 
  wire  _T_1046; 
  wire  _T_1441; 
  wire  _T_1442; 
  wire  _T_1443; 
  wire  wb_valid; 
  wire  wb_wen; 
  wire  rf_wen; 
  wire [4:0] rf_waddr; 
  wire  _T_1450; 
  wire  _T_1454; 
  wire  _T_1444; 
  wire [63:0] ll_wdata; 
  wire  _T_1446; 
  wire [63:0] _T_1448; 
  wire [63:0] _T_1449; 
  wire [63:0] rf_wdata; 
  wire [63:0] _GEN_214; 
  wire [63:0] _GEN_221; 
  wire [63:0] _GEN_228; 
  wire [1:0] _T_1047; 
  wire [61:0] _T_1048; 
  wire  _T_1049; 
  wire  _T_1050; 
  wire  do_bypass_1; 
  wire  _T_1053; 
  wire  _T_1054; 
  wire  _T_1455; 
  wire [63:0] _GEN_215; 
  wire [63:0] _GEN_222; 
  wire [63:0] _GEN_229; 
  wire [1:0] _T_1055; 
  wire [61:0] _T_1056; 
  wire [15:0] _T_1057; 
  wire [31:0] inst; 
  wire [1:0] _T_1058; 
  wire [29:0] _T_1059; 
  wire  _T_1593; 
  wire  id_load_use; 
  wire  _T_1061; 
  wire  _T_1062; 
  wire  _T_1065; 
  wire  _T_1066; 
  wire  _T_1067; 
  wire  _T_1068; 
  wire  replay_ex_structural; 
  wire  replay_ex_load_use; 
  wire  _T_1069; 
  wire  _T_1070; 
  wire  replay_ex; 
  wire  _T_1071; 
  wire  _T_1072; 
  wire  ctrl_killx; 
  wire  _T_1073; 
  wire  _T_1084; 
  wire  _T_1085; 
  wire  _T_1086; 
  wire  _T_1087; 
  wire  _T_1089; 
  wire  _T_1090; 
  wire  _T_1091; 
  wire  ex_slow_bypass; 
  wire  _T_1093; 
  wire  ex_sfence; 
  wire  ex_xcpt; 
  wire  _T_1104; 
  wire  mem_pc_valid; 
  wire  _T_1256; 
  wire  _T_1257; 
  wire  _T_1258; 
  wire  mem_npc_misaligned; 
  wire  _T_1259; 
  wire  _T_1260; 
  wire  _T_1261; 
  wire [63:0] _T_1263; 
  wire [63:0] mem_int_wdata; 
  wire  _T_1264; 
  wire  mem_cfi; 
  wire  _T_1266; 
  wire  mem_cfi_taken; 
  wire  _T_1271; 
  wire  _T_1278; 
  wire  _T_1279; 
  wire  _T_1280; 
  wire  _T_1281; 
  wire  _T_1283; 
  wire  _T_1284; 
  wire  _T_1285; 
  wire  _T_1286; 
  wire  _T_1287; 
  wire  _T_1288; 
  wire  _T_1289; 
  wire  _T_1290; 
  wire  _T_1291; 
  wire  _T_1292; 
  wire  _T_1293; 
  wire  _T_1294; 
  wire  _T_1295; 
  wire  _T_1296; 
  wire  _T_1297; 
  wire  _T_1298; 
  wire  _T_1299; 
  wire  _T_1300; 
  wire  _T_1301; 
  wire  _T_1302; 
  wire  _T_1303; 
  wire  _T_1304; 
  wire  _T_1305; 
  wire  _T_1307; 
  wire  _T_1325; 
  wire  _T_1326; 
  wire  _T_1328; 
  wire  _T_1329; 
  wire [1:0] _T_1330; 
  wire  _T_1331; 
  wire [7:0] _T_1332; 
  wire [15:0] _T_1333; 
  wire [31:0] _T_1334; 
  wire [63:0] _T_1335; 
  wire  _T_1336; 
  wire [15:0] _T_1337; 
  wire [31:0] _T_1338; 
  wire [63:0] _T_1339; 
  wire  _T_1340; 
  wire [31:0] _T_1341; 
  wire [63:0] _T_1342; 
  wire  _T_1346; 
  wire  _T_1347; 
  wire  _T_1348; 
  wire  mem_breakpoint; 
  wire  _T_1349; 
  wire  _T_1350; 
  wire  mem_debug_breakpoint; 
  wire  mem_ldst_xcpt; 
  wire [3:0] mem_ldst_cause; 
  wire  _T_1351; 
  wire  _T_1352; 
  wire  _T_1353; 
  wire  _T_1354; 
  wire  mem_xcpt; 
  wire [3:0] _T_1355; 
  wire  dcache_kill_mem; 
  wire  _T_1369; 
  wire  fpu_kill_mem; 
  wire  _T_1370; 
  wire  replay_mem; 
  wire  _T_1371; 
  wire  _T_1372; 
  wire  _T_1373; 
  wire  killm_common; 
  reg  _T_1376; 
  reg [31:0] _RAND_95;
  wire  _T_1378; 
  wire  ctrl_killm; 
  wire  _T_1379; 
  wire  _T_1380; 
  wire  _T_1387; 
  wire  _T_1388; 
  wire [2:0] _T_1408; 
  wire [3:0] _T_1409; 
  wire [3:0] _T_1410; 
  wire [3:0] _T_1411; 
  wire [3:0] _T_1412; 
  wire [63:0] wb_cause; 
  wire  _T_1413; 
  wire  _T_1415; 
  wire  _T_1417; 
  wire  _T_1419; 
  wire  _T_1421; 
  wire  _T_1423; 
  wire [1:0] _T_1457; 
  wire [1:0] _T_1458; 
  wire  _T_1459; 
  wire [15:0] _T_1460; 
  wire [15:0] _T_1461; 
  wire [15:0] _T_1462; 
  wire  _T_1464; 
  wire  _T_1465; 
  wire  _T_1470; 
  wire  _T_1473; 
  wire  _T_1474; 
  wire  _T_1475; 
  wire  _T_1476; 
  wire  _T_1477; 
  wire  _T_1478; 
  wire  _T_1479; 
  wire  _T_1480; 
  wire  _T_1481; 
  wire  _T_1482; 
  wire  tval_valid; 
  wire [63:0] _T_1483; 
  wire [24:0] a_1; 
  wire  _T_1484; 
  wire  _T_1485; 
  wire  _T_1486; 
  wire  _T_1487; 
  wire  _T_1488; 
  wire  _T_1489; 
  wire  msb_1; 
  wire [38:0] _T_1490; 
  wire [39:0] _T_1491; 
  wire [2:0] _T_1494; 
  wire [2:0] _T_1495; 
  wire [31:0] _T_1507; 
  wire [31:0] _T_1508; 
  wire [31:0] _T_1509; 
  wire [31:0] _T_1510; 
  wire  _T_1534; 
  wire [31:0] _T_1535; 
  wire [31:0] _T_1536; 
  wire [31:0] _T_1537; 
  wire  _T_1538; 
  wire  _T_1618; 
  wire  _T_1619; 
  wire  _T_1620; 
  wire [31:0] _T_1622; 
  wire [31:0] _T_1623; 
  wire  _T_1625; 
  wire [31:0] _T_1626; 
  wire [31:0] _T_1627; 
  wire [31:0] _T_1628; 
  wire [31:0] _T_1629; 
  wire  _T_1630; 
  wire [31:0] _T_1631; 
  wire [31:0] _T_1632; 
  wire [31:0] _T_1633; 
  wire [31:0] _T_1634; 
  wire  _T_1635; 
  wire  _T_1652; 
  wire  _T_1654; 
  wire  _T_1655; 
  wire  _T_1656; 
  wire  _T_1698; 
  wire [39:0] _T_1699; 
  wire  _T_1701; 
  wire  _T_1702; 
  wire  _T_1704; 
  wire  _T_1705; 
  wire  _T_1712; 
  wire  _T_1713; 
  wire  _T_1714; 
  wire  _T_1715; 
  wire  _T_1717; 
  wire  _T_1718; 
  wire  _T_1719; 
  wire [4:0] _T_1720; 
  wire [4:0] _T_1721; 
  wire  _T_1722; 
  wire  _T_1723; 
  wire [1:0] _T_1726; 
  wire [1:0] _T_1728; 
  wire [39:0] _GEN_246; 
  wire [39:0] _T_1730; 
  wire [38:0] _T_1731; 
  wire [38:0] _T_1732; 
  wire [5:0] ex_dcache_tag; 
  wire [24:0] a_2; 
  wire  _T_1742; 
  wire  _T_1743; 
  wire  _T_1744; 
  wire  _T_1745; 
  wire  _T_1746; 
  wire  _T_1747; 
  wire  msb_2; 
  wire [38:0] _T_1748; 
  wire  _T_1751; 
  wire [4:0] _T_1769; 
  wire [4:0] _T_1770; 
  wire [31:0] coreMonitorBundle_time; 
  wire  _T_1777; 
  wire  coreMonitorBundle_valid; 
  wire [39:0] coreMonitorBundle_pc; 
  wire  _T_1781; 
  wire  _T_1782; 
  wire [4:0] coreMonitorBundle_wrdst; 
  reg [63:0] _T_1786; 
  reg [63:0] _RAND_96;
  reg [63:0] coreMonitorBundle_rd0val; 
  reg [63:0] _RAND_97;
  reg [63:0] _T_1791; 
  reg [63:0] _RAND_98;
  reg [63:0] coreMonitorBundle_rd1val; 
  reg [63:0] _RAND_99;
  wire  _T_1795; 
  wire [31:0] coreMonitorBundle_inst; 
  IBuf ibuf ( 
    .clock(ibuf_clock),
    .reset(ibuf_reset),
    .io_imem_ready(ibuf_io_imem_ready),
    .io_imem_valid(ibuf_io_imem_valid),
    .io_imem_bits_btb_taken(ibuf_io_imem_bits_btb_taken),
    .io_imem_bits_btb_bridx(ibuf_io_imem_bits_btb_bridx),
    .io_imem_bits_btb_entry(ibuf_io_imem_bits_btb_entry),
    .io_imem_bits_btb_bht_history(ibuf_io_imem_bits_btb_bht_history),
    .io_imem_bits_pc(ibuf_io_imem_bits_pc),
    .io_imem_bits_data(ibuf_io_imem_bits_data),
    .io_imem_bits_xcpt_pf_inst(ibuf_io_imem_bits_xcpt_pf_inst),
    .io_imem_bits_xcpt_ae_inst(ibuf_io_imem_bits_xcpt_ae_inst),
    .io_imem_bits_replay(ibuf_io_imem_bits_replay),
    .io_kill(ibuf_io_kill),
    .io_pc(ibuf_io_pc),
    .io_btb_resp_entry(ibuf_io_btb_resp_entry),
    .io_btb_resp_bht_history(ibuf_io_btb_resp_bht_history),
    .io_inst_0_ready(ibuf_io_inst_0_ready),
    .io_inst_0_valid(ibuf_io_inst_0_valid),
    .io_inst_0_bits_xcpt0_pf_inst(ibuf_io_inst_0_bits_xcpt0_pf_inst),
    .io_inst_0_bits_xcpt0_ae_inst(ibuf_io_inst_0_bits_xcpt0_ae_inst),
    .io_inst_0_bits_xcpt1_pf_inst(ibuf_io_inst_0_bits_xcpt1_pf_inst),
    .io_inst_0_bits_xcpt1_ae_inst(ibuf_io_inst_0_bits_xcpt1_ae_inst),
    .io_inst_0_bits_replay(ibuf_io_inst_0_bits_replay),
    .io_inst_0_bits_rvc(ibuf_io_inst_0_bits_rvc),
    .io_inst_0_bits_inst_bits(ibuf_io_inst_0_bits_inst_bits),
    .io_inst_0_bits_inst_rd(ibuf_io_inst_0_bits_inst_rd),
    .io_inst_0_bits_inst_rs1(ibuf_io_inst_0_bits_inst_rs1),
    .io_inst_0_bits_inst_rs2(ibuf_io_inst_0_bits_inst_rs2),
    .io_inst_0_bits_inst_rs3(ibuf_io_inst_0_bits_inst_rs3),
    .io_inst_0_bits_raw(ibuf_io_inst_0_bits_raw)
  );
  CSRFile csr ( 
    .clock(csr_clock),
    .reset(csr_reset),
    .io_ungated_clock(csr_io_ungated_clock),
    .io_interrupts_debug(csr_io_interrupts_debug),
    .io_interrupts_mtip(csr_io_interrupts_mtip),
    .io_interrupts_msip(csr_io_interrupts_msip),
    .io_interrupts_meip(csr_io_interrupts_meip),
    .io_interrupts_seip(csr_io_interrupts_seip),
    .io_hartid(csr_io_hartid),
    .io_rw_addr(csr_io_rw_addr),
    .io_rw_cmd(csr_io_rw_cmd),
    .io_rw_rdata(csr_io_rw_rdata),
    .io_rw_wdata(csr_io_rw_wdata),
    .io_decode_0_csr(csr_io_decode_0_csr),
    .io_decode_0_fp_illegal(csr_io_decode_0_fp_illegal),
    .io_decode_0_fp_csr(csr_io_decode_0_fp_csr),
    .io_decode_0_read_illegal(csr_io_decode_0_read_illegal),
    .io_decode_0_write_illegal(csr_io_decode_0_write_illegal),
    .io_decode_0_write_flush(csr_io_decode_0_write_flush),
    .io_decode_0_system_illegal(csr_io_decode_0_system_illegal),
    .io_csr_stall(csr_io_csr_stall),
    .io_eret(csr_io_eret),
    .io_singleStep(csr_io_singleStep),
    .io_status_debug(csr_io_status_debug),
    .io_status_isa(csr_io_status_isa),
    .io_status_dprv(csr_io_status_dprv),
    .io_status_prv(csr_io_status_prv),
    .io_status_sd(csr_io_status_sd),
    .io_status_zero2(csr_io_status_zero2),
    .io_status_sxl(csr_io_status_sxl),
    .io_status_uxl(csr_io_status_uxl),
    .io_status_sd_rv32(csr_io_status_sd_rv32),
    .io_status_zero1(csr_io_status_zero1),
    .io_status_tsr(csr_io_status_tsr),
    .io_status_tw(csr_io_status_tw),
    .io_status_tvm(csr_io_status_tvm),
    .io_status_mxr(csr_io_status_mxr),
    .io_status_sum(csr_io_status_sum),
    .io_status_mprv(csr_io_status_mprv),
    .io_status_xs(csr_io_status_xs),
    .io_status_fs(csr_io_status_fs),
    .io_status_mpp(csr_io_status_mpp),
    .io_status_hpp(csr_io_status_hpp),
    .io_status_spp(csr_io_status_spp),
    .io_status_mpie(csr_io_status_mpie),
    .io_status_hpie(csr_io_status_hpie),
    .io_status_spie(csr_io_status_spie),
    .io_status_upie(csr_io_status_upie),
    .io_status_mie(csr_io_status_mie),
    .io_status_hie(csr_io_status_hie),
    .io_status_sie(csr_io_status_sie),
    .io_status_uie(csr_io_status_uie),
    .io_ptbr_mode(csr_io_ptbr_mode),
    .io_ptbr_ppn(csr_io_ptbr_ppn),
    .io_evec(csr_io_evec),
    .io_exception(csr_io_exception),
    .io_retire(csr_io_retire),
    .io_cause(csr_io_cause),
    .io_pc(csr_io_pc),
    .io_tval(csr_io_tval),
    .io_time(csr_io_time),
    .io_fcsr_rm(csr_io_fcsr_rm),
    .io_fcsr_flags_valid(csr_io_fcsr_flags_valid),
    .io_fcsr_flags_bits(csr_io_fcsr_flags_bits),
    .io_rocc_interrupt(csr_io_rocc_interrupt),
    .io_interrupt(csr_io_interrupt),
    .io_interrupt_cause(csr_io_interrupt_cause),
    .io_bp_0_control_action(csr_io_bp_0_control_action),
    .io_bp_0_control_tmatch(csr_io_bp_0_control_tmatch),
    .io_bp_0_control_m(csr_io_bp_0_control_m),
    .io_bp_0_control_s(csr_io_bp_0_control_s),
    .io_bp_0_control_u(csr_io_bp_0_control_u),
    .io_bp_0_control_x(csr_io_bp_0_control_x),
    .io_bp_0_control_w(csr_io_bp_0_control_w),
    .io_bp_0_control_r(csr_io_bp_0_control_r),
    .io_bp_0_address(csr_io_bp_0_address),
    .io_pmp_0_cfg_l(csr_io_pmp_0_cfg_l),
    .io_pmp_0_cfg_a(csr_io_pmp_0_cfg_a),
    .io_pmp_0_cfg_x(csr_io_pmp_0_cfg_x),
    .io_pmp_0_cfg_w(csr_io_pmp_0_cfg_w),
    .io_pmp_0_cfg_r(csr_io_pmp_0_cfg_r),
    .io_pmp_0_addr(csr_io_pmp_0_addr),
    .io_pmp_0_mask(csr_io_pmp_0_mask),
    .io_pmp_1_cfg_l(csr_io_pmp_1_cfg_l),
    .io_pmp_1_cfg_a(csr_io_pmp_1_cfg_a),
    .io_pmp_1_cfg_x(csr_io_pmp_1_cfg_x),
    .io_pmp_1_cfg_w(csr_io_pmp_1_cfg_w),
    .io_pmp_1_cfg_r(csr_io_pmp_1_cfg_r),
    .io_pmp_1_addr(csr_io_pmp_1_addr),
    .io_pmp_1_mask(csr_io_pmp_1_mask),
    .io_pmp_2_cfg_l(csr_io_pmp_2_cfg_l),
    .io_pmp_2_cfg_a(csr_io_pmp_2_cfg_a),
    .io_pmp_2_cfg_x(csr_io_pmp_2_cfg_x),
    .io_pmp_2_cfg_w(csr_io_pmp_2_cfg_w),
    .io_pmp_2_cfg_r(csr_io_pmp_2_cfg_r),
    .io_pmp_2_addr(csr_io_pmp_2_addr),
    .io_pmp_2_mask(csr_io_pmp_2_mask),
    .io_pmp_3_cfg_l(csr_io_pmp_3_cfg_l),
    .io_pmp_3_cfg_a(csr_io_pmp_3_cfg_a),
    .io_pmp_3_cfg_x(csr_io_pmp_3_cfg_x),
    .io_pmp_3_cfg_w(csr_io_pmp_3_cfg_w),
    .io_pmp_3_cfg_r(csr_io_pmp_3_cfg_r),
    .io_pmp_3_addr(csr_io_pmp_3_addr),
    .io_pmp_3_mask(csr_io_pmp_3_mask),
    .io_pmp_4_cfg_l(csr_io_pmp_4_cfg_l),
    .io_pmp_4_cfg_a(csr_io_pmp_4_cfg_a),
    .io_pmp_4_cfg_x(csr_io_pmp_4_cfg_x),
    .io_pmp_4_cfg_w(csr_io_pmp_4_cfg_w),
    .io_pmp_4_cfg_r(csr_io_pmp_4_cfg_r),
    .io_pmp_4_addr(csr_io_pmp_4_addr),
    .io_pmp_4_mask(csr_io_pmp_4_mask),
    .io_pmp_5_cfg_l(csr_io_pmp_5_cfg_l),
    .io_pmp_5_cfg_a(csr_io_pmp_5_cfg_a),
    .io_pmp_5_cfg_x(csr_io_pmp_5_cfg_x),
    .io_pmp_5_cfg_w(csr_io_pmp_5_cfg_w),
    .io_pmp_5_cfg_r(csr_io_pmp_5_cfg_r),
    .io_pmp_5_addr(csr_io_pmp_5_addr),
    .io_pmp_5_mask(csr_io_pmp_5_mask),
    .io_pmp_6_cfg_l(csr_io_pmp_6_cfg_l),
    .io_pmp_6_cfg_a(csr_io_pmp_6_cfg_a),
    .io_pmp_6_cfg_x(csr_io_pmp_6_cfg_x),
    .io_pmp_6_cfg_w(csr_io_pmp_6_cfg_w),
    .io_pmp_6_cfg_r(csr_io_pmp_6_cfg_r),
    .io_pmp_6_addr(csr_io_pmp_6_addr),
    .io_pmp_6_mask(csr_io_pmp_6_mask),
    .io_pmp_7_cfg_l(csr_io_pmp_7_cfg_l),
    .io_pmp_7_cfg_a(csr_io_pmp_7_cfg_a),
    .io_pmp_7_cfg_x(csr_io_pmp_7_cfg_x),
    .io_pmp_7_cfg_w(csr_io_pmp_7_cfg_w),
    .io_pmp_7_cfg_r(csr_io_pmp_7_cfg_r),
    .io_pmp_7_addr(csr_io_pmp_7_addr),
    .io_pmp_7_mask(csr_io_pmp_7_mask),
    .io_inst_0(csr_io_inst_0),
    .io_trace_0_valid(csr_io_trace_0_valid),
    .io_trace_0_iaddr(csr_io_trace_0_iaddr),
    .io_trace_0_insn(csr_io_trace_0_insn),
    .io_trace_0_exception(csr_io_trace_0_exception)
  );
  BreakpointUnit bpu ( 
    .io_status_debug(bpu_io_status_debug),
    .io_status_prv(bpu_io_status_prv),
    .io_bp_0_control_action(bpu_io_bp_0_control_action),
    .io_bp_0_control_tmatch(bpu_io_bp_0_control_tmatch),
    .io_bp_0_control_m(bpu_io_bp_0_control_m),
    .io_bp_0_control_s(bpu_io_bp_0_control_s),
    .io_bp_0_control_u(bpu_io_bp_0_control_u),
    .io_bp_0_control_x(bpu_io_bp_0_control_x),
    .io_bp_0_control_w(bpu_io_bp_0_control_w),
    .io_bp_0_control_r(bpu_io_bp_0_control_r),
    .io_bp_0_address(bpu_io_bp_0_address),
    .io_pc(bpu_io_pc),
    .io_ea(bpu_io_ea),
    .io_xcpt_if(bpu_io_xcpt_if),
    .io_xcpt_ld(bpu_io_xcpt_ld),
    .io_xcpt_st(bpu_io_xcpt_st),
    .io_debug_if(bpu_io_debug_if),
    .io_debug_ld(bpu_io_debug_ld),
    .io_debug_st(bpu_io_debug_st)
  );
  ALU alu ( 
    .io_dw(alu_io_dw),
    .io_fn(alu_io_fn),
    .io_in2(alu_io_in2),
    .io_in1(alu_io_in1),
    .io_out(alu_io_out),
    .io_adder_out(alu_io_adder_out),
    .io_cmp_out(alu_io_cmp_out)
  );
  MulDiv div ( 
    .clock(div_clock),
    .reset(div_reset),
    .io_req_ready(div_io_req_ready),
    .io_req_valid(div_io_req_valid),
    .io_req_bits_fn(div_io_req_bits_fn),
    .io_req_bits_dw(div_io_req_bits_dw),
    .io_req_bits_in1(div_io_req_bits_in1),
    .io_req_bits_in2(div_io_req_bits_in2),
    .io_req_bits_tag(div_io_req_bits_tag),
    .io_kill(div_io_kill),
    .io_resp_ready(div_io_resp_ready),
    .io_resp_valid(div_io_resp_valid),
    .io_resp_bits_data(div_io_resp_bits_data),
    .io_resp_bits_tag(div_io_resp_bits_tag)
  );
  PlusArgTimeout PlusArgTimeout ( 
    .clock(PlusArgTimeout_clock),
    .reset(PlusArgTimeout_reset),
    .io_count(PlusArgTimeout_io_count)
  );
  assign _T_714__T_721_addr = ~ _T_719;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign _T_714__T_721_data = _T_714[_T_714__T_721_addr]; 
  `else
  assign _T_714__T_721_data = _T_714__T_721_addr >= 5'h1f ? _RAND_1[63:0] : _T_714[_T_714__T_721_addr]; 
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign _T_714__T_729_addr = ~ _T_727;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign _T_714__T_729_data = _T_714[_T_714__T_729_addr]; 
  `else
  assign _T_714__T_729_data = _T_714__T_729_addr >= 5'h1f ? _RAND_2[63:0] : _T_714[_T_714__T_729_addr]; 
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign _T_714__T_1453_data = _T_1444 ? io_dmem_resp_bits_data : _T_1449;
  assign _T_714__T_1453_addr = ~ rf_waddr;
  assign _T_714__T_1453_mask = 1'h1;
  assign _T_714__T_1453_en = rf_wen ? _T_1450 : 1'h0;
  assign replay_wb_common = io_dmem_s2_nack | wb_reg_replay; 
  assign _T_1427 = wb_reg_valid & wb_ctrl_rocc; 
  assign _T_1428 = io_rocc_cmd_ready == 1'h0; 
  assign replay_wb_rocc = _T_1427 & _T_1428; 
  assign replay_wb = replay_wb_common | replay_wb_rocc; 
  assign _T_1391 = wb_reg_valid & wb_ctrl_mem; 
  assign _T_1392 = _T_1391 & io_dmem_s2_xcpt_ma_st; 
  assign _T_1403 = wb_reg_xcpt | _T_1392; 
  assign _T_1394 = _T_1391 & io_dmem_s2_xcpt_ma_ld; 
  assign _T_1404 = _T_1403 | _T_1394; 
  assign _T_1396 = _T_1391 & io_dmem_s2_xcpt_pf_st; 
  assign _T_1405 = _T_1404 | _T_1396; 
  assign _T_1398 = _T_1391 & io_dmem_s2_xcpt_pf_ld; 
  assign _T_1406 = _T_1405 | _T_1398; 
  assign _T_1400 = _T_1391 & io_dmem_s2_xcpt_ae_st; 
  assign _T_1407 = _T_1406 | _T_1400; 
  assign _T_1402 = _T_1391 & io_dmem_s2_xcpt_ae_ld; 
  assign wb_xcpt = _T_1407 | _T_1402; 
  assign _T_1429 = replay_wb | wb_xcpt; 
  assign _T_1430 = _T_1429 | csr_io_eret; 
  assign take_pc_wb = _T_1430 | wb_reg_flush_pipe; 
  assign _T_1063 = ex_reg_valid | ex_reg_replay; 
  assign ex_pc_valid = _T_1063 | ex_reg_xcpt_interrupt; 
  assign _T_1236 = mem_ctrl_jalr | mem_reg_sfence; 
  assign _T_1237 = $signed(mem_reg_wdata); 
  assign a = _T_1237[63:39]; 
  assign _T_1238 = $signed(a) == $signed(25'sh0); 
  assign _T_1239 = $signed(a) == $signed(-25'sh1); 
  assign _T_1240 = _T_1238 | _T_1239; 
  assign _T_1241 = mem_reg_wdata[39]; 
  assign _T_1242 = mem_reg_wdata[38]; 
  assign _T_1243 = _T_1242 == 1'h0; 
  assign msb = _T_1240 ? _T_1241 : _T_1243; 
  assign _T_1244 = mem_reg_wdata[38:0]; 
  assign _T_1245 = {msb,_T_1244}; 
  assign _T_1246 = $signed(_T_1245); 
  assign _T_1105 = $signed(mem_reg_pc); 
  assign _T_1106 = mem_ctrl_branch & mem_br_taken; 
  assign _T_1108 = mem_reg_inst[31]; 
  assign _T_1109 = $signed(_T_1108); 
  assign _T_1164 = $unsigned(_T_1109); 
  assign _T_1114 = {11{_T_1109}}; 
  assign _T_1163 = $unsigned(_T_1114); 
  assign _T_1165 = {_T_1164,_T_1163}; 
  assign _T_1118 = mem_reg_inst[19:12]; 
  assign _T_1119 = $signed(_T_1118); 
  assign _T_1120 = {8{_T_1109}}; 
  assign _T_1161 = $unsigned(_T_1120); 
  assign _T_1125 = mem_reg_inst[20]; 
  assign _T_1126 = $signed(_T_1125); 
  assign _T_1128 = mem_reg_inst[7]; 
  assign _T_1129 = $signed(_T_1128); 
  assign _T_1160 = $unsigned(_T_1129); 
  assign _T_1162 = {_T_1161,_T_1160}; 
  assign _T_1166 = {_T_1165,_T_1162}; 
  assign _T_1136 = mem_reg_inst[30:25]; 
  assign _T_1142 = mem_reg_inst[11:8]; 
  assign _T_1145 = mem_reg_inst[24:21]; 
  assign _T_1158 = {_T_1136,_T_1142}; 
  assign _T_1159 = {_T_1158,1'h0}; 
  assign _T_1167 = {_T_1166,_T_1159}; 
  assign _T_1168 = $signed(_T_1167); 
  assign _T_1223 = $unsigned(_T_1119); 
  assign _T_1222 = $unsigned(_T_1126); 
  assign _T_1224 = {_T_1223,_T_1222}; 
  assign _T_1228 = {_T_1165,_T_1224}; 
  assign _T_1220 = {_T_1136,_T_1145}; 
  assign _T_1221 = {_T_1220,1'h0}; 
  assign _T_1229 = {_T_1228,_T_1221}; 
  assign _T_1230 = $signed(_T_1229); 
  assign _T_1231 = mem_reg_rvc ? $signed(4'sh2) : $signed(4'sh4); 
  assign _T_1232 = mem_ctrl_jal ? $signed(_T_1230) : $signed({{28{_T_1231[3]}},_T_1231}); 
  assign _T_1233 = _T_1106 ? $signed(_T_1168) : $signed(_T_1232); 
  assign _GEN_243 = {{8{_T_1233[31]}},_T_1233}; 
  assign _T_1235 = $signed(_T_1105) + $signed(_GEN_243); 
  assign mem_br_target = $signed(_T_1235); 
  assign _T_1247 = _T_1236 ? $signed(_T_1246) : $signed(mem_br_target); 
  assign _T_1248 = $signed(_T_1247) & $signed(-40'sh2); 
  assign _T_1249 = $signed(_T_1248); 
  assign mem_npc = $unsigned(_T_1249); 
  assign _T_1250 = mem_npc != ex_reg_pc; 
  assign _T_1251 = ibuf_io_inst_0_valid | ibuf_io_imem_valid; 
  assign _T_1252 = mem_npc != ibuf_io_pc; 
  assign _T_1253 = _T_1251 ? _T_1252 : 1'h1; 
  assign mem_wrong_npc = ex_pc_valid ? _T_1250 : _T_1253; 
  assign _T_1269 = mem_wrong_npc | mem_reg_sfence; 
  assign take_pc_mem = mem_reg_valid & _T_1269; 
  assign take_pc_mem_wb = take_pc_wb | take_pc_mem; 
  assign _T_263 = ibuf_io_inst_0_bits_inst_bits & 32'h207f; 
  assign _T_264 = _T_263 == 32'h3; 
  assign _T_265 = ibuf_io_inst_0_bits_inst_bits & 32'h106f; 
  assign _T_266 = _T_265 == 32'h3; 
  assign _T_267 = ibuf_io_inst_0_bits_inst_bits & 32'h607f; 
  assign _T_268 = _T_267 == 32'hf; 
  assign _T_269 = ibuf_io_inst_0_bits_inst_bits & 32'h7077; 
  assign _T_270 = _T_269 == 32'h13; 
  assign _T_271 = ibuf_io_inst_0_bits_inst_bits & 32'h5f; 
  assign _T_272 = _T_271 == 32'h17; 
  assign _T_273 = ibuf_io_inst_0_bits_inst_bits & 32'hfc00007f; 
  assign _T_274 = _T_273 == 32'h33; 
  assign _T_275 = ibuf_io_inst_0_bits_inst_bits & 32'hbe007077; 
  assign _T_276 = _T_275 == 32'h33; 
  assign _T_277 = ibuf_io_inst_0_bits_inst_bits & 32'h4000073; 
  assign _T_278 = _T_277 == 32'h43; 
  assign _T_279 = ibuf_io_inst_0_bits_inst_bits & 32'he400007f; 
  assign _T_280 = _T_279 == 32'h53; 
  assign _T_281 = ibuf_io_inst_0_bits_inst_bits & 32'h707b; 
  assign _T_282 = _T_281 == 32'h63; 
  assign _T_283 = ibuf_io_inst_0_bits_inst_bits & 32'h7f; 
  assign _T_284 = _T_283 == 32'h6f; 
  assign _T_285 = ibuf_io_inst_0_bits_inst_bits & 32'hffefffff; 
  assign _T_286 = _T_285 == 32'h73; 
  assign _T_287 = ibuf_io_inst_0_bits_inst_bits & 32'hfc00305f; 
  assign _T_288 = _T_287 == 32'h1013; 
  assign _T_289 = ibuf_io_inst_0_bits_inst_bits & 32'hfe00305f; 
  assign _T_290 = _T_289 == 32'h101b; 
  assign _T_291 = ibuf_io_inst_0_bits_inst_bits & 32'h605b; 
  assign _T_292 = _T_291 == 32'h2003; 
  assign _T_294 = _T_263 == 32'h2013; 
  assign _T_295 = ibuf_io_inst_0_bits_inst_bits & 32'h1800607f; 
  assign _T_296 = _T_295 == 32'h202f; 
  assign _T_298 = _T_263 == 32'h2073; 
  assign _T_299 = ibuf_io_inst_0_bits_inst_bits & 32'hbc00707f; 
  assign _T_300 = _T_299 == 32'h5013; 
  assign _T_301 = ibuf_io_inst_0_bits_inst_bits & 32'hbe00705f; 
  assign _T_302 = _T_301 == 32'h501b; 
  assign _T_304 = _T_275 == 32'h5033; 
  assign _T_305 = ibuf_io_inst_0_bits_inst_bits & 32'hfe004077; 
  assign _T_306 = _T_305 == 32'h2004033; 
  assign _T_307 = ibuf_io_inst_0_bits_inst_bits & 32'he800607f; 
  assign _T_308 = _T_307 == 32'h800202f; 
  assign _T_309 = ibuf_io_inst_0_bits_inst_bits & 32'hf9f0607f; 
  assign _T_310 = _T_309 == 32'h1000202f; 
  assign _T_311 = ibuf_io_inst_0_bits_inst_bits & 32'hdfffffff; 
  assign _T_312 = _T_311 == 32'h10200073; 
  assign _T_313 = ibuf_io_inst_0_bits_inst_bits == 32'h10500073; 
  assign _T_314 = ibuf_io_inst_0_bits_inst_bits & 32'hfe007fff; 
  assign _T_315 = _T_314 == 32'h12000073; 
  assign _T_316 = ibuf_io_inst_0_bits_inst_bits & 32'hf400607f; 
  assign _T_317 = _T_316 == 32'h20000053; 
  assign _T_318 = ibuf_io_inst_0_bits_inst_bits & 32'h7c00607f; 
  assign _T_319 = _T_318 == 32'h20000053; 
  assign _T_320 = ibuf_io_inst_0_bits_inst_bits & 32'h7c00507f; 
  assign _T_321 = _T_320 == 32'h20000053; 
  assign _T_322 = ibuf_io_inst_0_bits_inst_bits & 32'h7ff0007f; 
  assign _T_323 = _T_322 == 32'h40100053; 
  assign _T_325 = _T_322 == 32'h42000053; 
  assign _T_326 = ibuf_io_inst_0_bits_inst_bits & 32'hfdf0007f; 
  assign _T_327 = _T_326 == 32'h58000053; 
  assign _T_328 = ibuf_io_inst_0_bits_inst_bits == 32'h7b200073; 
  assign _T_329 = ibuf_io_inst_0_bits_inst_bits & 32'hedc0007f; 
  assign _T_330 = _T_329 == 32'hc0000053; 
  assign _T_331 = ibuf_io_inst_0_bits_inst_bits & 32'hfdf0607f; 
  assign _T_332 = _T_331 == 32'he0000053; 
  assign _T_333 = ibuf_io_inst_0_bits_inst_bits & 32'hedf0707f; 
  assign _T_334 = _T_333 == 32'he0000053; 
  assign _T_335 = ibuf_io_inst_0_bits_inst_bits & 32'h306f; 
  assign _T_336 = _T_335 == 32'h1063; 
  assign _T_337 = ibuf_io_inst_0_bits_inst_bits & 32'h407f; 
  assign _T_338 = _T_337 == 32'h4063; 
  assign _T_339 = ibuf_io_inst_0_bits_inst_bits & 32'hfc007077; 
  assign _T_340 = _T_339 == 32'h33; 
  assign _T_341 = ibuf_io_inst_0_bits_inst_bits & 32'h405f; 
  assign _T_342 = _T_341 == 32'h3; 
  assign _T_344 = _T_264 | _T_266; 
  assign _T_345 = _T_344 | _T_268; 
  assign _T_346 = _T_345 | _T_270; 
  assign _T_347 = _T_346 | _T_272; 
  assign _T_348 = _T_347 | _T_274; 
  assign _T_349 = _T_348 | _T_276; 
  assign _T_350 = _T_349 | _T_278; 
  assign _T_351 = _T_350 | _T_280; 
  assign _T_352 = _T_351 | _T_282; 
  assign _T_353 = _T_352 | _T_284; 
  assign _T_354 = _T_353 | _T_286; 
  assign _T_355 = _T_354 | _T_288; 
  assign _T_356 = _T_355 | _T_290; 
  assign _T_357 = _T_356 | _T_292; 
  assign _T_358 = _T_357 | _T_294; 
  assign _T_359 = _T_358 | _T_296; 
  assign _T_360 = _T_359 | _T_298; 
  assign _T_361 = _T_360 | _T_300; 
  assign _T_362 = _T_361 | _T_302; 
  assign _T_363 = _T_362 | _T_304; 
  assign _T_364 = _T_363 | _T_306; 
  assign _T_365 = _T_364 | _T_308; 
  assign _T_366 = _T_365 | _T_310; 
  assign _T_367 = _T_366 | _T_312; 
  assign _T_368 = _T_367 | _T_313; 
  assign _T_369 = _T_368 | _T_315; 
  assign _T_370 = _T_369 | _T_317; 
  assign _T_371 = _T_370 | _T_319; 
  assign _T_372 = _T_371 | _T_321; 
  assign _T_373 = _T_372 | _T_323; 
  assign _T_374 = _T_373 | _T_325; 
  assign _T_375 = _T_374 | _T_327; 
  assign _T_376 = _T_375 | _T_328; 
  assign _T_377 = _T_376 | _T_330; 
  assign _T_378 = _T_377 | _T_332; 
  assign _T_379 = _T_378 | _T_334; 
  assign _T_380 = _T_379 | _T_336; 
  assign _T_381 = _T_380 | _T_338; 
  assign _T_382 = _T_381 | _T_340; 
  assign id_ctrl_legal = _T_382 | _T_342; 
  assign _T_384 = ibuf_io_inst_0_bits_inst_bits & 32'h5c; 
  assign _T_385 = _T_384 == 32'h4; 
  assign _T_386 = ibuf_io_inst_0_bits_inst_bits & 32'h60; 
  assign _T_387 = _T_386 == 32'h40; 
  assign id_ctrl_fp = _T_385 | _T_387; 
  assign _T_390 = ibuf_io_inst_0_bits_inst_bits & 32'h74; 
  assign id_ctrl_branch = _T_390 == 32'h60; 
  assign _T_393 = ibuf_io_inst_0_bits_inst_bits & 32'h68; 
  assign id_ctrl_jal = _T_393 == 32'h68; 
  assign _T_396 = ibuf_io_inst_0_bits_inst_bits & 32'h203c; 
  assign id_ctrl_jalr = _T_396 == 32'h24; 
  assign _T_399 = ibuf_io_inst_0_bits_inst_bits & 32'h64; 
  assign _T_400 = _T_399 == 32'h20; 
  assign _T_401 = ibuf_io_inst_0_bits_inst_bits & 32'h34; 
  assign _T_402 = _T_401 == 32'h20; 
  assign _T_403 = ibuf_io_inst_0_bits_inst_bits & 32'h2048; 
  assign _T_404 = _T_403 == 32'h2008; 
  assign _T_405 = ibuf_io_inst_0_bits_inst_bits & 32'h42003024; 
  assign _T_406 = _T_405 == 32'h2000020; 
  assign _T_408 = _T_400 | _T_402; 
  assign _T_409 = _T_408 | _T_404; 
  assign id_ctrl_rxs2 = _T_409 | _T_406; 
  assign _T_411 = ibuf_io_inst_0_bits_inst_bits & 32'h44; 
  assign _T_412 = _T_411 == 32'h0; 
  assign _T_413 = ibuf_io_inst_0_bits_inst_bits & 32'h4024; 
  assign _T_414 = _T_413 == 32'h20; 
  assign _T_415 = ibuf_io_inst_0_bits_inst_bits & 32'h38; 
  assign _T_416 = _T_415 == 32'h20; 
  assign _T_417 = ibuf_io_inst_0_bits_inst_bits & 32'h2050; 
  assign _T_418 = _T_417 == 32'h2000; 
  assign _T_419 = ibuf_io_inst_0_bits_inst_bits & 32'h90000034; 
  assign _T_420 = _T_419 == 32'h90000010; 
  assign _T_422 = _T_412 | _T_414; 
  assign _T_423 = _T_422 | _T_416; 
  assign _T_424 = _T_423 | _T_418; 
  assign id_ctrl_rxs1 = _T_424 | _T_420; 
  assign _T_426 = ibuf_io_inst_0_bits_inst_bits & 32'h58; 
  assign _T_427 = _T_426 == 32'h0; 
  assign _T_428 = ibuf_io_inst_0_bits_inst_bits & 32'h20; 
  assign _T_429 = _T_428 == 32'h0; 
  assign _T_430 = ibuf_io_inst_0_bits_inst_bits & 32'hc; 
  assign _T_431 = _T_430 == 32'h4; 
  assign _T_432 = ibuf_io_inst_0_bits_inst_bits & 32'h48; 
  assign _T_433 = _T_432 == 32'h48; 
  assign _T_434 = ibuf_io_inst_0_bits_inst_bits & 32'h4050; 
  assign _T_435 = _T_434 == 32'h4050; 
  assign _T_437 = _T_427 | _T_429; 
  assign _T_438 = _T_437 | _T_431; 
  assign _T_439 = _T_438 | _T_433; 
  assign _T_440 = _T_439 | _T_435; 
  assign _T_442 = _T_432 == 32'h0; 
  assign _T_443 = ibuf_io_inst_0_bits_inst_bits & 32'h18; 
  assign _T_444 = _T_443 == 32'h0; 
  assign _T_445 = ibuf_io_inst_0_bits_inst_bits & 32'h4008; 
  assign _T_446 = _T_445 == 32'h4000; 
  assign _T_448 = _T_442 | _T_412; 
  assign _T_449 = _T_448 | _T_444; 
  assign _T_450 = _T_449 | _T_446; 
  assign id_ctrl_sel_alu2 = {_T_450,_T_440}; 
  assign _T_452 = ibuf_io_inst_0_bits_inst_bits & 32'h4004; 
  assign _T_453 = _T_452 == 32'h0; 
  assign _T_454 = ibuf_io_inst_0_bits_inst_bits & 32'h50; 
  assign _T_455 = _T_454 == 32'h0; 
  assign _T_456 = ibuf_io_inst_0_bits_inst_bits & 32'h24; 
  assign _T_457 = _T_456 == 32'h0; 
  assign _T_459 = _T_453 | _T_455; 
  assign _T_460 = _T_459 | _T_412; 
  assign _T_461 = _T_460 | _T_457; 
  assign _T_462 = _T_461 | _T_444; 
  assign _T_464 = _T_401 == 32'h14; 
  assign _T_466 = _T_464 | _T_433; 
  assign id_ctrl_sel_alu1 = {_T_466,_T_462}; 
  assign _T_469 = _T_443 == 32'h8; 
  assign _T_471 = _T_411 == 32'h40; 
  assign _T_473 = _T_469 | _T_471; 
  assign _T_474 = ibuf_io_inst_0_bits_inst_bits & 32'h14; 
  assign _T_475 = _T_474 == 32'h14; 
  assign _T_477 = _T_469 | _T_475; 
  assign _T_478 = ibuf_io_inst_0_bits_inst_bits & 32'h30; 
  assign _T_479 = _T_478 == 32'h0; 
  assign _T_480 = ibuf_io_inst_0_bits_inst_bits & 32'h201c; 
  assign _T_481 = _T_480 == 32'h4; 
  assign _T_483 = _T_474 == 32'h10; 
  assign _T_485 = _T_479 | _T_481; 
  assign _T_486 = _T_485 | _T_483; 
  assign _T_487 = {_T_486,_T_477}; 
  assign id_ctrl_sel_imm = {_T_487,_T_473}; 
  assign _T_489 = ibuf_io_inst_0_bits_inst_bits & 32'h10; 
  assign _T_490 = _T_489 == 32'h0; 
  assign _T_491 = ibuf_io_inst_0_bits_inst_bits & 32'h8; 
  assign _T_492 = _T_491 == 32'h0; 
  assign id_ctrl_alu_dw = _T_490 | _T_492; 
  assign _T_495 = ibuf_io_inst_0_bits_inst_bits & 32'h3054; 
  assign _T_496 = _T_495 == 32'h1010; 
  assign _T_497 = ibuf_io_inst_0_bits_inst_bits & 32'h1058; 
  assign _T_498 = _T_497 == 32'h1040; 
  assign _T_499 = ibuf_io_inst_0_bits_inst_bits & 32'h7044; 
  assign _T_500 = _T_499 == 32'h7000; 
  assign _T_501 = ibuf_io_inst_0_bits_inst_bits & 32'h2001074; 
  assign _T_502 = _T_501 == 32'h2001030; 
  assign _T_504 = _T_496 | _T_498; 
  assign _T_505 = _T_504 | _T_500; 
  assign _T_506 = _T_505 | _T_502; 
  assign _T_507 = ibuf_io_inst_0_bits_inst_bits & 32'h4054; 
  assign _T_508 = _T_507 == 32'h40; 
  assign _T_509 = ibuf_io_inst_0_bits_inst_bits & 32'h2058; 
  assign _T_510 = _T_509 == 32'h2040; 
  assign _T_512 = _T_495 == 32'h3010; 
  assign _T_513 = ibuf_io_inst_0_bits_inst_bits & 32'h6054; 
  assign _T_514 = _T_513 == 32'h6010; 
  assign _T_515 = ibuf_io_inst_0_bits_inst_bits & 32'h2002074; 
  assign _T_516 = _T_515 == 32'h2002030; 
  assign _T_517 = ibuf_io_inst_0_bits_inst_bits & 32'h40003034; 
  assign _T_518 = _T_517 == 32'h40000030; 
  assign _T_519 = ibuf_io_inst_0_bits_inst_bits & 32'h40001054; 
  assign _T_520 = _T_519 == 32'h40001010; 
  assign _T_522 = _T_508 | _T_510; 
  assign _T_523 = _T_522 | _T_512; 
  assign _T_524 = _T_523 | _T_514; 
  assign _T_525 = _T_524 | _T_516; 
  assign _T_526 = _T_525 | _T_518; 
  assign _T_527 = _T_526 | _T_520; 
  assign _T_528 = ibuf_io_inst_0_bits_inst_bits & 32'h2002054; 
  assign _T_529 = _T_528 == 32'h2010; 
  assign _T_530 = ibuf_io_inst_0_bits_inst_bits & 32'h2034; 
  assign _T_531 = _T_530 == 32'h2010; 
  assign _T_532 = ibuf_io_inst_0_bits_inst_bits & 32'h40004054; 
  assign _T_533 = _T_532 == 32'h4010; 
  assign _T_534 = ibuf_io_inst_0_bits_inst_bits & 32'h5054; 
  assign _T_535 = _T_534 == 32'h4010; 
  assign _T_536 = ibuf_io_inst_0_bits_inst_bits & 32'h4058; 
  assign _T_537 = _T_536 == 32'h4040; 
  assign _T_539 = _T_529 | _T_531; 
  assign _T_540 = _T_539 | _T_533; 
  assign _T_541 = _T_540 | _T_535; 
  assign _T_542 = _T_541 | _T_537; 
  assign _T_543 = ibuf_io_inst_0_bits_inst_bits & 32'h2006054; 
  assign _T_544 = _T_543 == 32'h2010; 
  assign _T_545 = ibuf_io_inst_0_bits_inst_bits & 32'h6034; 
  assign _T_546 = _T_545 == 32'h2010; 
  assign _T_547 = ibuf_io_inst_0_bits_inst_bits & 32'h40003054; 
  assign _T_548 = _T_547 == 32'h40001010; 
  assign _T_550 = _T_544 | _T_546; 
  assign _T_551 = _T_550 | _T_537; 
  assign _T_552 = _T_551 | _T_518; 
  assign _T_553 = _T_552 | _T_548; 
  assign _T_554 = {_T_527,_T_506}; 
  assign _T_555 = {_T_553,_T_542}; 
  assign id_ctrl_alu_fn = {_T_555,_T_554}; 
  assign _T_557 = ibuf_io_inst_0_bits_inst_bits & 32'h107f; 
  assign _T_558 = _T_557 == 32'h3; 
  assign _T_559 = ibuf_io_inst_0_bits_inst_bits & 32'h707f; 
  assign _T_560 = _T_559 == 32'h100f; 
  assign _T_562 = _T_342 | _T_264; 
  assign _T_563 = _T_562 | _T_558; 
  assign _T_564 = _T_563 | _T_560; 
  assign _T_565 = _T_564 | _T_292; 
  assign _T_566 = _T_565 | _T_296; 
  assign _T_567 = _T_566 | _T_308; 
  assign _T_568 = _T_567 | _T_310; 
  assign id_ctrl_mem = _T_568 | _T_315; 
  assign _T_570 = ibuf_io_inst_0_bits_inst_bits & 32'h2008; 
  assign _T_571 = _T_570 == 32'h8; 
  assign _T_573 = _T_393 == 32'h20; 
  assign _T_574 = ibuf_io_inst_0_bits_inst_bits & 32'h18000020; 
  assign _T_575 = _T_574 == 32'h18000020; 
  assign _T_576 = ibuf_io_inst_0_bits_inst_bits & 32'h20000020; 
  assign _T_577 = _T_576 == 32'h20000020; 
  assign _T_579 = _T_571 | _T_573; 
  assign _T_580 = _T_579 | _T_575; 
  assign _T_581 = _T_580 | _T_577; 
  assign _T_582 = ibuf_io_inst_0_bits_inst_bits & 32'h10002008; 
  assign _T_583 = _T_582 == 32'h10002008; 
  assign _T_584 = ibuf_io_inst_0_bits_inst_bits & 32'h40002008; 
  assign _T_585 = _T_584 == 32'h40002008; 
  assign _T_587 = _T_583 | _T_585; 
  assign _T_588 = ibuf_io_inst_0_bits_inst_bits & 32'h40; 
  assign _T_589 = _T_588 == 32'h40; 
  assign _T_590 = ibuf_io_inst_0_bits_inst_bits & 32'h8000008; 
  assign _T_591 = _T_590 == 32'h8000008; 
  assign _T_592 = ibuf_io_inst_0_bits_inst_bits & 32'h10000008; 
  assign _T_593 = _T_592 == 32'h10000008; 
  assign _T_594 = ibuf_io_inst_0_bits_inst_bits & 32'h80000008; 
  assign _T_595 = _T_594 == 32'h80000008; 
  assign _T_597 = _T_571 | _T_589; 
  assign _T_598 = _T_597 | _T_591; 
  assign _T_599 = _T_598 | _T_593; 
  assign _T_600 = _T_599 | _T_595; 
  assign _T_601 = ibuf_io_inst_0_bits_inst_bits & 32'h18002008; 
  assign _T_602 = _T_601 == 32'h2008; 
  assign _T_605 = {_T_587,_T_581}; 
  assign _T_606 = {_T_589,_T_602}; 
  assign _T_607 = {_T_606,_T_600}; 
  assign id_ctrl_mem_cmd = {_T_607,_T_605}; 
  assign _T_609 = ibuf_io_inst_0_bits_inst_bits & 32'h1000; 
  assign _T_610 = _T_609 == 32'h1000; 
  assign _T_612 = ibuf_io_inst_0_bits_inst_bits & 32'h2000; 
  assign _T_613 = _T_612 == 32'h2000; 
  assign _T_615 = _T_589 | _T_613; 
  assign _T_616 = ibuf_io_inst_0_bits_inst_bits & 32'h4000; 
  assign _T_617 = _T_616 == 32'h4000; 
  assign _T_619 = {_T_617,_T_615}; 
  assign id_ctrl_mem_type = {_T_619,_T_610}; 
  assign _T_621 = ibuf_io_inst_0_bits_inst_bits & 32'h80000060; 
  assign _T_622 = _T_621 == 32'h40; 
  assign _T_623 = ibuf_io_inst_0_bits_inst_bits & 32'h10000060; 
  assign _T_625 = ibuf_io_inst_0_bits_inst_bits & 32'h70; 
  assign id_ctrl_rfs3 = _T_625 == 32'h40; 
  assign _T_641 = ibuf_io_inst_0_bits_inst_bits & 32'h3c; 
  assign _T_642 = _T_641 == 32'h4; 
  assign _T_644 = _T_623 == 32'h10000040; 
  assign _T_646 = _T_642 | _T_622; 
  assign _T_647 = _T_646 | id_ctrl_rfs3; 
  assign id_ctrl_wfd = _T_647 | _T_644; 
  assign _T_649 = ibuf_io_inst_0_bits_inst_bits & 32'h2000074; 
  assign id_ctrl_div = _T_649 == 32'h2000030; 
  assign _T_653 = _T_399 == 32'h0; 
  assign _T_655 = _T_454 == 32'h10; 
  assign _T_656 = ibuf_io_inst_0_bits_inst_bits & 32'h2024; 
  assign _T_657 = _T_656 == 32'h24; 
  assign _T_658 = ibuf_io_inst_0_bits_inst_bits & 32'h28; 
  assign _T_659 = _T_658 == 32'h28; 
  assign _T_660 = ibuf_io_inst_0_bits_inst_bits & 32'h1030; 
  assign _T_661 = _T_660 == 32'h1030; 
  assign _T_662 = ibuf_io_inst_0_bits_inst_bits & 32'h2030; 
  assign _T_663 = _T_662 == 32'h2030; 
  assign _T_664 = ibuf_io_inst_0_bits_inst_bits & 32'h90000010; 
  assign _T_665 = _T_664 == 32'h80000010; 
  assign _T_667 = _T_653 | _T_655; 
  assign _T_668 = _T_667 | _T_657; 
  assign _T_669 = _T_668 | _T_659; 
  assign _T_670 = _T_669 | _T_661; 
  assign _T_671 = _T_670 | _T_663; 
  assign id_ctrl_wxd = _T_671 | _T_665; 
  assign _T_673 = ibuf_io_inst_0_bits_inst_bits & 32'h1070; 
  assign _T_674 = _T_673 == 32'h1070; 
  assign _T_676 = ibuf_io_inst_0_bits_inst_bits & 32'h2070; 
  assign _T_677 = _T_676 == 32'h2070; 
  assign _T_679 = ibuf_io_inst_0_bits_inst_bits & 32'h10000070; 
  assign _T_680 = _T_679 == 32'h70; 
  assign _T_681 = ibuf_io_inst_0_bits_inst_bits & 32'h12000034; 
  assign _T_682 = _T_681 == 32'h10000030; 
  assign _T_683 = ibuf_io_inst_0_bits_inst_bits & 32'he0000050; 
  assign _T_684 = _T_683 == 32'h60000050; 
  assign _T_686 = _T_680 | _T_674; 
  assign _T_687 = _T_686 | _T_677; 
  assign _T_688 = _T_687 | _T_682; 
  assign _T_689 = _T_688 | _T_684; 
  assign _T_690 = {_T_689,_T_677}; 
  assign id_ctrl_csr = {_T_690,_T_674}; 
  assign _T_692 = ibuf_io_inst_0_bits_inst_bits & 32'h3058; 
  assign id_ctrl_fence_i = _T_692 == 32'h1008; 
  assign id_ctrl_fence = _T_692 == 32'h8; 
  assign _T_698 = ibuf_io_inst_0_bits_inst_bits & 32'h6048; 
  assign id_ctrl_amo = _T_698 == 32'h2008; 
  assign _T_701 = ibuf_io_inst_0_bits_inst_bits & 32'h105c; 
  assign _T_702 = _T_701 == 32'h1004; 
  assign _T_703 = ibuf_io_inst_0_bits_inst_bits & 32'h2000060; 
  assign _T_704 = _T_703 == 32'h2000040; 
  assign _T_705 = ibuf_io_inst_0_bits_inst_bits & 32'hd0000070; 
  assign _T_706 = _T_705 == 32'h40000050; 
  assign _T_708 = _T_702 | _T_704; 
  assign id_ctrl_dp = _T_708 | _T_706; 
  assign _T_717 = ibuf_io_inst_0_bits_inst_rs1 == 5'h0; 
  assign _T_719 = ibuf_io_inst_0_bits_inst_rs1; 
  assign _T_722 = _T_714__T_721_data; 
  assign _T_727 = ibuf_io_inst_0_bits_inst_rs2; 
  assign _T_730 = _T_714__T_729_data; 
  assign _T_801 = id_ctrl_csr == 3'h6; 
  assign _T_802 = id_ctrl_csr == 3'h7; 
  assign _T_803 = id_ctrl_csr == 3'h5; 
  assign _T_804 = _T_801 | _T_802; 
  assign id_csr_en = _T_804 | _T_803; 
  assign id_system_insn = id_ctrl_csr == 3'h4; 
  assign id_csr_ren = _T_804 & _T_717; 
  assign _T_809 = id_ctrl_mem_cmd == 5'h14; 
  assign id_sfence = id_ctrl_mem & _T_809; 
  assign _T_810 = id_sfence | id_system_insn; 
  assign _T_811 = id_csr_ren == 1'h0; 
  assign _T_812 = id_csr_en & _T_811; 
  assign _T_813 = _T_812 & csr_io_decode_0_write_flush; 
  assign id_csr_flush = _T_810 | _T_813; 
  assign _T_814 = id_ctrl_legal == 1'h0; 
  assign _T_816 = csr_io_status_isa[12]; 
  assign _T_817 = _T_816 == 1'h0; 
  assign _T_818 = id_ctrl_div & _T_817; 
  assign _T_819 = _T_814 | _T_818; 
  assign _T_820 = csr_io_status_isa[0]; 
  assign _T_821 = _T_820 == 1'h0; 
  assign _T_822 = id_ctrl_amo & _T_821; 
  assign _T_823 = _T_819 | _T_822; 
  assign _T_824 = csr_io_decode_0_fp_illegal | io_fpu_illegal_rm; 
  assign _T_825 = id_ctrl_fp & _T_824; 
  assign _T_826 = _T_823 | _T_825; 
  assign _T_827 = csr_io_status_isa[3]; 
  assign _T_828 = _T_827 == 1'h0; 
  assign _T_829 = id_ctrl_dp & _T_828; 
  assign _T_830 = _T_826 | _T_829; 
  assign _T_831 = csr_io_status_isa[2]; 
  assign _T_832 = _T_831 == 1'h0; 
  assign _T_833 = ibuf_io_inst_0_bits_rvc & _T_832; 
  assign _T_834 = _T_830 | _T_833; 
  assign _T_840 = _T_811 & csr_io_decode_0_write_illegal; 
  assign _T_841 = csr_io_decode_0_read_illegal | _T_840; 
  assign _T_842 = id_csr_en & _T_841; 
  assign _T_843 = _T_834 | _T_842; 
  assign _T_844 = ibuf_io_inst_0_bits_rvc == 1'h0; 
  assign _T_846 = _T_810 & csr_io_decode_0_system_illegal; 
  assign _T_847 = _T_844 & _T_846; 
  assign id_illegal_insn = _T_843 | _T_847; 
  assign id_amo_aq = ibuf_io_inst_0_bits_inst_bits[26]; 
  assign id_amo_rl = ibuf_io_inst_0_bits_inst_bits[25]; 
  assign _T_848 = id_ctrl_amo & id_amo_aq; 
  assign id_fence_next = id_ctrl_fence | _T_848; 
  assign _T_849 = io_dmem_ordered == 1'h0; 
  assign id_mem_busy = _T_849 | io_dmem_req_valid; 
  assign _T_850 = id_mem_busy == 1'h0; 
  assign _T_858 = id_ctrl_amo & id_amo_rl; 
  assign _T_859 = _T_858 | id_ctrl_fence_i; 
  assign _T_861 = id_reg_fence & id_ctrl_mem; 
  assign _T_862 = _T_859 | _T_861; 
  assign id_do_fence = id_mem_busy & _T_862; 
  assign _T_866 = csr_io_interrupt | bpu_io_debug_if; 
  assign _T_867 = _T_866 | bpu_io_xcpt_if; 
  assign _T_868 = _T_867 | ibuf_io_inst_0_bits_xcpt0_pf_inst; 
  assign _T_869 = _T_868 | ibuf_io_inst_0_bits_xcpt0_ae_inst; 
  assign _T_870 = _T_869 | ibuf_io_inst_0_bits_xcpt1_pf_inst; 
  assign _T_871 = _T_870 | ibuf_io_inst_0_bits_xcpt1_ae_inst; 
  assign id_xcpt = _T_871 | id_illegal_insn; 
  assign _T_872 = ibuf_io_inst_0_bits_xcpt1_ae_inst ? 2'h1 : 2'h2; 
  assign _T_873 = ibuf_io_inst_0_bits_xcpt1_pf_inst ? 4'hc : {{2'd0}, _T_872}; 
  assign _T_874 = ibuf_io_inst_0_bits_xcpt0_ae_inst ? 4'h1 : _T_873; 
  assign _T_875 = ibuf_io_inst_0_bits_xcpt0_pf_inst ? 4'hc : _T_874; 
  assign _T_876 = bpu_io_xcpt_if ? 4'h3 : _T_875; 
  assign _T_877 = bpu_io_debug_if ? 4'he : _T_876; 
  assign ex_waddr = ex_reg_inst[11:7]; 
  assign mem_waddr = mem_reg_inst[11:7]; 
  assign wb_waddr = wb_reg_inst[11:7]; 
  assign _T_888 = ex_reg_valid & ex_ctrl_wxd; 
  assign _T_889 = mem_reg_valid & mem_ctrl_wxd; 
  assign _T_890 = mem_ctrl_mem == 1'h0; 
  assign _T_891 = _T_889 & _T_890; 
  assign _T_893 = 5'h0 == ibuf_io_inst_0_bits_inst_rs1; 
  assign _T_895 = ex_waddr == ibuf_io_inst_0_bits_inst_rs1; 
  assign _T_896 = _T_888 & _T_895; 
  assign _T_897 = mem_waddr == ibuf_io_inst_0_bits_inst_rs1; 
  assign _T_898 = _T_891 & _T_897; 
  assign _T_900 = _T_889 & _T_897; 
  assign _T_901 = 5'h0 == ibuf_io_inst_0_bits_inst_rs2; 
  assign _T_903 = ex_waddr == ibuf_io_inst_0_bits_inst_rs2; 
  assign _T_904 = _T_888 & _T_903; 
  assign _T_905 = mem_waddr == ibuf_io_inst_0_bits_inst_rs2; 
  assign _T_906 = _T_891 & _T_905; 
  assign _T_908 = _T_889 & _T_905; 
  assign _T_930 = ex_reg_rs_lsb_0 == 2'h1; 
  assign _T_931 = _T_930 ? mem_reg_wdata : 64'h0; 
  assign _T_932 = ex_reg_rs_lsb_0 == 2'h2; 
  assign _T_933 = _T_932 ? wb_reg_wdata : _T_931; 
  assign _T_934 = ex_reg_rs_lsb_0 == 2'h3; 
  assign _T_935 = _T_934 ? io_dmem_resp_bits_data_word_bypass : _T_933; 
  assign _T_936 = {ex_reg_rs_msb_0,ex_reg_rs_lsb_0}; 
  assign _T_937 = ex_reg_rs_bypass_0 ? _T_935 : _T_936; 
  assign _T_938 = ex_reg_rs_lsb_1 == 2'h1; 
  assign _T_939 = _T_938 ? mem_reg_wdata : 64'h0; 
  assign _T_940 = ex_reg_rs_lsb_1 == 2'h2; 
  assign _T_941 = _T_940 ? wb_reg_wdata : _T_939; 
  assign _T_942 = ex_reg_rs_lsb_1 == 2'h3; 
  assign _T_943 = _T_942 ? io_dmem_resp_bits_data_word_bypass : _T_941; 
  assign _T_944 = {ex_reg_rs_msb_1,ex_reg_rs_lsb_1}; 
  assign _T_945 = ex_reg_rs_bypass_1 ? _T_943 : _T_944; 
  assign _T_946 = ex_ctrl_sel_imm == 3'h5; 
  assign _T_947 = ex_reg_inst[31]; 
  assign _T_948 = $signed(_T_947); 
  assign _T_949 = _T_946 ? $signed(1'sh0) : $signed(_T_948); 
  assign _T_950 = ex_ctrl_sel_imm == 3'h2; 
  assign _T_951 = ex_reg_inst[30:20]; 
  assign _T_952 = $signed(_T_951); 
  assign _T_953 = _T_950 ? $signed(_T_952) : $signed({11{_T_949}}); 
  assign _T_954 = ex_ctrl_sel_imm != 3'h2; 
  assign _T_955 = ex_ctrl_sel_imm != 3'h3; 
  assign _T_956 = _T_954 & _T_955; 
  assign _T_957 = ex_reg_inst[19:12]; 
  assign _T_958 = $signed(_T_957); 
  assign _T_959 = _T_956 ? $signed({8{_T_949}}) : $signed(_T_958); 
  assign _T_962 = _T_950 | _T_946; 
  assign _T_963 = ex_ctrl_sel_imm == 3'h3; 
  assign _T_964 = ex_reg_inst[20]; 
  assign _T_965 = $signed(_T_964); 
  assign _T_966 = ex_ctrl_sel_imm == 3'h1; 
  assign _T_967 = ex_reg_inst[7]; 
  assign _T_968 = $signed(_T_967); 
  assign _T_969 = _T_966 ? $signed(_T_968) : $signed(_T_949); 
  assign _T_970 = _T_963 ? $signed(_T_965) : $signed(_T_969); 
  assign _T_971 = _T_962 ? $signed(1'sh0) : $signed(_T_970); 
  assign _T_975 = ex_reg_inst[30:25]; 
  assign _T_976 = _T_962 ? 6'h0 : _T_975; 
  assign _T_978 = ex_ctrl_sel_imm == 3'h0; 
  assign _T_980 = _T_978 | _T_966; 
  assign _T_981 = ex_reg_inst[11:8]; 
  assign _T_983 = ex_reg_inst[19:16]; 
  assign _T_984 = ex_reg_inst[24:21]; 
  assign _T_985 = _T_946 ? _T_983 : _T_984; 
  assign _T_986 = _T_980 ? _T_981 : _T_985; 
  assign _T_987 = _T_950 ? 4'h0 : _T_986; 
  assign _T_990 = ex_ctrl_sel_imm == 3'h4; 
  assign _T_993 = ex_reg_inst[15]; 
  assign _T_994 = _T_946 ? _T_993 : 1'h0; 
  assign _T_995 = _T_990 ? _T_964 : _T_994; 
  assign _T_996 = _T_978 ? _T_967 : _T_995; 
  assign _T_997 = {_T_976,_T_987}; 
  assign _T_998 = {_T_997,_T_996}; 
  assign _T_999 = $unsigned(_T_971); 
  assign _T_1000 = $unsigned(_T_959); 
  assign _T_1001 = {_T_1000,_T_999}; 
  assign _T_1002 = $unsigned(_T_953); 
  assign _T_1003 = $unsigned(_T_949); 
  assign _T_1004 = {_T_1003,_T_1002}; 
  assign _T_1005 = {_T_1004,_T_1001}; 
  assign _T_1006 = {_T_1005,_T_998}; 
  assign ex_imm = $signed(_T_1006); 
  assign _T_1007 = $signed(_T_937); 
  assign _T_1008 = $signed(ex_reg_pc); 
  assign _T_1009 = 2'h2 == ex_ctrl_sel_alu1; 
  assign _T_1010 = _T_1009 ? $signed(_T_1008) : $signed(40'sh0); 
  assign _T_1011 = 2'h1 == ex_ctrl_sel_alu1; 
  assign ex_op1 = _T_1011 ? $signed(_T_1007) : $signed({{24{_T_1010[39]}},_T_1010}); 
  assign _T_1012 = $signed(_T_945); 
  assign _T_1013 = ex_reg_rvc ? $signed(4'sh2) : $signed(4'sh4); 
  assign _T_1014 = 2'h1 == ex_ctrl_sel_alu2; 
  assign _T_1015 = _T_1014 ? $signed(_T_1013) : $signed(4'sh0); 
  assign _T_1016 = 2'h3 == ex_ctrl_sel_alu2; 
  assign _T_1017 = _T_1016 ? $signed(ex_imm) : $signed({{28{_T_1015[3]}},_T_1015}); 
  assign _T_1018 = 2'h2 == ex_ctrl_sel_alu2; 
  assign ex_op2 = _T_1018 ? $signed(_T_1012) : $signed({{32{_T_1017[31]}},_T_1017}); 
  assign _T_1692 = ibuf_io_inst_0_valid == 1'h0; 
  assign _T_1693 = _T_1692 | ibuf_io_inst_0_bits_replay; 
  assign _T_1694 = _T_1693 | take_pc_mem_wb; 
  assign _T_1497 = ibuf_io_inst_0_bits_inst_rs1 != 5'h0; 
  assign _T_1498 = id_ctrl_rxs1 & _T_1497; 
  assign _T_1545 = ibuf_io_inst_0_bits_inst_rs1 == ex_waddr; 
  assign _T_1546 = _T_1498 & _T_1545; 
  assign _T_1499 = ibuf_io_inst_0_bits_inst_rs2 != 5'h0; 
  assign _T_1500 = id_ctrl_rxs2 & _T_1499; 
  assign _T_1547 = ibuf_io_inst_0_bits_inst_rs2 == ex_waddr; 
  assign _T_1548 = _T_1500 & _T_1547; 
  assign _T_1551 = _T_1546 | _T_1548; 
  assign _T_1501 = ibuf_io_inst_0_bits_inst_rd != 5'h0; 
  assign _T_1502 = id_ctrl_wxd & _T_1501; 
  assign _T_1549 = ibuf_io_inst_0_bits_inst_rd == ex_waddr; 
  assign _T_1550 = _T_1502 & _T_1549; 
  assign _T_1552 = _T_1551 | _T_1550; 
  assign data_hazard_ex = ex_ctrl_wxd & _T_1552; 
  assign _T_1539 = ex_ctrl_csr != 3'h0; 
  assign _T_1540 = _T_1539 | ex_ctrl_jalr; 
  assign _T_1541 = _T_1540 | ex_ctrl_mem; 
  assign _T_1543 = _T_1541 | ex_ctrl_div; 
  assign ex_cannot_bypass = _T_1543 | ex_ctrl_fp; 
  assign _T_1564 = data_hazard_ex & ex_cannot_bypass; 
  assign _T_1554 = io_fpu_dec_ren1 & _T_1545; 
  assign _T_1556 = io_fpu_dec_ren2 & _T_1547; 
  assign _T_1561 = _T_1554 | _T_1556; 
  assign _T_1557 = ibuf_io_inst_0_bits_inst_rs3 == ex_waddr; 
  assign _T_1558 = io_fpu_dec_ren3 & _T_1557; 
  assign _T_1562 = _T_1561 | _T_1558; 
  assign _T_1560 = io_fpu_dec_wen & _T_1549; 
  assign _T_1563 = _T_1562 | _T_1560; 
  assign fp_data_hazard_ex = ex_ctrl_wfd & _T_1563; 
  assign _T_1565 = _T_1564 | fp_data_hazard_ex; 
  assign id_ex_hazard = ex_reg_valid & _T_1565; 
  assign _T_1572 = ibuf_io_inst_0_bits_inst_rs1 == mem_waddr; 
  assign _T_1573 = _T_1498 & _T_1572; 
  assign _T_1574 = ibuf_io_inst_0_bits_inst_rs2 == mem_waddr; 
  assign _T_1575 = _T_1500 & _T_1574; 
  assign _T_1578 = _T_1573 | _T_1575; 
  assign _T_1576 = ibuf_io_inst_0_bits_inst_rd == mem_waddr; 
  assign _T_1577 = _T_1502 & _T_1576; 
  assign _T_1579 = _T_1578 | _T_1577; 
  assign data_hazard_mem = mem_ctrl_wxd & _T_1579; 
  assign _T_1566 = mem_ctrl_csr != 3'h0; 
  assign _T_1567 = mem_ctrl_mem & mem_reg_slow_bypass; 
  assign _T_1568 = _T_1566 | _T_1567; 
  assign _T_1569 = _T_1568 | mem_ctrl_mul; 
  assign _T_1570 = _T_1569 | mem_ctrl_div; 
  assign _T_1571 = _T_1570 | mem_ctrl_fp; 
  assign mem_cannot_bypass = _T_1571 | mem_ctrl_rocc; 
  assign _T_1591 = data_hazard_mem & mem_cannot_bypass; 
  assign _T_1581 = io_fpu_dec_ren1 & _T_1572; 
  assign _T_1583 = io_fpu_dec_ren2 & _T_1574; 
  assign _T_1588 = _T_1581 | _T_1583; 
  assign _T_1584 = ibuf_io_inst_0_bits_inst_rs3 == mem_waddr; 
  assign _T_1585 = io_fpu_dec_ren3 & _T_1584; 
  assign _T_1589 = _T_1588 | _T_1585; 
  assign _T_1587 = io_fpu_dec_wen & _T_1576; 
  assign _T_1590 = _T_1589 | _T_1587; 
  assign fp_data_hazard_mem = mem_ctrl_wfd & _T_1590; 
  assign _T_1592 = _T_1591 | fp_data_hazard_mem; 
  assign id_mem_hazard = mem_reg_valid & _T_1592; 
  assign _T_1665 = id_ex_hazard | id_mem_hazard; 
  assign _T_1595 = ibuf_io_inst_0_bits_inst_rs1 == wb_waddr; 
  assign _T_1596 = _T_1498 & _T_1595; 
  assign _T_1597 = ibuf_io_inst_0_bits_inst_rs2 == wb_waddr; 
  assign _T_1598 = _T_1500 & _T_1597; 
  assign _T_1601 = _T_1596 | _T_1598; 
  assign _T_1599 = ibuf_io_inst_0_bits_inst_rd == wb_waddr; 
  assign _T_1600 = _T_1502 & _T_1599; 
  assign _T_1602 = _T_1601 | _T_1600; 
  assign data_hazard_wb = wb_ctrl_wxd & _T_1602; 
  assign _T_1064 = io_dmem_resp_valid == 1'h0; 
  assign wb_dcache_miss = wb_ctrl_mem & _T_1064; 
  assign _T_1426 = wb_ctrl_div | wb_dcache_miss; 
  assign wb_set_sboard = _T_1426 | wb_ctrl_rocc; 
  assign _T_1614 = data_hazard_wb & wb_set_sboard; 
  assign _T_1604 = io_fpu_dec_ren1 & _T_1595; 
  assign _T_1606 = io_fpu_dec_ren2 & _T_1597; 
  assign _T_1611 = _T_1604 | _T_1606; 
  assign _T_1607 = ibuf_io_inst_0_bits_inst_rs3 == wb_waddr; 
  assign _T_1608 = io_fpu_dec_ren3 & _T_1607; 
  assign _T_1612 = _T_1611 | _T_1608; 
  assign _T_1610 = io_fpu_dec_wen & _T_1599; 
  assign _T_1613 = _T_1612 | _T_1610; 
  assign fp_data_hazard_wb = wb_ctrl_wfd & _T_1613; 
  assign _T_1615 = _T_1614 | fp_data_hazard_wb; 
  assign id_wb_hazard = wb_reg_valid & _T_1615; 
  assign _T_1666 = _T_1665 | id_wb_hazard; 
  assign _T_1505 = _T_1504[31:1]; 
  assign _GEN_245 = {{1'd0}, _T_1505}; 
  assign _T_1506 = _GEN_245 << 1; 
  assign _T_1512 = _T_1506 >> ibuf_io_inst_0_bits_inst_rs1; 
  assign _T_1513 = _T_1512[0]; 
  assign dmem_resp_valid = io_dmem_resp_valid & io_dmem_resp_bits_has_data; 
  assign dmem_resp_replay = dmem_resp_valid & io_dmem_resp_bits_replay; 
  assign _T_1432 = io_dmem_resp_bits_tag[0]; 
  assign dmem_resp_xpu = _T_1432 == 1'h0; 
  assign _T_1440 = dmem_resp_replay & dmem_resp_xpu; 
  assign _T_1438 = div_io_resp_ready & div_io_resp_valid; 
  assign ll_wen = _T_1440 ? 1'h1 : _T_1438; 
  assign dmem_resp_waddr = io_dmem_resp_bits_tag[5:1]; 
  assign ll_waddr = _T_1440 ? dmem_resp_waddr : div_io_resp_bits_tag; 
  assign _T_1514 = ll_waddr == ibuf_io_inst_0_bits_inst_rs1; 
  assign _T_1515 = ll_wen & _T_1514; 
  assign _T_1516 = _T_1515 == 1'h0; 
  assign _T_1517 = _T_1513 & _T_1516; 
  assign _T_1518 = _T_1498 & _T_1517; 
  assign _T_1519 = _T_1506 >> ibuf_io_inst_0_bits_inst_rs2; 
  assign _T_1520 = _T_1519[0]; 
  assign _T_1521 = ll_waddr == ibuf_io_inst_0_bits_inst_rs2; 
  assign _T_1522 = ll_wen & _T_1521; 
  assign _T_1523 = _T_1522 == 1'h0; 
  assign _T_1524 = _T_1520 & _T_1523; 
  assign _T_1525 = _T_1500 & _T_1524; 
  assign _T_1533 = _T_1518 | _T_1525; 
  assign _T_1526 = _T_1506 >> ibuf_io_inst_0_bits_inst_rd; 
  assign _T_1527 = _T_1526[0]; 
  assign _T_1528 = ll_waddr == ibuf_io_inst_0_bits_inst_rd; 
  assign _T_1529 = ll_wen & _T_1528; 
  assign _T_1530 = _T_1529 == 1'h0; 
  assign _T_1531 = _T_1527 & _T_1530; 
  assign _T_1532 = _T_1502 & _T_1531; 
  assign id_sboard_hazard = _T_1533 | _T_1532; 
  assign _T_1667 = _T_1666 | id_sboard_hazard; 
  assign _T_1668 = ex_reg_valid | mem_reg_valid; 
  assign _T_1669 = _T_1668 | wb_reg_valid; 
  assign _T_1670 = csr_io_singleStep & _T_1669; 
  assign _T_1671 = _T_1667 | _T_1670; 
  assign _T_1672 = id_csr_en & csr_io_decode_0_fp_csr; 
  assign _T_1673 = io_fpu_fcsr_rdy == 1'h0; 
  assign _T_1674 = _T_1672 & _T_1673; 
  assign _T_1675 = _T_1671 | _T_1674; 
  assign _T_1636 = _T_1617 >> ibuf_io_inst_0_bits_inst_rs1; 
  assign _T_1637 = _T_1636[0]; 
  assign _T_1638 = io_fpu_dec_ren1 & _T_1637; 
  assign _T_1639 = _T_1617 >> ibuf_io_inst_0_bits_inst_rs2; 
  assign _T_1640 = _T_1639[0]; 
  assign _T_1641 = io_fpu_dec_ren2 & _T_1640; 
  assign _T_1648 = _T_1638 | _T_1641; 
  assign _T_1642 = _T_1617 >> ibuf_io_inst_0_bits_inst_rs3; 
  assign _T_1643 = _T_1642[0]; 
  assign _T_1644 = io_fpu_dec_ren3 & _T_1643; 
  assign _T_1649 = _T_1648 | _T_1644; 
  assign _T_1645 = _T_1617 >> ibuf_io_inst_0_bits_inst_rd; 
  assign _T_1646 = _T_1645[0]; 
  assign _T_1647 = io_fpu_dec_wen & _T_1646; 
  assign id_stall_fpu = _T_1649 | _T_1647; 
  assign _T_1676 = id_ctrl_fp & id_stall_fpu; 
  assign _T_1677 = _T_1675 | _T_1676; 
  assign _T_1658 = io_dmem_perf_grant == 1'h0; 
  assign dcache_blocked = blocked & _T_1658; 
  assign _T_1678 = id_ctrl_mem & dcache_blocked; 
  assign _T_1679 = _T_1677 | _T_1678; 
  assign wb_wxd = wb_reg_valid & wb_ctrl_wxd; 
  assign _T_1682 = wb_wxd == 1'h0; 
  assign _T_1683 = div_io_resp_valid & _T_1682; 
  assign _T_1684 = div_io_req_ready | _T_1683; 
  assign _T_1685 = _T_1684 == 1'h0; 
  assign _T_1686 = _T_1685 | div_io_req_valid; 
  assign _T_1687 = id_ctrl_div & _T_1686; 
  assign _T_1688 = _T_1679 | _T_1687; 
  assign _T_1691 = _T_1688 | id_do_fence; 
  assign ctrl_stalld = _T_1691 | csr_io_csr_stall; 
  assign _T_1695 = _T_1694 | ctrl_stalld; 
  assign ctrl_killd = _T_1695 | csr_io_interrupt; 
  assign _T_1022 = ctrl_killd == 1'h0; 
  assign _T_1023 = take_pc_mem_wb == 1'h0; 
  assign _T_1024 = _T_1023 & ibuf_io_inst_0_valid; 
  assign _T_1032 = {ibuf_io_inst_0_bits_xcpt1_pf_inst,ibuf_io_inst_0_bits_xcpt1_ae_inst}; 
  assign _T_1033 = _T_1032 != 2'h0; 
  assign _T_1034 = {ibuf_io_inst_0_bits_xcpt0_pf_inst,ibuf_io_inst_0_bits_xcpt0_ae_inst}; 
  assign _T_1035 = _T_1034 != 2'h0; 
  assign _T_1036 = bpu_io_xcpt_if | _T_1035; 
  assign _T_1037 = id_ctrl_fence_i | id_csr_flush; 
  assign _T_1040 = {_T_1499,_T_1497}; 
  assign _T_1041 = _T_893 | _T_896; 
  assign _T_1042 = _T_1041 | _T_898; 
  assign do_bypass = _T_1042 | _T_900; 
  assign _T_1045 = do_bypass == 1'h0; 
  assign _T_1046 = id_ctrl_rxs1 & _T_1045; 
  assign _T_1441 = replay_wb == 1'h0; 
  assign _T_1442 = wb_reg_valid & _T_1441; 
  assign _T_1443 = wb_xcpt == 1'h0; 
  assign wb_valid = _T_1442 & _T_1443; 
  assign wb_wen = wb_valid & wb_ctrl_wxd; 
  assign rf_wen = wb_wen | ll_wen; 
  assign rf_waddr = ll_wen ? ll_waddr : wb_waddr; 
  assign _T_1450 = rf_waddr != 5'h0; 
  assign _T_1454 = rf_waddr == ibuf_io_inst_0_bits_inst_rs1; 
  assign _T_1444 = dmem_resp_valid & dmem_resp_xpu; 
  assign ll_wdata = div_io_resp_bits_data; 
  assign _T_1446 = wb_ctrl_csr != 3'h0; 
  assign _T_1448 = _T_1446 ? csr_io_rw_rdata : wb_reg_wdata; 
  assign _T_1449 = ll_wen ? ll_wdata : _T_1448; 
  assign rf_wdata = _T_1444 ? io_dmem_resp_bits_data : _T_1449; 
  assign _GEN_214 = _T_1454 ? rf_wdata : _T_722; 
  assign _GEN_221 = _T_1450 ? _GEN_214 : _T_722; 
  assign _GEN_228 = rf_wen ? _GEN_221 : _T_722; 
  assign _T_1047 = _GEN_228[1:0]; 
  assign _T_1048 = _GEN_228[63:2]; 
  assign _T_1049 = _T_901 | _T_904; 
  assign _T_1050 = _T_1049 | _T_906; 
  assign do_bypass_1 = _T_1050 | _T_908; 
  assign _T_1053 = do_bypass_1 == 1'h0; 
  assign _T_1054 = id_ctrl_rxs2 & _T_1053; 
  assign _T_1455 = rf_waddr == ibuf_io_inst_0_bits_inst_rs2; 
  assign _GEN_215 = _T_1455 ? rf_wdata : _T_730; 
  assign _GEN_222 = _T_1450 ? _GEN_215 : _T_730; 
  assign _GEN_229 = rf_wen ? _GEN_222 : _T_730; 
  assign _T_1055 = _GEN_229[1:0]; 
  assign _T_1056 = _GEN_229[63:2]; 
  assign _T_1057 = ibuf_io_inst_0_bits_raw[15:0]; 
  assign inst = ibuf_io_inst_0_bits_rvc ? {{16'd0}, _T_1057} : ibuf_io_inst_0_bits_raw; 
  assign _T_1058 = inst[1:0]; 
  assign _T_1059 = inst[31:2]; 
  assign _T_1593 = mem_reg_valid & data_hazard_mem; 
  assign id_load_use = _T_1593 & mem_ctrl_mem; 
  assign _T_1061 = _T_1022 | csr_io_interrupt; 
  assign _T_1062 = _T_1061 | ibuf_io_inst_0_bits_replay; 
  assign _T_1065 = io_dmem_req_ready == 1'h0; 
  assign _T_1066 = ex_ctrl_mem & _T_1065; 
  assign _T_1067 = div_io_req_ready == 1'h0; 
  assign _T_1068 = ex_ctrl_div & _T_1067; 
  assign replay_ex_structural = _T_1066 | _T_1068; 
  assign replay_ex_load_use = wb_dcache_miss & ex_reg_load_use; 
  assign _T_1069 = replay_ex_structural | replay_ex_load_use; 
  assign _T_1070 = ex_reg_valid & _T_1069; 
  assign replay_ex = ex_reg_replay | _T_1070; 
  assign _T_1071 = take_pc_mem_wb | replay_ex; 
  assign _T_1072 = ex_reg_valid == 1'h0; 
  assign ctrl_killx = _T_1071 | _T_1072; 
  assign _T_1073 = ex_ctrl_mem_cmd == 5'h7; 
  assign _T_1084 = 3'h0 == ex_ctrl_mem_type; 
  assign _T_1085 = 3'h4 == ex_ctrl_mem_type; 
  assign _T_1086 = 3'h1 == ex_ctrl_mem_type; 
  assign _T_1087 = 3'h5 == ex_ctrl_mem_type; 
  assign _T_1089 = _T_1084 | _T_1085; 
  assign _T_1090 = _T_1089 | _T_1086; 
  assign _T_1091 = _T_1090 | _T_1087; 
  assign ex_slow_bypass = _T_1073 | _T_1091; 
  assign _T_1093 = ex_ctrl_mem_cmd == 5'h14; 
  assign ex_sfence = ex_ctrl_mem & _T_1093; 
  assign ex_xcpt = ex_reg_xcpt_interrupt | ex_reg_xcpt; 
  assign _T_1104 = mem_reg_valid | mem_reg_replay; 
  assign mem_pc_valid = _T_1104 | mem_reg_xcpt_interrupt; 
  assign _T_1256 = mem_npc[1]; 
  assign _T_1257 = _T_832 & _T_1256; 
  assign _T_1258 = mem_reg_sfence == 1'h0; 
  assign mem_npc_misaligned = _T_1257 & _T_1258; 
  assign _T_1259 = mem_reg_xcpt == 1'h0; 
  assign _T_1260 = mem_ctrl_jalr ^ mem_npc_misaligned; 
  assign _T_1261 = _T_1259 & _T_1260; 
  assign _T_1263 = _T_1261 ? $signed({{24{mem_br_target[39]}},mem_br_target}) : $signed(_T_1237); 
  assign mem_int_wdata = $unsigned(_T_1263); 
  assign _T_1264 = mem_ctrl_branch | mem_ctrl_jalr; 
  assign mem_cfi = _T_1264 | mem_ctrl_jal; 
  assign _T_1266 = _T_1106 | mem_ctrl_jalr; 
  assign mem_cfi_taken = _T_1266 | mem_ctrl_jal; 
  assign _T_1271 = ctrl_killx == 1'h0; 
  assign _T_1278 = mem_reg_valid & mem_reg_flush_pipe; 
  assign _T_1279 = ex_ctrl_mem_cmd == 5'h0; 
  assign _T_1280 = ex_ctrl_mem_cmd == 5'h6; 
  assign _T_1281 = _T_1279 | _T_1280; 
  assign _T_1283 = _T_1281 | _T_1073; 
  assign _T_1284 = ex_ctrl_mem_cmd == 5'h4; 
  assign _T_1285 = ex_ctrl_mem_cmd == 5'h9; 
  assign _T_1286 = ex_ctrl_mem_cmd == 5'ha; 
  assign _T_1287 = ex_ctrl_mem_cmd == 5'hb; 
  assign _T_1288 = _T_1284 | _T_1285; 
  assign _T_1289 = _T_1288 | _T_1286; 
  assign _T_1290 = _T_1289 | _T_1287; 
  assign _T_1291 = ex_ctrl_mem_cmd == 5'h8; 
  assign _T_1292 = ex_ctrl_mem_cmd == 5'hc; 
  assign _T_1293 = ex_ctrl_mem_cmd == 5'hd; 
  assign _T_1294 = ex_ctrl_mem_cmd == 5'he; 
  assign _T_1295 = ex_ctrl_mem_cmd == 5'hf; 
  assign _T_1296 = _T_1291 | _T_1292; 
  assign _T_1297 = _T_1296 | _T_1293; 
  assign _T_1298 = _T_1297 | _T_1294; 
  assign _T_1299 = _T_1298 | _T_1295; 
  assign _T_1300 = _T_1290 | _T_1299; 
  assign _T_1301 = _T_1283 | _T_1300; 
  assign _T_1302 = ex_ctrl_mem & _T_1301; 
  assign _T_1303 = ex_ctrl_mem_cmd == 5'h1; 
  assign _T_1304 = ex_ctrl_mem_cmd == 5'h11; 
  assign _T_1305 = _T_1303 | _T_1304; 
  assign _T_1307 = _T_1305 | _T_1073; 
  assign _T_1325 = _T_1307 | _T_1300; 
  assign _T_1326 = ex_ctrl_mem & _T_1325; 
  assign _T_1328 = ex_ctrl_mem | ex_sfence; 
  assign _T_1329 = ex_ctrl_rxs2 & _T_1328; 
  assign _T_1330 = ex_ctrl_mem_type[1:0]; 
  assign _T_1331 = _T_1330 == 2'h0; 
  assign _T_1332 = _T_945[7:0]; 
  assign _T_1333 = {_T_1332,_T_1332}; 
  assign _T_1334 = {_T_1333,_T_1333}; 
  assign _T_1335 = {_T_1334,_T_1334}; 
  assign _T_1336 = _T_1330 == 2'h1; 
  assign _T_1337 = _T_945[15:0]; 
  assign _T_1338 = {_T_1337,_T_1337}; 
  assign _T_1339 = {_T_1338,_T_1338}; 
  assign _T_1340 = _T_1330 == 2'h2; 
  assign _T_1341 = _T_945[31:0]; 
  assign _T_1342 = {_T_1341,_T_1341}; 
  assign _T_1346 = ex_ctrl_jalr & csr_io_status_debug; 
  assign _T_1347 = mem_reg_load & bpu_io_xcpt_ld; 
  assign _T_1348 = mem_reg_store & bpu_io_xcpt_st; 
  assign mem_breakpoint = _T_1347 | _T_1348; 
  assign _T_1349 = mem_reg_load & bpu_io_debug_ld; 
  assign _T_1350 = mem_reg_store & bpu_io_debug_st; 
  assign mem_debug_breakpoint = _T_1349 | _T_1350; 
  assign mem_ldst_xcpt = mem_debug_breakpoint | mem_breakpoint; 
  assign mem_ldst_cause = mem_debug_breakpoint ? 4'he : 4'h3; 
  assign _T_1351 = mem_reg_xcpt_interrupt | mem_reg_xcpt; 
  assign _T_1352 = mem_reg_valid & mem_npc_misaligned; 
  assign _T_1353 = mem_reg_valid & mem_ldst_xcpt; 
  assign _T_1354 = _T_1351 | _T_1352; 
  assign mem_xcpt = _T_1354 | _T_1353; 
  assign _T_1355 = _T_1352 ? 4'h0 : mem_ldst_cause; 
  assign dcache_kill_mem = _T_889 & io_dmem_replay_next; 
  assign _T_1369 = mem_reg_valid & mem_ctrl_fp; 
  assign fpu_kill_mem = _T_1369 & io_fpu_nack_mem; 
  assign _T_1370 = dcache_kill_mem | mem_reg_replay; 
  assign replay_mem = _T_1370 | fpu_kill_mem; 
  assign _T_1371 = dcache_kill_mem | take_pc_wb; 
  assign _T_1372 = _T_1371 | mem_reg_xcpt; 
  assign _T_1373 = mem_reg_valid == 1'h0; 
  assign killm_common = _T_1372 | _T_1373; 
  assign _T_1378 = killm_common | mem_xcpt; 
  assign ctrl_killm = _T_1378 | fpu_kill_mem; 
  assign _T_1379 = ctrl_killm == 1'h0; 
  assign _T_1380 = take_pc_wb == 1'h0; 
  assign _T_1387 = _T_1259 & mem_ctrl_fp; 
  assign _T_1388 = _T_1387 & mem_ctrl_wxd; 
  assign _T_1408 = _T_1400 ? 3'h7 : 3'h5; 
  assign _T_1409 = _T_1398 ? 4'hd : {{1'd0}, _T_1408}; 
  assign _T_1410 = _T_1396 ? 4'hf : _T_1409; 
  assign _T_1411 = _T_1394 ? 4'h4 : _T_1410; 
  assign _T_1412 = _T_1392 ? 4'h6 : _T_1411; 
  assign wb_cause = wb_reg_xcpt ? wb_reg_cause : {{60'd0}, _T_1412}; 
  assign _T_1413 = wb_cause == 64'h6; 
  assign _T_1415 = wb_cause == 64'h4; 
  assign _T_1417 = wb_cause == 64'hf; 
  assign _T_1419 = wb_cause == 64'hd; 
  assign _T_1421 = wb_cause == 64'h7; 
  assign _T_1423 = wb_cause == 64'h5; 
  assign _T_1457 = wb_reg_raw_inst[1:0]; 
  assign _T_1458 = ~ _T_1457; 
  assign _T_1459 = _T_1458 == 2'h0; 
  assign _T_1460 = wb_reg_inst[31:16]; 
  assign _T_1461 = _T_1459 ? _T_1460 : 16'h0; 
  assign _T_1462 = wb_reg_raw_inst[15:0]; 
  assign _T_1464 = wb_cause == 64'h2; 
  assign _T_1465 = wb_cause == 64'h3; 
  assign _T_1470 = wb_cause == 64'h1; 
  assign _T_1473 = wb_cause == 64'hc; 
  assign _T_1474 = _T_1464 | _T_1465; 
  assign _T_1475 = _T_1474 | _T_1415; 
  assign _T_1476 = _T_1475 | _T_1413; 
  assign _T_1477 = _T_1476 | _T_1423; 
  assign _T_1478 = _T_1477 | _T_1421; 
  assign _T_1479 = _T_1478 | _T_1470; 
  assign _T_1480 = _T_1479 | _T_1419; 
  assign _T_1481 = _T_1480 | _T_1417; 
  assign _T_1482 = _T_1481 | _T_1473; 
  assign tval_valid = wb_xcpt & _T_1482; 
  assign _T_1483 = $signed(wb_reg_wdata); 
  assign a_1 = _T_1483[63:39]; 
  assign _T_1484 = $signed(a_1) == $signed(25'sh0); 
  assign _T_1485 = $signed(a_1) == $signed(-25'sh1); 
  assign _T_1486 = _T_1484 | _T_1485; 
  assign _T_1487 = wb_reg_wdata[39]; 
  assign _T_1488 = wb_reg_wdata[38]; 
  assign _T_1489 = _T_1488 == 1'h0; 
  assign msb_1 = _T_1486 ? _T_1487 : _T_1489; 
  assign _T_1490 = wb_reg_wdata[38:0]; 
  assign _T_1491 = {msb_1,_T_1490}; 
  assign _T_1494 = wb_reg_valid ? 3'h0 : 3'h4; 
  assign _T_1495 = ~ _T_1494; 
  assign _T_1507 = 32'h1 << ll_waddr; 
  assign _T_1508 = ll_wen ? _T_1507 : 32'h0; 
  assign _T_1509 = ~ _T_1508; 
  assign _T_1510 = _T_1506 & _T_1509; 
  assign _T_1534 = wb_set_sboard & wb_wen; 
  assign _T_1535 = 32'h1 << wb_waddr; 
  assign _T_1536 = _T_1534 ? _T_1535 : 32'h0; 
  assign _T_1537 = _T_1510 | _T_1536; 
  assign _T_1538 = ll_wen | _T_1534; 
  assign _T_1618 = wb_dcache_miss & wb_ctrl_wfd; 
  assign _T_1619 = _T_1618 | io_fpu_sboard_set; 
  assign _T_1620 = _T_1619 & wb_valid; 
  assign _T_1622 = _T_1620 ? _T_1535 : 32'h0; 
  assign _T_1623 = _T_1617 | _T_1622; 
  assign _T_1625 = dmem_resp_replay & _T_1432; 
  assign _T_1626 = 32'h1 << dmem_resp_waddr; 
  assign _T_1627 = _T_1625 ? _T_1626 : 32'h0; 
  assign _T_1628 = ~ _T_1627; 
  assign _T_1629 = _T_1623 & _T_1628; 
  assign _T_1630 = _T_1620 | _T_1625; 
  assign _T_1631 = 32'h1 << io_fpu_sboard_clra; 
  assign _T_1632 = io_fpu_sboard_clr ? _T_1631 : 32'h0; 
  assign _T_1633 = ~ _T_1632; 
  assign _T_1634 = _T_1629 & _T_1633; 
  assign _T_1635 = _T_1630 | io_fpu_sboard_clr; 
  assign _T_1652 = _T_1065 & io_dmem_clock_enabled; 
  assign _T_1654 = _T_1652 & _T_1658; 
  assign _T_1655 = blocked | io_dmem_req_valid; 
  assign _T_1656 = _T_1655 | io_dmem_s2_nack; 
  assign _T_1698 = wb_xcpt | csr_io_eret; 
  assign _T_1699 = replay_wb ? wb_reg_pc : mem_npc; 
  assign _T_1701 = wb_reg_valid & wb_ctrl_fence_i; 
  assign _T_1702 = io_dmem_s2_nack == 1'h0; 
  assign _T_1704 = ex_pc_valid | mem_pc_valid; 
  assign _T_1705 = io_ptw_customCSRs_csrs_0_value[1]; 
  assign _T_1712 = mem_reg_valid & _T_1380; 
  assign _T_1713 = _T_1712 & mem_wrong_npc; 
  assign _T_1714 = mem_cfi == 1'h0; 
  assign _T_1715 = _T_1714 | mem_cfi_taken; 
  assign _T_1717 = mem_ctrl_jal | mem_ctrl_jalr; 
  assign _T_1718 = mem_waddr[0]; 
  assign _T_1719 = _T_1717 & _T_1718; 
  assign _T_1720 = mem_reg_inst[19:15]; 
  assign _T_1721 = _T_1720 & 5'h1b; 
  assign _T_1722 = 5'h1 == _T_1721; 
  assign _T_1723 = mem_ctrl_jalr & _T_1722; 
  assign _T_1726 = _T_1723 ? 2'h3 : {{1'd0}, _T_1717}; 
  assign _T_1728 = mem_reg_rvc ? 2'h0 : 2'h2; 
  assign _GEN_246 = {{38'd0}, _T_1728}; 
  assign _T_1730 = mem_reg_pc + _GEN_246; 
  assign _T_1731 = ~ io_imem_btb_update_bits_br_pc; 
  assign _T_1732 = _T_1731 | 39'h3; 
  assign ex_dcache_tag = {ex_waddr,ex_ctrl_fp}; 
  assign a_2 = _T_1007[63:39]; 
  assign _T_1742 = $signed(a_2) == $signed(25'sh0); 
  assign _T_1743 = $signed(a_2) == $signed(-25'sh1); 
  assign _T_1744 = _T_1742 | _T_1743; 
  assign _T_1745 = alu_io_adder_out[39]; 
  assign _T_1746 = alu_io_adder_out[38]; 
  assign _T_1747 = _T_1746 == 1'h0; 
  assign msb_2 = _T_1744 ? _T_1745 : _T_1747; 
  assign _T_1748 = alu_io_adder_out[38:0]; 
  assign _T_1751 = killm_common | mem_ldst_xcpt; 
  assign _T_1769 = wb_reg_inst[19:15]; 
  assign _T_1770 = wb_reg_inst[24:20]; 
  assign coreMonitorBundle_time = csr_io_time[31:0]; 
  assign _T_1777 = csr_io_trace_0_exception == 1'h0; 
  assign coreMonitorBundle_valid = csr_io_trace_0_valid & _T_1777; 
  assign coreMonitorBundle_pc = csr_io_trace_0_iaddr; 
  assign _T_1781 = _T_1534 == 1'h0; 
  assign _T_1782 = rf_wen & _T_1781; 
  assign coreMonitorBundle_wrdst = _T_1782 ? rf_waddr : 5'h0; 
  assign _T_1795 = reset == 1'h0; 
  assign coreMonitorBundle_inst = csr_io_trace_0_insn; 
  assign io_imem_might_request = imem_might_request_reg; 
  assign io_imem_req_valid = take_pc_wb | take_pc_mem; 
  assign io_imem_req_bits_pc = _T_1698 ? csr_io_evec : _T_1699; 
  assign io_imem_req_bits_speculative = take_pc_wb == 1'h0; 
  assign io_imem_sfence_valid = wb_reg_valid & wb_reg_sfence; 
  assign io_imem_sfence_bits_rs1 = wb_ctrl_mem_type[0]; 
  assign io_imem_sfence_bits_rs2 = wb_ctrl_mem_type[1]; 
  assign io_imem_sfence_bits_addr = wb_reg_wdata[38:0]; 
  assign io_imem_resp_ready = ibuf_io_imem_ready; 
  assign io_imem_btb_update_valid = _T_1713 & _T_1715; 
  assign io_imem_btb_update_bits_prediction_entry = mem_reg_btb_resp_entry; 
  assign io_imem_btb_update_bits_pc = ~ _T_1732; 
  assign io_imem_btb_update_bits_isValid = _T_1264 | mem_ctrl_jal; 
  assign io_imem_btb_update_bits_br_pc = _T_1730[38:0]; 
  assign io_imem_btb_update_bits_cfiType = _T_1719 ? 2'h2 : _T_1726; 
  assign io_imem_bht_update_valid = mem_reg_valid & _T_1380; 
  assign io_imem_bht_update_bits_prediction_history = mem_reg_btb_resp_bht_history; 
  assign io_imem_bht_update_bits_pc = io_imem_btb_update_bits_pc; 
  assign io_imem_bht_update_bits_branch = mem_ctrl_branch; 
  assign io_imem_bht_update_bits_taken = mem_br_taken; 
  assign io_imem_bht_update_bits_mispredict = ex_pc_valid ? _T_1250 : _T_1253; 
  assign io_imem_flush_icache = _T_1701 & _T_1702; 
  assign io_dmem_req_valid = ex_reg_valid & ex_ctrl_mem; 
  assign io_dmem_req_bits_addr = {msb_2,_T_1748}; 
  assign io_dmem_req_bits_tag = {{1'd0}, ex_dcache_tag}; 
  assign io_dmem_req_bits_cmd = ex_ctrl_mem_cmd; 
  assign io_dmem_req_bits_typ = ex_ctrl_mem_type; 
  assign io_dmem_s1_kill = _T_1751 | fpu_kill_mem; 
  assign io_dmem_s1_data_data = mem_ctrl_fp ? io_fpu_store_data : mem_reg_rs2; 
  assign io_dmem_keep_clock_enabled = ibuf_io_inst_0_valid & id_ctrl_mem; 
  assign io_ptw_ptbr_mode = csr_io_ptbr_mode; 
  assign io_ptw_ptbr_ppn = csr_io_ptbr_ppn; 
  assign io_ptw_sfence_valid = io_imem_sfence_valid; 
  assign io_ptw_sfence_bits_rs1 = io_imem_sfence_bits_rs1; 
  assign io_ptw_status_dprv = csr_io_status_dprv; 
  assign io_ptw_status_prv = csr_io_status_prv; 
  assign io_ptw_status_mxr = csr_io_status_mxr; 
  assign io_ptw_status_sum = csr_io_status_sum; 
  assign io_ptw_pmp_0_cfg_l = csr_io_pmp_0_cfg_l; 
  assign io_ptw_pmp_0_cfg_a = csr_io_pmp_0_cfg_a; 
  assign io_ptw_pmp_0_cfg_x = csr_io_pmp_0_cfg_x; 
  assign io_ptw_pmp_0_cfg_w = csr_io_pmp_0_cfg_w; 
  assign io_ptw_pmp_0_cfg_r = csr_io_pmp_0_cfg_r; 
  assign io_ptw_pmp_0_addr = csr_io_pmp_0_addr; 
  assign io_ptw_pmp_0_mask = csr_io_pmp_0_mask; 
  assign io_ptw_pmp_1_cfg_l = csr_io_pmp_1_cfg_l; 
  assign io_ptw_pmp_1_cfg_a = csr_io_pmp_1_cfg_a; 
  assign io_ptw_pmp_1_cfg_x = csr_io_pmp_1_cfg_x; 
  assign io_ptw_pmp_1_cfg_w = csr_io_pmp_1_cfg_w; 
  assign io_ptw_pmp_1_cfg_r = csr_io_pmp_1_cfg_r; 
  assign io_ptw_pmp_1_addr = csr_io_pmp_1_addr; 
  assign io_ptw_pmp_1_mask = csr_io_pmp_1_mask; 
  assign io_ptw_pmp_2_cfg_l = csr_io_pmp_2_cfg_l; 
  assign io_ptw_pmp_2_cfg_a = csr_io_pmp_2_cfg_a; 
  assign io_ptw_pmp_2_cfg_x = csr_io_pmp_2_cfg_x; 
  assign io_ptw_pmp_2_cfg_w = csr_io_pmp_2_cfg_w; 
  assign io_ptw_pmp_2_cfg_r = csr_io_pmp_2_cfg_r; 
  assign io_ptw_pmp_2_addr = csr_io_pmp_2_addr; 
  assign io_ptw_pmp_2_mask = csr_io_pmp_2_mask; 
  assign io_ptw_pmp_3_cfg_l = csr_io_pmp_3_cfg_l; 
  assign io_ptw_pmp_3_cfg_a = csr_io_pmp_3_cfg_a; 
  assign io_ptw_pmp_3_cfg_x = csr_io_pmp_3_cfg_x; 
  assign io_ptw_pmp_3_cfg_w = csr_io_pmp_3_cfg_w; 
  assign io_ptw_pmp_3_cfg_r = csr_io_pmp_3_cfg_r; 
  assign io_ptw_pmp_3_addr = csr_io_pmp_3_addr; 
  assign io_ptw_pmp_3_mask = csr_io_pmp_3_mask; 
  assign io_ptw_pmp_4_cfg_l = csr_io_pmp_4_cfg_l; 
  assign io_ptw_pmp_4_cfg_a = csr_io_pmp_4_cfg_a; 
  assign io_ptw_pmp_4_cfg_x = csr_io_pmp_4_cfg_x; 
  assign io_ptw_pmp_4_cfg_w = csr_io_pmp_4_cfg_w; 
  assign io_ptw_pmp_4_cfg_r = csr_io_pmp_4_cfg_r; 
  assign io_ptw_pmp_4_addr = csr_io_pmp_4_addr; 
  assign io_ptw_pmp_4_mask = csr_io_pmp_4_mask; 
  assign io_ptw_pmp_5_cfg_l = csr_io_pmp_5_cfg_l; 
  assign io_ptw_pmp_5_cfg_a = csr_io_pmp_5_cfg_a; 
  assign io_ptw_pmp_5_cfg_x = csr_io_pmp_5_cfg_x; 
  assign io_ptw_pmp_5_cfg_w = csr_io_pmp_5_cfg_w; 
  assign io_ptw_pmp_5_cfg_r = csr_io_pmp_5_cfg_r; 
  assign io_ptw_pmp_5_addr = csr_io_pmp_5_addr; 
  assign io_ptw_pmp_5_mask = csr_io_pmp_5_mask; 
  assign io_ptw_pmp_6_cfg_l = csr_io_pmp_6_cfg_l; 
  assign io_ptw_pmp_6_cfg_a = csr_io_pmp_6_cfg_a; 
  assign io_ptw_pmp_6_cfg_x = csr_io_pmp_6_cfg_x; 
  assign io_ptw_pmp_6_cfg_w = csr_io_pmp_6_cfg_w; 
  assign io_ptw_pmp_6_cfg_r = csr_io_pmp_6_cfg_r; 
  assign io_ptw_pmp_6_addr = csr_io_pmp_6_addr; 
  assign io_ptw_pmp_6_mask = csr_io_pmp_6_mask; 
  assign io_ptw_pmp_7_cfg_l = csr_io_pmp_7_cfg_l; 
  assign io_ptw_pmp_7_cfg_a = csr_io_pmp_7_cfg_a; 
  assign io_ptw_pmp_7_cfg_x = csr_io_pmp_7_cfg_x; 
  assign io_ptw_pmp_7_cfg_w = csr_io_pmp_7_cfg_w; 
  assign io_ptw_pmp_7_cfg_r = csr_io_pmp_7_cfg_r; 
  assign io_ptw_pmp_7_addr = csr_io_pmp_7_addr; 
  assign io_ptw_pmp_7_mask = csr_io_pmp_7_mask; 
  assign io_ptw_customCSRs_csrs_0_value = 64'h0; 
  assign io_fpu_inst = ibuf_io_inst_0_bits_inst_bits; 
  assign io_fpu_fromint_data = ex_reg_rs_bypass_0 ? _T_935 : _T_936; 
  assign io_fpu_fcsr_rm = csr_io_fcsr_rm; 
  assign io_fpu_dmem_resp_val = dmem_resp_valid & _T_1432; 
  assign io_fpu_dmem_resp_type = io_dmem_resp_bits_typ; 
  assign io_fpu_dmem_resp_tag = io_dmem_resp_bits_tag[5:1]; 
  assign io_fpu_dmem_resp_data = io_dmem_resp_bits_data_word_bypass; 
  assign io_fpu_valid = _T_1022 & id_ctrl_fp; 
  assign io_fpu_killx = _T_1071 | _T_1072; 
  assign io_fpu_killm = _T_1372 | _T_1373; 
  assign ibuf_clock = clock; 
  assign ibuf_reset = reset; 
  assign ibuf_io_imem_valid = io_imem_resp_valid; 
  assign ibuf_io_imem_bits_btb_taken = io_imem_resp_bits_btb_taken; 
  assign ibuf_io_imem_bits_btb_bridx = io_imem_resp_bits_btb_bridx; 
  assign ibuf_io_imem_bits_btb_entry = io_imem_resp_bits_btb_entry; 
  assign ibuf_io_imem_bits_btb_bht_history = io_imem_resp_bits_btb_bht_history; 
  assign ibuf_io_imem_bits_pc = io_imem_resp_bits_pc; 
  assign ibuf_io_imem_bits_data = io_imem_resp_bits_data; 
  assign ibuf_io_imem_bits_xcpt_pf_inst = io_imem_resp_bits_xcpt_pf_inst; 
  assign ibuf_io_imem_bits_xcpt_ae_inst = io_imem_resp_bits_xcpt_ae_inst; 
  assign ibuf_io_imem_bits_replay = io_imem_resp_bits_replay; 
  assign ibuf_io_kill = take_pc_wb | take_pc_mem; 
  assign ibuf_io_inst_0_ready = ctrl_stalld == 1'h0; 
  assign csr_clock = clock; 
  assign csr_reset = reset; 
  assign csr_io_ungated_clock = clock; 
  assign csr_io_interrupts_debug = io_interrupts_debug; 
  assign csr_io_interrupts_mtip = io_interrupts_mtip; 
  assign csr_io_interrupts_msip = io_interrupts_msip; 
  assign csr_io_interrupts_meip = io_interrupts_meip; 
  assign csr_io_interrupts_seip = io_interrupts_seip; 
  assign csr_io_hartid = io_hartid; 
  assign csr_io_rw_addr = wb_reg_inst[31:20]; 
  assign csr_io_rw_cmd = wb_ctrl_csr & _T_1495; 
  assign csr_io_rw_wdata = wb_reg_wdata; 
  assign csr_io_decode_0_csr = ibuf_io_inst_0_bits_raw[31:20]; 
  assign csr_io_exception = _T_1407 | _T_1402; 
  assign csr_io_retire = _T_1442 & _T_1443; 
  assign csr_io_cause = wb_reg_xcpt ? wb_reg_cause : {{60'd0}, _T_1412}; 
  assign csr_io_pc = wb_reg_pc; 
  assign csr_io_tval = tval_valid ? _T_1491 : 40'h0; 
  assign csr_io_fcsr_flags_valid = io_fpu_fcsr_flags_valid; 
  assign csr_io_fcsr_flags_bits = io_fpu_fcsr_flags_bits; 
  assign csr_io_rocc_interrupt = io_rocc_interrupt; 
  assign csr_io_inst_0 = {_T_1461,_T_1462}; 
  assign bpu_io_status_debug = csr_io_status_debug; 
  assign bpu_io_status_prv = csr_io_status_prv; 
  assign bpu_io_bp_0_control_action = csr_io_bp_0_control_action; 
  assign bpu_io_bp_0_control_tmatch = csr_io_bp_0_control_tmatch; 
  assign bpu_io_bp_0_control_m = csr_io_bp_0_control_m; 
  assign bpu_io_bp_0_control_s = csr_io_bp_0_control_s; 
  assign bpu_io_bp_0_control_u = csr_io_bp_0_control_u; 
  assign bpu_io_bp_0_control_x = csr_io_bp_0_control_x; 
  assign bpu_io_bp_0_control_w = csr_io_bp_0_control_w; 
  assign bpu_io_bp_0_control_r = csr_io_bp_0_control_r; 
  assign bpu_io_bp_0_address = csr_io_bp_0_address; 
  assign bpu_io_pc = ibuf_io_pc[38:0]; 
  assign bpu_io_ea = mem_reg_wdata[38:0]; 
  assign alu_io_dw = ex_ctrl_alu_dw; 
  assign alu_io_fn = ex_ctrl_alu_fn; 
  assign alu_io_in2 = $unsigned(ex_op2); 
  assign alu_io_in1 = $unsigned(ex_op1); 
  assign div_clock = clock; 
  assign div_reset = reset; 
  assign div_io_req_valid = ex_reg_valid & ex_ctrl_div; 
  assign div_io_req_bits_fn = ex_ctrl_alu_fn; 
  assign div_io_req_bits_dw = ex_ctrl_alu_dw; 
  assign div_io_req_bits_in1 = ex_reg_rs_bypass_0 ? _T_935 : _T_936; 
  assign div_io_req_bits_in2 = ex_reg_rs_bypass_1 ? _T_943 : _T_944; 
  assign div_io_req_bits_tag = ex_reg_inst[11:7]; 
  assign div_io_kill = killm_common & _T_1376; 
  assign div_io_resp_ready = _T_1440 ? 1'h0 : _T_1682; 
  assign PlusArgTimeout_clock = clock; 
  assign PlusArgTimeout_reset = reset; 
  assign PlusArgTimeout_io_count = csr_io_time[31:0]; 
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
  _RAND_0 = {2{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 31; initvar = initvar+1)
    _T_714[initvar] = _RAND_0[63:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_1 = {2{`RANDOM}};
  _RAND_2 = {2{`RANDOM}};
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  imem_might_request_reg = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  ex_ctrl_fp = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  ex_ctrl_branch = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  ex_ctrl_jal = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  ex_ctrl_jalr = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  ex_ctrl_rxs2 = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  ex_ctrl_sel_alu2 = _RAND_9[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  ex_ctrl_sel_alu1 = _RAND_10[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  ex_ctrl_sel_imm = _RAND_11[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  ex_ctrl_alu_dw = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  ex_ctrl_alu_fn = _RAND_13[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  ex_ctrl_mem = _RAND_14[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  ex_ctrl_mem_cmd = _RAND_15[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  ex_ctrl_mem_type = _RAND_16[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  ex_ctrl_wfd = _RAND_17[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  ex_ctrl_div = _RAND_18[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  ex_ctrl_wxd = _RAND_19[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  ex_ctrl_csr = _RAND_20[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{`RANDOM}};
  ex_ctrl_fence_i = _RAND_21[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{`RANDOM}};
  mem_ctrl_fp = _RAND_22[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{`RANDOM}};
  mem_ctrl_rocc = _RAND_23[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{`RANDOM}};
  mem_ctrl_branch = _RAND_24[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{`RANDOM}};
  mem_ctrl_jal = _RAND_25[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{`RANDOM}};
  mem_ctrl_jalr = _RAND_26[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{`RANDOM}};
  mem_ctrl_mem = _RAND_27[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {1{`RANDOM}};
  mem_ctrl_mem_type = _RAND_28[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_29 = {1{`RANDOM}};
  mem_ctrl_wfd = _RAND_29[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_30 = {1{`RANDOM}};
  mem_ctrl_mul = _RAND_30[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_31 = {1{`RANDOM}};
  mem_ctrl_div = _RAND_31[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_32 = {1{`RANDOM}};
  mem_ctrl_wxd = _RAND_32[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_33 = {1{`RANDOM}};
  mem_ctrl_csr = _RAND_33[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_34 = {1{`RANDOM}};
  mem_ctrl_fence_i = _RAND_34[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_35 = {1{`RANDOM}};
  wb_ctrl_rocc = _RAND_35[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_36 = {1{`RANDOM}};
  wb_ctrl_mem = _RAND_36[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_37 = {1{`RANDOM}};
  wb_ctrl_mem_type = _RAND_37[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_38 = {1{`RANDOM}};
  wb_ctrl_wfd = _RAND_38[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_39 = {1{`RANDOM}};
  wb_ctrl_div = _RAND_39[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_40 = {1{`RANDOM}};
  wb_ctrl_wxd = _RAND_40[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_41 = {1{`RANDOM}};
  wb_ctrl_csr = _RAND_41[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_42 = {1{`RANDOM}};
  wb_ctrl_fence_i = _RAND_42[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_43 = {1{`RANDOM}};
  ex_reg_xcpt_interrupt = _RAND_43[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_44 = {1{`RANDOM}};
  ex_reg_valid = _RAND_44[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_45 = {1{`RANDOM}};
  ex_reg_rvc = _RAND_45[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_46 = {1{`RANDOM}};
  ex_reg_btb_resp_entry = _RAND_46[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_47 = {1{`RANDOM}};
  ex_reg_btb_resp_bht_history = _RAND_47[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_48 = {1{`RANDOM}};
  ex_reg_xcpt = _RAND_48[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_49 = {1{`RANDOM}};
  ex_reg_flush_pipe = _RAND_49[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_50 = {1{`RANDOM}};
  ex_reg_load_use = _RAND_50[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_51 = {2{`RANDOM}};
  ex_reg_cause = _RAND_51[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_52 = {1{`RANDOM}};
  ex_reg_replay = _RAND_52[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_53 = {2{`RANDOM}};
  ex_reg_pc = _RAND_53[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_54 = {1{`RANDOM}};
  ex_reg_inst = _RAND_54[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_55 = {1{`RANDOM}};
  ex_reg_raw_inst = _RAND_55[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_56 = {1{`RANDOM}};
  mem_reg_xcpt_interrupt = _RAND_56[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_57 = {1{`RANDOM}};
  mem_reg_valid = _RAND_57[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_58 = {1{`RANDOM}};
  mem_reg_rvc = _RAND_58[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_59 = {1{`RANDOM}};
  mem_reg_btb_resp_entry = _RAND_59[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_60 = {1{`RANDOM}};
  mem_reg_btb_resp_bht_history = _RAND_60[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_61 = {1{`RANDOM}};
  mem_reg_xcpt = _RAND_61[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_62 = {1{`RANDOM}};
  mem_reg_replay = _RAND_62[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_63 = {1{`RANDOM}};
  mem_reg_flush_pipe = _RAND_63[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_64 = {2{`RANDOM}};
  mem_reg_cause = _RAND_64[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_65 = {1{`RANDOM}};
  mem_reg_slow_bypass = _RAND_65[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_66 = {1{`RANDOM}};
  mem_reg_load = _RAND_66[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_67 = {1{`RANDOM}};
  mem_reg_store = _RAND_67[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_68 = {1{`RANDOM}};
  mem_reg_sfence = _RAND_68[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_69 = {2{`RANDOM}};
  mem_reg_pc = _RAND_69[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_70 = {1{`RANDOM}};
  mem_reg_inst = _RAND_70[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_71 = {1{`RANDOM}};
  mem_reg_raw_inst = _RAND_71[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_72 = {2{`RANDOM}};
  mem_reg_wdata = _RAND_72[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_73 = {2{`RANDOM}};
  mem_reg_rs2 = _RAND_73[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_74 = {1{`RANDOM}};
  mem_br_taken = _RAND_74[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_75 = {1{`RANDOM}};
  wb_reg_valid = _RAND_75[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_76 = {1{`RANDOM}};
  wb_reg_xcpt = _RAND_76[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_77 = {1{`RANDOM}};
  wb_reg_replay = _RAND_77[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_78 = {1{`RANDOM}};
  wb_reg_flush_pipe = _RAND_78[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_79 = {2{`RANDOM}};
  wb_reg_cause = _RAND_79[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_80 = {1{`RANDOM}};
  wb_reg_sfence = _RAND_80[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_81 = {2{`RANDOM}};
  wb_reg_pc = _RAND_81[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_82 = {1{`RANDOM}};
  wb_reg_inst = _RAND_82[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_83 = {1{`RANDOM}};
  wb_reg_raw_inst = _RAND_83[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_84 = {2{`RANDOM}};
  wb_reg_wdata = _RAND_84[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_85 = {1{`RANDOM}};
  id_reg_fence = _RAND_85[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_86 = {1{`RANDOM}};
  ex_reg_rs_bypass_0 = _RAND_86[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_87 = {1{`RANDOM}};
  ex_reg_rs_bypass_1 = _RAND_87[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_88 = {1{`RANDOM}};
  ex_reg_rs_lsb_0 = _RAND_88[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_89 = {1{`RANDOM}};
  ex_reg_rs_lsb_1 = _RAND_89[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_90 = {2{`RANDOM}};
  ex_reg_rs_msb_0 = _RAND_90[61:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_91 = {2{`RANDOM}};
  ex_reg_rs_msb_1 = _RAND_91[61:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_92 = {1{`RANDOM}};
  _T_1504 = _RAND_92[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_93 = {1{`RANDOM}};
  _T_1617 = _RAND_93[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_94 = {1{`RANDOM}};
  blocked = _RAND_94[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_95 = {1{`RANDOM}};
  _T_1376 = _RAND_95[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_96 = {2{`RANDOM}};
  _T_1786 = _RAND_96[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_97 = {2{`RANDOM}};
  coreMonitorBundle_rd0val = _RAND_97[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_98 = {2{`RANDOM}};
  _T_1791 = _RAND_98[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_99 = {2{`RANDOM}};
  coreMonitorBundle_rd1val = _RAND_99[63:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(_T_714__T_1453_en & _T_714__T_1453_mask) begin
      _T_714[_T_714__T_1453_addr] <= _T_714__T_1453_data; 
    end
    imem_might_request_reg <= _T_1704 | _T_1705;
    if (_T_1022) begin
      ex_ctrl_fp <= id_ctrl_fp;
    end
    if (_T_1022) begin
      ex_ctrl_branch <= id_ctrl_branch;
    end
    if (_T_1022) begin
      ex_ctrl_jal <= id_ctrl_jal;
    end
    if (_T_1022) begin
      ex_ctrl_jalr <= id_ctrl_jalr;
    end
    if (_T_1022) begin
      ex_ctrl_rxs2 <= id_ctrl_rxs2;
    end
    if (_T_1022) begin
      if (id_xcpt) begin
        if (_T_1036) begin
          ex_ctrl_sel_alu2 <= 2'h0;
        end else begin
          if (_T_1033) begin
            ex_ctrl_sel_alu2 <= 2'h1;
          end else begin
            ex_ctrl_sel_alu2 <= 2'h0;
          end
        end
      end else begin
        ex_ctrl_sel_alu2 <= id_ctrl_sel_alu2;
      end
    end
    if (_T_1022) begin
      if (id_xcpt) begin
        if (_T_1036) begin
          ex_ctrl_sel_alu1 <= 2'h2;
        end else begin
          if (_T_1033) begin
            ex_ctrl_sel_alu1 <= 2'h2;
          end else begin
            ex_ctrl_sel_alu1 <= 2'h1;
          end
        end
      end else begin
        ex_ctrl_sel_alu1 <= id_ctrl_sel_alu1;
      end
    end
    if (_T_1022) begin
      ex_ctrl_sel_imm <= id_ctrl_sel_imm;
    end
    if (_T_1022) begin
      if (id_xcpt) begin
        ex_ctrl_alu_dw <= 1'h1;
      end else begin
        ex_ctrl_alu_dw <= id_ctrl_alu_dw;
      end
    end
    if (_T_1022) begin
      if (id_xcpt) begin
        ex_ctrl_alu_fn <= 4'h0;
      end else begin
        ex_ctrl_alu_fn <= id_ctrl_alu_fn;
      end
    end
    if (_T_1022) begin
      ex_ctrl_mem <= id_ctrl_mem;
    end
    if (_T_1022) begin
      ex_ctrl_mem_cmd <= id_ctrl_mem_cmd;
    end
    if (_T_1022) begin
      if (id_sfence) begin
        ex_ctrl_mem_type <= {{1'd0}, _T_1040};
      end else begin
        ex_ctrl_mem_type <= id_ctrl_mem_type;
      end
    end
    if (_T_1022) begin
      ex_ctrl_wfd <= id_ctrl_wfd;
    end
    if (_T_1022) begin
      ex_ctrl_div <= id_ctrl_div;
    end
    if (_T_1022) begin
      ex_ctrl_wxd <= id_ctrl_wxd;
    end
    if (_T_1022) begin
      if (id_csr_ren) begin
        ex_ctrl_csr <= 3'h2;
      end else begin
        ex_ctrl_csr <= id_ctrl_csr;
      end
    end
    if (_T_1022) begin
      ex_ctrl_fence_i <= id_ctrl_fence_i;
    end
    if (!(_T_1278)) begin
      if (ex_pc_valid) begin
        mem_ctrl_fp <= ex_ctrl_fp;
      end
    end
    if (!(_T_1278)) begin
      if (ex_pc_valid) begin
        mem_ctrl_rocc <= 1'h0;
      end
    end
    if (!(_T_1278)) begin
      if (ex_pc_valid) begin
        mem_ctrl_branch <= ex_ctrl_branch;
      end
    end
    if (!(_T_1278)) begin
      if (ex_pc_valid) begin
        mem_ctrl_jal <= ex_ctrl_jal;
      end
    end
    if (!(_T_1278)) begin
      if (ex_pc_valid) begin
        mem_ctrl_jalr <= ex_ctrl_jalr;
      end
    end
    if (!(_T_1278)) begin
      if (ex_pc_valid) begin
        mem_ctrl_mem <= ex_ctrl_mem;
      end
    end
    if (!(_T_1278)) begin
      if (ex_pc_valid) begin
        mem_ctrl_mem_type <= ex_ctrl_mem_type;
      end
    end
    if (!(_T_1278)) begin
      if (ex_pc_valid) begin
        mem_ctrl_wfd <= ex_ctrl_wfd;
      end
    end
    if (!(_T_1278)) begin
      if (ex_pc_valid) begin
        mem_ctrl_mul <= 1'h0;
      end
    end
    if (!(_T_1278)) begin
      if (ex_pc_valid) begin
        mem_ctrl_div <= ex_ctrl_div;
      end
    end
    if (!(_T_1278)) begin
      if (ex_pc_valid) begin
        mem_ctrl_wxd <= ex_ctrl_wxd;
      end
    end
    if (!(_T_1278)) begin
      if (ex_pc_valid) begin
        mem_ctrl_csr <= ex_ctrl_csr;
      end
    end
    if (!(_T_1278)) begin
      if (ex_pc_valid) begin
        if (_T_1346) begin
          mem_ctrl_fence_i <= 1'h1;
        end else begin
          mem_ctrl_fence_i <= ex_ctrl_fence_i;
        end
      end
    end
    if (mem_pc_valid) begin
      wb_ctrl_rocc <= mem_ctrl_rocc;
    end
    if (mem_pc_valid) begin
      wb_ctrl_mem <= mem_ctrl_mem;
    end
    if (mem_pc_valid) begin
      wb_ctrl_mem_type <= mem_ctrl_mem_type;
    end
    if (mem_pc_valid) begin
      wb_ctrl_wfd <= mem_ctrl_wfd;
    end
    if (mem_pc_valid) begin
      wb_ctrl_div <= mem_ctrl_div;
    end
    if (mem_pc_valid) begin
      wb_ctrl_wxd <= mem_ctrl_wxd;
    end
    if (mem_pc_valid) begin
      wb_ctrl_csr <= mem_ctrl_csr;
    end
    if (mem_pc_valid) begin
      wb_ctrl_fence_i <= mem_ctrl_fence_i;
    end
    ex_reg_xcpt_interrupt <= _T_1024 & csr_io_interrupt;
    ex_reg_valid <= ctrl_killd == 1'h0;
    if (_T_1022) begin
      if (id_xcpt) begin
        if (_T_1033) begin
          ex_reg_rvc <= 1'h1;
        end else begin
          ex_reg_rvc <= ibuf_io_inst_0_bits_rvc;
        end
      end else begin
        ex_reg_rvc <= ibuf_io_inst_0_bits_rvc;
      end
    end
    if (_T_1062) begin
      ex_reg_btb_resp_entry <= ibuf_io_btb_resp_entry;
    end
    if (_T_1062) begin
      ex_reg_btb_resp_bht_history <= ibuf_io_btb_resp_bht_history;
    end
    ex_reg_xcpt <= _T_1022 & id_xcpt;
    if (_T_1022) begin
      ex_reg_flush_pipe <= _T_1037;
    end
    if (_T_1022) begin
      ex_reg_load_use <= id_load_use;
    end
    if (_T_1062) begin
      if (csr_io_interrupt) begin
        ex_reg_cause <= csr_io_interrupt_cause;
      end else begin
        ex_reg_cause <= {{60'd0}, _T_877};
      end
    end
    ex_reg_replay <= _T_1024 & ibuf_io_inst_0_bits_replay;
    if (_T_1062) begin
      ex_reg_pc <= ibuf_io_pc;
    end
    if (_T_1062) begin
      ex_reg_inst <= ibuf_io_inst_0_bits_inst_bits;
    end
    if (_T_1062) begin
      ex_reg_raw_inst <= ibuf_io_inst_0_bits_raw;
    end
    mem_reg_xcpt_interrupt <= _T_1023 & ex_reg_xcpt_interrupt;
    mem_reg_valid <= ctrl_killx == 1'h0;
    if (!(_T_1278)) begin
      if (ex_pc_valid) begin
        mem_reg_rvc <= ex_reg_rvc;
      end
    end
    if (!(_T_1278)) begin
      if (ex_pc_valid) begin
        mem_reg_btb_resp_entry <= ex_reg_btb_resp_entry;
      end
    end
    if (!(_T_1278)) begin
      if (ex_pc_valid) begin
        mem_reg_btb_resp_bht_history <= ex_reg_btb_resp_bht_history;
      end
    end
    mem_reg_xcpt <= _T_1271 & ex_xcpt;
    mem_reg_replay <= _T_1023 & replay_ex;
    if (!(_T_1278)) begin
      if (ex_pc_valid) begin
        if (_T_1346) begin
          mem_reg_flush_pipe <= 1'h1;
        end else begin
          mem_reg_flush_pipe <= ex_reg_flush_pipe;
        end
      end
    end
    if (!(_T_1278)) begin
      if (ex_pc_valid) begin
        mem_reg_cause <= ex_reg_cause;
      end
    end
    if (!(_T_1278)) begin
      if (ex_pc_valid) begin
        mem_reg_slow_bypass <= ex_slow_bypass;
      end
    end
    if (!(_T_1278)) begin
      if (ex_pc_valid) begin
        mem_reg_load <= _T_1302;
      end
    end
    if (!(_T_1278)) begin
      if (ex_pc_valid) begin
        mem_reg_store <= _T_1326;
      end
    end
    if (_T_1278) begin
      mem_reg_sfence <= 1'h0;
    end else begin
      if (ex_pc_valid) begin
        mem_reg_sfence <= ex_sfence;
      end
    end
    if (!(_T_1278)) begin
      if (ex_pc_valid) begin
        mem_reg_pc <= ex_reg_pc;
      end
    end
    if (!(_T_1278)) begin
      if (ex_pc_valid) begin
        mem_reg_inst <= ex_reg_inst;
      end
    end
    if (!(_T_1278)) begin
      if (ex_pc_valid) begin
        mem_reg_raw_inst <= ex_reg_raw_inst;
      end
    end
    if (!(_T_1278)) begin
      if (ex_pc_valid) begin
        mem_reg_wdata <= alu_io_out;
      end
    end
    if (!(_T_1278)) begin
      if (ex_pc_valid) begin
        if (_T_1329) begin
          if (_T_1331) begin
            mem_reg_rs2 <= _T_1335;
          end else begin
            if (_T_1336) begin
              mem_reg_rs2 <= _T_1339;
            end else begin
              if (_T_1340) begin
                mem_reg_rs2 <= _T_1342;
              end else begin
                if (ex_reg_rs_bypass_1) begin
                  if (_T_942) begin
                    mem_reg_rs2 <= io_dmem_resp_bits_data_word_bypass;
                  end else begin
                    if (_T_940) begin
                      mem_reg_rs2 <= wb_reg_wdata;
                    end else begin
                      if (_T_938) begin
                        mem_reg_rs2 <= mem_reg_wdata;
                      end else begin
                        mem_reg_rs2 <= 64'h0;
                      end
                    end
                  end
                end else begin
                  mem_reg_rs2 <= _T_944;
                end
              end
            end
          end
        end
      end
    end
    if (!(_T_1278)) begin
      if (ex_pc_valid) begin
        mem_br_taken <= alu_io_cmp_out;
      end
    end
    wb_reg_valid <= ctrl_killm == 1'h0;
    wb_reg_xcpt <= mem_xcpt & _T_1380;
    wb_reg_replay <= replay_mem & _T_1380;
    wb_reg_flush_pipe <= _T_1379 & mem_reg_flush_pipe;
    if (mem_pc_valid) begin
      if (_T_1351) begin
        wb_reg_cause <= mem_reg_cause;
      end else begin
        wb_reg_cause <= {{60'd0}, _T_1355};
      end
    end
    if (mem_pc_valid) begin
      wb_reg_sfence <= mem_reg_sfence;
    end
    if (mem_pc_valid) begin
      wb_reg_pc <= mem_reg_pc;
    end
    if (mem_pc_valid) begin
      wb_reg_inst <= mem_reg_inst;
    end
    if (mem_pc_valid) begin
      wb_reg_raw_inst <= mem_reg_raw_inst;
    end
    if (mem_pc_valid) begin
      if (_T_1388) begin
        wb_reg_wdata <= io_fpu_toint_data;
      end else begin
        wb_reg_wdata <= mem_int_wdata;
      end
    end
    if (reset) begin
      id_reg_fence <= 1'h0;
    end else begin
      if (_T_1022) begin
        if (id_fence_next) begin
          id_reg_fence <= 1'h1;
        end else begin
          if (_T_850) begin
            id_reg_fence <= 1'h0;
          end
        end
      end else begin
        if (_T_850) begin
          id_reg_fence <= 1'h0;
        end
      end
    end
    if (_T_1022) begin
      if (id_illegal_insn) begin
        ex_reg_rs_bypass_0 <= 1'h0;
      end else begin
        ex_reg_rs_bypass_0 <= do_bypass;
      end
    end
    if (_T_1022) begin
      ex_reg_rs_bypass_1 <= do_bypass_1;
    end
    if (_T_1022) begin
      if (id_illegal_insn) begin
        ex_reg_rs_lsb_0 <= _T_1058;
      end else begin
        if (_T_1046) begin
          ex_reg_rs_lsb_0 <= _T_1047;
        end else begin
          if (_T_893) begin
            ex_reg_rs_lsb_0 <= 2'h0;
          end else begin
            if (_T_896) begin
              ex_reg_rs_lsb_0 <= 2'h1;
            end else begin
              if (_T_898) begin
                ex_reg_rs_lsb_0 <= 2'h2;
              end else begin
                ex_reg_rs_lsb_0 <= 2'h3;
              end
            end
          end
        end
      end
    end
    if (_T_1022) begin
      if (_T_1054) begin
        ex_reg_rs_lsb_1 <= _T_1055;
      end else begin
        if (_T_901) begin
          ex_reg_rs_lsb_1 <= 2'h0;
        end else begin
          if (_T_904) begin
            ex_reg_rs_lsb_1 <= 2'h1;
          end else begin
            if (_T_906) begin
              ex_reg_rs_lsb_1 <= 2'h2;
            end else begin
              ex_reg_rs_lsb_1 <= 2'h3;
            end
          end
        end
      end
    end
    if (_T_1022) begin
      if (id_illegal_insn) begin
        ex_reg_rs_msb_0 <= {{32'd0}, _T_1059};
      end else begin
        if (_T_1046) begin
          ex_reg_rs_msb_0 <= _T_1048;
        end
      end
    end
    if (_T_1022) begin
      if (_T_1054) begin
        ex_reg_rs_msb_1 <= _T_1056;
      end
    end
    if (reset) begin
      _T_1504 <= 32'h0;
    end else begin
      if (_T_1538) begin
        _T_1504 <= _T_1537;
      end else begin
        if (ll_wen) begin
          _T_1504 <= _T_1510;
        end
      end
    end
    if (reset) begin
      _T_1617 <= 32'h0;
    end else begin
      if (_T_1635) begin
        _T_1617 <= _T_1634;
      end else begin
        if (_T_1630) begin
          _T_1617 <= _T_1629;
        end else begin
          if (_T_1620) begin
            _T_1617 <= _T_1623;
          end
        end
      end
    end
    blocked <= _T_1654 & _T_1656;
    _T_1376 <= div_io_req_ready & div_io_req_valid;
    if (ex_reg_rs_bypass_0) begin
      if (_T_934) begin
        _T_1786 <= io_dmem_resp_bits_data_word_bypass;
      end else begin
        if (_T_932) begin
          _T_1786 <= wb_reg_wdata;
        end else begin
          if (_T_930) begin
            _T_1786 <= mem_reg_wdata;
          end else begin
            _T_1786 <= 64'h0;
          end
        end
      end
    end else begin
      _T_1786 <= _T_936;
    end
    coreMonitorBundle_rd0val <= _T_1786;
    if (ex_reg_rs_bypass_1) begin
      if (_T_942) begin
        _T_1791 <= io_dmem_resp_bits_data_word_bypass;
      end else begin
        if (_T_940) begin
          _T_1791 <= wb_reg_wdata;
        end else begin
          if (_T_938) begin
            _T_1791 <= mem_reg_wdata;
          end else begin
            _T_1791 <= 64'h0;
          end
        end
      end
    end else begin
      _T_1791 <= _T_944;
    end
    coreMonitorBundle_rd1val <= _T_1791;
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1795) begin
          `ifdef PRINTF_CORE_INFO
          $fwrite(32'h80000002,"C%d: %d [%d] pc=[%x] W[r%d=%x][%d] R[r%d=%x] R[r%d=%x] inst=[%x] DASM(%x)\n",io_hartid,coreMonitorBundle_time,coreMonitorBundle_valid,coreMonitorBundle_pc,coreMonitorBundle_wrdst,rf_wdata,rf_wen,_T_1769,coreMonitorBundle_rd0val,_T_1770,coreMonitorBundle_rd1val,coreMonitorBundle_inst,coreMonitorBundle_inst); 
          `endif
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
