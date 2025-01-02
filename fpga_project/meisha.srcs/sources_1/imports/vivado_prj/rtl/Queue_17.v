module Queue_17( 
  input         clock, 
  input         reset, 
  output        io_enq_ready, 
  input         io_enq_valid, 
  input         io_enq_bits_read, 
  input  [22:0] io_enq_bits_index, 
  input  [63:0] io_enq_bits_data, 
  input  [7:0]  io_enq_bits_mask, 
  input  [10:0] io_enq_bits_extra, 
  input         io_deq_ready, 
  output        io_deq_valid, 
  output        io_deq_bits_read, 
  output [22:0] io_deq_bits_index, 
  output [63:0] io_deq_bits_data, 
  output [7:0]  io_deq_bits_mask, 
  output [10:0] io_deq_bits_extra 
);
  reg  _T_35_read [0:0]; 
  reg [31:0] _RAND_0;
  wire  _T_35_read__T_52_data; 
  wire  _T_35_read__T_52_addr; 
  wire  _T_35_read__T_48_data; 
  wire  _T_35_read__T_48_addr; 
  wire  _T_35_read__T_48_mask; 
  wire  _T_35_read__T_48_en; 
  reg [22:0] _T_35_index [0:0]; 
  reg [31:0] _RAND_1;
  wire [22:0] _T_35_index__T_52_data; 
  wire  _T_35_index__T_52_addr; 
  wire [22:0] _T_35_index__T_48_data; 
  wire  _T_35_index__T_48_addr; 
  wire  _T_35_index__T_48_mask; 
  wire  _T_35_index__T_48_en; 
  reg [63:0] _T_35_data [0:0]; 
  reg [63:0] _RAND_2;
  wire [63:0] _T_35_data__T_52_data; 
  wire  _T_35_data__T_52_addr; 
  wire [63:0] _T_35_data__T_48_data; 
  wire  _T_35_data__T_48_addr; 
  wire  _T_35_data__T_48_mask; 
  wire  _T_35_data__T_48_en; 
  reg [7:0] _T_35_mask [0:0]; 
  reg [31:0] _RAND_3;
  wire [7:0] _T_35_mask__T_52_data; 
  wire  _T_35_mask__T_52_addr; 
  wire [7:0] _T_35_mask__T_48_data; 
  wire  _T_35_mask__T_48_addr; 
  wire  _T_35_mask__T_48_mask; 
  wire  _T_35_mask__T_48_en; 
  reg [10:0] _T_35_extra [0:0]; 
  reg [31:0] _RAND_4;
  wire [10:0] _T_35_extra__T_52_data; 
  wire  _T_35_extra__T_52_addr; 
  wire [10:0] _T_35_extra__T_48_data; 
  wire  _T_35_extra__T_48_addr; 
  wire  _T_35_extra__T_48_mask; 
  wire  _T_35_extra__T_48_en; 
  reg  _T_37; 
  reg [31:0] _RAND_5;
  wire  _T_39; 
  wire  _T_42; 
  wire  _T_45; 
  wire  _T_49; 
  assign _T_35_read__T_52_addr = 1'h0;
  assign _T_35_read__T_52_data = _T_35_read[_T_35_read__T_52_addr]; 
  assign _T_35_read__T_48_data = io_enq_bits_read;
  assign _T_35_read__T_48_addr = 1'h0;
  assign _T_35_read__T_48_mask = 1'h1;
  assign _T_35_read__T_48_en = io_enq_ready & io_enq_valid;
  assign _T_35_index__T_52_addr = 1'h0;
  assign _T_35_index__T_52_data = _T_35_index[_T_35_index__T_52_addr]; 
  assign _T_35_index__T_48_data = io_enq_bits_index;
  assign _T_35_index__T_48_addr = 1'h0;
  assign _T_35_index__T_48_mask = 1'h1;
  assign _T_35_index__T_48_en = io_enq_ready & io_enq_valid;
  assign _T_35_data__T_52_addr = 1'h0;
  assign _T_35_data__T_52_data = _T_35_data[_T_35_data__T_52_addr]; 
  assign _T_35_data__T_48_data = io_enq_bits_data;
  assign _T_35_data__T_48_addr = 1'h0;
  assign _T_35_data__T_48_mask = 1'h1;
  assign _T_35_data__T_48_en = io_enq_ready & io_enq_valid;
  assign _T_35_mask__T_52_addr = 1'h0;
  assign _T_35_mask__T_52_data = _T_35_mask[_T_35_mask__T_52_addr]; 
  assign _T_35_mask__T_48_data = io_enq_bits_mask;
  assign _T_35_mask__T_48_addr = 1'h0;
  assign _T_35_mask__T_48_mask = 1'h1;
  assign _T_35_mask__T_48_en = io_enq_ready & io_enq_valid;
  assign _T_35_extra__T_52_addr = 1'h0;
  assign _T_35_extra__T_52_data = _T_35_extra[_T_35_extra__T_52_addr]; 
  assign _T_35_extra__T_48_data = io_enq_bits_extra;
  assign _T_35_extra__T_48_addr = 1'h0;
  assign _T_35_extra__T_48_mask = 1'h1;
  assign _T_35_extra__T_48_en = io_enq_ready & io_enq_valid;
  assign _T_39 = _T_37 == 1'h0; 
  assign _T_42 = io_enq_ready & io_enq_valid; 
  assign _T_45 = io_deq_ready & io_deq_valid; 
  assign _T_49 = _T_42 != _T_45; 
  assign io_enq_ready = _T_37 == 1'h0; 
  assign io_deq_valid = _T_39 == 1'h0; 
  assign io_deq_bits_read = _T_35_read__T_52_data; 
  assign io_deq_bits_index = _T_35_index__T_52_data; 
  assign io_deq_bits_data = _T_35_data__T_52_data; 
  assign io_deq_bits_mask = _T_35_mask__T_52_data; 
  assign io_deq_bits_extra = _T_35_extra__T_52_data; 
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
  _RAND_0 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_35_read[initvar] = _RAND_0[0:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_1 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_35_index[initvar] = _RAND_1[22:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_2 = {2{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_35_data[initvar] = _RAND_2[63:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_3 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_35_mask[initvar] = _RAND_3[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_4 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_35_extra[initvar] = _RAND_4[10:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_37 = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(_T_35_read__T_48_en & _T_35_read__T_48_mask) begin
      _T_35_read[_T_35_read__T_48_addr] <= _T_35_read__T_48_data; 
    end
    if(_T_35_index__T_48_en & _T_35_index__T_48_mask) begin
      _T_35_index[_T_35_index__T_48_addr] <= _T_35_index__T_48_data; 
    end
    if(_T_35_data__T_48_en & _T_35_data__T_48_mask) begin
      _T_35_data[_T_35_data__T_48_addr] <= _T_35_data__T_48_data; 
    end
    if(_T_35_mask__T_48_en & _T_35_mask__T_48_mask) begin
      _T_35_mask[_T_35_mask__T_48_addr] <= _T_35_mask__T_48_data; 
    end
    if(_T_35_extra__T_48_en & _T_35_extra__T_48_mask) begin
      _T_35_extra[_T_35_extra__T_48_addr] <= _T_35_extra__T_48_data; 
    end
    if (reset) begin
      _T_37 <= 1'h0;
    end else begin
      if (_T_49) begin
        _T_37 <= _T_42;
      end
    end
  end
endmodule
