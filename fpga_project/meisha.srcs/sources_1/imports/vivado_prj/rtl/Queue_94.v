module Queue_94( 
  input         clock, 
  input         reset, 
  output        io_enq_ready, 
  input         io_enq_valid, 
  input  [3:0]  io_enq_bits_id, 
  input  [30:0] io_enq_bits_addr, 
  input  [7:0]  io_enq_bits_len, 
  input  [2:0]  io_enq_bits_size, 
  input  [1:0]  io_enq_bits_burst, 
  input         io_deq_ready, 
  output        io_deq_valid, 
  output [3:0]  io_deq_bits_id, 
  output [30:0] io_deq_bits_addr, 
  output [7:0]  io_deq_bits_len, 
  output [2:0]  io_deq_bits_size, 
  output [1:0]  io_deq_bits_burst 
);
  reg [3:0] _T_35_id [0:1]; 
  reg [31:0] _RAND_0;
  wire [3:0] _T_35_id__T_58_data; 
  wire  _T_35_id__T_58_addr; 
  wire [3:0] _T_35_id__T_50_data; 
  wire  _T_35_id__T_50_addr; 
  wire  _T_35_id__T_50_mask; 
  wire  _T_35_id__T_50_en; 
  reg [30:0] _T_35_addr [0:1]; 
  reg [31:0] _RAND_1;
  wire [30:0] _T_35_addr__T_58_data; 
  wire  _T_35_addr__T_58_addr; 
  wire [30:0] _T_35_addr__T_50_data; 
  wire  _T_35_addr__T_50_addr; 
  wire  _T_35_addr__T_50_mask; 
  wire  _T_35_addr__T_50_en; 
  reg [7:0] _T_35_len [0:1]; 
  reg [31:0] _RAND_2;
  wire [7:0] _T_35_len__T_58_data; 
  wire  _T_35_len__T_58_addr; 
  wire [7:0] _T_35_len__T_50_data; 
  wire  _T_35_len__T_50_addr; 
  wire  _T_35_len__T_50_mask; 
  wire  _T_35_len__T_50_en; 
  reg [2:0] _T_35_size [0:1]; 
  reg [31:0] _RAND_3;
  wire [2:0] _T_35_size__T_58_data; 
  wire  _T_35_size__T_58_addr; 
  wire [2:0] _T_35_size__T_50_data; 
  wire  _T_35_size__T_50_addr; 
  wire  _T_35_size__T_50_mask; 
  wire  _T_35_size__T_50_en; 
  reg [1:0] _T_35_burst [0:1]; 
  reg [31:0] _RAND_4;
  wire [1:0] _T_35_burst__T_58_data; 
  wire  _T_35_burst__T_58_addr; 
  wire [1:0] _T_35_burst__T_50_data; 
  wire  _T_35_burst__T_50_addr; 
  wire  _T_35_burst__T_50_mask; 
  wire  _T_35_burst__T_50_en; 
  reg  value; 
  reg [31:0] _RAND_5;
  reg  value_1; 
  reg [31:0] _RAND_6;
  reg  _T_39; 
  reg [31:0] _RAND_7;
  wire  _T_40; 
  wire  _T_41; 
  wire  _T_42; 
  wire  _T_43; 
  wire  _T_44; 
  wire  _T_47; 
  wire  _T_52; 
  wire  _T_54; 
  wire  _T_55; 
  assign _T_35_id__T_58_addr = value_1;
  assign _T_35_id__T_58_data = _T_35_id[_T_35_id__T_58_addr]; 
  assign _T_35_id__T_50_data = io_enq_bits_id;
  assign _T_35_id__T_50_addr = value;
  assign _T_35_id__T_50_mask = 1'h1;
  assign _T_35_id__T_50_en = io_enq_ready & io_enq_valid;
  assign _T_35_addr__T_58_addr = value_1;
  assign _T_35_addr__T_58_data = _T_35_addr[_T_35_addr__T_58_addr]; 
  assign _T_35_addr__T_50_data = io_enq_bits_addr;
  assign _T_35_addr__T_50_addr = value;
  assign _T_35_addr__T_50_mask = 1'h1;
  assign _T_35_addr__T_50_en = io_enq_ready & io_enq_valid;
  assign _T_35_len__T_58_addr = value_1;
  assign _T_35_len__T_58_data = _T_35_len[_T_35_len__T_58_addr]; 
  assign _T_35_len__T_50_data = io_enq_bits_len;
  assign _T_35_len__T_50_addr = value;
  assign _T_35_len__T_50_mask = 1'h1;
  assign _T_35_len__T_50_en = io_enq_ready & io_enq_valid;
  assign _T_35_size__T_58_addr = value_1;
  assign _T_35_size__T_58_data = _T_35_size[_T_35_size__T_58_addr]; 
  assign _T_35_size__T_50_data = io_enq_bits_size;
  assign _T_35_size__T_50_addr = value;
  assign _T_35_size__T_50_mask = 1'h1;
  assign _T_35_size__T_50_en = io_enq_ready & io_enq_valid;
  assign _T_35_burst__T_58_addr = value_1;
  assign _T_35_burst__T_58_data = _T_35_burst[_T_35_burst__T_58_addr]; 
  assign _T_35_burst__T_50_data = io_enq_bits_burst;
  assign _T_35_burst__T_50_addr = value;
  assign _T_35_burst__T_50_mask = 1'h1;
  assign _T_35_burst__T_50_en = io_enq_ready & io_enq_valid;
  assign _T_40 = value == value_1; 
  assign _T_41 = _T_39 == 1'h0; 
  assign _T_42 = _T_40 & _T_41; 
  assign _T_43 = _T_40 & _T_39; 
  assign _T_44 = io_enq_ready & io_enq_valid; 
  assign _T_47 = io_deq_ready & io_deq_valid; 
  assign _T_52 = value + 1'h1; 
  assign _T_54 = value_1 + 1'h1; 
  assign _T_55 = _T_44 != _T_47; 
  assign io_enq_ready = _T_43 == 1'h0; 
  assign io_deq_valid = _T_42 == 1'h0; 
  assign io_deq_bits_id = _T_35_id__T_58_data; 
  assign io_deq_bits_addr = _T_35_addr__T_58_data; 
  assign io_deq_bits_len = _T_35_len__T_58_data; 
  assign io_deq_bits_size = _T_35_size__T_58_data; 
  assign io_deq_bits_burst = _T_35_burst__T_58_data; 
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
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_35_id[initvar] = _RAND_0[3:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_1 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_35_addr[initvar] = _RAND_1[30:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_2 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_35_len[initvar] = _RAND_2[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_3 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_35_size[initvar] = _RAND_3[2:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_4 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_35_burst[initvar] = _RAND_4[1:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  value = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  value_1 = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  _T_39 = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(_T_35_id__T_50_en & _T_35_id__T_50_mask) begin
      _T_35_id[_T_35_id__T_50_addr] <= _T_35_id__T_50_data; 
    end
    if(_T_35_addr__T_50_en & _T_35_addr__T_50_mask) begin
      _T_35_addr[_T_35_addr__T_50_addr] <= _T_35_addr__T_50_data; 
    end
    if(_T_35_len__T_50_en & _T_35_len__T_50_mask) begin
      _T_35_len[_T_35_len__T_50_addr] <= _T_35_len__T_50_data; 
    end
    if(_T_35_size__T_50_en & _T_35_size__T_50_mask) begin
      _T_35_size[_T_35_size__T_50_addr] <= _T_35_size__T_50_data; 
    end
    if(_T_35_burst__T_50_en & _T_35_burst__T_50_mask) begin
      _T_35_burst[_T_35_burst__T_50_addr] <= _T_35_burst__T_50_data; 
    end
    if (reset) begin
      value <= 1'h0;
    end else begin
      if (_T_44) begin
        value <= _T_52;
      end
    end
    if (reset) begin
      value_1 <= 1'h0;
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
