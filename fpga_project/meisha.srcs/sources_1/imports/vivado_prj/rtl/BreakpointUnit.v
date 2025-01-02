module BreakpointUnit( 
  input         io_status_debug, 
  input  [1:0]  io_status_prv, 
  input         io_bp_0_control_action, 
  input  [1:0]  io_bp_0_control_tmatch, 
  input         io_bp_0_control_m, 
  input         io_bp_0_control_s, 
  input         io_bp_0_control_u, 
  input         io_bp_0_control_x, 
  input         io_bp_0_control_w, 
  input         io_bp_0_control_r, 
  input  [38:0] io_bp_0_address, 
  input  [38:0] io_pc, 
  input  [38:0] io_ea, 
  output        io_xcpt_if, 
  output        io_xcpt_ld, 
  output        io_xcpt_st, 
  output        io_debug_if, 
  output        io_debug_ld, 
  output        io_debug_st 
);
  wire  _T_19; 
  wire [1:0] _T_20; 
  wire [1:0] _T_21; 
  wire [3:0] _T_22; 
  wire [3:0] _T_23; 
  wire  _T_24; 
  wire  _T_25; 
  wire  _T_27; 
  wire  _T_28; 
  wire  _T_29; 
  wire  _T_30; 
  wire  _T_31; 
  wire [38:0] _T_32; 
  wire  _T_34; 
  wire  _T_35; 
  wire  _T_36; 
  wire  _T_37; 
  wire  _T_38; 
  wire  _T_39; 
  wire [1:0] _T_40; 
  wire [1:0] _T_41; 
  wire [3:0] _T_42; 
  wire [38:0] _GEN_6; 
  wire [38:0] _T_43; 
  wire [38:0] _T_44; 
  wire [38:0] _T_55; 
  wire  _T_56; 
  wire  _T_57; 
  wire  _T_58; 
  wire  _T_60; 
  wire  _T_91; 
  wire  _T_93; 
  wire  _T_95; 
  wire  _T_97; 
  wire [38:0] _T_98; 
  wire [38:0] _T_109; 
  wire  _T_122; 
  wire  _T_123; 
  wire  _T_124; 
  wire  _T_127; 
  assign _T_19 = io_status_debug == 1'h0; 
  assign _T_20 = {io_bp_0_control_s,io_bp_0_control_u}; 
  assign _T_21 = {io_bp_0_control_m,1'h0}; 
  assign _T_22 = {_T_21,_T_20}; 
  assign _T_23 = _T_22 >> io_status_prv; 
  assign _T_24 = _T_23[0]; 
  assign _T_25 = _T_19 & _T_24; 
  assign _T_27 = _T_25 & io_bp_0_control_r; 
  assign _T_28 = io_bp_0_control_tmatch[1]; 
  assign _T_29 = io_ea >= io_bp_0_address; 
  assign _T_30 = io_bp_0_control_tmatch[0]; 
  assign _T_31 = _T_29 ^ _T_30; 
  assign _T_32 = ~ io_ea; 
  assign _T_34 = io_bp_0_address[0]; 
  assign _T_35 = _T_30 & _T_34; 
  assign _T_36 = io_bp_0_address[1]; 
  assign _T_37 = _T_35 & _T_36; 
  assign _T_38 = io_bp_0_address[2]; 
  assign _T_39 = _T_37 & _T_38; 
  assign _T_40 = {_T_35,_T_30}; 
  assign _T_41 = {_T_39,_T_37}; 
  assign _T_42 = {_T_41,_T_40}; 
  assign _GEN_6 = {{35'd0}, _T_42}; 
  assign _T_43 = _T_32 | _GEN_6; 
  assign _T_44 = ~ io_bp_0_address; 
  assign _T_55 = _T_44 | _GEN_6; 
  assign _T_56 = _T_43 == _T_55; 
  assign _T_57 = _T_28 ? _T_31 : _T_56; 
  assign _T_58 = _T_27 & _T_57; 
  assign _T_60 = _T_25 & io_bp_0_control_w; 
  assign _T_91 = _T_60 & _T_57; 
  assign _T_93 = _T_25 & io_bp_0_control_x; 
  assign _T_95 = io_pc >= io_bp_0_address; 
  assign _T_97 = _T_95 ^ _T_30; 
  assign _T_98 = ~ io_pc; 
  assign _T_109 = _T_98 | _GEN_6; 
  assign _T_122 = _T_109 == _T_55; 
  assign _T_123 = _T_28 ? _T_97 : _T_122; 
  assign _T_124 = _T_93 & _T_123; 
  assign _T_127 = io_bp_0_control_action == 1'h0; 
  assign io_xcpt_if = _T_124 ? _T_127 : 1'h0; 
  assign io_xcpt_ld = _T_58 ? _T_127 : 1'h0; 
  assign io_xcpt_st = _T_91 ? _T_127 : 1'h0; 
  assign io_debug_if = _T_124 ? io_bp_0_control_action : 1'h0; 
  assign io_debug_ld = _T_58 ? io_bp_0_control_action : 1'h0; 
  assign io_debug_st = _T_91 ? io_bp_0_control_action : 1'h0; 
endmodule
