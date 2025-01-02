module TLSPI( 
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
  output        auto_io_out_sck, 
  output        auto_io_out_dq_0_o, 
  input         auto_io_out_dq_1_i, 
  output        auto_io_out_cs_0 ,

  output wire                         rxq_io_enq_ready           ,
    output wire                         rxq_io_enq_valid           ,
    output wire        [   7: 0]        rxq_io_enq_bits            ,
    output wire                         rxq_io_deq_ready           ,
    output wire                         rxq_io_deq_valid           ,
    output wire        [   7: 0]        rxq_io_deq_bits            ,
    output wire        [   3: 0]        rxq_io_count                
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
  wire  fifo_clock; 
  wire  fifo_reset; 
  wire [1:0] fifo_io_ctrl_fmt_proto; 
  wire  fifo_io_ctrl_fmt_endian; 
  wire  fifo_io_ctrl_fmt_iodir; 
  wire [3:0] fifo_io_ctrl_fmt_len; 
  wire [1:0] fifo_io_ctrl_cs_mode; 
  wire [3:0] fifo_io_ctrl_wm_tx; 
  wire [3:0] fifo_io_ctrl_wm_rx; 
  wire  fifo_io_link_tx_ready; 
  wire  fifo_io_link_tx_valid; 
  wire [7:0] fifo_io_link_tx_bits; 
  wire  fifo_io_link_rx_valid; 
  wire [7:0] fifo_io_link_rx_bits; 
  wire [7:0] fifo_io_link_cnt; 
  wire [1:0] fifo_io_link_fmt_proto; 
  wire  fifo_io_link_fmt_endian; 
  wire  fifo_io_link_fmt_iodir; 
  wire  fifo_io_link_cs_set; 
  wire  fifo_io_link_cs_clear; 
  wire  fifo_io_tx_ready; 
  wire  fifo_io_tx_valid; 
  wire [7:0] fifo_io_tx_bits; 
  wire  fifo_io_rx_ready; 
  wire  fifo_io_rx_valid; 
  wire [7:0] fifo_io_rx_bits; 
  wire  fifo_io_ip_txwm; 
  wire  fifo_io_ip_rxwm; 
  wire  mac_clock; 
  wire  mac_reset; 
  wire  mac_io_port_sck; 
  wire  mac_io_port_dq_0_o; 
  wire  mac_io_port_dq_1_i; 
  wire  mac_io_port_cs_0; 
  wire [11:0] mac_io_ctrl_sck_div; 
  wire  mac_io_ctrl_sck_pol; 
  wire  mac_io_ctrl_sck_pha; 
  wire [7:0] mac_io_ctrl_dla_cssck; 
  wire [7:0] mac_io_ctrl_dla_sckcs; 
  wire [7:0] mac_io_ctrl_dla_intercs; 
  wire [7:0] mac_io_ctrl_dla_interxfr; 
  wire  mac_io_ctrl_cs_id; 
  wire  mac_io_ctrl_cs_dflt_0; 
  wire [11:0] mac_io_ctrl_extradel_coarse; 
  wire [4:0] mac_io_ctrl_sampledel_sd; 
  wire  mac_io_link_tx_ready; 
  wire  mac_io_link_tx_valid; 
  wire [7:0] mac_io_link_tx_bits; 
  wire  mac_io_link_rx_valid; 
  wire [7:0] mac_io_link_rx_bits; 
  wire [7:0] mac_io_link_cnt; 
  wire [1:0] mac_io_link_fmt_proto; 
  wire  mac_io_link_fmt_endian; 
  wire  mac_io_link_cs_set; 
  wire  mac_io_link_cs_clear; 
  reg [1:0] ctrl_fmt_proto; 
  reg [31:0] _RAND_0;
  reg  ctrl_fmt_endian; 
  reg [31:0] _RAND_1;
  reg  ctrl_fmt_iodir; 
  reg [31:0] _RAND_2;
  reg [3:0] ctrl_fmt_len; 
  reg [31:0] _RAND_3;
  reg [11:0] ctrl_sck_div; 
  reg [31:0] _RAND_4;
  reg  ctrl_sck_pol; 
  reg [31:0] _RAND_5;
  reg  ctrl_sck_pha; 
  reg [31:0] _RAND_6;
  reg  ctrl_cs_id; 
  reg [31:0] _RAND_7;
  reg  ctrl_cs_dflt_0; 
  reg [31:0] _RAND_8;
  reg [1:0] ctrl_cs_mode; 
  reg [31:0] _RAND_9;
  reg [7:0] ctrl_dla_cssck; 
  reg [31:0] _RAND_10;
  reg [7:0] ctrl_dla_sckcs; 
  reg [31:0] _RAND_11;
  reg [7:0] ctrl_dla_intercs; 
  reg [31:0] _RAND_12;
  reg [7:0] ctrl_dla_interxfr; 
  reg [31:0] _RAND_13;
  reg [3:0] ctrl_wm_tx; 
  reg [31:0] _RAND_14;
  reg [3:0] ctrl_wm_rx; 
  reg [31:0] _RAND_15;
  reg [11:0] ctrl_extradel_coarse; 
  reg [31:0] _RAND_16;
  reg [4:0] ctrl_sampledel_sd; 
  reg [31:0] _RAND_17;
  reg  ie_txwm; 
  reg [31:0] _RAND_18;
  reg  ie_rxwm; 
  reg [31:0] _RAND_19;
  wire  _T_410; 
  wire  _T_411; 
  wire  _T_415; 
  wire  _T_416; 
  wire [2:0] _T_108_a_bits_opcode; 
  wire  _T_424; 
  wire [30:0] _T_108_a_bits_address; 
  wire [27:0] _T_425; 
  wire [8:0] _T_108_a_bits_source; 
  wire [1:0] _T_108_a_bits_size; 
  wire [10:0] _T_426; 
  wire [8:0] _T_421_bits_index; 
  wire [8:0] _T_442; 
  wire  _T_444; 
  wire [7:0] _T_108_a_bits_mask; 
  wire  _T_598; 
  wire  _T_599; 
  wire  _T_600; 
  wire  _T_601; 
  wire  _T_602; 
  wire  _T_603; 
  wire  _T_604; 
  wire  _T_605; 
  wire [7:0] _T_607; 
  wire [7:0] _T_609; 
  wire [7:0] _T_611; 
  wire [7:0] _T_613; 
  wire [7:0] _T_615; 
  wire [7:0] _T_617; 
  wire [7:0] _T_619; 
  wire [7:0] _T_621; 
  wire [15:0] _T_622; 
  wire [15:0] _T_623; 
  wire [31:0] _T_624; 
  wire [15:0] _T_625; 
  wire [15:0] _T_626; 
  wire [31:0] _T_627; 
  wire [63:0] _T_628; 
  wire [11:0] _T_660; 
  wire [11:0] _T_663; 
  wire  _T_664; 
  wire  _T_108_a_valid; 
  wire  _T_108_d_ready; 
  wire  _T_1417; 
  wire  _T_1416; 
  wire [1:0] _T_1424; 
  wire  _T_1415; 
  wire  _T_1414; 
  wire [1:0] _T_1423; 
  wire [3:0] _T_1425; 
  wire  _T_1460; 
  wire  _T_1461; 
  wire [15:0] _T_1426; 
  wire  _T_1427; 
  wire  _T_1584; 
  wire  _T_1585; 
  wire  _T_1588; 
  wire  _T_1589; 
  wire  _T_672; 
  wire [63:0] _T_108_a_bits_data; 
  wire [11:0] _T_674; 
  wire  _T_685; 
  wire  _T_688; 
  wire  _T_689; 
  wire  _T_697; 
  wire  _T_699; 
  wire [31:0] _T_708; 
  wire [32:0] _T_709; 
  wire  _T_712; 
  wire  _T_715; 
  wire  _T_716; 
  wire  _T_724; 
  wire  _T_726; 
  wire [33:0] _T_736; 
  wire [7:0] _T_739; 
  wire [7:0] _T_742; 
  wire  _T_743; 
  wire  _T_1432; 
  wire  _T_1618; 
  wire  _T_1619; 
  wire  _T_751; 
  wire [7:0] _T_753; 
  wire [7:0] _T_764; 
  wire [7:0] _T_767; 
  wire  _T_768; 
  wire  _T_776; 
  wire [7:0] _T_778; 
  wire [15:0] _T_787; 
  wire [23:0] _T_788; 
  wire [7:0] _T_791; 
  wire  _T_792; 
  wire [7:0] _T_794; 
  wire  _T_795; 
  wire  _T_803; 
  wire [7:0] _T_805; 
  wire [31:0] _T_814; 
  wire [39:0] _T_815; 
  wire [7:0] _T_818; 
  wire [7:0] _T_821; 
  wire  _T_822; 
  wire  _T_830; 
  wire [7:0] _T_832; 
  wire [47:0] _T_841; 
  wire [55:0] _T_842; 
  wire [3:0] _T_845; 
  wire [3:0] _T_848; 
  wire  _T_849; 
  wire  _T_1437; 
  wire  _T_1648; 
  wire  _T_1649; 
  wire  _T_857; 
  wire [3:0] _T_859; 
  wire [3:0] _T_870; 
  wire [3:0] _T_873; 
  wire  _T_874; 
  wire  _T_882; 
  wire [3:0] _T_884; 
  wire [31:0] _T_893; 
  wire [35:0] _T_894; 
  wire  _T_897; 
  wire  _T_900; 
  wire  _T_901; 
  wire  _T_1441; 
  wire  _T_1672; 
  wire  _T_1673; 
  wire  _T_909; 
  wire  _T_911; 
  wire  _T_922; 
  wire  _T_925; 
  wire  _T_926; 
  wire  _T_934; 
  wire  _T_936; 
  wire [1:0] _T_946; 
  wire [31:0] _T_972; 
  wire [32:0] _T_973; 
  wire [33:0] _T_1000; 
  wire  _T_1436; 
  wire  _T_1518; 
  wire  _T_1519; 
  wire  _T_1642; 
  wire  _T_1643; 
  wire  _T_1015; 
  wire  _T_1064; 
  wire  _T_1065; 
  wire  _T_1066; 
  wire  _T_1070; 
  wire  _T_1071; 
  wire  _T_1073; 
  wire  _T_1018; 
  wire [31:0] _T_1083; 
  wire [39:0] _T_1110; 
  wire [40:0] _T_1137; 
  wire [62:0] _T_1138; 
  wire [63:0] _T_1164; 
  wire  _T_1429; 
  wire  _T_1600; 
  wire  _T_1601; 
  wire  _T_1179; 
  wire  _T_1204; 
  wire [31:0] _T_1215; 
  wire [32:0] _T_1216; 
  wire  _T_1434; 
  wire  _T_1630; 
  wire  _T_1631; 
  wire  _T_1231; 
  wire [4:0] _T_1244; 
  wire [4:0] _T_1247; 
  wire  _T_1248; 
  wire  _T_1256; 
  wire [4:0] _T_1258; 
  wire [31:0] _T_1267; 
  wire [36:0] _T_1268; 
  wire [1:0] _T_1271; 
  wire [1:0] _T_1274; 
  wire  _T_1275; 
  wire  _T_1430; 
  wire  _T_1606; 
  wire  _T_1607; 
  wire  _T_1283; 
  wire [1:0] _T_1285; 
  wire  _T_1435; 
  wire  _T_1636; 
  wire  _T_1637; 
  wire  _T_1308; 
  wire  _T_1321; 
  wire  _T_1324; 
  wire  _T_1325; 
  wire  _T_1333; 
  wire  _T_1335; 
  wire [2:0] _T_1345; 
  wire  _T_1348; 
  wire  _T_1351; 
  wire  _T_1352; 
  wire  _T_1360; 
  wire  _T_1362; 
  wire [3:0] _T_1372; 
  wire [3:0] _T_1375; 
  wire [3:0] _T_1378; 
  wire  _T_1379; 
  wire  _T_1387; 
  wire [3:0] _T_1389; 
  wire [15:0] _T_1398; 
  wire [19:0] _T_1399; 
  wire  _GEN_85; 
  wire  _GEN_86; 
  wire  _GEN_87; 
  wire  _GEN_88; 
  wire  _GEN_89; 
  wire  _GEN_90; 
  wire  _GEN_91; 
  wire  _GEN_92; 
  wire  _GEN_93; 
  wire  _GEN_94; 
  wire  _GEN_95; 
  wire  _GEN_96; 
  wire  _GEN_97; 
  wire  _GEN_98; 
  wire  _GEN_99; 
  wire [63:0] _T_1989_0; 
  wire [63:0] _GEN_101; 
  wire [63:0] _T_1989_2; 
  wire [63:0] _GEN_102; 
  wire [63:0] _T_1989_3; 
  wire [63:0] _GEN_103; 
  wire [63:0] _GEN_104; 
  wire [63:0] _T_1989_5; 
  wire [63:0] _GEN_105; 
  wire [63:0] _GEN_106; 
  wire [63:0] _T_1989_7; 
  wire [63:0] _GEN_107; 
  wire [63:0] _T_1989_8; 
  wire [63:0] _GEN_108; 
  wire [63:0] _GEN_109; 
  wire [63:0] _T_1989_10; 
  wire [63:0] _GEN_110; 
  wire [63:0] _GEN_111; 
  wire [63:0] _GEN_112; 
  wire [63:0] _GEN_113; 
  wire [63:0] _T_1989_14; 
  wire [63:0] _GEN_114; 
  wire [63:0] _GEN_115; 
  TLBuffer_32 buffer ( 
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
  TLMonitor_80 TLMonitor ( 
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
  SPIFIFO fifo ( 
    .clock(fifo_clock),
    .reset(fifo_reset),
    .io_ctrl_fmt_proto(fifo_io_ctrl_fmt_proto),
    .io_ctrl_fmt_endian(fifo_io_ctrl_fmt_endian),
    .io_ctrl_fmt_iodir(fifo_io_ctrl_fmt_iodir),
    .io_ctrl_fmt_len(fifo_io_ctrl_fmt_len),
    .io_ctrl_cs_mode(fifo_io_ctrl_cs_mode),
    .io_ctrl_wm_tx(fifo_io_ctrl_wm_tx),
    .io_ctrl_wm_rx(fifo_io_ctrl_wm_rx),
    .io_link_tx_ready(fifo_io_link_tx_ready),
    .io_link_tx_valid(fifo_io_link_tx_valid),
    .io_link_tx_bits(fifo_io_link_tx_bits),
    .io_link_rx_valid(fifo_io_link_rx_valid),
    .io_link_rx_bits(fifo_io_link_rx_bits),
    .io_link_cnt(fifo_io_link_cnt),
    .io_link_fmt_proto(fifo_io_link_fmt_proto),
    .io_link_fmt_endian(fifo_io_link_fmt_endian),
    .io_link_fmt_iodir(fifo_io_link_fmt_iodir),
    .io_link_cs_set(fifo_io_link_cs_set),
    .io_link_cs_clear(fifo_io_link_cs_clear),
    .io_tx_ready(fifo_io_tx_ready),
    .io_tx_valid(fifo_io_tx_valid),
    .io_tx_bits(fifo_io_tx_bits),
    .io_rx_ready(fifo_io_rx_ready),
    .io_rx_valid(fifo_io_rx_valid),
    .io_rx_bits(fifo_io_rx_bits),
    .io_ip_txwm(fifo_io_ip_txwm),
    .io_ip_rxwm(fifo_io_ip_rxwm),

.rxq_io_enq_ready(rxq_io_enq_ready),
.rxq_io_enq_valid(rxq_io_enq_valid),
.rxq_io_enq_bits (rxq_io_enq_bits ),
.rxq_io_deq_ready(rxq_io_deq_ready),
.rxq_io_deq_valid(rxq_io_deq_valid),
.rxq_io_deq_bits (rxq_io_deq_bits ),
.rxq_io_count    (rxq_io_count    )
  );
  SPIMedia mac ( 
    .clock(mac_clock),
    .reset(mac_reset),
    .io_port_sck(mac_io_port_sck),
    .io_port_dq_0_o(mac_io_port_dq_0_o),
    .io_port_dq_1_i(mac_io_port_dq_1_i),
    .io_port_cs_0(mac_io_port_cs_0),
    .io_ctrl_sck_div(mac_io_ctrl_sck_div),
    .io_ctrl_sck_pol(mac_io_ctrl_sck_pol),
    .io_ctrl_sck_pha(mac_io_ctrl_sck_pha),
    .io_ctrl_dla_cssck(mac_io_ctrl_dla_cssck),
    .io_ctrl_dla_sckcs(mac_io_ctrl_dla_sckcs),
    .io_ctrl_dla_intercs(mac_io_ctrl_dla_intercs),
    .io_ctrl_dla_interxfr(mac_io_ctrl_dla_interxfr),
    .io_ctrl_cs_id(mac_io_ctrl_cs_id),
    .io_ctrl_cs_dflt_0(mac_io_ctrl_cs_dflt_0),
    .io_ctrl_extradel_coarse(mac_io_ctrl_extradel_coarse),
    .io_ctrl_sampledel_sd(mac_io_ctrl_sampledel_sd),
    .io_link_tx_ready(mac_io_link_tx_ready),
    .io_link_tx_valid(mac_io_link_tx_valid),
    .io_link_tx_bits(mac_io_link_tx_bits),
    .io_link_rx_valid(mac_io_link_rx_valid),
    .io_link_rx_bits(mac_io_link_rx_bits),
    .io_link_cnt(mac_io_link_cnt),
    .io_link_fmt_proto(mac_io_link_fmt_proto),
    .io_link_fmt_endian(mac_io_link_fmt_endian),
    .io_link_cs_set(mac_io_link_cs_set),
    .io_link_cs_clear(mac_io_link_cs_clear)
  );
  assign _T_410 = fifo_io_ip_txwm & ie_txwm; 
  assign _T_411 = fifo_io_ip_rxwm & ie_rxwm; 
  assign _T_415 = fifo_io_tx_ready == 1'h0; 
  assign _T_416 = fifo_io_rx_valid == 1'h0; 
  assign _T_108_a_bits_opcode = buffer_auto_out_a_bits_opcode; 
  assign _T_424 = _T_108_a_bits_opcode == 3'h4; 
  assign _T_108_a_bits_address = buffer_auto_out_a_bits_address; 
  assign _T_425 = _T_108_a_bits_address[30:3]; 
  assign _T_108_a_bits_source = buffer_auto_out_a_bits_source; 
  assign _T_108_a_bits_size = buffer_auto_out_a_bits_size; 
  assign _T_426 = {_T_108_a_bits_source,_T_108_a_bits_size}; 
  assign _T_421_bits_index = _T_425[8:0]; 
  assign _T_442 = _T_421_bits_index & 9'h1f0; 
  assign _T_444 = _T_442 == 9'h0; 
  assign _T_108_a_bits_mask = buffer_auto_out_a_bits_mask; 
  assign _T_598 = _T_108_a_bits_mask[0]; 
  assign _T_599 = _T_108_a_bits_mask[1]; 
  assign _T_600 = _T_108_a_bits_mask[2]; 
  assign _T_601 = _T_108_a_bits_mask[3]; 
  assign _T_602 = _T_108_a_bits_mask[4]; 
  assign _T_603 = _T_108_a_bits_mask[5]; 
  assign _T_604 = _T_108_a_bits_mask[6]; 
  assign _T_605 = _T_108_a_bits_mask[7]; 
  assign _T_607 = _T_598 ? 8'hff : 8'h0; 
  assign _T_609 = _T_599 ? 8'hff : 8'h0; 
  assign _T_611 = _T_600 ? 8'hff : 8'h0; 
  assign _T_613 = _T_601 ? 8'hff : 8'h0; 
  assign _T_615 = _T_602 ? 8'hff : 8'h0; 
  assign _T_617 = _T_603 ? 8'hff : 8'h0; 
  assign _T_619 = _T_604 ? 8'hff : 8'h0; 
  assign _T_621 = _T_605 ? 8'hff : 8'h0; 
  assign _T_622 = {_T_609,_T_607}; 
  assign _T_623 = {_T_613,_T_611}; 
  assign _T_624 = {_T_623,_T_622}; 
  assign _T_625 = {_T_617,_T_615}; 
  assign _T_626 = {_T_621,_T_619}; 
  assign _T_627 = {_T_626,_T_625}; 
  assign _T_628 = {_T_627,_T_624}; 
  assign _T_660 = _T_628[11:0]; 
  assign _T_663 = ~ _T_660; 
  assign _T_664 = _T_663 == 12'h0; 
  assign _T_108_a_valid = buffer_auto_out_a_valid; 
  assign _T_108_d_ready = buffer_auto_out_d_ready; 
  assign _T_1417 = _T_421_bits_index[3]; 
  assign _T_1416 = _T_421_bits_index[2]; 
  assign _T_1424 = {_T_1417,_T_1416}; 
  assign _T_1415 = _T_421_bits_index[1]; 
  assign _T_1414 = _T_421_bits_index[0]; 
  assign _T_1423 = {_T_1415,_T_1414}; 
  assign _T_1425 = {_T_1424,_T_1423}; 
  assign _T_1460 = _T_108_a_valid & _T_108_d_ready; 
  assign _T_1461 = _T_1460 & _T_424; 
  assign _T_1426 = 16'h1 << _T_1425; 
  assign _T_1427 = _T_1426[0]; 
  assign _T_1584 = _T_424 == 1'h0; 
  assign _T_1585 = _T_1460 & _T_1584; 
  assign _T_1588 = _T_1585 & _T_1427; 
  assign _T_1589 = _T_1588 & _T_444; 
  assign _T_672 = _T_1589 & _T_664; 
  assign _T_108_a_bits_data = buffer_auto_out_a_bits_data; 
  assign _T_674 = _T_108_a_bits_data[11:0]; 
  assign _T_685 = _T_628[32]; 
  assign _T_688 = ~ _T_685; 
  assign _T_689 = _T_688 == 1'h0; 
  assign _T_697 = _T_1589 & _T_689; 
  assign _T_699 = _T_108_a_bits_data[32]; 
  assign _T_708 = {{20'd0}, ctrl_sck_div}; 
  assign _T_709 = {ctrl_sck_pha,_T_708}; 
  assign _T_712 = _T_628[33]; 
  assign _T_715 = ~ _T_712; 
  assign _T_716 = _T_715 == 1'h0; 
  assign _T_724 = _T_1589 & _T_716; 
  assign _T_726 = _T_108_a_bits_data[33]; 
  assign _T_736 = {ctrl_sck_pol,_T_709}; 
  assign _T_739 = _T_628[7:0]; 
  assign _T_742 = ~ _T_739; 
  assign _T_743 = _T_742 == 8'h0; 
  assign _T_1432 = _T_1426[5]; 
  assign _T_1618 = _T_1585 & _T_1432; 
  assign _T_1619 = _T_1618 & _T_444; 
  assign _T_751 = _T_1619 & _T_743; 
  assign _T_753 = _T_108_a_bits_data[7:0]; 
  assign _T_764 = _T_628[23:16]; 
  assign _T_767 = ~ _T_764; 
  assign _T_768 = _T_767 == 8'h0; 
  assign _T_776 = _T_1619 & _T_768; 
  assign _T_778 = _T_108_a_bits_data[23:16]; 
  assign _T_787 = {{8'd0}, ctrl_dla_cssck}; 
  assign _T_788 = {ctrl_dla_sckcs,_T_787}; 
  assign _T_791 = _T_628[39:32]; 
  assign _T_792 = _T_791 != 8'h0; 
  assign _T_794 = ~ _T_791; 
  assign _T_795 = _T_794 == 8'h0; 
  assign _T_803 = _T_1619 & _T_795; 
  assign _T_805 = _T_108_a_bits_data[39:32]; 
  assign _T_814 = {{8'd0}, _T_788}; 
  assign _T_815 = {ctrl_dla_intercs,_T_814}; 
  assign _T_818 = _T_628[55:48]; 
  assign _T_821 = ~ _T_818; 
  assign _T_822 = _T_821 == 8'h0; 
  assign _T_830 = _T_1619 & _T_822; 
  assign _T_832 = _T_108_a_bits_data[55:48]; 
  assign _T_841 = {{8'd0}, _T_815}; 
  assign _T_842 = {ctrl_dla_interxfr,_T_841}; 
  assign _T_845 = _T_628[3:0]; 
  assign _T_848 = ~ _T_845; 
  assign _T_849 = _T_848 == 4'h0; 
  assign _T_1437 = _T_1426[10]; 
  assign _T_1648 = _T_1585 & _T_1437; 
  assign _T_1649 = _T_1648 & _T_444; 
  assign _T_857 = _T_1649 & _T_849; 
  assign _T_859 = _T_108_a_bits_data[3:0]; 
  assign _T_870 = _T_628[35:32]; 
  assign _T_873 = ~ _T_870; 
  assign _T_874 = _T_873 == 4'h0; 
  assign _T_882 = _T_1649 & _T_874; 
  assign _T_884 = _T_108_a_bits_data[35:32]; 
  assign _T_893 = {{28'd0}, ctrl_wm_tx}; 
  assign _T_894 = {ctrl_wm_rx,_T_893}; 
  assign _T_897 = _T_628[0]; 
  assign _T_900 = ~ _T_897; 
  assign _T_901 = _T_900 == 1'h0; 
  assign _T_1441 = _T_1426[14]; 
  assign _T_1672 = _T_1585 & _T_1441; 
  assign _T_1673 = _T_1672 & _T_444; 
  assign _T_909 = _T_1673 & _T_901; 
  assign _T_911 = _T_108_a_bits_data[0]; 
  assign _T_922 = _T_628[1]; 
  assign _T_925 = ~ _T_922; 
  assign _T_926 = _T_925 == 1'h0; 
  assign _T_934 = _T_1673 & _T_926; 
  assign _T_936 = _T_108_a_bits_data[1]; 
  assign _T_946 = {ie_rxwm,ie_txwm}; 
  assign _T_972 = {{30'd0}, _T_946}; 
  assign _T_973 = {fifo_io_ip_txwm,_T_972}; 
  assign _T_1000 = {fifo_io_ip_rxwm,_T_973}; 
  assign _T_1436 = _T_1426[9]; 
  assign _T_1518 = _T_1461 & _T_1436; 
  assign _T_1519 = _T_1518 & _T_444; 
  assign _T_1642 = _T_1585 & _T_1436; 
  assign _T_1643 = _T_1642 & _T_444; 
  assign _T_1015 = _T_1643 & _T_743; 
  assign _T_1064 = _T_628[31]; 
  assign _T_1065 = ~ _T_1064; 
  assign _T_1066 = _T_1065 == 1'h0; 
  assign _T_1070 = _T_1643 & _T_1066; 
  assign _T_1071 = _T_108_a_bits_data[31]; 
  assign _T_1073 = _T_1070 & _T_1071; 
  assign _T_1018 = _T_1073 == 1'h0; 
  assign _T_1083 = {_T_415,31'h0}; 
  assign _T_1110 = {fifo_io_rx_bits,_T_1083}; 
  assign _T_1137 = {1'h0,_T_1110}; 
  assign _T_1138 = {{22'd0}, _T_1137}; 
  assign _T_1164 = {_T_416,_T_1138}; 
  assign _T_1429 = _T_1426[2]; 
  assign _T_1600 = _T_1585 & _T_1429; 
  assign _T_1601 = _T_1600 & _T_444; 
  assign _T_1179 = _T_1601 & _T_901; 
  assign _T_1204 = _T_1601 & _T_689; 
  assign _T_1215 = {{31'd0}, ctrl_cs_id}; 
  assign _T_1216 = {ctrl_cs_dflt_0,_T_1215}; 
  assign _T_1434 = _T_1426[7]; 
  assign _T_1630 = _T_1585 & _T_1434; 
  assign _T_1631 = _T_1630 & _T_444; 
  assign _T_1231 = _T_1631 & _T_664; 
  assign _T_1244 = _T_628[36:32]; 
  assign _T_1247 = ~ _T_1244; 
  assign _T_1248 = _T_1247 == 5'h0; 
  assign _T_1256 = _T_1631 & _T_1248; 
  assign _T_1258 = _T_108_a_bits_data[36:32]; 
  assign _T_1267 = {{20'd0}, ctrl_extradel_coarse}; 
  assign _T_1268 = {ctrl_sampledel_sd,_T_1267}; 
  assign _T_1271 = _T_628[1:0]; 
  assign _T_1274 = ~ _T_1271; 
  assign _T_1275 = _T_1274 == 2'h0; 
  assign _T_1430 = _T_1426[3]; 
  assign _T_1606 = _T_1585 & _T_1430; 
  assign _T_1607 = _T_1606 & _T_444; 
  assign _T_1283 = _T_1607 & _T_1275; 
  assign _T_1285 = _T_108_a_bits_data[1:0]; 
  assign _T_1435 = _T_1426[8]; 
  assign _T_1636 = _T_1585 & _T_1435; 
  assign _T_1637 = _T_1636 & _T_444; 
  assign _T_1308 = _T_1637 & _T_1275; 
  assign _T_1321 = _T_628[2]; 
  assign _T_1324 = ~ _T_1321; 
  assign _T_1325 = _T_1324 == 1'h0; 
  assign _T_1333 = _T_1637 & _T_1325; 
  assign _T_1335 = _T_108_a_bits_data[2]; 
  assign _T_1345 = {ctrl_fmt_endian,ctrl_fmt_proto}; 
  assign _T_1348 = _T_628[3]; 
  assign _T_1351 = ~ _T_1348; 
  assign _T_1352 = _T_1351 == 1'h0; 
  assign _T_1360 = _T_1637 & _T_1352; 
  assign _T_1362 = _T_108_a_bits_data[3]; 
  assign _T_1372 = {ctrl_fmt_iodir,_T_1345}; 
  assign _T_1375 = _T_628[19:16]; 
  assign _T_1378 = ~ _T_1375; 
  assign _T_1379 = _T_1378 == 4'h0; 
  assign _T_1387 = _T_1637 & _T_1379; 
  assign _T_1389 = _T_108_a_bits_data[19:16]; 
  assign _T_1398 = {{12'd0}, _T_1372}; 
  assign _T_1399 = {ctrl_fmt_len,_T_1398}; 
  assign _GEN_85 = 4'h1 == _T_1425 ? 1'h1 : _T_444; 
  assign _GEN_86 = 4'h2 == _T_1425 ? _T_444 : _GEN_85; 
  assign _GEN_87 = 4'h3 == _T_1425 ? _T_444 : _GEN_86; 
  assign _GEN_88 = 4'h4 == _T_1425 ? 1'h1 : _GEN_87; 
  assign _GEN_89 = 4'h5 == _T_1425 ? _T_444 : _GEN_88; 
  assign _GEN_90 = 4'h6 == _T_1425 ? 1'h1 : _GEN_89; 
  assign _GEN_91 = 4'h7 == _T_1425 ? _T_444 : _GEN_90; 
  assign _GEN_92 = 4'h8 == _T_1425 ? _T_444 : _GEN_91; 
  assign _GEN_93 = 4'h9 == _T_1425 ? _T_444 : _GEN_92; 
  assign _GEN_94 = 4'ha == _T_1425 ? _T_444 : _GEN_93; 
  assign _GEN_95 = 4'hb == _T_1425 ? 1'h1 : _GEN_94; 
  assign _GEN_96 = 4'hc == _T_1425 ? 1'h1 : _GEN_95; 
  assign _GEN_97 = 4'hd == _T_1425 ? 1'h1 : _GEN_96; 
  assign _GEN_98 = 4'he == _T_1425 ? _T_444 : _GEN_97; 
  assign _GEN_99 = 4'hf == _T_1425 ? 1'h1 : _GEN_98; 
  assign _T_1989_0 = {{30'd0}, _T_736}; 
  assign _GEN_101 = 4'h1 == _T_1425 ? 64'h0 : _T_1989_0; 
  assign _T_1989_2 = {{31'd0}, _T_1216}; 
  assign _GEN_102 = 4'h2 == _T_1425 ? _T_1989_2 : _GEN_101; 
  assign _T_1989_3 = {{62'd0}, ctrl_cs_mode}; 
  assign _GEN_103 = 4'h3 == _T_1425 ? _T_1989_3 : _GEN_102; 
  assign _GEN_104 = 4'h4 == _T_1425 ? 64'h0 : _GEN_103; 
  assign _T_1989_5 = {{8'd0}, _T_842}; 
  assign _GEN_105 = 4'h5 == _T_1425 ? _T_1989_5 : _GEN_104; 
  assign _GEN_106 = 4'h6 == _T_1425 ? 64'h0 : _GEN_105; 
  assign _T_1989_7 = {{27'd0}, _T_1268}; 
  assign _GEN_107 = 4'h7 == _T_1425 ? _T_1989_7 : _GEN_106; 
  assign _T_1989_8 = {{44'd0}, _T_1399}; 
  assign _GEN_108 = 4'h8 == _T_1425 ? _T_1989_8 : _GEN_107; 
  assign _GEN_109 = 4'h9 == _T_1425 ? _T_1164 : _GEN_108; 
  assign _T_1989_10 = {{28'd0}, _T_894}; 
  assign _GEN_110 = 4'ha == _T_1425 ? _T_1989_10 : _GEN_109; 
  assign _GEN_111 = 4'hb == _T_1425 ? 64'h0 : _GEN_110; 
  assign _GEN_112 = 4'hc == _T_1425 ? 64'h0 : _GEN_111; 
  assign _GEN_113 = 4'hd == _T_1425 ? 64'h0 : _GEN_112; 
  assign _T_1989_14 = {{30'd0}, _T_1000}; 
  assign _GEN_114 = 4'he == _T_1425 ? _T_1989_14 : _GEN_113; 
  assign _GEN_115 = 4'hf == _T_1425 ? 64'h0 : _GEN_114; 
  assign auto_int_xing_out_sync_0 = intsource_auto_out_sync_0; 
  assign auto_control_xing_in_a_ready = buffer_auto_in_a_ready; 
  assign auto_control_xing_in_d_valid = buffer_auto_in_d_valid; 
  assign auto_control_xing_in_d_bits_opcode = buffer_auto_in_d_bits_opcode; 
  assign auto_control_xing_in_d_bits_size = buffer_auto_in_d_bits_size; 
  assign auto_control_xing_in_d_bits_source = buffer_auto_in_d_bits_source; 
  assign auto_control_xing_in_d_bits_data = buffer_auto_in_d_bits_data; 
  assign auto_io_out_sck = mac_io_port_sck; 
  assign auto_io_out_dq_0_o = mac_io_port_dq_0_o; 
  assign auto_io_out_cs_0 = mac_io_port_cs_0; 
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
  assign buffer_auto_out_d_bits_opcode = {{2'd0}, _T_424}; 
  assign buffer_auto_out_d_bits_size = _T_426[1:0]; 
  assign buffer_auto_out_d_bits_source = _T_426[10:2]; 
  assign buffer_auto_out_d_bits_data = _GEN_99 ? _GEN_115 : 64'h0; 
  assign intsource_clock = clock; 
  assign intsource_reset = reset; 
  assign intsource_auto_in_0 = _T_410 | _T_411; 
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
  assign TLMonitor_io_in_d_bits_opcode = {{2'd0}, _T_424}; 
  assign TLMonitor_io_in_d_bits_size = _T_426[1:0]; 
  assign TLMonitor_io_in_d_bits_source = _T_426[10:2]; 
  assign fifo_clock = clock; 
  assign fifo_reset = reset; 
  assign fifo_io_ctrl_fmt_proto = ctrl_fmt_proto; 
  assign fifo_io_ctrl_fmt_endian = ctrl_fmt_endian; 
  assign fifo_io_ctrl_fmt_iodir = ctrl_fmt_iodir; 
  assign fifo_io_ctrl_fmt_len = ctrl_fmt_len; 
  assign fifo_io_ctrl_cs_mode = ctrl_cs_mode; 
  assign fifo_io_ctrl_wm_tx = ctrl_wm_tx; 
  assign fifo_io_ctrl_wm_rx = ctrl_wm_rx; 
  assign fifo_io_link_tx_ready = mac_io_link_tx_ready; 
  assign fifo_io_link_rx_valid = mac_io_link_rx_valid; 
  assign fifo_io_link_rx_bits = mac_io_link_rx_bits; 
  assign fifo_io_tx_valid = _T_1015 & _T_1018; 
  assign fifo_io_tx_bits = _T_108_a_bits_data[7:0]; 
  assign fifo_io_rx_ready = _T_1519 & _T_792; 
  assign mac_clock = clock; 
  assign mac_reset = reset; 
  assign mac_io_port_dq_1_i = auto_io_out_dq_1_i; 
  assign mac_io_ctrl_sck_div = ctrl_sck_div; 
  assign mac_io_ctrl_sck_pol = ctrl_sck_pol; 
  assign mac_io_ctrl_sck_pha = ctrl_sck_pha; 
  assign mac_io_ctrl_dla_cssck = ctrl_dla_cssck; 
  assign mac_io_ctrl_dla_sckcs = ctrl_dla_sckcs; 
  assign mac_io_ctrl_dla_intercs = ctrl_dla_intercs; 
  assign mac_io_ctrl_dla_interxfr = ctrl_dla_interxfr; 
  assign mac_io_ctrl_cs_id = ctrl_cs_id; 
  assign mac_io_ctrl_cs_dflt_0 = ctrl_cs_dflt_0; 
  assign mac_io_ctrl_extradel_coarse = ctrl_extradel_coarse; 
  assign mac_io_ctrl_sampledel_sd = ctrl_sampledel_sd; 
  assign mac_io_link_tx_valid = fifo_io_link_tx_valid; 
  assign mac_io_link_tx_bits = fifo_io_link_tx_bits; 
  assign mac_io_link_cnt = fifo_io_link_cnt; 
  assign mac_io_link_fmt_proto = fifo_io_link_fmt_proto; 
  assign mac_io_link_fmt_endian = fifo_io_link_fmt_endian; 
  assign mac_io_link_cs_set = fifo_io_link_cs_set; 
  assign mac_io_link_cs_clear = fifo_io_link_cs_clear; 
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
  ctrl_fmt_proto = _RAND_0[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  ctrl_fmt_endian = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  ctrl_fmt_iodir = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  ctrl_fmt_len = _RAND_3[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  ctrl_sck_div = _RAND_4[11:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  ctrl_sck_pol = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  ctrl_sck_pha = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  ctrl_cs_id = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  ctrl_cs_dflt_0 = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  ctrl_cs_mode = _RAND_9[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  ctrl_dla_cssck = _RAND_10[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  ctrl_dla_sckcs = _RAND_11[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  ctrl_dla_intercs = _RAND_12[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  ctrl_dla_interxfr = _RAND_13[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  ctrl_wm_tx = _RAND_14[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  ctrl_wm_rx = _RAND_15[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  ctrl_extradel_coarse = _RAND_16[11:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  ctrl_sampledel_sd = _RAND_17[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  ie_txwm = _RAND_18[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  ie_rxwm = _RAND_19[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      ctrl_fmt_proto <= 2'h0;
    end else begin
      if (_T_1308) begin
        ctrl_fmt_proto <= _T_1285;
      end
    end
    if (reset) begin
      ctrl_fmt_endian <= 1'h0;
    end else begin
      if (_T_1333) begin
        ctrl_fmt_endian <= _T_1335;
      end
    end
    if (reset) begin
      ctrl_fmt_iodir <= 1'h0;
    end else begin
      if (_T_1360) begin
        ctrl_fmt_iodir <= _T_1362;
      end
    end
    if (reset) begin
      ctrl_fmt_len <= 4'h8;
    end else begin
      if (_T_1387) begin
        ctrl_fmt_len <= _T_1389;
      end
    end
    if (reset) begin
      ctrl_sck_div <= 12'h3;
    end else begin
      if (_T_672) begin
        ctrl_sck_div <= _T_674;
      end
    end
    if (reset) begin
      ctrl_sck_pol <= 1'h0;
    end else begin
      if (_T_724) begin
        ctrl_sck_pol <= _T_726;
      end
    end
    if (reset) begin
      ctrl_sck_pha <= 1'h0;
    end else begin
      if (_T_697) begin
        ctrl_sck_pha <= _T_699;
      end
    end
    if (reset) begin
      ctrl_cs_id <= 1'h0;
    end else begin
      if (_T_1179) begin
        ctrl_cs_id <= _T_911;
      end
    end
    if (reset) begin
      ctrl_cs_dflt_0 <= 1'h1;
    end else begin
      if (_T_1204) begin
        ctrl_cs_dflt_0 <= _T_699;
      end
    end
    if (reset) begin
      ctrl_cs_mode <= 2'h0;
    end else begin
      if (_T_1283) begin
        ctrl_cs_mode <= _T_1285;
      end
    end
    if (reset) begin
      ctrl_dla_cssck <= 8'h1;
    end else begin
      if (_T_751) begin
        ctrl_dla_cssck <= _T_753;
      end
    end
    if (reset) begin
      ctrl_dla_sckcs <= 8'h1;
    end else begin
      if (_T_776) begin
        ctrl_dla_sckcs <= _T_778;
      end
    end
    if (reset) begin
      ctrl_dla_intercs <= 8'h1;
    end else begin
      if (_T_803) begin
        ctrl_dla_intercs <= _T_805;
      end
    end
    if (reset) begin
      ctrl_dla_interxfr <= 8'h0;
    end else begin
      if (_T_830) begin
        ctrl_dla_interxfr <= _T_832;
      end
    end
    if (reset) begin
      ctrl_wm_tx <= 4'h0;
    end else begin
      if (_T_857) begin
        ctrl_wm_tx <= _T_859;
      end
    end
    if (reset) begin
      ctrl_wm_rx <= 4'h0;
    end else begin
      if (_T_882) begin
        ctrl_wm_rx <= _T_884;
      end
    end
    if (reset) begin
      ctrl_extradel_coarse <= 12'h0;
    end else begin
      if (_T_1231) begin
        ctrl_extradel_coarse <= _T_674;
      end
    end
    if (reset) begin
      ctrl_sampledel_sd <= 5'h3;
    end else begin
      if (_T_1256) begin
        ctrl_sampledel_sd <= _T_1258;
      end
    end
    if (reset) begin
      ie_txwm <= 1'h0;
    end else begin
      if (_T_909) begin
        ie_txwm <= _T_911;
      end
    end
    if (reset) begin
      ie_rxwm <= 1'h0;
    end else begin
      if (_T_934) begin
        ie_rxwm <= _T_936;
      end
    end
  end
endmodule
