module FPUFMAPipe_1( 
  input         clock, 
  input         reset, 
  input         io_in_valid, 
  input         io_in_bits_ren3, 
  input         io_in_bits_swap23, 
  input  [2:0]  io_in_bits_rm, 
  input  [1:0]  io_in_bits_fmaCmd, 
  input  [64:0] io_in_bits_in1, 
  input  [64:0] io_in_bits_in2, 
  input  [64:0] io_in_bits_in3, 
  output [64:0] io_out_bits_data, 
  output [4:0]  io_out_bits_exc 
);
  wire  fma_clock; 
  wire  fma_reset; 
  wire  fma_io_validin; 
  wire [1:0] fma_io_op; 
  wire [64:0] fma_io_a; 
  wire [64:0] fma_io_b; 
  wire [64:0] fma_io_c; 
  wire [2:0] fma_io_roundingMode; 
  wire [64:0] fma_io_out; 
  wire [4:0] fma_io_exceptionFlags; 
  wire  fma_io_validout; 
  reg  valid; 
  reg [31:0] _RAND_0;
  reg [2:0] in_rm; 
  reg [31:0] _RAND_1;
  reg [1:0] in_fmaCmd; 
  reg [31:0] _RAND_2;
  reg [64:0] in_in1; 
  reg [95:0] _RAND_3;
  reg [64:0] in_in2; 
  reg [95:0] _RAND_4;
  reg [64:0] in_in3; 
  reg [95:0] _RAND_5;
  wire [64:0] _T_13; 
  wire [64:0] _T_15; 
  wire  _T_16; 
  wire  _T_17; 
  wire [64:0] _T_20; 
  wire [2:0] _T_21; 
  wire [2:0] _T_22; 
  wire  _T_23; 
  reg [64:0] _T_28_data; 
  reg [95:0] _RAND_6;
  reg [4:0] _T_28_exc; 
  reg [31:0] _RAND_7;
  wire [4:0] res_exc; 
  MulAddRecFNPipe_1 fma ( 
    .clock(fma_clock),
    .reset(fma_reset),
    .io_validin(fma_io_validin),
    .io_op(fma_io_op),
    .io_a(fma_io_a),
    .io_b(fma_io_b),
    .io_c(fma_io_c),
    .io_roundingMode(fma_io_roundingMode),
    .io_out(fma_io_out),
    .io_exceptionFlags(fma_io_exceptionFlags),
    .io_validout(fma_io_validout)
  );
  assign _T_13 = io_in_bits_in1 ^ io_in_bits_in2; 
  assign _T_15 = _T_13 & 65'h10000000000000000; 
  assign _T_16 = io_in_bits_ren3 | io_in_bits_swap23; 
  assign _T_17 = _T_16 == 1'h0; 
  assign _T_20 = fma_io_out & 65'h1efefffffffffffff; 
  assign _T_21 = fma_io_out[63:61]; 
  assign _T_22 = ~ _T_21; 
  assign _T_23 = _T_22 == 3'h0; 
  assign res_exc = fma_io_exceptionFlags; 
  assign io_out_bits_data = _T_28_data; 
  assign io_out_bits_exc = _T_28_exc; 
  assign fma_clock = clock; 
  assign fma_reset = reset; 
  assign fma_io_validin = valid; 
  assign fma_io_op = in_fmaCmd; 
  assign fma_io_a = in_in1; 
  assign fma_io_b = in_in2; 
  assign fma_io_c = in_in3; 
  assign fma_io_roundingMode = in_rm; 
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
  valid = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  in_rm = _RAND_1[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  in_fmaCmd = _RAND_2[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {3{`RANDOM}};
  in_in1 = _RAND_3[64:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {3{`RANDOM}};
  in_in2 = _RAND_4[64:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {3{`RANDOM}};
  in_in3 = _RAND_5[64:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {3{`RANDOM}};
  _T_28_data = _RAND_6[64:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  _T_28_exc = _RAND_7[4:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    valid <= io_in_valid;
    if (io_in_valid) begin
      in_rm <= io_in_bits_rm;
    end
    if (io_in_valid) begin
      in_fmaCmd <= io_in_bits_fmaCmd;
    end
    if (io_in_valid) begin
      in_in1 <= io_in_bits_in1;
    end
    if (io_in_valid) begin
      if (io_in_bits_swap23) begin
        in_in2 <= 65'h8000000000000000;
      end else begin
        in_in2 <= io_in_bits_in2;
      end
    end
    if (io_in_valid) begin
      if (_T_17) begin
        in_in3 <= _T_15;
      end else begin
        in_in3 <= io_in_bits_in3;
      end
    end
    if (fma_io_validout) begin
      if (_T_23) begin
        _T_28_data <= _T_20;
      end else begin
        _T_28_data <= fma_io_out;
      end
    end
    if (fma_io_validout) begin
      _T_28_exc <= res_exc;
    end
  end
endmodule
