module Queue_99( 
  input        clock, 
  input        reset, 
  output       io_enq_ready, 
  input        io_enq_valid, 
  input  [8:0] io_enq_bits, 
  input        io_deq_ready, 
  output       io_deq_valid, 
  output [8:0] io_deq_bits 
);
  reg [8:0] _T_35 [0:0]; 
  reg [31:0] _RAND_0;
  wire [8:0] _T_35__T_52_data; 
  wire  _T_35__T_52_addr; 
  wire [8:0] _T_35__T_48_data; 
  wire  _T_35__T_48_addr; 
  wire  _T_35__T_48_mask; 
  wire  _T_35__T_48_en; 
  reg  _T_37; 
  reg [31:0] _RAND_1;
  wire  _T_39; 
  wire  _T_42; 
  wire  _T_45; 
  wire  _T_49; 
  assign _T_35__T_52_addr = 1'h0;
  assign _T_35__T_52_data = _T_35[_T_35__T_52_addr]; 
  assign _T_35__T_48_data = io_enq_bits;
  assign _T_35__T_48_addr = 1'h0;
  assign _T_35__T_48_mask = 1'h1;
  assign _T_35__T_48_en = io_enq_ready & io_enq_valid;
  assign _T_39 = _T_37 == 1'h0; 
  assign _T_42 = io_enq_ready & io_enq_valid; 
  assign _T_45 = io_deq_ready & io_deq_valid; 
  assign _T_49 = _T_42 != _T_45; 
  assign io_enq_ready = _T_37 == 1'h0; 
  assign io_deq_valid = _T_39 == 1'h0; 
  assign io_deq_bits = _T_35__T_52_data; 
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
    _T_35[initvar] = _RAND_0[8:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T_37 = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(_T_35__T_48_en & _T_35__T_48_mask) begin
      _T_35[_T_35__T_48_addr] <= _T_35__T_48_data; 
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
