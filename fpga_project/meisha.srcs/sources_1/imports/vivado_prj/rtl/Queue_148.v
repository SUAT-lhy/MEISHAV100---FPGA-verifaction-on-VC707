module Queue_148( 
  input         clock, 
  input         reset, 
  output        io_enq_ready, 
  input         io_enq_valid, 
  input  [37:0] io_enq_bits_addr, 
  input  [13:0] io_enq_bits_user, 
  input         io_enq_bits_wen, 
  input         io_deq_ready, 
  output        io_deq_valid, 
  output [37:0] io_deq_bits_addr, 
  output [13:0] io_deq_bits_user, 
  output        io_deq_bits_wen 
);
  reg [37:0] _T_35_addr [0:0]; 
  reg [63:0] _RAND_0;
  wire [37:0] _T_35_addr__T_52_data; 
  wire  _T_35_addr__T_52_addr; 
  wire [37:0] _T_35_addr__T_48_data; 
  wire  _T_35_addr__T_48_addr; 
  wire  _T_35_addr__T_48_mask; 
  wire  _T_35_addr__T_48_en; 
  reg [13:0] _T_35_user [0:0]; 
  reg [31:0] _RAND_1;
  wire [13:0] _T_35_user__T_52_data; 
  wire  _T_35_user__T_52_addr; 
  wire [13:0] _T_35_user__T_48_data; 
  wire  _T_35_user__T_48_addr; 
  wire  _T_35_user__T_48_mask; 
  wire  _T_35_user__T_48_en; 
  reg  _T_35_wen [0:0]; 
  reg [31:0] _RAND_2;
  wire  _T_35_wen__T_52_data; 
  wire  _T_35_wen__T_52_addr; 
  wire  _T_35_wen__T_48_data; 
  wire  _T_35_wen__T_48_addr; 
  wire  _T_35_wen__T_48_mask; 
  wire  _T_35_wen__T_48_en; 
  reg  _T_37; 
  reg [31:0] _RAND_3;
  wire  _T_39; 
  wire  _T_42; 
  wire  _T_45; 
  wire  _GEN_17; 
  wire  _GEN_30; 
  wire  _GEN_29; 
  wire  _T_49; 
  wire  _T_50; 
  assign _T_35_addr__T_52_addr = 1'h0;
  assign _T_35_addr__T_52_data = _T_35_addr[_T_35_addr__T_52_addr]; 
  assign _T_35_addr__T_48_data = io_enq_bits_addr;
  assign _T_35_addr__T_48_addr = 1'h0;
  assign _T_35_addr__T_48_mask = 1'h1;
  assign _T_35_addr__T_48_en = _T_39 ? _GEN_17 : _T_42;
  assign _T_35_user__T_52_addr = 1'h0;
  assign _T_35_user__T_52_data = _T_35_user[_T_35_user__T_52_addr]; 
  assign _T_35_user__T_48_data = io_enq_bits_user;
  assign _T_35_user__T_48_addr = 1'h0;
  assign _T_35_user__T_48_mask = 1'h1;
  assign _T_35_user__T_48_en = _T_39 ? _GEN_17 : _T_42;
  assign _T_35_wen__T_52_addr = 1'h0;
  assign _T_35_wen__T_52_data = _T_35_wen[_T_35_wen__T_52_addr]; 
  assign _T_35_wen__T_48_data = io_enq_bits_wen;
  assign _T_35_wen__T_48_addr = 1'h0;
  assign _T_35_wen__T_48_mask = 1'h1;
  assign _T_35_wen__T_48_en = _T_39 ? _GEN_17 : _T_42;
  assign _T_39 = _T_37 == 1'h0; 
  assign _T_42 = io_enq_ready & io_enq_valid; 
  assign _T_45 = io_deq_ready & io_deq_valid; 
  assign _GEN_17 = io_deq_ready ? 1'h0 : _T_42; 
  assign _GEN_30 = _T_39 ? _GEN_17 : _T_42; 
  assign _GEN_29 = _T_39 ? 1'h0 : _T_45; 
  assign _T_49 = _GEN_30 != _GEN_29; 
  assign _T_50 = _T_39 == 1'h0; 
  assign io_enq_ready = _T_37 == 1'h0; 
  assign io_deq_valid = io_enq_valid ? 1'h1 : _T_50; 
  assign io_deq_bits_addr = _T_39 ? io_enq_bits_addr : _T_35_addr__T_52_data; 
  assign io_deq_bits_user = _T_39 ? io_enq_bits_user : _T_35_user__T_52_data; 
  assign io_deq_bits_wen = _T_39 ? io_enq_bits_wen : _T_35_wen__T_52_data; 
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
    _T_35_addr[initvar] = _RAND_0[37:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_1 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_35_user[initvar] = _RAND_1[13:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_2 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_35_wen[initvar] = _RAND_2[0:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_37 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(_T_35_addr__T_48_en & _T_35_addr__T_48_mask) begin
      _T_35_addr[_T_35_addr__T_48_addr] <= _T_35_addr__T_48_data; 
    end
    if(_T_35_user__T_48_en & _T_35_user__T_48_mask) begin
      _T_35_user[_T_35_user__T_48_addr] <= _T_35_user__T_48_data; 
    end
    if(_T_35_wen__T_48_en & _T_35_wen__T_48_mask) begin
      _T_35_wen[_T_35_wen__T_48_addr] <= _T_35_wen__T_48_data; 
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
