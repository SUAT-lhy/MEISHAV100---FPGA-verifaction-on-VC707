vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm
vlib riviera/util_ds_buf_v2_01_a
vlib riviera/lib_cdc_v1_0_2
vlib riviera/proc_sys_reset_v5_0_10
vlib riviera/util_vector_logic_v2_0
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/fifo_generator_v13_1_3
vlib riviera/axi_clock_converter_v2_1_10

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm
vmap util_ds_buf_v2_01_a riviera/util_ds_buf_v2_01_a
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_10 riviera/proc_sys_reset_v5_0_10
vmap util_vector_logic_v2_0 riviera/util_vector_logic_v2_0
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap fifo_generator_v13_1_3 riviera/fifo_generator_v13_1_3
vmap axi_clock_converter_v2_1_10 riviera/axi_clock_converter_v2_1_10

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/100a" "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/7e3a/hdl" "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/100a" "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/7e3a/hdl" \
"/eda/vivado2016/Vivado/2016.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/eda/vivado2016/Vivado/2016.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"/eda/vivado2016/Vivado/2016.4/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/100a" "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/7e3a/hdl" "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/100a" "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/7e3a/hdl" \
"../../../bd/meisha/ip/meisha_clk_wiz_0_0/meisha_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/meisha/ip/meisha_clk_wiz_0_0/meisha_clk_wiz_0_0.v" \

vcom -work util_ds_buf_v2_01_a -93 \
"../../../../meisha.srcs/sources_1/bd/meisha/ipshared/1e84/hdl/vhdl/util_ds_buf.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/meisha/ip/meisha_util_ds_buf_0_0/sim/meisha_util_ds_buf_0_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/100a" "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/7e3a/hdl" "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/100a" "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/7e3a/hdl" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_axi_ctrl_addr_decode.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_axi_ctrl_read.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_axi_ctrl_reg_bank.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_axi_ctrl_reg.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_axi_ctrl_top.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_axi_ctrl_write.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_axi_mc.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_axi_mc_ar_channel.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_axi_mc_aw_channel.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_axi_mc_b_channel.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_axi_mc_cmd_arbiter.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_axi_mc_cmd_fsm.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_axi_mc_wr_cmd_fsm.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_axi_mc_cmd_translator.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_axi_mc_incr_cmd.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_axi_mc_r_channel.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_axi_mc_simple_fifo.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_axi_mc_fifo.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_axi_mc_w_channel.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_axi_mc_wrap_cmd.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_ddr_a_upsizer.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_ddr_axi_register_slice.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_ddr_axi_upsizer.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_ddr_axic_register_slice.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_ddr_carry_and.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_ddr_carry_latch_and.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_ddr_carry_latch_or.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_ddr_carry_or.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_ddr_command_fifo.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_ddr_comparator.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_ddr_comparator_sel.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_ddr_comparator_sel_static.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_ddr_r_upsizer.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/axi/mig_7series_v4_0_ddr_w_upsizer.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/clocking/mig_7series_v4_0_clk_ibuf.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/clocking/mig_7series_v4_0_infrastructure.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/clocking/mig_7series_v4_0_iodelay_ctrl.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/clocking/mig_7series_v4_0_tempmon.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_0_arb_mux.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_0_arb_row_col.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_0_arb_select.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_0_bank_cntrl.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_0_bank_common.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_0_bank_compare.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_0_bank_mach.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_0_bank_queue.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_0_bank_state.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_0_col_mach.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_0_mc.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_0_rank_cntrl.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_0_rank_common.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_0_rank_mach.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/controller/mig_7series_v4_0_round_robin_arb.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/ecc/mig_7series_v4_0_ecc_buf.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/ecc/mig_7series_v4_0_ecc_dec_fix.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/ecc/mig_7series_v4_0_ecc_gen.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/ecc/mig_7series_v4_0_ecc_merge_enc.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/ecc/mig_7series_v4_0_fi_xor.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/ip_top/mig_7series_v4_0_mem_intfc.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/ip_top/mig_7series_v4_0_memc_ui_top_axi.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_byte_group_io.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_byte_lane.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_tempmon.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_calib_top.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_skip_calib_tap.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_if_post_fifo.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_mc_phy.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_mc_phy_wrapper.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_of_pre_fifo.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_4lanes.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_ck_addr_cmd_delay.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_init.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_dqs_found_cal.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_dqs_found_cal_hr.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_oclkdelay_cal.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_prbs_rdlvl.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_rdlvl.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_top.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_wrcal.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_wrlvl.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_wrlvl_off_delay.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_prbs_gen.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_ocd_lim.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_poc_top.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_ocd_mux.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_ocd_data.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_ocd_samp.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_ocd_edge.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_ocd_cntlr.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_ddr_phy_ocd_po_cntlr.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_poc_pd.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_poc_tap_base.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_poc_meta.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_poc_edge_store.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/phy/mig_7series_v4_0_poc_cc.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/ui/mig_7series_v4_0_ui_cmd.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/ui/mig_7series_v4_0_ui_rd_data.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/ui/mig_7series_v4_0_ui_top.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/ui/mig_7series_v4_0_ui_wr_data.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/meisha_mig_7series_0_0_mig_sim.v" \
"../../../bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/rtl/meisha_mig_7series_0_0.v" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../meisha.srcs/sources_1/bd/meisha/ipshared/52cb/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_10 -93 \
"../../../../meisha.srcs/sources_1/bd/meisha/ipshared/04b4/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/meisha/ip/meisha_proc_sys_reset_0_0/sim/meisha_proc_sys_reset_0_0.vhd" \

