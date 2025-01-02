module RecFNToRecFN( 
  input  [64:0] io_in, 
  input  [2:0]  io_roundingMode, 
  output [32:0] io_out, 
  output [4:0]  io_exceptionFlags 
);
  wire  RoundAnyRawFNToRecFN_io_invalidExc; 
  wire  RoundAnyRawFNToRecFN_io_in_isNaN; 
  wire  RoundAnyRawFNToRecFN_io_in_isInf; 
  wire  RoundAnyRawFNToRecFN_io_in_isZero; 
  wire  RoundAnyRawFNToRecFN_io_in_sign; 
  wire [12:0] RoundAnyRawFNToRecFN_io_in_sExp; 
  wire [53:0] RoundAnyRawFNToRecFN_io_in_sig; 
  wire [2:0] RoundAnyRawFNToRecFN_io_roundingMode; 
  wire [32:0] RoundAnyRawFNToRecFN_io_out; 
  wire [4:0] RoundAnyRawFNToRecFN_io_exceptionFlags; 
  wire [11:0] _T_9; 
  wire [2:0] _T_10; 
  wire  rawIn_isZero; 
  wire [1:0] _T_12; 
  wire  _T_13; 
  wire  _T_15; 
  wire  rawIn_isNaN; 
  wire  _T_18; 
  wire  _T_22; 
  wire [51:0] _T_23; 
  wire [1:0] _T_24; 
  wire [53:0] rawIn_sig; 
  wire  _T_26; 
  wire  _T_27; 
  RoundAnyRawFNToRecFN_3 RoundAnyRawFNToRecFN ( 
    .io_invalidExc(RoundAnyRawFNToRecFN_io_invalidExc),
    .io_in_isNaN(RoundAnyRawFNToRecFN_io_in_isNaN),
    .io_in_isInf(RoundAnyRawFNToRecFN_io_in_isInf),
    .io_in_isZero(RoundAnyRawFNToRecFN_io_in_isZero),
    .io_in_sign(RoundAnyRawFNToRecFN_io_in_sign),
    .io_in_sExp(RoundAnyRawFNToRecFN_io_in_sExp),
    .io_in_sig(RoundAnyRawFNToRecFN_io_in_sig),
    .io_roundingMode(RoundAnyRawFNToRecFN_io_roundingMode),
    .io_out(RoundAnyRawFNToRecFN_io_out),
    .io_exceptionFlags(RoundAnyRawFNToRecFN_io_exceptionFlags)
  );
  assign _T_9 = io_in[63:52]; 
  assign _T_10 = _T_9[11:9]; 
  assign rawIn_isZero = _T_10 == 3'h0; 
  assign _T_12 = _T_9[11:10]; 
  assign _T_13 = _T_12 == 2'h3; 
  assign _T_15 = _T_9[9]; 
  assign rawIn_isNaN = _T_13 & _T_15; 
  assign _T_18 = _T_15 == 1'h0; 
  assign _T_22 = rawIn_isZero == 1'h0; 
  assign _T_23 = io_in[51:0]; 
  assign _T_24 = {1'h0,_T_22}; 
  assign rawIn_sig = {_T_24,_T_23}; 
  assign _T_26 = rawIn_sig[51]; 
  assign _T_27 = _T_26 == 1'h0; 
  assign io_out = RoundAnyRawFNToRecFN_io_out; 
  assign io_exceptionFlags = RoundAnyRawFNToRecFN_io_exceptionFlags; 
  assign RoundAnyRawFNToRecFN_io_invalidExc = rawIn_isNaN & _T_27; 
  assign RoundAnyRawFNToRecFN_io_in_isNaN = _T_13 & _T_15; 
  assign RoundAnyRawFNToRecFN_io_in_isInf = _T_13 & _T_18; 
  assign RoundAnyRawFNToRecFN_io_in_isZero = _T_10 == 3'h0; 
  assign RoundAnyRawFNToRecFN_io_in_sign = io_in[64]; 
  assign RoundAnyRawFNToRecFN_io_in_sExp = {1'b0,$signed(_T_9)}; 
  assign RoundAnyRawFNToRecFN_io_in_sig = {_T_24,_T_23}; 
  assign RoundAnyRawFNToRecFN_io_roundingMode = io_roundingMode; 
endmodule
