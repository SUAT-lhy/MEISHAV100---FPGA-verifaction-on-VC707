
Q
Command: %s
53*	vivadotcl2 
route_design2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
	xc7vx485t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
	xc7vx485t2default:defaultZ17-349h px� 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
route_design2default:defaultZ4-22h px� 
P
Running DRC with %s threads
24*drc2
82default:defaultZ23-27h px� 
�	
Rule violation (%s) %s - %s
20*drc2
PLCK-122default:default2'
Clock Placer Checks2default:default2�
�Poor placement for routing between an IO pin and BUFG. 
Resolution: Poor placement of an IO pin and a BUFG has resulted in the router using a non-dedicated path between the two.  There are several things that could trigger this DRC, each of which can cause unpredictable clock insertion delays that result in poor timing.  This DRC could be caused by any of the following: (a) a clock port was placed on a pin that is not a CCIO-pin (b)the BUFG has not been placed in the same half of the device or SLR as the CCIO-pin (c) a single ended clock has been placed on the N-Side of a differential pair CCIO-pin.
 This is normally an ERROR but the CLOCK_DEDICATED_ROUTE constraint is set to FALSE allowing your design to continue. The use of this override is highly discouraged as it may lead to very poor timing results. It is recommended that this error condition be corrected in the design.

	jtag_jtag_TCK_IBUF_inst (IBUF.O) is locked to BA21
	jtag_jtag_TCK_IBUF_BUFG_inst (BUFG.I) is provisionally placed by clockplacer on BUFGCTRL_X0Y4
2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
PLCK-202default:default2'
Clock Placer Checks2default:default2�
�Sub-optimal placement for a clock-capable IO pin and PLL pair. 
Resolution: A dedicated routing path between the two can be used if: (a) The clock-capable IO (CCIO) is placed on a CCIO capable site (b) The PLL is placed in the same clock region as the CCIO pin. Both the above conditions must be met at the same time, else it may lead to longer and less predictable clock insertion delays.
 This is normally an ERROR but the CLOCK_DEDICATED_ROUTE constraint is set to FALSE allowing your design to continue. The use of this override is highly discouraged as it may lead to very poor timing results. It is recommended that this error condition be corrected in the design.

	meisha_i/util_ds_buf_0/U0/USE_IBUFDS.GEN_IBUFDS[0].IBUFDS_I (IBUFDS.O) is locked to E19
	meisha_i/clk_wiz_1/inst/plle2_adv_inst (PLLE2_ADV.CLKIN1) is provisionally placed by clockplacer on PLLE2_ADV_X1Y0
2default:defaultZ23-20h px� 
b
DRC finished with %s
79*	vivadotcl2(
0 Errors, 2 Warnings2default:defaultZ4-198h px� 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px� 
V

Starting %s Task
103*constraints2
Routing2default:defaultZ18-103h px� 
y
BMultithreading enabled for route_design using a maximum of %s CPUs97*route2
82default:defaultZ35-254h px� 
p

Phase %s%s
101*constraints2
1 2default:default2#
Build RT Design2default:defaultZ18-101h px� 
B
-Phase 1 Build RT Design | Checksum: c6cbddb4
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:24 ; elapsed = 00:00:24 . Memory (MB): peak = 4490.121 ; gain = 0.000 ; free physical = 1860689 ; free virtual = 20111302default:defaulth px� 
v

Phase %s%s
101*constraints2
2 2default:default2)
Router Initialization2default:defaultZ18-101h px� 
o

