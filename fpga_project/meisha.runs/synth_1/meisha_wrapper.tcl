# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {HDL-1065} -limit 10000
set_msg_config  -ruleid {1}  -id {Synth 8-3352}  -suppress 
create_project -in_memory -part xc7vx485tffg1761-2

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.cache/wt [current_project]
set_property parent.project_path C:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part xilinx.com:vc707:part0:1.3 [current_project]
set_property ip_output_repo c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib C:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/hdl/meisha_wrapper.v
add_files C:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/meisha.bd
set_property used_in_implementation false [get_files -all c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_clk_wiz_0_0/meisha_clk_wiz_0_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_clk_wiz_0_0/meisha_clk_wiz_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_clk_wiz_0_0/meisha_clk_wiz_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_util_ds_buf_0_0/meisha_util_ds_buf_0_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/constraints/meisha_mig_7series_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/constraints/meisha_mig_7series_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_proc_sys_reset_0_0/meisha_proc_sys_reset_0_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_proc_sys_reset_0_0/meisha_proc_sys_reset_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_proc_sys_reset_0_0/meisha_proc_sys_reset_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_proc_sys_reset_0_1/meisha_proc_sys_reset_0_1_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_proc_sys_reset_0_1/meisha_proc_sys_reset_0_1.xdc]
set_property used_in_implementation false [get_files -all c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_proc_sys_reset_0_1/meisha_proc_sys_reset_0_1_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_clk_wiz_1_0/meisha_clk_wiz_1_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_clk_wiz_1_0/meisha_clk_wiz_1_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_clk_wiz_1_0/meisha_clk_wiz_1_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_auto_cc_0/meisha_auto_cc_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_auto_cc_0/meisha_auto_cc_0_ooc.xdc]
set_property used_in_implementation false [get_files -all C:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/meisha_ooc.xdc]
set_property is_locked true [get_files C:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/meisha.bd]

foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/constrs_1/imports/meisha_ok/meisha.xdc
set_property used_in_implementation false [get_files C:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/constrs_1/imports/meisha_ok/meisha.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]

synth_design -top meisha_wrapper -part xc7vx485tffg1761-2


write_checkpoint -force -noxdef meisha_wrapper.dcp

catch { report_utilization -file meisha_wrapper_utilization_synth.rpt -pb meisha_wrapper_utilization_synth.pb }
