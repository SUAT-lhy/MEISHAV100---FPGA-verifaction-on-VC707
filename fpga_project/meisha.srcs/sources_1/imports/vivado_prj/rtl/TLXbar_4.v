module TLXbar_4( 
  input         clock, 
  input         reset, 
  output        auto_in_a_ready, 
  input         auto_in_a_valid, 
  input  [2:0]  auto_in_a_bits_opcode, 
  input  [2:0]  auto_in_a_bits_param, 
  input  [2:0]  auto_in_a_bits_size, 
  input  [4:0]  auto_in_a_bits_source, 
  input  [30:0] auto_in_a_bits_address, 
  input  [7:0]  auto_in_a_bits_mask, 
  input  [63:0] auto_in_a_bits_data, 
  input         auto_in_a_bits_corrupt, 
  input         auto_in_d_ready, 
  output        auto_in_d_valid, 
  output [2:0]  auto_in_d_bits_opcode, 
  output [1:0]  auto_in_d_bits_param, 
  output [2:0]  auto_in_d_bits_size, 
  output [4:0]  auto_in_d_bits_source, 
  output        auto_in_d_bits_sink, 
  output        auto_in_d_bits_denied, 
  output [63:0] auto_in_d_bits_data, 
  output        auto_in_d_bits_corrupt, 
  input         auto_out_2_a_ready, 
  output        auto_out_2_a_valid, 
  output [2:0]  auto_out_2_a_bits_opcode, 
  output [2:0]  auto_out_2_a_bits_param, 
  output [2:0]  auto_out_2_a_bits_size, 
  output [4:0]  auto_out_2_a_bits_source, 
  output [30:0] auto_out_2_a_bits_address, 
  output [7:0]  auto_out_2_a_bits_mask, 
  output [63:0] auto_out_2_a_bits_data, 
  output        auto_out_2_a_bits_corrupt, 
  output        auto_out_2_d_ready, 
  input         auto_out_2_d_valid, 
  input  [2:0]  auto_out_2_d_bits_opcode, 
  input  [2:0]  auto_out_2_d_bits_size, 
  input  [4:0]  auto_out_2_d_bits_source, 
  input  [63:0] auto_out_2_d_bits_data, 
  input         auto_out_1_a_ready, 
  output        auto_out_1_a_valid, 
  output [2:0]  auto_out_1_a_bits_opcode, 
  output [2:0]  auto_out_1_a_bits_param, 
  output [2:0]  auto_out_1_a_bits_size, 
  output [4:0]  auto_out_1_a_bits_source, 
  output [30:0] auto_out_1_a_bits_address, 
  output [7:0]  auto_out_1_a_bits_mask, 
  output [63:0] auto_out_1_a_bits_data, 
  output        auto_out_1_a_bits_corrupt, 
  output        auto_out_1_d_ready, 
  input         auto_out_1_d_valid, 
  input  [2:0]  auto_out_1_d_bits_opcode, 
  input  [2:0]  auto_out_1_d_bits_size, 
  input  [4:0]  auto_out_1_d_bits_source, 
  input  [63:0] auto_out_1_d_bits_data, 
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
  input  [2:0]  auto_out_0_d_bits_size, 
  input  [4:0]  auto_out_0_d_bits_source, 
  input  [63:0] auto_out_0_d_bits_data 
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
  reg [2:0] _T_1233; 
  reg [31:0] _RAND_0;
  wire  _T_1234; 
  wire [1:0] _T_1236; 
  wire [2:0] _T_1237; 
  reg [2:0] _T_1245; 
  reg [31:0] _RAND_1;
  wire [2:0] _T_1246; 
  wire [2:0] _T_1247; 
  wire [5:0] _T_1248; 
  wire [4:0] _T_1249; 
  wire [5:0] _GEN_1; 
  wire [5:0] _T_1250; 
  wire [3:0] _T_1251; 
  wire [5:0] _GEN_2; 
  wire [5:0] _T_1252; 
  wire [4:0] _T_1254; 
  wire [5:0] _GEN_3; 
  wire [5:0] _T_1255; 
  wire [5:0] _GEN_4; 
  wire [5:0] _T_1256; 
  wire [2:0] _T_1257; 
  wire [2:0] _T_1258; 
  wire [2:0] _T_1259; 
  wire [2:0] _T_1260; 
  wire  _T_1272; 
  wire  _T_1284; 
  reg  _T_1351_0; 
  reg [31:0] _RAND_2;
  wire  _T_1365_0; 
  wire [4:0] _T_1404; 
  wire [7:0] _T_1403; 
  wire [12:0] _T_1405; 
  wire [64:0] _T_1400; 
  wire [66:0] _T_1402; 
  wire [79:0] _T_1406; 
  wire [79:0] _T_1407; 
  wire  _T_1273; 
  wire  _T_1285; 
  reg  _T_1351_1; 
  reg [31:0] _RAND_3;
  wire  _T_1365_1; 
  wire [4:0] _T_1412; 
  wire [7:0] _T_1411; 
  wire [12:0] _T_1413; 
  wire [64:0] _T_1408; 
  wire [66:0] _T_1410; 
  wire [79:0] _T_1414; 
  wire [79:0] _T_1415; 
  wire [79:0] _T_1424; 
  wire  _T_1274; 
  wire  _T_1286; 
  reg  _T_1351_2; 
  reg [31:0] _RAND_4;
  wire  _T_1365_2; 
  wire [4:0] _T_1420; 
  wire [7:0] _T_1419; 
  wire [12:0] _T_1421; 
  wire [64:0] _T_1416; 
  wire [66:0] _T_1418; 
  wire [79:0] _T_1422; 
  wire [79:0] _T_1423; 
  wire [79:0] _T_1425; 
  wire [31:0] _T_851; 
  wire [31:0] _T_852; 
  wire [31:0] _T_853; 
  wire  requestAIO_0_0; 
  wire [30:0] _T_855; 
  wire [31:0] _T_856; 
  wire [31:0] _T_857; 
  wire [31:0] _T_858; 
  wire  requestAIO_0_1; 
  wire [30:0] _T_860; 
  wire [31:0] _T_861; 
  wire [31:0] _T_862; 
  wire [31:0] _T_863; 
  wire  requestAIO_0_2; 
  wire [12:0] _T_957; 
  wire [5:0] _T_958; 
  wire [5:0] _T_959; 
  wire [2:0] _T_960; 
  wire  _T_961; 
  wire [2:0] beatsDO_0; 
  wire [12:0] _T_963; 
  wire [5:0] _T_964; 
  wire [5:0] _T_965; 
  wire [2:0] _T_966; 
  wire  _T_967; 
  wire [2:0] beatsDO_1; 
  wire [12:0] _T_969; 
  wire [5:0] _T_970; 
  wire [5:0] _T_971; 
  wire [2:0] _T_972; 
  wire  _T_973; 
  wire [2:0] beatsDO_2; 
  wire  _T_1013; 
  wire  _T_1014; 
  wire  _T_1015; 
  wire  _T_1016; 
  wire  _T_1235; 
  wire  _T_1239; 
  wire  _T_1241; 
  wire  _T_1242; 
  wire  _T_1261; 
  wire  _T_1262; 
  wire [2:0] _T_1263; 
  wire [3:0] _GEN_5; 
  wire [3:0] _T_1264; 
  wire [2:0] _T_1265; 
  wire [2:0] _T_1266; 
  wire [4:0] _GEN_6; 
  wire [4:0] _T_1267; 
  wire [2:0] _T_1268; 
  wire [2:0] _T_1269; 
  wire  _T_1297; 
  wire  _T_1298; 
  wire  _T_1300; 
  wire  _T_1303; 
  wire  _T_1304; 
  wire  _T_1305; 
  wire  _T_1306; 
  wire  _T_1307; 
  wire  _T_1309; 
  wire  _T_1311; 
  wire  _T_1312; 
  wire  _T_1313; 
  wire  _T_1314; 
  wire  _T_1315; 
  wire  _T_1318; 
  wire  _T_1320; 
  wire  _T_1321; 
  wire [2:0] _T_1322; 
  wire [2:0] _T_1323; 
  wire [2:0] _T_1324; 
  wire [2:0] _T_1325; 
  wire [2:0] _T_1326; 
  wire  _T_1391; 
  wire  _T_1392; 
  wire  _T_1394; 
  wire  _T_1393; 
  wire  _T_1395; 
  wire  in_0_d_valid; 
  wire  _T_1327; 
  wire [2:0] _GEN_7; 
  wire [3:0] _T_1328; 
  wire [3:0] _T_1329; 
  wire [2:0] _T_1330; 
  wire  _T_1375_0; 
  wire  _T_1375_1; 
  wire  _T_1375_2; 
  TLMonitor_44 TLMonitor ( 
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
  assign _T_1234 = _T_1233 == 3'h0; 
  assign _T_1236 = {auto_out_2_d_valid,auto_out_1_d_valid}; 
  assign _T_1237 = {_T_1236,auto_out_0_d_valid}; 
  assign _T_1246 = ~ _T_1245; 
  assign _T_1247 = _T_1237 & _T_1246; 
  assign _T_1248 = {_T_1247,_T_1237}; 
  assign _T_1249 = _T_1248[5:1]; 
  assign _GEN_1 = {{1'd0}, _T_1249}; 
  assign _T_1250 = _T_1248 | _GEN_1; 
  assign _T_1251 = _T_1250[5:2]; 
  assign _GEN_2 = {{2'd0}, _T_1251}; 
  assign _T_1252 = _T_1250 | _GEN_2; 
  assign _T_1254 = _T_1252[5:1]; 
  assign _GEN_3 = {{3'd0}, _T_1245}; 
  assign _T_1255 = _GEN_3 << 3; 
  assign _GEN_4 = {{1'd0}, _T_1254}; 
  assign _T_1256 = _GEN_4 | _T_1255; 
  assign _T_1257 = _T_1256[5:3]; 
  assign _T_1258 = _T_1256[2:0]; 
  assign _T_1259 = _T_1257 & _T_1258; 
  assign _T_1260 = ~ _T_1259; 
  assign _T_1272 = _T_1260[0]; 
  assign _T_1284 = _T_1272 & auto_out_0_d_valid; 
  assign _T_1365_0 = _T_1234 ? _T_1284 : _T_1351_0; 
  assign _T_1404 = {auto_out_0_d_bits_opcode,2'h0}; 
  assign _T_1403 = {auto_out_0_d_bits_size,auto_out_0_d_bits_source}; 
  assign _T_1405 = {_T_1404,_T_1403}; 
  assign _T_1400 = {auto_out_0_d_bits_data,1'h0}; 
  assign _T_1402 = {2'h0,_T_1400}; 
  assign _T_1406 = {_T_1405,_T_1402}; 
  assign _T_1407 = _T_1365_0 ? _T_1406 : 80'h0; 
  assign _T_1273 = _T_1260[1]; 
  assign _T_1285 = _T_1273 & auto_out_1_d_valid; 
  assign _T_1365_1 = _T_1234 ? _T_1285 : _T_1351_1; 
  assign _T_1412 = {auto_out_1_d_bits_opcode,2'h0}; 
  assign _T_1411 = {auto_out_1_d_bits_size,auto_out_1_d_bits_source}; 
  assign _T_1413 = {_T_1412,_T_1411}; 
  assign _T_1408 = {auto_out_1_d_bits_data,1'h0}; 
  assign _T_1410 = {2'h0,_T_1408}; 
  assign _T_1414 = {_T_1413,_T_1410}; 
  assign _T_1415 = _T_1365_1 ? _T_1414 : 80'h0; 
  assign _T_1424 = _T_1407 | _T_1415; 
  assign _T_1274 = _T_1260[2]; 
  assign _T_1286 = _T_1274 & auto_out_2_d_valid; 
  assign _T_1365_2 = _T_1234 ? _T_1286 : _T_1351_2; 
  assign _T_1420 = {auto_out_2_d_bits_opcode,2'h0}; 
  assign _T_1419 = {auto_out_2_d_bits_size,auto_out_2_d_bits_source}; 
  assign _T_1421 = {_T_1420,_T_1419}; 
  assign _T_1416 = {auto_out_2_d_bits_data,1'h0}; 
  assign _T_1418 = {2'h0,_T_1416}; 
  assign _T_1422 = {_T_1421,_T_1418}; 
  assign _T_1423 = _T_1365_2 ? _T_1422 : 80'h0; 
  assign _T_1425 = _T_1424 | _T_1423; 
  assign _T_851 = {1'b0,$signed(auto_in_a_bits_address)}; 
  assign _T_852 = $signed(_T_851) & $signed(32'sh3000); 
  assign _T_853 = $signed(_T_852); 
  assign requestAIO_0_0 = $signed(_T_853) == $signed(32'sh0); 
  assign _T_855 = auto_in_a_bits_address ^ 31'h1000; 
  assign _T_856 = {1'b0,$signed(_T_855)}; 
  assign _T_857 = $signed(_T_856) & $signed(32'sh3000); 
  assign _T_858 = $signed(_T_857); 
  assign requestAIO_0_1 = $signed(_T_858) == $signed(32'sh0); 
  assign _T_860 = auto_in_a_bits_address ^ 31'h2000; 
  assign _T_861 = {1'b0,$signed(_T_860)}; 
  assign _T_862 = $signed(_T_861) & $signed(32'sh3000); 
  assign _T_863 = $signed(_T_862); 
  assign requestAIO_0_2 = $signed(_T_863) == $signed(32'sh0); 
  assign _T_957 = 13'h3f << auto_out_0_d_bits_size; 
  assign _T_958 = _T_957[5:0]; 
  assign _T_959 = ~ _T_958; 
  assign _T_960 = _T_959[5:3]; 
  assign _T_961 = auto_out_0_d_bits_opcode[0]; 
  assign beatsDO_0 = _T_961 ? _T_960 : 3'h0; 
  assign _T_963 = 13'h3f << auto_out_1_d_bits_size; 
  assign _T_964 = _T_963[5:0]; 
  assign _T_965 = ~ _T_964; 
  assign _T_966 = _T_965[5:3]; 
  assign _T_967 = auto_out_1_d_bits_opcode[0]; 
  assign beatsDO_1 = _T_967 ? _T_966 : 3'h0; 
  assign _T_969 = 13'h3f << auto_out_2_d_bits_size; 
  assign _T_970 = _T_969[5:0]; 
  assign _T_971 = ~ _T_970; 
  assign _T_972 = _T_971[5:3]; 
  assign _T_973 = auto_out_2_d_bits_opcode[0]; 
  assign beatsDO_2 = _T_973 ? _T_972 : 3'h0; 
  assign _T_1013 = requestAIO_0_0 ? auto_out_0_a_ready : 1'h0; 
  assign _T_1014 = requestAIO_0_1 ? auto_out_1_a_ready : 1'h0; 
  assign _T_1015 = requestAIO_0_2 ? auto_out_2_a_ready : 1'h0; 
  assign _T_1016 = _T_1013 | _T_1014; 
  assign _T_1235 = _T_1234 & auto_in_d_ready; 
  assign _T_1239 = _T_1237 == _T_1237; 
  assign _T_1241 = _T_1239 | reset; 
  assign _T_1242 = _T_1241 == 1'h0; 
  assign _T_1261 = _T_1237 != 3'h0; 
  assign _T_1262 = _T_1235 & _T_1261; 
  assign _T_1263 = _T_1260 & _T_1237; 
  assign _GEN_5 = {{1'd0}, _T_1263}; 
  assign _T_1264 = _GEN_5 << 1; 
  assign _T_1265 = _T_1264[2:0]; 
  assign _T_1266 = _T_1263 | _T_1265; 
  assign _GEN_6 = {{2'd0}, _T_1266}; 
  assign _T_1267 = _GEN_6 << 2; 
  assign _T_1268 = _T_1267[2:0]; 
  assign _T_1269 = _T_1266 | _T_1268; 
  assign _T_1297 = _T_1284 | _T_1285; 
  assign _T_1298 = _T_1297 | _T_1286; 
  assign _T_1300 = _T_1284 == 1'h0; 
  assign _T_1303 = _T_1285 == 1'h0; 
  assign _T_1304 = _T_1300 | _T_1303; 
  assign _T_1305 = _T_1297 == 1'h0; 
  assign _T_1306 = _T_1286 == 1'h0; 
  assign _T_1307 = _T_1305 | _T_1306; 
  assign _T_1309 = _T_1304 & _T_1307; 
  assign _T_1311 = _T_1309 | reset; 
  assign _T_1312 = _T_1311 == 1'h0; 
  assign _T_1313 = auto_out_0_d_valid | auto_out_1_d_valid; 
  assign _T_1314 = _T_1313 | auto_out_2_d_valid; 
  assign _T_1315 = _T_1314 == 1'h0; 
  assign _T_1318 = _T_1315 | _T_1298; 
  assign _T_1320 = _T_1318 | reset; 
  assign _T_1321 = _T_1320 == 1'h0; 
  assign _T_1322 = _T_1284 ? beatsDO_0 : 3'h0; 
  assign _T_1323 = _T_1285 ? beatsDO_1 : 3'h0; 
  assign _T_1324 = _T_1286 ? beatsDO_2 : 3'h0; 
  assign _T_1325 = _T_1322 | _T_1323; 
  assign _T_1326 = _T_1325 | _T_1324; 
  assign _T_1391 = _T_1351_0 ? auto_out_0_d_valid : 1'h0; 
  assign _T_1392 = _T_1351_1 ? auto_out_1_d_valid : 1'h0; 
  assign _T_1394 = _T_1391 | _T_1392; 
  assign _T_1393 = _T_1351_2 ? auto_out_2_d_valid : 1'h0; 
  assign _T_1395 = _T_1394 | _T_1393; 
  assign in_0_d_valid = _T_1234 ? _T_1314 : _T_1395; 
  assign _T_1327 = auto_in_d_ready & in_0_d_valid; 
  assign _GEN_7 = {{2'd0}, _T_1327}; 
  assign _T_1328 = _T_1233 - _GEN_7; 
  assign _T_1329 = $unsigned(_T_1328); 
  assign _T_1330 = _T_1329[2:0]; 
  assign _T_1375_0 = _T_1234 ? _T_1272 : _T_1351_0; 
  assign _T_1375_1 = _T_1234 ? _T_1273 : _T_1351_1; 
  assign _T_1375_2 = _T_1234 ? _T_1274 : _T_1351_2; 
  assign auto_in_a_ready = _T_1016 | _T_1015; 
  assign auto_in_d_valid = _T_1234 ? _T_1314 : _T_1395; 
  assign auto_in_d_bits_opcode = _T_1425[79:77]; 
  assign auto_in_d_bits_param = _T_1425[76:75]; 
  assign auto_in_d_bits_size = _T_1425[74:72]; 
  assign auto_in_d_bits_source = _T_1425[71:67]; 
  assign auto_in_d_bits_sink = _T_1425[66]; 
  assign auto_in_d_bits_denied = _T_1425[65]; 
  assign auto_in_d_bits_data = _T_1425[64:1]; 
  assign auto_in_d_bits_corrupt = _T_1425[0]; 
  assign auto_out_2_a_valid = auto_in_a_valid & requestAIO_0_2; 
  assign auto_out_2_a_bits_opcode = auto_in_a_bits_opcode; 
  assign auto_out_2_a_bits_param = auto_in_a_bits_param; 
  assign auto_out_2_a_bits_size = auto_in_a_bits_size; 
  assign auto_out_2_a_bits_source = auto_in_a_bits_source; 
  assign auto_out_2_a_bits_address = auto_in_a_bits_address; 
  assign auto_out_2_a_bits_mask = auto_in_a_bits_mask; 
  assign auto_out_2_a_bits_data = auto_in_a_bits_data; 
  assign auto_out_2_a_bits_corrupt = auto_in_a_bits_corrupt; 
  assign auto_out_2_d_ready = auto_in_d_ready & _T_1375_2; 
  assign auto_out_1_a_valid = auto_in_a_valid & requestAIO_0_1; 
  assign auto_out_1_a_bits_opcode = auto_in_a_bits_opcode; 
  assign auto_out_1_a_bits_param = auto_in_a_bits_param; 
  assign auto_out_1_a_bits_size = auto_in_a_bits_size; 
  assign auto_out_1_a_bits_source = auto_in_a_bits_source; 
  assign auto_out_1_a_bits_address = auto_in_a_bits_address; 
  assign auto_out_1_a_bits_mask = auto_in_a_bits_mask; 
  assign auto_out_1_a_bits_data = auto_in_a_bits_data; 
  assign auto_out_1_a_bits_corrupt = auto_in_a_bits_corrupt; 
  assign auto_out_1_d_ready = auto_in_d_ready & _T_1375_1; 
  assign auto_out_0_a_valid = auto_in_a_valid & requestAIO_0_0; 
  assign auto_out_0_a_bits_opcode = auto_in_a_bits_opcode; 
  assign auto_out_0_a_bits_param = auto_in_a_bits_param; 
  assign auto_out_0_a_bits_size = auto_in_a_bits_size; 
  assign auto_out_0_a_bits_source = auto_in_a_bits_source; 
  assign auto_out_0_a_bits_address = auto_in_a_bits_address; 
  assign auto_out_0_a_bits_mask = auto_in_a_bits_mask; 
  assign auto_out_0_a_bits_data = auto_in_a_bits_data; 
  assign auto_out_0_a_bits_corrupt = auto_in_a_bits_corrupt; 
  assign auto_out_0_d_ready = auto_in_d_ready & _T_1375_0; 
  assign TLMonitor_clock = clock; 
  assign TLMonitor_reset = reset; 
  assign TLMonitor_io_in_a_ready = _T_1016 | _T_1015; 
  assign TLMonitor_io_in_a_valid = auto_in_a_valid; 
  assign TLMonitor_io_in_a_bits_opcode = auto_in_a_bits_opcode; 
  assign TLMonitor_io_in_a_bits_param = auto_in_a_bits_param; 
  assign TLMonitor_io_in_a_bits_size = auto_in_a_bits_size; 
  assign TLMonitor_io_in_a_bits_source = auto_in_a_bits_source; 
  assign TLMonitor_io_in_a_bits_address = auto_in_a_bits_address; 
  assign TLMonitor_io_in_a_bits_mask = auto_in_a_bits_mask; 
  assign TLMonitor_io_in_a_bits_corrupt = auto_in_a_bits_corrupt; 
  assign TLMonitor_io_in_d_ready = auto_in_d_ready; 
  assign TLMonitor_io_in_d_valid = _T_1234 ? _T_1314 : _T_1395; 
  assign TLMonitor_io_in_d_bits_opcode = _T_1425[79:77]; 
  assign TLMonitor_io_in_d_bits_param = _T_1425[76:75]; 
  assign TLMonitor_io_in_d_bits_size = _T_1425[74:72]; 
  assign TLMonitor_io_in_d_bits_source = _T_1425[71:67]; 
  assign TLMonitor_io_in_d_bits_sink = _T_1425[66]; 
  assign TLMonitor_io_in_d_bits_denied = _T_1425[65]; 
  assign TLMonitor_io_in_d_bits_corrupt = _T_1425[0]; 
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
  _T_1233 = _RAND_0[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T_1245 = _RAND_1[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_1351_0 = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_1351_1 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_1351_2 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      _T_1233 <= 3'h0;
    end else begin
      if (_T_1235) begin
        _T_1233 <= _T_1326;
      end else begin
        _T_1233 <= _T_1330;
      end
    end
    if (reset) begin
      _T_1245 <= 3'h7;
    end else begin
      if (_T_1262) begin
        _T_1245 <= _T_1269;
      end
    end
    if (reset) begin
      _T_1351_0 <= 1'h0;
    end else begin
      if (_T_1234) begin
        _T_1351_0 <= _T_1284;
      end
    end
    if (reset) begin
      _T_1351_1 <= 1'h0;
    end else begin
      if (_T_1234) begin
        _T_1351_1 <= _T_1285;
      end
    end
    if (reset) begin
      _T_1351_2 <= 1'h0;
    end else begin
      if (_T_1234) begin
        _T_1351_2 <= _T_1286;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1242) begin
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
        if (_T_1242) begin
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
        if (_T_1312) begin
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
        if (_T_1312) begin
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
        if (_T_1321) begin
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
        if (_T_1321) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
