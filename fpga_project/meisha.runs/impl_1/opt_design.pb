
O
Command: %s
53*	vivadotcl2

opt_design2default:defaultZ4-113h px� 
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
n
,Running DRC as a precondition to command %s
22*	vivadotcl2

opt_design2default:defaultZ4-22h px� 
R

Starting %s Task
103*constraints2
DRC2default:defaultZ18-103h px� 
P
Running DRC with %s threads
24*drc2
82default:defaultZ23-27h px� 
U
DRC finished with %s
272*project2
0 Errors2default:defaultZ1-461h px� 
d
BPlease refer to the DRC report (report_drc) for more information.
274*projectZ1-462h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:04 ; elapsed = 00:00:01 . Memory (MB): peak = 3000.172 ; gain = 64.035 ; free physical = 1862041 ; free virtual = 20123842default:defaulth px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
a

Starting %s Task
103*constraints2&
Logic Optimization2default:defaultZ18-103h px� 
A
,Implement Debug Cores | Checksum: 1e6b35353
*commonh px� 
i

Phase %s%s
101*constraints2
1 2default:default2
Retarget2default:defaultZ18-101h px� 
v
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
62default:default2
142default:defaultZ31-138h px� 
K
Retargeted %s cell(s).
49*opt2
02default:defaultZ31-49h px� 
<
'Phase 1 Retarget | Checksum: 217d047df
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:11 ; elapsed = 00:00:11 . Memory (MB): peak = 3000.172 ; gain = 0.000 ; free physical = 1862025 ; free virtual = 20123692default:defaulth px� 
u

Phase %s%s
101*constraints2
2 2default:default2(
Constant propagation2default:defaultZ18-101h px� 
w
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
252default:default2
252default:defaultZ31-138h px� 
L
Eliminated %s cells.
10*opt2
18652default:defaultZ31-10h px� 
H
3Phase 2 Constant propagation | Checksum: 2557ed78d
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:56 ; elapsed = 00:00:56 . Memory (MB): peak = 3000.172 ; gain = 0.000 ; free physical = 1862023 ; free virtual = 20123672default:defaulth px� 
f

Phase %s%s
101*constraints2
3 2default:default2
Sweep2default:defaultZ18-101h px� 
c
 Eliminated %s unconnected nets.
12*opt2"
20302203022default:default8Z31-12h px� 
b
!Eliminated %s unconnected cells.
11*opt2 
2632	26322default:default8Z31-11h px� 
9
$Phase 3 Sweep | Checksum: 1ca7f01bd
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:01:03 ; elapsed = 00:01:03 . Memory (MB): peak = 3000.172 ; gain = 0.000 ; free physical = 1862024 ; free virtual = 20123672default:defaulth px� 
r

Phase %s%s
101*constraints2
4 2default:default2%
BUFG optimization2default:defaultZ18-101h px� 
�
4Inserted BUFG %s to drive %s load(s) on clock net %s141*opt20
jtag_jtag_TCK_IBUF_BUFG_inst2default:default2
3092default:default2+
jtag_jtag_TCK_IBUF_BUFG2default:defaultZ31-194h px� 
W
!Inserted %s BUFG(s) on clock nets140*opt2
12default:defaultZ31-193h px� 
]
 Eliminated %s unconnected nets.
12*opt2
16162default:default8Z31-12h px� 
^
!Eliminated %s unconnected cells.
11*opt2
15	152default:default8Z31-11h px� 
E
0Phase 4 BUFG optimization | Checksum: 26cc48353
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:01:13 ; elapsed = 00:01:13 . Memory (MB): peak = 3000.172 ; gain = 0.000 ; free physical = 1862024 ; free virtual = 20123682default:defaulth px� 
a

