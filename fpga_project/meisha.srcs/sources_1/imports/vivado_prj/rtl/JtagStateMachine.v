module JtagStateMachine( 
  input        clock, 
  input        reset, 
  input        io_tms, 
  output [3:0] io_currState 
);
  wire  currStateReg_clock; 
  wire  currStateReg_reset; 
  wire [3:0] currStateReg_io_d; 
  wire [3:0] currStateReg_io_q; 
  wire  _T_10; 
  wire [3:0] _T_11; 
  wire  _T_12; 
  wire [3:0] _T_13; 
  wire  _T_14; 
  wire [3:0] _T_15; 
  wire  _T_16; 
  wire [3:0] _T_17; 
  wire  _T_18; 
  wire  _T_20; 
  wire [3:0] _T_21; 
  wire  _T_22; 
  wire [3:0] _T_23; 
  wire  _T_24; 
  wire [3:0] _T_25; 
  wire  _T_26; 
  wire  _T_28; 
  wire [3:0] _T_29; 
  wire  _T_30; 
  wire [3:0] _T_31; 
  wire  _T_32; 
  wire  _T_34; 
  wire [3:0] _T_35; 
  wire  _T_36; 
  wire [3:0] _T_37; 
  wire  _T_38; 
  wire [3:0] _T_39; 
  wire [3:0] _GEN_1; 
  wire [3:0] _GEN_2; 
  wire [3:0] _GEN_3; 
  wire [3:0] _GEN_4; 
  wire [3:0] _GEN_5; 
  wire [3:0] _GEN_6; 
  wire [3:0] _GEN_7; 
  wire [3:0] _GEN_8; 
  wire [3:0] _GEN_9; 
  wire [3:0] _GEN_10; 
  wire [3:0] _GEN_11; 
  wire [3:0] _GEN_12; 
  wire [3:0] _GEN_13; 
  wire [3:0] _GEN_14; 
  AsyncResetRegVec_w4_i15 currStateReg ( 
    .clock(currStateReg_clock),
    .reset(currStateReg_reset),
    .io_d(currStateReg_io_d),
    .io_q(currStateReg_io_q)
  );
  assign _T_10 = 4'hf == currStateReg_io_q; 
  assign _T_11 = io_tms ? 4'hf : 4'hc; 
  assign _T_12 = 4'hc == currStateReg_io_q; 
  assign _T_13 = io_tms ? 4'h7 : 4'hc; 
  assign _T_14 = 4'h7 == currStateReg_io_q; 
  assign _T_15 = io_tms ? 4'h4 : 4'h6; 
  assign _T_16 = 4'h6 == currStateReg_io_q; 
  assign _T_17 = io_tms ? 4'h1 : 4'h2; 
  assign _T_18 = 4'h2 == currStateReg_io_q; 
  assign _T_20 = 4'h1 == currStateReg_io_q; 
  assign _T_21 = io_tms ? 4'h5 : 4'h3; 
  assign _T_22 = 4'h3 == currStateReg_io_q; 
  assign _T_23 = io_tms ? 4'h0 : 4'h3; 
  assign _T_24 = 4'h0 == currStateReg_io_q; 
  assign _T_25 = io_tms ? 4'h5 : 4'h2; 
  assign _T_26 = 4'h5 == currStateReg_io_q; 
  assign _T_28 = 4'h4 == currStateReg_io_q; 
  assign _T_29 = io_tms ? 4'hf : 4'he; 
  assign _T_30 = 4'he == currStateReg_io_q; 
  assign _T_31 = io_tms ? 4'h9 : 4'ha; 
  assign _T_32 = 4'ha == currStateReg_io_q; 
  assign _T_34 = 4'h9 == currStateReg_io_q; 
  assign _T_35 = io_tms ? 4'hd : 4'hb; 
  assign _T_36 = 4'hb == currStateReg_io_q; 
  assign _T_37 = io_tms ? 4'h8 : 4'hb; 
  assign _T_38 = 4'h8 == currStateReg_io_q; 
  assign _T_39 = io_tms ? 4'hd : 4'ha; 
  assign _GEN_1 = _T_38 ? _T_39 : _T_13; 
  assign _GEN_2 = _T_36 ? _T_37 : _GEN_1; 
  assign _GEN_3 = _T_34 ? _T_35 : _GEN_2; 
  assign _GEN_4 = _T_32 ? _T_31 : _GEN_3; 
  assign _GEN_5 = _T_30 ? _T_31 : _GEN_4; 
  assign _GEN_6 = _T_28 ? _T_29 : _GEN_5; 
  assign _GEN_7 = _T_26 ? _T_13 : _GEN_6; 
  assign _GEN_8 = _T_24 ? _T_25 : _GEN_7; 
  assign _GEN_9 = _T_22 ? _T_23 : _GEN_8; 
  assign _GEN_10 = _T_20 ? _T_21 : _GEN_9; 
  assign _GEN_11 = _T_18 ? _T_17 : _GEN_10; 
  assign _GEN_12 = _T_16 ? _T_17 : _GEN_11; 
  assign _GEN_13 = _T_14 ? _T_15 : _GEN_12; 
  assign _GEN_14 = _T_12 ? _T_13 : _GEN_13; 
  assign io_currState = currStateReg_io_q; 
  assign currStateReg_clock = clock; 
  assign currStateReg_reset = reset; 
  assign currStateReg_io_d = _T_10 ? _T_11 : _GEN_14; 
endmodule