vcom -work util_vector_logic_v2_0 -93 \
"../../../bd/meisha/ipshared/1d19/hdl/util_vector_logic.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/meisha/ip/meisha_util_vector_logic_0_1/sim/meisha_util_vector_logic_0_1.vhd" \
"../../../bd/meisha/ip/meisha_proc_sys_reset_0_1/sim/meisha_proc_sys_reset_0_1.vhd" \
"../../../bd/meisha/ip/meisha_util_vector_logic_1_0/sim/meisha_util_vector_logic_1_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/100a" "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/7e3a/hdl" "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/100a" "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/7e3a/hdl" \
"../../../bd/meisha/ip/meisha_clk_wiz_1_0/meisha_clk_wiz_1_0_clk_wiz.v" \
"../../../bd/meisha/ip/meisha_clk_wiz_1_0/meisha_clk_wiz_1_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/meisha/ip/meisha_util_vector_logic_0_0/sim/meisha_util_vector_logic_0_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/100a" "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/7e3a/hdl" "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/100a" "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/7e3a/hdl" \
"../../../bd/meisha/ip/meisha_DevKitWrapper_0_0/sim/meisha_DevKitWrapper_0_0.v" \
"../../../bd/meisha/ipshared/e147/xlconstant.v" \
"../../../bd/meisha/ip/meisha_xlconstant_0_0/sim/meisha_xlconstant_0_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/meisha/ip/meisha_util_vector_logic_3_0/sim/meisha_util_vector_logic_3_0.vhd" \
"../../../bd/meisha/ip/meisha_util_vector_logic_4_0/sim/meisha_util_vector_logic_4_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/100a" "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/7e3a/hdl" "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/100a" "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/7e3a/hdl" \
"../../../bd/meisha/hdl/meisha.v" \
"../../../bd/meisha/ip/meisha_chiplink_master_0_1/sim/meisha_chiplink_master_0_1.v" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/100a" "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/7e3a/hdl" "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/100a" "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/7e3a/hdl" \
"../../../../meisha.srcs/sources_1/bd/meisha/ipshared/7e3a/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work fifo_generator_v13_1_3  -v2k5 "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/100a" "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/7e3a/hdl" "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/100a" "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/7e3a/hdl" \
"../../../../meisha.srcs/sources_1/bd/meisha/ipshared/564d/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_1_3 -93 \
"../../../../meisha.srcs/sources_1/bd/meisha/ipshared/564d/hdl/fifo_generator_v13_1_rfs.vhd" \

vlog -work fifo_generator_v13_1_3  -v2k5 "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/100a" "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/7e3a/hdl" "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/100a" "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/7e3a/hdl" \
"../../../../meisha.srcs/sources_1/bd/meisha/ipshared/564d/hdl/fifo_generator_v13_1_rfs.v" \

vlog -work axi_clock_converter_v2_1_10  -v2k5 "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/100a" "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/7e3a/hdl" "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/100a" "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/7e3a/hdl" \
"../../../../meisha.srcs/sources_1/bd/meisha/ipshared/8479/hdl/axi_clock_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/100a" "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/7e3a/hdl" "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/100a" "+incdir+../../../../meisha.srcs/sources_1/bd/meisha/ipshared/7e3a/hdl" \
"../../../bd/meisha/ip/meisha_auto_cc_0/sim/meisha_auto_cc_0.v" \

vlog -work xil_defaultlib "glbl.v"

