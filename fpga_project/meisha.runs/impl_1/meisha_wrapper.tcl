proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {HDL-1065} -limit 10000
set_msg_config  -ruleid {1}  -id {Synth 8-3352}  -suppress 

start_step init_design
set ACTIVE_STEP init_design
set rc [catch {
  create_msg_db init_design.pb
  create_project -in_memory -part xc7vx485tffg1761-2
  set_property board_part xilinx.com:vc707:part0:1.3 [current_project]
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir C:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.cache/wt [current_project]
  set_property parent.project_path C:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.xpr [current_project]
  set_property ip_output_repo C:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.cache/ip [current_project]
  set_property ip_cache_permissions {read write} [current_project]
  set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
  add_files -quiet C:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.runs/synth_1/meisha_wrapper.dcp
  add_files -quiet c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_clk_wiz_0_0/meisha_clk_wiz_0_0.dcp
  set_property netlist_only true [get_files c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_clk_wiz_0_0/meisha_clk_wiz_0_0.dcp]
  add_files -quiet c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_util_ds_buf_0_0/meisha_util_ds_buf_0_0.dcp
  set_property netlist_only true [get_files c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_util_ds_buf_0_0/meisha_util_ds_buf_0_0.dcp]
  add_files -quiet C:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0.dcp
  set_property netlist_only true [get_files C:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0.dcp]
  add_files -quiet c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_proc_sys_reset_0_0/meisha_proc_sys_reset_0_0.dcp
  set_property netlist_only true [get_files c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_proc_sys_reset_0_0/meisha_proc_sys_reset_0_0.dcp]
  add_files -quiet c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_util_vector_logic_0_1/meisha_util_vector_logic_0_1.dcp
  set_property netlist_only true [get_files c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_util_vector_logic_0_1/meisha_util_vector_logic_0_1.dcp]
  add_files -quiet c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_proc_sys_reset_0_1/meisha_proc_sys_reset_0_1.dcp
  set_property netlist_only true [get_files c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_proc_sys_reset_0_1/meisha_proc_sys_reset_0_1.dcp]
  add_files -quiet c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_util_vector_logic_1_0/meisha_util_vector_logic_1_0.dcp
  set_property netlist_only true [get_files c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_util_vector_logic_1_0/meisha_util_vector_logic_1_0.dcp]
  add_files -quiet c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_clk_wiz_1_0/meisha_clk_wiz_1_0.dcp
  set_property netlist_only true [get_files c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_clk_wiz_1_0/meisha_clk_wiz_1_0.dcp]
  add_files -quiet c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_util_vector_logic_0_0/meisha_util_vector_logic_0_0.dcp
  set_property netlist_only true [get_files c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_util_vector_logic_0_0/meisha_util_vector_logic_0_0.dcp]
  add_files -quiet c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_DevKitWrapper_0_0/meisha_DevKitWrapper_0_0.dcp
  set_property netlist_only true [get_files c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_DevKitWrapper_0_0/meisha_DevKitWrapper_0_0.dcp]
  add_files -quiet c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_xlconstant_0_0/meisha_xlconstant_0_0.dcp
  set_property netlist_only true [get_files c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_xlconstant_0_0/meisha_xlconstant_0_0.dcp]
  add_files -quiet c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_util_vector_logic_3_0/meisha_util_vector_logic_3_0.dcp
  set_property netlist_only true [get_files c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_util_vector_logic_3_0/meisha_util_vector_logic_3_0.dcp]
  add_files -quiet c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_util_vector_logic_4_0/meisha_util_vector_logic_4_0.dcp
  set_property netlist_only true [get_files c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_util_vector_logic_4_0/meisha_util_vector_logic_4_0.dcp]
  add_files -quiet c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_chiplink_master_0_1/meisha_chiplink_master_0_1.dcp
  set_property netlist_only true [get_files c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_chiplink_master_0_1/meisha_chiplink_master_0_1.dcp]
  add_files -quiet c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_auto_cc_0/meisha_auto_cc_0.dcp
  set_property netlist_only true [get_files c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_auto_cc_0/meisha_auto_cc_0.dcp]
  read_xdc -prop_thru_buffers -ref meisha_clk_wiz_0_0 -cells inst c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_clk_wiz_0_0/meisha_clk_wiz_0_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_clk_wiz_0_0/meisha_clk_wiz_0_0_board.xdc]
  read_xdc -ref meisha_clk_wiz_0_0 -cells inst c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_clk_wiz_0_0/meisha_clk_wiz_0_0.xdc
  set_property processing_order EARLY [get_files c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_clk_wiz_0_0/meisha_clk_wiz_0_0.xdc]
  read_xdc -prop_thru_buffers -ref meisha_util_ds_buf_0_0 -cells U0 c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_util_ds_buf_0_0/meisha_util_ds_buf_0_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_util_ds_buf_0_0/meisha_util_ds_buf_0_0_board.xdc]
  read_xdc -ref meisha_mig_7series_0_0 c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/constraints/meisha_mig_7series_0_0.xdc
  set_property processing_order EARLY [get_files c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_mig_7series_0_0/meisha_mig_7series_0_0/user_design/constraints/meisha_mig_7series_0_0.xdc]
  read_xdc -prop_thru_buffers -ref meisha_proc_sys_reset_0_0 -cells U0 c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_proc_sys_reset_0_0/meisha_proc_sys_reset_0_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_proc_sys_reset_0_0/meisha_proc_sys_reset_0_0_board.xdc]
  read_xdc -ref meisha_proc_sys_reset_0_0 -cells U0 c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_proc_sys_reset_0_0/meisha_proc_sys_reset_0_0.xdc
  set_property processing_order EARLY [get_files c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_proc_sys_reset_0_0/meisha_proc_sys_reset_0_0.xdc]
  read_xdc -prop_thru_buffers -ref meisha_proc_sys_reset_0_1 -cells U0 c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_proc_sys_reset_0_1/meisha_proc_sys_reset_0_1_board.xdc
  set_property processing_order EARLY [get_files c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_proc_sys_reset_0_1/meisha_proc_sys_reset_0_1_board.xdc]
  read_xdc -ref meisha_proc_sys_reset_0_1 -cells U0 c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_proc_sys_reset_0_1/meisha_proc_sys_reset_0_1.xdc
  set_property processing_order EARLY [get_files c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_proc_sys_reset_0_1/meisha_proc_sys_reset_0_1.xdc]
  read_xdc -prop_thru_buffers -ref meisha_clk_wiz_1_0 -cells inst c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_clk_wiz_1_0/meisha_clk_wiz_1_0_board.xdc
  set_property processing_order EARLY [get_files c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_clk_wiz_1_0/meisha_clk_wiz_1_0_board.xdc]
  read_xdc -ref meisha_clk_wiz_1_0 -cells inst c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_clk_wiz_1_0/meisha_clk_wiz_1_0.xdc
  set_property processing_order EARLY [get_files c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_clk_wiz_1_0/meisha_clk_wiz_1_0.xdc]
  read_xdc C:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/constrs_1/imports/meisha_ok/meisha.xdc
  read_xdc -ref meisha_auto_cc_0 -cells inst c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_auto_cc_0/meisha_auto_cc_0_clocks.xdc
  set_property processing_order LATE [get_files c:/Users/20676/Desktop/meisha_zhenli/meisha_zhenli/meisha.srcs/sources_1/bd/meisha/ip/meisha_auto_cc_0/meisha_auto_cc_0_clocks.xdc]
  link_design -top meisha_wrapper -part xc7vx485tffg1761-2
  write_hwdef -file meisha_wrapper.hwdef
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
  unset ACTIVE_STEP 
}

