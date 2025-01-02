module TLXbar_8( 
  input         clock, 
  input         reset, 
  output        auto_in_1_a_ready, 
  input         auto_in_1_a_valid, 
  input  [2:0]  auto_in_1_a_bits_opcode, 
  input  [2:0]  auto_in_1_a_bits_param, 
  input  [2:0]  auto_in_1_a_bits_size, 
  input         auto_in_1_a_bits_source, 
  input  [37:0] auto_in_1_a_bits_address, 
  input  [7:0]  auto_in_1_a_bits_mask, 
  input  [63:0] auto_in_1_a_bits_data, 
  input         auto_in_1_a_bits_corrupt, 
  input         auto_in_1_c_valid, 
  input         auto_in_1_d_ready, 
  output        auto_in_1_d_valid, 
  output [2:0]  auto_in_1_d_bits_opcode, 
  output [2:0]  auto_in_1_d_bits_size, 
  output [63:0] auto_in_1_d_bits_data, 
  output        auto_in_1_d_bits_corrupt, 
  input         auto_in_1_e_valid, 
  output        auto_in_0_a_ready, 
  input         auto_in_0_a_valid, 
  input  [2:0]  auto_in_0_a_bits_opcode, 
  input  [2:0]  auto_in_0_a_bits_param, 
  input  [2:0]  auto_in_0_a_bits_size, 
  input         auto_in_0_a_bits_source, 
  input  [37:0] auto_in_0_a_bits_address, 
  input  [7:0]  auto_in_0_a_bits_mask, 
  input  [63:0] auto_in_0_a_bits_data, 
  input         auto_in_0_a_bits_corrupt, 
  input         auto_in_0_b_ready, 
  output        auto_in_0_b_valid, 
  output [1:0]  auto_in_0_b_bits_param, 
  output [2:0]  auto_in_0_b_bits_size, 
  output        auto_in_0_b_bits_source, 
  output [37:0] auto_in_0_b_bits_address, 
  output        auto_in_0_c_ready, 
  input         auto_in_0_c_valid, 
  input  [2:0]  auto_in_0_c_bits_opcode, 
  input  [2:0]  auto_in_0_c_bits_param, 
  input  [2:0]  auto_in_0_c_bits_size, 
  input         auto_in_0_c_bits_source, 
  input  [37:0] auto_in_0_c_bits_address, 
  input  [63:0] auto_in_0_c_bits_data, 
  input         auto_in_0_c_bits_corrupt, 
  input         auto_in_0_d_ready, 
  output        auto_in_0_d_valid, 
  output [2:0]  auto_in_0_d_bits_opcode, 
  output [1:0]  auto_in_0_d_bits_param, 
  output [2:0]  auto_in_0_d_bits_size, 
  output        auto_in_0_d_bits_source, 
  output [2:0]  auto_in_0_d_bits_sink, 
  output        auto_in_0_d_bits_denied, 
  output [63:0] auto_in_0_d_bits_data, 
  output        auto_in_0_e_ready, 
  input         auto_in_0_e_valid, 
  input  [2:0]  auto_in_0_e_bits_sink, 
  input         auto_out_a_ready, 
  output        auto_out_a_valid, 
  output [2:0]  auto_out_a_bits_opcode, 
  output [2:0]  auto_out_a_bits_param, 
  output [2:0]  auto_out_a_bits_size, 
  output [1:0]  auto_out_a_bits_source, 
  output [37:0] auto_out_a_bits_address, 
  output [7:0]  auto_out_a_bits_mask, 
  output [63:0] auto_out_a_bits_data, 
  output        auto_out_a_bits_corrupt, 
  output        auto_out_b_ready, 
  input         auto_out_b_valid, 
  input  [2:0]  auto_out_b_bits_opcode, 
  input  [1:0]  auto_out_b_bits_param, 
  input  [2:0]  auto_out_b_bits_size, 
  input  [1:0]  auto_out_b_bits_source, 
  input  [37:0] auto_out_b_bits_address, 
  input  [7:0]  auto_out_b_bits_mask, 
  input         auto_out_b_bits_corrupt, 
  input         auto_out_c_ready, 
  output        auto_out_c_valid, 
  output [2:0]  auto_out_c_bits_opcode, 
  output [2:0]  auto_out_c_bits_param, 
  output [2:0]  auto_out_c_bits_size, 
  output [1:0]  auto_out_c_bits_source, 
  output [37:0] auto_out_c_bits_address, 
  output [63:0] auto_out_c_bits_data, 
  output        auto_out_c_bits_corrupt, 
  output        auto_out_d_ready, 
  input         auto_out_d_valid, 
  input  [2:0]  auto_out_d_bits_opcode, 
  input  [1:0]  auto_out_d_bits_param, 
  input  [2:0]  auto_out_d_bits_size, 
  input  [1:0]  auto_out_d_bits_source, 
  input  [2:0]  auto_out_d_bits_sink, 
  input         auto_out_d_bits_denied, 
  input  [63:0] auto_out_d_bits_data, 
  input         auto_out_d_bits_corrupt, 
  input         auto_out_e_ready, 
  output        auto_out_e_valid, 
  output [2:0]  auto_out_e_bits_sink 
);
  wire  TLMonitor_clock; 
  wire  TLMonitor_reset; 
  wire  TLMonitor_io_in_a_ready; 
  wire  TLMonitor_io_in_a_valid; 
  wire [2:0] TLMonitor_io_in_a_bits_opcode; 
  wire [2:0] TLMonitor_io_in_a_bits_param; 
  wire [2:0] TLMonitor_io_in_a_bits_size; 
  wire  TLMonitor_io_in_a_bits_source; 
  wire [37:0] TLMonitor_io_in_a_bits_address; 
  wire [7:0] TLMonitor_io_in_a_bits_mask; 
  wire  TLMonitor_io_in_a_bits_corrupt; 
  wire  TLMonitor_io_in_b_ready; 
  wire  TLMonitor_io_in_b_valid; 
  wire [2:0] TLMonitor_io_in_b_bits_opcode; 
  wire [1:0] TLMonitor_io_in_b_bits_param; 
  wire [2:0] TLMonitor_io_in_b_bits_size; 
  wire  TLMonitor_io_in_b_bits_source; 
  wire [37:0] TLMonitor_io_in_b_bits_address; 
  wire [7:0] TLMonitor_io_in_b_bits_mask; 
  wire  TLMonitor_io_in_b_bits_corrupt; 
  wire  TLMonitor_io_in_c_ready; 
  wire  TLMonitor_io_in_c_valid; 
  wire [2:0] TLMonitor_io_in_c_bits_opcode; 
  wire [2:0] TLMonitor_io_in_c_bits_param; 
  wire [2:0] TLMonitor_io_in_c_bits_size; 
  wire  TLMonitor_io_in_c_bits_source; 
  wire [37:0] TLMonitor_io_in_c_bits_address; 
  wire  TLMonitor_io_in_c_bits_corrupt; 
  wire  TLMonitor_io_in_d_ready; 
  wire  TLMonitor_io_in_d_valid; 
  wire [2:0] TLMonitor_io_in_d_bits_opcode; 
  wire [1:0] TLMonitor_io_in_d_bits_param; 
  wire [2:0] TLMonitor_io_in_d_bits_size; 
  wire  TLMonitor_io_in_d_bits_source; 
  wire [2:0] TLMonitor_io_in_d_bits_sink; 
  wire  TLMonitor_io_in_d_bits_denied; 
  wire  TLMonitor_io_in_d_bits_corrupt; 
  wire  TLMonitor_io_in_e_ready; 
  wire  TLMonitor_io_in_e_valid; 
  wire [2:0] TLMonitor_io_in_e_bits_sink; 
  wire  TLMonitor_1_clock; 
  wire  TLMonitor_1_reset; 
  wire  TLMonitor_1_io_in_a_ready; 
  wire  TLMonitor_1_io_in_a_valid; 
  wire [2:0] TLMonitor_1_io_in_a_bits_opcode; 
  wire [2:0] TLMonitor_1_io_in_a_bits_param; 
  wire [2:0] TLMonitor_1_io_in_a_bits_size; 
  wire  TLMonitor_1_io_in_a_bits_source; 
  wire [37:0] TLMonitor_1_io_in_a_bits_address; 
  wire [7:0] TLMonitor_1_io_in_a_bits_mask; 
  wire  TLMonitor_1_io_in_a_bits_corrupt; 
  wire  TLMonitor_1_io_in_c_valid; 
  wire  TLMonitor_1_io_in_d_ready; 
  wire  TLMonitor_1_io_in_d_valid; 
  wire [2:0] TLMonitor_1_io_in_d_bits_opcode; 
  wire [1:0] TLMonitor_1_io_in_d_bits_param; 
  wire [2:0] TLMonitor_1_io_in_d_bits_size; 
  wire [2:0] TLMonitor_1_io_in_d_bits_sink; 
  wire  TLMonitor_1_io_in_d_bits_denied; 
  wire  TLMonitor_1_io_in_d_bits_corrupt; 
  wire  TLMonitor_1_io_in_e_valid; 
  wire [1:0] _GEN_1; 
  wire [1:0] in_1_a_bits_source; 
  wire  _T_791; 
  wire  requestBOI_0_0; 
  wire  _T_798; 
  wire  requestDOI_0_0; 
  wire  requestDOI_0_1; 
  wire [13:0] _T_818; 
  wire [6:0] _T_819; 
  wire [6:0] _T_820; 
  wire [3:0] _T_821; 
  wire  _T_822; 
  wire  _T_823; 
  wire [3:0] beatsAI_0; 
  wire [13:0] _T_825; 
  wire [6:0] _T_826; 
  wire [6:0] _T_827; 
  wire [3:0] _T_828; 
  wire  _T_829; 
  wire  _T_830; 
  wire [3:0] beatsAI_1; 
  wire  _T_1001; 
  wire  _T_1002; 
  reg [3:0] _T_1047; 
  reg [31:0] _RAND_0;
  wire  _T_1048; 
  wire  _T_1049; 
  wire [1:0] _T_1050; 
  wire  _T_1052; 
  wire  _T_1054; 
  wire  _T_1055; 
  reg [1:0] _T_1058; 
  reg [31:0] _RAND_1;
  wire [1:0] _T_1059; 
  wire [1:0] _T_1060; 
  wire [3:0] _T_1061; 
  wire [2:0] _T_1062; 
  wire [3:0] _GEN_2; 
  wire [3:0] _T_1063; 
  wire [2:0] _T_1065; 
  wire [3:0] _GEN_3; 
  wire [3:0] _T_1066; 
  wire [3:0] _GEN_4; 
  wire [3:0] _T_1067; 
  wire [1:0] _T_1068; 
  wire [1:0] _T_1069; 
  wire [1:0] _T_1070; 
  wire [1:0] _T_1071; 
  wire  _T_1072; 
  wire  _T_1073; 
  wire [1:0] _T_1074; 
  wire [2:0] _GEN_5; 
  wire [2:0] _T_1075; 
  wire [1:0] _T_1076; 
  wire [1:0] _T_1077; 
  wire  _T_1080; 
  wire  _T_1081; 
  wire  _T_1090; 
  wire  _T_1091; 
  wire  _T_1101; 
  wire  _T_1103; 
  wire  _T_1106; 
  wire  _T_1107; 
  wire  _T_1110; 
  wire  _T_1111; 
  wire  _T_1112; 
  wire  _T_1113; 
  wire  _T_1115; 
  wire  _T_1117; 
  wire  _T_1118; 
  wire [3:0] _T_1119; 
  wire [3:0] _T_1120; 
  wire [3:0] _T_1121; 
  reg  _T_1143_0; 
  reg [31:0] _RAND_2;
  wire  _T_1174; 
  reg  _T_1143_1; 
  reg [31:0] _RAND_3;
  wire  _T_1175; 
  wire  _T_1176; 
  wire  out_0_a_valid; 
  wire  _T_1122; 
  wire [3:0] _GEN_6; 
  wire [4:0] _T_1123; 
  wire [4:0] _T_1124; 
  wire [3:0] _T_1125; 
  wire  _T_1154_0; 
  wire  _T_1154_1; 
  wire  _T_1162_0; 
  wire  _T_1162_1; 
  wire [64:0] _T_1181; 
  wire [45:0] _T_1182; 
  wire [110:0] _T_1183; 
  wire [1:0] in_0_a_bits_source; 
  wire [4:0] _T_1184; 
  wire [5:0] _T_1185; 
  wire [10:0] _T_1186; 
  wire [121:0] _T_1187; 
  wire [121:0] _T_1188; 
  wire [64:0] _T_1189; 
  wire [45:0] _T_1190; 
  wire [110:0] _T_1191; 
  wire [4:0] _T_1192; 
  wire [5:0] _T_1193; 
  wire [10:0] _T_1194; 
  wire [121:0] _T_1195; 
  wire [121:0] _T_1196; 
  wire [121:0] _T_1197; 
  TLMonitor_64 TLMonitor ( 
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
    .io_in_b_ready(TLMonitor_io_in_b_ready),
    .io_in_b_valid(TLMonitor_io_in_b_valid),
    .io_in_b_bits_opcode(TLMonitor_io_in_b_bits_opcode),
    .io_in_b_bits_param(TLMonitor_io_in_b_bits_param),
    .io_in_b_bits_size(TLMonitor_io_in_b_bits_size),
    .io_in_b_bits_source(TLMonitor_io_in_b_bits_source),
    .io_in_b_bits_address(TLMonitor_io_in_b_bits_address),
    .io_in_b_bits_mask(TLMonitor_io_in_b_bits_mask),
    .io_in_b_bits_corrupt(TLMonitor_io_in_b_bits_corrupt),
    .io_in_c_ready(TLMonitor_io_in_c_ready),
    .io_in_c_valid(TLMonitor_io_in_c_valid),
    .io_in_c_bits_opcode(TLMonitor_io_in_c_bits_opcode),
    .io_in_c_bits_param(TLMonitor_io_in_c_bits_param),
    .io_in_c_bits_size(TLMonitor_io_in_c_bits_size),
    .io_in_c_bits_source(TLMonitor_io_in_c_bits_source),
    .io_in_c_bits_address(TLMonitor_io_in_c_bits_address),
    .io_in_c_bits_corrupt(TLMonitor_io_in_c_bits_corrupt),
    .io_in_d_ready(TLMonitor_io_in_d_ready),
    .io_in_d_valid(TLMonitor_io_in_d_valid),
    .io_in_d_bits_opcode(TLMonitor_io_in_d_bits_opcode),
    .io_in_d_bits_param(TLMonitor_io_in_d_bits_param),
    .io_in_d_bits_size(TLMonitor_io_in_d_bits_size),
    .io_in_d_bits_source(TLMonitor_io_in_d_bits_source),
    .io_in_d_bits_sink(TLMonitor_io_in_d_bits_sink),
    .io_in_d_bits_denied(TLMonitor_io_in_d_bits_denied),
    .io_in_d_bits_corrupt(TLMonitor_io_in_d_bits_corrupt),
    .io_in_e_ready(TLMonitor_io_in_e_ready),
    .io_in_e_valid(TLMonitor_io_in_e_valid),
    .io_in_e_bits_sink(TLMonitor_io_in_e_bits_sink)
  );
  TLMonitor_65 TLMonitor_1 ( 
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
    .io_in_c_valid(TLMonitor_1_io_in_c_valid),
    .io_in_d_ready(TLMonitor_1_io_in_d_ready),
    .io_in_d_valid(TLMonitor_1_io_in_d_valid),
    .io_in_d_bits_opcode(TLMonitor_1_io_in_d_bits_opcode),
    .io_in_d_bits_param(TLMonitor_1_io_in_d_bits_param),
    .io_in_d_bits_size(TLMonitor_1_io_in_d_bits_size),
    .io_in_d_bits_sink(TLMonitor_1_io_in_d_bits_sink),
    .io_in_d_bits_denied(TLMonitor_1_io_in_d_bits_denied),
    .io_in_d_bits_corrupt(TLMonitor_1_io_in_d_bits_corrupt),
    .io_in_e_valid(TLMonitor_1_io_in_e_valid)
  );
  assign _GEN_1 = {{1'd0}, auto_in_1_a_bits_source}; 
  assign in_1_a_bits_source = _GEN_1 | 2'h2; 
  assign _T_791 = auto_out_b_bits_source[1:1]; 
  assign requestBOI_0_0 = _T_791 == 1'h0; 
  assign _T_798 = auto_out_d_bits_source[1:1]; 
  assign requestDOI_0_0 = _T_798 == 1'h0; 
  assign requestDOI_0_1 = auto_out_d_bits_source == 2'h2; 
  assign _T_818 = 14'h7f << auto_in_0_a_bits_size; 
  assign _T_819 = _T_818[6:0]; 
  assign _T_820 = ~ _T_819; 
  assign _T_821 = _T_820[6:3]; 
  assign _T_822 = auto_in_0_a_bits_opcode[2]; 
  assign _T_823 = _T_822 == 1'h0; 
  assign beatsAI_0 = _T_823 ? _T_821 : 4'h0; 
  assign _T_825 = 14'h7f << auto_in_1_a_bits_size; 
  assign _T_826 = _T_825[6:0]; 
  assign _T_827 = ~ _T_826; 
  assign _T_828 = _T_827[6:3]; 
  assign _T_829 = auto_in_1_a_bits_opcode[2]; 
  assign _T_830 = _T_829 == 1'h0; 
  assign beatsAI_1 = _T_830 ? _T_828 : 4'h0; 
  assign _T_1001 = requestDOI_0_0 ? auto_in_0_d_ready : 1'h0; 
  assign _T_1002 = requestDOI_0_1 ? auto_in_1_d_ready : 1'h0; 
  assign _T_1048 = _T_1047 == 4'h0; 
  assign _T_1049 = _T_1048 & auto_out_a_ready; 
  assign _T_1050 = {auto_in_1_a_valid,auto_in_0_a_valid}; 
  assign _T_1052 = _T_1050 == _T_1050; 
  assign _T_1054 = _T_1052 | reset; 
  assign _T_1055 = _T_1054 == 1'h0; 
  assign _T_1059 = ~ _T_1058; 
  assign _T_1060 = _T_1050 & _T_1059; 
  assign _T_1061 = {_T_1060,_T_1050}; 
  assign _T_1062 = _T_1061[3:1]; 
  assign _GEN_2 = {{1'd0}, _T_1062}; 
  assign _T_1063 = _T_1061 | _GEN_2; 
  assign _T_1065 = _T_1063[3:1]; 
  assign _GEN_3 = {{2'd0}, _T_1058}; 
  assign _T_1066 = _GEN_3 << 2; 
  assign _GEN_4 = {{1'd0}, _T_1065}; 
  assign _T_1067 = _GEN_4 | _T_1066; 
  assign _T_1068 = _T_1067[3:2]; 
  assign _T_1069 = _T_1067[1:0]; 
  assign _T_1070 = _T_1068 & _T_1069; 
  assign _T_1071 = ~ _T_1070; 
  assign _T_1072 = _T_1050 != 2'h0; 
  assign _T_1073 = _T_1049 & _T_1072; 
  assign _T_1074 = _T_1071 & _T_1050; 
  assign _GEN_5 = {{1'd0}, _T_1074}; 
  assign _T_1075 = _GEN_5 << 1; 
  assign _T_1076 = _T_1075[1:0]; 
  assign _T_1077 = _T_1074 | _T_1076; 
  assign _T_1080 = _T_1071[0]; 
  assign _T_1081 = _T_1071[1]; 
  assign _T_1090 = _T_1080 & auto_in_0_a_valid; 
  assign _T_1091 = _T_1081 & auto_in_1_a_valid; 
  assign _T_1101 = _T_1090 | _T_1091; 
  assign _T_1103 = _T_1090 == 1'h0; 
  assign _T_1106 = _T_1091 == 1'h0; 
  assign _T_1107 = _T_1103 | _T_1106; 
  assign _T_1110 = _T_1107 | reset; 
  assign _T_1111 = _T_1110 == 1'h0; 
  assign _T_1112 = auto_in_0_a_valid | auto_in_1_a_valid; 
  assign _T_1113 = _T_1112 == 1'h0; 
  assign _T_1115 = _T_1113 | _T_1101; 
  assign _T_1117 = _T_1115 | reset; 
  assign _T_1118 = _T_1117 == 1'h0; 
  assign _T_1119 = _T_1090 ? beatsAI_0 : 4'h0; 
  assign _T_1120 = _T_1091 ? beatsAI_1 : 4'h0; 
  assign _T_1121 = _T_1119 | _T_1120; 
  assign _T_1174 = _T_1143_0 ? auto_in_0_a_valid : 1'h0; 
  assign _T_1175 = _T_1143_1 ? auto_in_1_a_valid : 1'h0; 
  assign _T_1176 = _T_1174 | _T_1175; 
  assign out_0_a_valid = _T_1048 ? _T_1112 : _T_1176; 
  assign _T_1122 = auto_out_a_ready & out_0_a_valid; 
  assign _GEN_6 = {{3'd0}, _T_1122}; 
  assign _T_1123 = _T_1047 - _GEN_6; 
  assign _T_1124 = $unsigned(_T_1123); 
  assign _T_1125 = _T_1124[3:0]; 
  assign _T_1154_0 = _T_1048 ? _T_1090 : _T_1143_0; 
  assign _T_1154_1 = _T_1048 ? _T_1091 : _T_1143_1; 
  assign _T_1162_0 = _T_1048 ? _T_1080 : _T_1143_0; 
  assign _T_1162_1 = _T_1048 ? _T_1081 : _T_1143_1; 
  assign _T_1181 = {auto_in_0_a_bits_data,auto_in_0_a_bits_corrupt}; 
  assign _T_1182 = {auto_in_0_a_bits_address,auto_in_0_a_bits_mask}; 
  assign _T_1183 = {_T_1182,_T_1181}; 
  assign in_0_a_bits_source = {{1'd0}, auto_in_0_a_bits_source}; 
  assign _T_1184 = {auto_in_0_a_bits_size,in_0_a_bits_source}; 
  assign _T_1185 = {auto_in_0_a_bits_opcode,auto_in_0_a_bits_param}; 
  assign _T_1186 = {_T_1185,_T_1184}; 
  assign _T_1187 = {_T_1186,_T_1183}; 
  assign _T_1188 = _T_1154_0 ? _T_1187 : 122'h0; 
  assign _T_1189 = {auto_in_1_a_bits_data,auto_in_1_a_bits_corrupt}; 
  assign _T_1190 = {auto_in_1_a_bits_address,auto_in_1_a_bits_mask}; 
  assign _T_1191 = {_T_1190,_T_1189}; 
  assign _T_1192 = {auto_in_1_a_bits_size,in_1_a_bits_source}; 
  assign _T_1193 = {auto_in_1_a_bits_opcode,auto_in_1_a_bits_param}; 
  assign _T_1194 = {_T_1193,_T_1192}; 
  assign _T_1195 = {_T_1194,_T_1191}; 
  assign _T_1196 = _T_1154_1 ? _T_1195 : 122'h0; 
  assign _T_1197 = _T_1188 | _T_1196; 
  assign auto_in_1_a_ready = auto_out_a_ready & _T_1162_1; 
  assign auto_in_1_d_valid = auto_out_d_valid & requestDOI_0_1; 
  assign auto_in_1_d_bits_opcode = auto_out_d_bits_opcode; 
  assign auto_in_1_d_bits_size = auto_out_d_bits_size; 
  assign auto_in_1_d_bits_data = auto_out_d_bits_data; 
  assign auto_in_1_d_bits_corrupt = auto_out_d_bits_corrupt; 
  assign auto_in_0_a_ready = auto_out_a_ready & _T_1162_0; 
  assign auto_in_0_b_valid = auto_out_b_valid & requestBOI_0_0; 
  assign auto_in_0_b_bits_param = auto_out_b_bits_param; 
  assign auto_in_0_b_bits_size = auto_out_b_bits_size; 
  assign auto_in_0_b_bits_source = auto_out_b_bits_source[0]; 
  assign auto_in_0_b_bits_address = auto_out_b_bits_address; 
  assign auto_in_0_c_ready = auto_out_c_ready; 
  assign auto_in_0_d_valid = auto_out_d_valid & requestDOI_0_0; 
  assign auto_in_0_d_bits_opcode = auto_out_d_bits_opcode; 
  assign auto_in_0_d_bits_param = auto_out_d_bits_param; 
  assign auto_in_0_d_bits_size = auto_out_d_bits_size; 
  assign auto_in_0_d_bits_source = auto_out_d_bits_source[0]; 
  assign auto_in_0_d_bits_sink = auto_out_d_bits_sink; 
  assign auto_in_0_d_bits_denied = auto_out_d_bits_denied; 
  assign auto_in_0_d_bits_data = auto_out_d_bits_data; 
  assign auto_in_0_e_ready = auto_out_e_ready; 
  assign auto_out_a_valid = _T_1048 ? _T_1112 : _T_1176; 
  assign auto_out_a_bits_opcode = _T_1197[121:119]; 
  assign auto_out_a_bits_param = _T_1197[118:116]; 
  assign auto_out_a_bits_size = _T_1197[115:113]; 
  assign auto_out_a_bits_source = _T_1197[112:111]; 
  assign auto_out_a_bits_address = _T_1197[110:73]; 
  assign auto_out_a_bits_mask = _T_1197[72:65]; 
  assign auto_out_a_bits_data = _T_1197[64:1]; 
  assign auto_out_a_bits_corrupt = _T_1197[0]; 
  assign auto_out_b_ready = requestBOI_0_0 ? auto_in_0_b_ready : 1'h0; 
  assign auto_out_c_valid = auto_in_0_c_valid; 
  assign auto_out_c_bits_opcode = auto_in_0_c_bits_opcode; 
  assign auto_out_c_bits_param = auto_in_0_c_bits_param; 
  assign auto_out_c_bits_size = auto_in_0_c_bits_size; 
  assign auto_out_c_bits_source = {{1'd0}, auto_in_0_c_bits_source}; 
  assign auto_out_c_bits_address = auto_in_0_c_bits_address; 
  assign auto_out_c_bits_data = auto_in_0_c_bits_data; 
  assign auto_out_c_bits_corrupt = auto_in_0_c_bits_corrupt; 
  assign auto_out_d_ready = _T_1001 | _T_1002; 
  assign auto_out_e_valid = auto_in_0_e_valid; 
  assign auto_out_e_bits_sink = auto_in_0_e_bits_sink; 
  assign TLMonitor_clock = clock; 
  assign TLMonitor_reset = reset; 
  assign TLMonitor_io_in_a_ready = auto_out_a_ready & _T_1162_0; 
  assign TLMonitor_io_in_a_valid = auto_in_0_a_valid; 
  assign TLMonitor_io_in_a_bits_opcode = auto_in_0_a_bits_opcode; 
  assign TLMonitor_io_in_a_bits_param = auto_in_0_a_bits_param; 
  assign TLMonitor_io_in_a_bits_size = auto_in_0_a_bits_size; 
  assign TLMonitor_io_in_a_bits_source = auto_in_0_a_bits_source; 
  assign TLMonitor_io_in_a_bits_address = auto_in_0_a_bits_address; 
  assign TLMonitor_io_in_a_bits_mask = auto_in_0_a_bits_mask; 
  assign TLMonitor_io_in_a_bits_corrupt = auto_in_0_a_bits_corrupt; 
  assign TLMonitor_io_in_b_ready = auto_in_0_b_ready; 
  assign TLMonitor_io_in_b_valid = auto_out_b_valid & requestBOI_0_0; 
  assign TLMonitor_io_in_b_bits_opcode = auto_out_b_bits_opcode; 
  assign TLMonitor_io_in_b_bits_param = auto_out_b_bits_param; 
  assign TLMonitor_io_in_b_bits_size = auto_out_b_bits_size; 
  assign TLMonitor_io_in_b_bits_source = auto_out_b_bits_source[0]; 
  assign TLMonitor_io_in_b_bits_address = auto_out_b_bits_address; 
  assign TLMonitor_io_in_b_bits_mask = auto_out_b_bits_mask; 
  assign TLMonitor_io_in_b_bits_corrupt = auto_out_b_bits_corrupt; 
  assign TLMonitor_io_in_c_ready = auto_out_c_ready; 
  assign TLMonitor_io_in_c_valid = auto_in_0_c_valid; 
  assign TLMonitor_io_in_c_bits_opcode = auto_in_0_c_bits_opcode; 
  assign TLMonitor_io_in_c_bits_param = auto_in_0_c_bits_param; 
  assign TLMonitor_io_in_c_bits_size = auto_in_0_c_bits_size; 
  assign TLMonitor_io_in_c_bits_source = auto_in_0_c_bits_source; 
  assign TLMonitor_io_in_c_bits_address = auto_in_0_c_bits_address; 
  assign TLMonitor_io_in_c_bits_corrupt = auto_in_0_c_bits_corrupt; 
  assign TLMonitor_io_in_d_ready = auto_in_0_d_ready; 
  assign TLMonitor_io_in_d_valid = auto_out_d_valid & requestDOI_0_0; 
  assign TLMonitor_io_in_d_bits_opcode = auto_out_d_bits_opcode; 
  assign TLMonitor_io_in_d_bits_param = auto_out_d_bits_param; 
  assign TLMonitor_io_in_d_bits_size = auto_out_d_bits_size; 
  assign TLMonitor_io_in_d_bits_source = auto_out_d_bits_source[0]; 
  assign TLMonitor_io_in_d_bits_sink = auto_out_d_bits_sink; 
  assign TLMonitor_io_in_d_bits_denied = auto_out_d_bits_denied; 
  assign TLMonitor_io_in_d_bits_corrupt = auto_out_d_bits_corrupt; 
  assign TLMonitor_io_in_e_ready = auto_out_e_ready; 
  assign TLMonitor_io_in_e_valid = auto_in_0_e_valid; 
  assign TLMonitor_io_in_e_bits_sink = auto_in_0_e_bits_sink; 
  assign TLMonitor_1_clock = clock; 
  assign TLMonitor_1_reset = reset; 
  assign TLMonitor_1_io_in_a_ready = auto_out_a_ready & _T_1162_1; 
  assign TLMonitor_1_io_in_a_valid = auto_in_1_a_valid; 
  assign TLMonitor_1_io_in_a_bits_opcode = auto_in_1_a_bits_opcode; 
  assign TLMonitor_1_io_in_a_bits_param = auto_in_1_a_bits_param; 
  assign TLMonitor_1_io_in_a_bits_size = auto_in_1_a_bits_size; 
  assign TLMonitor_1_io_in_a_bits_source = auto_in_1_a_bits_source; 
  assign TLMonitor_1_io_in_a_bits_address = auto_in_1_a_bits_address; 
  assign TLMonitor_1_io_in_a_bits_mask = auto_in_1_a_bits_mask; 
  assign TLMonitor_1_io_in_a_bits_corrupt = auto_in_1_a_bits_corrupt; 
  assign TLMonitor_1_io_in_c_valid = auto_in_1_c_valid; 
  assign TLMonitor_1_io_in_d_ready = auto_in_1_d_ready; 
  assign TLMonitor_1_io_in_d_valid = auto_out_d_valid & requestDOI_0_1; 
  assign TLMonitor_1_io_in_d_bits_opcode = auto_out_d_bits_opcode; 
  assign TLMonitor_1_io_in_d_bits_param = auto_out_d_bits_param; 
  assign TLMonitor_1_io_in_d_bits_size = auto_out_d_bits_size; 
  assign TLMonitor_1_io_in_d_bits_sink = auto_out_d_bits_sink; 
  assign TLMonitor_1_io_in_d_bits_denied = auto_out_d_bits_denied; 
  assign TLMonitor_1_io_in_d_bits_corrupt = auto_out_d_bits_corrupt; 
  assign TLMonitor_1_io_in_e_valid = auto_in_1_e_valid; 
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
  _T_1047 = _RAND_0[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T_1058 = _RAND_1[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_1143_0 = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_1143_1 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      _T_1047 <= 4'h0;
    end else begin
      if (_T_1049) begin
        _T_1047 <= _T_1121;
      end else begin
        _T_1047 <= _T_1125;
      end
    end
    if (reset) begin
      _T_1058 <= 2'h3;
    end else begin
      if (_T_1073) begin
        _T_1058 <= _T_1077;
      end
    end
    if (reset) begin
      _T_1143_0 <= 1'h0;
    end else begin
      if (_T_1048) begin
        _T_1143_0 <= _T_1090;
      end
    end
    if (reset) begin
      _T_1143_1 <= 1'h0;
    end else begin
      if (_T_1048) begin
        _T_1143_1 <= _T_1091;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1055) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Arbiter.scala:19 assert (valid === valids)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1055) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1111) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Arbiter.scala:68 assert((prefixOR zip winner) map { case (p,w) => !p || !w } reduce {_ && _})\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1111) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1118) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Arbiter.scala:70 assert (!valids.reduce(_||_) || winner.reduce(_||_))\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1118) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
