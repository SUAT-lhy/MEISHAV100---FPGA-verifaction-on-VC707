module Repeater_4( 
  input         clock, 
  input         reset, 
  output        io_enq_ready, 
  input         io_enq_valid, 
  input  [2:0]  io_enq_bits_opcode, 
  input  [2:0]  io_enq_bits_param, 
  input  [2:0]  io_enq_bits_size, 
  input  [4:0]  io_enq_bits_source, 
  input  [16:0] io_enq_bits_address, 
  input  [7:0]  io_enq_bits_mask, 
  input         io_enq_bits_corrupt, 
  input         io_deq_ready, 
  output        io_deq_valid, 
  output [2:0]  io_deq_bits_opcode, 
  output [2:0]  io_deq_bits_param, 
  output [2:0]  io_deq_bits_size, 
  output [4:0]  io_deq_bits_source, 
  output [16:0] io_deq_bits_address, 
  output [7:0]  io_deq_bits_mask, 
  output        io_deq_bits_corrupt 
);
  reg  full; 
  reg [31:0] _RAND_0;
  wire  _T_18; 
  wire  _T_23; 
  assign _T_18 = full == 1'h0; 
  assign _T_23 = io_deq_ready & io_deq_valid; 
  assign io_enq_ready = io_deq_ready & _T_18; 
  assign io_deq_valid = io_enq_valid | full; 
  assign io_deq_bits_opcode = full ? 3'h0 : io_enq_bits_opcode; 
  assign io_deq_bits_param = full ? 3'h0 : io_enq_bits_param; 
  assign io_deq_bits_size = full ? 3'h0 : io_enq_bits_size; 
  assign io_deq_bits_source = full ? 5'h0 : io_enq_bits_source; 
  assign io_deq_bits_address = full ? 17'h0 : io_enq_bits_address; 
  assign io_deq_bits_mask = full ? 8'h0 : io_enq_bits_mask; 
  assign io_deq_bits_corrupt = full ? 1'h0 : io_enq_bits_corrupt; 
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
  full = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      full <= 1'h0;
    end else begin
      if (_T_23) begin
        full <= 1'h0;
      end
    end
  end
endmodule
