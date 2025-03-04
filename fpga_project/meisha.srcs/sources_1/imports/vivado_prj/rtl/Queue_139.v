module Queue_139( 
  input         clock, 
  input         reset, 
  output        io_enq_ready, 
  input         io_enq_valid, 
  input  [3:0]  io_enq_bits_id, 
  input  [30:0] io_enq_bits_addr, 
  input  [7:0]  io_enq_bits_len, 
  input  [2:0]  io_enq_bits_size, 
  input  [8:0]  io_enq_bits_user, 
  input         io_enq_bits_wen, 
  input         io_deq_ready, 
  output        io_deq_valid, 
  output [3:0]  io_deq_bits_id, 
  output [30:0] io_deq_bits_addr, 
  output [7:0]  io_deq_bits_len, 
  output [2:0]  io_deq_bits_size, 
  output [1:0]  io_deq_bits_burst, 
  output [8:0]  io_deq_bits_user, 
  output        io_deq_bits_wen 
);
  reg [3:0] _T_35_id [0:0]; 
  reg [31:0] _RAND_0;
  wire [3:0] _T_35_id__T_52_data; 
  wire  _T_35_id__T_52_addr; 
  wire [3:0] _T_35_id__T_48_data; 
  wire  _T_35_id__T_48_addr; 
  wire  _T_35_id__T_48_mask; 
  wire  _T_35_id__T_48_en; 
  reg [30:0] _T_35_addr [0:0]; 
  reg [31:0] _RAND_1;
  wire [30:0] _T_35_addr__T_52_data; 
  wire  _T_35_addr__T_52_addr; 
  wire [30:0] _T_35_addr__T_48_data; 
  wire  _T_35_addr__T_48_addr; 
  wire  _T_35_addr__T_48_mask; 
  wire  _T_35_addr__T_48_en; 
  reg [7:0] _T_35_len [0:0]; 
  reg [31:0] _RAND_2;
  wire [7:0] _T_35_len__T_52_data; 
  wire  _T_35_len__T_52_addr; 
  wire [7:0] _T_35_len__T_48_data; 
  wire  _T_35_len__T_48_addr; 
  wire  _T_35_len__T_48_mask; 
  wire  _T_35_len__T_48_en; 
  reg [2:0] _T_35_size [0:0]; 
  reg [31:0] _RAND_3;
  wire [2:0] _T_35_size__T_52_data; 
  wire  _T_35_size__T_52_addr; 
  wire [2:0] _T_35_size__T_48_data; 
  wire  _T_35_size__T_48_addr; 
  wire  _T_35_size__T_48_mask; 
  wire  _T_35_size__T_48_en; 
  reg [1:0] _T_35_burst [0:0]; 
  reg [31:0] _RAND_4;
  wire [1:0] _T_35_burst__T_52_data; 
  wire  _T_35_burst__T_52_addr; 
  wire [1:0] _T_35_burst__T_48_data; 
  wire  _T_35_burst__T_48_addr; 
  wire  _T_35_burst__T_48_mask; 
  wire  _T_35_burst__T_48_en; 
  reg [8:0] _T_35_user [0:0]; 
  reg [31:0] _RAND_5;
  wire [8:0] _T_35_user__T_52_data; 
  wire  _T_35_user__T_52_addr; 
  wire [8:0] _T_35_user__T_48_data; 
  wire  _T_35_user__T_48_addr; 
  wire  _T_35_user__T_48_mask; 
  wire  _T_35_user__T_48_en; 
  reg  _T_35_wen [0:0]; 
  reg [31:0] _RAND_6;
  wire  _T_35_wen__T_52_data; 
  wire  _T_35_wen__T_52_addr; 
  wire  _T_35_wen__T_48_data; 
  wire  _T_35_wen__T_48_addr; 
  wire  _T_35_wen__T_48_mask; 
  wire  _T_35_wen__T_48_en; 
  reg  _T_37; 
  reg [31:0] _RAND_7;
  wire  _T_39; 
  wire  _T_42; 
  wire  _T_45; 
  wire  _GEN_17; 
  wire  _GEN_30; 
  wire  _GEN_29; 
  wire  _T_49; 
  wire  _T_50; 
  assign _T_35_id__T_52_addr = 1'h0;
  assign _T_35_id__T_52_data = _T_35_id[_T_35_id__T_52_addr]; 
  assign _T_35_id__T_48_data = io_enq_bits_id;
  assign _T_35_id__T_48_addr = 1'h0;
  assign _T_35_id__T_48_mask = 1'h1;
  assign _T_35_id__T_48_en = _T_39 ? _GEN_17 : _T_42;
  assign _T_35_addr__T_52_addr = 1'h0;
  assign _T_35_addr__T_52_data = _T_35_addr[_T_35_addr__T_52_addr]; 
  assign _T_35_addr__T_48_data = io_enq_bits_addr;
  assign _T_35_addr__T_48_addr = 1'h0;
  assign _T_35_addr__T_48_mask = 1'h1;
  assign _T_35_addr__T_48_en = _T_39 ? _GEN_17 : _T_42;
  assign _T_35_len__T_52_addr = 1'h0;
  assign _T_35_len__T_52_data = _T_35_len[_T_35_len__T_52_addr]; 
  assign _T_35_len__T_48_data = io_enq_bits_len;
  assign _T_35_len__T_48_addr = 1'h0;
  assign _T_35_len__T_48_mask = 1'h1;
  assign _T_35_len__T_48_en = _T_39 ? _GEN_17 : _T_42;
  assign _T_35_size__T_52_addr = 1'h0;
  assign _T_35_size__T_52_data = _T_35_size[_T_35_size__T_52_addr]; 
  assign _T_35_size__T_48_data = io_enq_bits_size;
  assign _T_35_size__T_48_addr = 1'h0;
  assign _T_35_size__T_48_mask = 1'h1;
  assign _T_35_size__T_48_en = _T_39 ? _GEN_17 : _T_42;
  assign _T_35_burst__T_52_addr = 1'h0;
  assign _T_35_burst__T_52_data = _T_35_burst[_T_35_burst__T_52_addr]; 
  assign _T_35_burst__T_48_data = 2'h1;
  assign _T_35_burst__T_48_addr = 1'h0;
  assign _T_35_burst__T_48_mask = 1'h1;
  assign _T_35_burst__T_48_en = _T_39 ? _GEN_17 : _T_42;
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
  assign io_deq_bits_id = _T_39 ? io_enq_bits_id : _T_35_id__T_52_data; 
  assign io_deq_bits_addr = _T_39 ? io_enq_bits_addr : _T_35_addr__T_52_data; 
  assign io_deq_bits_len = _T_39 ? io_enq_bits_len : _T_35_len__T_52_data; 
  assign io_deq_bits_size = _T_39 ? io_enq_bits_size : _T_35_size__T_52_data; 
  assign io_deq_bits_burst = _T_39 ? 2'h1 : _T_35_burst__T_52_data; 
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
  _RAND_0 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_35_id[initvar] = _RAND_0[3:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_1 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_35_addr[initvar] = _RAND_1[30:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_2 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_35_len[initvar] = _RAND_2[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_3 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_35_size[initvar] = _RAND_3[2:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_4 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_35_burst[initvar] = _RAND_4[1:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_5 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_35_user[initvar] = _RAND_5[8:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_6 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_35_wen[initvar] = _RAND_6[0:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  _T_37 = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(_T_35_id__T_48_en & _T_35_id__T_48_mask) begin
      _T_35_id[_T_35_id__T_48_addr] <= _T_35_id__T_48_data; 
    end
    if(_T_35_addr__T_48_en & _T_35_addr__T_48_mask) begin
      _T_35_addr[_T_35_addr__T_48_addr] <= _T_35_addr__T_48_data; 
    end
    if(_T_35_len__T_48_en & _T_35_len__T_48_mask) begin
      _T_35_len[_T_35_len__T_48_addr] <= _T_35_len__T_48_data; 
    end
    if(_T_35_size__T_48_en & _T_35_size__T_48_mask) begin
      _T_35_size[_T_35_size__T_48_addr] <= _T_35_size__T_48_data; 
    end
    if(_T_35_burst__T_48_en & _T_35_burst__T_48_mask) begin
      _T_35_burst[_T_35_burst__T_48_addr] <= _T_35_burst__T_48_data; 
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
