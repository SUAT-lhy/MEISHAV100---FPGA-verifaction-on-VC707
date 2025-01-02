module Queue_44( 
  input         clock, 
  input         reset, 
  output        io_enq_ready, 
  input         io_enq_valid, 
  input  [63:0] io_enq_bits_data, 
  input  [7:0]  io_enq_bits_strb, 
  input         io_enq_bits_last, 
  input         io_deq_ready, 
  output        io_deq_valid, 
  output [63:0] io_deq_bits_data, 
  output [7:0]  io_deq_bits_strb, 
  output        io_deq_bits_last 
);
  reg [63:0] _T_35_data [0:0]; 
  reg [63:0] _RAND_0;
  wire [63:0] _T_35_data__T_52_data; 
  wire  _T_35_data__T_52_addr; 
  wire [63:0] _T_35_data__T_48_data; 
  wire  _T_35_data__T_48_addr; 
  wire  _T_35_data__T_48_mask; 
  wire  _T_35_data__T_48_en; 
  reg [7:0] _T_35_strb [0:0]; 
  reg [31:0] _RAND_1;
  wire [7:0] _T_35_strb__T_52_data; 
  wire  _T_35_strb__T_52_addr; 
  wire [7:0] _T_35_strb__T_48_data; 
  wire  _T_35_strb__T_48_addr; 
  wire  _T_35_strb__T_48_mask; 
  wire  _T_35_strb__T_48_en; 
  reg  _T_35_last [0:0]; 
  reg [31:0] _RAND_2;
  wire  _T_35_last__T_52_data; 
  wire  _T_35_last__T_52_addr; 
  wire  _T_35_last__T_48_data; 
  wire  _T_35_last__T_48_addr; 
  wire  _T_35_last__T_48_mask; 
  wire  _T_35_last__T_48_en; 
  reg  _T_37; 
  reg [31:0] _RAND_3;
  wire  _T_39; 
  wire  _T_42; 
  wire  _T_45; 
  wire  _GEN_9; 
  wire  _GEN_14; 
  wire  _GEN_13; 
  wire  _T_49; 
  wire  _T_50; 
  assign _T_35_data__T_52_addr = 1'h0;
  assign _T_35_data__T_52_data = _T_35_data[_T_35_data__T_52_addr]; 
  assign _T_35_data__T_48_data = io_enq_bits_data;
  assign _T_35_data__T_48_addr = 1'h0;
  assign _T_35_data__T_48_mask = 1'h1;
  assign _T_35_data__T_48_en = _T_39 ? _GEN_9 : _T_42;
  assign _T_35_strb__T_52_addr = 1'h0;
  assign _T_35_strb__T_52_data = _T_35_strb[_T_35_strb__T_52_addr]; 
  assign _T_35_strb__T_48_data = io_enq_bits_strb;
  assign _T_35_strb__T_48_addr = 1'h0;
  assign _T_35_strb__T_48_mask = 1'h1;
  assign _T_35_strb__T_48_en = _T_39 ? _GEN_9 : _T_42;
  assign _T_35_last__T_52_addr = 1'h0;
  assign _T_35_last__T_52_data = _T_35_last[_T_35_last__T_52_addr]; 
  assign _T_35_last__T_48_data = io_enq_bits_last;
  assign _T_35_last__T_48_addr = 1'h0;
  assign _T_35_last__T_48_mask = 1'h1;
  assign _T_35_last__T_48_en = _T_39 ? _GEN_9 : _T_42;
  assign _T_39 = _T_37 == 1'h0; 
  assign _T_42 = io_enq_ready & io_enq_valid; 
  assign _T_45 = io_deq_ready & io_deq_valid; 
  assign _GEN_9 = io_deq_ready ? 1'h0 : _T_42; 
  assign _GEN_14 = _T_39 ? _GEN_9 : _T_42; 
  assign _GEN_13 = _T_39 ? 1'h0 : _T_45; 
  assign _T_49 = _GEN_14 != _GEN_13; 
  assign _T_50 = _T_39 == 1'h0; 
  assign io_enq_ready = _T_37 == 1'h0; 
  assign io_deq_valid = io_enq_valid ? 1'h1 : _T_50; 
  assign io_deq_bits_data = _T_39 ? io_enq_bits_data : _T_35_data__T_52_data; 
  assign io_deq_bits_strb = _T_39 ? io_enq_bits_strb : _T_35_strb__T_52_data; 
  assign io_deq_bits_last = _T_39 ? io_enq_bits_last : _T_35_last__T_52_data; 
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
  _RAND_0 = {2{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_35_data[initvar] = _RAND_0[63:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_1 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_35_strb[initvar] = _RAND_1[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_2 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_35_last[initvar] = _RAND_2[0:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_37 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(_T_35_data__T_48_en & _T_35_data__T_48_mask) begin
      _T_35_data[_T_35_data__T_48_addr] <= _T_35_data__T_48_data; 
    end
    if(_T_35_strb__T_48_en & _T_35_strb__T_48_mask) begin
      _T_35_strb[_T_35_strb__T_48_addr] <= _T_35_strb__T_48_data; 
    end
    if(_T_35_last__T_48_en & _T_35_last__T_48_mask) begin
      _T_35_last[_T_35_last__T_48_addr] <= _T_35_last__T_48_data; 
    end
    if (reset) begin
      _T_37 <= 1'h0;
    end else begin
      if (_T_49) begin
        if (_T_39) begin
          if (io_deq_ready) begin
            _T_37 <= 1'h0;
          end else begin
            _T_37 <= _T_42;
          end
        end else begin
          _T_37 <= _T_42;
        end
      end
    end
  end
endmodule
