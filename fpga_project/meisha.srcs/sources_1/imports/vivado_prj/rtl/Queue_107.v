module Queue_107( 
  input        clock, 
  input        reset, 
  output       io_enq_ready, 
  input        io_enq_valid, 
  input  [8:0] io_enq_bits, 
  input        io_deq_ready, 
  output       io_deq_valid, 
  output [8:0] io_deq_bits 
);
  reg [8:0] _T_35 [0:15]; 
  reg [31:0] _RAND_0;
  wire [8:0] _T_35__T_58_data; 
  wire [3:0] _T_35__T_58_addr; 
  wire [8:0] _T_35__T_50_data; 
  wire [3:0] _T_35__T_50_addr; 
  wire  _T_35__T_50_mask; 
  wire  _T_35__T_50_en; 
  reg [3:0] value; 
  reg [31:0] _RAND_1;
  reg [3:0] value_1; 
  reg [31:0] _RAND_2;
  reg  _T_39; 
  reg [31:0] _RAND_3;
  wire  _T_40; 
  wire  _T_41; 
  wire  _T_42; 
  wire  _T_43; 
  wire  _T_44; 
  wire  _T_47; 
  wire [3:0] _T_52; 
  wire [3:0] _T_54; 
  wire  _T_55; 
  assign _T_35__T_58_addr = value_1;
  assign _T_35__T_58_data = _T_35[_T_35__T_58_addr]; 
  assign _T_35__T_50_data = io_enq_bits;
  assign _T_35__T_50_addr = value;
  assign _T_35__T_50_mask = 1'h1;
  assign _T_35__T_50_en = io_enq_ready & io_enq_valid;
  assign _T_40 = value == value_1; 
  assign _T_41 = _T_39 == 1'h0; 
  assign _T_42 = _T_40 & _T_41; 
  assign _T_43 = _T_40 & _T_39; 
  assign _T_44 = io_enq_ready & io_enq_valid; 
  assign _T_47 = io_deq_ready & io_deq_valid; 
  assign _T_52 = value + 4'h1; 
  assign _T_54 = value_1 + 4'h1; 
  assign _T_55 = _T_44 != _T_47; 
  assign io_enq_ready = _T_43 == 1'h0; 
  assign io_deq_valid = _T_42 == 1'h0; 
  assign io_deq_bits = _T_35__T_58_data; 
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
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    _T_35[initvar] = _RAND_0[8:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  value = _RAND_1[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  value_1 = _RAND_2[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_39 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(_T_35__T_50_en & _T_35__T_50_mask) begin
      _T_35[_T_35__T_50_addr] <= _T_35__T_50_data; 
    end
    if (reset) begin
      value <= 4'h0;
    end else begin
      if (_T_44) begin
        value <= _T_52;
      end
    end
    if (reset) begin
      value_1 <= 4'h0;
    end else begin
      if (_T_47) begin
        value_1 <= _T_54;
      end
    end
    if (reset) begin
      _T_39 <= 1'h0;
    end else begin
      if (_T_55) begin
        _T_39 <= _T_44;
      end
    end
  end
endmodule
