module RoundRawFNToRecFN( 
  input         io_invalidExc, 
  input         io_infiniteExc, 
  input         io_in_isNaN, 
  input         io_in_isInf, 
  input         io_in_isZero, 
  input         io_in_sign, 
  input  [9:0]  io_in_sExp, 
  input  [26:0] io_in_sig, 
  input  [2:0]  io_roundingMode, 
  output [32:0] io_out, 
  output [4:0]  io_exceptionFlags 
);
  wire  roundAnyRawFNToRecFN_io_invalidExc; 
  wire  roundAnyRawFNToRecFN_io_infiniteExc; 
  wire  roundAnyRawFNToRecFN_io_in_isNaN; 
  wire  roundAnyRawFNToRecFN_io_in_isInf; 
  wire  roundAnyRawFNToRecFN_io_in_isZero; 
  wire  roundAnyRawFNToRecFN_io_in_sign; 
  wire [9:0] roundAnyRawFNToRecFN_io_in_sExp; 
  wire [26:0] roundAnyRawFNToRecFN_io_in_sig; 
  wire [2:0] roundAnyRawFNToRecFN_io_roundingMode; 
  wire  roundAnyRawFNToRecFN_io_detectTininess; 
  wire [32:0] roundAnyRawFNToRecFN_io_out; 
  wire [4:0] roundAnyRawFNToRecFN_io_exceptionFlags; 
  RoundAnyRawFNToRecFN roundAnyRawFNToRecFN ( 
    .io_invalidExc(roundAnyRawFNToRecFN_io_invalidExc),
    .io_infiniteExc(roundAnyRawFNToRecFN_io_infiniteExc),
    .io_in_isNaN(roundAnyRawFNToRecFN_io_in_isNaN),
    .io_in_isInf(roundAnyRawFNToRecFN_io_in_isInf),
    .io_in_isZero(roundAnyRawFNToRecFN_io_in_isZero),
    .io_in_sign(roundAnyRawFNToRecFN_io_in_sign),
    .io_in_sExp(roundAnyRawFNToRecFN_io_in_sExp),
    .io_in_sig(roundAnyRawFNToRecFN_io_in_sig),
    .io_roundingMode(roundAnyRawFNToRecFN_io_roundingMode),
    .io_detectTininess(roundAnyRawFNToRecFN_io_detectTininess),
    .io_out(roundAnyRawFNToRecFN_io_out),
    .io_exceptionFlags(roundAnyRawFNToRecFN_io_exceptionFlags)
  );
  assign io_out = roundAnyRawFNToRecFN_io_out; 
  assign io_exceptionFlags = roundAnyRawFNToRecFN_io_exceptionFlags; 
  assign roundAnyRawFNToRecFN_io_invalidExc = io_invalidExc; 
  assign roundAnyRawFNToRecFN_io_infiniteExc = io_infiniteExc; 
  assign roundAnyRawFNToRecFN_io_in_isNaN = io_in_isNaN; 
  assign roundAnyRawFNToRecFN_io_in_isInf = io_in_isInf; 
  assign roundAnyRawFNToRecFN_io_in_isZero = io_in_isZero; 
  assign roundAnyRawFNToRecFN_io_in_sign = io_in_sign; 
  assign roundAnyRawFNToRecFN_io_in_sExp = io_in_sExp; 
  assign roundAnyRawFNToRecFN_io_in_sig = io_in_sig; 
  assign roundAnyRawFNToRecFN_io_roundingMode = io_roundingMode; 
  assign roundAnyRawFNToRecFN_io_detectTininess = 1'h1; 
endmodule
