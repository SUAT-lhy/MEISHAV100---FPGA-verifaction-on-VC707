module TLWidthWidget_1( 
  input         clock, 
  input         reset, 
  output        auto_in_a_ready, 
  input         auto_in_a_valid, 
  input  [2:0]  auto_in_a_bits_opcode, 
  input  [2:0]  auto_in_a_bits_param, 
  input  [2:0]  auto_in_a_bits_size, 
  input  [4:0]  auto_in_a_bits_source, 
  input  [16:0] auto_in_a_bits_address, 
  input  [7:0]  auto_in_a_bits_mask, 
  input         auto_in_a_bits_corrupt, 
  input         auto_in_d_ready, 
  output        auto_in_d_valid, 
  output [2:0]  auto_in_d_bits_size, 
  output [4:0]  auto_in_d_bits_source, 
  output [63:0] auto_in_d_bits_data, 
  output        auto_in_d_bits_corrupt, 
  input         auto_out_a_ready, 
  output        auto_out_a_valid, 
  output [2:0]  auto_out_a_bits_opcode, 
  output [2:0]  auto_out_a_bits_param, 
  output [2:0]  auto_out_a_bits_size, 
  output [4:0]  auto_out_a_bits_source, 
  output [16:0] auto_out_a_bits_address, 
  output [3:0]  auto_out_a_bits_mask, 
  output        auto_out_a_bits_corrupt, 
  output        auto_out_d_ready, 
  input         auto_out_d_valid, 
  input  [2:0]  auto_out_d_bits_size, 
  input  [4:0]  auto_out_d_bits_source, 
  input  [31:0] auto_out_d_bits_data 
);
  wire  TLMonitor_clock; 
  wire  TLMonitor_reset; 
  wire  TLMonitor_io_in_a_ready; 
  wire  TLMonitor_io_in_a_valid; 
  wire [2:0] TLMonitor_io_in_a_bits_opcode; 
  wire [2:0] TLMonitor_io_in_a_bits_param; 
  wire [2:0] TLMonitor_io_in_a_bits_size; 
  wire [4:0] TLMonitor_io_in_a_bits_source; 
  wire [16:0] TLMonitor_io_in_a_bits_address; 
  wire [7:0] TLMonitor_io_in_a_bits_mask; 
  wire  TLMonitor_io_in_a_bits_corrupt; 
  wire  TLMonitor_io_in_d_ready; 
  wire  TLMonitor_io_in_d_valid; 
  wire [2:0] TLMonitor_io_in_d_bits_size; 
  wire [4:0] TLMonitor_io_in_d_bits_source; 
  wire  Repeater_clock; 
  wire  Repeater_reset; 
  wire  Repeater_io_enq_ready; 
  wire  Repeater_io_enq_valid; 
  wire [2:0] Repeater_io_enq_bits_opcode; 
  wire [2:0] Repeater_io_enq_bits_param; 
  wire [2:0] Repeater_io_enq_bits_size; 
  wire [4:0] Repeater_io_enq_bits_source; 
  wire [16:0] Repeater_io_enq_bits_address; 
  wire [7:0] Repeater_io_enq_bits_mask; 
  wire  Repeater_io_enq_bits_corrupt; 
  wire  Repeater_io_deq_ready; 
  wire  Repeater_io_deq_valid; 
  wire [2:0] Repeater_io_deq_bits_opcode; 
  wire [2:0] Repeater_io_deq_bits_param; 
  wire [2:0] Repeater_io_deq_bits_size; 
  wire [4:0] Repeater_io_deq_bits_source; 
  wire [16:0] Repeater_io_deq_bits_address; 
  wire [7:0] Repeater_io_deq_bits_mask; 
  wire  Repeater_io_deq_bits_corrupt; 
  reg  _T_260; 
  reg [31:0] _RAND_0;
  wire  _T_245_valid; 
  wire  _T_265; 
  wire [16:0] _T_245_bits_address; 
  wire  _T_268; 
  wire  _T_269; 
  wire [7:0] _T_245_bits_mask; 
  wire [3:0] _T_270; 
  wire [3:0] _T_271; 
  wire [9:0] _T_284; 
  wire [2:0] _T_285; 
  wire [2:0] _T_286; 
  wire  _T_287; 
  reg  _T_289; 
  reg [31:0] _RAND_1;
  wire  _T_291; 
  wire  _T_295; 
  wire  _T_297; 
  reg  _T_303; 
  reg [31:0] _RAND_2;
  wire  _T_308; 
  wire  _T_309; 
  wire  _T_305; 
  wire  _T_307; 
  reg [31:0] _T_313_0; 
  reg [31:0] _RAND_3;
  wire [31:0] _T_317; 
  wire  _T_321; 
  TLMonitor_18 TLMonitor ( 
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
  Repeater_4 Repeater ( 
    .clock(Repeater_clock),
    .reset(Repeater_reset),
    .io_enq_ready(Repeater_io_enq_ready),
    .io_enq_valid(Repeater_io_enq_valid),
    .io_enq_bits_opcode(Repeater_io_enq_bits_opcode),
    .io_enq_bits_param(Repeater_io_enq_bits_param),
    .io_enq_bits_size(Repeater_io_enq_bits_size),
    .io_enq_bits_source(Repeater_io_enq_bits_source),
    .io_enq_bits_address(Repeater_io_enq_bits_address),
    .io_enq_bits_mask(Repeater_io_enq_bits_mask),
    .io_enq_bits_corrupt(Repeater_io_enq_bits_corrupt),
    .io_deq_ready(Repeater_io_deq_ready),
    .io_deq_valid(Repeater_io_deq_valid),
    .io_deq_bits_opcode(Repeater_io_deq_bits_opcode),
    .io_deq_bits_param(Repeater_io_deq_bits_param),
    .io_deq_bits_size(Repeater_io_deq_bits_size),
    .io_deq_bits_source(Repeater_io_deq_bits_source),
    .io_deq_bits_address(Repeater_io_deq_bits_address),
    .io_deq_bits_mask(Repeater_io_deq_bits_mask),
    .io_deq_bits_corrupt(Repeater_io_deq_bits_corrupt)
  );
  assign _T_245_valid = Repeater_io_deq_valid; 
  assign _T_265 = auto_out_a_ready & _T_245_valid; 
  assign _T_245_bits_address = Repeater_io_deq_bits_address; 
  assign _T_268 = _T_245_bits_address[2]; 
  assign _T_269 = _T_268 | _T_260; 
  assign _T_245_bits_mask = Repeater_io_deq_bits_mask; 
  assign _T_270 = _T_245_bits_mask[3:0]; 
  assign _T_271 = _T_245_bits_mask[7:4]; 
  assign _T_284 = 10'h7 << auto_out_d_bits_size; 
  assign _T_285 = _T_284[2:0]; 
  assign _T_286 = ~ _T_285; 
  assign _T_287 = _T_286[2:2]; 
  assign _T_291 = _T_289 == _T_287; 
  assign _T_295 = _T_289 & _T_287; 
  assign _T_297 = _T_295 == 1'h0; 
  assign _T_308 = _T_291 == 1'h0; 
  assign _T_309 = auto_in_d_ready | _T_308; 
  assign _T_305 = _T_309 & auto_out_d_valid; 
  assign _T_307 = _T_289 + 1'h1; 
  assign _T_317 = _T_297 ? auto_out_d_bits_data : _T_313_0; 
  assign _T_321 = _T_305 & _T_308; 
  assign auto_in_a_ready = Repeater_io_enq_ready; 
  assign auto_in_d_valid = auto_out_d_valid & _T_291; 
  assign auto_in_d_bits_size = auto_out_d_bits_size; 
  assign auto_in_d_bits_source = auto_out_d_bits_source; 
  assign auto_in_d_bits_data = {auto_out_d_bits_data,_T_317}; 
  assign auto_in_d_bits_corrupt = _T_303; 
  assign auto_out_a_valid = Repeater_io_deq_valid; 
  assign auto_out_a_bits_opcode = Repeater_io_deq_bits_opcode; 
  assign auto_out_a_bits_param = Repeater_io_deq_bits_param; 
  assign auto_out_a_bits_size = Repeater_io_deq_bits_size; 
  assign auto_out_a_bits_source = Repeater_io_deq_bits_source; 
  assign auto_out_a_bits_address = Repeater_io_deq_bits_address; 
  assign auto_out_a_bits_mask = _T_269 ? _T_271 : _T_270; 
  assign auto_out_a_bits_corrupt = Repeater_io_deq_bits_corrupt; 
  assign auto_out_d_ready = auto_in_d_ready | _T_308; 
  assign TLMonitor_clock = clock; 
  assign TLMonitor_reset = reset; 
  assign TLMonitor_io_in_a_ready = Repeater_io_enq_ready; 
  assign TLMonitor_io_in_a_valid = auto_in_a_valid; 
  assign TLMonitor_io_in_a_bits_opcode = auto_in_a_bits_opcode; 
  assign TLMonitor_io_in_a_bits_param = auto_in_a_bits_param; 
  assign TLMonitor_io_in_a_bits_size = auto_in_a_bits_size; 
  assign TLMonitor_io_in_a_bits_source = auto_in_a_bits_source; 
  assign TLMonitor_io_in_a_bits_address = auto_in_a_bits_address; 
  assign TLMonitor_io_in_a_bits_mask = auto_in_a_bits_mask; 
  assign TLMonitor_io_in_a_bits_corrupt = auto_in_a_bits_corrupt; 
  assign TLMonitor_io_in_d_ready = auto_in_d_ready; 
  assign TLMonitor_io_in_d_valid = auto_out_d_valid & _T_291; 
  assign TLMonitor_io_in_d_bits_size = auto_out_d_bits_size; 
  assign TLMonitor_io_in_d_bits_source = auto_out_d_bits_source; 
  assign Repeater_clock = clock; 
  assign Repeater_reset = reset; 
  assign Repeater_io_enq_valid = auto_in_a_valid; 
  assign Repeater_io_enq_bits_opcode = auto_in_a_bits_opcode; 
  assign Repeater_io_enq_bits_param = auto_in_a_bits_param; 
  assign Repeater_io_enq_bits_size = auto_in_a_bits_size; 
  assign Repeater_io_enq_bits_source = auto_in_a_bits_source; 
  assign Repeater_io_enq_bits_address = auto_in_a_bits_address; 
  assign Repeater_io_enq_bits_mask = auto_in_a_bits_mask; 
  assign Repeater_io_enq_bits_corrupt = auto_in_a_bits_corrupt; 
  assign Repeater_io_deq_ready = auto_out_a_ready; 
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
  _T_260 = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T_289 = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_303 = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_313_0 = _RAND_3[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      _T_260 <= 1'h0;
    end else begin
      if (_T_265) begin
        _T_260 <= 1'h0;
      end
    end
    if (reset) begin
      _T_289 <= 1'h0;
    end else begin
      if (_T_305) begin
        if (_T_291) begin
          _T_289 <= 1'h0;
        end else begin
          _T_289 <= _T_307;
        end
      end
    end
    if (reset) begin
      _T_303 <= 1'h0;
    end else begin
      if (_T_305) begin
        if (_T_291) begin
          _T_303 <= 1'h0;
        end
      end
    end
    if (_T_321) begin
      if (_T_297) begin
        _T_313_0 <= auto_out_d_bits_data;
      end
    end
  end
endmodule
