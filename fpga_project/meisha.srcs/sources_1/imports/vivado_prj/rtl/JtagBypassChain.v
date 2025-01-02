module JtagBypassChain( 
  input   clock, 
  input   reset, 
  input   io_chainIn_shift, 
  input   io_chainIn_data, 
  input   io_chainIn_capture, 
  input   io_chainIn_update, 
  output  io_chainOut_data 
);
  reg  reg$; 
  reg [31:0] _RAND_0;
  wire  _T_10; 
  wire  _T_11; 
  wire  _T_12; 
  wire  _T_13; 
  wire  _T_14; 
  wire  _T_15; 
  wire  _T_16; 
  wire  _T_17; 
  wire  _T_19; 
  wire  _T_20; 
  assign _T_10 = io_chainIn_capture & io_chainIn_update; 
  assign _T_11 = _T_10 == 1'h0; 
  assign _T_12 = io_chainIn_capture & io_chainIn_shift; 
  assign _T_13 = _T_12 == 1'h0; 
  assign _T_14 = _T_11 & _T_13; 
  assign _T_15 = io_chainIn_update & io_chainIn_shift; 
  assign _T_16 = _T_15 == 1'h0; 
  assign _T_17 = _T_14 & _T_16; 
  assign _T_19 = _T_17 | reset; 
  assign _T_20 = _T_19 == 1'h0; 
  assign io_chainOut_data = reg$; 
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  reg$ = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (io_chainIn_capture) begin
      reg$ <= 1'h0;
    end else begin
      if (io_chainIn_shift) begin
        reg$ <= io_chainIn_data;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_20) begin
          $fwrite(32'h80000002,"Assertion failed\n    at JtagShifter.scala:74 assert(!(io.chainIn.capture && io.chainIn.update)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_20) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
