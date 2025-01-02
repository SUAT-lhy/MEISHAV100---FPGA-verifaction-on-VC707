module CaptureChain( 
  input   clock, 
  input   reset, 
  input   io_chainIn_shift, 
  input   io_chainIn_data, 
  input   io_chainIn_capture, 
  input   io_chainIn_update, 
  output  io_chainOut_data 
);
  reg  regs_0; 
  reg [31:0] _RAND_0;
  reg  regs_1; 
  reg [31:0] _RAND_1;
  reg  regs_2; 
  reg [31:0] _RAND_2;
  reg  regs_3; 
  reg [31:0] _RAND_3;
  reg  regs_4; 
  reg [31:0] _RAND_4;
  reg  regs_5; 
  reg [31:0] _RAND_5;
  reg  regs_6; 
  reg [31:0] _RAND_6;
  reg  regs_7; 
  reg [31:0] _RAND_7;
  reg  regs_8; 
  reg [31:0] _RAND_8;
  reg  regs_9; 
  reg [31:0] _RAND_9;
  reg  regs_10; 
  reg [31:0] _RAND_10;
  reg  regs_11; 
  reg [31:0] _RAND_11;
  reg  regs_12; 
  reg [31:0] _RAND_12;
  reg  regs_13; 
  reg [31:0] _RAND_13;
  reg  regs_14; 
  reg [31:0] _RAND_14;
  reg  regs_15; 
  reg [31:0] _RAND_15;
  reg  regs_16; 
  reg [31:0] _RAND_16;
  reg  regs_17; 
  reg [31:0] _RAND_17;
  reg  regs_18; 
  reg [31:0] _RAND_18;
  reg  regs_19; 
  reg [31:0] _RAND_19;
  reg  regs_20; 
  reg [31:0] _RAND_20;
  reg  regs_21; 
  reg [31:0] _RAND_21;
  reg  regs_22; 
  reg [31:0] _RAND_22;
  reg  regs_23; 
  reg [31:0] _RAND_23;
  reg  regs_24; 
  reg [31:0] _RAND_24;
  reg  regs_25; 
  reg [31:0] _RAND_25;
  reg  regs_26; 
  reg [31:0] _RAND_26;
  reg  regs_27; 
  reg [31:0] _RAND_27;
  reg  regs_28; 
  reg [31:0] _RAND_28;
  reg  regs_29; 
  reg [31:0] _RAND_29;
  reg  regs_30; 
  reg [31:0] _RAND_30;
  reg  regs_31; 
  reg [31:0] _RAND_31;
  wire  _T_171; 
  wire  _T_172; 
  wire  _T_173; 
  wire  _T_174; 
  wire  _T_175; 
  wire  _T_176; 
  wire  _T_177; 
  wire  _T_178; 
  wire  _T_180; 
  wire  _T_181; 
  assign _T_171 = io_chainIn_capture & io_chainIn_update; 
  assign _T_172 = _T_171 == 1'h0; 
  assign _T_173 = io_chainIn_capture & io_chainIn_shift; 
  assign _T_174 = _T_173 == 1'h0; 
  assign _T_175 = _T_172 & _T_174; 
  assign _T_176 = io_chainIn_update & io_chainIn_shift; 
  assign _T_177 = _T_176 == 1'h0; 
  assign _T_178 = _T_175 & _T_177; 
  assign _T_180 = _T_178 | reset; 
  assign _T_181 = _T_180 == 1'h0; 
  assign io_chainOut_data = regs_0; 
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
  regs_0 = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  regs_1 = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  regs_2 = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  regs_3 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  regs_4 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  regs_5 = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  regs_6 = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  regs_7 = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  regs_8 = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  regs_9 = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  regs_10 = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  regs_11 = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  regs_12 = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  regs_13 = _RAND_13[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  regs_14 = _RAND_14[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  regs_15 = _RAND_15[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  regs_16 = _RAND_16[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  regs_17 = _RAND_17[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  regs_18 = _RAND_18[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  regs_19 = _RAND_19[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  regs_20 = _RAND_20[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{`RANDOM}};
  regs_21 = _RAND_21[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{`RANDOM}};
  regs_22 = _RAND_22[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{`RANDOM}};
  regs_23 = _RAND_23[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{`RANDOM}};
  regs_24 = _RAND_24[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{`RANDOM}};
  regs_25 = _RAND_25[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{`RANDOM}};
  regs_26 = _RAND_26[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{`RANDOM}};
  regs_27 = _RAND_27[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {1{`RANDOM}};
  regs_28 = _RAND_28[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_29 = {1{`RANDOM}};
  regs_29 = _RAND_29[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_30 = {1{`RANDOM}};
  regs_30 = _RAND_30[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_31 = {1{`RANDOM}};
  regs_31 = _RAND_31[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (io_chainIn_capture) begin
      regs_0 <= 1'h1;
    end else begin
      if (io_chainIn_shift) begin
        regs_0 <= regs_1;
      end
    end
    if (io_chainIn_capture) begin
      regs_1 <= 1'h1;
    end else begin
      if (io_chainIn_shift) begin
        regs_1 <= regs_2;
      end
    end
    if (io_chainIn_capture) begin
      regs_2 <= 1'h0;
    end else begin
      if (io_chainIn_shift) begin
        regs_2 <= regs_3;
      end
    end
    if (io_chainIn_capture) begin
      regs_3 <= 1'h0;
    end else begin
      if (io_chainIn_shift) begin
        regs_3 <= regs_4;
      end
    end
    if (io_chainIn_capture) begin
      regs_4 <= 1'h1;
    end else begin
      if (io_chainIn_shift) begin
        regs_4 <= regs_5;
      end
    end
    if (io_chainIn_capture) begin
      regs_5 <= 1'h0;
    end else begin
      if (io_chainIn_shift) begin
        regs_5 <= regs_6;
      end
    end
    if (io_chainIn_capture) begin
      regs_6 <= 1'h0;
    end else begin
      if (io_chainIn_shift) begin
        regs_6 <= regs_7;
      end
    end
    if (io_chainIn_capture) begin
      regs_7 <= 1'h0;
    end else begin
      if (io_chainIn_shift) begin
        regs_7 <= regs_8;
      end
    end
    if (io_chainIn_capture) begin
      regs_8 <= 1'h1;
    end else begin
      if (io_chainIn_shift) begin
        regs_8 <= regs_9;
      end
    end
    if (io_chainIn_capture) begin
      regs_9 <= 1'h0;
    end else begin
      if (io_chainIn_shift) begin
        regs_9 <= regs_10;
      end
    end
    if (io_chainIn_capture) begin
      regs_10 <= 1'h0;
    end else begin
      if (io_chainIn_shift) begin
        regs_10 <= regs_11;
      end
    end
    if (io_chainIn_capture) begin
      regs_11 <= 1'h1;
    end else begin
      if (io_chainIn_shift) begin
        regs_11 <= regs_12;
      end
    end
    if (io_chainIn_capture) begin
      regs_12 <= 1'h0;
    end else begin
      if (io_chainIn_shift) begin
        regs_12 <= regs_13;
      end
    end
    if (io_chainIn_capture) begin
      regs_13 <= 1'h0;
    end else begin
      if (io_chainIn_shift) begin
        regs_13 <= regs_14;
      end
    end
    if (io_chainIn_capture) begin
      regs_14 <= 1'h0;
    end else begin
      if (io_chainIn_shift) begin
        regs_14 <= regs_15;
      end
    end
    if (io_chainIn_capture) begin
      regs_15 <= 1'h0;
    end else begin
      if (io_chainIn_shift) begin
        regs_15 <= regs_16;
      end
    end
    if (io_chainIn_capture) begin
      regs_16 <= 1'h0;
    end else begin
      if (io_chainIn_shift) begin
        regs_16 <= regs_17;
      end
    end
    if (io_chainIn_capture) begin
      regs_17 <= 1'h0;
    end else begin
      if (io_chainIn_shift) begin
        regs_17 <= regs_18;
      end
    end
    if (io_chainIn_capture) begin
      regs_18 <= 1'h0;
    end else begin
      if (io_chainIn_shift) begin
        regs_18 <= regs_19;
      end
    end
    if (io_chainIn_capture) begin
      regs_19 <= 1'h0;
    end else begin
      if (io_chainIn_shift) begin
        regs_19 <= regs_20;
      end
    end
    if (io_chainIn_capture) begin
      regs_20 <= 1'h0;
    end else begin
      if (io_chainIn_shift) begin
        regs_20 <= regs_21;
      end
    end
    if (io_chainIn_capture) begin
      regs_21 <= 1'h0;
    end else begin
      if (io_chainIn_shift) begin
        regs_21 <= regs_22;
      end
    end
    if (io_chainIn_capture) begin
      regs_22 <= 1'h0;
    end else begin
      if (io_chainIn_shift) begin
        regs_22 <= regs_23;
      end
    end
    if (io_chainIn_capture) begin
      regs_23 <= 1'h0;
    end else begin
      if (io_chainIn_shift) begin
        regs_23 <= regs_24;
      end
    end
    if (io_chainIn_capture) begin
      regs_24 <= 1'h0;
    end else begin
      if (io_chainIn_shift) begin
        regs_24 <= regs_25;
      end
    end
    if (io_chainIn_capture) begin
      regs_25 <= 1'h0;
    end else begin
      if (io_chainIn_shift) begin
        regs_25 <= regs_26;
      end
    end
    if (io_chainIn_capture) begin
      regs_26 <= 1'h0;
    end else begin
      if (io_chainIn_shift) begin
        regs_26 <= regs_27;
      end
    end
    if (io_chainIn_capture) begin
      regs_27 <= 1'h0;
    end else begin
      if (io_chainIn_shift) begin
        regs_27 <= regs_28;
      end
    end
    if (io_chainIn_capture) begin
      regs_28 <= 1'h0;
    end else begin
      if (io_chainIn_shift) begin
        regs_28 <= regs_29;
      end
    end
    if (io_chainIn_capture) begin
      regs_29 <= 1'h1;
    end else begin
      if (io_chainIn_shift) begin
        regs_29 <= regs_30;
      end
    end
    if (io_chainIn_capture) begin
      regs_30 <= 1'h0;
    end else begin
      if (io_chainIn_shift) begin
        regs_30 <= regs_31;
      end
    end
    if (io_chainIn_capture) begin
      regs_31 <= 1'h0;
    end else begin
      if (io_chainIn_shift) begin
        regs_31 <= io_chainIn_data;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_181) begin
          $fwrite(32'h80000002,"Assertion failed\n    at JtagShifter.scala:119 assert(!(io.chainIn.capture && io.chainIn.update)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_181) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