Phase %s%s
101*constraints2
2.1 2default:default2 
Create Timer2default:defaultZ18-101h px� 
A
,Phase 2.1 Create Timer | Checksum: c6cbddb4
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:27 ; elapsed = 00:00:27 . Memory (MB): peak = 4490.121 ; gain = 0.000 ; free physical = 1860689 ; free virtual = 20111302default:defaulth px� 
{

Phase %s%s
101*constraints2
2.2 2default:default2,
Fix Topology Constraints2default:defaultZ18-101h px� 
M
8Phase 2.2 Fix Topology Constraints | Checksum: c6cbddb4
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:29 ; elapsed = 00:00:29 . Memory (MB): peak = 4490.121 ; gain = 0.000 ; free physical = 1860687 ; free virtual = 20111282default:defaulth px� 
t

Phase %s%s
101*constraints2
2.3 2default:default2%
Pre Route Cleanup2default:defaultZ18-101h px� 
F
1Phase 2.3 Pre Route Cleanup | Checksum: c6cbddb4
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:29 ; elapsed = 00:00:29 . Memory (MB): peak = 4490.121 ; gain = 0.000 ; free physical = 1860687 ; free virtual = 20111282default:defaulth px� 
p

Phase %s%s
101*constraints2
2.4 2default:default2!
Update Timing2default:defaultZ18-101h px� 
B
-Phase 2.4 Update Timing | Checksum: 9b828bfd
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:53 ; elapsed = 00:01:26 . Memory (MB): peak = 4490.121 ; gain = 0.000 ; free physical = 1860656 ; free virtual = 20110982default:defaulth px� 
�
Intermediate Timing Summary %s164*route2L
8| WNS=0.116  | TNS=0.000  | WHS=-2.161 | THS=-8304.079|
2default:defaultZ35-416h px� 
I
4Phase 2 Router Initialization | Checksum: 124795739
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:04:36 ; elapsed = 00:01:51 . Memory (MB): peak = 4490.121 ; gain = 0.000 ; free physical = 1860656 ; free virtual = 20110972default:defaulth px� 
p

Phase %s%s
101*constraints2
3 2default:default2#
Initial Routing2default:defaultZ18-101h px� 
C
.Phase 3 Initial Routing | Checksum: 19a302fe7
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:06:23 ; elapsed = 00:02:12 . Memory (MB): peak = 4663.305 ; gain = 173.184 ; free physical = 1860442 ; free virtual = 20108832default:defaulth px� 
s

Phase %s%s
101*constraints2
4 2default:default2&
Rip-up And Reroute2default:defaultZ18-101h px� 
u

Phase %s%s
101*constraints2
4.1 2default:default2&
Global Iteration 02default:defaultZ18-101h px� 
r

Phase %s%s
101*constraints2
4.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
E
0Phase 4.1.1 Update Timing | Checksum: 169283cf3
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:13:51 ; elapsed = 00:03:37 . Memory (MB): peak = 4663.305 ; gain = 173.184 ; free physical = 1860480 ; free virtual = 20109212default:defaulth px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=0.116  | TNS=0.000  | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px� 
H
3Phase 4.1 Global Iteration 0 | Checksum: 19a4936e7
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:14:02 ; elapsed = 00:03:41 . Memory (MB): peak = 4663.305 ; gain = 173.184 ; free physical = 1860480 ; free virtual = 20109212default:defaulth px� 
F
1Phase 4 Rip-up And Reroute | Checksum: 19a4936e7
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:14:02 ; elapsed = 00:03:42 . Memory (MB): peak = 4663.305 ; gain = 173.184 ; free physical = 1860480 ; free virtual = 20109212default:defaulth px� 
|

Phase %s%s
101*constraints2
5 2default:default2/
Delay and Skew Optimization2default:defaultZ18-101h px� 
p

Phase %s%s
101*constraints2
5.1 2default:default2!
Delay CleanUp2default:defaultZ18-101h px� 
r

Phase %s%s
101*constraints2
5.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
E
0Phase 5.1.1 Update Timing | Checksum: 13e0a7141
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:14:28 ; elapsed = 00:03:48 . Memory (MB): peak = 4663.305 ; gain = 173.184 ; free physical = 1860478 ; free virtual = 20109192default:defaulth px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=0.116  | TNS=0.000  | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px� 
C
.Phase 5.1 Delay CleanUp | Checksum: 13e0a7141
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:14:28 ; elapsed = 00:03:49 . Memory (MB): peak = 4663.305 ; gain = 173.184 ; free physical = 1860478 ; free virtual = 20109192default:defaulth px� 
z

Phase %s%s
101*constraints2
5.2 2default:default2+
Clock Skew Optimization2default:defaultZ18-101h px� 
M
8Phase 5.2 Clock Skew Optimization | Checksum: 13e0a7141
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:14:29 ; elapsed = 00:03:50 . Memory (MB): peak = 4663.305 ; gain = 173.184 ; free physical = 1860479 ; free virtual = 20109202default:defaulth px� 
O
:Phase 5 Delay and Skew Optimization | Checksum: 13e0a7141
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:14:30 ; elapsed = 00:03:50 . Memory (MB): peak = 4663.305 ; gain = 173.184 ; free physical = 1860478 ; free virtual = 20109202default:defaulth px� 
n

Phase %s%s
101*constraints2
6 2default:default2!
Post Hold Fix2default:defaultZ18-101h px� 
p

Phase %s%s
101*constraints2
6.1 2default:default2!
Hold Fix Iter2default:defaultZ18-101h px� 
r

Phase %s%s
101*constraints2
6.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
E
0Phase 6.1.1 Update Timing | Checksum: 16331020f
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:14:56 ; elapsed = 00:03:58 . Memory (MB): peak = 4663.305 ; gain = 173.184 ; free physical = 1860478 ; free virtual = 20109202default:defaulth px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=0.116  | TNS=0.000  | WHS=-1.207 | THS=-44.951|
2default:defaultZ35-416h px� 
�

Phase %s%s
101*constraints2
6.1.2 2default:default25
!Lut RouteThru Assignment for hold2default:defaultZ18-101h px� 
Y
DPhase 6.1.2 Lut RouteThru Assignment for hold | Checksum: 202c13fa1
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:19:00 ; elapsed = 00:04:46 . Memory (MB): peak = 6118.305 ; gain = 1628.184 ; free physical = 1858984 ; free virtual = 20094252default:defaulth px� 
C
.Phase 6.1 Hold Fix Iter | Checksum: 202c13fa1
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:19:01 ; elapsed = 00:04:46 . Memory (MB): peak = 6118.305 ; gain = 1628.184 ; free physical = 1858983 ; free virtual = 20094252default:defaulth px� 
v

Phase %s%s
101*constraints2
6.2 2default:default2'
Additional Hold Fix2default:defaultZ18-101h px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=0.116  | TNS=0.000  | WHS=-1.207 | THS=-20.964|
2default:defaultZ35-416h px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=0.116  | TNS=0.000  | WHS=-1.207 | THS=-20.964|
2default:defaultZ35-416h px� 
I
4Phase 6.2 Additional Hold Fix | Checksum: 1bc60132d
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:20:47 ; elapsed = 00:05:37 . Memory (MB): peak = 6118.305 ; gain = 1628.184 ; free physical = 1858983 ; free virtual = 20094252default:defaulth px� 
A
,Phase 6 Post Hold Fix | Checksum: 1bc60132d
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:20:48 ; elapsed = 00:05:37 . Memory (MB): peak = 6118.305 ; gain = 1628.184 ; free physical = 1858983 ; free virtual = 20094252default:defaulth px� 
o

Phase %s%s
101*constraints2
7 2default:default2"
Route finalize2default:defaultZ18-101h px� 
B
-Phase 7 Route finalize | Checksum: 1109fc806
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:20:56 ; elapsed = 00:05:39 . Memory (MB): peak = 6118.305 ; gain = 1628.184 ; free physical = 1858983 ; free virtual = 20094252default:defaulth px� 
v

Phase %s%s
101*constraints2
8 2default:default2)
Verifying routed nets2default:defaultZ18-101h px� 
I
4Phase 8 Verifying routed nets | Checksum: 1109fc806
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:20:57 ; elapsed = 00:05:40 . Memory (MB): peak = 6118.305 ; gain = 1628.184 ; free physical = 1858983 ; free virtual = 20094252default:defaulth px� 
r