start_step opt_design
set ACTIVE_STEP opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design 
  write_checkpoint -force meisha_wrapper_opt.dcp
  catch { report_drc -file meisha_wrapper_drc_opted.rpt }
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
  unset ACTIVE_STEP 
}

start_step place_design
set ACTIVE_STEP place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design 
  write_checkpoint -force meisha_wrapper_placed.dcp
  catch { report_io -file meisha_wrapper_io_placed.rpt }
  catch { report_utilization -file meisha_wrapper_utilization_placed.rpt -pb meisha_wrapper_utilization_placed.pb }
  catch { report_control_sets -verbose -file meisha_wrapper_control_sets_placed.rpt }
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
  unset ACTIVE_STEP 
}

start_step route_design
set ACTIVE_STEP route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force meisha_wrapper_routed.dcp
  catch { report_drc -file meisha_wrapper_drc_routed.rpt -pb meisha_wrapper_drc_routed.pb -rpx meisha_wrapper_drc_routed.rpx }
  catch { report_methodology -file meisha_wrapper_methodology_drc_routed.rpt -rpx meisha_wrapper_methodology_drc_routed.rpx }
  catch { report_timing_summary -warn_on_violation -max_paths 10 -file meisha_wrapper_timing_summary_routed.rpt -rpx meisha_wrapper_timing_summary_routed.rpx }
  catch { report_power -file meisha_wrapper_power_routed.rpt -pb meisha_wrapper_power_summary_routed.pb -rpx meisha_wrapper_power_routed.rpx }
  catch { report_route_status -file meisha_wrapper_route_status.rpt -pb meisha_wrapper_route_status.pb }
  catch { report_clock_utilization -file meisha_wrapper_clock_utilization_routed.rpt }
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  write_checkpoint -force meisha_wrapper_routed_error.dcp
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
  unset ACTIVE_STEP 
}

