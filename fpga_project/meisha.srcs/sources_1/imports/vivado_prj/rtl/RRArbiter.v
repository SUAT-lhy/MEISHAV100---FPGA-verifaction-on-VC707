module RRArbiter( 
  input         clock, 
  output        io_in_0_ready, 
  input         io_in_0_valid, 
  input         io_in_0_bits_valid, 
  input  [26:0] io_in_0_bits_bits_addr, 
  output        io_in_1_ready, 
  input         io_in_1_valid, 
  input         io_in_1_bits_valid, 
  input  [26:0] io_in_1_bits_bits_addr, 
  input         io_out_ready, 
  output        io_out_valid, 
  output        io_out_bits_valid, 
  output [26:0] io_out_bits_bits_addr, 
  output        io_chosen 
);
  wire  _T_104; 
  reg  _T_106; 
  reg [31:0] _RAND_0;
  wire  _T_108; 
  wire  _T_110; 
  wire  _T_112; 
  wire  _T_114; 
  wire  _T_115; 
  wire  _T_119; 
  wire  _GEN_9; 
  assign _T_104 = io_out_ready & io_out_valid; 
  assign _T_108 = 1'h1 > _T_106; 
  assign _T_110 = io_in_1_valid & _T_108; 
  assign _T_112 = _T_110 | io_in_0_valid; 
  assign _T_114 = _T_110 == 1'h0; 
  assign _T_115 = _T_112 == 1'h0; 
  assign _T_119 = _T_108 | _T_115; 
  assign _GEN_9 = io_in_0_valid ? 1'h0 : 1'h1; 
  assign io_in_0_ready = _T_114 & io_out_ready; 
  assign io_in_1_ready = _T_119 & io_out_ready; 
  assign io_out_valid = io_chosen ? io_in_1_valid : io_in_0_valid; 
  assign io_out_bits_valid = io_chosen ? io_in_1_bits_valid : io_in_0_bits_valid; 
  assign io_out_bits_bits_addr = io_chosen ? io_in_1_bits_bits_addr : io_in_0_bits_bits_addr; 
  assign io_chosen = _T_110 ? 1'h1 : _GEN_9; 
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
  _T_106 = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (_T_104) begin
      _T_106 <= io_chosen;
    end
  end
endmodule
