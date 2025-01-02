module TLGPIO( 
  input         clock, 
  input         reset, 
  output        auto_int_xing_out_sync_0, 
  output        auto_int_xing_out_sync_1, 
  output        auto_int_xing_out_sync_2, 
  output        auto_int_xing_out_sync_3, 
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
  output        auto_io_out_pins_0_o_oval, 
  output        auto_io_out_pins_1_o_oval, 
  output        auto_io_out_pins_2_o_oval, 
  output        auto_io_out_pins_3_o_oval 
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
  wire  intsource_auto_in_1; 
  wire  intsource_auto_in_2; 
  wire  intsource_auto_in_3; 
  wire  intsource_auto_out_sync_0; 
  wire  intsource_auto_out_sync_1; 
  wire  intsource_auto_out_sync_2; 
  wire  intsource_auto_out_sync_3; 
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
  wire  oeReg_clock; 
  wire  oeReg_reset; 
  wire [3:0] oeReg_io_d; 
  wire [3:0] oeReg_io_q; 
  wire  oeReg_io_en; 
  wire  pueReg_clock; 
  wire  pueReg_reset; 
  wire [3:0] pueReg_io_d; 
  wire [3:0] pueReg_io_q; 
  wire  pueReg_io_en; 
  wire  ieReg_clock; 
  wire  ieReg_reset; 
  wire [3:0] ieReg_io_d; 
  wire [3:0] ieReg_io_q; 
  wire  ieReg_io_en; 
  wire  inSyncReg_clock; 
  wire [3:0] inSyncReg_io_d; 
  wire [3:0] inSyncReg_io_q; 
  wire  iofEnReg_clock; 
  wire  iofEnReg_reset; 
  wire [3:0] iofEnReg_io_d; 
  wire [3:0] iofEnReg_io_q; 
  wire  iofEnReg_io_en; 
  reg [3:0] portReg; 
  reg [31:0] _RAND_0;
  reg [3:0] dsReg; 
  reg [31:0] _RAND_1;
  reg [3:0] valueReg; 
  reg [31:0] _RAND_2;
  reg [3:0] highIeReg; 
  reg [31:0] _RAND_3;
  reg [3:0] lowIeReg; 
  reg [31:0] _RAND_4;
  reg [3:0] riseIeReg; 
  reg [31:0] _RAND_5;
  reg [3:0] fallIeReg; 
  reg [31:0] _RAND_6;
  reg [3:0] highIpReg; 
  reg [31:0] _RAND_7;
  reg [3:0] lowIpReg; 
  reg [31:0] _RAND_8;
  reg [3:0] riseIpReg; 
  reg [31:0] _RAND_9;
  reg [3:0] fallIpReg; 
  reg [31:0] _RAND_10;
  reg [3:0] xorReg; 
  reg [31:0] _RAND_11;
  wire [3:0] _T_371; 
  wire [3:0] inSyncReg_1; 
  wire [3:0] rise; 
  wire [3:0] _T_372; 
  wire [3:0] fall; 
  wire [2:0] _T_81_a_bits_opcode; 
  wire  _T_381; 
  wire [30:0] _T_81_a_bits_address; 
  wire [27:0] _T_382; 
  wire [8:0] _T_81_a_bits_source; 
  wire [1:0] _T_81_a_bits_size; 
  wire [10:0] _T_383; 
  wire [8:0] _T_378_bits_index; 
  wire [8:0] _T_399; 
  wire  _T_401; 
  wire [7:0] _T_81_a_bits_mask; 
  wire  _T_511; 
  wire  _T_512; 
  wire  _T_513; 
  wire  _T_514; 
  wire  _T_515; 
  wire  _T_516; 
  wire  _T_517; 
  wire  _T_518; 
  wire [7:0] _T_520; 
  wire [7:0] _T_522; 
  wire [7:0] _T_524; 
  wire [7:0] _T_526; 
  wire [7:0] _T_528; 
  wire [7:0] _T_530; 
  wire [7:0] _T_532; 
  wire [7:0] _T_534; 
  wire [15:0] _T_535; 
  wire [15:0] _T_536; 
  wire [31:0] _T_537; 
  wire [15:0] _T_538; 
  wire [15:0] _T_539; 
  wire [31:0] _T_540; 
  wire [63:0] _T_541; 
  wire [3:0] _T_573; 
  wire [3:0] _T_576; 
  wire  _T_577; 
  wire  _T_81_a_valid; 
  wire  _T_81_d_ready; 
  wire  _T_1049; 
  wire  _T_1048; 
  wire [1:0] _T_1056; 
  wire  _T_1047; 
  wire  _T_1046; 
  wire [1:0] _T_1055; 
  wire [3:0] _T_1057; 
  wire  _T_1092; 
  wire [15:0] _T_1058; 
  wire  _T_1059; 
  wire  _T_1216; 
  wire  _T_1217; 
  wire  _T_1220; 
  wire  _T_1221; 
  wire [63:0] _T_81_a_bits_data; 
  wire [3:0] _T_587; 
  wire [3:0] _T_598; 
  wire [3:0] _T_601; 
  wire  _T_602; 
  wire [3:0] _T_612; 
  wire [31:0] _T_621; 
  wire [35:0] _T_622; 
  wire  _T_1064; 
  wire  _T_1250; 
  wire  _T_1251; 
  wire  _T_637; 
  wire  _T_662; 
  wire [3:0] _T_665; 
  wire [3:0] _T_666; 
  wire [3:0] _T_667; 
  wire [3:0] _T_668; 
  wire [3:0] _T_669; 
  wire [31:0] _T_678; 
  wire [35:0] _T_679; 
  wire  _T_1060; 
  wire  _T_1226; 
  wire  _T_1227; 
  wire [3:0] _T_705; 
  wire  _T_719; 
  wire [31:0] _T_730; 
  wire [35:0] _T_731; 
  wire  _T_1065; 
  wire  _T_1256; 
  wire  _T_1257; 
  wire  _T_746; 
  wire  _T_771; 
  wire [3:0] _T_774; 
  wire [3:0] _T_775; 
  wire [3:0] _T_776; 
  wire [3:0] _T_777; 
  wire [3:0] _T_778; 
  wire [31:0] _T_787; 
  wire [35:0] _T_788; 
  wire  _T_1061; 
  wire  _T_1232; 
  wire  _T_1233; 
  wire [3:0] _T_814; 
  wire  _T_828; 
  wire [31:0] _T_839; 
  wire [35:0] _T_840; 
  wire  _T_1062; 
  wire  _T_1238; 
  wire  _T_1239; 
  wire  _T_907; 
  wire  _T_932; 
  wire [3:0] _T_935; 
  wire [3:0] _T_936; 
  wire [3:0] _T_937; 
  wire [3:0] _T_938; 
  wire [3:0] _T_939; 
  wire [31:0] _T_948; 
  wire [35:0] _T_949; 
  wire  _T_1067; 
  wire  _T_1268; 
  wire  _T_1269; 
  wire  _T_964; 
  wire  _T_1063; 
  wire  _T_1244; 
  wire  _T_1245; 
  wire  _T_989; 
  wire  _T_1014; 
  wire [3:0] _T_1017; 
  wire [3:0] _T_1018; 
  wire [3:0] _T_1019; 
  wire [3:0] _T_1020; 
  wire [3:0] _T_1021; 
  wire [31:0] _T_1030; 
  wire [35:0] _T_1031; 
  wire  _GEN_72; 
  wire  _GEN_73; 
  wire  _GEN_74; 
  wire  _GEN_75; 
  wire  _GEN_76; 
  wire  _GEN_77; 
  wire  _GEN_78; 
  wire  _GEN_79; 
  wire  _GEN_80; 
  wire  _GEN_81; 
  wire  _GEN_82; 
  wire  _GEN_83; 
  wire  _GEN_84; 
  wire  _GEN_85; 
  wire  _GEN_86; 
  wire [35:0] _GEN_88; 
  wire [35:0] _GEN_89; 
  wire [35:0] _GEN_90; 
  wire [35:0] _GEN_91; 
  wire [35:0] _GEN_92; 
  wire [35:0] _GEN_93; 
  wire [35:0] _GEN_94; 
  wire [35:0] _T_1621_8; 
  wire [35:0] _GEN_95; 
  wire [35:0] _GEN_96; 
  wire [35:0] _GEN_97; 
  wire [35:0] _GEN_98; 
  wire [35:0] _GEN_99; 
  wire [35:0] _GEN_100; 
  wire [35:0] _GEN_101; 
  wire [35:0] _GEN_102; 
  wire [35:0] _T_1642; 
  wire  swPinCtrl_0_oval; 
  wire  _T_1700; 
  wire  _T_1702; 
  wire  _T_1703; 
  wire  _T_1704; 
  wire  _T_1705; 
  wire  _T_1706; 
  wire  _T_1707; 
  wire  _T_1708; 
  wire  _T_1709; 
  wire  _T_1710; 
  wire  _T_1711; 
  wire  _T_1712; 
  wire  _T_1713; 
  wire  _T_1714; 
  wire  _T_1715; 
  wire  swPinCtrl_1_oval; 
  wire  _T_1724; 
  wire  _T_1726; 
  wire  _T_1727; 
  wire  _T_1728; 
  wire  _T_1729; 
  wire  _T_1730; 
  wire  _T_1731; 
  wire  _T_1732; 
  wire  _T_1733; 
  wire  _T_1734; 
  wire  _T_1735; 
  wire  _T_1736; 
  wire  _T_1737; 
  wire  _T_1738; 
  wire  _T_1739; 
  wire  swPinCtrl_2_oval; 
  wire  _T_1748; 
  wire  _T_1750; 
  wire  _T_1751; 
  wire  _T_1752; 
  wire  _T_1753; 
  wire  _T_1754; 
  wire  _T_1755; 
  wire  _T_1756; 
  wire  _T_1757; 
  wire  _T_1758; 
  wire  _T_1759; 
  wire  _T_1760; 
  wire  _T_1761; 
  wire  _T_1762; 
  wire  _T_1763; 
  wire  swPinCtrl_3_oval; 
  wire  _T_1772; 
  wire  _T_1774; 
  wire  _T_1775; 
  wire  _T_1776; 
  wire  _T_1777; 
  wire  _T_1778; 
  wire  _T_1779; 
  wire  _T_1780; 
  wire  _T_1781; 
  wire  _T_1782; 
  wire  _T_1783; 
  wire  _T_1784; 
  wire  _T_1785; 
  wire  _T_1786; 
  wire  _T_1787; 
  TLBuffer_34 buffer ( 
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
  IntSyncCrossingSource_20 intsource ( 
    .clock(intsource_clock),
    .reset(intsource_reset),
    .auto_in_0(intsource_auto_in_0),
    .auto_in_1(intsource_auto_in_1),
    .auto_in_2(intsource_auto_in_2),
    .auto_in_3(intsource_auto_in_3),
    .auto_out_sync_0(intsource_auto_out_sync_0),
    .auto_out_sync_1(intsource_auto_out_sync_1),
    .auto_out_sync_2(intsource_auto_out_sync_2),
    .auto_out_sync_3(intsource_auto_out_sync_3)
  );
  TLMonitor_91 TLMonitor ( 
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
  AsyncResetRegVec_w4_i0 oeReg ( 
    .clock(oeReg_clock),
    .reset(oeReg_reset),
    .io_d(oeReg_io_d),
    .io_q(oeReg_io_q),
    .io_en(oeReg_io_en)
  );
  AsyncResetRegVec_w4_i0 pueReg ( 
    .clock(pueReg_clock),
    .reset(pueReg_reset),
    .io_d(pueReg_io_d),
    .io_q(pueReg_io_q),
    .io_en(pueReg_io_en)
  );
  AsyncResetRegVec_w4_i0 ieReg ( 
    .clock(ieReg_clock),
    .reset(ieReg_reset),
    .io_d(ieReg_io_d),
    .io_q(ieReg_io_q),
    .io_en(ieReg_io_en)
  );
  SynchronizerShiftReg_w4_d3 inSyncReg ( 
    .clock(inSyncReg_clock),
    .io_d(inSyncReg_io_d),
    .io_q(inSyncReg_io_q)
  );
  AsyncResetRegVec_w4_i0 iofEnReg ( 
    .clock(iofEnReg_clock),
    .reset(iofEnReg_reset),
    .io_d(iofEnReg_io_d),
    .io_q(iofEnReg_io_q),
    .io_en(iofEnReg_io_en)
  );
  assign _T_371 = ~ valueReg; 
  assign inSyncReg_1 = inSyncReg_io_q; 
  assign rise = _T_371 & inSyncReg_1; 
  assign _T_372 = ~ inSyncReg_1; 
  assign fall = valueReg & _T_372; 
  assign _T_81_a_bits_opcode = buffer_auto_out_a_bits_opcode; 
  assign _T_381 = _T_81_a_bits_opcode == 3'h4; 
  assign _T_81_a_bits_address = buffer_auto_out_a_bits_address; 
  assign _T_382 = _T_81_a_bits_address[30:3]; 
  assign _T_81_a_bits_source = buffer_auto_out_a_bits_source; 
  assign _T_81_a_bits_size = buffer_auto_out_a_bits_size; 
  assign _T_383 = {_T_81_a_bits_source,_T_81_a_bits_size}; 
  assign _T_378_bits_index = _T_382[8:0]; 
  assign _T_399 = _T_378_bits_index & 9'h1f0; 
  assign _T_401 = _T_399 == 9'h0; 
  assign _T_81_a_bits_mask = buffer_auto_out_a_bits_mask; 
  assign _T_511 = _T_81_a_bits_mask[0]; 
  assign _T_512 = _T_81_a_bits_mask[1]; 
  assign _T_513 = _T_81_a_bits_mask[2]; 
  assign _T_514 = _T_81_a_bits_mask[3]; 
  assign _T_515 = _T_81_a_bits_mask[4]; 
  assign _T_516 = _T_81_a_bits_mask[5]; 
  assign _T_517 = _T_81_a_bits_mask[6]; 
  assign _T_518 = _T_81_a_bits_mask[7]; 
  assign _T_520 = _T_511 ? 8'hff : 8'h0; 
  assign _T_522 = _T_512 ? 8'hff : 8'h0; 
  assign _T_524 = _T_513 ? 8'hff : 8'h0; 
  assign _T_526 = _T_514 ? 8'hff : 8'h0; 
  assign _T_528 = _T_515 ? 8'hff : 8'h0; 
  assign _T_530 = _T_516 ? 8'hff : 8'h0; 
  assign _T_532 = _T_517 ? 8'hff : 8'h0; 
  assign _T_534 = _T_518 ? 8'hff : 8'h0; 
  assign _T_535 = {_T_522,_T_520}; 
  assign _T_536 = {_T_526,_T_524}; 
  assign _T_537 = {_T_536,_T_535}; 
  assign _T_538 = {_T_530,_T_528}; 
  assign _T_539 = {_T_534,_T_532}; 
  assign _T_540 = {_T_539,_T_538}; 
  assign _T_541 = {_T_540,_T_537}; 
  assign _T_573 = _T_541[3:0]; 
  assign _T_576 = ~ _T_573; 
  assign _T_577 = _T_576 == 4'h0; 
  assign _T_81_a_valid = buffer_auto_out_a_valid; 
  assign _T_81_d_ready = buffer_auto_out_d_ready; 
  assign _T_1049 = _T_378_bits_index[3]; 
  assign _T_1048 = _T_378_bits_index[2]; 
  assign _T_1056 = {_T_1049,_T_1048}; 
  assign _T_1047 = _T_378_bits_index[1]; 
  assign _T_1046 = _T_378_bits_index[0]; 
  assign _T_1055 = {_T_1047,_T_1046}; 
  assign _T_1057 = {_T_1056,_T_1055}; 
  assign _T_1092 = _T_81_a_valid & _T_81_d_ready; 
  assign _T_1058 = 16'h1 << _T_1057; 
  assign _T_1059 = _T_1058[0]; 
  assign _T_1216 = _T_381 == 1'h0; 
  assign _T_1217 = _T_1092 & _T_1216; 
  assign _T_1220 = _T_1217 & _T_1059; 
  assign _T_1221 = _T_1220 & _T_401; 
  assign _T_81_a_bits_data = buffer_auto_out_a_bits_data; 
  assign _T_587 = _T_81_a_bits_data[3:0]; 
  assign _T_598 = _T_541[35:32]; 
  assign _T_601 = ~ _T_598; 
  assign _T_602 = _T_601 == 4'h0; 
  assign _T_612 = _T_81_a_bits_data[35:32]; 
  assign _T_621 = {{28'd0}, valueReg}; 
  assign _T_622 = {ieReg_io_q,_T_621}; 
  assign _T_1064 = _T_1058[5]; 
  assign _T_1250 = _T_1217 & _T_1064; 
  assign _T_1251 = _T_1250 & _T_401; 
  assign _T_637 = _T_1251 & _T_577; 
  assign _T_662 = _T_1251 & _T_602; 
  assign _T_665 = ~ highIpReg; 
  assign _T_666 = _T_662 ? _T_612 : 4'h0; 
  assign _T_667 = _T_665 | _T_666; 
  assign _T_668 = ~ _T_667; 
  assign _T_669 = _T_668 | valueReg; 
  assign _T_678 = {{28'd0}, highIeReg}; 
  assign _T_679 = {highIpReg,_T_678}; 
  assign _T_1060 = _T_1058[1]; 
  assign _T_1226 = _T_1217 & _T_1060; 
  assign _T_1227 = _T_1226 & _T_401; 
  assign _T_705 = oeReg_io_q; 
  assign _T_719 = _T_1227 & _T_602; 
  assign _T_730 = {{28'd0}, _T_705}; 
  assign _T_731 = {portReg,_T_730}; 
  assign _T_1065 = _T_1058[6]; 
  assign _T_1256 = _T_1217 & _T_1065; 
  assign _T_1257 = _T_1256 & _T_401; 
  assign _T_746 = _T_1257 & _T_577; 
  assign _T_771 = _T_1257 & _T_602; 
  assign _T_774 = ~ lowIpReg; 
  assign _T_775 = _T_771 ? _T_612 : 4'h0; 
  assign _T_776 = _T_774 | _T_775; 
  assign _T_777 = ~ _T_776; 
  assign _T_778 = _T_777 | _T_371; 
  assign _T_787 = {{28'd0}, lowIeReg}; 
  assign _T_788 = {lowIpReg,_T_787}; 
  assign _T_1061 = _T_1058[2]; 
  assign _T_1232 = _T_1217 & _T_1061; 
  assign _T_1233 = _T_1232 & _T_401; 
  assign _T_814 = pueReg_io_q; 
  assign _T_828 = _T_1233 & _T_602; 
  assign _T_839 = {{28'd0}, _T_814}; 
  assign _T_840 = {dsReg,_T_839}; 
  assign _T_1062 = _T_1058[3]; 
  assign _T_1238 = _T_1217 & _T_1062; 
  assign _T_1239 = _T_1238 & _T_401; 
  assign _T_907 = _T_1239 & _T_577; 
  assign _T_932 = _T_1239 & _T_602; 
  assign _T_935 = ~ riseIpReg; 
  assign _T_936 = _T_932 ? _T_612 : 4'h0; 
  assign _T_937 = _T_935 | _T_936; 
  assign _T_938 = ~ _T_937; 
  assign _T_939 = _T_938 | rise; 
  assign _T_948 = {{28'd0}, riseIeReg}; 
  assign _T_949 = {riseIpReg,_T_948}; 
  assign _T_1067 = _T_1058[8]; 
  assign _T_1268 = _T_1217 & _T_1067; 
  assign _T_1269 = _T_1268 & _T_401; 
  assign _T_964 = _T_1269 & _T_577; 
  assign _T_1063 = _T_1058[4]; 
  assign _T_1244 = _T_1217 & _T_1063; 
  assign _T_1245 = _T_1244 & _T_401; 
  assign _T_989 = _T_1245 & _T_577; 
  assign _T_1014 = _T_1245 & _T_602; 
  assign _T_1017 = ~ fallIpReg; 
  assign _T_1018 = _T_1014 ? _T_612 : 4'h0; 
  assign _T_1019 = _T_1017 | _T_1018; 
  assign _T_1020 = ~ _T_1019; 
  assign _T_1021 = _T_1020 | fall; 
  assign _T_1030 = {{28'd0}, fallIeReg}; 
  assign _T_1031 = {fallIpReg,_T_1030}; 
  assign _GEN_72 = 4'h1 == _T_1057 ? _T_401 : _T_401; 
  assign _GEN_73 = 4'h2 == _T_1057 ? _T_401 : _GEN_72; 
  assign _GEN_74 = 4'h3 == _T_1057 ? _T_401 : _GEN_73; 
  assign _GEN_75 = 4'h4 == _T_1057 ? _T_401 : _GEN_74; 
  assign _GEN_76 = 4'h5 == _T_1057 ? _T_401 : _GEN_75; 
  assign _GEN_77 = 4'h6 == _T_1057 ? _T_401 : _GEN_76; 
  assign _GEN_78 = 4'h7 == _T_1057 ? _T_401 : _GEN_77; 
  assign _GEN_79 = 4'h8 == _T_1057 ? _T_401 : _GEN_78; 
  assign _GEN_80 = 4'h9 == _T_1057 ? 1'h1 : _GEN_79; 
  assign _GEN_81 = 4'ha == _T_1057 ? 1'h1 : _GEN_80; 
  assign _GEN_82 = 4'hb == _T_1057 ? 1'h1 : _GEN_81; 
  assign _GEN_83 = 4'hc == _T_1057 ? 1'h1 : _GEN_82; 
  assign _GEN_84 = 4'hd == _T_1057 ? 1'h1 : _GEN_83; 
  assign _GEN_85 = 4'he == _T_1057 ? 1'h1 : _GEN_84; 
  assign _GEN_86 = 4'hf == _T_1057 ? 1'h1 : _GEN_85; 
  assign _GEN_88 = 4'h1 == _T_1057 ? _T_731 : _T_622; 
  assign _GEN_89 = 4'h2 == _T_1057 ? _T_840 : _GEN_88; 
  assign _GEN_90 = 4'h3 == _T_1057 ? _T_949 : _GEN_89; 
  assign _GEN_91 = 4'h4 == _T_1057 ? _T_1031 : _GEN_90; 
  assign _GEN_92 = 4'h5 == _T_1057 ? _T_679 : _GEN_91; 
  assign _GEN_93 = 4'h6 == _T_1057 ? _T_788 : _GEN_92; 
  assign _GEN_94 = 4'h7 == _T_1057 ? 36'h0 : _GEN_93; 
  assign _T_1621_8 = {{32'd0}, xorReg}; 
  assign _GEN_95 = 4'h8 == _T_1057 ? _T_1621_8 : _GEN_94; 
  assign _GEN_96 = 4'h9 == _T_1057 ? 36'h0 : _GEN_95; 
  assign _GEN_97 = 4'ha == _T_1057 ? 36'h0 : _GEN_96; 
  assign _GEN_98 = 4'hb == _T_1057 ? 36'h0 : _GEN_97; 
  assign _GEN_99 = 4'hc == _T_1057 ? 36'h0 : _GEN_98; 
  assign _GEN_100 = 4'hd == _T_1057 ? 36'h0 : _GEN_99; 
  assign _GEN_101 = 4'he == _T_1057 ? 36'h0 : _GEN_100; 
  assign _GEN_102 = 4'hf == _T_1057 ? 36'h0 : _GEN_101; 
  assign _T_1642 = _GEN_86 ? _GEN_102 : 36'h0; 
  assign swPinCtrl_0_oval = portReg[0]; 
  assign _T_1700 = xorReg[0]; 
  assign _T_1702 = riseIpReg[0]; 
  assign _T_1703 = riseIeReg[0]; 
  assign _T_1704 = _T_1702 & _T_1703; 
  assign _T_1705 = fallIpReg[0]; 
  assign _T_1706 = fallIeReg[0]; 
  assign _T_1707 = _T_1705 & _T_1706; 
  assign _T_1708 = _T_1704 | _T_1707; 
  assign _T_1709 = highIpReg[0]; 
  assign _T_1710 = highIeReg[0]; 
  assign _T_1711 = _T_1709 & _T_1710; 
  assign _T_1712 = _T_1708 | _T_1711; 
  assign _T_1713 = lowIpReg[0]; 
  assign _T_1714 = lowIeReg[0]; 
  assign _T_1715 = _T_1713 & _T_1714; 
  assign swPinCtrl_1_oval = portReg[1]; 
  assign _T_1724 = xorReg[1]; 
  assign _T_1726 = riseIpReg[1]; 
  assign _T_1727 = riseIeReg[1]; 
  assign _T_1728 = _T_1726 & _T_1727; 
  assign _T_1729 = fallIpReg[1]; 
  assign _T_1730 = fallIeReg[1]; 
  assign _T_1731 = _T_1729 & _T_1730; 
  assign _T_1732 = _T_1728 | _T_1731; 
  assign _T_1733 = highIpReg[1]; 
  assign _T_1734 = highIeReg[1]; 
  assign _T_1735 = _T_1733 & _T_1734; 
  assign _T_1736 = _T_1732 | _T_1735; 
  assign _T_1737 = lowIpReg[1]; 
  assign _T_1738 = lowIeReg[1]; 
  assign _T_1739 = _T_1737 & _T_1738; 
  assign swPinCtrl_2_oval = portReg[2]; 
  assign _T_1748 = xorReg[2]; 
  assign _T_1750 = riseIpReg[2]; 
  assign _T_1751 = riseIeReg[2]; 
  assign _T_1752 = _T_1750 & _T_1751; 
  assign _T_1753 = fallIpReg[2]; 
  assign _T_1754 = fallIeReg[2]; 
  assign _T_1755 = _T_1753 & _T_1754; 
  assign _T_1756 = _T_1752 | _T_1755; 
  assign _T_1757 = highIpReg[2]; 
  assign _T_1758 = highIeReg[2]; 
  assign _T_1759 = _T_1757 & _T_1758; 
  assign _T_1760 = _T_1756 | _T_1759; 
  assign _T_1761 = lowIpReg[2]; 
  assign _T_1762 = lowIeReg[2]; 
  assign _T_1763 = _T_1761 & _T_1762; 
  assign swPinCtrl_3_oval = portReg[3]; 
  assign _T_1772 = xorReg[3]; 
  assign _T_1774 = riseIpReg[3]; 
  assign _T_1775 = riseIeReg[3]; 
  assign _T_1776 = _T_1774 & _T_1775; 
  assign _T_1777 = fallIpReg[3]; 
  assign _T_1778 = fallIeReg[3]; 
  assign _T_1779 = _T_1777 & _T_1778; 
  assign _T_1780 = _T_1776 | _T_1779; 
  assign _T_1781 = highIpReg[3]; 
  assign _T_1782 = highIeReg[3]; 
  assign _T_1783 = _T_1781 & _T_1782; 
  assign _T_1784 = _T_1780 | _T_1783; 
  assign _T_1785 = lowIpReg[3]; 
  assign _T_1786 = lowIeReg[3]; 
  assign _T_1787 = _T_1785 & _T_1786; 
  assign auto_int_xing_out_sync_0 = intsource_auto_out_sync_0; 
  assign auto_int_xing_out_sync_1 = intsource_auto_out_sync_1; 
  assign auto_int_xing_out_sync_2 = intsource_auto_out_sync_2; 
  assign auto_int_xing_out_sync_3 = intsource_auto_out_sync_3; 
  assign auto_control_xing_in_a_ready = buffer_auto_in_a_ready; 
  assign auto_control_xing_in_d_valid = buffer_auto_in_d_valid; 
  assign auto_control_xing_in_d_bits_opcode = buffer_auto_in_d_bits_opcode; 
  assign auto_control_xing_in_d_bits_size = buffer_auto_in_d_bits_size; 
  assign auto_control_xing_in_d_bits_source = buffer_auto_in_d_bits_source; 
  assign auto_control_xing_in_d_bits_data = buffer_auto_in_d_bits_data; 
  assign auto_io_out_pins_0_o_oval = swPinCtrl_0_oval ^ _T_1700; 
  assign auto_io_out_pins_1_o_oval = swPinCtrl_1_oval ^ _T_1724; 
  assign auto_io_out_pins_2_o_oval = swPinCtrl_2_oval ^ _T_1748; 
  assign auto_io_out_pins_3_o_oval = swPinCtrl_3_oval ^ _T_1772; 
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
  assign buffer_auto_out_d_bits_opcode = {{2'd0}, _T_381}; 
  assign buffer_auto_out_d_bits_size = _T_383[1:0]; 
  assign buffer_auto_out_d_bits_source = _T_383[10:2]; 
  assign buffer_auto_out_d_bits_data = {{28'd0}, _T_1642}; 
  assign intsource_clock = clock; 
  assign intsource_reset = reset; 
  assign intsource_auto_in_0 = _T_1712 | _T_1715; 
  assign intsource_auto_in_1 = _T_1736 | _T_1739; 
  assign intsource_auto_in_2 = _T_1760 | _T_1763; 
  assign intsource_auto_in_3 = _T_1784 | _T_1787; 
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
  assign TLMonitor_io_in_d_bits_opcode = {{2'd0}, _T_381}; 
  assign TLMonitor_io_in_d_bits_size = _T_383[1:0]; 
  assign TLMonitor_io_in_d_bits_source = _T_383[10:2]; 
  assign oeReg_clock = clock; 
  assign oeReg_reset = reset; 
  assign oeReg_io_d = _T_81_a_bits_data[3:0]; 
  assign oeReg_io_en = _T_1227 & _T_577; 
  assign pueReg_clock = clock; 
  assign pueReg_reset = reset; 
  assign pueReg_io_d = _T_81_a_bits_data[3:0]; 
  assign pueReg_io_en = _T_1233 & _T_577; 
  assign ieReg_clock = clock; 
  assign ieReg_reset = reset; 
  assign ieReg_io_d = _T_81_a_bits_data[35:32]; 
  assign ieReg_io_en = _T_1221 & _T_602; 
  assign inSyncReg_clock = clock; 
  assign inSyncReg_io_d = 4'h0; 
  assign iofEnReg_clock = clock; 
  assign iofEnReg_reset = reset; 
  assign iofEnReg_io_d = 4'h0;
  assign iofEnReg_io_en = 1'h0;
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
  portReg = _RAND_0[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  dsReg = _RAND_1[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  valueReg = _RAND_2[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  highIeReg = _RAND_3[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  lowIeReg = _RAND_4[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  riseIeReg = _RAND_5[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  fallIeReg = _RAND_6[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  highIpReg = _RAND_7[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  lowIpReg = _RAND_8[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  riseIpReg = _RAND_9[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  fallIpReg = _RAND_10[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  xorReg = _RAND_11[3:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      portReg <= 4'h0;
    end else begin
      if (_T_719) begin
        portReg <= _T_612;
      end
    end
    if (reset) begin
      dsReg <= 4'h0;
    end else begin
      if (_T_828) begin
        dsReg <= _T_612;
      end
    end
    if (reset) begin
      valueReg <= 4'h0;
    end else begin
      valueReg <= inSyncReg_1;
    end
    if (reset) begin
      highIeReg <= 4'h0;
    end else begin
      if (_T_637) begin
        highIeReg <= _T_587;
      end
    end
    if (reset) begin
      lowIeReg <= 4'h0;
    end else begin
      if (_T_746) begin
        lowIeReg <= _T_587;
      end
    end
    if (reset) begin
      riseIeReg <= 4'h0;
    end else begin
      if (_T_907) begin
        riseIeReg <= _T_587;
      end
    end
    if (reset) begin
      fallIeReg <= 4'h0;
    end else begin
      if (_T_989) begin
        fallIeReg <= _T_587;
      end
    end
    if (reset) begin
      highIpReg <= 4'h0;
    end else begin
      highIpReg <= _T_669;
    end
    if (reset) begin
      lowIpReg <= 4'h0;
    end else begin
      lowIpReg <= _T_778;
    end
    if (reset) begin
      riseIpReg <= 4'h0;
    end else begin
      riseIpReg <= _T_939;
    end
    if (reset) begin
      fallIpReg <= 4'h0;
    end else begin
      fallIpReg <= _T_1021;
    end
    if (reset) begin
      xorReg <= 4'h0;
    end else begin
      if (_T_964) begin
        xorReg <= _T_587;
      end
    end
  end
endmodule
