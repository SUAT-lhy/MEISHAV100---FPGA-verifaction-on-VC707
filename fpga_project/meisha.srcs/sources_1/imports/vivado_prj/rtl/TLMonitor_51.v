module TLMonitor_51( 
  input         clock, 
  input         reset, 
  input         io_in_a_ready, 
  input         io_in_a_valid, 
  input  [2:0]  io_in_a_bits_opcode, 
  input  [2:0]  io_in_a_bits_param, 
  input  [2:0]  io_in_a_bits_size, 
  input  [4:0]  io_in_a_bits_source, 
  input  [31:0] io_in_a_bits_address, 
  input  [7:0]  io_in_a_bits_mask, 
  input         io_in_a_bits_corrupt, 
  input         io_in_b_ready, 
  input         io_in_b_valid, 
  input  [1:0]  io_in_b_bits_param, 
  input  [4:0]  io_in_b_bits_source, 
  input  [31:0] io_in_b_bits_address, 
  input         io_in_c_ready, 
  input         io_in_c_valid, 
  input  [2:0]  io_in_c_bits_opcode, 
  input  [2:0]  io_in_c_bits_param, 
  input  [2:0]  io_in_c_bits_size, 
  input  [4:0]  io_in_c_bits_source, 
  input  [31:0] io_in_c_bits_address, 
  input         io_in_c_bits_corrupt, 
  input         io_in_d_ready, 
  input         io_in_d_valid, 
  input  [2:0]  io_in_d_bits_opcode, 
  input  [1:0]  io_in_d_bits_param, 
  input  [2:0]  io_in_d_bits_size, 
  input  [4:0]  io_in_d_bits_source, 
  input  [1:0]  io_in_d_bits_sink, 
  input         io_in_d_bits_denied, 
  input         io_in_d_bits_corrupt, 
  input         io_in_e_valid, 
  input  [1:0]  io_in_e_bits_sink 
);
  wire [31:0] plusarg_reader_out; 
  wire  _T_20; 
  wire  _T_21; 
  wire  _T_22; 
  wire  _T_23; 
  wire  _T_24; 
  wire  _T_25; 
  wire  _T_26; 
  wire  _T_27; 
  wire  _T_28; 
  wire  _T_29; 
  wire  _T_30; 
  wire  _T_31; 
  wire  _T_34; 
  wire  _T_35; 
  wire  _T_59; 
  wire  _T_60; 
  wire  _T_61; 
  wire  _T_62; 
  wire  _T_63; 
  wire  _T_64; 
  wire  _T_65; 
  wire  _T_66; 
  wire  _T_67; 
  wire  _T_68; 
  wire  _T_69; 
  wire  _T_70; 
  wire [12:0] _T_72; 
  wire [5:0] _T_73; 
  wire [5:0] _T_74; 
  wire [31:0] _GEN_33; 
  wire [31:0] _T_75; 
  wire  _T_76; 
  wire [1:0] _T_78; 
  wire [3:0] _T_79; 
  wire [2:0] _T_80; 
  wire [2:0] _T_81; 
  wire  _T_82; 
  wire  _T_83; 
  wire  _T_84; 
  wire  _T_85; 
  wire  _T_87; 
  wire  _T_88; 
  wire  _T_90; 
  wire  _T_91; 
  wire  _T_92; 
  wire  _T_93; 
  wire  _T_94; 
  wire  _T_95; 
  wire  _T_96; 
  wire  _T_97; 
  wire  _T_98; 
  wire  _T_99; 
  wire  _T_100; 
  wire  _T_101; 
  wire  _T_102; 
  wire  _T_103; 
  wire  _T_104; 
  wire  _T_105; 
  wire  _T_106; 
  wire  _T_107; 
  wire  _T_108; 
  wire  _T_109; 
  wire  _T_110; 
  wire  _T_111; 
  wire  _T_112; 
  wire  _T_113; 
  wire  _T_114; 
  wire  _T_115; 
  wire  _T_116; 
  wire  _T_117; 
  wire  _T_118; 
  wire  _T_119; 
  wire  _T_120; 
  wire  _T_121; 
  wire  _T_122; 
  wire  _T_123; 
  wire  _T_124; 
  wire  _T_125; 
  wire  _T_126; 
  wire  _T_127; 
  wire  _T_128; 
  wire  _T_129; 
  wire  _T_130; 
  wire  _T_131; 
  wire  _T_132; 
  wire  _T_133; 
  wire [1:0] _T_134; 
  wire [1:0] _T_135; 
  wire [3:0] _T_136; 
  wire [1:0] _T_137; 
  wire [1:0] _T_138; 
  wire [3:0] _T_139; 
  wire [7:0] _T_140; 
  wire  _T_267; 
  wire  _T_269; 
  wire [31:0] _T_272; 
  wire [32:0] _T_273; 
  wire [32:0] _T_274; 
  wire [32:0] _T_275; 
  wire  _T_276; 
  wire  _T_277; 
  wire  _T_280; 
  wire  _T_281; 
  wire  _T_321; 
  wire  _T_326; 
  wire  _T_329; 
  wire  _T_332; 
  wire  _T_335; 
  wire  _T_341; 
  wire  _T_344; 
  wire  _T_347; 
  wire  _T_354; 
  wire  _T_355; 
  wire  _T_357; 
  wire  _T_358; 
  wire  _T_361; 
  wire  _T_362; 
  wire  _T_364; 
  wire  _T_365; 
  wire  _T_366; 
  wire  _T_368; 
  wire  _T_369; 
  wire [7:0] _T_370; 
  wire  _T_371; 
  wire  _T_373; 
  wire  _T_374; 
  wire  _T_375; 
  wire  _T_377; 
  wire  _T_378; 
  wire  _T_379; 
  wire  _T_482; 
  wire  _T_484; 
  wire  _T_485; 
  wire  _T_495; 
  wire  _T_516; 
  wire  _T_518; 
  wire  _T_519; 
  wire  _T_520; 
  wire  _T_522; 
  wire  _T_523; 
  wire  _T_528; 
  wire  _T_557; 
  wire [7:0] _T_582; 
  wire [7:0] _T_583; 
  wire  _T_584; 
  wire  _T_586; 
  wire  _T_587; 
  wire  _T_588; 
  wire  _T_599; 
  wire  _T_606; 
  wire  _T_608; 
  wire  _T_609; 
  wire  _T_614; 
  wire  _T_632; 
  wire  _T_634; 
  wire  _T_635; 
  wire  _T_640; 
  wire  _T_666; 
  wire  _T_668; 
  wire  _T_669; 
  wire  _T_670; 
  wire  _T_671; 
  wire  _T_672; 
  wire  _T_673; 
  wire  _T_674; 
  wire  _T_675; 
  wire  _T_676; 
  wire  _T_677; 
  wire  _T_678; 
  wire  _T_679; 
  wire  _T_680; 
  wire  _T_681; 
  wire  _T_684; 
  wire  _T_685; 
  wire  _T_709; 
  wire  _T_710; 
  wire  _T_711; 
  wire  _T_712; 
  wire  _T_713; 
  wire  _T_714; 
  wire  _T_715; 
  wire  _T_716; 
  wire  _T_717; 
  wire  _T_718; 
  wire  _T_719; 
  wire  _T_720; 
  wire  _T_722; 
  wire  _T_724; 
  wire  _T_725; 
  wire  _T_726; 
  wire  _T_728; 
  wire  _T_729; 
  wire  _T_730; 
  wire  _T_732; 
  wire  _T_733; 
  wire  _T_734; 
  wire  _T_736; 
  wire  _T_737; 
  wire  _T_738; 
  wire  _T_740; 
  wire  _T_741; 
  wire  _T_742; 
  wire  _T_753; 
  wire  _T_755; 
  wire  _T_756; 
  wire  _T_757; 
  wire  _T_759; 
  wire  _T_760; 
  wire  _T_770; 
  wire  _T_790; 
  wire  _T_792; 
  wire  _T_793; 
  wire  _T_799; 
  wire  _T_816; 
  wire  _T_834; 
  wire  _T_855; 
  wire  _T_863; 
  wire  _T_871; 
  wire  _T_879; 
  wire  _T_887; 
  wire  _T_895; 
  wire  _T_903; 
  wire  _T_911; 
  wire  _T_919; 
  wire  _T_927; 
  wire  _T_935; 
  wire  _T_943; 
  wire [31:0] _T_981; 
  wire [32:0] _T_982; 
  wire [32:0] _T_983; 
  wire [32:0] _T_984; 
  wire  _T_985; 
  wire [12:0] _T_994; 
  wire [5:0] _T_995; 
  wire [5:0] _T_996; 
  wire [31:0] _GEN_34; 
  wire [31:0] _T_997; 
  wire  _T_998; 
  wire [4:0] _T_1103; 
  wire [4:0] _T_1104; 
  wire [4:0] _T_1105; 
  wire [4:0] _T_1106; 
  wire [4:0] _T_1107; 
  wire [4:0] _T_1108; 
  wire [4:0] _T_1109; 
  wire [4:0] _T_1110; 
  wire [4:0] _T_1111; 
  wire [4:0] _T_1112; 
  wire [4:0] _T_1113; 
  wire [4:0] _T_1114; 
  wire [4:0] _T_1116; 
  wire [4:0] _T_1117; 
  wire [4:0] _T_1118; 
  wire [4:0] _T_1119; 
  wire [4:0] _T_1120; 
  wire [4:0] _T_1121; 
  wire [4:0] _T_1122; 
  wire [4:0] _T_1123; 
  wire [4:0] _T_1124; 
  wire [4:0] _T_1125; 
  wire [4:0] _T_1126; 
  wire  _T_1130; 
  wire  _T_1191; 
  wire  _T_1194; 
  wire  _T_1197; 
  wire  _T_1204; 
  wire  _T_1205; 
  wire  _T_1207; 
  wire  _T_1208; 
  wire  _T_1210; 
  wire  _T_1211; 
  wire  _T_1213; 
  wire  _T_1214; 
  wire  _T_1215; 
  wire  _T_1217; 
  wire  _T_1218; 
  wire  _T_1363; 
  wire  _T_1364; 
  wire  _T_1365; 
  wire  _T_1366; 
  wire  _T_1367; 
  wire  _T_1368; 
  wire  _T_1369; 
  wire  _T_1370; 
  wire  _T_1371; 
  wire  _T_1372; 
  wire  _T_1373; 
  wire  _T_1374; 
  wire  _T_1377; 
  wire  _T_1378; 
  wire  _T_1402; 
  wire  _T_1403; 
  wire  _T_1404; 
  wire  _T_1405; 
  wire  _T_1406; 
  wire  _T_1407; 
  wire  _T_1408; 
  wire  _T_1409; 
  wire  _T_1410; 
  wire  _T_1411; 
  wire  _T_1412; 
  wire  _T_1413; 
  wire [12:0] _T_1415; 
  wire [5:0] _T_1416; 
  wire [5:0] _T_1417; 
  wire [31:0] _GEN_35; 
  wire [31:0] _T_1418; 
  wire  _T_1419; 
  wire [31:0] _T_1420; 
  wire [32:0] _T_1421; 
  wire [32:0] _T_1422; 
  wire [32:0] _T_1423; 
  wire  _T_1424; 
  wire  _T_1558; 
  wire  _T_1560; 
  wire  _T_1561; 
  wire  _T_1563; 
  wire  _T_1564; 
  wire  _T_1565; 
  wire  _T_1567; 
  wire  _T_1568; 
  wire  _T_1570; 
  wire  _T_1571; 
  wire  _T_1572; 
  wire  _T_1574; 
  wire  _T_1575; 
  wire  _T_1576; 
  wire  _T_1578; 
  wire  _T_1579; 
  wire  _T_1580; 
  wire  _T_1598; 
  wire  _T_1600; 
  wire  _T_1608; 
  wire  _T_1611; 
  wire  _T_1612; 
  wire  _T_1652; 
  wire  _T_1657; 
  wire  _T_1660; 
  wire  _T_1663; 
  wire  _T_1666; 
  wire  _T_1672; 
  wire  _T_1675; 
  wire  _T_1678; 
  wire  _T_1685; 
  wire  _T_1686; 
  wire  _T_1697; 
  wire  _T_1699; 
  wire  _T_1700; 
  wire  _T_1705; 
  wire  _T_1808; 
  wire  _T_1818; 
  wire  _T_1820; 
  wire  _T_1821; 
  wire  _T_1826; 
  wire  _T_1840; 
  wire  _T_1862; 
  wire [2:0] _T_1867; 
  wire  _T_1868; 
  wire  _T_1869; 
  reg [2:0] _T_1872; 
  reg [31:0] _RAND_0;
  wire [3:0] _T_1873; 
  wire [3:0] _T_1874; 
  wire [2:0] _T_1875; 
  wire  _T_1876; 
  reg [2:0] _T_1885; 
  reg [31:0] _RAND_1;
  reg [2:0] _T_1887; 
  reg [31:0] _RAND_2;
  reg [2:0] _T_1889; 
  reg [31:0] _RAND_3;
  reg [4:0] _T_1891; 
  reg [31:0] _RAND_4;
  reg [31:0] _T_1893; 
  reg [31:0] _RAND_5;
  wire  _T_1894; 
  wire  _T_1895; 
  wire  _T_1896; 
  wire  _T_1898; 
  wire  _T_1899; 
  wire  _T_1900; 
  wire  _T_1902; 
  wire  _T_1903; 
  wire  _T_1904; 
  wire  _T_1906; 
  wire  _T_1907; 
  wire  _T_1908; 
  wire  _T_1910; 
  wire  _T_1911; 
  wire  _T_1912; 
  wire  _T_1914; 
  wire  _T_1915; 
  wire  _T_1917; 
  wire  _T_1918; 
  wire [12:0] _T_1920; 
  wire [5:0] _T_1921; 
  wire [5:0] _T_1922; 
  wire [2:0] _T_1923; 
  wire  _T_1924; 
  reg [2:0] _T_1927; 
  reg [31:0] _RAND_6;
  wire [3:0] _T_1928; 
  wire [3:0] _T_1929; 
  wire [2:0] _T_1930; 
  wire  _T_1931; 
  reg [2:0] _T_1940; 
  reg [31:0] _RAND_7;
  reg [1:0] _T_1942; 
  reg [31:0] _RAND_8;
  reg [2:0] _T_1944; 
  reg [31:0] _RAND_9;
  reg [4:0] _T_1946; 
  reg [31:0] _RAND_10;
  reg [1:0] _T_1948; 
  reg [31:0] _RAND_11;
  reg  _T_1950; 
  reg [31:0] _RAND_12;
  wire  _T_1951; 
  wire  _T_1952; 
  wire  _T_1953; 
  wire  _T_1955; 
  wire  _T_1956; 
  wire  _T_1957; 
  wire  _T_1959; 
  wire  _T_1960; 
  wire  _T_1961; 
  wire  _T_1963; 
  wire  _T_1964; 
  wire  _T_1965; 
  wire  _T_1967; 
  wire  _T_1968; 
  wire  _T_1969; 
  wire  _T_1971; 
  wire  _T_1972; 
  wire  _T_1973; 
  wire  _T_1975; 
  wire  _T_1976; 
  wire  _T_1978; 
  wire  _T_1979; 
  reg [2:0] _T_1989; 
  reg [31:0] _RAND_13;
  wire [3:0] _T_1990; 
  wire [3:0] _T_1991; 
  wire [2:0] _T_1992; 
  wire  _T_1993; 
  reg [1:0] _T_2004; 
  reg [31:0] _RAND_14;
  reg [4:0] _T_2008; 
  reg [31:0] _RAND_15;
  reg [31:0] _T_2010; 
  reg [31:0] _RAND_16;
  wire  _T_2011; 
  wire  _T_2012; 
  wire  _T_2017; 
  wire  _T_2019; 
  wire  _T_2020; 
  wire  _T_2025; 
  wire  _T_2027; 
  wire  _T_2028; 
  wire  _T_2029; 
  wire  _T_2031; 
  wire  _T_2032; 
  wire  _T_2034; 
  wire  _T_2035; 
  wire [2:0] _T_2040; 
  wire  _T_2041; 
  reg [2:0] _T_2044; 
  reg [31:0] _RAND_17;
  wire [3:0] _T_2045; 
  wire [3:0] _T_2046; 
  wire [2:0] _T_2047; 
  wire  _T_2048; 
  reg [2:0] _T_2057; 
  reg [31:0] _RAND_18;
  reg [2:0] _T_2059; 
  reg [31:0] _RAND_19;
  reg [2:0] _T_2061; 
  reg [31:0] _RAND_20;
  reg [4:0] _T_2063; 
  reg [31:0] _RAND_21;
  reg [31:0] _T_2065; 
  reg [31:0] _RAND_22;
  wire  _T_2066; 
  wire  _T_2067; 
  wire  _T_2068; 
  wire  _T_2070; 
  wire  _T_2071; 
  wire  _T_2072; 
  wire  _T_2074; 
  wire  _T_2075; 
  wire  _T_2076; 
  wire  _T_2078; 
  wire  _T_2079; 
  wire  _T_2080; 
  wire  _T_2082; 
  wire  _T_2083; 
  wire  _T_2084; 
  wire  _T_2086; 
  wire  _T_2087; 
  wire  _T_2089; 
  reg [30:0] _T_2091; 
  reg [31:0] _RAND_23;
  reg [2:0] _T_2102; 
  reg [31:0] _RAND_24;
  wire [3:0] _T_2103; 
  wire [3:0] _T_2104; 
  wire [2:0] _T_2105; 
  wire  _T_2106; 
  reg [2:0] _T_2123; 
  reg [31:0] _RAND_25;
  wire [3:0] _T_2124; 
  wire [3:0] _T_2125; 
  wire [2:0] _T_2126; 
  wire  _T_2127; 
  wire  _T_2138; 
  wire [31:0] _T_2140; 
  wire [30:0] _T_2141; 
  wire  _T_2142; 
  wire  _T_2143; 
  wire  _T_2145; 
  wire  _T_2146; 
  wire [31:0] _GEN_27; 
  wire  _T_2151; 
  wire  _T_2153; 
  wire  _T_2154; 
  wire [31:0] _T_2155; 
  wire [30:0] _T_2136; 
  wire [30:0] _T_2156; 
  wire [30:0] _T_2157; 
  wire  _T_2158; 
  wire  _T_2160; 
  wire  _T_2161; 
  wire [31:0] _GEN_28; 
  wire [30:0] _T_2148; 
  wire  _T_2162; 
  wire  _T_2163; 
  wire  _T_2164; 
  wire  _T_2165; 
  wire  _T_2167; 
  wire  _T_2168; 
  wire [30:0] _T_2169; 
  wire [30:0] _T_2170; 
  wire [30:0] _T_2171; 
  reg [31:0] _T_2173; 
  reg [31:0] _RAND_26;
  wire  _T_2174; 
  wire  _T_2175; 
  wire  _T_2176; 
  wire  _T_2177; 
  wire  _T_2178; 
  wire  _T_2179; 
  wire  _T_2181; 
  wire  _T_2182; 
  wire [31:0] _T_2184; 
  wire  _T_2187; 
  reg [3:0] _T_2189; 
  reg [31:0] _RAND_27;
  reg [2:0] _T_2199; 
  reg [31:0] _RAND_28;
  wire [3:0] _T_2200; 
  wire [3:0] _T_2201; 
  wire [2:0] _T_2202; 
  wire  _T_2203; 
  wire  _T_2214; 
  wire  _T_2215; 
  wire  _T_2216; 
  wire  _T_2217; 
  wire  _T_2218; 
  wire  _T_2219; 
  wire [3:0] _T_2220; 
  wire [3:0] _T_2221; 
  wire  _T_2222; 
  wire  _T_2223; 
  wire  _T_2225; 
  wire  _T_2226; 
  wire [3:0] _GEN_31; 
  wire [3:0] _T_2232; 
  wire [3:0] _T_2233; 
  wire [3:0] _T_2234; 
  wire  _T_2235; 
  wire  _T_2237; 
  wire  _T_2238; 
  wire [3:0] _GEN_32; 
  wire [3:0] _T_2239; 
  wire [3:0] _T_2240; 
  wire [3:0] _T_2241; 
  wire  _GEN_36; 
  wire  _GEN_52; 
  wire  _GEN_70; 
  wire  _GEN_82; 
  wire  _GEN_92; 
  wire  _GEN_102; 
  wire  _GEN_112; 
  wire  _GEN_122; 
  wire  _GEN_132; 
  wire  _GEN_142; 
  wire  _GEN_152; 
  wire  _GEN_162; 
  wire  _GEN_168; 
  wire  _GEN_174; 
  wire  _GEN_180; 
  wire  _GEN_192; 
  wire  _GEN_202; 
  wire  _GEN_216; 
  wire  _GEN_228; 
  wire  _GEN_238; 
  wire  _GEN_246; 
  plusarg_reader #(.FORMAT("tilelink_timeout=%d"), .DEFAULT(0)) plusarg_reader ( 
    .out(plusarg_reader_out)
  );
  assign _T_20 = io_in_a_bits_source == 5'h1c; 
  assign _T_21 = io_in_a_bits_source == 5'h1d; 
  assign _T_22 = io_in_a_bits_source == 5'h1e; 
  assign _T_23 = io_in_a_bits_source == 5'h18; 
  assign _T_24 = io_in_a_bits_source == 5'h19; 
  assign _T_25 = io_in_a_bits_source == 5'h1a; 
  assign _T_26 = io_in_a_bits_source == 5'h14; 
  assign _T_27 = io_in_a_bits_source == 5'h15; 
  assign _T_28 = io_in_a_bits_source == 5'h16; 
  assign _T_29 = io_in_a_bits_source == 5'h10; 
  assign _T_30 = io_in_a_bits_source == 5'h11; 
  assign _T_31 = io_in_a_bits_source == 5'h12; 
  assign _T_34 = io_in_a_bits_source[4:4]; 
  assign _T_35 = _T_34 == 1'h0; 
  assign _T_59 = _T_20 | _T_21; 
  assign _T_60 = _T_59 | _T_22; 
  assign _T_61 = _T_60 | _T_23; 
  assign _T_62 = _T_61 | _T_24; 
  assign _T_63 = _T_62 | _T_25; 
  assign _T_64 = _T_63 | _T_26; 
  assign _T_65 = _T_64 | _T_27; 
  assign _T_66 = _T_65 | _T_28; 
  assign _T_67 = _T_66 | _T_29; 
  assign _T_68 = _T_67 | _T_30; 
  assign _T_69 = _T_68 | _T_31; 
  assign _T_70 = _T_69 | _T_35; 
  assign _T_72 = 13'h3f << io_in_a_bits_size; 
  assign _T_73 = _T_72[5:0]; 
  assign _T_74 = ~ _T_73; 
  assign _GEN_33 = {{26'd0}, _T_74}; 
  assign _T_75 = io_in_a_bits_address & _GEN_33; 
  assign _T_76 = _T_75 == 32'h0; 
  assign _T_78 = io_in_a_bits_size[1:0]; 
  assign _T_79 = 4'h1 << _T_78; 
  assign _T_80 = _T_79[2:0]; 
  assign _T_81 = _T_80 | 3'h1; 
  assign _T_82 = io_in_a_bits_size >= 3'h3; 
  assign _T_83 = _T_81[2]; 
  assign _T_84 = io_in_a_bits_address[2]; 
  assign _T_85 = _T_84 == 1'h0; 
  assign _T_87 = _T_83 & _T_85; 
  assign _T_88 = _T_82 | _T_87; 
  assign _T_90 = _T_83 & _T_84; 
  assign _T_91 = _T_82 | _T_90; 
  assign _T_92 = _T_81[1]; 
  assign _T_93 = io_in_a_bits_address[1]; 
  assign _T_94 = _T_93 == 1'h0; 
  assign _T_95 = _T_85 & _T_94; 
  assign _T_96 = _T_92 & _T_95; 
  assign _T_97 = _T_88 | _T_96; 
  assign _T_98 = _T_85 & _T_93; 
  assign _T_99 = _T_92 & _T_98; 
  assign _T_100 = _T_88 | _T_99; 
  assign _T_101 = _T_84 & _T_94; 
  assign _T_102 = _T_92 & _T_101; 
  assign _T_103 = _T_91 | _T_102; 
  assign _T_104 = _T_84 & _T_93; 
  assign _T_105 = _T_92 & _T_104; 
  assign _T_106 = _T_91 | _T_105; 
  assign _T_107 = _T_81[0]; 
  assign _T_108 = io_in_a_bits_address[0]; 
  assign _T_109 = _T_108 == 1'h0; 
  assign _T_110 = _T_95 & _T_109; 
  assign _T_111 = _T_107 & _T_110; 
  assign _T_112 = _T_97 | _T_111; 
  assign _T_113 = _T_95 & _T_108; 
  assign _T_114 = _T_107 & _T_113; 
  assign _T_115 = _T_97 | _T_114; 
  assign _T_116 = _T_98 & _T_109; 
  assign _T_117 = _T_107 & _T_116; 
  assign _T_118 = _T_100 | _T_117; 
  assign _T_119 = _T_98 & _T_108; 
  assign _T_120 = _T_107 & _T_119; 
  assign _T_121 = _T_100 | _T_120; 
  assign _T_122 = _T_101 & _T_109; 
  assign _T_123 = _T_107 & _T_122; 
  assign _T_124 = _T_103 | _T_123; 
  assign _T_125 = _T_101 & _T_108; 
  assign _T_126 = _T_107 & _T_125; 
  assign _T_127 = _T_103 | _T_126; 
  assign _T_128 = _T_104 & _T_109; 
  assign _T_129 = _T_107 & _T_128; 
  assign _T_130 = _T_106 | _T_129; 
  assign _T_131 = _T_104 & _T_108; 
  assign _T_132 = _T_107 & _T_131; 
  assign _T_133 = _T_106 | _T_132; 
  assign _T_134 = {_T_115,_T_112}; 
  assign _T_135 = {_T_121,_T_118}; 
  assign _T_136 = {_T_135,_T_134}; 
  assign _T_137 = {_T_127,_T_124}; 
  assign _T_138 = {_T_133,_T_130}; 
  assign _T_139 = {_T_138,_T_137}; 
  assign _T_140 = {_T_139,_T_136}; 
  assign _T_267 = io_in_a_bits_opcode == 3'h6; 
  assign _T_269 = io_in_a_bits_size <= 3'h6; 
  assign _T_272 = io_in_a_bits_address ^ 32'h80000000; 
  assign _T_273 = {1'b0,$signed(_T_272)}; 
  assign _T_274 = $signed(_T_273) & $signed(-33'sh40000000); 
  assign _T_275 = $signed(_T_274); 
  assign _T_276 = $signed(_T_275) == $signed(33'sh0); 
  assign _T_277 = _T_269 & _T_276; 
  assign _T_280 = _T_277 | reset; 
  assign _T_281 = _T_280 == 1'h0; 
  assign _T_321 = 3'h6 == io_in_a_bits_size; 
  assign _T_326 = _T_20 ? _T_321 : 1'h0; 
  assign _T_329 = _T_23 ? _T_321 : 1'h0; 
  assign _T_332 = _T_26 ? _T_321 : 1'h0; 
  assign _T_335 = _T_29 ? _T_321 : 1'h0; 
  assign _T_341 = _T_326 | _T_329; 
  assign _T_344 = _T_341 | _T_332; 
  assign _T_347 = _T_344 | _T_335; 
  assign _T_354 = _T_347 | reset; 
  assign _T_355 = _T_354 == 1'h0; 
  assign _T_357 = _T_70 | reset; 
  assign _T_358 = _T_357 == 1'h0; 
  assign _T_361 = _T_82 | reset; 
  assign _T_362 = _T_361 == 1'h0; 
  assign _T_364 = _T_76 | reset; 
  assign _T_365 = _T_364 == 1'h0; 
  assign _T_366 = io_in_a_bits_param <= 3'h2; 
  assign _T_368 = _T_366 | reset; 
  assign _T_369 = _T_368 == 1'h0; 
  assign _T_370 = ~ io_in_a_bits_mask; 
  assign _T_371 = _T_370 == 8'h0; 
  assign _T_373 = _T_371 | reset; 
  assign _T_374 = _T_373 == 1'h0; 
  assign _T_375 = io_in_a_bits_corrupt == 1'h0; 
  assign _T_377 = _T_375 | reset; 
  assign _T_378 = _T_377 == 1'h0; 
  assign _T_379 = io_in_a_bits_opcode == 3'h7; 
  assign _T_482 = io_in_a_bits_param != 3'h0; 
  assign _T_484 = _T_482 | reset; 
  assign _T_485 = _T_484 == 1'h0; 
  assign _T_495 = io_in_a_bits_opcode == 3'h4; 
  assign _T_516 = io_in_a_bits_param == 3'h0; 
  assign _T_518 = _T_516 | reset; 
  assign _T_519 = _T_518 == 1'h0; 
  assign _T_520 = io_in_a_bits_mask == _T_140; 
  assign _T_522 = _T_520 | reset; 
  assign _T_523 = _T_522 == 1'h0; 
  assign _T_528 = io_in_a_bits_opcode == 3'h0; 
  assign _T_557 = io_in_a_bits_opcode == 3'h1; 
  assign _T_582 = ~ _T_140; 
  assign _T_583 = io_in_a_bits_mask & _T_582; 
  assign _T_584 = _T_583 == 8'h0; 
  assign _T_586 = _T_584 | reset; 
  assign _T_587 = _T_586 == 1'h0; 
  assign _T_588 = io_in_a_bits_opcode == 3'h2; 
  assign _T_599 = reset == 1'h0; 
  assign _T_606 = io_in_a_bits_param <= 3'h4; 
  assign _T_608 = _T_606 | reset; 
  assign _T_609 = _T_608 == 1'h0; 
  assign _T_614 = io_in_a_bits_opcode == 3'h3; 
  assign _T_632 = io_in_a_bits_param <= 3'h3; 
  assign _T_634 = _T_632 | reset; 
  assign _T_635 = _T_634 == 1'h0; 
  assign _T_640 = io_in_a_bits_opcode == 3'h5; 
  assign _T_666 = io_in_d_bits_opcode <= 3'h6; 
  assign _T_668 = _T_666 | reset; 
  assign _T_669 = _T_668 == 1'h0; 
  assign _T_670 = io_in_d_bits_source == 5'h1c; 
  assign _T_671 = io_in_d_bits_source == 5'h1d; 
  assign _T_672 = io_in_d_bits_source == 5'h1e; 
  assign _T_673 = io_in_d_bits_source == 5'h18; 
  assign _T_674 = io_in_d_bits_source == 5'h19; 
  assign _T_675 = io_in_d_bits_source == 5'h1a; 
  assign _T_676 = io_in_d_bits_source == 5'h14; 
  assign _T_677 = io_in_d_bits_source == 5'h15; 
  assign _T_678 = io_in_d_bits_source == 5'h16; 
  assign _T_679 = io_in_d_bits_source == 5'h10; 
  assign _T_680 = io_in_d_bits_source == 5'h11; 
  assign _T_681 = io_in_d_bits_source == 5'h12; 
  assign _T_684 = io_in_d_bits_source[4:4]; 
  assign _T_685 = _T_684 == 1'h0; 
  assign _T_709 = _T_670 | _T_671; 
  assign _T_710 = _T_709 | _T_672; 
  assign _T_711 = _T_710 | _T_673; 
  assign _T_712 = _T_711 | _T_674; 
  assign _T_713 = _T_712 | _T_675; 
  assign _T_714 = _T_713 | _T_676; 
  assign _T_715 = _T_714 | _T_677; 
  assign _T_716 = _T_715 | _T_678; 
  assign _T_717 = _T_716 | _T_679; 
  assign _T_718 = _T_717 | _T_680; 
  assign _T_719 = _T_718 | _T_681; 
  assign _T_720 = _T_719 | _T_685; 
  assign _T_722 = io_in_d_bits_opcode == 3'h6; 
  assign _T_724 = _T_720 | reset; 
  assign _T_725 = _T_724 == 1'h0; 
  assign _T_726 = io_in_d_bits_size >= 3'h3; 
  assign _T_728 = _T_726 | reset; 
  assign _T_729 = _T_728 == 1'h0; 
  assign _T_730 = io_in_d_bits_param == 2'h0; 
  assign _T_732 = _T_730 | reset; 
  assign _T_733 = _T_732 == 1'h0; 
  assign _T_734 = io_in_d_bits_corrupt == 1'h0; 
  assign _T_736 = _T_734 | reset; 
  assign _T_737 = _T_736 == 1'h0; 
  assign _T_738 = io_in_d_bits_denied == 1'h0; 
  assign _T_740 = _T_738 | reset; 
  assign _T_741 = _T_740 == 1'h0; 
  assign _T_742 = io_in_d_bits_opcode == 3'h4; 
  assign _T_753 = io_in_d_bits_param <= 2'h2; 
  assign _T_755 = _T_753 | reset; 
  assign _T_756 = _T_755 == 1'h0; 
  assign _T_757 = io_in_d_bits_param != 2'h2; 
  assign _T_759 = _T_757 | reset; 
  assign _T_760 = _T_759 == 1'h0; 
  assign _T_770 = io_in_d_bits_opcode == 3'h5; 
  assign _T_790 = _T_738 | io_in_d_bits_corrupt; 
  assign _T_792 = _T_790 | reset; 
  assign _T_793 = _T_792 == 1'h0; 
  assign _T_799 = io_in_d_bits_opcode == 3'h0; 
  assign _T_816 = io_in_d_bits_opcode == 3'h1; 
  assign _T_834 = io_in_d_bits_opcode == 3'h2; 
  assign _T_855 = io_in_b_bits_source == 5'h1c; 
  assign _T_863 = io_in_b_bits_source == 5'h1d; 
  assign _T_871 = io_in_b_bits_source == 5'h1e; 
  assign _T_879 = io_in_b_bits_source == 5'h18; 
  assign _T_887 = io_in_b_bits_source == 5'h19; 
  assign _T_895 = io_in_b_bits_source == 5'h1a; 
  assign _T_903 = io_in_b_bits_source == 5'h14; 
  assign _T_911 = io_in_b_bits_source == 5'h15; 
  assign _T_919 = io_in_b_bits_source == 5'h16; 
  assign _T_927 = io_in_b_bits_source == 5'h10; 
  assign _T_935 = io_in_b_bits_source == 5'h11; 
  assign _T_943 = io_in_b_bits_source == 5'h12; 
  assign _T_981 = io_in_b_bits_address ^ 32'h80000000; 
  assign _T_982 = {1'b0,$signed(_T_981)}; 
  assign _T_983 = $signed(_T_982) & $signed(-33'sh40000000); 
  assign _T_984 = $signed(_T_983); 
  assign _T_985 = $signed(_T_984) == $signed(33'sh0); 
  assign _T_994 = 13'h3f << 3'h6; 
  assign _T_995 = _T_994[5:0]; 
  assign _T_996 = ~ _T_995; 
  assign _GEN_34 = {{26'd0}, _T_996}; 
  assign _T_997 = io_in_b_bits_address & _GEN_34; 
  assign _T_998 = _T_997 == 32'h0; 
  assign _T_1103 = _T_855 ? 5'h1c : 5'h0; 
  assign _T_1104 = _T_863 ? 5'h1d : 5'h0; 
  assign _T_1105 = _T_871 ? 5'h1e : 5'h0; 
  assign _T_1106 = _T_879 ? 5'h18 : 5'h0; 
  assign _T_1107 = _T_887 ? 5'h19 : 5'h0; 
  assign _T_1108 = _T_895 ? 5'h1a : 5'h0; 
  assign _T_1109 = _T_903 ? 5'h14 : 5'h0; 
  assign _T_1110 = _T_911 ? 5'h15 : 5'h0; 
  assign _T_1111 = _T_919 ? 5'h16 : 5'h0; 
  assign _T_1112 = _T_927 ? 5'h10 : 5'h0; 
  assign _T_1113 = _T_935 ? 5'h11 : 5'h0; 
  assign _T_1114 = _T_943 ? 5'h12 : 5'h0; 
  assign _T_1116 = _T_1103 | _T_1104; 
  assign _T_1117 = _T_1116 | _T_1105; 
  assign _T_1118 = _T_1117 | _T_1106; 
  assign _T_1119 = _T_1118 | _T_1107; 
  assign _T_1120 = _T_1119 | _T_1108; 
  assign _T_1121 = _T_1120 | _T_1109; 
  assign _T_1122 = _T_1121 | _T_1110; 
  assign _T_1123 = _T_1122 | _T_1111; 
  assign _T_1124 = _T_1123 | _T_1112; 
  assign _T_1125 = _T_1124 | _T_1113; 
  assign _T_1126 = _T_1125 | _T_1114; 
  assign _T_1130 = _T_1126 == io_in_b_bits_source; 
  assign _T_1191 = _T_855 | _T_879; 
  assign _T_1194 = _T_1191 | _T_903; 
  assign _T_1197 = _T_1194 | _T_927; 
  assign _T_1204 = _T_1197 | reset; 
  assign _T_1205 = _T_1204 == 1'h0; 
  assign _T_1207 = _T_985 | reset; 
  assign _T_1208 = _T_1207 == 1'h0; 
  assign _T_1210 = _T_1130 | reset; 
  assign _T_1211 = _T_1210 == 1'h0; 
  assign _T_1213 = _T_998 | reset; 
  assign _T_1214 = _T_1213 == 1'h0; 
  assign _T_1215 = io_in_b_bits_param <= 2'h2; 
  assign _T_1217 = _T_1215 | reset; 
  assign _T_1218 = _T_1217 == 1'h0; 
  assign _T_1363 = io_in_c_bits_source == 5'h1c; 
  assign _T_1364 = io_in_c_bits_source == 5'h1d; 
  assign _T_1365 = io_in_c_bits_source == 5'h1e; 
  assign _T_1366 = io_in_c_bits_source == 5'h18; 
  assign _T_1367 = io_in_c_bits_source == 5'h19; 
  assign _T_1368 = io_in_c_bits_source == 5'h1a; 
  assign _T_1369 = io_in_c_bits_source == 5'h14; 
  assign _T_1370 = io_in_c_bits_source == 5'h15; 
  assign _T_1371 = io_in_c_bits_source == 5'h16; 
  assign _T_1372 = io_in_c_bits_source == 5'h10; 
  assign _T_1373 = io_in_c_bits_source == 5'h11; 
  assign _T_1374 = io_in_c_bits_source == 5'h12; 
  assign _T_1377 = io_in_c_bits_source[4:4]; 
  assign _T_1378 = _T_1377 == 1'h0; 
  assign _T_1402 = _T_1363 | _T_1364; 
  assign _T_1403 = _T_1402 | _T_1365; 
  assign _T_1404 = _T_1403 | _T_1366; 
  assign _T_1405 = _T_1404 | _T_1367; 
  assign _T_1406 = _T_1405 | _T_1368; 
  assign _T_1407 = _T_1406 | _T_1369; 
  assign _T_1408 = _T_1407 | _T_1370; 
  assign _T_1409 = _T_1408 | _T_1371; 
  assign _T_1410 = _T_1409 | _T_1372; 
  assign _T_1411 = _T_1410 | _T_1373; 
  assign _T_1412 = _T_1411 | _T_1374; 
  assign _T_1413 = _T_1412 | _T_1378; 
  assign _T_1415 = 13'h3f << io_in_c_bits_size; 
  assign _T_1416 = _T_1415[5:0]; 
  assign _T_1417 = ~ _T_1416; 
  assign _GEN_35 = {{26'd0}, _T_1417}; 
  assign _T_1418 = io_in_c_bits_address & _GEN_35; 
  assign _T_1419 = _T_1418 == 32'h0; 
  assign _T_1420 = io_in_c_bits_address ^ 32'h80000000; 
  assign _T_1421 = {1'b0,$signed(_T_1420)}; 
  assign _T_1422 = $signed(_T_1421) & $signed(-33'sh40000000); 
  assign _T_1423 = $signed(_T_1422); 
  assign _T_1424 = $signed(_T_1423) == $signed(33'sh0); 
  assign _T_1558 = io_in_c_bits_opcode == 3'h4; 
  assign _T_1560 = _T_1424 | reset; 
  assign _T_1561 = _T_1560 == 1'h0; 
  assign _T_1563 = _T_1413 | reset; 
  assign _T_1564 = _T_1563 == 1'h0; 
  assign _T_1565 = io_in_c_bits_size >= 3'h3; 
  assign _T_1567 = _T_1565 | reset; 
  assign _T_1568 = _T_1567 == 1'h0; 
  assign _T_1570 = _T_1419 | reset; 
  assign _T_1571 = _T_1570 == 1'h0; 
  assign _T_1572 = io_in_c_bits_param <= 3'h5; 
  assign _T_1574 = _T_1572 | reset; 
  assign _T_1575 = _T_1574 == 1'h0; 
  assign _T_1576 = io_in_c_bits_corrupt == 1'h0; 
  assign _T_1578 = _T_1576 | reset; 
  assign _T_1579 = _T_1578 == 1'h0; 
  assign _T_1580 = io_in_c_bits_opcode == 3'h5; 
  assign _T_1598 = io_in_c_bits_opcode == 3'h6; 
  assign _T_1600 = io_in_c_bits_size <= 3'h6; 
  assign _T_1608 = _T_1600 & _T_1424; 
  assign _T_1611 = _T_1608 | reset; 
  assign _T_1612 = _T_1611 == 1'h0; 
  assign _T_1652 = 3'h6 == io_in_c_bits_size; 
  assign _T_1657 = _T_1363 ? _T_1652 : 1'h0; 
  assign _T_1660 = _T_1366 ? _T_1652 : 1'h0; 
  assign _T_1663 = _T_1369 ? _T_1652 : 1'h0; 
  assign _T_1666 = _T_1372 ? _T_1652 : 1'h0; 
  assign _T_1672 = _T_1657 | _T_1660; 
  assign _T_1675 = _T_1672 | _T_1663; 
  assign _T_1678 = _T_1675 | _T_1666; 
  assign _T_1685 = _T_1678 | reset; 
  assign _T_1686 = _T_1685 == 1'h0; 
  assign _T_1697 = io_in_c_bits_param <= 3'h2; 
  assign _T_1699 = _T_1697 | reset; 
  assign _T_1700 = _T_1699 == 1'h0; 
  assign _T_1705 = io_in_c_bits_opcode == 3'h7; 
  assign _T_1808 = io_in_c_bits_opcode == 3'h0; 
  assign _T_1818 = io_in_c_bits_param == 3'h0; 
  assign _T_1820 = _T_1818 | reset; 
  assign _T_1821 = _T_1820 == 1'h0; 
  assign _T_1826 = io_in_c_bits_opcode == 3'h1; 
  assign _T_1840 = io_in_c_bits_opcode == 3'h2; 
  assign _T_1862 = io_in_a_ready & io_in_a_valid; 
  assign _T_1867 = _T_74[5:3]; 
  assign _T_1868 = io_in_a_bits_opcode[2]; 
  assign _T_1869 = _T_1868 == 1'h0; 
  assign _T_1873 = _T_1872 - 3'h1; 
  assign _T_1874 = $unsigned(_T_1873); 
  assign _T_1875 = _T_1874[2:0]; 
  assign _T_1876 = _T_1872 == 3'h0; 
  assign _T_1894 = _T_1876 == 1'h0; 
  assign _T_1895 = io_in_a_valid & _T_1894; 
  assign _T_1896 = io_in_a_bits_opcode == _T_1885; 
  assign _T_1898 = _T_1896 | reset; 
  assign _T_1899 = _T_1898 == 1'h0; 
  assign _T_1900 = io_in_a_bits_param == _T_1887; 
  assign _T_1902 = _T_1900 | reset; 
  assign _T_1903 = _T_1902 == 1'h0; 
  assign _T_1904 = io_in_a_bits_size == _T_1889; 
  assign _T_1906 = _T_1904 | reset; 
  assign _T_1907 = _T_1906 == 1'h0; 
  assign _T_1908 = io_in_a_bits_source == _T_1891; 
  assign _T_1910 = _T_1908 | reset; 
  assign _T_1911 = _T_1910 == 1'h0; 
  assign _T_1912 = io_in_a_bits_address == _T_1893; 
  assign _T_1914 = _T_1912 | reset; 
  assign _T_1915 = _T_1914 == 1'h0; 
  assign _T_1917 = _T_1862 & _T_1876; 
  assign _T_1918 = io_in_d_ready & io_in_d_valid; 
  assign _T_1920 = 13'h3f << io_in_d_bits_size; 
  assign _T_1921 = _T_1920[5:0]; 
  assign _T_1922 = ~ _T_1921; 
  assign _T_1923 = _T_1922[5:3]; 
  assign _T_1924 = io_in_d_bits_opcode[0]; 
  assign _T_1928 = _T_1927 - 3'h1; 
  assign _T_1929 = $unsigned(_T_1928); 
  assign _T_1930 = _T_1929[2:0]; 
  assign _T_1931 = _T_1927 == 3'h0; 
  assign _T_1951 = _T_1931 == 1'h0; 
  assign _T_1952 = io_in_d_valid & _T_1951; 
  assign _T_1953 = io_in_d_bits_opcode == _T_1940; 
  assign _T_1955 = _T_1953 | reset; 
  assign _T_1956 = _T_1955 == 1'h0; 
  assign _T_1957 = io_in_d_bits_param == _T_1942; 
  assign _T_1959 = _T_1957 | reset; 
  assign _T_1960 = _T_1959 == 1'h0; 
  assign _T_1961 = io_in_d_bits_size == _T_1944; 
  assign _T_1963 = _T_1961 | reset; 
  assign _T_1964 = _T_1963 == 1'h0; 
  assign _T_1965 = io_in_d_bits_source == _T_1946; 
  assign _T_1967 = _T_1965 | reset; 
  assign _T_1968 = _T_1967 == 1'h0; 
  assign _T_1969 = io_in_d_bits_sink == _T_1948; 
  assign _T_1971 = _T_1969 | reset; 
  assign _T_1972 = _T_1971 == 1'h0; 
  assign _T_1973 = io_in_d_bits_denied == _T_1950; 
  assign _T_1975 = _T_1973 | reset; 
  assign _T_1976 = _T_1975 == 1'h0; 
  assign _T_1978 = _T_1918 & _T_1931; 
  assign _T_1979 = io_in_b_ready & io_in_b_valid; 
  assign _T_1990 = _T_1989 - 3'h1; 
  assign _T_1991 = $unsigned(_T_1990); 
  assign _T_1992 = _T_1991[2:0]; 
  assign _T_1993 = _T_1989 == 3'h0; 
  assign _T_2011 = _T_1993 == 1'h0; 
  assign _T_2012 = io_in_b_valid & _T_2011; 
  assign _T_2017 = io_in_b_bits_param == _T_2004; 
  assign _T_2019 = _T_2017 | reset; 
  assign _T_2020 = _T_2019 == 1'h0; 
  assign _T_2025 = io_in_b_bits_source == _T_2008; 
  assign _T_2027 = _T_2025 | reset; 
  assign _T_2028 = _T_2027 == 1'h0; 
  assign _T_2029 = io_in_b_bits_address == _T_2010; 
  assign _T_2031 = _T_2029 | reset; 
  assign _T_2032 = _T_2031 == 1'h0; 
  assign _T_2034 = _T_1979 & _T_1993; 
  assign _T_2035 = io_in_c_ready & io_in_c_valid; 
  assign _T_2040 = _T_1417[5:3]; 
  assign _T_2041 = io_in_c_bits_opcode[0]; 
  assign _T_2045 = _T_2044 - 3'h1; 
  assign _T_2046 = $unsigned(_T_2045); 
  assign _T_2047 = _T_2046[2:0]; 
  assign _T_2048 = _T_2044 == 3'h0; 
  assign _T_2066 = _T_2048 == 1'h0; 
  assign _T_2067 = io_in_c_valid & _T_2066; 
  assign _T_2068 = io_in_c_bits_opcode == _T_2057; 
  assign _T_2070 = _T_2068 | reset; 
  assign _T_2071 = _T_2070 == 1'h0; 
  assign _T_2072 = io_in_c_bits_param == _T_2059; 
  assign _T_2074 = _T_2072 | reset; 
  assign _T_2075 = _T_2074 == 1'h0; 
  assign _T_2076 = io_in_c_bits_size == _T_2061; 
  assign _T_2078 = _T_2076 | reset; 
  assign _T_2079 = _T_2078 == 1'h0; 
  assign _T_2080 = io_in_c_bits_source == _T_2063; 
  assign _T_2082 = _T_2080 | reset; 
  assign _T_2083 = _T_2082 == 1'h0; 
  assign _T_2084 = io_in_c_bits_address == _T_2065; 
  assign _T_2086 = _T_2084 | reset; 
  assign _T_2087 = _T_2086 == 1'h0; 
  assign _T_2089 = _T_2035 & _T_2048; 
  assign _T_2103 = _T_2102 - 3'h1; 
  assign _T_2104 = $unsigned(_T_2103); 
  assign _T_2105 = _T_2104[2:0]; 
  assign _T_2106 = _T_2102 == 3'h0; 
  assign _T_2124 = _T_2123 - 3'h1; 
  assign _T_2125 = $unsigned(_T_2124); 
  assign _T_2126 = _T_2125[2:0]; 
  assign _T_2127 = _T_2123 == 3'h0; 
  assign _T_2138 = _T_1862 & _T_2106; 
  assign _T_2140 = 32'h1 << io_in_a_bits_source; 
  assign _T_2141 = _T_2091 >> io_in_a_bits_source; 
  assign _T_2142 = _T_2141[0]; 
  assign _T_2143 = _T_2142 == 1'h0; 
  assign _T_2145 = _T_2143 | reset; 
  assign _T_2146 = _T_2145 == 1'h0; 
  assign _GEN_27 = _T_2138 ? _T_2140 : 32'h0; 
  assign _T_2151 = _T_1918 & _T_2127; 
  assign _T_2153 = _T_722 == 1'h0; 
  assign _T_2154 = _T_2151 & _T_2153; 
  assign _T_2155 = 32'h1 << io_in_d_bits_source; 
  assign _T_2136 = _GEN_27[30:0]; 
  assign _T_2156 = _T_2136 | _T_2091; 
  assign _T_2157 = _T_2156 >> io_in_d_bits_source; 
  assign _T_2158 = _T_2157[0]; 
  assign _T_2160 = _T_2158 | reset; 
  assign _T_2161 = _T_2160 == 1'h0; 
  assign _GEN_28 = _T_2154 ? _T_2155 : 32'h0; 
  assign _T_2148 = _GEN_28[30:0]; 
  assign _T_2162 = _T_2136 != _T_2148; 
  assign _T_2163 = _T_2136 != 31'h0; 
  assign _T_2164 = _T_2163 == 1'h0; 
  assign _T_2165 = _T_2162 | _T_2164; 
  assign _T_2167 = _T_2165 | reset; 
  assign _T_2168 = _T_2167 == 1'h0; 
  assign _T_2169 = _T_2091 | _T_2136; 
  assign _T_2170 = ~ _T_2148; 
  assign _T_2171 = _T_2169 & _T_2170; 
  assign _T_2174 = _T_2091 != 31'h0; 
  assign _T_2175 = _T_2174 == 1'h0; 
  assign _T_2176 = plusarg_reader_out == 32'h0; 
  assign _T_2177 = _T_2175 | _T_2176; 
  assign _T_2178 = _T_2173 < plusarg_reader_out; 
  assign _T_2179 = _T_2177 | _T_2178; 
  assign _T_2181 = _T_2179 | reset; 
  assign _T_2182 = _T_2181 == 1'h0; 
  assign _T_2184 = _T_2173 + 32'h1; 
  assign _T_2187 = _T_1862 | _T_1918; 
  assign _T_2200 = _T_2199 - 3'h1; 
  assign _T_2201 = $unsigned(_T_2200); 
  assign _T_2202 = _T_2201[2:0]; 
  assign _T_2203 = _T_2199 == 3'h0; 
  assign _T_2214 = _T_1918 & _T_2203; 
  assign _T_2215 = io_in_d_bits_opcode[2]; 
  assign _T_2216 = io_in_d_bits_opcode[1]; 
  assign _T_2217 = _T_2216 == 1'h0; 
  assign _T_2218 = _T_2215 & _T_2217; 
  assign _T_2219 = _T_2214 & _T_2218; 
  assign _T_2220 = 4'h1 << io_in_d_bits_sink; 
  assign _T_2221 = _T_2189 >> io_in_d_bits_sink; 
  assign _T_2222 = _T_2221[0]; 
  assign _T_2223 = _T_2222 == 1'h0; 
  assign _T_2225 = _T_2223 | reset; 
  assign _T_2226 = _T_2225 == 1'h0; 
  assign _GEN_31 = _T_2219 ? _T_2220 : 4'h0; 
  assign _T_2232 = 4'h1 << io_in_e_bits_sink; 
  assign _T_2233 = _GEN_31 | _T_2189; 
  assign _T_2234 = _T_2233 >> io_in_e_bits_sink; 
  assign _T_2235 = _T_2234[0]; 
  assign _T_2237 = _T_2235 | reset; 
  assign _T_2238 = _T_2237 == 1'h0; 
  assign _GEN_32 = io_in_e_valid ? _T_2232 : 4'h0; 
  assign _T_2239 = _T_2189 | _GEN_31; 
  assign _T_2240 = ~ _GEN_32; 
  assign _T_2241 = _T_2239 & _T_2240; 
  assign _GEN_36 = io_in_a_valid & _T_267; 
  assign _GEN_52 = io_in_a_valid & _T_379; 
  assign _GEN_70 = io_in_a_valid & _T_495; 
  assign _GEN_82 = io_in_a_valid & _T_528; 
  assign _GEN_92 = io_in_a_valid & _T_557; 
  assign _GEN_102 = io_in_a_valid & _T_588; 
  assign _GEN_112 = io_in_a_valid & _T_614; 
  assign _GEN_122 = io_in_a_valid & _T_640; 
  assign _GEN_132 = io_in_d_valid & _T_722; 
  assign _GEN_142 = io_in_d_valid & _T_742; 
  assign _GEN_152 = io_in_d_valid & _T_770; 
  assign _GEN_162 = io_in_d_valid & _T_799; 
  assign _GEN_168 = io_in_d_valid & _T_816; 
  assign _GEN_174 = io_in_d_valid & _T_834; 
  assign _GEN_180 = io_in_c_valid & _T_1558; 
  assign _GEN_192 = io_in_c_valid & _T_1580; 
  assign _GEN_202 = io_in_c_valid & _T_1598; 
  assign _GEN_216 = io_in_c_valid & _T_1705; 
  assign _GEN_228 = io_in_c_valid & _T_1808; 
  assign _GEN_238 = io_in_c_valid & _T_1826; 
  assign _GEN_246 = io_in_c_valid & _T_1840; 
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
  _T_1872 = _RAND_0[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T_1885 = _RAND_1[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_1887 = _RAND_2[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_1889 = _RAND_3[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_1891 = _RAND_4[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_1893 = _RAND_5[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  _T_1927 = _RAND_6[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  _T_1940 = _RAND_7[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  _T_1942 = _RAND_8[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  _T_1944 = _RAND_9[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  _T_1946 = _RAND_10[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  _T_1948 = _RAND_11[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  _T_1950 = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  _T_1989 = _RAND_13[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  _T_2004 = _RAND_14[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  _T_2008 = _RAND_15[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  _T_2010 = _RAND_16[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  _T_2044 = _RAND_17[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  _T_2057 = _RAND_18[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  _T_2059 = _RAND_19[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  _T_2061 = _RAND_20[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{`RANDOM}};
  _T_2063 = _RAND_21[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{`RANDOM}};
  _T_2065 = _RAND_22[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{`RANDOM}};
  _T_2091 = _RAND_23[30:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{`RANDOM}};
  _T_2102 = _RAND_24[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{`RANDOM}};
  _T_2123 = _RAND_25[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{`RANDOM}};
  _T_2173 = _RAND_26[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{`RANDOM}};
  _T_2189 = _RAND_27[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {1{`RANDOM}};
  _T_2199 = _RAND_28[2:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      _T_1872 <= 3'h0;
    end else begin
      if (_T_1862) begin
        if (_T_1876) begin
          if (_T_1869) begin
            _T_1872 <= _T_1867;
          end else begin
            _T_1872 <= 3'h0;
          end
        end else begin
          _T_1872 <= _T_1875;
        end
      end
    end
    if (_T_1917) begin
      _T_1885 <= io_in_a_bits_opcode;
    end
    if (_T_1917) begin
      _T_1887 <= io_in_a_bits_param;
    end
    if (_T_1917) begin
      _T_1889 <= io_in_a_bits_size;
    end
    if (_T_1917) begin
      _T_1891 <= io_in_a_bits_source;
    end
    if (_T_1917) begin
      _T_1893 <= io_in_a_bits_address;
    end
    if (reset) begin
      _T_1927 <= 3'h0;
    end else begin
      if (_T_1918) begin
        if (_T_1931) begin
          if (_T_1924) begin
            _T_1927 <= _T_1923;
          end else begin
            _T_1927 <= 3'h0;
          end
        end else begin
          _T_1927 <= _T_1930;
        end
      end
    end
    if (_T_1978) begin
      _T_1940 <= io_in_d_bits_opcode;
    end
    if (_T_1978) begin
      _T_1942 <= io_in_d_bits_param;
    end
    if (_T_1978) begin
      _T_1944 <= io_in_d_bits_size;
    end
    if (_T_1978) begin
      _T_1946 <= io_in_d_bits_source;
    end
    if (_T_1978) begin
      _T_1948 <= io_in_d_bits_sink;
    end
    if (_T_1978) begin
      _T_1950 <= io_in_d_bits_denied;
    end
    if (reset) begin
      _T_1989 <= 3'h0;
    end else begin
      if (_T_1979) begin
        if (_T_1993) begin
          _T_1989 <= 3'h0;
        end else begin
          _T_1989 <= _T_1992;
        end
      end
    end
    if (_T_2034) begin
      _T_2004 <= io_in_b_bits_param;
    end
    if (_T_2034) begin
      _T_2008 <= io_in_b_bits_source;
    end
    if (_T_2034) begin
      _T_2010 <= io_in_b_bits_address;
    end
    if (reset) begin
      _T_2044 <= 3'h0;
    end else begin
      if (_T_2035) begin
        if (_T_2048) begin
          if (_T_2041) begin
            _T_2044 <= _T_2040;
          end else begin
            _T_2044 <= 3'h0;
          end
        end else begin
          _T_2044 <= _T_2047;
        end
      end
    end
    if (_T_2089) begin
      _T_2057 <= io_in_c_bits_opcode;
    end
    if (_T_2089) begin
      _T_2059 <= io_in_c_bits_param;
    end
    if (_T_2089) begin
      _T_2061 <= io_in_c_bits_size;
    end
    if (_T_2089) begin
      _T_2063 <= io_in_c_bits_source;
    end
    if (_T_2089) begin
      _T_2065 <= io_in_c_bits_address;
    end
    if (reset) begin
      _T_2091 <= 31'h0;
    end else begin
      _T_2091 <= _T_2171;
    end
    if (reset) begin
      _T_2102 <= 3'h0;
    end else begin
      if (_T_1862) begin
        if (_T_2106) begin
          if (_T_1869) begin
            _T_2102 <= _T_1867;
          end else begin
            _T_2102 <= 3'h0;
          end
        end else begin
          _T_2102 <= _T_2105;
        end
      end
    end
    if (reset) begin
      _T_2123 <= 3'h0;
    end else begin
      if (_T_1918) begin
        if (_T_2127) begin
          if (_T_1924) begin
            _T_2123 <= _T_1923;
          end else begin
            _T_2123 <= 3'h0;
          end
        end else begin
          _T_2123 <= _T_2126;
        end
      end
    end
    if (reset) begin
      _T_2173 <= 32'h0;
    end else begin
      if (_T_2187) begin
        _T_2173 <= 32'h0;
      end else begin
        _T_2173 <= _T_2184;
      end
    end
    if (reset) begin
      _T_2189 <= 4'h0;
    end else begin
      _T_2189 <= _T_2241;
    end
    if (reset) begin
      _T_2199 <= 3'h0;
    end else begin
      if (_T_1918) begin
        if (_T_2203) begin
          if (_T_1924) begin
            _T_2199 <= _T_1923;
          end else begin
            _T_2199 <= 3'h0;
          end
        end else begin
          _T_2199 <= _T_2202;
        end
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel has invalid opcode (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:39 assert (TLMessages.isA(bundle.opcode), \"'A' channel has invalid opcode\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries an address illegal for the specified bank visibility\n    at Monitor.scala:46 assert (visible(edge.address(bundle), bundle.source, edge), \"'A' channel carries an address illegal for the specified bank visibility\")\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (_GEN_36 & _T_281) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries AcquireBlock type unsupported by manager (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:49 assert (edge.manager.supportsAcquireBSafe(edge.address(bundle), bundle.size), \"'A' channel carries AcquireBlock type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_36 & _T_281) begin
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
        if (_GEN_36 & _T_355) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries AcquireBlock from a client which does not support Probe (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:50 assert (edge.client.supportsProbe(edge.source(bundle), bundle.size), \"'A' channel carries AcquireBlock from a client which does not support Probe\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_36 & _T_355) begin
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
        if (_GEN_36 & _T_358) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock carries invalid source ID (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:51 assert (source_ok, \"'A' channel AcquireBlock carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_36 & _T_358) begin
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
        if (_GEN_36 & _T_362) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock smaller than a beat (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:52 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'A' channel AcquireBlock smaller than a beat\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_36 & _T_362) begin
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
        if (_GEN_36 & _T_365) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock address not aligned to size (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:53 assert (is_aligned, \"'A' channel AcquireBlock address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_36 & _T_365) begin
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
        if (_GEN_36 & _T_369) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock carries invalid grow param (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:54 assert (TLPermissions.isGrow(bundle.param), \"'A' channel AcquireBlock carries invalid grow param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_36 & _T_369) begin
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
        if (_GEN_36 & _T_374) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock contains invalid mask (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:55 assert (~bundle.mask === UInt(0), \"'A' channel AcquireBlock contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_36 & _T_374) begin
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
        if (_GEN_36 & _T_378) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock is corrupt (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:56 assert (!bundle.corrupt, \"'A' channel AcquireBlock is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_36 & _T_378) begin
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
        if (_GEN_52 & _T_281) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries AcquirePerm type unsupported by manager (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:60 assert (edge.manager.supportsAcquireBSafe(edge.address(bundle), bundle.size), \"'A' channel carries AcquirePerm type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_52 & _T_281) begin
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
        if (_GEN_52 & _T_355) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries AcquirePerm from a client which does not support Probe (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:61 assert (edge.client.supportsProbe(edge.source(bundle), bundle.size), \"'A' channel carries AcquirePerm from a client which does not support Probe\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_52 & _T_355) begin
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
        if (_GEN_52 & _T_358) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm carries invalid source ID (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:62 assert (source_ok, \"'A' channel AcquirePerm carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_52 & _T_358) begin
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
        if (_GEN_52 & _T_362) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm smaller than a beat (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:63 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'A' channel AcquirePerm smaller than a beat\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_52 & _T_362) begin
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
        if (_GEN_52 & _T_365) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm address not aligned to size (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:64 assert (is_aligned, \"'A' channel AcquirePerm address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_52 & _T_365) begin
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
        if (_GEN_52 & _T_369) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm carries invalid grow param (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:65 assert (TLPermissions.isGrow(bundle.param), \"'A' channel AcquirePerm carries invalid grow param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_52 & _T_369) begin
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
        if (_GEN_52 & _T_485) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm requests NtoB (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:66 assert (bundle.param =/= TLPermissions.NtoB, \"'A' channel AcquirePerm requests NtoB\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_52 & _T_485) begin
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
        if (_GEN_52 & _T_374) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm contains invalid mask (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:67 assert (~bundle.mask === UInt(0), \"'A' channel AcquirePerm contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_52 & _T_374) begin
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
        if (_GEN_52 & _T_378) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm is corrupt (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:68 assert (!bundle.corrupt, \"'A' channel AcquirePerm is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_52 & _T_378) begin
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
        if (_GEN_70 & _T_281) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries Get type unsupported by manager (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:72 assert (edge.manager.supportsGetSafe(edge.address(bundle), bundle.size), \"'A' channel carries Get type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_70 & _T_281) begin
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
        if (_GEN_70 & _T_358) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Get carries invalid source ID (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:73 assert (source_ok, \"'A' channel Get carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_70 & _T_358) begin
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
        if (_GEN_70 & _T_365) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Get address not aligned to size (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:74 assert (is_aligned, \"'A' channel Get address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_70 & _T_365) begin
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
        if (_GEN_70 & _T_519) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Get carries invalid param (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:75 assert (bundle.param === UInt(0), \"'A' channel Get carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_70 & _T_519) begin
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
        if (_GEN_70 & _T_523) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Get contains invalid mask (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:76 assert (bundle.mask === mask, \"'A' channel Get contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_70 & _T_523) begin
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
        if (_GEN_70 & _T_378) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Get is corrupt (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:77 assert (!bundle.corrupt, \"'A' channel Get is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_70 & _T_378) begin
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
        if (_GEN_82 & _T_281) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries PutFull type unsupported by manager (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:81 assert (edge.manager.supportsPutFullSafe(edge.address(bundle), bundle.size), \"'A' channel carries PutFull type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_82 & _T_281) begin
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
        if (_GEN_82 & _T_358) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutFull carries invalid source ID (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:82 assert (source_ok, \"'A' channel PutFull carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_82 & _T_358) begin
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
        if (_GEN_82 & _T_365) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutFull address not aligned to size (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:83 assert (is_aligned, \"'A' channel PutFull address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_82 & _T_365) begin
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
        if (_GEN_82 & _T_519) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutFull carries invalid param (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:84 assert (bundle.param === UInt(0), \"'A' channel PutFull carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_82 & _T_519) begin
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
        if (_GEN_82 & _T_523) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutFull contains invalid mask (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:85 assert (bundle.mask === mask, \"'A' channel PutFull contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_82 & _T_523) begin
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
        if (_GEN_92 & _T_281) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries PutPartial type unsupported by manager (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:89 assert (edge.manager.supportsPutPartialSafe(edge.address(bundle), bundle.size), \"'A' channel carries PutPartial type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_92 & _T_281) begin
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
        if (_GEN_92 & _T_358) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutPartial carries invalid source ID (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:90 assert (source_ok, \"'A' channel PutPartial carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_92 & _T_358) begin
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
        if (_GEN_92 & _T_365) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutPartial address not aligned to size (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:91 assert (is_aligned, \"'A' channel PutPartial address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_92 & _T_365) begin
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
        if (_GEN_92 & _T_519) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutPartial carries invalid param (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:92 assert (bundle.param === UInt(0), \"'A' channel PutPartial carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_92 & _T_519) begin
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
        if (_GEN_92 & _T_587) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutPartial contains invalid mask (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:93 assert ((bundle.mask & ~mask) === UInt(0), \"'A' channel PutPartial contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_92 & _T_587) begin
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
        if (_GEN_102 & _T_599) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries Arithmetic type unsupported by manager (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:97 assert (edge.manager.supportsArithmeticSafe(edge.address(bundle), bundle.size), \"'A' channel carries Arithmetic type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_102 & _T_599) begin
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
        if (_GEN_102 & _T_358) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Arithmetic carries invalid source ID (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:98 assert (source_ok, \"'A' channel Arithmetic carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_102 & _T_358) begin
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
        if (_GEN_102 & _T_365) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Arithmetic address not aligned to size (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:99 assert (is_aligned, \"'A' channel Arithmetic address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_102 & _T_365) begin
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
        if (_GEN_102 & _T_609) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Arithmetic carries invalid opcode param (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:100 assert (TLAtomics.isArithmetic(bundle.param), \"'A' channel Arithmetic carries invalid opcode param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_102 & _T_609) begin
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
        if (_GEN_102 & _T_523) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Arithmetic contains invalid mask (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:101 assert (bundle.mask === mask, \"'A' channel Arithmetic contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_102 & _T_523) begin
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
        if (_GEN_112 & _T_599) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries Logical type unsupported by manager (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:105 assert (edge.manager.supportsLogicalSafe(edge.address(bundle), bundle.size), \"'A' channel carries Logical type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_112 & _T_599) begin
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
        if (_GEN_112 & _T_358) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Logical carries invalid source ID (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:106 assert (source_ok, \"'A' channel Logical carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_112 & _T_358) begin
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
        if (_GEN_112 & _T_365) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Logical address not aligned to size (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:107 assert (is_aligned, \"'A' channel Logical address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_112 & _T_365) begin
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
        if (_GEN_112 & _T_635) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Logical carries invalid opcode param (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:108 assert (TLAtomics.isLogical(bundle.param), \"'A' channel Logical carries invalid opcode param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_112 & _T_635) begin
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
        if (_GEN_112 & _T_523) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Logical contains invalid mask (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:109 assert (bundle.mask === mask, \"'A' channel Logical contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_112 & _T_523) begin
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
        if (_GEN_122 & _T_599) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries Hint type unsupported by manager (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:113 assert (edge.manager.supportsHintSafe(edge.address(bundle), bundle.size), \"'A' channel carries Hint type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_122 & _T_599) begin
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
        if (_GEN_122 & _T_358) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Hint carries invalid source ID (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:114 assert (source_ok, \"'A' channel Hint carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_122 & _T_358) begin
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
        if (_GEN_122 & _T_365) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Hint address not aligned to size (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:115 assert (is_aligned, \"'A' channel Hint address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_122 & _T_365) begin
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
        if (_GEN_122 & _T_523) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Hint contains invalid mask (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:116 assert (bundle.mask === mask, \"'A' channel Hint contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_122 & _T_523) begin
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
        if (_GEN_122 & _T_378) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Hint is corrupt (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:117 assert (!bundle.corrupt, \"'A' channel Hint is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_122 & _T_378) begin
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
        if (io_in_d_valid & _T_669) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel has invalid opcode (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:268 assert (TLMessages.isD(bundle.opcode), \"'D' channel has invalid opcode\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_d_valid & _T_669) begin
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
        if (_GEN_132 & _T_725) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel ReleaseAck carries invalid source ID (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:276 assert (source_ok, \"'D' channel ReleaseAck carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_132 & _T_725) begin
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
        if (_GEN_132 & _T_729) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel ReleaseAck smaller than a beat (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:277 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'D' channel ReleaseAck smaller than a beat\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_132 & _T_729) begin
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
        if (_GEN_132 & _T_733) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel ReleaseeAck carries invalid param (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:278 assert (bundle.param === UInt(0), \"'D' channel ReleaseeAck carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_132 & _T_733) begin
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
        if (_GEN_132 & _T_737) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel ReleaseAck is corrupt (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:279 assert (!bundle.corrupt, \"'D' channel ReleaseAck is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_132 & _T_737) begin
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
        if (_GEN_132 & _T_741) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel ReleaseAck is denied (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:280 assert (!bundle.denied, \"'D' channel ReleaseAck is denied\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_132 & _T_741) begin
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
        if (_GEN_142 & _T_725) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant carries invalid source ID (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:284 assert (source_ok, \"'D' channel Grant carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_142 & _T_725) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant carries invalid sink ID (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:285 assert (sink_ok, \"'D' channel Grant carries invalid sink ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (_GEN_142 & _T_729) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant smaller than a beat (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:286 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'D' channel Grant smaller than a beat\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_142 & _T_729) begin
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
        if (_GEN_142 & _T_756) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant carries invalid cap param (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:287 assert (TLPermissions.isCap(bundle.param), \"'D' channel Grant carries invalid cap param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_142 & _T_756) begin
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
        if (_GEN_142 & _T_760) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant carries toN param (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:288 assert (bundle.param =/= TLPermissions.toN, \"'D' channel Grant carries toN param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_142 & _T_760) begin
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
        if (_GEN_142 & _T_737) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant is corrupt (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:289 assert (!bundle.corrupt, \"'D' channel Grant is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_142 & _T_737) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant is denied (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:290 assert (deny_put_ok || !bundle.denied, \"'D' channel Grant is denied\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (_GEN_152 & _T_725) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData carries invalid source ID (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:294 assert (source_ok, \"'D' channel GrantData carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_152 & _T_725) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData carries invalid sink ID (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:295 assert (sink_ok, \"'D' channel GrantData carries invalid sink ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (_GEN_152 & _T_729) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData smaller than a beat (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:296 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'D' channel GrantData smaller than a beat\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_152 & _T_729) begin
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
        if (_GEN_152 & _T_756) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData carries invalid cap param (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:297 assert (TLPermissions.isCap(bundle.param), \"'D' channel GrantData carries invalid cap param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_152 & _T_756) begin
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
        if (_GEN_152 & _T_760) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData carries toN param (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:298 assert (bundle.param =/= TLPermissions.toN, \"'D' channel GrantData carries toN param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_152 & _T_760) begin
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
        if (_GEN_152 & _T_793) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData is denied but not corrupt (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:299 assert (!bundle.denied || bundle.corrupt, \"'D' channel GrantData is denied but not corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_152 & _T_793) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData is denied (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:300 assert (deny_get_ok || !bundle.denied, \"'D' channel GrantData is denied\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (_GEN_162 & _T_725) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAck carries invalid source ID (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:304 assert (source_ok, \"'D' channel AccessAck carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_162 & _T_725) begin
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
        if (_GEN_162 & _T_733) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAck carries invalid param (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:306 assert (bundle.param === UInt(0), \"'D' channel AccessAck carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_162 & _T_733) begin
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
        if (_GEN_162 & _T_737) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAck is corrupt (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:307 assert (!bundle.corrupt, \"'D' channel AccessAck is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_162 & _T_737) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAck is denied (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:308 assert (deny_put_ok || !bundle.denied, \"'D' channel AccessAck is denied\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (_GEN_168 & _T_725) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAckData carries invalid source ID (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:312 assert (source_ok, \"'D' channel AccessAckData carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_168 & _T_725) begin
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
        if (_GEN_168 & _T_733) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAckData carries invalid param (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:314 assert (bundle.param === UInt(0), \"'D' channel AccessAckData carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_168 & _T_733) begin
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
        if (_GEN_168 & _T_793) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAckData is denied but not corrupt (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:315 assert (!bundle.denied || bundle.corrupt, \"'D' channel AccessAckData is denied but not corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_168 & _T_793) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAckData is denied (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:316 assert (deny_get_ok || !bundle.denied, \"'D' channel AccessAckData is denied\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (_GEN_174 & _T_725) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel HintAck carries invalid source ID (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:320 assert (source_ok, \"'D' channel HintAck carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_174 & _T_725) begin
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
        if (_GEN_174 & _T_733) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel HintAck carries invalid param (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:322 assert (bundle.param === UInt(0), \"'D' channel HintAck carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_174 & _T_733) begin
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
        if (_GEN_174 & _T_737) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel HintAck is corrupt (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:323 assert (!bundle.corrupt, \"'D' channel HintAck is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_174 & _T_737) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel HintAck is denied (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:324 assert (deny_put_ok || !bundle.denied, \"'D' channel HintAck is denied\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel has invalid opcode (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:122 assert (TLMessages.isB(bundle.opcode), \"'B' channel has invalid opcode\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel carries an address illegal for the specified bank visibility\n    at Monitor.scala:124 assert (visible(edge.address(bundle), bundle.source, edge), \"'B' channel carries an address illegal for the specified bank visibility\")\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (io_in_b_valid & _T_1205) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel carries Probe type unsupported by client (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:133 assert (edge.client.supportsProbe(bundle.source, bundle.size), \"'B' channel carries Probe type unsupported by client\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1205) begin
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
        if (io_in_b_valid & _T_1208) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Probe carries unmanaged address (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:134 assert (address_ok, \"'B' channel Probe carries unmanaged address\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1208) begin
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
        if (io_in_b_valid & _T_1211) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Probe carries source that is not first source (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:135 assert (legal_source, \"'B' channel Probe carries source that is not first source\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1211) begin
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
        if (io_in_b_valid & _T_1214) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Probe address not aligned to size (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:136 assert (is_aligned, \"'B' channel Probe address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1214) begin
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
        if (io_in_b_valid & _T_1218) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Probe carries invalid cap param (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:137 assert (TLPermissions.isCap(bundle.param), \"'B' channel Probe carries invalid cap param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1218) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Probe contains invalid mask (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:138 assert (bundle.mask === mask, \"'B' channel Probe contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Probe is corrupt (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:139 assert (!bundle.corrupt, \"'B' channel Probe is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel carries Get type unsupported by client (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:143 assert (edge.client.supportsGet(bundle.source, bundle.size), \"'B' channel carries Get type unsupported by client\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Get carries unmanaged address (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:144 assert (address_ok, \"'B' channel Get carries unmanaged address\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Get carries source that is not first source (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:145 assert (legal_source, \"'B' channel Get carries source that is not first source\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Get address not aligned to size (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:146 assert (is_aligned, \"'B' channel Get address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Get carries invalid param (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:147 assert (bundle.param === UInt(0), \"'B' channel Get carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Get contains invalid mask (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:148 assert (bundle.mask === mask, \"'B' channel Get contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Get is corrupt (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:149 assert (!bundle.corrupt, \"'B' channel Get is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel carries PutFull type unsupported by client (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:153 assert (edge.client.supportsPutFull(bundle.source, bundle.size), \"'B' channel carries PutFull type unsupported by client\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel PutFull carries unmanaged address (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:154 assert (address_ok, \"'B' channel PutFull carries unmanaged address\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel PutFull carries source that is not first source (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:155 assert (legal_source, \"'B' channel PutFull carries source that is not first source\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel PutFull address not aligned to size (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:156 assert (is_aligned, \"'B' channel PutFull address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel PutFull carries invalid param (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:157 assert (bundle.param === UInt(0), \"'B' channel PutFull carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel PutFull contains invalid mask (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:158 assert (bundle.mask === mask, \"'B' channel PutFull contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel carries PutPartial type unsupported by client (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:162 assert (edge.client.supportsPutPartial(bundle.source, bundle.size), \"'B' channel carries PutPartial type unsupported by client\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel PutPartial carries unmanaged address (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:163 assert (address_ok, \"'B' channel PutPartial carries unmanaged address\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel PutPartial carries source that is not first source (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:164 assert (legal_source, \"'B' channel PutPartial carries source that is not first source\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel PutPartial address not aligned to size (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:165 assert (is_aligned, \"'B' channel PutPartial address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel PutPartial carries invalid param (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:166 assert (bundle.param === UInt(0), \"'B' channel PutPartial carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel PutPartial contains invalid mask (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:167 assert ((bundle.mask & ~mask) === UInt(0), \"'B' channel PutPartial contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel carries Arithmetic type unsupported by client (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:171 assert (edge.client.supportsArithmetic(bundle.source, bundle.size), \"'B' channel carries Arithmetic type unsupported by client\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Arithmetic carries unmanaged address (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:172 assert (address_ok, \"'B' channel Arithmetic carries unmanaged address\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Arithmetic carries source that is not first source (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:173 assert (legal_source, \"'B' channel Arithmetic carries source that is not first source\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Arithmetic address not aligned to size (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:174 assert (is_aligned, \"'B' channel Arithmetic address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Arithmetic carries invalid opcode param (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:175 assert (TLAtomics.isArithmetic(bundle.param), \"'B' channel Arithmetic carries invalid opcode param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Arithmetic contains invalid mask (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:176 assert (bundle.mask === mask, \"'B' channel Arithmetic contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel carries Logical type unsupported by client (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:180 assert (edge.client.supportsLogical(bundle.source, bundle.size), \"'B' channel carries Logical type unsupported by client\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Logical carries unmanaged address (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:181 assert (address_ok, \"'B' channel Logical carries unmanaged address\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Logical carries source that is not first source (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:182 assert (legal_source, \"'B' channel Logical carries source that is not first source\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Logical address not aligned to size (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:183 assert (is_aligned, \"'B' channel Logical address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Logical carries invalid opcode param (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:184 assert (TLAtomics.isLogical(bundle.param), \"'B' channel Logical carries invalid opcode param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Logical contains invalid mask (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:185 assert (bundle.mask === mask, \"'B' channel Logical contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel carries Hint type unsupported by client (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:189 assert (edge.client.supportsHint(bundle.source, bundle.size), \"'B' channel carries Hint type unsupported by client\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Hint carries unmanaged address (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:190 assert (address_ok, \"'B' channel Hint carries unmanaged address\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Hint carries source that is not first source (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:191 assert (legal_source, \"'B' channel Hint carries source that is not first source\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Hint address not aligned to size (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:192 assert (is_aligned, \"'B' channel Hint address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Hint contains invalid mask (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:193 assert (bundle.mask === mask, \"'B' channel Hint contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Hint is corrupt (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:194 assert (!bundle.corrupt, \"'B' channel Hint is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel has invalid opcode (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:199 assert (TLMessages.isC(bundle.opcode), \"'C' channel has invalid opcode\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel carries an address illegal for the specified bank visibility\n    at Monitor.scala:205 assert (visible(edge.address(bundle), bundle.source, edge), \"'C' channel carries an address illegal for the specified bank visibility\")\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (_GEN_180 & _T_1561) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ProbeAck carries unmanaged address (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:208 assert (address_ok, \"'C' channel ProbeAck carries unmanaged address\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_180 & _T_1561) begin
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
        if (_GEN_180 & _T_1564) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ProbeAck carries invalid source ID (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:209 assert (source_ok, \"'C' channel ProbeAck carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_180 & _T_1564) begin
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
        if (_GEN_180 & _T_1568) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ProbeAck smaller than a beat (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:210 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'C' channel ProbeAck smaller than a beat\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_180 & _T_1568) begin
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
        if (_GEN_180 & _T_1571) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ProbeAck address not aligned to size (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:211 assert (is_aligned, \"'C' channel ProbeAck address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_180 & _T_1571) begin
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
        if (_GEN_180 & _T_1575) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ProbeAck carries invalid report param (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:212 assert (TLPermissions.isReport(bundle.param), \"'C' channel ProbeAck carries invalid report param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_180 & _T_1575) begin
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
        if (_GEN_180 & _T_1579) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ProbeAck is corrupt (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:213 assert (!bundle.corrupt, \"'C' channel ProbeAck is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_180 & _T_1579) begin
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
        if (_GEN_192 & _T_1561) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ProbeAckData carries unmanaged address (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:217 assert (address_ok, \"'C' channel ProbeAckData carries unmanaged address\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_192 & _T_1561) begin
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
        if (_GEN_192 & _T_1564) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ProbeAckData carries invalid source ID (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:218 assert (source_ok, \"'C' channel ProbeAckData carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_192 & _T_1564) begin
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
        if (_GEN_192 & _T_1568) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ProbeAckData smaller than a beat (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:219 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'C' channel ProbeAckData smaller than a beat\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_192 & _T_1568) begin
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
        if (_GEN_192 & _T_1571) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ProbeAckData address not aligned to size (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:220 assert (is_aligned, \"'C' channel ProbeAckData address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_192 & _T_1571) begin
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
        if (_GEN_192 & _T_1575) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ProbeAckData carries invalid report param (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:221 assert (TLPermissions.isReport(bundle.param), \"'C' channel ProbeAckData carries invalid report param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_192 & _T_1575) begin
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
        if (_GEN_202 & _T_1612) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel carries Release type unsupported by manager (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:225 assert (edge.manager.supportsAcquireBSafe(edge.address(bundle), bundle.size), \"'C' channel carries Release type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_202 & _T_1612) begin
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
        if (_GEN_202 & _T_1686) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel carries Release from a client which does not support Probe (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:226 assert (edge.client.supportsProbe(edge.source(bundle), bundle.size), \"'C' channel carries Release from a client which does not support Probe\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_202 & _T_1686) begin
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
        if (_GEN_202 & _T_1564) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel Release carries invalid source ID (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:227 assert (source_ok, \"'C' channel Release carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_202 & _T_1564) begin
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
        if (_GEN_202 & _T_1568) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel Release smaller than a beat (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:228 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'C' channel Release smaller than a beat\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_202 & _T_1568) begin
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
        if (_GEN_202 & _T_1571) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel Release address not aligned to size (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:229 assert (is_aligned, \"'C' channel Release address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_202 & _T_1571) begin
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
        if (_GEN_202 & _T_1700) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel Release carries invalid shrink param (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:230 assert (TLPermissions.isShrink(bundle.param), \"'C' channel Release carries invalid shrink param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_202 & _T_1700) begin
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
        if (_GEN_202 & _T_1579) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel Release is corrupt (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:231 assert (!bundle.corrupt, \"'C' channel Release is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_202 & _T_1579) begin
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
        if (_GEN_216 & _T_1612) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel carries ReleaseData type unsupported by manager (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:235 assert (edge.manager.supportsAcquireBSafe(edge.address(bundle), bundle.size), \"'C' channel carries ReleaseData type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_216 & _T_1612) begin
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
        if (_GEN_216 & _T_1686) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel carries Release from a client which does not support Probe (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:236 assert (edge.client.supportsProbe(edge.source(bundle), bundle.size), \"'C' channel carries Release from a client which does not support Probe\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_216 & _T_1686) begin
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
        if (_GEN_216 & _T_1564) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ReleaseData carries invalid source ID (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:237 assert (source_ok, \"'C' channel ReleaseData carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_216 & _T_1564) begin
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
        if (_GEN_216 & _T_1568) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ReleaseData smaller than a beat (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:238 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'C' channel ReleaseData smaller than a beat\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_216 & _T_1568) begin
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
        if (_GEN_216 & _T_1571) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ReleaseData address not aligned to size (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:239 assert (is_aligned, \"'C' channel ReleaseData address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_216 & _T_1571) begin
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
        if (_GEN_216 & _T_1700) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ReleaseData carries invalid shrink param (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:240 assert (TLPermissions.isShrink(bundle.param), \"'C' channel ReleaseData carries invalid shrink param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_216 & _T_1700) begin
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
        if (_GEN_228 & _T_1561) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel AccessAck carries unmanaged address (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:244 assert (address_ok, \"'C' channel AccessAck carries unmanaged address\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_228 & _T_1561) begin
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
        if (_GEN_228 & _T_1564) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel AccessAck carries invalid source ID (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:245 assert (source_ok, \"'C' channel AccessAck carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_228 & _T_1564) begin
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
        if (_GEN_228 & _T_1571) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel AccessAck address not aligned to size (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:246 assert (is_aligned, \"'C' channel AccessAck address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_228 & _T_1571) begin
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
        if (_GEN_228 & _T_1821) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel AccessAck carries invalid param (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:247 assert (bundle.param === UInt(0), \"'C' channel AccessAck carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_228 & _T_1821) begin
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
        if (_GEN_228 & _T_1579) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel AccessAck is corrupt (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:248 assert (!bundle.corrupt, \"'C' channel AccessAck is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_228 & _T_1579) begin
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
        if (_GEN_238 & _T_1561) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel AccessAckData carries unmanaged address (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:252 assert (address_ok, \"'C' channel AccessAckData carries unmanaged address\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_238 & _T_1561) begin
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
        if (_GEN_238 & _T_1564) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel AccessAckData carries invalid source ID (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:253 assert (source_ok, \"'C' channel AccessAckData carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_238 & _T_1564) begin
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
        if (_GEN_238 & _T_1571) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel AccessAckData address not aligned to size (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:254 assert (is_aligned, \"'C' channel AccessAckData address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_238 & _T_1571) begin
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
        if (_GEN_238 & _T_1821) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel AccessAckData carries invalid param (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:255 assert (bundle.param === UInt(0), \"'C' channel AccessAckData carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_238 & _T_1821) begin
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
        if (_GEN_246 & _T_1561) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel HintAck carries unmanaged address (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:259 assert (address_ok, \"'C' channel HintAck carries unmanaged address\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_246 & _T_1561) begin
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
        if (_GEN_246 & _T_1564) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel HintAck carries invalid source ID (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:260 assert (source_ok, \"'C' channel HintAck carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_246 & _T_1564) begin
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
        if (_GEN_246 & _T_1571) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel HintAck address not aligned to size (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:261 assert (is_aligned, \"'C' channel HintAck address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_246 & _T_1571) begin
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
        if (_GEN_246 & _T_1821) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel HintAck carries invalid param (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:262 assert (bundle.param === UInt(0), \"'C' channel HintAck carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_246 & _T_1821) begin
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
        if (_GEN_246 & _T_1579) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel HintAck is corrupt (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:263 assert (!bundle.corrupt, \"'C' channel HintAck is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_246 & _T_1579) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'E' channels carries invalid sink ID (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:330 assert (sink_ok, \"'E' channels carries invalid sink ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (_T_1895 & _T_1899) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel opcode changed within multibeat operation (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:355 assert (a.bits.opcode === opcode, \"'A' channel opcode changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1895 & _T_1899) begin
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
        if (_T_1895 & _T_1903) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel param changed within multibeat operation (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:356 assert (a.bits.param  === param,  \"'A' channel param changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1895 & _T_1903) begin
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
        if (_T_1895 & _T_1907) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel size changed within multibeat operation (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:357 assert (a.bits.size   === size,   \"'A' channel size changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1895 & _T_1907) begin
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
        if (_T_1895 & _T_1911) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel source changed within multibeat operation (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:358 assert (a.bits.source === source, \"'A' channel source changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1895 & _T_1911) begin
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
        if (_T_1895 & _T_1915) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel address changed with multibeat operation (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:359 assert (a.bits.address=== address,\"'A' channel address changed with multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1895 & _T_1915) begin
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
        if (_T_1952 & _T_1956) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel opcode changed within multibeat operation (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:425 assert (d.bits.opcode === opcode, \"'D' channel opcode changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1952 & _T_1956) begin
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
        if (_T_1952 & _T_1960) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel param changed within multibeat operation (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:426 assert (d.bits.param  === param,  \"'D' channel param changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1952 & _T_1960) begin
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
        if (_T_1952 & _T_1964) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel size changed within multibeat operation (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:427 assert (d.bits.size   === size,   \"'D' channel size changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1952 & _T_1964) begin
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
        if (_T_1952 & _T_1968) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel source changed within multibeat operation (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:428 assert (d.bits.source === source, \"'D' channel source changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1952 & _T_1968) begin
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
        if (_T_1952 & _T_1972) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel sink changed with multibeat operation (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:429 assert (d.bits.sink   === sink,   \"'D' channel sink changed with multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1952 & _T_1972) begin
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
        if (_T_1952 & _T_1976) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel denied changed with multibeat operation (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:430 assert (d.bits.denied === denied, \"'D' channel denied changed with multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1952 & _T_1976) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel opcode changed within multibeat operation (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:378 assert (b.bits.opcode === opcode, \"'B' channel opcode changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (_T_2012 & _T_2020) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel param changed within multibeat operation (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:379 assert (b.bits.param  === param,  \"'B' channel param changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2012 & _T_2020) begin
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
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel size changed within multibeat operation (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:380 assert (b.bits.size   === size,   \"'B' channel size changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (1'h0) begin
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
        if (_T_2012 & _T_2028) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel source changed within multibeat operation (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:381 assert (b.bits.source === source, \"'B' channel source changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2012 & _T_2028) begin
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
        if (_T_2012 & _T_2032) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel addresss changed with multibeat operation (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:382 assert (b.bits.address=== address,\"'B' channel addresss changed with multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2012 & _T_2032) begin
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
        if (_T_2067 & _T_2071) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel opcode changed within multibeat operation (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:401 assert (c.bits.opcode === opcode, \"'C' channel opcode changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2067 & _T_2071) begin
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
        if (_T_2067 & _T_2075) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel param changed within multibeat operation (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:402 assert (c.bits.param  === param,  \"'C' channel param changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2067 & _T_2075) begin
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
        if (_T_2067 & _T_2079) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel size changed within multibeat operation (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:403 assert (c.bits.size   === size,   \"'C' channel size changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2067 & _T_2079) begin
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
        if (_T_2067 & _T_2083) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel source changed within multibeat operation (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:404 assert (c.bits.source === source, \"'C' channel source changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2067 & _T_2083) begin
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
        if (_T_2067 & _T_2087) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel address changed with multibeat operation (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:405 assert (c.bits.address=== address,\"'C' channel address changed with multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2067 & _T_2087) begin
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
        if (_T_2138 & _T_2146) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel re-used a source ID (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:460 assert(!inflight(bundle.a.bits.source), \"'A' channel re-used a source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2138 & _T_2146) begin
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
        if (_T_2154 & _T_2161) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel acknowledged for nothing inflight (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:467 assert((a_set | inflight)(bundle.d.bits.source), \"'D' channel acknowledged for nothing inflight\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2154 & _T_2161) begin
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
        if (_T_2168) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' and 'D' concurrent, despite minlatency 6 (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:471 assert(a_set =/= d_clr || !a_set.orR, s\"'A' and 'D' concurrent, despite minlatency ${edge.manager.minLatency}\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2168) begin
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
        if (_T_2182) begin
          $fwrite(32'h80000002,"Assertion failed: TileLink timeout expired (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:479 assert (!inflight.orR || limit === UInt(0) || watchdog < limit, \"TileLink timeout expired\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2182) begin
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
        if (_T_2219 & _T_2226) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel re-used a sink ID (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:494 assert(!inflight(bundle.d.bits.sink), \"'D' channel re-used a sink ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2219 & _T_2226) begin
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
        if (io_in_e_valid & _T_2238) begin
          $fwrite(32'h80000002,"Assertion failed: 'E' channel acknowledged for nothing inflight (connected at BaseSubsystem.scala:64:32)\n    at Monitor.scala:500 assert((d_set | inflight)(bundle.e.bits.sink), \"'E' channel acknowledged for nothing inflight\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_e_valid & _T_2238) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
