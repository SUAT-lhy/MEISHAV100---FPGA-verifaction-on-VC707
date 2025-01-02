module Repeater_2( 
  input         clock, 
  input         reset, 
  input         io_repeat, 
  output        io_full, 
  output        io_enq_ready, 
  input         io_enq_valid, 
  input  [2:0]  io_enq_bits_opcode, 
  input  [2:0]  io_enq_bits_param, 
  input  [2:0]  io_enq_bits_size, 
  input  [4:0]  io_enq_bits_source, 
  input  [11:0] io_enq_bits_address, 
  input  [7:0]  io_enq_bits_mask, 
  input         io_enq_bits_corrupt, 
  input         io_deq_ready, 
  output        io_deq_valid, 
  output [2:0]  io_deq_bits_opcode, 
  output [2:0]  io_deq_bits_param, 
  output [2:0]  io_deq_bits_size, 
  output [4:0]  io_deq_bits_source, 
  output [11:0] io_deq_bits_address, 
  output [7:0]  io_deq_bits_mask, 
  output        io_deq_bits_corrupt 
);
  reg  full; 
  reg [31:0] _RAND_0;
  reg [2:0] saved_opcode; 
  reg [31:0] _RAND_1;
  reg [2:0] saved_param; 
  reg [31:0] _RAND_2;
  reg [2:0] saved_size; 
  reg [31:0] _RAND_3;
  reg [4:0] saved_source; 
  reg [31:0] _RAND_4;
  reg [11:0] saved_address; 
  reg [31:0] _RAND_5;
  reg [7:0] saved_mask; 
  reg [31:0] _RAND_6;
  reg  saved_corrupt; 
  reg [31:0] _RAND_7;
  wire  _T_18; 
  wire  _T_21; 
  wire  _T_22; 
  wire  _T_23; 
  wire  _T_24; 
  wire  _T_25; 
  assign _T_18 = full == 1'h0; 
  assign _T_21 = io_enq_ready & io_enq_valid; 
  assign _T_22 = _T_21 & io_repeat; 
  assign _T_23 = io_deq_ready & io_deq_valid; 
  assign _T_24 = io_repeat == 1'h0; 
  assign _T_25 = _T_23 & _T_24; 
  assign io_full = full; 
  assign io_enq_ready = io_deq_ready & _T_18; 
  assign io_deq_valid = io_enq_valid | full; 
  assign io_deq_bits_opcode = full ? saved_opcode : io_enq_bits_opcode; 
  assign io_deq_bits_param = full ? saved_param : io_enq_bits_param; 
  assign io_deq_bits_size = full ? saved_size : io_enq_bits_size; 
  assign io_deq_bits_source = full ? saved_source : io_enq_bits_source; 
  assign io_deq_bits_address = full ? saved_address : io_enq_bits_address; 
  assign io_deq_bits_mask = full ? saved_mask : io_enq_bits_mask; 
  assign io_deq_bits_corrupt = full ? saved_corrupt : io_enq_bits_corrupt; 
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
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  saved_opcode = _RAND_1[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  saved_param = _RAND_2[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  saved_size = _RAND_3[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  saved_source = _RAND_4[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  saved_address = _RAND_5[11:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  saved_mask = _RAND_6[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  saved_corrupt = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      full <= 1'h0;
    end else begin
      if (_T_25) begin
        full <= 1'h0;
      end else begin
        if (_T_22) begin
          full <= 1'h1;
        end
      end
    end
    if (_T_22) begin
      saved_opcode <= io_enq_bits_opcode;
    end
    if (_T_22) begin
      saved_param <= io_enq_bits_param;
    end
    if (_T_22) begin
      saved_size <= io_enq_bits_size;
    end
    if (_T_22) begin
      saved_source <= io_enq_bits_source;
    end
    if (_T_22) begin
      saved_address <= io_enq_bits_address;
    end
    if (_T_22) begin
      saved_mask <= io_enq_bits_mask;
    end
    if (_T_22) begin
      saved_corrupt <= io_enq_bits_corrupt;
    end
  end
endmodule
