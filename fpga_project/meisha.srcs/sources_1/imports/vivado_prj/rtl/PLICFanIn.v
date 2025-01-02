module PLICFanIn( 
  input  [2:0] io_prio_0, 
  input  [2:0] io_prio_1, 
  input  [2:0] io_prio_2, 
  input  [2:0] io_prio_3, 
  input  [2:0] io_prio_4, 
  input  [2:0] io_prio_5, 
  input  [2:0] io_prio_6, 
  input  [6:0] io_ip, 
  output [2:0] io_dev, 
  output [2:0] io_max 
);
  wire  _T_17; 
  wire  _T_18; 
  wire  _T_19; 
  wire  _T_20; 
  wire  _T_21; 
  wire  _T_22; 
  wire  _T_23; 
  wire [3:0] effectivePriority_1; 
  wire [3:0] effectivePriority_2; 
  wire [3:0] effectivePriority_3; 
  wire [3:0] effectivePriority_4; 
  wire [3:0] effectivePriority_5; 
  wire [3:0] effectivePriority_6; 
  wire [3:0] effectivePriority_7; 
  wire  _T_24; 
  wire [3:0] _T_26; 
  wire  _T_27; 
  wire  _T_28; 
  wire [3:0] _T_30; 
  wire  _T_31; 
  wire  _T_32; 
  wire [1:0] _GEN_0; 
  wire [1:0] _T_33; 
  wire [3:0] _T_34; 
  wire [1:0] _T_35; 
  wire  _T_36; 
  wire [3:0] _T_38; 
  wire  _T_39; 
  wire  _T_40; 
  wire [3:0] _T_42; 
  wire  _T_43; 
  wire  _T_44; 
  wire [1:0] _GEN_1; 
  wire [1:0] _T_45; 
  wire [3:0] _T_46; 
  wire [1:0] _T_47; 
  wire  _T_48; 
  wire [2:0] _GEN_2; 
  wire [2:0] _T_49; 
  wire [3:0] maxPri; 
  assign _T_17 = io_ip[0]; 
  assign _T_18 = io_ip[1]; 
  assign _T_19 = io_ip[2]; 
  assign _T_20 = io_ip[3]; 
  assign _T_21 = io_ip[4]; 
  assign _T_22 = io_ip[5]; 
  assign _T_23 = io_ip[6]; 
  assign effectivePriority_1 = {_T_17,io_prio_0}; 
  assign effectivePriority_2 = {_T_18,io_prio_1}; 
  assign effectivePriority_3 = {_T_19,io_prio_2}; 
  assign effectivePriority_4 = {_T_20,io_prio_3}; 
  assign effectivePriority_5 = {_T_21,io_prio_4}; 
  assign effectivePriority_6 = {_T_22,io_prio_5}; 
  assign effectivePriority_7 = {_T_23,io_prio_6}; 
  assign _T_24 = 4'h8 >= effectivePriority_1; 
  assign _T_26 = _T_24 ? 4'h8 : effectivePriority_1; 
  assign _T_27 = _T_24 ? 1'h0 : 1'h1; 
  assign _T_28 = effectivePriority_2 >= effectivePriority_3; 
  assign _T_30 = _T_28 ? effectivePriority_2 : effectivePriority_3; 
  assign _T_31 = _T_28 ? 1'h0 : 1'h1; 
  assign _T_32 = _T_26 >= _T_30; 
  assign _GEN_0 = {{1'd0}, _T_31}; 
  assign _T_33 = 2'h2 | _GEN_0; 
  assign _T_34 = _T_32 ? _T_26 : _T_30; 
  assign _T_35 = _T_32 ? {{1'd0}, _T_27} : _T_33; 
  assign _T_36 = effectivePriority_4 >= effectivePriority_5; 
  assign _T_38 = _T_36 ? effectivePriority_4 : effectivePriority_5; 
  assign _T_39 = _T_36 ? 1'h0 : 1'h1; 
  assign _T_40 = effectivePriority_6 >= effectivePriority_7; 
  assign _T_42 = _T_40 ? effectivePriority_6 : effectivePriority_7; 
  assign _T_43 = _T_40 ? 1'h0 : 1'h1; 
  assign _T_44 = _T_38 >= _T_42; 
  assign _GEN_1 = {{1'd0}, _T_43}; 
  assign _T_45 = 2'h2 | _GEN_1; 
  assign _T_46 = _T_44 ? _T_38 : _T_42; 
  assign _T_47 = _T_44 ? {{1'd0}, _T_39} : _T_45; 
  assign _T_48 = _T_34 >= _T_46; 
  assign _GEN_2 = {{1'd0}, _T_47}; 
  assign _T_49 = 3'h4 | _GEN_2; 
  assign maxPri = _T_48 ? _T_34 : _T_46; 
  assign io_dev = _T_48 ? {{1'd0}, _T_35} : _T_49; 
  assign io_max = maxPri[2:0]; 
endmodule