Starting %s Task
103*constraints2&
Connectivity Check2default:defaultZ18-103h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00.61 ; elapsed = 00:00:00.61 . Memory (MB): peak = 3000.172 ; gain = 0.000 ; free physical = 1862024 ; free virtual = 20123682default:defaulth px� 
J
5Ending Logic Optimization Task | Checksum: 26cc48353
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:01:15 ; elapsed = 00:01:15 . Memory (MB): peak = 3000.172 ; gain = 0.000 ; free physical = 1862024 ; free virtual = 20123682default:defaulth px� 
a

Starting %s Task
103*constraints2&
Power Optimization2default:defaultZ18-103h px� 
s
7Will skip clock gating for clocks with period < %s ns.
114*pwropt2
2.002default:defaultZ34-132h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
=
Applying IDT optimizations ...
9*pwroptZ34-9h px� 
?
Applying ODC optimizations ...
10*pwroptZ34-10h px� 
K
,Running Vector-less Activity Propagation...
51*powerZ33-51h px� 
P
3
Finished Running Vector-less Activity Propagation
1*powerZ33-1h px� 


*pwropth px� 
e

Starting %s Task
103*constraints2*
PowerOpt Patch Enables2default:defaultZ18-103h px� 
�
�WRITE_MODE attribute of %s BRAM(s) out of a total of %s has been updated to save power.
    Run report_power_opt to get a complete listing of the BRAMs updated.
129*pwropt2
02default:default2
772default:defaultZ34-162h px� 
d
+Structural ODC has moved %s WE to EN ports
155*pwropt2
32default:defaultZ34-201h px� 
�
CNumber of BRAM Ports augmented: %s newly gated: %s Total Ports: %s
65*pwropt2
22default:default2
272default:default2
1542default:defaultZ34-65h px� 
h
1Number of Flops added for Enable Generation: %s

23*pwropt2
22default:defaultZ34-23h px� 
N
9Ending PowerOpt Patch Enables Task | Checksum: 2998b6e58
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:01 ; elapsed = 00:00:01 . Memory (MB): peak = 4297.906 ; gain = 0.000 ; free physical = 1861064 ; free virtual = 20114072default:defaulth px� 
J
5Ending Power Optimization Task | Checksum: 2998b6e58
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:01:42 ; elapsed = 00:00:32 . Memory (MB): peak = 4297.906 ; gain = 1297.734 ; free physical = 1861064 ; free virtual = 20114072default:defaulth px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
542default:default2
172default:default2
62default:default2
02default:defaultZ4-41h px� 
\
%s completed successfully
29*	vivadotcl2

opt_design2default:defaultZ4-42h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2 
opt_design: 2default:default2
00:03:252default:default2
00:01:592default:default2
4297.9062default:default2
1369.7662default:default2
18610642default:default2
20114072default:defaultZ17-722h px� 
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
00:00:00.372default:default2
00:00:00.102default:default2
4297.9062default:default2
0.0002default:default2
18610482default:default2
20113962default:defaultZ17-722h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2�
s/home/test/vivado_prj/MEISHAV100---FPGA-verifaction-on-VC707/fpga_project/meisha.runs/impl_1/meisha_wrapper_opt.dcp2default:defaultZ17-1381h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2&
write_checkpoint: 2default:default2
00:00:502default:default2
00:00:292default:default2
4297.9062default:default2
0.0002default:default2
18610162default:default2
20113962default:defaultZ17-722h px� 
P
Running DRC with %s threads
24*drc2
82default:defaultZ23-27h px� 
�
#The results of DRC are in file %s.
168*coretcl2�
y/home/test/vivado_prj/MEISHAV100---FPGA-verifaction-on-VC707/fpga_project/meisha.runs/impl_1/meisha_wrapper_drc_opted.rpty/home/test/vivado_prj/MEISHAV100---FPGA-verifaction-on-VC707/fpga_project/meisha.runs/impl_1/meisha_wrapper_drc_opted.rpt2default:default8Z2-168h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2 
report_drc: 2default:default2
00:00:202default:default2
00:00:172default:default2
4297.9062default:default2
0.0002default:default2
18610092default:default2
20113892default:defaultZ17-722h px� 


End Record