Phase %s%s
101*constraints2
9 2default:default2%
Depositing Routes2default:defaultZ18-101h px� 
D
/Phase 9 Depositing Routes | Checksum: 9da059a7
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:21:09 ; elapsed = 00:05:52 . Memory (MB): peak = 6118.305 ; gain = 1628.184 ; free physical = 1858982 ; free virtual = 20094242default:defaulth px� 
t

Phase %s%s
101*constraints2
10 2default:default2&
Post Router Timing2default:defaultZ18-101h px� 
q

Phase %s%s
101*constraints2
10.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
C
.Phase 10.1 Update Timing | Checksum: fa417424
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:21:35 ; elapsed = 00:06:00 . Memory (MB): peak = 6118.305 ; gain = 1628.184 ; free physical = 1858982 ; free virtual = 20094242default:defaulth px� 
�
Estimated Timing Summary %s
57*route2J
6| WNS=0.116  | TNS=0.000  | WHS=-1.207 | THS=-20.964|
2default:defaultZ35-57h px� 
B
!Router estimated timing not met.
128*routeZ35-328h px� 
F
1Phase 10 Post Router Timing | Checksum: fa417424
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:21:36 ; elapsed = 00:06:00 . Memory (MB): peak = 6118.305 ; gain = 1628.184 ; free physical = 1858982 ; free virtual = 20094242default:defaulth px� 
�
qRouter was unable to fix hold violation on %s pins because of tight setup and hold constraints. Such pins are:
%s189*route2
42default:default2�
�	meisha_i/DevKitWrapper_0/inst/wrangler/pwr_cur_st_reg[0]/CLR
	meisha_i/util_vector_logic_4/Res[0]_INST_0/I1
	meisha_i/DevKitWrapper_0/inst/wrangler/pwr_rls_cnt_reg[0]/CLR
	meisha_i/DevKitWrapper_0/inst/wrangler/pwr_reset_cnt_reg[10]/CLR
