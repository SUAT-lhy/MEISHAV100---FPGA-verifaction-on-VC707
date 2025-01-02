module CLINT( 
  input         clock, 
  input         reset, 
  output        auto_int_out_3_0, 
  output        auto_int_out_3_1, 
  output        auto_int_out_2_0, 
  output        auto_int_out_2_1, 
  output        auto_int_out_1_0, 
  output        auto_int_out_1_1, 
  output        auto_int_out_0_0, 
  output        auto_int_out_0_1, 
  output        auto_in_a_ready, 
  input         auto_in_a_valid, 
  input  [2:0]  auto_in_a_bits_opcode, 
  input  [2:0]  auto_in_a_bits_param, 
  input  [1:0]  auto_in_a_bits_size, 
  input  [8:0]  auto_in_a_bits_source, 
  input  [25:0] auto_in_a_bits_address, 
  input  [7:0]  auto_in_a_bits_mask, 
  input  [63:0] auto_in_a_bits_data, 
  input         auto_in_a_bits_corrupt, 
  input         auto_in_d_ready, 
  output        auto_in_d_valid, 
  output [2:0]  auto_in_d_bits_opcode, 
  output [1:0]  auto_in_d_bits_size, 
  output [8:0]  auto_in_d_bits_source, 
  output [63:0] auto_in_d_bits_data, 
  input         io_rtcTick 
);
  wire  TLMonitor_clock; 
  wire  TLMonitor_reset; 
  wire  TLMonitor_io_in_a_ready; 
  wire  TLMonitor_io_in_a_valid; 
  wire [2:0] TLMonitor_io_in_a_bits_opcode; 
  wire [2:0] TLMonitor_io_in_a_bits_param; 
  wire [1:0] TLMonitor_io_in_a_bits_size; 
  wire [8:0] TLMonitor_io_in_a_bits_source; 
  wire [25:0] TLMonitor_io_in_a_bits_address; 
  wire [7:0] TLMonitor_io_in_a_bits_mask; 
  wire  TLMonitor_io_in_a_bits_corrupt; 
  wire  TLMonitor_io_in_d_ready; 
  wire  TLMonitor_io_in_d_valid; 
  wire [2:0] TLMonitor_io_in_d_bits_opcode; 
  wire [1:0] TLMonitor_io_in_d_bits_size; 
  wire [8:0] TLMonitor_io_in_d_bits_source; 
  reg [63:0] time$; 
  reg [63:0] _RAND_0;
  wire [63:0] _T_246; 
  reg [63:0] timecmp_0; 
  reg [63:0] _RAND_1;
  reg [63:0] timecmp_1; 
  reg [63:0] _RAND_2;
  reg [63:0] timecmp_2; 
  reg [63:0] _RAND_3;
  reg [63:0] timecmp_3; 
  reg [63:0] _RAND_4;
  reg  ipi_0; 
  reg [31:0] _RAND_5;
  reg  ipi_1; 
  reg [31:0] _RAND_6;
  reg  ipi_2; 
  reg [31:0] _RAND_7;
  reg  ipi_3; 
  reg [31:0] _RAND_8;
  wire [7:0] _T_264; 
  wire [7:0] _T_265; 
  wire [7:0] _T_266; 
  wire [7:0] _T_267; 
  wire [7:0] _T_268; 
  wire [7:0] _T_269; 
  wire [7:0] _T_270; 
  wire [7:0] _T_271; 
  wire  _T_1015; 
  wire [22:0] _T_1016; 
  wire [12:0] _T_1012_bits_index; 
  wire  _T_2620; 
  wire  _T_2610; 
  wire [1:0] _T_2622; 
  wire  _T_2609; 
  wire [2:0] _T_2623; 
  wire [12:0] _T_1033; 
  wire  _T_1045; 
  wire  _T_1041; 
  wire  _T_2859; 
  wire  _T_2860; 
  wire  _T_2861; 
  wire [7:0] _T_2648; 
  wire  _T_2653; 
  wire  _T_2888; 
  wire  _T_2889; 
  wire  _T_1303; 
  wire [7:0] _T_1319; 
  wire  _T_1302; 
  wire [7:0] _T_1317; 
  wire [15:0] _T_1324; 
  wire  _T_1301; 
  wire [7:0] _T_1315; 
  wire  _T_1300; 
  wire [7:0] _T_1313; 
  wire [15:0] _T_1323; 
  wire [31:0] _T_1325; 
  wire  _T_1299; 
  wire [7:0] _T_1311; 
  wire  _T_1298; 
  wire [7:0] _T_1309; 
  wire [15:0] _T_1321; 
  wire  _T_1297; 
  wire [7:0] _T_1307; 
  wire  _T_1296; 
  wire [7:0] _T_1305; 
  wire [15:0] _T_1320; 
  wire [31:0] _T_1322; 
  wire [63:0] _T_1326; 
  wire [7:0] _T_1974; 
  wire [7:0] _T_1975; 
  wire  _T_1976; 
  wire  _T_1980; 
  wire [7:0] _T_1999; 
  wire [7:0] _T_2000; 
  wire  _T_2001; 
  wire  _T_2005; 
  wire  _T_398; 
  wire [7:0] _T_2026; 
  wire [7:0] _T_2027; 
  wire  _T_2028; 
  wire  _T_2032; 
  wire  _T_399; 
  wire [7:0] _T_2053; 
  wire [7:0] _T_2054; 
  wire  _T_2055; 
  wire  _T_2059; 
  wire  _T_400; 
  wire [7:0] _T_2080; 
  wire [7:0] _T_2081; 
  wire  _T_2082; 
  wire  _T_2086; 
  wire  _T_401; 
  wire [7:0] _T_2107; 
  wire [7:0] _T_2108; 
  wire  _T_2109; 
  wire  _T_2113; 
  wire  _T_402; 
  wire [7:0] _T_2134; 
  wire [7:0] _T_2135; 
  wire  _T_2136; 
  wire  _T_2140; 
  wire  _T_403; 
  wire [7:0] _T_2161; 
  wire [7:0] _T_2162; 
  wire  _T_2163; 
  wire  _T_2167; 
  wire  _T_404; 
  wire [7:0] _T_2006; 
  wire [7:0] _GEN_27; 
  wire [7:0] _T_1981; 
  wire [7:0] _GEN_26; 
  wire [15:0] _T_405; 
  wire [7:0] _T_2060; 
  wire [7:0] _GEN_29; 
  wire [7:0] _T_2033; 
  wire [7:0] _GEN_28; 
  wire [15:0] _T_406; 
  wire [31:0] _T_407; 
  wire [7:0] _T_2114; 
  wire [7:0] _GEN_31; 
  wire [7:0] _T_2087; 
  wire [7:0] _GEN_30; 
  wire [15:0] _T_408; 
  wire [7:0] _T_2168; 
  wire [7:0] _GEN_33; 
  wire [7:0] _T_2141; 
  wire [7:0] _GEN_32; 
  wire [15:0] _T_409; 
  wire [31:0] _T_410; 
  wire [63:0] _T_411; 
  wire [7:0] _T_413; 
  wire [7:0] _T_414; 
  wire [7:0] _T_415; 
  wire [7:0] _T_416; 
  wire [7:0] _T_417; 
  wire [7:0] _T_418; 
  wire [7:0] _T_419; 
  wire [7:0] _T_420; 
  wire  _T_2654; 
  wire  _T_2894; 
  wire  _T_2895; 
  wire  _T_1446; 
  wire  _T_1471; 
  wire  _T_547; 
  wire  _T_1498; 
  wire  _T_548; 
  wire  _T_1525; 
  wire  _T_549; 
  wire  _T_1552; 
  wire  _T_550; 
  wire  _T_1579; 
  wire  _T_551; 
  wire  _T_1606; 
  wire  _T_552; 
  wire  _T_1633; 
  wire  _T_553; 
  wire [7:0] _GEN_9; 
  wire [7:0] _GEN_8; 
  wire [15:0] _T_554; 
  wire [7:0] _GEN_11; 
  wire [7:0] _GEN_10; 
  wire [15:0] _T_555; 
  wire [31:0] _T_556; 
  wire [7:0] _GEN_13; 
  wire [7:0] _GEN_12; 
  wire [15:0] _T_557; 
  wire [7:0] _GEN_15; 
  wire [7:0] _GEN_14; 
  wire [15:0] _T_558; 
  wire [31:0] _T_559; 
  wire [63:0] _T_560; 
  wire [7:0] _T_562; 
  wire [7:0] _T_563; 
  wire [7:0] _T_564; 
  wire [7:0] _T_565; 
  wire [7:0] _T_566; 
  wire [7:0] _T_567; 
  wire [7:0] _T_568; 
  wire [7:0] _T_569; 
  wire  _T_2655; 
  wire  _T_2900; 
  wire  _T_2901; 
  wire  _T_2408; 
  wire  _T_2433; 
  wire  _T_696; 
  wire  _T_2460; 
  wire  _T_697; 
  wire  _T_2487; 
  wire  _T_698; 
  wire  _T_2514; 
  wire  _T_699; 
  wire  _T_2541; 
  wire  _T_700; 
  wire  _T_2568; 
  wire  _T_701; 
  wire  _T_2595; 
  wire  _T_702; 
  wire [7:0] _GEN_43; 
  wire [7:0] _GEN_42; 
  wire [15:0] _T_703; 
  wire [7:0] _GEN_45; 
  wire [7:0] _GEN_44; 
  wire [15:0] _T_704; 
  wire [31:0] _T_705; 
  wire [7:0] _GEN_47; 
  wire [7:0] _GEN_46; 
  wire [15:0] _T_706; 
  wire [7:0] _GEN_49; 
  wire [7:0] _GEN_48; 
  wire [15:0] _T_707; 
  wire [31:0] _T_708; 
  wire [63:0] _T_709; 
  wire [7:0] _T_711; 
  wire [7:0] _T_712; 
  wire [7:0] _T_713; 
  wire [7:0] _T_714; 
  wire [7:0] _T_715; 
  wire [7:0] _T_716; 
  wire [7:0] _T_717; 
  wire [7:0] _T_718; 
  wire  _T_2656; 
  wire  _T_2906; 
  wire  _T_2907; 
  wire  _T_2194; 
  wire  _T_2219; 
  wire  _T_845; 
  wire  _T_2246; 
  wire  _T_846; 
  wire  _T_2273; 
  wire  _T_847; 
  wire  _T_2300; 
  wire  _T_848; 
  wire  _T_2327; 
  wire  _T_849; 
  wire  _T_2354; 
  wire  _T_850; 
  wire  _T_2381; 
  wire  _T_851; 
  wire [7:0] _GEN_35; 
  wire [7:0] _GEN_34; 
  wire [15:0] _T_852; 
  wire [7:0] _GEN_37; 
  wire [7:0] _GEN_36; 
  wire [15:0] _T_853; 
  wire [31:0] _T_854; 
  wire [7:0] _GEN_39; 
  wire [7:0] _GEN_38; 
  wire [15:0] _T_855; 
  wire [7:0] _GEN_41; 
  wire [7:0] _GEN_40; 
  wire [15:0] _T_856; 
  wire [31:0] _T_857; 
  wire [63:0] _T_858; 
  wire [7:0] _T_860; 
  wire [7:0] _T_861; 
  wire [7:0] _T_862; 
  wire [7:0] _T_863; 
  wire [7:0] _T_864; 
  wire [7:0] _T_865; 
  wire [7:0] _T_866; 
  wire [7:0] _T_867; 
  wire  _T_2652; 
  wire  _T_2882; 
  wire  _T_2883; 
  wire  _T_1766; 
  wire  _T_1791; 
  wire  _T_994; 
  wire  _T_1818; 
  wire  _T_995; 
  wire  _T_1845; 
  wire  _T_996; 
  wire  _T_1872; 
  wire  _T_997; 
  wire  _T_1899; 
  wire  _T_998; 
  wire  _T_1926; 
  wire  _T_999; 
  wire  _T_1953; 
  wire  _T_1000; 
  wire [7:0] _GEN_19; 
  wire [7:0] _GEN_18; 
  wire [15:0] _T_1001; 
  wire [7:0] _GEN_21; 
  wire [7:0] _GEN_20; 
  wire [15:0] _T_1002; 
  wire [31:0] _T_1003; 
  wire [7:0] _GEN_23; 
  wire [7:0] _GEN_22; 
  wire [15:0] _T_1004; 
  wire [7:0] _GEN_25; 
  wire [7:0] _GEN_24; 
  wire [15:0] _T_1005; 
  wire [31:0] _T_1006; 
  wire [63:0] _T_1007; 
  wire [10:0] _T_1017; 
  wire  _T_1327; 
  wire  _T_1330; 
  wire  _T_1331; 
  wire  _T_2640; 
  wire  _T_2729; 
  wire  _T_2730; 
  wire  _T_1339; 
  wire  _T_1341; 
  wire [1:0] _T_1376; 
  wire [31:0] _T_1377; 
  wire  _T_1379; 
  wire  _T_1382; 
  wire  _T_1383; 
  wire  _T_1391; 
  wire  _T_1393; 
  wire [32:0] _T_1403; 
  wire [33:0] _T_1430; 
  wire [63:0] _T_1431; 
  wire [15:0] _T_1482; 
  wire [23:0] _T_1509; 
  wire [31:0] _T_1536; 
  wire [39:0] _T_1563; 
  wire [47:0] _T_1590; 
  wire [55:0] _T_1617; 
  wire [63:0] _T_1644; 
  wire  _T_2641; 
  wire  _T_2735; 
  wire  _T_2736; 
  wire  _T_1659; 
  wire [1:0] _T_1696; 
  wire [31:0] _T_1697; 
  wire  _T_1711; 
  wire [32:0] _T_1723; 
  wire [33:0] _T_1750; 
  wire [63:0] _T_1751; 
  wire [15:0] _T_1802; 
  wire [23:0] _T_1829; 
  wire [31:0] _T_1856; 
  wire [39:0] _T_1883; 
  wire [47:0] _T_1910; 
  wire [55:0] _T_1937; 
  wire [63:0] _T_1964; 
  wire [15:0] _T_2016; 
  wire [23:0] _T_2043; 
  wire [31:0] _T_2070; 
  wire [39:0] _T_2097; 
  wire [47:0] _T_2124; 
  wire [55:0] _T_2151; 
  wire [63:0] _T_2178; 
  wire [15:0] _T_2230; 
  wire [23:0] _T_2257; 
  wire [31:0] _T_2284; 
  wire [39:0] _T_2311; 
  wire [47:0] _T_2338; 
  wire [55:0] _T_2365; 
  wire [63:0] _T_2392; 
  wire [15:0] _T_2444; 
  wire [23:0] _T_2471; 
  wire [31:0] _T_2498; 
  wire [39:0] _T_2525; 
  wire [47:0] _T_2552; 
  wire [55:0] _T_2579; 
  wire [63:0] _T_2606; 
  wire  _GEN_83; 
  wire  _GEN_84; 
  wire  _GEN_85; 
  wire  _GEN_86; 
  wire  _GEN_87; 
  wire  _GEN_88; 
  wire  _GEN_89; 
  wire [63:0] _GEN_91; 
  wire [63:0] _GEN_92; 
  wire [63:0] _GEN_93; 
  wire [63:0] _GEN_94; 
  wire [63:0] _GEN_95; 
  wire [63:0] _GEN_96; 
  wire [63:0] _GEN_97; 
  TLMonitor_58 TLMonitor ( 
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
  assign _T_246 = time$ + 64'h1; 
  assign _T_264 = timecmp_0[7:0]; 
  assign _T_265 = timecmp_0[15:8]; 
  assign _T_266 = timecmp_0[23:16]; 
  assign _T_267 = timecmp_0[31:24]; 
  assign _T_268 = timecmp_0[39:32]; 
  assign _T_269 = timecmp_0[47:40]; 
  assign _T_270 = timecmp_0[55:48]; 
  assign _T_271 = timecmp_0[63:56]; 
  assign _T_1015 = auto_in_a_bits_opcode == 3'h4; 
  assign _T_1016 = auto_in_a_bits_address[25:3]; 
  assign _T_1012_bits_index = _T_1016[12:0]; 
  assign _T_2620 = _T_1012_bits_index[11]; 
  assign _T_2610 = _T_1012_bits_index[1]; 
  assign _T_2622 = {_T_2620,_T_2610}; 
  assign _T_2609 = _T_1012_bits_index[0]; 
  assign _T_2623 = {_T_2622,_T_2609}; 
  assign _T_1033 = _T_1012_bits_index & 13'h17fc; 
  assign _T_1045 = _T_1033 == 13'h0; 
  assign _T_1041 = _T_1033 == 13'h17fc; 
  assign _T_2859 = auto_in_a_valid & auto_in_d_ready; 
  assign _T_2860 = _T_1015 == 1'h0; 
  assign _T_2861 = _T_2859 & _T_2860; 
  assign _T_2648 = 8'h1 << _T_2623; 
  assign _T_2653 = _T_2648[4]; 
  assign _T_2888 = _T_2861 & _T_2653; 
  assign _T_2889 = _T_2888 & _T_1045; 
  assign _T_1303 = auto_in_a_bits_mask[7]; 
  assign _T_1319 = _T_1303 ? 8'hff : 8'h0; 
  assign _T_1302 = auto_in_a_bits_mask[6]; 
  assign _T_1317 = _T_1302 ? 8'hff : 8'h0; 
  assign _T_1324 = {_T_1319,_T_1317}; 
  assign _T_1301 = auto_in_a_bits_mask[5]; 
  assign _T_1315 = _T_1301 ? 8'hff : 8'h0; 
  assign _T_1300 = auto_in_a_bits_mask[4]; 
  assign _T_1313 = _T_1300 ? 8'hff : 8'h0; 
  assign _T_1323 = {_T_1315,_T_1313}; 
  assign _T_1325 = {_T_1324,_T_1323}; 
  assign _T_1299 = auto_in_a_bits_mask[3]; 
  assign _T_1311 = _T_1299 ? 8'hff : 8'h0; 
  assign _T_1298 = auto_in_a_bits_mask[2]; 
  assign _T_1309 = _T_1298 ? 8'hff : 8'h0; 
  assign _T_1321 = {_T_1311,_T_1309}; 
  assign _T_1297 = auto_in_a_bits_mask[1]; 
  assign _T_1307 = _T_1297 ? 8'hff : 8'h0; 
  assign _T_1296 = auto_in_a_bits_mask[0]; 
  assign _T_1305 = _T_1296 ? 8'hff : 8'h0; 
  assign _T_1320 = {_T_1307,_T_1305}; 
  assign _T_1322 = {_T_1321,_T_1320}; 
  assign _T_1326 = {_T_1325,_T_1322}; 
  assign _T_1974 = _T_1326[7:0]; 
  assign _T_1975 = ~ _T_1974; 
  assign _T_1976 = _T_1975 == 8'h0; 
  assign _T_1980 = _T_2889 & _T_1976; 
  assign _T_1999 = _T_1326[15:8]; 
  assign _T_2000 = ~ _T_1999; 
  assign _T_2001 = _T_2000 == 8'h0; 
  assign _T_2005 = _T_2889 & _T_2001; 
  assign _T_398 = _T_1980 | _T_2005; 
  assign _T_2026 = _T_1326[23:16]; 
  assign _T_2027 = ~ _T_2026; 
  assign _T_2028 = _T_2027 == 8'h0; 
  assign _T_2032 = _T_2889 & _T_2028; 
  assign _T_399 = _T_398 | _T_2032; 
  assign _T_2053 = _T_1326[31:24]; 
  assign _T_2054 = ~ _T_2053; 
  assign _T_2055 = _T_2054 == 8'h0; 
  assign _T_2059 = _T_2889 & _T_2055; 
  assign _T_400 = _T_399 | _T_2059; 
  assign _T_2080 = _T_1326[39:32]; 
  assign _T_2081 = ~ _T_2080; 
  assign _T_2082 = _T_2081 == 8'h0; 
  assign _T_2086 = _T_2889 & _T_2082; 
  assign _T_401 = _T_400 | _T_2086; 
  assign _T_2107 = _T_1326[47:40]; 
  assign _T_2108 = ~ _T_2107; 
  assign _T_2109 = _T_2108 == 8'h0; 
  assign _T_2113 = _T_2889 & _T_2109; 
  assign _T_402 = _T_401 | _T_2113; 
  assign _T_2134 = _T_1326[55:48]; 
  assign _T_2135 = ~ _T_2134; 
  assign _T_2136 = _T_2135 == 8'h0; 
  assign _T_2140 = _T_2889 & _T_2136; 
  assign _T_403 = _T_402 | _T_2140; 
  assign _T_2161 = _T_1326[63:56]; 
  assign _T_2162 = ~ _T_2161; 
  assign _T_2163 = _T_2162 == 8'h0; 
  assign _T_2167 = _T_2889 & _T_2163; 
  assign _T_404 = _T_403 | _T_2167; 
  assign _T_2006 = auto_in_a_bits_data[15:8]; 
  assign _GEN_27 = _T_2005 ? _T_2006 : _T_265; 
  assign _T_1981 = auto_in_a_bits_data[7:0]; 
  assign _GEN_26 = _T_1980 ? _T_1981 : _T_264; 
  assign _T_405 = {_GEN_27,_GEN_26}; 
  assign _T_2060 = auto_in_a_bits_data[31:24]; 
  assign _GEN_29 = _T_2059 ? _T_2060 : _T_267; 
  assign _T_2033 = auto_in_a_bits_data[23:16]; 
  assign _GEN_28 = _T_2032 ? _T_2033 : _T_266; 
  assign _T_406 = {_GEN_29,_GEN_28}; 
  assign _T_407 = {_T_406,_T_405}; 
  assign _T_2114 = auto_in_a_bits_data[47:40]; 
  assign _GEN_31 = _T_2113 ? _T_2114 : _T_269; 
  assign _T_2087 = auto_in_a_bits_data[39:32]; 
  assign _GEN_30 = _T_2086 ? _T_2087 : _T_268; 
  assign _T_408 = {_GEN_31,_GEN_30}; 
  assign _T_2168 = auto_in_a_bits_data[63:56]; 
  assign _GEN_33 = _T_2167 ? _T_2168 : _T_271; 
  assign _T_2141 = auto_in_a_bits_data[55:48]; 
  assign _GEN_32 = _T_2140 ? _T_2141 : _T_270; 
  assign _T_409 = {_GEN_33,_GEN_32}; 
  assign _T_410 = {_T_409,_T_408}; 
  assign _T_411 = {_T_410,_T_407}; 
  assign _T_413 = timecmp_1[7:0]; 
  assign _T_414 = timecmp_1[15:8]; 
  assign _T_415 = timecmp_1[23:16]; 
  assign _T_416 = timecmp_1[31:24]; 
  assign _T_417 = timecmp_1[39:32]; 
  assign _T_418 = timecmp_1[47:40]; 
  assign _T_419 = timecmp_1[55:48]; 
  assign _T_420 = timecmp_1[63:56]; 
  assign _T_2654 = _T_2648[5]; 
  assign _T_2894 = _T_2861 & _T_2654; 
  assign _T_2895 = _T_2894 & _T_1045; 
  assign _T_1446 = _T_2895 & _T_1976; 
  assign _T_1471 = _T_2895 & _T_2001; 
  assign _T_547 = _T_1446 | _T_1471; 
  assign _T_1498 = _T_2895 & _T_2028; 
  assign _T_548 = _T_547 | _T_1498; 
  assign _T_1525 = _T_2895 & _T_2055; 
  assign _T_549 = _T_548 | _T_1525; 
  assign _T_1552 = _T_2895 & _T_2082; 
  assign _T_550 = _T_549 | _T_1552; 
  assign _T_1579 = _T_2895 & _T_2109; 
  assign _T_551 = _T_550 | _T_1579; 
  assign _T_1606 = _T_2895 & _T_2136; 
  assign _T_552 = _T_551 | _T_1606; 
  assign _T_1633 = _T_2895 & _T_2163; 
  assign _T_553 = _T_552 | _T_1633; 
  assign _GEN_9 = _T_1471 ? _T_2006 : _T_414; 
  assign _GEN_8 = _T_1446 ? _T_1981 : _T_413; 
  assign _T_554 = {_GEN_9,_GEN_8}; 
  assign _GEN_11 = _T_1525 ? _T_2060 : _T_416; 
  assign _GEN_10 = _T_1498 ? _T_2033 : _T_415; 
  assign _T_555 = {_GEN_11,_GEN_10}; 
  assign _T_556 = {_T_555,_T_554}; 
  assign _GEN_13 = _T_1579 ? _T_2114 : _T_418; 
  assign _GEN_12 = _T_1552 ? _T_2087 : _T_417; 
  assign _T_557 = {_GEN_13,_GEN_12}; 
  assign _GEN_15 = _T_1633 ? _T_2168 : _T_420; 
  assign _GEN_14 = _T_1606 ? _T_2141 : _T_419; 
  assign _T_558 = {_GEN_15,_GEN_14}; 
  assign _T_559 = {_T_558,_T_557}; 
  assign _T_560 = {_T_559,_T_556}; 
  assign _T_562 = timecmp_2[7:0]; 
  assign _T_563 = timecmp_2[15:8]; 
  assign _T_564 = timecmp_2[23:16]; 
  assign _T_565 = timecmp_2[31:24]; 
  assign _T_566 = timecmp_2[39:32]; 
  assign _T_567 = timecmp_2[47:40]; 
  assign _T_568 = timecmp_2[55:48]; 
  assign _T_569 = timecmp_2[63:56]; 
  assign _T_2655 = _T_2648[6]; 
  assign _T_2900 = _T_2861 & _T_2655; 
  assign _T_2901 = _T_2900 & _T_1045; 
  assign _T_2408 = _T_2901 & _T_1976; 
  assign _T_2433 = _T_2901 & _T_2001; 
  assign _T_696 = _T_2408 | _T_2433; 
  assign _T_2460 = _T_2901 & _T_2028; 
  assign _T_697 = _T_696 | _T_2460; 
  assign _T_2487 = _T_2901 & _T_2055; 
  assign _T_698 = _T_697 | _T_2487; 
  assign _T_2514 = _T_2901 & _T_2082; 
  assign _T_699 = _T_698 | _T_2514; 
  assign _T_2541 = _T_2901 & _T_2109; 
  assign _T_700 = _T_699 | _T_2541; 
  assign _T_2568 = _T_2901 & _T_2136; 
  assign _T_701 = _T_700 | _T_2568; 
  assign _T_2595 = _T_2901 & _T_2163; 
  assign _T_702 = _T_701 | _T_2595; 
  assign _GEN_43 = _T_2433 ? _T_2006 : _T_563; 
  assign _GEN_42 = _T_2408 ? _T_1981 : _T_562; 
  assign _T_703 = {_GEN_43,_GEN_42}; 
  assign _GEN_45 = _T_2487 ? _T_2060 : _T_565; 
  assign _GEN_44 = _T_2460 ? _T_2033 : _T_564; 
  assign _T_704 = {_GEN_45,_GEN_44}; 
  assign _T_705 = {_T_704,_T_703}; 
  assign _GEN_47 = _T_2541 ? _T_2114 : _T_567; 
  assign _GEN_46 = _T_2514 ? _T_2087 : _T_566; 
  assign _T_706 = {_GEN_47,_GEN_46}; 
  assign _GEN_49 = _T_2595 ? _T_2168 : _T_569; 
  assign _GEN_48 = _T_2568 ? _T_2141 : _T_568; 
  assign _T_707 = {_GEN_49,_GEN_48}; 
  assign _T_708 = {_T_707,_T_706}; 
  assign _T_709 = {_T_708,_T_705}; 
  assign _T_711 = timecmp_3[7:0]; 
  assign _T_712 = timecmp_3[15:8]; 
  assign _T_713 = timecmp_3[23:16]; 
  assign _T_714 = timecmp_3[31:24]; 
  assign _T_715 = timecmp_3[39:32]; 
  assign _T_716 = timecmp_3[47:40]; 
  assign _T_717 = timecmp_3[55:48]; 
  assign _T_718 = timecmp_3[63:56]; 
  assign _T_2656 = _T_2648[7]; 
  assign _T_2906 = _T_2861 & _T_2656; 
  assign _T_2907 = _T_2906 & _T_1045; 
  assign _T_2194 = _T_2907 & _T_1976; 
  assign _T_2219 = _T_2907 & _T_2001; 
  assign _T_845 = _T_2194 | _T_2219; 
  assign _T_2246 = _T_2907 & _T_2028; 
  assign _T_846 = _T_845 | _T_2246; 
  assign _T_2273 = _T_2907 & _T_2055; 
  assign _T_847 = _T_846 | _T_2273; 
  assign _T_2300 = _T_2907 & _T_2082; 
  assign _T_848 = _T_847 | _T_2300; 
  assign _T_2327 = _T_2907 & _T_2109; 
  assign _T_849 = _T_848 | _T_2327; 
  assign _T_2354 = _T_2907 & _T_2136; 
  assign _T_850 = _T_849 | _T_2354; 
  assign _T_2381 = _T_2907 & _T_2163; 
  assign _T_851 = _T_850 | _T_2381; 
  assign _GEN_35 = _T_2219 ? _T_2006 : _T_712; 
  assign _GEN_34 = _T_2194 ? _T_1981 : _T_711; 
  assign _T_852 = {_GEN_35,_GEN_34}; 
  assign _GEN_37 = _T_2273 ? _T_2060 : _T_714; 
  assign _GEN_36 = _T_2246 ? _T_2033 : _T_713; 
  assign _T_853 = {_GEN_37,_GEN_36}; 
  assign _T_854 = {_T_853,_T_852}; 
  assign _GEN_39 = _T_2327 ? _T_2114 : _T_716; 
  assign _GEN_38 = _T_2300 ? _T_2087 : _T_715; 
  assign _T_855 = {_GEN_39,_GEN_38}; 
  assign _GEN_41 = _T_2381 ? _T_2168 : _T_718; 
  assign _GEN_40 = _T_2354 ? _T_2141 : _T_717; 
  assign _T_856 = {_GEN_41,_GEN_40}; 
  assign _T_857 = {_T_856,_T_855}; 
  assign _T_858 = {_T_857,_T_854}; 
  assign _T_860 = time$[7:0]; 
  assign _T_861 = time$[15:8]; 
  assign _T_862 = time$[23:16]; 
  assign _T_863 = time$[31:24]; 
  assign _T_864 = time$[39:32]; 
  assign _T_865 = time$[47:40]; 
  assign _T_866 = time$[55:48]; 
  assign _T_867 = time$[63:56]; 
  assign _T_2652 = _T_2648[3]; 
  assign _T_2882 = _T_2861 & _T_2652; 
  assign _T_2883 = _T_2882 & _T_1041; 
  assign _T_1766 = _T_2883 & _T_1976; 
  assign _T_1791 = _T_2883 & _T_2001; 
  assign _T_994 = _T_1766 | _T_1791; 
  assign _T_1818 = _T_2883 & _T_2028; 
  assign _T_995 = _T_994 | _T_1818; 
  assign _T_1845 = _T_2883 & _T_2055; 
  assign _T_996 = _T_995 | _T_1845; 
  assign _T_1872 = _T_2883 & _T_2082; 
  assign _T_997 = _T_996 | _T_1872; 
  assign _T_1899 = _T_2883 & _T_2109; 
  assign _T_998 = _T_997 | _T_1899; 
  assign _T_1926 = _T_2883 & _T_2136; 
  assign _T_999 = _T_998 | _T_1926; 
  assign _T_1953 = _T_2883 & _T_2163; 
  assign _T_1000 = _T_999 | _T_1953; 
  assign _GEN_19 = _T_1791 ? _T_2006 : _T_861; 
  assign _GEN_18 = _T_1766 ? _T_1981 : _T_860; 
  assign _T_1001 = {_GEN_19,_GEN_18}; 
  assign _GEN_21 = _T_1845 ? _T_2060 : _T_863; 
  assign _GEN_20 = _T_1818 ? _T_2033 : _T_862; 
  assign _T_1002 = {_GEN_21,_GEN_20}; 
  assign _T_1003 = {_T_1002,_T_1001}; 
  assign _GEN_23 = _T_1899 ? _T_2114 : _T_865; 
  assign _GEN_22 = _T_1872 ? _T_2087 : _T_864; 
  assign _T_1004 = {_GEN_23,_GEN_22}; 
  assign _GEN_25 = _T_1953 ? _T_2168 : _T_867; 
  assign _GEN_24 = _T_1926 ? _T_2141 : _T_866; 
  assign _T_1005 = {_GEN_25,_GEN_24}; 
  assign _T_1006 = {_T_1005,_T_1004}; 
  assign _T_1007 = {_T_1006,_T_1003}; 
  assign _T_1017 = {auto_in_a_bits_source,auto_in_a_bits_size}; 
  assign _T_1327 = _T_1326[0]; 
  assign _T_1330 = ~ _T_1327; 
  assign _T_1331 = _T_1330 == 1'h0; 
  assign _T_2640 = _T_2648[0]; 
  assign _T_2729 = _T_2861 & _T_2640; 
  assign _T_2730 = _T_2729 & _T_1045; 
  assign _T_1339 = _T_2730 & _T_1331; 
  assign _T_1341 = auto_in_a_bits_data[0]; 
  assign _T_1376 = {1'h0,ipi_0}; 
  assign _T_1377 = {{30'd0}, _T_1376}; 
  assign _T_1379 = _T_1326[32]; 
  assign _T_1382 = ~ _T_1379; 
  assign _T_1383 = _T_1382 == 1'h0; 
  assign _T_1391 = _T_2730 & _T_1383; 
  assign _T_1393 = auto_in_a_bits_data[32]; 
  assign _T_1403 = {ipi_1,_T_1377}; 
  assign _T_1430 = {1'h0,_T_1403}; 
  assign _T_1431 = {{30'd0}, _T_1430}; 
  assign _T_1482 = {_T_414,_T_413}; 
  assign _T_1509 = {_T_415,_T_1482}; 
  assign _T_1536 = {_T_416,_T_1509}; 
  assign _T_1563 = {_T_417,_T_1536}; 
  assign _T_1590 = {_T_418,_T_1563}; 
  assign _T_1617 = {_T_419,_T_1590}; 
  assign _T_1644 = {_T_420,_T_1617}; 
  assign _T_2641 = _T_2648[1]; 
  assign _T_2735 = _T_2861 & _T_2641; 
  assign _T_2736 = _T_2735 & _T_1045; 
  assign _T_1659 = _T_2736 & _T_1331; 
  assign _T_1696 = {1'h0,ipi_2}; 
  assign _T_1697 = {{30'd0}, _T_1696}; 
  assign _T_1711 = _T_2736 & _T_1383; 
  assign _T_1723 = {ipi_3,_T_1697}; 
  assign _T_1750 = {1'h0,_T_1723}; 
  assign _T_1751 = {{30'd0}, _T_1750}; 
  assign _T_1802 = {_T_861,_T_860}; 
  assign _T_1829 = {_T_862,_T_1802}; 
  assign _T_1856 = {_T_863,_T_1829}; 
  assign _T_1883 = {_T_864,_T_1856}; 
  assign _T_1910 = {_T_865,_T_1883}; 
  assign _T_1937 = {_T_866,_T_1910}; 
  assign _T_1964 = {_T_867,_T_1937}; 
  assign _T_2016 = {_T_265,_T_264}; 
  assign _T_2043 = {_T_266,_T_2016}; 
  assign _T_2070 = {_T_267,_T_2043}; 
  assign _T_2097 = {_T_268,_T_2070}; 
  assign _T_2124 = {_T_269,_T_2097}; 
  assign _T_2151 = {_T_270,_T_2124}; 
  assign _T_2178 = {_T_271,_T_2151}; 
  assign _T_2230 = {_T_712,_T_711}; 
  assign _T_2257 = {_T_713,_T_2230}; 
  assign _T_2284 = {_T_714,_T_2257}; 
  assign _T_2311 = {_T_715,_T_2284}; 
  assign _T_2338 = {_T_716,_T_2311}; 
  assign _T_2365 = {_T_717,_T_2338}; 
  assign _T_2392 = {_T_718,_T_2365}; 
  assign _T_2444 = {_T_563,_T_562}; 
  assign _T_2471 = {_T_564,_T_2444}; 
  assign _T_2498 = {_T_565,_T_2471}; 
  assign _T_2525 = {_T_566,_T_2498}; 
  assign _T_2552 = {_T_567,_T_2525}; 
  assign _T_2579 = {_T_568,_T_2552}; 
  assign _T_2606 = {_T_569,_T_2579}; 
  assign _GEN_83 = 3'h1 == _T_2623 ? _T_1045 : _T_1045; 
  assign _GEN_84 = 3'h2 == _T_2623 ? 1'h1 : _GEN_83; 
  assign _GEN_85 = 3'h3 == _T_2623 ? _T_1041 : _GEN_84; 
  assign _GEN_86 = 3'h4 == _T_2623 ? _T_1045 : _GEN_85; 
  assign _GEN_87 = 3'h5 == _T_2623 ? _T_1045 : _GEN_86; 
  assign _GEN_88 = 3'h6 == _T_2623 ? _T_1045 : _GEN_87; 
  assign _GEN_89 = 3'h7 == _T_2623 ? _T_1045 : _GEN_88; 
  assign _GEN_91 = 3'h1 == _T_2623 ? _T_1751 : _T_1431; 
  assign _GEN_92 = 3'h2 == _T_2623 ? 64'h0 : _GEN_91; 
  assign _GEN_93 = 3'h3 == _T_2623 ? _T_1964 : _GEN_92; 
  assign _GEN_94 = 3'h4 == _T_2623 ? _T_2178 : _GEN_93; 
  assign _GEN_95 = 3'h5 == _T_2623 ? _T_1644 : _GEN_94; 
  assign _GEN_96 = 3'h6 == _T_2623 ? _T_2606 : _GEN_95; 
  assign _GEN_97 = 3'h7 == _T_2623 ? _T_2392 : _GEN_96; 
  assign auto_int_out_3_0 = ipi_3; 
  assign auto_int_out_3_1 = time$ >= timecmp_3; 
  assign auto_int_out_2_0 = ipi_2; 
  assign auto_int_out_2_1 = time$ >= timecmp_2; 
  assign auto_int_out_1_0 = ipi_1; 
  assign auto_int_out_1_1 = time$ >= timecmp_1; 
  assign auto_int_out_0_0 = ipi_0; 
  assign auto_int_out_0_1 = time$ >= timecmp_0; 
  assign auto_in_a_ready = auto_in_d_ready; 
  assign auto_in_d_valid = auto_in_a_valid; 
  assign auto_in_d_bits_opcode = {{2'd0}, _T_1015}; 
  assign auto_in_d_bits_size = _T_1017[1:0]; 
  assign auto_in_d_bits_source = _T_1017[10:2]; 
  assign auto_in_d_bits_data = _GEN_89 ? _GEN_97 : 64'h0; 
  assign TLMonitor_clock = clock; 
  assign TLMonitor_reset = reset; 
  assign TLMonitor_io_in_a_ready = auto_in_d_ready; 
  assign TLMonitor_io_in_a_valid = auto_in_a_valid; 
  assign TLMonitor_io_in_a_bits_opcode = auto_in_a_bits_opcode; 
  assign TLMonitor_io_in_a_bits_param = auto_in_a_bits_param; 
  assign TLMonitor_io_in_a_bits_size = auto_in_a_bits_size; 
  assign TLMonitor_io_in_a_bits_source = auto_in_a_bits_source; 
  assign TLMonitor_io_in_a_bits_address = auto_in_a_bits_address; 
  assign TLMonitor_io_in_a_bits_mask = auto_in_a_bits_mask; 
  assign TLMonitor_io_in_a_bits_corrupt = auto_in_a_bits_corrupt; 
  assign TLMonitor_io_in_d_ready = auto_in_d_ready; 
  assign TLMonitor_io_in_d_valid = auto_in_a_valid; 
  assign TLMonitor_io_in_d_bits_opcode = {{2'd0}, _T_1015}; 
  assign TLMonitor_io_in_d_bits_size = _T_1017[1:0]; 
  assign TLMonitor_io_in_d_bits_source = _T_1017[10:2]; 
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
  _RAND_0 = {2{`RANDOM}};
  time$ = _RAND_0[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {2{`RANDOM}};
  timecmp_0 = _RAND_1[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {2{`RANDOM}};
  timecmp_1 = _RAND_2[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {2{`RANDOM}};
  timecmp_2 = _RAND_3[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {2{`RANDOM}};
  timecmp_3 = _RAND_4[63:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  ipi_0 = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  ipi_1 = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  ipi_2 = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  ipi_3 = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      time$ <= 64'h0;
    end else begin
      if (_T_1000) begin
        time$ <= _T_1007;
      end else begin
        if (io_rtcTick) begin
          time$ <= _T_246;
        end
      end
    end
    if (_T_404) begin
      timecmp_0 <= _T_411;
    end
    if (_T_553) begin
      timecmp_1 <= _T_560;
    end
    if (_T_702) begin
      timecmp_2 <= _T_709;
    end
    if (_T_851) begin
      timecmp_3 <= _T_858;
    end
    if (reset) begin
      ipi_0 <= 1'h0;
    end else begin
      if (_T_1339) begin
        ipi_0 <= _T_1341;
      end
    end
    if (reset) begin
      ipi_1 <= 1'h0;
    end else begin
      if (_T_1391) begin
        ipi_1 <= _T_1393;
      end
    end
    if (reset) begin
      ipi_2 <= 1'h0;
    end else begin
      if (_T_1659) begin
        ipi_2 <= _T_1341;
      end
    end
    if (reset) begin
      ipi_3 <= 1'h0;
    end else begin
      if (_T_1711) begin
        ipi_3 <= _T_1393;
      end
    end
  end
endmodule
