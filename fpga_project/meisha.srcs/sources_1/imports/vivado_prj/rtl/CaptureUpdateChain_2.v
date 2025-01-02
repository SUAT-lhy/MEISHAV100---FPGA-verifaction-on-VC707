module CaptureUpdateChain_2( 
  input        clock, 
  input        reset, 
  input        io_chainIn_shift, 
  input        io_chainIn_data, 
  input        io_chainIn_capture, 
  input        io_chainIn_update, 
  output       io_chainOut_data, 
  output [4:0] io_update_bits 
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
  wire [1:0] _T_18; 
  wire [1:0] _T_19; 
  wire [2:0] _T_20; 
  wire  _T_29; 
  wire  _T_30; 
  wire  _T_31; 
  wire  _T_32; 
  wire  _T_33; 
  wire  _T_34; 
  wire  _T_35; 
  wire  _T_36; 
  wire  _T_38; 
  wire  _T_39; 
  assign _T_18 = {regs_1,regs_0}; 
  assign _T_19 = {regs_4,regs_3}; 
  assign _T_20 = {_T_19,regs_2}; 
  assign _T_29 = io_chainIn_capture & io_chainIn_update; 
  assign _T_30 = _T_29 == 1'h0; 
  assign _T_31 = io_chainIn_capture & io_chainIn_shift; 
  assign _T_32 = _T_31 == 1'h0; 
  assign _T_33 = _T_30 & _T_32; 
  assign _T_34 = io_chainIn_update & io_chainIn_shift; 
  assign _T_35 = _T_34 == 1'h0; 
  assign _T_36 = _T_33 & _T_35; 
  assign _T_38 = _T_36 | reset; 
  assign _T_39 = _T_38 == 1'h0; 
  assign io_chainOut_data = regs_0; 
  assign io_update_bits = {_T_20,_T_18}; 
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
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (io_chainIn_capture) begin
      regs_0 <= 1'h1;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_0 <= regs_1;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_1 <= 1'h0;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_1 <= regs_2;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_2 <= 1'h0;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_2 <= regs_3;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_3 <= 1'h0;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_3 <= regs_4;
        end
      end
    end
    if (io_chainIn_capture) begin
      regs_4 <= 1'h0;
    end else begin
      if (!(io_chainIn_update)) begin
        if (io_chainIn_shift) begin
          regs_4 <= io_chainIn_data;
        end
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_39) begin
          $fwrite(32'h80000002,"Assertion failed\n    at JtagShifter.scala:185 assert(!(io.chainIn.capture && io.chainIn.update)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_39) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