2default:defaultZ35-456h px� 
�
fRouter was unable to fix hold violation on %s pins because of high hold requirement. Such pins are:
%s188*route2
52default:default2�
�	meisha_i/DevKitWrapper_0/inst/wrangler/pwr_hard_reset_sync_main_clk_ResetCatchAndSync_d3/reset_2_reg_srl2/D
	meisha_i/DevKitWrapper_0/inst/wrangler/pwr_rls_cnt_reg[12]/CLR
	meisha_i/DevKitWrapper_0/inst/wrangler/pwr_reset_cnt_reg[0]/CLR
	meisha_i/DevKitWrapper_0/inst/wrangler/pwr_reset_cnt_reg[2]/CLR
	meisha_i/DevKitWrapper_0/inst/wrangler/pwr_rls_cnt_reg[11]/CLR
2default:defaultZ35-455h px� 
�
�Router was unable to fix hold violation on %s pins. This could be due to a combination of congestion, blockages and run-time limitations. Such pins are:
%s192*route2
22default:default2�
�	meisha_i/DevKitWrapper_0/inst/topMod/sbus/coupler_from_tile_named_tile_1/u_tl_async_bridge/u_tl_a_async/u_async_fifo/GEN_REGISTERED_READ.o_rd_data_reg[82]/D
	meisha_i/DevKitWrapper_0/inst/topMod/sbus/coupler_from_tile_named_tile_1/u_tl_async_bridge/u_tl_a_async/u_async_fifo/GEN_REGISTERED_READ.o_rd_data_reg[22]/D
