module TLMaskROM( 
  input         clock, 
  input         reset, 
  output        auto_in_a_ready, 
  input         auto_in_a_valid, 
  input  [2:0]  auto_in_a_bits_opcode, 
  input  [2:0]  auto_in_a_bits_param, 
  input  [1:0]  auto_in_a_bits_size, 
  input  [9:0]  auto_in_a_bits_source, 
  input  [16:0] auto_in_a_bits_address, 
  input  [3:0]  auto_in_a_bits_mask, 
  input         auto_in_a_bits_corrupt, 
  input         auto_in_d_ready, 
  output        auto_in_d_valid, 
  output [1:0]  auto_in_d_bits_size, 
  output [9:0]  auto_in_d_bits_source, 
  output [31:0] auto_in_d_bits_data 
);
  wire  TLMonitor_clock; 
  wire  TLMonitor_reset; 
  wire  TLMonitor_io_in_a_ready; 
  wire  TLMonitor_io_in_a_valid; 
  wire [2:0] TLMonitor_io_in_a_bits_opcode; 
  wire [2:0] TLMonitor_io_in_a_bits_param; 
  wire [1:0] TLMonitor_io_in_a_bits_size; 
  wire [9:0] TLMonitor_io_in_a_bits_source; 
  wire [16:0] TLMonitor_io_in_a_bits_address; 
  wire [3:0] TLMonitor_io_in_a_bits_mask; 
  wire  TLMonitor_io_in_a_bits_corrupt; 
  wire  TLMonitor_io_in_d_ready; 
  wire  TLMonitor_io_in_d_valid; 
  wire [1:0] TLMonitor_io_in_d_bits_size; 
  wire [9:0] TLMonitor_io_in_d_bits_source; 
  wire [31:0] rom_q; 
  wire  rom_me; 
  wire  rom_oe; 
  wire [10:0] rom_address; 
  wire  rom_clock; 
  wire [17:0] _T_156; 
  wire [17:0] _T_157; 
  wire [16:0] _T_158; 
  wire [14:0] _T_159; 
  reg  d_full; 
  reg [31:0] _RAND_0;
  wire  _T_172; 
  wire  in_a_ready; 
  wire  _T_161; 
  reg [1:0] d_size; 
  reg [31:0] _RAND_1;
  reg [9:0] d_source; 
  reg [31:0] _RAND_2;
  reg  _T_167; 
  reg [31:0] _RAND_3;
  reg [31:0] _T_169; 
  reg [31:0] _RAND_4;
  wire  _T_170; 
  TLMonitor_76 TLMonitor ( 
    .clock(TLMonitor_clock),
    .reset(TLMonitor_reset),
    .io_in_a_ready(TLMonitor_io_in_a_ready),
    .io_in_a_valid(TLMonitor_io_in_a_valid),
    .io_in_a_bits_opcode(TLMonitor_io_in_a_bits_opcode),
    .io_in_a_bits_param(TLMonitor_io_in_a_bits_param),
    .io_in_a_bits_size(TLMonitor_io_in_a_bits_size),
    .io_in_a_bits_source(TLMonitor_io_in_a_bits_source),
    .io_in_a_bits_address(TLMonitor_io_in_a_bits_address),
    .io_in_a_bits_mask(TLMonitor_io_in_a_bits_mask),
    .io_in_a_bits_corrupt(TLMonitor_io_in_a_bits_corrupt),
    .io_in_d_ready(TLMonitor_io_in_d_ready),
    .io_in_d_valid(TLMonitor_io_in_d_valid),
    .io_in_d_bits_size(TLMonitor_io_in_d_bits_size),
    .io_in_d_bits_source(TLMonitor_io_in_d_bits_source)
  );
  BootROM rom ( 
    .q(rom_q),
    .me(rom_me),
    .oe(rom_oe),
    .address(rom_address),
    .clock(rom_clock)
  );
  assign _T_156 = auto_in_a_bits_address - 17'h10000; 
  assign _T_157 = $unsigned(_T_156); 
  assign _T_158 = _T_157[16:0]; 
  assign _T_159 = _T_158[16:2]; 
  assign _T_172 = d_full == 1'h0; 
  assign in_a_ready = auto_in_d_ready | _T_172; 
  assign _T_161 = in_a_ready & auto_in_a_valid; 
  assign _T_170 = auto_in_d_ready & d_full; 
  assign auto_in_a_ready = auto_in_d_ready | _T_172; 
  assign auto_in_d_valid = d_full; 
  assign auto_in_d_bits_size = d_size; 
  assign auto_in_d_bits_source = d_source; 
  assign auto_in_d_bits_data = _T_167 ? rom_q : _T_169; 
  assign TLMonitor_clock = clock; 
  assign TLMonitor_reset = reset; 
  assign TLMonitor_io_in_a_ready = auto_in_d_ready | _T_172; 
  assign TLMonitor_io_in_a_valid = auto_in_a_valid; 
  assign TLMonitor_io_in_a_bits_opcode = auto_in_a_bits_opcode; 
  assign TLMonitor_io_in_a_bits_param = auto_in_a_bits_param; 
  assign TLMonitor_io_in_a_bits_size = auto_in_a_bits_size; 
  assign TLMonitor_io_in_a_bits_source = auto_in_a_bits_source; 
  assign TLMonitor_io_in_a_bits_address = auto_in_a_bits_address; 
  assign TLMonitor_io_in_a_bits_mask = auto_in_a_bits_mask; 
  assign TLMonitor_io_in_a_bits_corrupt = auto_in_a_bits_corrupt; 
  assign TLMonitor_io_in_d_ready = auto_in_d_ready; 
  assign TLMonitor_io_in_d_valid = d_full; 
  assign TLMonitor_io_in_d_bits_size = d_size; 
  assign TLMonitor_io_in_d_bits_source = d_source; 
  assign rom_me = in_a_ready & auto_in_a_valid; 
  assign rom_oe = 1'h1; 
  assign rom_address = _T_159[10:0]; 
  assign rom_clock = clock; 
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
  d_full = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  d_size = _RAND_1[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  d_source = _RAND_2[9:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_167 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_169 = _RAND_4[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      d_full <= 1'h0;
    end else begin
      if (_T_161) begin
        d_full <= 1'h1;
      end else begin
        if (_T_170) begin
          d_full <= 1'h0;
        end
      end
    end
    if (_T_161) begin
      d_size <= auto_in_a_bits_size;
    end
    if (_T_161) begin
      d_source <= auto_in_a_bits_source;
    end
    _T_167 <= in_a_ready & auto_in_a_valid;
    if (_T_167) begin
      _T_169 <= rom_q;
    end
  end
endmodule