module TLWidthWidget_3( 
  input         clock, 
  input         reset, 
  output        auto_in_1_a_ready, 
  input         auto_in_1_a_valid, 
  input  [2:0]  auto_in_1_a_bits_opcode, 
  input  [2:0]  auto_in_1_a_bits_param, 
  input  [2:0]  auto_in_1_a_bits_size, 
  input  [4:0]  auto_in_1_a_bits_source, 
  input  [37:0] auto_in_1_a_bits_address, 
  input  [7:0]  auto_in_1_a_bits_mask, 
  input  [63:0] auto_in_1_a_bits_data, 
  input         auto_in_1_a_bits_corrupt, 
  input         auto_in_1_d_ready, 
  output        auto_in_1_d_valid, 
  output [2:0]  auto_in_1_d_bits_opcode, 
  output [1:0]  auto_in_1_d_bits_param, 
  output [2:0]  auto_in_1_d_bits_size, 
  output [4:0]  auto_in_1_d_bits_source, 
  output        auto_in_1_d_bits_sink, 
  output        auto_in_1_d_bits_denied, 
  output [63:0] auto_in_1_d_bits_data, 
  output        auto_in_1_d_bits_corrupt, 
  output        auto_in_0_a_ready, 
  input         auto_in_0_a_valid, 
  input  [2:0]  auto_in_0_a_bits_opcode, 
  input  [2:0]  auto_in_0_a_bits_param, 
  input  [2:0]  auto_in_0_a_bits_size, 
  input  [4:0]  auto_in_0_a_bits_source, 
  input  [30:0] auto_in_0_a_bits_address, 
  input  [7:0]  auto_in_0_a_bits_mask, 
  input  [63:0] auto_in_0_a_bits_data, 
  input         auto_in_0_a_bits_corrupt, 
  input         auto_in_0_d_ready, 
  output        auto_in_0_d_valid, 
  output [2:0]  auto_in_0_d_bits_opcode, 
  output [1:0]  auto_in_0_d_bits_param, 
  output [2:0]  auto_in_0_d_bits_size, 
  output [4:0]  auto_in_0_d_bits_source, 
  output        auto_in_0_d_bits_sink, 
  output        auto_in_0_d_bits_denied, 
  output [63:0] auto_in_0_d_bits_data, 
  output        auto_in_0_d_bits_corrupt, 
  input         auto_out_1_a_ready, 
  output        auto_out_1_a_valid, 
  output [2:0]  auto_out_1_a_bits_opcode, 
  output [2:0]  auto_out_1_a_bits_param, 
  output [2:0]  auto_out_1_a_bits_size, 
  output [4:0]  auto_out_1_a_bits_source, 
  output [37:0] auto_out_1_a_bits_address, 
  output [3:0]  auto_out_1_a_bits_mask, 
  output [31:0] auto_out_1_a_bits_data, 
  output        auto_out_1_a_bits_corrupt, 
  output        auto_out_1_d_ready, 
  input         auto_out_1_d_valid, 
  input  [2:0]  auto_out_1_d_bits_opcode, 
  input  [1:0]  auto_out_1_d_bits_param, 
  input  [2:0]  auto_out_1_d_bits_size, 
  input  [4:0]  auto_out_1_d_bits_source, 
  input         auto_out_1_d_bits_sink, 
  input         auto_out_1_d_bits_denied, 
  input  [31:0] auto_out_1_d_bits_data, 
  input         auto_out_1_d_bits_corrupt, 
  input         auto_out_0_a_ready, 
  output        auto_out_0_a_valid, 
  output [2:0]  auto_out_0_a_bits_opcode, 
  output [2:0]  auto_out_0_a_bits_param, 
  output [2:0]  auto_out_0_a_bits_size, 
  output [4:0]  auto_out_0_a_bits_source, 
  output [30:0] auto_out_0_a_bits_address, 
  output [7:0]  auto_out_0_a_bits_mask, 
  output [63:0] auto_out_0_a_bits_data, 
  output        auto_out_0_a_bits_corrupt, 
  output        auto_out_0_d_ready, 
  input         auto_out_0_d_valid, 
  input  [2:0]  auto_out_0_d_bits_opcode, 
  input  [1:0]  auto_out_0_d_bits_param, 
  input  [2:0]  auto_out_0_d_bits_size, 
  input  [4:0]  auto_out_0_d_bits_source, 
  input         auto_out_0_d_bits_sink, 
  input         auto_out_0_d_bits_denied, 
  input  [63:0] auto_out_0_d_bits_data, 
  input         auto_out_0_d_bits_corrupt 
);
  wire  TLMonitor_clock; 
  wire  TLMonitor_reset; 
  wire  TLMonitor_io_in_a_ready; 
  wire  TLMonitor_io_in_a_valid; 
  wire [2:0] TLMonitor_io_in_a_bits_opcode; 
  wire [2:0] TLMonitor_io_in_a_bits_param; 
  wire [2:0] TLMonitor_io_in_a_bits_size; 
  wire [4:0] TLMonitor_io_in_a_bits_source; 
  wire [30:0] TLMonitor_io_in_a_bits_address; 
  wire [7:0] TLMonitor_io_in_a_bits_mask; 
  wire  TLMonitor_io_in_a_bits_corrupt; 
  wire  TLMonitor_io_in_d_ready; 
  wire  TLMonitor_io_in_d_valid; 
  wire [2:0] TLMonitor_io_in_d_bits_opcode; 
  wire [1:0] TLMonitor_io_in_d_bits_param; 
  wire [2:0] TLMonitor_io_in_d_bits_size; 
  wire [4:0] TLMonitor_io_in_d_bits_source; 
  wire  TLMonitor_io_in_d_bits_sink; 
  wire  TLMonitor_io_in_d_bits_denied; 
  wire  TLMonitor_io_in_d_bits_corrupt; 
  wire  TLMonitor_1_clock; 
  wire  TLMonitor_1_reset; 
  wire  TLMonitor_1_io_in_a_ready; 
  wire  TLMonitor_1_io_in_a_valid; 
  wire [2:0] TLMonitor_1_io_in_a_bits_opcode; 
  wire [2:0] TLMonitor_1_io_in_a_bits_param; 
  wire [2:0] TLMonitor_1_io_in_a_bits_size; 
  wire [4:0] TLMonitor_1_io_in_a_bits_source; 
  wire [37:0] TLMonitor_1_io_in_a_bits_address; 
  wire [7:0] TLMonitor_1_io_in_a_bits_mask; 
  wire  TLMonitor_1_io_in_a_bits_corrupt; 
  wire  TLMonitor_1_io_in_d_ready; 
  wire  TLMonitor_1_io_in_d_valid; 
  wire [2:0] TLMonitor_1_io_in_d_bits_opcode; 
  wire [1:0] TLMonitor_1_io_in_d_bits_param; 
  wire [2:0] TLMonitor_1_io_in_d_bits_size; 
  wire [4:0] TLMonitor_1_io_in_d_bits_source; 
  wire  TLMonitor_1_io_in_d_bits_sink; 
  wire  TLMonitor_1_io_in_d_bits_denied; 
  wire  TLMonitor_1_io_in_d_bits_corrupt; 
  wire  Repeater_clock; 
  wire  Repeater_reset; 
  wire  Repeater_io_repeat; 
  wire  Repeater_io_enq_ready; 
  wire  Repeater_io_enq_valid; 
  wire [2:0] Repeater_io_enq_bits_opcode; 
  wire [2:0] Repeater_io_enq_bits_param; 
  wire [2:0] Repeater_io_enq_bits_size; 
  wire [4:0] Repeater_io_enq_bits_source; 
  wire [37:0] Repeater_io_enq_bits_address; 
  wire [7:0] Repeater_io_enq_bits_mask; 
  wire [63:0] Repeater_io_enq_bits_data; 
  wire  Repeater_io_enq_bits_corrupt; 
  wire  Repeater_io_deq_ready; 
  wire  Repeater_io_deq_valid; 
  wire [2:0] Repeater_io_deq_bits_opcode; 
  wire [2:0] Repeater_io_deq_bits_param; 
  wire [2:0] Repeater_io_deq_bits_size; 
  wire [4:0] Repeater_io_deq_bits_source; 
  wire [37:0] Repeater_io_deq_bits_address; 
  wire [7:0] Repeater_io_deq_bits_mask; 
  wire [63:0] Repeater_io_deq_bits_data; 
  wire  Repeater_io_deq_bits_corrupt; 
  wire [31:0] _T_487; 
  wire [31:0] _T_488; 
  wire [63:0] _T_489; 
  wire [2:0] _T_483_bits_opcode; 
  wire  _T_490; 
  wire  _T_491; 
  wire [2:0] _T_483_bits_size; 
  wire [9:0] _T_493; 
  wire [2:0] _T_494; 
  wire [2:0] _T_495; 
  wire  _T_496; 
  reg  _T_498; 
  reg [31:0] _RAND_0;
  wire  _T_500; 
  wire  _T_501; 
  wire  _T_502; 
  wire  _T_483_valid; 
  wire  _T_503; 
  wire  _T_505; 
  wire [37:0] _T_483_bits_address; 
  wire  _T_506; 
  wire  _T_507; 
  wire [31:0] _T_508; 
  wire [31:0] _T_509; 
  wire [7:0] _T_483_bits_mask; 
  wire [3:0] _T_519; 
  wire [3:0] _T_520; 
  wire  _T_531; 
  wire [9:0] _T_533; 
  wire [2:0] _T_534; 
  wire [2:0] _T_535; 
  wire  _T_536; 
  reg  _T_538; 
  reg [31:0] _RAND_1;
  wire  _T_540; 
  wire  _T_541; 
  wire  _T_542; 
  wire  _T_544; 
  wire  _T_546; 
  reg  _T_552; 
  reg [31:0] _RAND_2;
  wire  _T_553; 
  wire  _T_557; 
  wire  _T_558; 
  wire  _T_554; 
  wire  _T_556; 
  reg [31:0] _T_562_0; 
  reg [31:0] _RAND_3;
  wire [31:0] _T_566; 
  wire  _T_570; 
  TLMonitor_39 TLMonitor ( 
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
    .io_in_d_bits_opcode(TLMonitor_io_in_d_bits_opcode),
    .io_in_d_bits_param(TLMonitor_io_in_d_bits_param),
    .io_in_d_bits_size(TLMonitor_io_in_d_bits_size),
    .io_in_d_bits_source(TLMonitor_io_in_d_bits_source),
    .io_in_d_bits_sink(TLMonitor_io_in_d_bits_sink),
    .io_in_d_bits_denied(TLMonitor_io_in_d_bits_denied),
    .io_in_d_bits_corrupt(TLMonitor_io_in_d_bits_corrupt)
  );
  TLMonitor_40 TLMonitor_1 ( 
    .clock(TLMonitor_1_clock),
    .reset(TLMonitor_1_reset),
    .io_in_a_ready(TLMonitor_1_io_in_a_ready),
    .io_in_a_valid(TLMonitor_1_io_in_a_valid),
    .io_in_a_bits_opcode(TLMonitor_1_io_in_a_bits_opcode),
    .io_in_a_bits_param(TLMonitor_1_io_in_a_bits_param),
    .io_in_a_bits_size(TLMonitor_1_io_in_a_bits_size),
    .io_in_a_bits_source(TLMonitor_1_io_in_a_bits_source),
    .io_in_a_bits_address(TLMonitor_1_io_in_a_bits_address),
    .io_in_a_bits_mask(TLMonitor_1_io_in_a_bits_mask),
    .io_in_a_bits_corrupt(TLMonitor_1_io_in_a_bits_corrupt),
    .io_in_d_ready(TLMonitor_1_io_in_d_ready),
    .io_in_d_valid(TLMonitor_1_io_in_d_valid),
    .io_in_d_bits_opcode(TLMonitor_1_io_in_d_bits_opcode),
    .io_in_d_bits_param(TLMonitor_1_io_in_d_bits_param),
    .io_in_d_bits_size(TLMonitor_1_io_in_d_bits_size),
    .io_in_d_bits_source(TLMonitor_1_io_in_d_bits_source),
    .io_in_d_bits_sink(TLMonitor_1_io_in_d_bits_sink),
    .io_in_d_bits_denied(TLMonitor_1_io_in_d_bits_denied),
    .io_in_d_bits_corrupt(TLMonitor_1_io_in_d_bits_corrupt)
  );
  Repeater_5 Repeater ( 
    .clock(Repeater_clock),
    .reset(Repeater_reset),
    .io_repeat(Repeater_io_repeat),
    .io_enq_ready(Repeater_io_enq_ready),
    .io_enq_valid(Repeater_io_enq_valid),
    .io_enq_bits_opcode(Repeater_io_enq_bits_opcode),
    .io_enq_bits_param(Repeater_io_enq_bits_param),
    .io_enq_bits_size(Repeater_io_enq_bits_size),
    .io_enq_bits_source(Repeater_io_enq_bits_source),
    .io_enq_bits_address(Repeater_io_enq_bits_address),
    .io_enq_bits_mask(Repeater_io_enq_bits_mask),
    .io_enq_bits_data(Repeater_io_enq_bits_data),
    .io_enq_bits_corrupt(Repeater_io_enq_bits_corrupt),
    .io_deq_ready(Repeater_io_deq_ready),
    .io_deq_valid(Repeater_io_deq_valid),
    .io_deq_bits_opcode(Repeater_io_deq_bits_opcode),
    .io_deq_bits_param(Repeater_io_deq_bits_param),
    .io_deq_bits_size(Repeater_io_deq_bits_size),
    .io_deq_bits_source(Repeater_io_deq_bits_source),
    .io_deq_bits_address(Repeater_io_deq_bits_address),
    .io_deq_bits_mask(Repeater_io_deq_bits_mask),
    .io_deq_bits_data(Repeater_io_deq_bits_data),
    .io_deq_bits_corrupt(Repeater_io_deq_bits_corrupt)
  );
  assign _T_487 = Repeater_io_deq_bits_data[63:32]; 
  assign _T_488 = auto_in_1_a_bits_data[31:0]; 
  assign _T_489 = {_T_487,_T_488}; 
  assign _T_483_bits_opcode = Repeater_io_deq_bits_opcode; 
  assign _T_490 = _T_483_bits_opcode[2]; 
  assign _T_491 = _T_490 == 1'h0; 
  assign _T_483_bits_size = Repeater_io_deq_bits_size; 
  assign _T_493 = 10'h7 << _T_483_bits_size; 
  assign _T_494 = _T_493[2:0]; 
  assign _T_495 = ~ _T_494; 
  assign _T_496 = _T_495[2:2]; 
  assign _T_500 = _T_498 == _T_496; 
  assign _T_501 = _T_491 == 1'h0; 
  assign _T_502 = _T_500 | _T_501; 
  assign _T_483_valid = Repeater_io_deq_valid; 
  assign _T_503 = auto_out_1_a_ready & _T_483_valid; 
  assign _T_505 = _T_498 + 1'h1; 
  assign _T_483_bits_address = Repeater_io_deq_bits_address; 
  assign _T_506 = _T_483_bits_address[2]; 
  assign _T_507 = _T_506 | _T_498; 
  assign _T_508 = _T_489[31:0]; 
  assign _T_509 = _T_489[63:32]; 
  assign _T_483_bits_mask = Repeater_io_deq_bits_mask; 
  assign _T_519 = _T_483_bits_mask[3:0]; 
  assign _T_520 = _T_483_bits_mask[7:4]; 
  assign _T_531 = auto_out_1_d_bits_opcode[0]; 
  assign _T_533 = 10'h7 << auto_out_1_d_bits_size; 
  assign _T_534 = _T_533[2:0]; 
  assign _T_535 = ~ _T_534; 
  assign _T_536 = _T_535[2:2]; 
  assign _T_540 = _T_538 == _T_536; 
  assign _T_541 = _T_531 == 1'h0; 
  assign _T_542 = _T_540 | _T_541; 
  assign _T_544 = _T_538 & _T_536; 
  assign _T_546 = _T_544 == 1'h0; 
  assign _T_553 = auto_out_1_d_bits_corrupt | _T_552; 
  assign _T_557 = _T_542 == 1'h0; 
  assign _T_558 = auto_in_1_d_ready | _T_557; 
  assign _T_554 = _T_558 & auto_out_1_d_valid; 
  assign _T_556 = _T_538 + 1'h1; 
  assign _T_566 = _T_546 ? auto_out_1_d_bits_data : _T_562_0; 
  assign _T_570 = _T_554 & _T_557; 
  assign auto_in_1_a_ready = Repeater_io_enq_ready; 
  assign auto_in_1_d_valid = auto_out_1_d_valid & _T_542; 
  assign auto_in_1_d_bits_opcode = auto_out_1_d_bits_opcode; 
  assign auto_in_1_d_bits_param = auto_out_1_d_bits_param; 
  assign auto_in_1_d_bits_size = auto_out_1_d_bits_size; 
  assign auto_in_1_d_bits_source = auto_out_1_d_bits_source; 
  assign auto_in_1_d_bits_sink = auto_out_1_d_bits_sink; 
  assign auto_in_1_d_bits_denied = auto_out_1_d_bits_denied; 
  assign auto_in_1_d_bits_data = {auto_out_1_d_bits_data,_T_566}; 
  assign auto_in_1_d_bits_corrupt = auto_out_1_d_bits_corrupt | _T_552; 
  assign auto_in_0_a_ready = auto_out_0_a_ready; 
  assign auto_in_0_d_valid = auto_out_0_d_valid; 
  assign auto_in_0_d_bits_opcode = auto_out_0_d_bits_opcode; 
  assign auto_in_0_d_bits_param = auto_out_0_d_bits_param; 
  assign auto_in_0_d_bits_size = auto_out_0_d_bits_size; 
  assign auto_in_0_d_bits_source = auto_out_0_d_bits_source; 
  assign auto_in_0_d_bits_sink = auto_out_0_d_bits_sink; 
  assign auto_in_0_d_bits_denied = auto_out_0_d_bits_denied; 
  assign auto_in_0_d_bits_data = auto_out_0_d_bits_data; 
  assign auto_in_0_d_bits_corrupt = auto_out_0_d_bits_corrupt; 
  assign auto_out_1_a_valid = Repeater_io_deq_valid; 
  assign auto_out_1_a_bits_opcode = Repeater_io_deq_bits_opcode; 
  assign auto_out_1_a_bits_param = Repeater_io_deq_bits_param; 
  assign auto_out_1_a_bits_size = Repeater_io_deq_bits_size; 
  assign auto_out_1_a_bits_source = Repeater_io_deq_bits_source; 
  assign auto_out_1_a_bits_address = Repeater_io_deq_bits_address; 
  assign auto_out_1_a_bits_mask = _T_507 ? _T_520 : _T_519; 
  assign auto_out_1_a_bits_data = _T_507 ? _T_509 : _T_508; 
  assign auto_out_1_a_bits_corrupt = Repeater_io_deq_bits_corrupt; 
  assign auto_out_1_d_ready = auto_in_1_d_ready | _T_557; 
  assign auto_out_0_a_valid = auto_in_0_a_valid; 
  assign auto_out_0_a_bits_opcode = auto_in_0_a_bits_opcode; 
  assign auto_out_0_a_bits_param = auto_in_0_a_bits_param; 
  assign auto_out_0_a_bits_size = auto_in_0_a_bits_size; 
  assign auto_out_0_a_bits_source = auto_in_0_a_bits_source; 
  assign auto_out_0_a_bits_address = auto_in_0_a_bits_address; 
  assign auto_out_0_a_bits_mask = auto_in_0_a_bits_mask; 
  assign auto_out_0_a_bits_data = auto_in_0_a_bits_data; 
  assign auto_out_0_a_bits_corrupt = auto_in_0_a_bits_corrupt; 
  assign auto_out_0_d_ready = auto_in_0_d_ready; 
  assign TLMonitor_clock = clock; 
  assign TLMonitor_reset = reset; 
  assign TLMonitor_io_in_a_ready = auto_out_0_a_ready; 
  assign TLMonitor_io_in_a_valid = auto_in_0_a_valid; 
  assign TLMonitor_io_in_a_bits_opcode = auto_in_0_a_bits_opcode; 
  assign TLMonitor_io_in_a_bits_param = auto_in_0_a_bits_param; 
  assign TLMonitor_io_in_a_bits_size = auto_in_0_a_bits_size; 
  assign TLMonitor_io_in_a_bits_source = auto_in_0_a_bits_source; 
  assign TLMonitor_io_in_a_bits_address = auto_in_0_a_bits_address; 
  assign TLMonitor_io_in_a_bits_mask = auto_in_0_a_bits_mask; 
  assign TLMonitor_io_in_a_bits_corrupt = auto_in_0_a_bits_corrupt; 
  assign TLMonitor_io_in_d_ready = auto_in_0_d_ready; 
  assign TLMonitor_io_in_d_valid = auto_out_0_d_valid; 
  assign TLMonitor_io_in_d_bits_opcode = auto_out_0_d_bits_opcode; 
  assign TLMonitor_io_in_d_bits_param = auto_out_0_d_bits_param; 
  assign TLMonitor_io_in_d_bits_size = auto_out_0_d_bits_size; 
  assign TLMonitor_io_in_d_bits_source = auto_out_0_d_bits_source; 
  assign TLMonitor_io_in_d_bits_sink = auto_out_0_d_bits_sink; 
  assign TLMonitor_io_in_d_bits_denied = auto_out_0_d_bits_denied; 
  assign TLMonitor_io_in_d_bits_corrupt = auto_out_0_d_bits_corrupt; 
  assign TLMonitor_1_clock = clock; 
  assign TLMonitor_1_reset = reset; 
  assign TLMonitor_1_io_in_a_ready = Repeater_io_enq_ready; 
  assign TLMonitor_1_io_in_a_valid = auto_in_1_a_valid; 
  assign TLMonitor_1_io_in_a_bits_opcode = auto_in_1_a_bits_opcode; 
  assign TLMonitor_1_io_in_a_bits_param = auto_in_1_a_bits_param; 
  assign TLMonitor_1_io_in_a_bits_size = auto_in_1_a_bits_size; 
  assign TLMonitor_1_io_in_a_bits_source = auto_in_1_a_bits_source; 
  assign TLMonitor_1_io_in_a_bits_address = auto_in_1_a_bits_address; 
  assign TLMonitor_1_io_in_a_bits_mask = auto_in_1_a_bits_mask; 
  assign TLMonitor_1_io_in_a_bits_corrupt = auto_in_1_a_bits_corrupt; 
  assign TLMonitor_1_io_in_d_ready = auto_in_1_d_ready; 
  assign TLMonitor_1_io_in_d_valid = auto_out_1_d_valid & _T_542; 
  assign TLMonitor_1_io_in_d_bits_opcode = auto_out_1_d_bits_opcode; 
  assign TLMonitor_1_io_in_d_bits_param = auto_out_1_d_bits_param; 
  assign TLMonitor_1_io_in_d_bits_size = auto_out_1_d_bits_size; 
  assign TLMonitor_1_io_in_d_bits_source = auto_out_1_d_bits_source; 
  assign TLMonitor_1_io_in_d_bits_sink = auto_out_1_d_bits_sink; 
  assign TLMonitor_1_io_in_d_bits_denied = auto_out_1_d_bits_denied; 
  assign TLMonitor_1_io_in_d_bits_corrupt = auto_out_1_d_bits_corrupt | _T_552; 
  assign Repeater_clock = clock; 
  assign Repeater_reset = reset; 
  assign Repeater_io_repeat = _T_502 == 1'h0; 
  assign Repeater_io_enq_valid = auto_in_1_a_valid; 
  assign Repeater_io_enq_bits_opcode = auto_in_1_a_bits_opcode; 
  assign Repeater_io_enq_bits_param = auto_in_1_a_bits_param; 
  assign Repeater_io_enq_bits_size = auto_in_1_a_bits_size; 
  assign Repeater_io_enq_bits_source = auto_in_1_a_bits_source; 
  assign Repeater_io_enq_bits_address = auto_in_1_a_bits_address; 
  assign Repeater_io_enq_bits_mask = auto_in_1_a_bits_mask; 
  assign Repeater_io_enq_bits_data = auto_in_1_a_bits_data; 
  assign Repeater_io_enq_bits_corrupt = auto_in_1_a_bits_corrupt; 
  assign Repeater_io_deq_ready = auto_out_1_a_ready; 
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
  _T_498 = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T_538 = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_552 = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_562_0 = _RAND_3[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      _T_498 <= 1'h0;
    end else begin
      if (_T_503) begin
        if (_T_502) begin
          _T_498 <= 1'h0;
        end else begin
          _T_498 <= _T_505;
        end
      end
    end
    if (reset) begin
      _T_538 <= 1'h0;
    end else begin
      if (_T_554) begin
        if (_T_542) begin
          _T_538 <= 1'h0;
        end else begin
          _T_538 <= _T_556;
        end
      end
    end
    if (reset) begin
      _T_552 <= 1'h0;
    end else begin
      if (_T_554) begin
        if (_T_542) begin
          _T_552 <= 1'h0;
        end else begin
          _T_552 <= _T_553;
        end
      end
    end
    if (_T_570) begin
      if (_T_546) begin
        _T_562_0 <= auto_out_1_d_bits_data;
      end
    end
  end
endmodule