2default:defaultZ35-459h px� 
=
Router Completed Successfully
16*routeZ35-16h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:21:40 ; elapsed = 00:06:01 . Memory (MB): peak = 6118.305 ; gain = 1628.184 ; free physical = 1858983 ; free virtual = 20094252default:defaulth px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
862default:default2
752default:default2
62default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
route_design2default:defaultZ4-42h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2"
route_design: 2default:default2
00:22:032default:default2
00:06:212default:default2
6118.3052default:default2
1668.2032default:default2
18589832default:default2
20094252default:defaultZ17-722h px� 
D
Writing placer database...
1603*designutilsZ20-1893h px� 
=
Writing XDEF routing.
211*designutilsZ20-211h px� 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px� 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2)
Write XDEF Complete: 2default:default2
00:00:332default:default2
00:00:112default:default2
6142.3162default:default2
0.0002default:default2
18586122default:default2
20094152default:defaultZ17-722h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2�
v/home/test/vivado_prj/MEISHAV100---FPGA-verifaction-on-VC707/fpga_project/meisha.runs/impl_1/meisha_wrapper_routed.dcp2default:defaultZ17-1381h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2&
write_checkpoint: 2default:default2
00:00:512default:default2
00:00:292default:default2
6142.3202default:default2
24.0162default:default2
18589002default:default2
20094222default:defaultZ17-722h px� 
P
Running DRC with %s threads
24*drc2
82default:defaultZ23-27h px� 
�
#The results of DRC are in file %s.
168*coretcl2�
z/home/test/vivado_prj/MEISHAV100---FPGA-verifaction-on-VC707/fpga_project/meisha.runs/impl_1/meisha_wrapper_drc_routed.rptz/home/test/vivado_prj/MEISHAV100---FPGA-verifaction-on-VC707/fpga_project/meisha.runs/impl_1/meisha_wrapper_drc_routed.rpt2default:default8Z2-168h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2 
report_drc: 2default:default2
00:00:492default:default2
00:00:212default:default2
6182.3402default:default2
40.0202default:default2
18588822default:default2
20094042default:defaultZ17-722h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
Y
$Running Methodology with %s threads
74*drc2
82default:defaultZ23-133h px� 
�
2The results of Report Methodology are in file %s.
450*coretcl2�
�/home/test/vivado_prj/MEISHAV100---FPGA-verifaction-on-VC707/fpga_project/meisha.runs/impl_1/meisha_wrapper_methodology_drc_routed.rpt�/home/test/vivado_prj/MEISHAV100---FPGA-verifaction-on-VC707/fpga_project/meisha.runs/impl_1/meisha_wrapper_methodology_drc_routed.rpt2default:default8Z2-1520h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2(
report_methodology: 2default:default2
00:04:012default:default2
00:01:332default:default2
6182.3402default:default2
0.0002default:default2
18591952default:default2
20097172default:defaultZ17-722h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
r
UpdateTimingParams:%s.
91*timing29
% Speed grade: -2, Delay Type: min_max2default:defaultZ38-91h px� 
|
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
82default:defaultZ38-191h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
�
rThe design failed to meet the timing requirements. Please see the %s report for details on the timing violations.
188*timing2"
timing summary2default:defaultZ38-282h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2+
report_timing_summary: 2default:default2
00:01:012default:default2
00:00:232default:default2
6182.3402default:default2
0.0002default:default2
18591672default:default2
20097082default:defaultZ17-722h px� 
�
Command: %s
53*	vivadotcl2�
�report_power -file meisha_wrapper_power_routed.rpt -pb meisha_wrapper_power_summary_routed.pb -rpx meisha_wrapper_power_routed.rpx2default:defaultZ4-113h px� 
K
,Running Vector-less Activity Propagation...
51*powerZ33-51h px� 
P
3
Finished Running Vector-less Activity Propagation
1*powerZ33-1h px� 
�
�Detected over-assertion of set/reset/preset/clear net with high fanouts, power estimation might not be accurate. Please run Tool - Power Constraint Wizard to set proper switching activities for control signals.282*powerZ33-332h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
962default:default2
762default:default2
72default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
report_power2default:defaultZ4-42h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2"
report_power: 2default:default2
00:01:562default:default2
00:00:542default:default2
6214.3482default:default2
32.0082default:default2
18591642default:default2
20097182default:defaultZ17-722h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
report_clock_utilization: 2default:default2
00:00:082default:default2
00:00:082default:default2
6214.3482default:default2
0.0002default:default2
18591542default:default2
20097072default:defaultZ17-722h px� 


End Record