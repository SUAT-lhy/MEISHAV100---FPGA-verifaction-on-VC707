module TLUART( 
  input         clock, 
  input         reset, 
  output        auto_int_xing_out_sync_0, 
  output        auto_control_xing_in_a_ready, 
  input         auto_control_xing_in_a_valid, 
  input  [2:0]  auto_control_xing_in_a_bits_opcode, 
  input  [2:0]  auto_control_xing_in_a_bits_param, 
  input  [1:0]  auto_control_xing_in_a_bits_size, 
  input  [8:0]  auto_control_xing_in_a_bits_source, 
  input  [30:0] auto_control_xing_in_a_bits_address, 
  input  [7:0]  auto_control_xing_in_a_bits_mask, 
  input  [63:0] auto_control_xing_in_a_bits_data, 
  input         auto_control_xing_in_a_bits_corrupt, 
  input         auto_control_xing_in_d_ready, 
  output        auto_control_xing_in_d_valid, 
  output [2:0]  auto_control_xing_in_d_bits_opcode, 
  output [1:0]  auto_control_xing_in_d_bits_size, 
  output [8:0]  auto_control_xing_in_d_bits_source, 
  output [63:0] auto_control_xing_in_d_bits_data, 
  output        auto_io_out_txd, 
  input         auto_io_out_rxd 
);
  wire  buffer_clock; 
  wire  buffer_reset; 
  wire  buffer_auto_in_a_ready; 
  wire  buffer_auto_in_a_valid; 
  wire [2:0] buffer_auto_in_a_bits_opcode; 
  wire [2:0] buffer_auto_in_a_bits_param; 
  wire [1:0] buffer_auto_in_a_bits_size; 
  wire [8:0] buffer_auto_in_a_bits_source; 
  wire [30:0] buffer_auto_in_a_bits_address; 
  wire [7:0] buffer_auto_in_a_bits_mask; 
  wire [63:0] buffer_auto_in_a_bits_data; 
  wire  buffer_auto_in_a_bits_corrupt; 
  wire  buffer_auto_in_d_ready; 
  wire  buffer_auto_in_d_valid; 
  wire [2:0] buffer_auto_in_d_bits_opcode; 
  wire [1:0] buffer_auto_in_d_bits_size; 
  wire [8:0] buffer_auto_in_d_bits_source; 
  wire [63:0] buffer_auto_in_d_bits_data; 
  wire  buffer_auto_out_a_ready; 
  wire  buffer_auto_out_a_valid; 
  wire [2:0] buffer_auto_out_a_bits_opcode; 
  wire [2:0] buffer_auto_out_a_bits_param; 
  wire [1:0] buffer_auto_out_a_bits_size; 
  wire [8:0] buffer_auto_out_a_bits_source; 
  wire [30:0] buffer_auto_out_a_bits_address; 
  wire [7:0] buffer_auto_out_a_bits_mask; 
  wire [63:0] buffer_auto_out_a_bits_data; 
  wire  buffer_auto_out_a_bits_corrupt; 
  wire  buffer_auto_out_d_ready; 
  wire  buffer_auto_out_d_valid; 
  wire [2:0] buffer_auto_out_d_bits_opcode; 
  wire [1:0] buffer_auto_out_d_bits_size; 
  wire [8:0] buffer_auto_out_d_bits_source; 
  wire [63:0] buffer_auto_out_d_bits_data; 
  wire  intsource_clock; 
  wire  intsource_reset; 
  wire  intsource_auto_in_0; 
  wire  intsource_auto_out_sync_0; 
  wire  TLMonitor_clock; 
  wire  TLMonitor_reset; 
  wire  TLMonitor_io_in_a_ready; 
  wire  TLMonitor_io_in_a_valid; 
  wire [2:0] TLMonitor_io_in_a_bits_opcode; 
  wire [2:0] TLMonitor_io_in_a_bits_param; 
  wire [1:0] TLMonitor_io_in_a_bits_size; 
  wire [8:0] TLMonitor_io_in_a_bits_source; 
  wire [30:0] TLMonitor_io_in_a_bits_address; 
  wire [7:0] TLMonitor_io_in_a_bits_mask; 
  wire  TLMonitor_io_in_a_bits_corrupt; 
  wire  TLMonitor_io_in_d_ready; 
  wire  TLMonitor_io_in_d_valid; 
  wire [2:0] TLMonitor_io_in_d_bits_opcode; 
  wire [1:0] TLMonitor_io_in_d_bits_size; 
  wire [8:0] TLMonitor_io_in_d_bits_source; 
  wire  txm_clock; 
  wire  txm_reset; 
  wire  txm_io_en; 
  wire  txm_io_in_ready; 
  wire  txm_io_in_valid; 
  wire [7:0] txm_io_in_bits; 
  wire  txm_io_out; 
  wire [15:0] txm_io_div; 
  wire  txm_io_nstop; 
  wire  txq_clock; 
  wire  txq_reset; 
  wire  txq_io_enq_ready; 
  wire  txq_io_enq_valid; 
  wire [7:0] txq_io_enq_bits; 
  wire  txq_io_deq_ready; 
  wire  txq_io_deq_valid; 
  wire [7:0] txq_io_deq_bits; 
  wire [3:0] txq_io_count; 
  wire  rxm_clock; 
  wire  rxm_reset; 
  wire  rxm_io_en; 
  wire  rxm_io_in; 
  wire  rxm_io_out_valid; 
  wire [7:0] rxm_io_out_bits; 
  wire [15:0] rxm_io_div; 
  wire  rxq_clock; 
  wire  rxq_reset; 
  wire  rxq_io_enq_ready; 
  wire  rxq_io_enq_valid; 
  wire [7:0] rxq_io_enq_bits; 
  wire  rxq_io_deq_ready; 
  wire  rxq_io_deq_valid; 
  wire [7:0] rxq_io_deq_bits; 
  wire [3:0] rxq_io_count; 
  reg [15:0] div; 
  reg [31:0] _RAND_0;
  reg  txen; 
  reg [31:0] _RAND_1;
  reg  rxen; 
  reg [31:0] _RAND_2;
  reg [3:0] txwm; 
  reg [31:0] _RAND_3;
  reg [3:0] rxwm; 
  reg [31:0] _RAND_4;
  reg  nstop; 
  reg [31:0] _RAND_5;
  reg  ie_rxwm; 
  reg [31:0] _RAND_6;
  reg  ie_txwm; 
  reg [31:0] _RAND_7;
  wire  ip_txwm; 
  wire  ip_rxwm; 
  wire  _T_298; 
  wire  _T_299; 
  wire  _T_303; 
  wire  _T_304; 
  wire [2:0] _T_42_a_bits_opcode; 
  wire  _T_312; 
  wire [30:0] _T_42_a_bits_address; 
  wire [27:0] _T_313; 
  wire [8:0] _T_42_a_bits_source; 
  wire [1:0] _T_42_a_bits_size; 
  wire [10:0] _T_314; 
  wire [8:0] _T_309_bits_index; 
  wire [8:0] _T_330; 
  wire  _T_332; 
  wire [7:0] _T_42_a_bits_mask; 
  wire  _T_428; 
  wire  _T_429; 
  wire  _T_430; 
  wire  _T_431; 
  wire  _T_432; 
  wire  _T_433; 
  wire  _T_434; 
  wire  _T_435; 
  wire [7:0] _T_437; 
  wire [7:0] _T_439; 
  wire [7:0] _T_441; 
  wire [7:0] _T_443; 
  wire [7:0] _T_445; 
  wire [7:0] _T_447; 
  wire [7:0] _T_449; 
  wire [7:0] _T_451; 
  wire [15:0] _T_452; 
  wire [15:0] _T_453; 
  wire [31:0] _T_454; 
  wire [15:0] _T_455; 
  wire [15:0] _T_456; 
  wire [31:0] _T_457; 
  wire [63:0] _T_458; 
  wire  _T_490; 
  wire  _T_493; 
  wire  _T_494; 
  wire  _T_42_a_valid; 
  wire  _T_42_d_ready; 
  wire  _T_929; 
  wire  _T_928; 
  wire [1:0] _T_937; 
  wire  _T_948; 
  wire  _T_949; 
  wire [3:0] _T_938; 
  wire  _T_941; 
  wire  _T_988; 
  wire  _T_989; 
  wire  _T_1004; 
  wire  _T_1005; 
  wire  _T_502; 
  wire [63:0] _T_42_a_bits_data; 
  wire  _T_504; 
  wire  _T_515; 
  wire  _T_518; 
  wire  _T_519; 
  wire  _T_527; 
  wire  _T_529; 
  wire [1:0] _T_539; 
  wire  _T_542; 
  wire  _T_545; 
  wire  _T_546; 
  wire  _T_556; 
  wire [31:0] _T_565; 
  wire [32:0] _T_566; 
  wire [33:0] _T_593; 
  wire  _T_940; 
  wire  _T_998; 
  wire  _T_999; 
  wire  _T_608; 
  wire  _T_633; 
  wire [1:0] _T_645; 
  wire [3:0] _T_648; 
  wire [3:0] _T_651; 
  wire  _T_652; 
  wire  _T_660; 
  wire [3:0] _T_662; 
  wire [15:0] _T_671; 
  wire [19:0] _T_672; 
  wire  _T_687; 
  wire [31:0] _T_698; 
  wire [32:0] _T_699; 
  wire [3:0] _T_702; 
  wire [3:0] _T_705; 
  wire  _T_706; 
  wire  _T_714; 
  wire [3:0] _T_716; 
  wire [47:0] _T_725; 
  wire [51:0] _T_726; 
  wire [15:0] _T_729; 
  wire [15:0] _T_732; 
  wire  _T_733; 
  wire  _T_942; 
  wire  _T_1010; 
  wire  _T_1011; 
  wire  _T_741; 
  wire [15:0] _T_743; 
  wire [7:0] _T_754; 
  wire [7:0] _T_757; 
  wire  _T_758; 
  wire  _T_939; 
  wire  _T_952; 
  wire  _T_953; 
  wire  _T_992; 
  wire  _T_993; 
  wire  _T_766; 
  wire  _T_815; 
  wire  _T_816; 
  wire  _T_817; 
  wire  _T_821; 
  wire  _T_822; 
  wire  _T_824; 
  wire  _T_769; 
  wire [31:0] _T_834; 
  wire [7:0] _T_837; 
  wire  _T_838; 
  wire [39:0] _T_861; 
  wire [40:0] _T_888; 
  wire [62:0] _T_889; 
  wire [63:0] _T_915; 
  wire  _GEN_25; 
  wire  _GEN_26; 
  wire  _GEN_27; 
  wire [63:0] _T_1129_1; 
  wire [63:0] _GEN_29; 
  wire [63:0] _T_1129_2; 
  wire [63:0] _GEN_30; 
  wire [63:0] _T_1129_3; 
  wire [63:0] _GEN_31; 
  TLBuffer_31 buffer ( 
    .clock(buffer_clock),
    .reset(buffer_reset),
    .auto_in_a_ready(buffer_auto_in_a_ready),
    .auto_in_a_valid(buffer_auto_in_a_valid),
    .auto_in_a_bits_opcode(buffer_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(buffer_auto_in_a_bits_param),
    .auto_in_a_bits_size(buffer_auto_in_a_bits_size),
    .auto_in_a_bits_source(buffer_auto_in_a_bits_source),
    .auto_in_a_bits_address(buffer_auto_in_a_bits_address),
    .auto_in_a_bits_mask(buffer_auto_in_a_bits_mask),
    .auto_in_a_bits_data(buffer_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(buffer_auto_in_a_bits_corrupt),
    .auto_in_d_ready(buffer_auto_in_d_ready),
    .auto_in_d_valid(buffer_auto_in_d_valid),
    .auto_in_d_bits_opcode(buffer_auto_in_d_bits_opcode),
    .auto_in_d_bits_size(buffer_auto_in_d_bits_size),
    .auto_in_d_bits_source(buffer_auto_in_d_bits_source),
    .auto_in_d_bits_data(buffer_auto_in_d_bits_data),
    .auto_out_a_ready(buffer_auto_out_a_ready),
    .auto_out_a_valid(buffer_auto_out_a_valid),
    .auto_out_a_bits_opcode(buffer_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(buffer_auto_out_a_bits_param),
    .auto_out_a_bits_size(buffer_auto_out_a_bits_size),
    .auto_out_a_bits_source(buffer_auto_out_a_bits_source),
    .auto_out_a_bits_address(buffer_auto_out_a_bits_address),
    .auto_out_a_bits_mask(buffer_auto_out_a_bits_mask),
    .auto_out_a_bits_data(buffer_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(buffer_auto_out_a_bits_corrupt),
    .auto_out_d_ready(buffer_auto_out_d_ready),
    .auto_out_d_valid(buffer_auto_out_d_valid),
    .auto_out_d_bits_opcode(buffer_auto_out_d_bits_opcode),
    .auto_out_d_bits_size(buffer_auto_out_d_bits_size),
    .auto_out_d_bits_source(buffer_auto_out_d_bits_source),
    .auto_out_d_bits_data(buffer_auto_out_d_bits_data)
  );
  IntSyncCrossingSource_3 intsource ( 
    .clock(intsource_clock),
    .reset(intsource_reset),
    .auto_in_0(intsource_auto_in_0),
    .auto_out_sync_0(intsource_auto_out_sync_0)
  );
  TLMonitor_78 TLMonitor ( 
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
    .io_in_d_bits_size(TLMonitor_io_in_d_bits_size),
    .io_in_d_bits_source(TLMonitor_io_in_d_bits_source)
  );
  UARTTx txm ( 
    .clock(txm_clock),
    .reset(txm_reset),
    .io_en(txm_io_en),
    .io_in_ready(txm_io_in_ready),
    .io_in_valid(txm_io_in_valid),
    .io_in_bits(txm_io_in_bits),
    .io_out(txm_io_out),
    .io_div(txm_io_div),
    .io_nstop(txm_io_nstop)
  );
  Queue_38 txq ( 
    .clock(txq_clock),
    .reset(txq_reset),
    .io_enq_ready(txq_io_enq_ready),
    .io_enq_valid(txq_io_enq_valid),
    .io_enq_bits(txq_io_enq_bits),
    .io_deq_ready(txq_io_deq_ready),
    .io_deq_valid(txq_io_deq_valid),
    .io_deq_bits(txq_io_deq_bits),
    .io_count(txq_io_count)
  );
  UARTRx rxm ( 
    .clock(rxm_clock),
    .reset(rxm_reset),
    .io_en(rxm_io_en),
    .io_in(rxm_io_in),
    .io_out_valid(rxm_io_out_valid),
    .io_out_bits(rxm_io_out_bits),
    .io_div(rxm_io_div)
  );
  Queue_38 rxq ( 
    .clock(rxq_clock),
    .reset(rxq_reset),
    .io_enq_ready(rxq_io_enq_ready),
    .io_enq_valid(rxq_io_enq_valid),
    .io_enq_bits(rxq_io_enq_bits),
    .io_deq_ready(rxq_io_deq_ready),
    .io_deq_valid(rxq_io_deq_valid),
    .io_deq_bits(rxq_io_deq_bits),
    .io_count(rxq_io_count)
  );
  assign ip_txwm = txq_io_count < txwm; 
  assign ip_rxwm = rxq_io_count > rxwm; 
  assign _T_298 = ip_txwm & ie_txwm; 
  assign _T_299 = ip_rxwm & ie_rxwm; 
  assign _T_303 = txq_io_enq_ready == 1'h0; 
  assign _T_304 = rxq_io_deq_valid == 1'h0; 
  assign _T_42_a_bits_opcode = buffer_auto_out_a_bits_opcode; 
  assign _T_312 = _T_42_a_bits_opcode == 3'h4; 
  assign _T_42_a_bits_address = buffer_auto_out_a_bits_address; 
  assign _T_313 = _T_42_a_bits_address[30:3]; 
  assign _T_42_a_bits_source = buffer_auto_out_a_bits_source; 
  assign _T_42_a_bits_size = buffer_auto_out_a_bits_size; 
  assign _T_314 = {_T_42_a_bits_source,_T_42_a_bits_size}; 
  assign _T_309_bits_index = _T_313[8:0]; 
  assign _T_330 = _T_309_bits_index & 9'h1fc; 
  assign _T_332 = _T_330 == 9'h0; 
  assign _T_42_a_bits_mask = buffer_auto_out_a_bits_mask; 
  assign _T_428 = _T_42_a_bits_mask[0]; 
  assign _T_429 = _T_42_a_bits_mask[1]; 
  assign _T_430 = _T_42_a_bits_mask[2]; 
  assign _T_431 = _T_42_a_bits_mask[3]; 
  assign _T_432 = _T_42_a_bits_mask[4]; 
  assign _T_433 = _T_42_a_bits_mask[5]; 
  assign _T_434 = _T_42_a_bits_mask[6]; 
  assign _T_435 = _T_42_a_bits_mask[7]; 
  assign _T_437 = _T_428 ? 8'hff : 8'h0; 
  assign _T_439 = _T_429 ? 8'hff : 8'h0; 
  assign _T_441 = _T_430 ? 8'hff : 8'h0; 
  assign _T_443 = _T_431 ? 8'hff : 8'h0; 
  assign _T_445 = _T_432 ? 8'hff : 8'h0; 
  assign _T_447 = _T_433 ? 8'hff : 8'h0; 
  assign _T_449 = _T_434 ? 8'hff : 8'h0; 
  assign _T_451 = _T_435 ? 8'hff : 8'h0; 
  assign _T_452 = {_T_439,_T_437}; 
  assign _T_453 = {_T_443,_T_441}; 
  assign _T_454 = {_T_453,_T_452}; 
  assign _T_455 = {_T_447,_T_445}; 
  assign _T_456 = {_T_451,_T_449}; 
  assign _T_457 = {_T_456,_T_455}; 
  assign _T_458 = {_T_457,_T_454}; 
  assign _T_490 = _T_458[0]; 
  assign _T_493 = ~ _T_490; 
  assign _T_494 = _T_493 == 1'h0; 
  assign _T_42_a_valid = buffer_auto_out_a_valid; 
  assign _T_42_d_ready = buffer_auto_out_d_ready; 
  assign _T_929 = _T_309_bits_index[1]; 
  assign _T_928 = _T_309_bits_index[0]; 
  assign _T_937 = {_T_929,_T_928}; 
  assign _T_948 = _T_42_a_valid & _T_42_d_ready; 
  assign _T_949 = _T_948 & _T_312; 
  assign _T_938 = 4'h1 << _T_937; 
  assign _T_941 = _T_938[2]; 
  assign _T_988 = _T_312 == 1'h0; 
  assign _T_989 = _T_948 & _T_988; 
  assign _T_1004 = _T_989 & _T_941; 
  assign _T_1005 = _T_1004 & _T_332; 
  assign _T_502 = _T_1005 & _T_494; 
  assign _T_42_a_bits_data = buffer_auto_out_a_bits_data; 
  assign _T_504 = _T_42_a_bits_data[0]; 
  assign _T_515 = _T_458[1]; 
  assign _T_518 = ~ _T_515; 
  assign _T_519 = _T_518 == 1'h0; 
  assign _T_527 = _T_1005 & _T_519; 
  assign _T_529 = _T_42_a_bits_data[1]; 
  assign _T_539 = {ie_rxwm,ie_txwm}; 
  assign _T_542 = _T_458[32]; 
  assign _T_545 = ~ _T_542; 
  assign _T_546 = _T_545 == 1'h0; 
  assign _T_556 = _T_42_a_bits_data[32]; 
  assign _T_565 = {{30'd0}, _T_539}; 
  assign _T_566 = {ip_txwm,_T_565}; 
  assign _T_593 = {ip_rxwm,_T_566}; 
  assign _T_940 = _T_938[1]; 
  assign _T_998 = _T_989 & _T_940; 
  assign _T_999 = _T_998 & _T_332; 
  assign _T_608 = _T_999 & _T_494; 
  assign _T_633 = _T_999 & _T_519; 
  assign _T_645 = {nstop,txen}; 
  assign _T_648 = _T_458[19:16]; 
  assign _T_651 = ~ _T_648; 
  assign _T_652 = _T_651 == 4'h0; 
  assign _T_660 = _T_999 & _T_652; 
  assign _T_662 = _T_42_a_bits_data[19:16]; 
  assign _T_671 = {{14'd0}, _T_645}; 
  assign _T_672 = {txwm,_T_671}; 
  assign _T_687 = _T_999 & _T_546; 
  assign _T_698 = {{12'd0}, _T_672}; 
  assign _T_699 = {rxen,_T_698}; 
  assign _T_702 = _T_458[51:48]; 
  assign _T_705 = ~ _T_702; 
  assign _T_706 = _T_705 == 4'h0; 
  assign _T_714 = _T_999 & _T_706; 
  assign _T_716 = _T_42_a_bits_data[51:48]; 
  assign _T_725 = {{15'd0}, _T_699}; 
  assign _T_726 = {rxwm,_T_725}; 
  assign _T_729 = _T_458[15:0]; 
  assign _T_732 = ~ _T_729; 
  assign _T_733 = _T_732 == 16'h0; 
  assign _T_942 = _T_938[3]; 
  assign _T_1010 = _T_989 & _T_942; 
  assign _T_1011 = _T_1010 & _T_332; 
  assign _T_741 = _T_1011 & _T_733; 
  assign _T_743 = _T_42_a_bits_data[15:0]; 
  assign _T_754 = _T_458[7:0]; 
  assign _T_757 = ~ _T_754; 
  assign _T_758 = _T_757 == 8'h0; 
  assign _T_939 = _T_938[0]; 
  assign _T_952 = _T_949 & _T_939; 
  assign _T_953 = _T_952 & _T_332; 
  assign _T_992 = _T_989 & _T_939; 
  assign _T_993 = _T_992 & _T_332; 
  assign _T_766 = _T_993 & _T_758; 
  assign _T_815 = _T_458[31]; 
  assign _T_816 = ~ _T_815; 
  assign _T_817 = _T_816 == 1'h0; 
  assign _T_821 = _T_993 & _T_817; 
  assign _T_822 = _T_42_a_bits_data[31]; 
  assign _T_824 = _T_821 & _T_822; 
  assign _T_769 = _T_824 == 1'h0; 
  assign _T_834 = {_T_303,31'h0}; 
  assign _T_837 = _T_458[39:32]; 
  assign _T_838 = _T_837 != 8'h0; 
  assign _T_861 = {rxq_io_deq_bits,_T_834}; 
  assign _T_888 = {1'h0,_T_861}; 
  assign _T_889 = {{22'd0}, _T_888}; 
  assign _T_915 = {_T_304,_T_889}; 
  assign _GEN_25 = 2'h1 == _T_937 ? _T_332 : _T_332; 
  assign _GEN_26 = 2'h2 == _T_937 ? _T_332 : _GEN_25; 
  assign _GEN_27 = 2'h3 == _T_937 ? _T_332 : _GEN_26; 
  assign _T_1129_1 = {{12'd0}, _T_726}; 
  assign _GEN_29 = 2'h1 == _T_937 ? _T_1129_1 : _T_915; 
  assign _T_1129_2 = {{30'd0}, _T_593}; 
  assign _GEN_30 = 2'h2 == _T_937 ? _T_1129_2 : _GEN_29; 
  assign _T_1129_3 = {{48'd0}, div}; 
  assign _GEN_31 = 2'h3 == _T_937 ? _T_1129_3 : _GEN_30; 
  assign auto_int_xing_out_sync_0 = intsource_auto_out_sync_0; 
  assign auto_control_xing_in_a_ready = buffer_auto_in_a_ready; 
  assign auto_control_xing_in_d_valid = buffer_auto_in_d_valid; 
  assign auto_control_xing_in_d_bits_opcode = buffer_auto_in_d_bits_opcode; 
  assign auto_control_xing_in_d_bits_size = buffer_auto_in_d_bits_size; 
  assign auto_control_xing_in_d_bits_source = buffer_auto_in_d_bits_source; 
  assign auto_control_xing_in_d_bits_data = buffer_auto_in_d_bits_data; 
  assign auto_io_out_txd = txm_io_out; 
  assign buffer_clock = clock; 
  assign buffer_reset = reset; 
  assign buffer_auto_in_a_valid = auto_control_xing_in_a_valid; 
  assign buffer_auto_in_a_bits_opcode = auto_control_xing_in_a_bits_opcode; 
  assign buffer_auto_in_a_bits_param = auto_control_xing_in_a_bits_param; 
  assign buffer_auto_in_a_bits_size = auto_control_xing_in_a_bits_size; 
  assign buffer_auto_in_a_bits_source = auto_control_xing_in_a_bits_source; 
  assign buffer_auto_in_a_bits_address = auto_control_xing_in_a_bits_address; 
  assign buffer_auto_in_a_bits_mask = auto_control_xing_in_a_bits_mask; 
  assign buffer_auto_in_a_bits_data = auto_control_xing_in_a_bits_data; 
  assign buffer_auto_in_a_bits_corrupt = auto_control_xing_in_a_bits_corrupt; 
  assign buffer_auto_in_d_ready = auto_control_xing_in_d_ready; 
  assign buffer_auto_out_a_ready = buffer_auto_out_d_ready; 
  assign buffer_auto_out_d_valid = buffer_auto_out_a_valid; 
  assign buffer_auto_out_d_bits_opcode = {{2'd0}, _T_312}; 
  assign buffer_auto_out_d_bits_size = _T_314[1:0]; 
  assign buffer_auto_out_d_bits_source = _T_314[10:2]; 
  assign buffer_auto_out_d_bits_data = _GEN_27 ? _GEN_31 : 64'h0; 
  assign intsource_clock = clock; 
  assign intsource_reset = reset; 
  assign intsource_auto_in_0 = _T_298 | _T_299; 
  assign TLMonitor_clock = clock; 
  assign TLMonitor_reset = reset; 
  assign TLMonitor_io_in_a_ready = buffer_auto_out_d_ready; 
  assign TLMonitor_io_in_a_valid = buffer_auto_out_a_valid; 
  assign TLMonitor_io_in_a_bits_opcode = buffer_auto_out_a_bits_opcode; 
  assign TLMonitor_io_in_a_bits_param = buffer_auto_out_a_bits_param; 
  assign TLMonitor_io_in_a_bits_size = buffer_auto_out_a_bits_size; 
  assign TLMonitor_io_in_a_bits_source = buffer_auto_out_a_bits_source; 
  assign TLMonitor_io_in_a_bits_address = buffer_auto_out_a_bits_address; 
  assign TLMonitor_io_in_a_bits_mask = buffer_auto_out_a_bits_mask; 
  assign TLMonitor_io_in_a_bits_corrupt = buffer_auto_out_a_bits_corrupt; 
  assign TLMonitor_io_in_d_ready = buffer_auto_out_d_ready; 
  assign TLMonitor_io_in_d_valid = buffer_auto_out_a_valid; 
  assign TLMonitor_io_in_d_bits_opcode = {{2'd0}, _T_312}; 
  assign TLMonitor_io_in_d_bits_size = _T_314[1:0]; 
  assign TLMonitor_io_in_d_bits_source = _T_314[10:2]; 
  assign txm_clock = clock; 
  assign txm_reset = reset; 
  assign txm_io_en = txen; 
  assign txm_io_in_valid = txq_io_deq_valid; 
  assign txm_io_in_bits = txq_io_deq_bits; 
  assign txm_io_div = div; 
  assign txm_io_nstop = nstop; 
  assign txq_clock = clock; 
  assign txq_reset = reset; 
  assign txq_io_enq_valid = _T_766 & _T_769; 
  assign txq_io_enq_bits = _T_42_a_bits_data[7:0]; 
  assign txq_io_deq_ready = txm_io_in_ready; 
  assign rxm_clock = clock; 
  assign rxm_reset = reset; 
  assign rxm_io_en = rxen; 
  assign rxm_io_in = auto_io_out_rxd; 
  assign rxm_io_div = div; 
  assign rxq_clock = clock; 
  assign rxq_reset = reset; 
  assign rxq_io_enq_valid = rxm_io_out_valid; 
  assign rxq_io_enq_bits = rxm_io_out_bits; 
  assign rxq_io_deq_ready = _T_953 & _T_838; 
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
  div = _RAND_0[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  txen = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  rxen = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  txwm = _RAND_3[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  rxwm = _RAND_4[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  nstop = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  ie_rxwm = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  ie_txwm = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      div <= 16'h1b2;
    end else begin
      if (_T_741) begin
        div <= _T_743;
      end
    end
    if (reset) begin
      txen <= 1'h0;
    end else begin
      if (_T_608) begin
        txen <= _T_504;
      end
    end
    if (reset) begin
      rxen <= 1'h0;
    end else begin
      if (_T_687) begin
        rxen <= _T_556;
      end
    end
    if (reset) begin
      txwm <= 4'h0;
    end else begin
      if (_T_660) begin
        txwm <= _T_662;
      end
    end
    if (reset) begin
      rxwm <= 4'h0;
    end else begin
      if (_T_714) begin
        rxwm <= _T_716;
      end
    end
    if (reset) begin
      nstop <= 1'h0;
    end else begin
      if (_T_633) begin
        nstop <= _T_529;
      end
    end
    if (reset) begin
      ie_rxwm <= 1'h0;
    end else begin
      if (_T_527) begin
        ie_rxwm <= _T_529;
      end
    end
    if (reset) begin
      ie_txwm <= 1'h0;
    end else begin
      if (_T_502) begin
        ie_txwm <= _T_504;
      end
    end
  end
endmodule
