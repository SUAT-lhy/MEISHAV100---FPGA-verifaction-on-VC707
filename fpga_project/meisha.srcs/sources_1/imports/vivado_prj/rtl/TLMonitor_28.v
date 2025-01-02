module TLMonitor_28( 
  input         clock, 
  input         reset, 
  input         io_in_a_ready, 
  input         io_in_a_valid, 
  input  [2:0]  io_in_a_bits_opcode, 
  input  [2:0]  io_in_a_bits_param, 
  input  [2:0]  io_in_a_bits_size, 
  input  [4:0]  io_in_a_bits_source, 
  input  [13:0] io_in_a_bits_address, 
  input  [7:0]  io_in_a_bits_mask, 
  input         io_in_a_bits_corrupt, 
  input         io_in_b_ready, 
  input         io_in_b_valid, 
  input  [2:0]  io_in_b_bits_opcode, 
  input  [1:0]  io_in_b_bits_param, 
  input  [2:0]  io_in_b_bits_size, 
  input  [4:0]  io_in_b_bits_source, 
  input  [13:0] io_in_b_bits_address, 
  input  [7:0]  io_in_b_bits_mask, 
  input         io_in_b_bits_corrupt, 
  input         io_in_c_ready, 
  input         io_in_c_valid, 
  input  [2:0]  io_in_c_bits_opcode, 
  input  [2:0]  io_in_c_bits_param, 
  input  [2:0]  io_in_c_bits_size, 
  input  [4:0]  io_in_c_bits_source, 
  input  [13:0] io_in_c_bits_address, 
  input         io_in_c_bits_corrupt, 
  input         io_in_d_ready, 
  input         io_in_d_valid, 
  input  [2:0]  io_in_d_bits_opcode, 
  input  [1:0]  io_in_d_bits_param, 
  input  [2:0]  io_in_d_bits_size, 
  input  [4:0]  io_in_d_bits_source, 
  input         io_in_d_bits_sink, 
  input         io_in_d_bits_denied, 
  input         io_in_d_bits_corrupt, 
  input         io_in_e_ready, 
  input         io_in_e_valid 
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
  wire [13:0] _T_72; 
  wire [6:0] _T_73; 
  wire [6:0] _T_74; 
  wire [13:0] _GEN_33; 
  wire [13:0] _T_75; 
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
  wire [13:0] _T_272; 
  wire [14:0] _T_273; 
  wire [14:0] _T_274; 
  wire [14:0] _T_275; 
  wire  _T_276; 
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
  wire  _T_590; 
  wire  _T_598; 
  wire  _T_601; 
  wire  _T_602; 
  wire  _T_609; 
  wire  _T_611; 
  wire  _T_612; 
  wire  _T_617; 
  wire  _T_638; 
  wire  _T_640; 
  wire  _T_641; 
  wire  _T_646; 
  wire  _T_675; 
  wire  _T_677; 
  wire  _T_678; 
  wire  _T_679; 
  wire  _T_680; 
  wire  _T_681; 
  wire  _T_682; 
  wire  _T_683; 
  wire  _T_684; 
  wire  _T_685; 
  wire  _T_686; 
  wire  _T_687; 
  wire  _T_688; 
  wire  _T_689; 
  wire  _T_690; 
  wire  _T_693; 
  wire  _T_694; 
  wire  _T_718; 
  wire  _T_719; 
  wire  _T_720; 
  wire  _T_721; 
  wire  _T_722; 
  wire  _T_723; 
  wire  _T_724; 
  wire  _T_725; 
  wire  _T_726; 
  wire  _T_727; 
  wire  _T_728; 
  wire  _T_729; 
  wire  _T_730; 
  wire  _T_731; 
  wire  _T_733; 
  wire  _T_734; 
  wire  _T_735; 
  wire  _T_737; 
  wire  _T_738; 
  wire  _T_739; 
  wire  _T_741; 
  wire  _T_742; 
  wire  _T_743; 
  wire  _T_745; 
  wire  _T_746; 
  wire  _T_747; 
  wire  _T_749; 
  wire  _T_750; 
  wire  _T_751; 
  wire  _T_756; 
  wire  _T_757; 
  wire  _T_762; 
  wire  _T_764; 
  wire  _T_765; 
  wire  _T_766; 
  wire  _T_768; 
  wire  _T_769; 
  wire  _T_779; 
  wire  _T_799; 
  wire  _T_801; 
  wire  _T_802; 
  wire  _T_808; 
  wire  _T_825; 
  wire  _T_843; 
  wire  _T_860; 
  wire  _T_862; 
  wire  _T_863; 
  wire  _T_864; 
  wire  _T_872; 
  wire  _T_880; 
  wire  _T_888; 
  wire  _T_896; 
  wire  _T_904; 
  wire  _T_912; 
  wire  _T_920; 
  wire  _T_928; 
  wire  _T_936; 
  wire  _T_944; 
  wire  _T_952; 
  wire [13:0] _T_990; 
  wire [14:0] _T_991; 
  wire [14:0] _T_992; 
  wire [14:0] _T_993; 
  wire  _T_994; 
  wire [13:0] _T_1003; 
  wire [6:0] _T_1004; 
  wire [6:0] _T_1005; 
  wire [13:0] _GEN_34; 
  wire [13:0] _T_1006; 
  wire  _T_1007; 
  wire [1:0] _T_1009; 
  wire [3:0] _T_1010; 
  wire [2:0] _T_1011; 
  wire [2:0] _T_1012; 
  wire  _T_1013; 
  wire  _T_1014; 
  wire  _T_1015; 
  wire  _T_1016; 
  wire  _T_1018; 
  wire  _T_1019; 
  wire  _T_1021; 
  wire  _T_1022; 
  wire  _T_1023; 
  wire  _T_1024; 
  wire  _T_1025; 
  wire  _T_1026; 
  wire  _T_1027; 
  wire  _T_1028; 
  wire  _T_1029; 
  wire  _T_1030; 
  wire  _T_1031; 
  wire  _T_1032; 
  wire  _T_1033; 
  wire  _T_1034; 
  wire  _T_1035; 
  wire  _T_1036; 
  wire  _T_1037; 
  wire  _T_1038; 
  wire  _T_1039; 
  wire  _T_1040; 
  wire  _T_1041; 
  wire  _T_1042; 
  wire  _T_1043; 
  wire  _T_1044; 
  wire  _T_1045; 
  wire  _T_1046; 
  wire  _T_1047; 
  wire  _T_1048; 
  wire  _T_1049; 
  wire  _T_1050; 
  wire  _T_1051; 
  wire  _T_1052; 
  wire  _T_1053; 
  wire  _T_1054; 
  wire  _T_1055; 
  wire  _T_1056; 
  wire  _T_1057; 
  wire  _T_1058; 
  wire  _T_1059; 
  wire  _T_1060; 
  wire  _T_1061; 
  wire  _T_1062; 
  wire  _T_1063; 
  wire  _T_1064; 
  wire [1:0] _T_1065; 
  wire [1:0] _T_1066; 
  wire [3:0] _T_1067; 
  wire [1:0] _T_1068; 
  wire [1:0] _T_1069; 
  wire [3:0] _T_1070; 
  wire [7:0] _T_1071; 
  wire [4:0] _T_1112; 
  wire [4:0] _T_1113; 
  wire [4:0] _T_1114; 
  wire [4:0] _T_1115; 
  wire [4:0] _T_1116; 
  wire [4:0] _T_1117; 
  wire [4:0] _T_1118; 
  wire [4:0] _T_1119; 
  wire [4:0] _T_1120; 
  wire [4:0] _T_1121; 
  wire [4:0] _T_1122; 
  wire [4:0] _T_1123; 
  wire [4:0] _T_1125; 
  wire [4:0] _T_1126; 
  wire [4:0] _T_1127; 
  wire [4:0] _T_1128; 
  wire [4:0] _T_1129; 
  wire [4:0] _T_1130; 
  wire [4:0] _T_1131; 
  wire [4:0] _T_1132; 
  wire [4:0] _T_1133; 
  wire [4:0] _T_1134; 
  wire [4:0] _T_1135; 
  wire  _T_1139; 
  wire  _T_1140; 
  wire  _T_1180; 
  wire  _T_1185; 
  wire  _T_1188; 
  wire  _T_1191; 
  wire  _T_1194; 
  wire  _T_1200; 
  wire  _T_1203; 
  wire  _T_1206; 
  wire  _T_1213; 
  wire  _T_1214; 
  wire  _T_1216; 
  wire  _T_1217; 
  wire  _T_1219; 
  wire  _T_1220; 
  wire  _T_1222; 
  wire  _T_1223; 
  wire  _T_1224; 
  wire  _T_1226; 
  wire  _T_1227; 
  wire  _T_1228; 
  wire  _T_1230; 
  wire  _T_1231; 
  wire  _T_1232; 
  wire  _T_1234; 
  wire  _T_1235; 
  wire  _T_1236; 
  wire  _T_1239; 
  wire  _T_1249; 
  wire  _T_1251; 
  wire  _T_1252; 
  wire  _T_1261; 
  wire  _T_1282; 
  wire [7:0] _T_1299; 
  wire [7:0] _T_1300; 
  wire  _T_1301; 
  wire  _T_1303; 
  wire  _T_1304; 
  wire  _T_1305; 
  wire  _T_1326; 
  wire  _T_1347; 
  wire  _T_1372; 
  wire  _T_1373; 
  wire  _T_1374; 
  wire  _T_1375; 
  wire  _T_1376; 
  wire  _T_1377; 
  wire  _T_1378; 
  wire  _T_1379; 
  wire  _T_1380; 
  wire  _T_1381; 
  wire  _T_1382; 
  wire  _T_1383; 
  wire  _T_1386; 
  wire  _T_1387; 
  wire  _T_1411; 
  wire  _T_1412; 
  wire  _T_1413; 
  wire  _T_1414; 
  wire  _T_1415; 
  wire  _T_1416; 
  wire  _T_1417; 
  wire  _T_1418; 
  wire  _T_1419; 
  wire  _T_1420; 
  wire  _T_1421; 
  wire  _T_1422; 
  wire [13:0] _T_1424; 
  wire [6:0] _T_1425; 
  wire [6:0] _T_1426; 
  wire [13:0] _GEN_35; 
  wire [13:0] _T_1427; 
  wire  _T_1428; 
  wire [13:0] _T_1429; 
  wire [14:0] _T_1430; 
  wire [14:0] _T_1431; 
  wire [14:0] _T_1432; 
  wire  _T_1433; 
  wire  _T_1567; 
  wire  _T_1569; 
  wire  _T_1570; 
  wire  _T_1572; 
  wire  _T_1573; 
  wire  _T_1574; 
  wire  _T_1576; 
  wire  _T_1577; 
  wire  _T_1579; 
  wire  _T_1580; 
  wire  _T_1581; 
  wire  _T_1583; 
  wire  _T_1584; 
  wire  _T_1585; 
  wire  _T_1587; 
  wire  _T_1588; 
  wire  _T_1589; 
  wire  _T_1607; 
  wire  _T_1661; 
  wire  _T_1666; 
  wire  _T_1669; 
  wire  _T_1672; 
  wire  _T_1675; 
  wire  _T_1681; 
  wire  _T_1684; 
  wire  _T_1687; 
  wire  _T_1694; 
  wire  _T_1695; 
  wire  _T_1706; 
  wire  _T_1708; 
  wire  _T_1709; 
  wire  _T_1714; 
  wire  _T_1817; 
  wire  _T_1827; 
  wire  _T_1829; 
  wire  _T_1830; 
  wire  _T_1835; 
  wire  _T_1849; 
  wire  _T_1871; 
  wire [3:0] _T_1876; 
  wire  _T_1877; 
  wire  _T_1878; 
  reg [3:0] _T_1881; 
  reg [31:0] _RAND_0;
  wire [4:0] _T_1882; 
  wire [4:0] _T_1883; 
  wire [3:0] _T_1884; 
  wire  _T_1885; 
  reg [2:0] _T_1894; 
  reg [31:0] _RAND_1;
  reg [2:0] _T_1896; 
  reg [31:0] _RAND_2;
  reg [2:0] _T_1898; 
  reg [31:0] _RAND_3;
  reg [4:0] _T_1900; 
  reg [31:0] _RAND_4;
  reg [13:0] _T_1902; 
  reg [31:0] _RAND_5;
  wire  _T_1903; 
  wire  _T_1904; 
  wire  _T_1905; 
  wire  _T_1907; 
  wire  _T_1908; 
  wire  _T_1909; 
  wire  _T_1911; 
  wire  _T_1912; 
  wire  _T_1913; 
  wire  _T_1915; 
  wire  _T_1916; 
  wire  _T_1917; 
  wire  _T_1919; 
  wire  _T_1920; 
  wire  _T_1921; 
  wire  _T_1923; 
  wire  _T_1924; 
  wire  _T_1926; 
  wire  _T_1927; 
  wire [13:0] _T_1929; 
  wire [6:0] _T_1930; 
  wire [6:0] _T_1931; 
  wire [3:0] _T_1932; 
  wire  _T_1933; 
  reg [3:0] _T_1936; 
  reg [31:0] _RAND_6;
  wire [4:0] _T_1937; 
  wire [4:0] _T_1938; 
  wire [3:0] _T_1939; 
  wire  _T_1940; 
  reg [2:0] _T_1949; 
  reg [31:0] _RAND_7;
  reg [1:0] _T_1951; 
  reg [31:0] _RAND_8;
  reg [2:0] _T_1953; 
  reg [31:0] _RAND_9;
  reg [4:0] _T_1955; 
  reg [31:0] _RAND_10;
  reg  _T_1957; 
  reg [31:0] _RAND_11;
  reg  _T_1959; 
  reg [31:0] _RAND_12;
  wire  _T_1960; 
  wire  _T_1961; 
  wire  _T_1962; 
  wire  _T_1964; 
  wire  _T_1965; 
  wire  _T_1966; 
  wire  _T_1968; 
  wire  _T_1969; 
  wire  _T_1970; 
  wire  _T_1972; 
  wire  _T_1973; 
  wire  _T_1974; 
  wire  _T_1976; 
  wire  _T_1977; 
  wire  _T_1978; 
  wire  _T_1980; 
  wire  _T_1981; 
  wire  _T_1982; 
  wire  _T_1984; 
  wire  _T_1985; 
  wire  _T_1987; 
  wire  _T_1988; 
  reg [3:0] _T_1998; 
  reg [31:0] _RAND_13;
  wire [4:0] _T_1999; 
  wire [4:0] _T_2000; 
  wire [3:0] _T_2001; 
  wire  _T_2002; 
  reg [2:0] _T_2011; 
  reg [31:0] _RAND_14;
  reg [1:0] _T_2013; 
  reg [31:0] _RAND_15;
  reg [2:0] _T_2015; 
  reg [31:0] _RAND_16;
  reg [4:0] _T_2017; 
  reg [31:0] _RAND_17;
  reg [13:0] _T_2019; 
  reg [31:0] _RAND_18;
  wire  _T_2020; 
  wire  _T_2021; 
  wire  _T_2022; 
  wire  _T_2024; 
  wire  _T_2025; 
  wire  _T_2026; 
  wire  _T_2028; 
  wire  _T_2029; 
  wire  _T_2030; 
  wire  _T_2032; 
  wire  _T_2033; 
  wire  _T_2034; 
  wire  _T_2036; 
  wire  _T_2037; 
  wire  _T_2038; 
  wire  _T_2040; 
  wire  _T_2041; 
  wire  _T_2043; 
  wire  _T_2044; 
  wire [3:0] _T_2049; 
  wire  _T_2050; 
  reg [3:0] _T_2053; 
  reg [31:0] _RAND_19;
  wire [4:0] _T_2054; 
  wire [4:0] _T_2055; 
  wire [3:0] _T_2056; 
  wire  _T_2057; 
  reg [2:0] _T_2066; 
  reg [31:0] _RAND_20;
  reg [2:0] _T_2068; 
  reg [31:0] _RAND_21;
  reg [2:0] _T_2070; 
  reg [31:0] _RAND_22;
  reg [4:0] _T_2072; 
  reg [31:0] _RAND_23;
  reg [13:0] _T_2074; 
  reg [31:0] _RAND_24;
  wire  _T_2075; 
  wire  _T_2076; 
  wire  _T_2077; 
  wire  _T_2079; 
  wire  _T_2080; 
  wire  _T_2081; 
  wire  _T_2083; 
  wire  _T_2084; 
  wire  _T_2085; 
  wire  _T_2087; 
  wire  _T_2088; 
  wire  _T_2089; 
  wire  _T_2091; 
  wire  _T_2092; 
  wire  _T_2093; 
  wire  _T_2095; 
  wire  _T_2096; 
  wire  _T_2098; 
  reg [30:0] _T_2100; 
  reg [31:0] _RAND_25;
  reg [3:0] _T_2111; 
  reg [31:0] _RAND_26;
  wire [4:0] _T_2112; 
  wire [4:0] _T_2113; 
  wire [3:0] _T_2114; 
  wire  _T_2115; 
  reg [3:0] _T_2132; 
  reg [31:0] _RAND_27;
  wire [4:0] _T_2133; 
  wire [4:0] _T_2134; 
  wire [3:0] _T_2135; 
  wire  _T_2136; 
  wire  _T_2147; 
  wire [31:0] _T_2149; 
  wire [30:0] _T_2150; 
  wire  _T_2151; 
  wire  _T_2152; 
  wire  _T_2154; 
  wire  _T_2155; 
  wire [31:0] _GEN_27; 
  wire  _T_2160; 
  wire  _T_2162; 
  wire  _T_2163; 
  wire [31:0] _T_2164; 
  wire [30:0] _T_2145; 
  wire [30:0] _T_2165; 
  wire [30:0] _T_2166; 
  wire  _T_2167; 
  wire  _T_2169; 
  wire  _T_2170; 
  wire [31:0] _GEN_28; 
  wire [30:0] _T_2157; 
  wire  _T_2171; 
  wire  _T_2172; 
  wire  _T_2173; 
  wire  _T_2174; 
  wire  _T_2176; 
  wire  _T_2177; 
  wire [30:0] _T_2178; 
  wire [30:0] _T_2179; 
  wire [30:0] _T_2180; 
  reg [31:0] _T_2182; 
  reg [31:0] _RAND_28;
  wire  _T_2183; 
  wire  _T_2184; 
  wire  _T_2185; 
  wire  _T_2186; 
  wire  _T_2187; 
  wire  _T_2188; 
  wire  _T_2190; 
  wire  _T_2191; 
  wire [31:0] _T_2193; 
  wire  _T_2196; 
  reg  _T_2198; 
  reg [31:0] _RAND_29;
  reg [3:0] _T_2208; 
  reg [31:0] _RAND_30;
  wire [4:0] _T_2209; 
  wire [4:0] _T_2210; 
  wire [3:0] _T_2211; 
  wire  _T_2212; 
  wire  _T_2223; 
  wire  _T_2224; 
  wire  _T_2225; 
  wire  _T_2226; 
  wire  _T_2227; 
  wire  _T_2228; 
  wire [1:0] _T_2229; 
  wire  _T_2230; 
  wire  _T_2232; 
  wire  _T_2234; 
  wire  _T_2235; 
  wire [1:0] _GEN_31; 
  wire  _T_2238; 
  wire [1:0] _T_2241; 
  wire  _T_2221; 
  wire  _T_2242; 
  wire  _T_2243; 
  wire  _T_2246; 
  wire  _T_2247; 
  wire [1:0] _GEN_32; 
  wire  _T_2248; 
  wire  _T_2237; 
  wire  _T_2249; 
  wire  _T_2250; 
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
  wire  _GEN_154; 
  wire  _GEN_166; 
  wire  _GEN_172; 
  wire  _GEN_178; 
  wire  _GEN_184; 
  wire  _GEN_198; 
  wire  _GEN_212; 
  wire  _GEN_224; 
  wire  _GEN_236; 
  wire  _GEN_246; 
  wire  _GEN_256; 
  wire  _GEN_268; 
  wire  _GEN_280; 
  wire  _GEN_290; 
  wire  _GEN_304; 
  wire  _GEN_316; 
  wire  _GEN_326; 
  wire  _GEN_334; 
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
  assign _T_72 = 14'h7f << io_in_a_bits_size; 
  assign _T_73 = _T_72[6:0]; 
  assign _T_74 = ~ _T_73; 
  assign _GEN_33 = {{7'd0}, _T_74}; 
  assign _T_75 = io_in_a_bits_address & _GEN_33; 
  assign _T_76 = _T_75 == 14'h0; 
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
  assign _T_272 = io_in_a_bits_address ^ 14'h3000; 
  assign _T_273 = {1'b0,$signed(_T_272)}; 
  assign _T_274 = $signed(_T_273) & $signed(-15'sh1000); 
  assign _T_275 = $signed(_T_274); 
  assign _T_276 = $signed(_T_275) == $signed(15'sh0); 
  assign _T_280 = _T_276 | reset; 
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
  assign _T_590 = io_in_a_bits_size <= 3'h3; 
  assign _T_598 = _T_590 & _T_276; 
  assign _T_601 = _T_598 | reset; 
  assign _T_602 = _T_601 == 1'h0; 
  assign _T_609 = io_in_a_bits_param <= 3'h4; 
  assign _T_611 = _T_609 | reset; 
  assign _T_612 = _T_611 == 1'h0; 
  assign _T_617 = io_in_a_bits_opcode == 3'h3; 
  assign _T_638 = io_in_a_bits_param <= 3'h3; 
  assign _T_640 = _T_638 | reset; 
  assign _T_641 = _T_640 == 1'h0; 
  assign _T_646 = io_in_a_bits_opcode == 3'h5; 
  assign _T_675 = io_in_d_bits_opcode <= 3'h6; 
  assign _T_677 = _T_675 | reset; 
  assign _T_678 = _T_677 == 1'h0; 
  assign _T_679 = io_in_d_bits_source == 5'h1c; 
  assign _T_680 = io_in_d_bits_source == 5'h1d; 
  assign _T_681 = io_in_d_bits_source == 5'h1e; 
  assign _T_682 = io_in_d_bits_source == 5'h18; 
  assign _T_683 = io_in_d_bits_source == 5'h19; 
  assign _T_684 = io_in_d_bits_source == 5'h1a; 
  assign _T_685 = io_in_d_bits_source == 5'h14; 
  assign _T_686 = io_in_d_bits_source == 5'h15; 
  assign _T_687 = io_in_d_bits_source == 5'h16; 
  assign _T_688 = io_in_d_bits_source == 5'h10; 
  assign _T_689 = io_in_d_bits_source == 5'h11; 
  assign _T_690 = io_in_d_bits_source == 5'h12; 
  assign _T_693 = io_in_d_bits_source[4:4]; 
  assign _T_694 = _T_693 == 1'h0; 
  assign _T_718 = _T_679 | _T_680; 
  assign _T_719 = _T_718 | _T_681; 
  assign _T_720 = _T_719 | _T_682; 
  assign _T_721 = _T_720 | _T_683; 
  assign _T_722 = _T_721 | _T_684; 
  assign _T_723 = _T_722 | _T_685; 
  assign _T_724 = _T_723 | _T_686; 
  assign _T_725 = _T_724 | _T_687; 
  assign _T_726 = _T_725 | _T_688; 
  assign _T_727 = _T_726 | _T_689; 
  assign _T_728 = _T_727 | _T_690; 
  assign _T_729 = _T_728 | _T_694; 
  assign _T_730 = io_in_d_bits_sink < 1'h1; 
  assign _T_731 = io_in_d_bits_opcode == 3'h6; 
  assign _T_733 = _T_729 | reset; 
  assign _T_734 = _T_733 == 1'h0; 
  assign _T_735 = io_in_d_bits_size >= 3'h3; 
  assign _T_737 = _T_735 | reset; 
  assign _T_738 = _T_737 == 1'h0; 
  assign _T_739 = io_in_d_bits_param == 2'h0; 
  assign _T_741 = _T_739 | reset; 
  assign _T_742 = _T_741 == 1'h0; 
  assign _T_743 = io_in_d_bits_corrupt == 1'h0; 
  assign _T_745 = _T_743 | reset; 
  assign _T_746 = _T_745 == 1'h0; 
  assign _T_747 = io_in_d_bits_denied == 1'h0; 
  assign _T_749 = _T_747 | reset; 
  assign _T_750 = _T_749 == 1'h0; 
  assign _T_751 = io_in_d_bits_opcode == 3'h4; 
  assign _T_756 = _T_730 | reset; 
  assign _T_757 = _T_756 == 1'h0; 
  assign _T_762 = io_in_d_bits_param <= 2'h2; 
  assign _T_764 = _T_762 | reset; 
  assign _T_765 = _T_764 == 1'h0; 
  assign _T_766 = io_in_d_bits_param != 2'h2; 
  assign _T_768 = _T_766 | reset; 
  assign _T_769 = _T_768 == 1'h0; 
  assign _T_779 = io_in_d_bits_opcode == 3'h5; 
  assign _T_799 = _T_747 | io_in_d_bits_corrupt; 
  assign _T_801 = _T_799 | reset; 
  assign _T_802 = _T_801 == 1'h0; 
  assign _T_808 = io_in_d_bits_opcode == 3'h0; 
  assign _T_825 = io_in_d_bits_opcode == 3'h1; 
  assign _T_843 = io_in_d_bits_opcode == 3'h2; 
  assign _T_860 = io_in_b_bits_opcode <= 3'h6; 
  assign _T_862 = _T_860 | reset; 
  assign _T_863 = _T_862 == 1'h0; 
  assign _T_864 = io_in_b_bits_source == 5'h1c; 
  assign _T_872 = io_in_b_bits_source == 5'h1d; 
  assign _T_880 = io_in_b_bits_source == 5'h1e; 
  assign _T_888 = io_in_b_bits_source == 5'h18; 
  assign _T_896 = io_in_b_bits_source == 5'h19; 
  assign _T_904 = io_in_b_bits_source == 5'h1a; 
  assign _T_912 = io_in_b_bits_source == 5'h14; 
  assign _T_920 = io_in_b_bits_source == 5'h15; 
  assign _T_928 = io_in_b_bits_source == 5'h16; 
  assign _T_936 = io_in_b_bits_source == 5'h10; 
  assign _T_944 = io_in_b_bits_source == 5'h11; 
  assign _T_952 = io_in_b_bits_source == 5'h12; 
  assign _T_990 = io_in_b_bits_address ^ 14'h3000; 
  assign _T_991 = {1'b0,$signed(_T_990)}; 
  assign _T_992 = $signed(_T_991) & $signed(-15'sh1000); 
  assign _T_993 = $signed(_T_992); 
  assign _T_994 = $signed(_T_993) == $signed(15'sh0); 
  assign _T_1003 = 14'h7f << io_in_b_bits_size; 
  assign _T_1004 = _T_1003[6:0]; 
  assign _T_1005 = ~ _T_1004; 
  assign _GEN_34 = {{7'd0}, _T_1005}; 
  assign _T_1006 = io_in_b_bits_address & _GEN_34; 
  assign _T_1007 = _T_1006 == 14'h0; 
  assign _T_1009 = io_in_b_bits_size[1:0]; 
  assign _T_1010 = 4'h1 << _T_1009; 
  assign _T_1011 = _T_1010[2:0]; 
  assign _T_1012 = _T_1011 | 3'h1; 
  assign _T_1013 = io_in_b_bits_size >= 3'h3; 
  assign _T_1014 = _T_1012[2]; 
  assign _T_1015 = io_in_b_bits_address[2]; 
  assign _T_1016 = _T_1015 == 1'h0; 
  assign _T_1018 = _T_1014 & _T_1016; 
  assign _T_1019 = _T_1013 | _T_1018; 
  assign _T_1021 = _T_1014 & _T_1015; 
  assign _T_1022 = _T_1013 | _T_1021; 
  assign _T_1023 = _T_1012[1]; 
  assign _T_1024 = io_in_b_bits_address[1]; 
  assign _T_1025 = _T_1024 == 1'h0; 
  assign _T_1026 = _T_1016 & _T_1025; 
  assign _T_1027 = _T_1023 & _T_1026; 
  assign _T_1028 = _T_1019 | _T_1027; 
  assign _T_1029 = _T_1016 & _T_1024; 
  assign _T_1030 = _T_1023 & _T_1029; 
  assign _T_1031 = _T_1019 | _T_1030; 
  assign _T_1032 = _T_1015 & _T_1025; 
  assign _T_1033 = _T_1023 & _T_1032; 
  assign _T_1034 = _T_1022 | _T_1033; 
  assign _T_1035 = _T_1015 & _T_1024; 
  assign _T_1036 = _T_1023 & _T_1035; 
  assign _T_1037 = _T_1022 | _T_1036; 
  assign _T_1038 = _T_1012[0]; 
  assign _T_1039 = io_in_b_bits_address[0]; 
  assign _T_1040 = _T_1039 == 1'h0; 
  assign _T_1041 = _T_1026 & _T_1040; 
  assign _T_1042 = _T_1038 & _T_1041; 
  assign _T_1043 = _T_1028 | _T_1042; 
  assign _T_1044 = _T_1026 & _T_1039; 
  assign _T_1045 = _T_1038 & _T_1044; 
  assign _T_1046 = _T_1028 | _T_1045; 
  assign _T_1047 = _T_1029 & _T_1040; 
  assign _T_1048 = _T_1038 & _T_1047; 
  assign _T_1049 = _T_1031 | _T_1048; 
  assign _T_1050 = _T_1029 & _T_1039; 
  assign _T_1051 = _T_1038 & _T_1050; 
  assign _T_1052 = _T_1031 | _T_1051; 
  assign _T_1053 = _T_1032 & _T_1040; 
  assign _T_1054 = _T_1038 & _T_1053; 
  assign _T_1055 = _T_1034 | _T_1054; 
  assign _T_1056 = _T_1032 & _T_1039; 
  assign _T_1057 = _T_1038 & _T_1056; 
  assign _T_1058 = _T_1034 | _T_1057; 
  assign _T_1059 = _T_1035 & _T_1040; 
  assign _T_1060 = _T_1038 & _T_1059; 
  assign _T_1061 = _T_1037 | _T_1060; 
  assign _T_1062 = _T_1035 & _T_1039; 
  assign _T_1063 = _T_1038 & _T_1062; 
  assign _T_1064 = _T_1037 | _T_1063; 
  assign _T_1065 = {_T_1046,_T_1043}; 
  assign _T_1066 = {_T_1052,_T_1049}; 
  assign _T_1067 = {_T_1066,_T_1065}; 
  assign _T_1068 = {_T_1058,_T_1055}; 
  assign _T_1069 = {_T_1064,_T_1061}; 
  assign _T_1070 = {_T_1069,_T_1068}; 
  assign _T_1071 = {_T_1070,_T_1067}; 
  assign _T_1112 = _T_864 ? 5'h1c : 5'h0; 
  assign _T_1113 = _T_872 ? 5'h1d : 5'h0; 
  assign _T_1114 = _T_880 ? 5'h1e : 5'h0; 
  assign _T_1115 = _T_888 ? 5'h18 : 5'h0; 
  assign _T_1116 = _T_896 ? 5'h19 : 5'h0; 
  assign _T_1117 = _T_904 ? 5'h1a : 5'h0; 
  assign _T_1118 = _T_912 ? 5'h14 : 5'h0; 
  assign _T_1119 = _T_920 ? 5'h15 : 5'h0; 
  assign _T_1120 = _T_928 ? 5'h16 : 5'h0; 
  assign _T_1121 = _T_936 ? 5'h10 : 5'h0; 
  assign _T_1122 = _T_944 ? 5'h11 : 5'h0; 
  assign _T_1123 = _T_952 ? 5'h12 : 5'h0; 
  assign _T_1125 = _T_1112 | _T_1113; 
  assign _T_1126 = _T_1125 | _T_1114; 
  assign _T_1127 = _T_1126 | _T_1115; 
  assign _T_1128 = _T_1127 | _T_1116; 
  assign _T_1129 = _T_1128 | _T_1117; 
  assign _T_1130 = _T_1129 | _T_1118; 
  assign _T_1131 = _T_1130 | _T_1119; 
  assign _T_1132 = _T_1131 | _T_1120; 
  assign _T_1133 = _T_1132 | _T_1121; 
  assign _T_1134 = _T_1133 | _T_1122; 
  assign _T_1135 = _T_1134 | _T_1123; 
  assign _T_1139 = _T_1135 == io_in_b_bits_source; 
  assign _T_1140 = io_in_b_bits_opcode == 3'h6; 
  assign _T_1180 = 3'h6 == io_in_b_bits_size; 
  assign _T_1185 = _T_864 ? _T_1180 : 1'h0; 
  assign _T_1188 = _T_888 ? _T_1180 : 1'h0; 
  assign _T_1191 = _T_912 ? _T_1180 : 1'h0; 
  assign _T_1194 = _T_936 ? _T_1180 : 1'h0; 
  assign _T_1200 = _T_1185 | _T_1188; 
  assign _T_1203 = _T_1200 | _T_1191; 
  assign _T_1206 = _T_1203 | _T_1194; 
  assign _T_1213 = _T_1206 | reset; 
  assign _T_1214 = _T_1213 == 1'h0; 
  assign _T_1216 = _T_994 | reset; 
  assign _T_1217 = _T_1216 == 1'h0; 
  assign _T_1219 = _T_1139 | reset; 
  assign _T_1220 = _T_1219 == 1'h0; 
  assign _T_1222 = _T_1007 | reset; 
  assign _T_1223 = _T_1222 == 1'h0; 
  assign _T_1224 = io_in_b_bits_param <= 2'h2; 
  assign _T_1226 = _T_1224 | reset; 
  assign _T_1227 = _T_1226 == 1'h0; 
  assign _T_1228 = io_in_b_bits_mask == _T_1071; 
  assign _T_1230 = _T_1228 | reset; 
  assign _T_1231 = _T_1230 == 1'h0; 
  assign _T_1232 = io_in_b_bits_corrupt == 1'h0; 
  assign _T_1234 = _T_1232 | reset; 
  assign _T_1235 = _T_1234 == 1'h0; 
  assign _T_1236 = io_in_b_bits_opcode == 3'h4; 
  assign _T_1239 = reset == 1'h0; 
  assign _T_1249 = io_in_b_bits_param == 2'h0; 
  assign _T_1251 = _T_1249 | reset; 
  assign _T_1252 = _T_1251 == 1'h0; 
  assign _T_1261 = io_in_b_bits_opcode == 3'h0; 
  assign _T_1282 = io_in_b_bits_opcode == 3'h1; 
  assign _T_1299 = ~ _T_1071; 
  assign _T_1300 = io_in_b_bits_mask & _T_1299; 
  assign _T_1301 = _T_1300 == 8'h0; 
  assign _T_1303 = _T_1301 | reset; 
  assign _T_1304 = _T_1303 == 1'h0; 
  assign _T_1305 = io_in_b_bits_opcode == 3'h2; 
  assign _T_1326 = io_in_b_bits_opcode == 3'h3; 
  assign _T_1347 = io_in_b_bits_opcode == 3'h5; 
  assign _T_1372 = io_in_c_bits_source == 5'h1c; 
  assign _T_1373 = io_in_c_bits_source == 5'h1d; 
  assign _T_1374 = io_in_c_bits_source == 5'h1e; 
  assign _T_1375 = io_in_c_bits_source == 5'h18; 
  assign _T_1376 = io_in_c_bits_source == 5'h19; 
  assign _T_1377 = io_in_c_bits_source == 5'h1a; 
  assign _T_1378 = io_in_c_bits_source == 5'h14; 
  assign _T_1379 = io_in_c_bits_source == 5'h15; 
  assign _T_1380 = io_in_c_bits_source == 5'h16; 
  assign _T_1381 = io_in_c_bits_source == 5'h10; 
  assign _T_1382 = io_in_c_bits_source == 5'h11; 
  assign _T_1383 = io_in_c_bits_source == 5'h12; 
  assign _T_1386 = io_in_c_bits_source[4:4]; 
  assign _T_1387 = _T_1386 == 1'h0; 
  assign _T_1411 = _T_1372 | _T_1373; 
  assign _T_1412 = _T_1411 | _T_1374; 
  assign _T_1413 = _T_1412 | _T_1375; 
  assign _T_1414 = _T_1413 | _T_1376; 
  assign _T_1415 = _T_1414 | _T_1377; 
  assign _T_1416 = _T_1415 | _T_1378; 
  assign _T_1417 = _T_1416 | _T_1379; 
  assign _T_1418 = _T_1417 | _T_1380; 
  assign _T_1419 = _T_1418 | _T_1381; 
  assign _T_1420 = _T_1419 | _T_1382; 
  assign _T_1421 = _T_1420 | _T_1383; 
  assign _T_1422 = _T_1421 | _T_1387; 
  assign _T_1424 = 14'h7f << io_in_c_bits_size; 
  assign _T_1425 = _T_1424[6:0]; 
  assign _T_1426 = ~ _T_1425; 
  assign _GEN_35 = {{7'd0}, _T_1426}; 
  assign _T_1427 = io_in_c_bits_address & _GEN_35; 
  assign _T_1428 = _T_1427 == 14'h0; 
  assign _T_1429 = io_in_c_bits_address ^ 14'h3000; 
  assign _T_1430 = {1'b0,$signed(_T_1429)}; 
  assign _T_1431 = $signed(_T_1430) & $signed(-15'sh1000); 
  assign _T_1432 = $signed(_T_1431); 
  assign _T_1433 = $signed(_T_1432) == $signed(15'sh0); 
  assign _T_1567 = io_in_c_bits_opcode == 3'h4; 
  assign _T_1569 = _T_1433 | reset; 
  assign _T_1570 = _T_1569 == 1'h0; 
  assign _T_1572 = _T_1422 | reset; 
  assign _T_1573 = _T_1572 == 1'h0; 
  assign _T_1574 = io_in_c_bits_size >= 3'h3; 
  assign _T_1576 = _T_1574 | reset; 
  assign _T_1577 = _T_1576 == 1'h0; 
  assign _T_1579 = _T_1428 | reset; 
  assign _T_1580 = _T_1579 == 1'h0; 
  assign _T_1581 = io_in_c_bits_param <= 3'h5; 
  assign _T_1583 = _T_1581 | reset; 
  assign _T_1584 = _T_1583 == 1'h0; 
  assign _T_1585 = io_in_c_bits_corrupt == 1'h0; 
  assign _T_1587 = _T_1585 | reset; 
  assign _T_1588 = _T_1587 == 1'h0; 
  assign _T_1589 = io_in_c_bits_opcode == 3'h5; 
  assign _T_1607 = io_in_c_bits_opcode == 3'h6; 
  assign _T_1661 = 3'h6 == io_in_c_bits_size; 
  assign _T_1666 = _T_1372 ? _T_1661 : 1'h0; 
  assign _T_1669 = _T_1375 ? _T_1661 : 1'h0; 
  assign _T_1672 = _T_1378 ? _T_1661 : 1'h0; 
  assign _T_1675 = _T_1381 ? _T_1661 : 1'h0; 
  assign _T_1681 = _T_1666 | _T_1669; 
  assign _T_1684 = _T_1681 | _T_1672; 
  assign _T_1687 = _T_1684 | _T_1675; 
  assign _T_1694 = _T_1687 | reset; 
  assign _T_1695 = _T_1694 == 1'h0; 
  assign _T_1706 = io_in_c_bits_param <= 3'h2; 
  assign _T_1708 = _T_1706 | reset; 
  assign _T_1709 = _T_1708 == 1'h0; 
  assign _T_1714 = io_in_c_bits_opcode == 3'h7; 
  assign _T_1817 = io_in_c_bits_opcode == 3'h0; 
  assign _T_1827 = io_in_c_bits_param == 3'h0; 
  assign _T_1829 = _T_1827 | reset; 
  assign _T_1830 = _T_1829 == 1'h0; 
  assign _T_1835 = io_in_c_bits_opcode == 3'h1; 
  assign _T_1849 = io_in_c_bits_opcode == 3'h2; 
  assign _T_1871 = io_in_a_ready & io_in_a_valid; 
  assign _T_1876 = _T_74[6:3]; 
  assign _T_1877 = io_in_a_bits_opcode[2]; 
  assign _T_1878 = _T_1877 == 1'h0; 
  assign _T_1882 = _T_1881 - 4'h1; 
  assign _T_1883 = $unsigned(_T_1882); 
  assign _T_1884 = _T_1883[3:0]; 
  assign _T_1885 = _T_1881 == 4'h0; 
  assign _T_1903 = _T_1885 == 1'h0; 
  assign _T_1904 = io_in_a_valid & _T_1903; 
  assign _T_1905 = io_in_a_bits_opcode == _T_1894; 
  assign _T_1907 = _T_1905 | reset; 
  assign _T_1908 = _T_1907 == 1'h0; 
  assign _T_1909 = io_in_a_bits_param == _T_1896; 
  assign _T_1911 = _T_1909 | reset; 
  assign _T_1912 = _T_1911 == 1'h0; 
  assign _T_1913 = io_in_a_bits_size == _T_1898; 
  assign _T_1915 = _T_1913 | reset; 
  assign _T_1916 = _T_1915 == 1'h0; 
  assign _T_1917 = io_in_a_bits_source == _T_1900; 
  assign _T_1919 = _T_1917 | reset; 
  assign _T_1920 = _T_1919 == 1'h0; 
  assign _T_1921 = io_in_a_bits_address == _T_1902; 
  assign _T_1923 = _T_1921 | reset; 
  assign _T_1924 = _T_1923 == 1'h0; 
  assign _T_1926 = _T_1871 & _T_1885; 
  assign _T_1927 = io_in_d_ready & io_in_d_valid; 
  assign _T_1929 = 14'h7f << io_in_d_bits_size; 
  assign _T_1930 = _T_1929[6:0]; 
  assign _T_1931 = ~ _T_1930; 
  assign _T_1932 = _T_1931[6:3]; 
  assign _T_1933 = io_in_d_bits_opcode[0]; 
  assign _T_1937 = _T_1936 - 4'h1; 
  assign _T_1938 = $unsigned(_T_1937); 
  assign _T_1939 = _T_1938[3:0]; 
  assign _T_1940 = _T_1936 == 4'h0; 
  assign _T_1960 = _T_1940 == 1'h0; 
  assign _T_1961 = io_in_d_valid & _T_1960; 
  assign _T_1962 = io_in_d_bits_opcode == _T_1949; 
  assign _T_1964 = _T_1962 | reset; 
  assign _T_1965 = _T_1964 == 1'h0; 
  assign _T_1966 = io_in_d_bits_param == _T_1951; 
  assign _T_1968 = _T_1966 | reset; 
  assign _T_1969 = _T_1968 == 1'h0; 
  assign _T_1970 = io_in_d_bits_size == _T_1953; 
  assign _T_1972 = _T_1970 | reset; 
  assign _T_1973 = _T_1972 == 1'h0; 
  assign _T_1974 = io_in_d_bits_source == _T_1955; 
  assign _T_1976 = _T_1974 | reset; 
  assign _T_1977 = _T_1976 == 1'h0; 
  assign _T_1978 = io_in_d_bits_sink == _T_1957; 
  assign _T_1980 = _T_1978 | reset; 
  assign _T_1981 = _T_1980 == 1'h0; 
  assign _T_1982 = io_in_d_bits_denied == _T_1959; 
  assign _T_1984 = _T_1982 | reset; 
  assign _T_1985 = _T_1984 == 1'h0; 
  assign _T_1987 = _T_1927 & _T_1940; 
  assign _T_1988 = io_in_b_ready & io_in_b_valid; 
  assign _T_1999 = _T_1998 - 4'h1; 
  assign _T_2000 = $unsigned(_T_1999); 
  assign _T_2001 = _T_2000[3:0]; 
  assign _T_2002 = _T_1998 == 4'h0; 
  assign _T_2020 = _T_2002 == 1'h0; 
  assign _T_2021 = io_in_b_valid & _T_2020; 
  assign _T_2022 = io_in_b_bits_opcode == _T_2011; 
  assign _T_2024 = _T_2022 | reset; 
  assign _T_2025 = _T_2024 == 1'h0; 
  assign _T_2026 = io_in_b_bits_param == _T_2013; 
  assign _T_2028 = _T_2026 | reset; 
  assign _T_2029 = _T_2028 == 1'h0; 
  assign _T_2030 = io_in_b_bits_size == _T_2015; 
  assign _T_2032 = _T_2030 | reset; 
  assign _T_2033 = _T_2032 == 1'h0; 
  assign _T_2034 = io_in_b_bits_source == _T_2017; 
  assign _T_2036 = _T_2034 | reset; 
  assign _T_2037 = _T_2036 == 1'h0; 
  assign _T_2038 = io_in_b_bits_address == _T_2019; 
  assign _T_2040 = _T_2038 | reset; 
  assign _T_2041 = _T_2040 == 1'h0; 
  assign _T_2043 = _T_1988 & _T_2002; 
  assign _T_2044 = io_in_c_ready & io_in_c_valid; 
  assign _T_2049 = _T_1426[6:3]; 
  assign _T_2050 = io_in_c_bits_opcode[0]; 
  assign _T_2054 = _T_2053 - 4'h1; 
  assign _T_2055 = $unsigned(_T_2054); 
  assign _T_2056 = _T_2055[3:0]; 
  assign _T_2057 = _T_2053 == 4'h0; 
  assign _T_2075 = _T_2057 == 1'h0; 
  assign _T_2076 = io_in_c_valid & _T_2075; 
  assign _T_2077 = io_in_c_bits_opcode == _T_2066; 
  assign _T_2079 = _T_2077 | reset; 
  assign _T_2080 = _T_2079 == 1'h0; 
  assign _T_2081 = io_in_c_bits_param == _T_2068; 
  assign _T_2083 = _T_2081 | reset; 
  assign _T_2084 = _T_2083 == 1'h0; 
  assign _T_2085 = io_in_c_bits_size == _T_2070; 
  assign _T_2087 = _T_2085 | reset; 
  assign _T_2088 = _T_2087 == 1'h0; 
  assign _T_2089 = io_in_c_bits_source == _T_2072; 
  assign _T_2091 = _T_2089 | reset; 
  assign _T_2092 = _T_2091 == 1'h0; 
  assign _T_2093 = io_in_c_bits_address == _T_2074; 
  assign _T_2095 = _T_2093 | reset; 
  assign _T_2096 = _T_2095 == 1'h0; 
  assign _T_2098 = _T_2044 & _T_2057; 
  assign _T_2112 = _T_2111 - 4'h1; 
  assign _T_2113 = $unsigned(_T_2112); 
  assign _T_2114 = _T_2113[3:0]; 
  assign _T_2115 = _T_2111 == 4'h0; 
  assign _T_2133 = _T_2132 - 4'h1; 
  assign _T_2134 = $unsigned(_T_2133); 
  assign _T_2135 = _T_2134[3:0]; 
  assign _T_2136 = _T_2132 == 4'h0; 
  assign _T_2147 = _T_1871 & _T_2115; 
  assign _T_2149 = 32'h1 << io_in_a_bits_source; 
  assign _T_2150 = _T_2100 >> io_in_a_bits_source; 
  assign _T_2151 = _T_2150[0]; 
  assign _T_2152 = _T_2151 == 1'h0; 
  assign _T_2154 = _T_2152 | reset; 
  assign _T_2155 = _T_2154 == 1'h0; 
  assign _GEN_27 = _T_2147 ? _T_2149 : 32'h0; 
  assign _T_2160 = _T_1927 & _T_2136; 
  assign _T_2162 = _T_731 == 1'h0; 
  assign _T_2163 = _T_2160 & _T_2162; 
  assign _T_2164 = 32'h1 << io_in_d_bits_source; 
  assign _T_2145 = _GEN_27[30:0]; 
  assign _T_2165 = _T_2145 | _T_2100; 
  assign _T_2166 = _T_2165 >> io_in_d_bits_source; 
  assign _T_2167 = _T_2166[0]; 
  assign _T_2169 = _T_2167 | reset; 
  assign _T_2170 = _T_2169 == 1'h0; 
  assign _GEN_28 = _T_2163 ? _T_2164 : 32'h0; 
  assign _T_2157 = _GEN_28[30:0]; 
  assign _T_2171 = _T_2145 != _T_2157; 
  assign _T_2172 = _T_2145 != 31'h0; 
  assign _T_2173 = _T_2172 == 1'h0; 
  assign _T_2174 = _T_2171 | _T_2173; 
  assign _T_2176 = _T_2174 | reset; 
  assign _T_2177 = _T_2176 == 1'h0; 
  assign _T_2178 = _T_2100 | _T_2145; 
  assign _T_2179 = ~ _T_2157; 
  assign _T_2180 = _T_2178 & _T_2179; 
  assign _T_2183 = _T_2100 != 31'h0; 
  assign _T_2184 = _T_2183 == 1'h0; 
  assign _T_2185 = plusarg_reader_out == 32'h0; 
  assign _T_2186 = _T_2184 | _T_2185; 
  assign _T_2187 = _T_2182 < plusarg_reader_out; 
  assign _T_2188 = _T_2186 | _T_2187; 
  assign _T_2190 = _T_2188 | reset; 
  assign _T_2191 = _T_2190 == 1'h0; 
  assign _T_2193 = _T_2182 + 32'h1; 
  assign _T_2196 = _T_1871 | _T_1927; 
  assign _T_2209 = _T_2208 - 4'h1; 
  assign _T_2210 = $unsigned(_T_2209); 
  assign _T_2211 = _T_2210[3:0]; 
  assign _T_2212 = _T_2208 == 4'h0; 
  assign _T_2223 = _T_1927 & _T_2212; 
  assign _T_2224 = io_in_d_bits_opcode[2]; 
  assign _T_2225 = io_in_d_bits_opcode[1]; 
  assign _T_2226 = _T_2225 == 1'h0; 
  assign _T_2227 = _T_2224 & _T_2226; 
  assign _T_2228 = _T_2223 & _T_2227; 
  assign _T_2229 = 2'h1 << io_in_d_bits_sink; 
  assign _T_2230 = _T_2198 >> io_in_d_bits_sink; 
  assign _T_2232 = _T_2230 == 1'h0; 
  assign _T_2234 = _T_2232 | reset; 
  assign _T_2235 = _T_2234 == 1'h0; 
  assign _GEN_31 = _T_2228 ? _T_2229 : 2'h0; 
  assign _T_2238 = io_in_e_ready & io_in_e_valid; 
  assign _T_2241 = 2'h1 << 1'h0; 
  assign _T_2221 = _GEN_31[0]; 
  assign _T_2242 = _T_2221 | _T_2198; 
  assign _T_2243 = _T_2242 >> 1'h0; 
  assign _T_2246 = _T_2243 | reset; 
  assign _T_2247 = _T_2246 == 1'h0; 
  assign _GEN_32 = _T_2238 ? _T_2241 : 2'h0; 
  assign _T_2248 = _T_2198 | _T_2221; 
  assign _T_2237 = _GEN_32[0]; 
  assign _T_2249 = ~ _T_2237; 
  assign _T_2250 = _T_2248 & _T_2249; 
  assign _GEN_36 = io_in_a_valid & _T_267; 
  assign _GEN_52 = io_in_a_valid & _T_379; 
  assign _GEN_70 = io_in_a_valid & _T_495; 
  assign _GEN_82 = io_in_a_valid & _T_528; 
  assign _GEN_92 = io_in_a_valid & _T_557; 
  assign _GEN_102 = io_in_a_valid & _T_588; 
  assign _GEN_112 = io_in_a_valid & _T_617; 
  assign _GEN_122 = io_in_a_valid & _T_646; 
  assign _GEN_132 = io_in_d_valid & _T_731; 
  assign _GEN_142 = io_in_d_valid & _T_751; 
  assign _GEN_154 = io_in_d_valid & _T_779; 
  assign _GEN_166 = io_in_d_valid & _T_808; 
  assign _GEN_172 = io_in_d_valid & _T_825; 
  assign _GEN_178 = io_in_d_valid & _T_843; 
  assign _GEN_184 = io_in_b_valid & _T_1140; 
  assign _GEN_198 = io_in_b_valid & _T_1236; 
  assign _GEN_212 = io_in_b_valid & _T_1261; 
  assign _GEN_224 = io_in_b_valid & _T_1282; 
  assign _GEN_236 = io_in_b_valid & _T_1305; 
  assign _GEN_246 = io_in_b_valid & _T_1326; 
  assign _GEN_256 = io_in_b_valid & _T_1347; 
  assign _GEN_268 = io_in_c_valid & _T_1567; 
  assign _GEN_280 = io_in_c_valid & _T_1589; 
  assign _GEN_290 = io_in_c_valid & _T_1607; 
  assign _GEN_304 = io_in_c_valid & _T_1714; 
  assign _GEN_316 = io_in_c_valid & _T_1817; 
  assign _GEN_326 = io_in_c_valid & _T_1835; 
  assign _GEN_334 = io_in_c_valid & _T_1849; 
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
  _T_1881 = _RAND_0[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T_1894 = _RAND_1[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_1896 = _RAND_2[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_1898 = _RAND_3[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_1900 = _RAND_4[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_1902 = _RAND_5[13:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  _T_1936 = _RAND_6[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  _T_1949 = _RAND_7[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  _T_1951 = _RAND_8[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  _T_1953 = _RAND_9[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  _T_1955 = _RAND_10[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  _T_1957 = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  _T_1959 = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  _T_1998 = _RAND_13[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  _T_2011 = _RAND_14[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  _T_2013 = _RAND_15[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  _T_2015 = _RAND_16[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  _T_2017 = _RAND_17[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  _T_2019 = _RAND_18[13:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  _T_2053 = _RAND_19[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  _T_2066 = _RAND_20[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{`RANDOM}};
  _T_2068 = _RAND_21[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{`RANDOM}};
  _T_2070 = _RAND_22[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{`RANDOM}};
  _T_2072 = _RAND_23[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{`RANDOM}};
  _T_2074 = _RAND_24[13:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{`RANDOM}};
  _T_2100 = _RAND_25[30:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{`RANDOM}};
  _T_2111 = _RAND_26[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{`RANDOM}};
  _T_2132 = _RAND_27[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {1{`RANDOM}};
  _T_2182 = _RAND_28[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_29 = {1{`RANDOM}};
  _T_2198 = _RAND_29[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_30 = {1{`RANDOM}};
  _T_2208 = _RAND_30[3:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      _T_1881 <= 4'h0;
    end else begin
      if (_T_1871) begin
        if (_T_1885) begin
          if (_T_1878) begin
            _T_1881 <= _T_1876;
          end else begin
            _T_1881 <= 4'h0;
          end
        end else begin
          _T_1881 <= _T_1884;
        end
      end
    end
    if (_T_1926) begin
      _T_1894 <= io_in_a_bits_opcode;
    end
    if (_T_1926) begin
      _T_1896 <= io_in_a_bits_param;
    end
    if (_T_1926) begin
      _T_1898 <= io_in_a_bits_size;
    end
    if (_T_1926) begin
      _T_1900 <= io_in_a_bits_source;
    end
    if (_T_1926) begin
      _T_1902 <= io_in_a_bits_address;
    end
    if (reset) begin
      _T_1936 <= 4'h0;
    end else begin
      if (_T_1927) begin
        if (_T_1940) begin
          if (_T_1933) begin
            _T_1936 <= _T_1932;
          end else begin
            _T_1936 <= 4'h0;
          end
        end else begin
          _T_1936 <= _T_1939;
        end
      end
    end
    if (_T_1987) begin
      _T_1949 <= io_in_d_bits_opcode;
    end
    if (_T_1987) begin
      _T_1951 <= io_in_d_bits_param;
    end
    if (_T_1987) begin
      _T_1953 <= io_in_d_bits_size;
    end
    if (_T_1987) begin
      _T_1955 <= io_in_d_bits_source;
    end
    if (_T_1987) begin
      _T_1957 <= io_in_d_bits_sink;
    end
    if (_T_1987) begin
      _T_1959 <= io_in_d_bits_denied;
    end
    if (reset) begin
      _T_1998 <= 4'h0;
    end else begin
      if (_T_1988) begin
        if (_T_2002) begin
          _T_1998 <= 4'h0;
        end else begin
          _T_1998 <= _T_2001;
        end
      end
    end
    if (_T_2043) begin
      _T_2011 <= io_in_b_bits_opcode;
    end
    if (_T_2043) begin
      _T_2013 <= io_in_b_bits_param;
    end
    if (_T_2043) begin
      _T_2015 <= io_in_b_bits_size;
    end
    if (_T_2043) begin
      _T_2017 <= io_in_b_bits_source;
    end
    if (_T_2043) begin
      _T_2019 <= io_in_b_bits_address;
    end
    if (reset) begin
      _T_2053 <= 4'h0;
    end else begin
      if (_T_2044) begin
        if (_T_2057) begin
          if (_T_2050) begin
            _T_2053 <= _T_2049;
          end else begin
            _T_2053 <= 4'h0;
          end
        end else begin
          _T_2053 <= _T_2056;
        end
      end
    end
    if (_T_2098) begin
      _T_2066 <= io_in_c_bits_opcode;
    end
    if (_T_2098) begin
      _T_2068 <= io_in_c_bits_param;
    end
    if (_T_2098) begin
      _T_2070 <= io_in_c_bits_size;
    end
    if (_T_2098) begin
      _T_2072 <= io_in_c_bits_source;
    end
    if (_T_2098) begin
      _T_2074 <= io_in_c_bits_address;
    end
    if (reset) begin
      _T_2100 <= 31'h0;
    end else begin
      _T_2100 <= _T_2180;
    end
    if (reset) begin
      _T_2111 <= 4'h0;
    end else begin
      if (_T_1871) begin
        if (_T_2115) begin
          if (_T_1878) begin
            _T_2111 <= _T_1876;
          end else begin
            _T_2111 <= 4'h0;
          end
        end else begin
          _T_2111 <= _T_2114;
        end
      end
    end
    if (reset) begin
      _T_2132 <= 4'h0;
    end else begin
      if (_T_1927) begin
        if (_T_2136) begin
          if (_T_1933) begin
            _T_2132 <= _T_1932;
          end else begin
            _T_2132 <= 4'h0;
          end
        end else begin
          _T_2132 <= _T_2135;
        end
      end
    end
    if (reset) begin
      _T_2182 <= 32'h0;
    end else begin
      if (_T_2196) begin
        _T_2182 <= 32'h0;
      end else begin
        _T_2182 <= _T_2193;
      end
    end
    if (reset) begin
      _T_2198 <= 1'h0;
    end else begin
      _T_2198 <= _T_2250;
    end
    if (reset) begin
      _T_2208 <= 4'h0;
    end else begin
      if (_T_1927) begin
        if (_T_2212) begin
          if (_T_1933) begin
            _T_2208 <= _T_1932;
          end else begin
            _T_2208 <= 4'h0;
          end
        end else begin
          _T_2208 <= _T_2211;
        end
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel has invalid opcode (connected at SystemBus.scala:41:30)\n    at Monitor.scala:39 assert (TLMessages.isA(bundle.opcode), \"'A' channel has invalid opcode\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries AcquireBlock type unsupported by manager (connected at SystemBus.scala:41:30)\n    at Monitor.scala:49 assert (edge.manager.supportsAcquireBSafe(edge.address(bundle), bundle.size), \"'A' channel carries AcquireBlock type unsupported by manager\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries AcquireBlock from a client which does not support Probe (connected at SystemBus.scala:41:30)\n    at Monitor.scala:50 assert (edge.client.supportsProbe(edge.source(bundle), bundle.size), \"'A' channel carries AcquireBlock from a client which does not support Probe\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock carries invalid source ID (connected at SystemBus.scala:41:30)\n    at Monitor.scala:51 assert (source_ok, \"'A' channel AcquireBlock carries invalid source ID\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock smaller than a beat (connected at SystemBus.scala:41:30)\n    at Monitor.scala:52 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'A' channel AcquireBlock smaller than a beat\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock address not aligned to size (connected at SystemBus.scala:41:30)\n    at Monitor.scala:53 assert (is_aligned, \"'A' channel AcquireBlock address not aligned to size\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock carries invalid grow param (connected at SystemBus.scala:41:30)\n    at Monitor.scala:54 assert (TLPermissions.isGrow(bundle.param), \"'A' channel AcquireBlock carries invalid grow param\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock contains invalid mask (connected at SystemBus.scala:41:30)\n    at Monitor.scala:55 assert (~bundle.mask === UInt(0), \"'A' channel AcquireBlock contains invalid mask\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock is corrupt (connected at SystemBus.scala:41:30)\n    at Monitor.scala:56 assert (!bundle.corrupt, \"'A' channel AcquireBlock is corrupt\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries AcquirePerm type unsupported by manager (connected at SystemBus.scala:41:30)\n    at Monitor.scala:60 assert (edge.manager.supportsAcquireBSafe(edge.address(bundle), bundle.size), \"'A' channel carries AcquirePerm type unsupported by manager\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries AcquirePerm from a client which does not support Probe (connected at SystemBus.scala:41:30)\n    at Monitor.scala:61 assert (edge.client.supportsProbe(edge.source(bundle), bundle.size), \"'A' channel carries AcquirePerm from a client which does not support Probe\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm carries invalid source ID (connected at SystemBus.scala:41:30)\n    at Monitor.scala:62 assert (source_ok, \"'A' channel AcquirePerm carries invalid source ID\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm smaller than a beat (connected at SystemBus.scala:41:30)\n    at Monitor.scala:63 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'A' channel AcquirePerm smaller than a beat\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm address not aligned to size (connected at SystemBus.scala:41:30)\n    at Monitor.scala:64 assert (is_aligned, \"'A' channel AcquirePerm address not aligned to size\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm carries invalid grow param (connected at SystemBus.scala:41:30)\n    at Monitor.scala:65 assert (TLPermissions.isGrow(bundle.param), \"'A' channel AcquirePerm carries invalid grow param\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm requests NtoB (connected at SystemBus.scala:41:30)\n    at Monitor.scala:66 assert (bundle.param =/= TLPermissions.NtoB, \"'A' channel AcquirePerm requests NtoB\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm contains invalid mask (connected at SystemBus.scala:41:30)\n    at Monitor.scala:67 assert (~bundle.mask === UInt(0), \"'A' channel AcquirePerm contains invalid mask\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm is corrupt (connected at SystemBus.scala:41:30)\n    at Monitor.scala:68 assert (!bundle.corrupt, \"'A' channel AcquirePerm is corrupt\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries Get type unsupported by manager (connected at SystemBus.scala:41:30)\n    at Monitor.scala:72 assert (edge.manager.supportsGetSafe(edge.address(bundle), bundle.size), \"'A' channel carries Get type unsupported by manager\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Get carries invalid source ID (connected at SystemBus.scala:41:30)\n    at Monitor.scala:73 assert (source_ok, \"'A' channel Get carries invalid source ID\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Get address not aligned to size (connected at SystemBus.scala:41:30)\n    at Monitor.scala:74 assert (is_aligned, \"'A' channel Get address not aligned to size\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Get carries invalid param (connected at SystemBus.scala:41:30)\n    at Monitor.scala:75 assert (bundle.param === UInt(0), \"'A' channel Get carries invalid param\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Get contains invalid mask (connected at SystemBus.scala:41:30)\n    at Monitor.scala:76 assert (bundle.mask === mask, \"'A' channel Get contains invalid mask\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Get is corrupt (connected at SystemBus.scala:41:30)\n    at Monitor.scala:77 assert (!bundle.corrupt, \"'A' channel Get is corrupt\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries PutFull type unsupported by manager (connected at SystemBus.scala:41:30)\n    at Monitor.scala:81 assert (edge.manager.supportsPutFullSafe(edge.address(bundle), bundle.size), \"'A' channel carries PutFull type unsupported by manager\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutFull carries invalid source ID (connected at SystemBus.scala:41:30)\n    at Monitor.scala:82 assert (source_ok, \"'A' channel PutFull carries invalid source ID\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutFull address not aligned to size (connected at SystemBus.scala:41:30)\n    at Monitor.scala:83 assert (is_aligned, \"'A' channel PutFull address not aligned to size\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutFull carries invalid param (connected at SystemBus.scala:41:30)\n    at Monitor.scala:84 assert (bundle.param === UInt(0), \"'A' channel PutFull carries invalid param\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutFull contains invalid mask (connected at SystemBus.scala:41:30)\n    at Monitor.scala:85 assert (bundle.mask === mask, \"'A' channel PutFull contains invalid mask\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries PutPartial type unsupported by manager (connected at SystemBus.scala:41:30)\n    at Monitor.scala:89 assert (edge.manager.supportsPutPartialSafe(edge.address(bundle), bundle.size), \"'A' channel carries PutPartial type unsupported by manager\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutPartial carries invalid source ID (connected at SystemBus.scala:41:30)\n    at Monitor.scala:90 assert (source_ok, \"'A' channel PutPartial carries invalid source ID\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutPartial address not aligned to size (connected at SystemBus.scala:41:30)\n    at Monitor.scala:91 assert (is_aligned, \"'A' channel PutPartial address not aligned to size\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutPartial carries invalid param (connected at SystemBus.scala:41:30)\n    at Monitor.scala:92 assert (bundle.param === UInt(0), \"'A' channel PutPartial carries invalid param\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutPartial contains invalid mask (connected at SystemBus.scala:41:30)\n    at Monitor.scala:93 assert ((bundle.mask & ~mask) === UInt(0), \"'A' channel PutPartial contains invalid mask\" + extra)\n"); 
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
        if (_GEN_102 & _T_602) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries Arithmetic type unsupported by manager (connected at SystemBus.scala:41:30)\n    at Monitor.scala:97 assert (edge.manager.supportsArithmeticSafe(edge.address(bundle), bundle.size), \"'A' channel carries Arithmetic type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_102 & _T_602) begin
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Arithmetic carries invalid source ID (connected at SystemBus.scala:41:30)\n    at Monitor.scala:98 assert (source_ok, \"'A' channel Arithmetic carries invalid source ID\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Arithmetic address not aligned to size (connected at SystemBus.scala:41:30)\n    at Monitor.scala:99 assert (is_aligned, \"'A' channel Arithmetic address not aligned to size\" + extra)\n"); 
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
        if (_GEN_102 & _T_612) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Arithmetic carries invalid opcode param (connected at SystemBus.scala:41:30)\n    at Monitor.scala:100 assert (TLAtomics.isArithmetic(bundle.param), \"'A' channel Arithmetic carries invalid opcode param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_102 & _T_612) begin
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Arithmetic contains invalid mask (connected at SystemBus.scala:41:30)\n    at Monitor.scala:101 assert (bundle.mask === mask, \"'A' channel Arithmetic contains invalid mask\" + extra)\n"); 
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
        if (_GEN_112 & _T_602) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries Logical type unsupported by manager (connected at SystemBus.scala:41:30)\n    at Monitor.scala:105 assert (edge.manager.supportsLogicalSafe(edge.address(bundle), bundle.size), \"'A' channel carries Logical type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_112 & _T_602) begin
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Logical carries invalid source ID (connected at SystemBus.scala:41:30)\n    at Monitor.scala:106 assert (source_ok, \"'A' channel Logical carries invalid source ID\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Logical address not aligned to size (connected at SystemBus.scala:41:30)\n    at Monitor.scala:107 assert (is_aligned, \"'A' channel Logical address not aligned to size\" + extra)\n"); 
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
        if (_GEN_112 & _T_641) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Logical carries invalid opcode param (connected at SystemBus.scala:41:30)\n    at Monitor.scala:108 assert (TLAtomics.isLogical(bundle.param), \"'A' channel Logical carries invalid opcode param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_112 & _T_641) begin
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Logical contains invalid mask (connected at SystemBus.scala:41:30)\n    at Monitor.scala:109 assert (bundle.mask === mask, \"'A' channel Logical contains invalid mask\" + extra)\n"); 
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
        if (_GEN_122 & _T_281) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries Hint type unsupported by manager (connected at SystemBus.scala:41:30)\n    at Monitor.scala:113 assert (edge.manager.supportsHintSafe(edge.address(bundle), bundle.size), \"'A' channel carries Hint type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_122 & _T_281) begin
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Hint carries invalid source ID (connected at SystemBus.scala:41:30)\n    at Monitor.scala:114 assert (source_ok, \"'A' channel Hint carries invalid source ID\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Hint address not aligned to size (connected at SystemBus.scala:41:30)\n    at Monitor.scala:115 assert (is_aligned, \"'A' channel Hint address not aligned to size\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Hint contains invalid mask (connected at SystemBus.scala:41:30)\n    at Monitor.scala:116 assert (bundle.mask === mask, \"'A' channel Hint contains invalid mask\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Hint is corrupt (connected at SystemBus.scala:41:30)\n    at Monitor.scala:117 assert (!bundle.corrupt, \"'A' channel Hint is corrupt\" + extra)\n"); 
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
        if (io_in_d_valid & _T_678) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel has invalid opcode (connected at SystemBus.scala:41:30)\n    at Monitor.scala:268 assert (TLMessages.isD(bundle.opcode), \"'D' channel has invalid opcode\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_d_valid & _T_678) begin
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
        if (_GEN_132 & _T_734) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel ReleaseAck carries invalid source ID (connected at SystemBus.scala:41:30)\n    at Monitor.scala:276 assert (source_ok, \"'D' channel ReleaseAck carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_132 & _T_734) begin
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
        if (_GEN_132 & _T_738) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel ReleaseAck smaller than a beat (connected at SystemBus.scala:41:30)\n    at Monitor.scala:277 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'D' channel ReleaseAck smaller than a beat\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_132 & _T_738) begin
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
        if (_GEN_132 & _T_742) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel ReleaseeAck carries invalid param (connected at SystemBus.scala:41:30)\n    at Monitor.scala:278 assert (bundle.param === UInt(0), \"'D' channel ReleaseeAck carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_132 & _T_742) begin
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
        if (_GEN_132 & _T_746) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel ReleaseAck is corrupt (connected at SystemBus.scala:41:30)\n    at Monitor.scala:279 assert (!bundle.corrupt, \"'D' channel ReleaseAck is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_132 & _T_746) begin
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
        if (_GEN_132 & _T_750) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel ReleaseAck is denied (connected at SystemBus.scala:41:30)\n    at Monitor.scala:280 assert (!bundle.denied, \"'D' channel ReleaseAck is denied\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_132 & _T_750) begin
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
        if (_GEN_142 & _T_734) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant carries invalid source ID (connected at SystemBus.scala:41:30)\n    at Monitor.scala:284 assert (source_ok, \"'D' channel Grant carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_142 & _T_734) begin
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
        if (_GEN_142 & _T_757) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant carries invalid sink ID (connected at SystemBus.scala:41:30)\n    at Monitor.scala:285 assert (sink_ok, \"'D' channel Grant carries invalid sink ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_142 & _T_757) begin
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
        if (_GEN_142 & _T_738) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant smaller than a beat (connected at SystemBus.scala:41:30)\n    at Monitor.scala:286 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'D' channel Grant smaller than a beat\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_142 & _T_738) begin
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
        if (_GEN_142 & _T_765) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant carries invalid cap param (connected at SystemBus.scala:41:30)\n    at Monitor.scala:287 assert (TLPermissions.isCap(bundle.param), \"'D' channel Grant carries invalid cap param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_142 & _T_765) begin
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
        if (_GEN_142 & _T_769) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant carries toN param (connected at SystemBus.scala:41:30)\n    at Monitor.scala:288 assert (bundle.param =/= TLPermissions.toN, \"'D' channel Grant carries toN param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_142 & _T_769) begin
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
        if (_GEN_142 & _T_746) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant is corrupt (connected at SystemBus.scala:41:30)\n    at Monitor.scala:289 assert (!bundle.corrupt, \"'D' channel Grant is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_142 & _T_746) begin
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant is denied (connected at SystemBus.scala:41:30)\n    at Monitor.scala:290 assert (deny_put_ok || !bundle.denied, \"'D' channel Grant is denied\" + extra)\n"); 
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
        if (_GEN_154 & _T_734) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData carries invalid source ID (connected at SystemBus.scala:41:30)\n    at Monitor.scala:294 assert (source_ok, \"'D' channel GrantData carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_154 & _T_734) begin
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
        if (_GEN_154 & _T_757) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData carries invalid sink ID (connected at SystemBus.scala:41:30)\n    at Monitor.scala:295 assert (sink_ok, \"'D' channel GrantData carries invalid sink ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_154 & _T_757) begin
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
        if (_GEN_154 & _T_738) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData smaller than a beat (connected at SystemBus.scala:41:30)\n    at Monitor.scala:296 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'D' channel GrantData smaller than a beat\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_154 & _T_738) begin
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
        if (_GEN_154 & _T_765) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData carries invalid cap param (connected at SystemBus.scala:41:30)\n    at Monitor.scala:297 assert (TLPermissions.isCap(bundle.param), \"'D' channel GrantData carries invalid cap param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_154 & _T_765) begin
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
        if (_GEN_154 & _T_769) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData carries toN param (connected at SystemBus.scala:41:30)\n    at Monitor.scala:298 assert (bundle.param =/= TLPermissions.toN, \"'D' channel GrantData carries toN param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_154 & _T_769) begin
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
        if (_GEN_154 & _T_802) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData is denied but not corrupt (connected at SystemBus.scala:41:30)\n    at Monitor.scala:299 assert (!bundle.denied || bundle.corrupt, \"'D' channel GrantData is denied but not corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_154 & _T_802) begin
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData is denied (connected at SystemBus.scala:41:30)\n    at Monitor.scala:300 assert (deny_get_ok || !bundle.denied, \"'D' channel GrantData is denied\" + extra)\n"); 
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
        if (_GEN_166 & _T_734) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAck carries invalid source ID (connected at SystemBus.scala:41:30)\n    at Monitor.scala:304 assert (source_ok, \"'D' channel AccessAck carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_166 & _T_734) begin
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
        if (_GEN_166 & _T_742) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAck carries invalid param (connected at SystemBus.scala:41:30)\n    at Monitor.scala:306 assert (bundle.param === UInt(0), \"'D' channel AccessAck carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_166 & _T_742) begin
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
        if (_GEN_166 & _T_746) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAck is corrupt (connected at SystemBus.scala:41:30)\n    at Monitor.scala:307 assert (!bundle.corrupt, \"'D' channel AccessAck is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_166 & _T_746) begin
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAck is denied (connected at SystemBus.scala:41:30)\n    at Monitor.scala:308 assert (deny_put_ok || !bundle.denied, \"'D' channel AccessAck is denied\" + extra)\n"); 
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
        if (_GEN_172 & _T_734) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAckData carries invalid source ID (connected at SystemBus.scala:41:30)\n    at Monitor.scala:312 assert (source_ok, \"'D' channel AccessAckData carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_172 & _T_734) begin
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
        if (_GEN_172 & _T_742) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAckData carries invalid param (connected at SystemBus.scala:41:30)\n    at Monitor.scala:314 assert (bundle.param === UInt(0), \"'D' channel AccessAckData carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_172 & _T_742) begin
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
        if (_GEN_172 & _T_802) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAckData is denied but not corrupt (connected at SystemBus.scala:41:30)\n    at Monitor.scala:315 assert (!bundle.denied || bundle.corrupt, \"'D' channel AccessAckData is denied but not corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_172 & _T_802) begin
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAckData is denied (connected at SystemBus.scala:41:30)\n    at Monitor.scala:316 assert (deny_get_ok || !bundle.denied, \"'D' channel AccessAckData is denied\" + extra)\n"); 
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
        if (_GEN_178 & _T_734) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel HintAck carries invalid source ID (connected at SystemBus.scala:41:30)\n    at Monitor.scala:320 assert (source_ok, \"'D' channel HintAck carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_178 & _T_734) begin
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
        if (_GEN_178 & _T_742) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel HintAck carries invalid param (connected at SystemBus.scala:41:30)\n    at Monitor.scala:322 assert (bundle.param === UInt(0), \"'D' channel HintAck carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_178 & _T_742) begin
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
        if (_GEN_178 & _T_746) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel HintAck is corrupt (connected at SystemBus.scala:41:30)\n    at Monitor.scala:323 assert (!bundle.corrupt, \"'D' channel HintAck is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_178 & _T_746) begin
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel HintAck is denied (connected at SystemBus.scala:41:30)\n    at Monitor.scala:324 assert (deny_put_ok || !bundle.denied, \"'D' channel HintAck is denied\" + extra)\n"); 
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
        if (io_in_b_valid & _T_863) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel has invalid opcode (connected at SystemBus.scala:41:30)\n    at Monitor.scala:122 assert (TLMessages.isB(bundle.opcode), \"'B' channel has invalid opcode\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_863) begin
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
        if (_GEN_184 & _T_1214) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel carries Probe type unsupported by client (connected at SystemBus.scala:41:30)\n    at Monitor.scala:133 assert (edge.client.supportsProbe(bundle.source, bundle.size), \"'B' channel carries Probe type unsupported by client\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_184 & _T_1214) begin
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
        if (_GEN_184 & _T_1217) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Probe carries unmanaged address (connected at SystemBus.scala:41:30)\n    at Monitor.scala:134 assert (address_ok, \"'B' channel Probe carries unmanaged address\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_184 & _T_1217) begin
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
        if (_GEN_184 & _T_1220) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Probe carries source that is not first source (connected at SystemBus.scala:41:30)\n    at Monitor.scala:135 assert (legal_source, \"'B' channel Probe carries source that is not first source\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_184 & _T_1220) begin
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
        if (_GEN_184 & _T_1223) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Probe address not aligned to size (connected at SystemBus.scala:41:30)\n    at Monitor.scala:136 assert (is_aligned, \"'B' channel Probe address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_184 & _T_1223) begin
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
        if (_GEN_184 & _T_1227) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Probe carries invalid cap param (connected at SystemBus.scala:41:30)\n    at Monitor.scala:137 assert (TLPermissions.isCap(bundle.param), \"'B' channel Probe carries invalid cap param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_184 & _T_1227) begin
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
        if (_GEN_184 & _T_1231) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Probe contains invalid mask (connected at SystemBus.scala:41:30)\n    at Monitor.scala:138 assert (bundle.mask === mask, \"'B' channel Probe contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_184 & _T_1231) begin
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
        if (_GEN_184 & _T_1235) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Probe is corrupt (connected at SystemBus.scala:41:30)\n    at Monitor.scala:139 assert (!bundle.corrupt, \"'B' channel Probe is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_184 & _T_1235) begin
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
        if (_GEN_198 & _T_1239) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel carries Get type unsupported by client (connected at SystemBus.scala:41:30)\n    at Monitor.scala:143 assert (edge.client.supportsGet(bundle.source, bundle.size), \"'B' channel carries Get type unsupported by client\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_198 & _T_1239) begin
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
        if (_GEN_198 & _T_1217) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Get carries unmanaged address (connected at SystemBus.scala:41:30)\n    at Monitor.scala:144 assert (address_ok, \"'B' channel Get carries unmanaged address\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_198 & _T_1217) begin
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
        if (_GEN_198 & _T_1220) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Get carries source that is not first source (connected at SystemBus.scala:41:30)\n    at Monitor.scala:145 assert (legal_source, \"'B' channel Get carries source that is not first source\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_198 & _T_1220) begin
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
        if (_GEN_198 & _T_1223) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Get address not aligned to size (connected at SystemBus.scala:41:30)\n    at Monitor.scala:146 assert (is_aligned, \"'B' channel Get address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_198 & _T_1223) begin
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
        if (_GEN_198 & _T_1252) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Get carries invalid param (connected at SystemBus.scala:41:30)\n    at Monitor.scala:147 assert (bundle.param === UInt(0), \"'B' channel Get carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_198 & _T_1252) begin
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
        if (_GEN_198 & _T_1231) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Get contains invalid mask (connected at SystemBus.scala:41:30)\n    at Monitor.scala:148 assert (bundle.mask === mask, \"'B' channel Get contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_198 & _T_1231) begin
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
        if (_GEN_198 & _T_1235) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Get is corrupt (connected at SystemBus.scala:41:30)\n    at Monitor.scala:149 assert (!bundle.corrupt, \"'B' channel Get is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_198 & _T_1235) begin
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
        if (_GEN_212 & _T_1239) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel carries PutFull type unsupported by client (connected at SystemBus.scala:41:30)\n    at Monitor.scala:153 assert (edge.client.supportsPutFull(bundle.source, bundle.size), \"'B' channel carries PutFull type unsupported by client\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_212 & _T_1239) begin
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
        if (_GEN_212 & _T_1217) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel PutFull carries unmanaged address (connected at SystemBus.scala:41:30)\n    at Monitor.scala:154 assert (address_ok, \"'B' channel PutFull carries unmanaged address\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_212 & _T_1217) begin
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
        if (_GEN_212 & _T_1220) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel PutFull carries source that is not first source (connected at SystemBus.scala:41:30)\n    at Monitor.scala:155 assert (legal_source, \"'B' channel PutFull carries source that is not first source\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_212 & _T_1220) begin
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
        if (_GEN_212 & _T_1223) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel PutFull address not aligned to size (connected at SystemBus.scala:41:30)\n    at Monitor.scala:156 assert (is_aligned, \"'B' channel PutFull address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_212 & _T_1223) begin
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
        if (_GEN_212 & _T_1252) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel PutFull carries invalid param (connected at SystemBus.scala:41:30)\n    at Monitor.scala:157 assert (bundle.param === UInt(0), \"'B' channel PutFull carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_212 & _T_1252) begin
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
        if (_GEN_212 & _T_1231) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel PutFull contains invalid mask (connected at SystemBus.scala:41:30)\n    at Monitor.scala:158 assert (bundle.mask === mask, \"'B' channel PutFull contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_212 & _T_1231) begin
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
        if (_GEN_224 & _T_1239) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel carries PutPartial type unsupported by client (connected at SystemBus.scala:41:30)\n    at Monitor.scala:162 assert (edge.client.supportsPutPartial(bundle.source, bundle.size), \"'B' channel carries PutPartial type unsupported by client\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_224 & _T_1239) begin
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
        if (_GEN_224 & _T_1217) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel PutPartial carries unmanaged address (connected at SystemBus.scala:41:30)\n    at Monitor.scala:163 assert (address_ok, \"'B' channel PutPartial carries unmanaged address\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_224 & _T_1217) begin
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
        if (_GEN_224 & _T_1220) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel PutPartial carries source that is not first source (connected at SystemBus.scala:41:30)\n    at Monitor.scala:164 assert (legal_source, \"'B' channel PutPartial carries source that is not first source\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_224 & _T_1220) begin
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
        if (_GEN_224 & _T_1223) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel PutPartial address not aligned to size (connected at SystemBus.scala:41:30)\n    at Monitor.scala:165 assert (is_aligned, \"'B' channel PutPartial address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_224 & _T_1223) begin
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
        if (_GEN_224 & _T_1252) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel PutPartial carries invalid param (connected at SystemBus.scala:41:30)\n    at Monitor.scala:166 assert (bundle.param === UInt(0), \"'B' channel PutPartial carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_224 & _T_1252) begin
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
        if (_GEN_224 & _T_1304) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel PutPartial contains invalid mask (connected at SystemBus.scala:41:30)\n    at Monitor.scala:167 assert ((bundle.mask & ~mask) === UInt(0), \"'B' channel PutPartial contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_224 & _T_1304) begin
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
        if (_GEN_236 & _T_1239) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel carries Arithmetic type unsupported by client (connected at SystemBus.scala:41:30)\n    at Monitor.scala:171 assert (edge.client.supportsArithmetic(bundle.source, bundle.size), \"'B' channel carries Arithmetic type unsupported by client\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_236 & _T_1239) begin
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
        if (_GEN_236 & _T_1217) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Arithmetic carries unmanaged address (connected at SystemBus.scala:41:30)\n    at Monitor.scala:172 assert (address_ok, \"'B' channel Arithmetic carries unmanaged address\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_236 & _T_1217) begin
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
        if (_GEN_236 & _T_1220) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Arithmetic carries source that is not first source (connected at SystemBus.scala:41:30)\n    at Monitor.scala:173 assert (legal_source, \"'B' channel Arithmetic carries source that is not first source\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_236 & _T_1220) begin
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
        if (_GEN_236 & _T_1223) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Arithmetic address not aligned to size (connected at SystemBus.scala:41:30)\n    at Monitor.scala:174 assert (is_aligned, \"'B' channel Arithmetic address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_236 & _T_1223) begin
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
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Arithmetic carries invalid opcode param (connected at SystemBus.scala:41:30)\n    at Monitor.scala:175 assert (TLAtomics.isArithmetic(bundle.param), \"'B' channel Arithmetic carries invalid opcode param\" + extra)\n"); 
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
        if (_GEN_236 & _T_1231) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Arithmetic contains invalid mask (connected at SystemBus.scala:41:30)\n    at Monitor.scala:176 assert (bundle.mask === mask, \"'B' channel Arithmetic contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_236 & _T_1231) begin
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
        if (_GEN_246 & _T_1239) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel carries Logical type unsupported by client (connected at SystemBus.scala:41:30)\n    at Monitor.scala:180 assert (edge.client.supportsLogical(bundle.source, bundle.size), \"'B' channel carries Logical type unsupported by client\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_246 & _T_1239) begin
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
        if (_GEN_246 & _T_1217) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Logical carries unmanaged address (connected at SystemBus.scala:41:30)\n    at Monitor.scala:181 assert (address_ok, \"'B' channel Logical carries unmanaged address\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_246 & _T_1217) begin
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
        if (_GEN_246 & _T_1220) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Logical carries source that is not first source (connected at SystemBus.scala:41:30)\n    at Monitor.scala:182 assert (legal_source, \"'B' channel Logical carries source that is not first source\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_246 & _T_1220) begin
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
        if (_GEN_246 & _T_1223) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Logical address not aligned to size (connected at SystemBus.scala:41:30)\n    at Monitor.scala:183 assert (is_aligned, \"'B' channel Logical address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_246 & _T_1223) begin
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
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Logical carries invalid opcode param (connected at SystemBus.scala:41:30)\n    at Monitor.scala:184 assert (TLAtomics.isLogical(bundle.param), \"'B' channel Logical carries invalid opcode param\" + extra)\n"); 
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
        if (_GEN_246 & _T_1231) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Logical contains invalid mask (connected at SystemBus.scala:41:30)\n    at Monitor.scala:185 assert (bundle.mask === mask, \"'B' channel Logical contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_246 & _T_1231) begin
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
        if (_GEN_256 & _T_1239) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel carries Hint type unsupported by client (connected at SystemBus.scala:41:30)\n    at Monitor.scala:189 assert (edge.client.supportsHint(bundle.source, bundle.size), \"'B' channel carries Hint type unsupported by client\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_256 & _T_1239) begin
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
        if (_GEN_256 & _T_1217) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Hint carries unmanaged address (connected at SystemBus.scala:41:30)\n    at Monitor.scala:190 assert (address_ok, \"'B' channel Hint carries unmanaged address\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_256 & _T_1217) begin
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
        if (_GEN_256 & _T_1220) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Hint carries source that is not first source (connected at SystemBus.scala:41:30)\n    at Monitor.scala:191 assert (legal_source, \"'B' channel Hint carries source that is not first source\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_256 & _T_1220) begin
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
        if (_GEN_256 & _T_1223) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Hint address not aligned to size (connected at SystemBus.scala:41:30)\n    at Monitor.scala:192 assert (is_aligned, \"'B' channel Hint address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_256 & _T_1223) begin
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
        if (_GEN_256 & _T_1231) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Hint contains invalid mask (connected at SystemBus.scala:41:30)\n    at Monitor.scala:193 assert (bundle.mask === mask, \"'B' channel Hint contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_256 & _T_1231) begin
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
        if (_GEN_256 & _T_1235) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Hint is corrupt (connected at SystemBus.scala:41:30)\n    at Monitor.scala:194 assert (!bundle.corrupt, \"'B' channel Hint is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_256 & _T_1235) begin
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
          $fwrite(32'h80000002,"Assertion failed: 'C' channel has invalid opcode (connected at SystemBus.scala:41:30)\n    at Monitor.scala:199 assert (TLMessages.isC(bundle.opcode), \"'C' channel has invalid opcode\" + extra)\n"); 
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
        if (_GEN_268 & _T_1570) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ProbeAck carries unmanaged address (connected at SystemBus.scala:41:30)\n    at Monitor.scala:208 assert (address_ok, \"'C' channel ProbeAck carries unmanaged address\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_268 & _T_1570) begin
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
        if (_GEN_268 & _T_1573) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ProbeAck carries invalid source ID (connected at SystemBus.scala:41:30)\n    at Monitor.scala:209 assert (source_ok, \"'C' channel ProbeAck carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_268 & _T_1573) begin
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
        if (_GEN_268 & _T_1577) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ProbeAck smaller than a beat (connected at SystemBus.scala:41:30)\n    at Monitor.scala:210 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'C' channel ProbeAck smaller than a beat\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_268 & _T_1577) begin
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
        if (_GEN_268 & _T_1580) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ProbeAck address not aligned to size (connected at SystemBus.scala:41:30)\n    at Monitor.scala:211 assert (is_aligned, \"'C' channel ProbeAck address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_268 & _T_1580) begin
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
        if (_GEN_268 & _T_1584) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ProbeAck carries invalid report param (connected at SystemBus.scala:41:30)\n    at Monitor.scala:212 assert (TLPermissions.isReport(bundle.param), \"'C' channel ProbeAck carries invalid report param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_268 & _T_1584) begin
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
        if (_GEN_268 & _T_1588) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ProbeAck is corrupt (connected at SystemBus.scala:41:30)\n    at Monitor.scala:213 assert (!bundle.corrupt, \"'C' channel ProbeAck is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_268 & _T_1588) begin
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
        if (_GEN_280 & _T_1570) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ProbeAckData carries unmanaged address (connected at SystemBus.scala:41:30)\n    at Monitor.scala:217 assert (address_ok, \"'C' channel ProbeAckData carries unmanaged address\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_280 & _T_1570) begin
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
        if (_GEN_280 & _T_1573) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ProbeAckData carries invalid source ID (connected at SystemBus.scala:41:30)\n    at Monitor.scala:218 assert (source_ok, \"'C' channel ProbeAckData carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_280 & _T_1573) begin
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
        if (_GEN_280 & _T_1577) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ProbeAckData smaller than a beat (connected at SystemBus.scala:41:30)\n    at Monitor.scala:219 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'C' channel ProbeAckData smaller than a beat\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_280 & _T_1577) begin
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
        if (_GEN_280 & _T_1580) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ProbeAckData address not aligned to size (connected at SystemBus.scala:41:30)\n    at Monitor.scala:220 assert (is_aligned, \"'C' channel ProbeAckData address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_280 & _T_1580) begin
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
        if (_GEN_280 & _T_1584) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ProbeAckData carries invalid report param (connected at SystemBus.scala:41:30)\n    at Monitor.scala:221 assert (TLPermissions.isReport(bundle.param), \"'C' channel ProbeAckData carries invalid report param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_280 & _T_1584) begin
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
        if (_GEN_290 & _T_1570) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel carries Release type unsupported by manager (connected at SystemBus.scala:41:30)\n    at Monitor.scala:225 assert (edge.manager.supportsAcquireBSafe(edge.address(bundle), bundle.size), \"'C' channel carries Release type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_290 & _T_1570) begin
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
        if (_GEN_290 & _T_1695) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel carries Release from a client which does not support Probe (connected at SystemBus.scala:41:30)\n    at Monitor.scala:226 assert (edge.client.supportsProbe(edge.source(bundle), bundle.size), \"'C' channel carries Release from a client which does not support Probe\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_290 & _T_1695) begin
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
        if (_GEN_290 & _T_1573) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel Release carries invalid source ID (connected at SystemBus.scala:41:30)\n    at Monitor.scala:227 assert (source_ok, \"'C' channel Release carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_290 & _T_1573) begin
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
        if (_GEN_290 & _T_1577) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel Release smaller than a beat (connected at SystemBus.scala:41:30)\n    at Monitor.scala:228 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'C' channel Release smaller than a beat\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_290 & _T_1577) begin
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
        if (_GEN_290 & _T_1580) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel Release address not aligned to size (connected at SystemBus.scala:41:30)\n    at Monitor.scala:229 assert (is_aligned, \"'C' channel Release address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_290 & _T_1580) begin
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
        if (_GEN_290 & _T_1709) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel Release carries invalid shrink param (connected at SystemBus.scala:41:30)\n    at Monitor.scala:230 assert (TLPermissions.isShrink(bundle.param), \"'C' channel Release carries invalid shrink param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_290 & _T_1709) begin
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
        if (_GEN_290 & _T_1588) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel Release is corrupt (connected at SystemBus.scala:41:30)\n    at Monitor.scala:231 assert (!bundle.corrupt, \"'C' channel Release is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_290 & _T_1588) begin
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
        if (_GEN_304 & _T_1570) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel carries ReleaseData type unsupported by manager (connected at SystemBus.scala:41:30)\n    at Monitor.scala:235 assert (edge.manager.supportsAcquireBSafe(edge.address(bundle), bundle.size), \"'C' channel carries ReleaseData type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_304 & _T_1570) begin
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
        if (_GEN_304 & _T_1695) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel carries Release from a client which does not support Probe (connected at SystemBus.scala:41:30)\n    at Monitor.scala:236 assert (edge.client.supportsProbe(edge.source(bundle), bundle.size), \"'C' channel carries Release from a client which does not support Probe\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_304 & _T_1695) begin
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
        if (_GEN_304 & _T_1573) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ReleaseData carries invalid source ID (connected at SystemBus.scala:41:30)\n    at Monitor.scala:237 assert (source_ok, \"'C' channel ReleaseData carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_304 & _T_1573) begin
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
        if (_GEN_304 & _T_1577) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ReleaseData smaller than a beat (connected at SystemBus.scala:41:30)\n    at Monitor.scala:238 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'C' channel ReleaseData smaller than a beat\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_304 & _T_1577) begin
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
        if (_GEN_304 & _T_1580) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ReleaseData address not aligned to size (connected at SystemBus.scala:41:30)\n    at Monitor.scala:239 assert (is_aligned, \"'C' channel ReleaseData address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_304 & _T_1580) begin
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
        if (_GEN_304 & _T_1709) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ReleaseData carries invalid shrink param (connected at SystemBus.scala:41:30)\n    at Monitor.scala:240 assert (TLPermissions.isShrink(bundle.param), \"'C' channel ReleaseData carries invalid shrink param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_304 & _T_1709) begin
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
        if (_GEN_316 & _T_1570) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel AccessAck carries unmanaged address (connected at SystemBus.scala:41:30)\n    at Monitor.scala:244 assert (address_ok, \"'C' channel AccessAck carries unmanaged address\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_316 & _T_1570) begin
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
        if (_GEN_316 & _T_1573) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel AccessAck carries invalid source ID (connected at SystemBus.scala:41:30)\n    at Monitor.scala:245 assert (source_ok, \"'C' channel AccessAck carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_316 & _T_1573) begin
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
        if (_GEN_316 & _T_1580) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel AccessAck address not aligned to size (connected at SystemBus.scala:41:30)\n    at Monitor.scala:246 assert (is_aligned, \"'C' channel AccessAck address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_316 & _T_1580) begin
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
        if (_GEN_316 & _T_1830) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel AccessAck carries invalid param (connected at SystemBus.scala:41:30)\n    at Monitor.scala:247 assert (bundle.param === UInt(0), \"'C' channel AccessAck carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_316 & _T_1830) begin
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
        if (_GEN_316 & _T_1588) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel AccessAck is corrupt (connected at SystemBus.scala:41:30)\n    at Monitor.scala:248 assert (!bundle.corrupt, \"'C' channel AccessAck is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_316 & _T_1588) begin
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
        if (_GEN_326 & _T_1570) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel AccessAckData carries unmanaged address (connected at SystemBus.scala:41:30)\n    at Monitor.scala:252 assert (address_ok, \"'C' channel AccessAckData carries unmanaged address\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_326 & _T_1570) begin
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
        if (_GEN_326 & _T_1573) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel AccessAckData carries invalid source ID (connected at SystemBus.scala:41:30)\n    at Monitor.scala:253 assert (source_ok, \"'C' channel AccessAckData carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_326 & _T_1573) begin
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
        if (_GEN_326 & _T_1580) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel AccessAckData address not aligned to size (connected at SystemBus.scala:41:30)\n    at Monitor.scala:254 assert (is_aligned, \"'C' channel AccessAckData address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_326 & _T_1580) begin
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
        if (_GEN_326 & _T_1830) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel AccessAckData carries invalid param (connected at SystemBus.scala:41:30)\n    at Monitor.scala:255 assert (bundle.param === UInt(0), \"'C' channel AccessAckData carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_326 & _T_1830) begin
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
        if (_GEN_334 & _T_1570) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel HintAck carries unmanaged address (connected at SystemBus.scala:41:30)\n    at Monitor.scala:259 assert (address_ok, \"'C' channel HintAck carries unmanaged address\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_334 & _T_1570) begin
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
        if (_GEN_334 & _T_1573) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel HintAck carries invalid source ID (connected at SystemBus.scala:41:30)\n    at Monitor.scala:260 assert (source_ok, \"'C' channel HintAck carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_334 & _T_1573) begin
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
        if (_GEN_334 & _T_1580) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel HintAck address not aligned to size (connected at SystemBus.scala:41:30)\n    at Monitor.scala:261 assert (is_aligned, \"'C' channel HintAck address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_334 & _T_1580) begin
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
        if (_GEN_334 & _T_1830) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel HintAck carries invalid param (connected at SystemBus.scala:41:30)\n    at Monitor.scala:262 assert (bundle.param === UInt(0), \"'C' channel HintAck carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_334 & _T_1830) begin
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
        if (_GEN_334 & _T_1588) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel HintAck is corrupt (connected at SystemBus.scala:41:30)\n    at Monitor.scala:263 assert (!bundle.corrupt, \"'C' channel HintAck is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_334 & _T_1588) begin
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
          $fwrite(32'h80000002,"Assertion failed: 'E' channels carries invalid sink ID (connected at SystemBus.scala:41:30)\n    at Monitor.scala:330 assert (sink_ok, \"'E' channels carries invalid sink ID\" + extra)\n"); 
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
        if (_T_1904 & _T_1908) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel opcode changed within multibeat operation (connected at SystemBus.scala:41:30)\n    at Monitor.scala:355 assert (a.bits.opcode === opcode, \"'A' channel opcode changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1904 & _T_1908) begin
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
        if (_T_1904 & _T_1912) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel param changed within multibeat operation (connected at SystemBus.scala:41:30)\n    at Monitor.scala:356 assert (a.bits.param  === param,  \"'A' channel param changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1904 & _T_1912) begin
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
        if (_T_1904 & _T_1916) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel size changed within multibeat operation (connected at SystemBus.scala:41:30)\n    at Monitor.scala:357 assert (a.bits.size   === size,   \"'A' channel size changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1904 & _T_1916) begin
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
        if (_T_1904 & _T_1920) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel source changed within multibeat operation (connected at SystemBus.scala:41:30)\n    at Monitor.scala:358 assert (a.bits.source === source, \"'A' channel source changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1904 & _T_1920) begin
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
        if (_T_1904 & _T_1924) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel address changed with multibeat operation (connected at SystemBus.scala:41:30)\n    at Monitor.scala:359 assert (a.bits.address=== address,\"'A' channel address changed with multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1904 & _T_1924) begin
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
        if (_T_1961 & _T_1965) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel opcode changed within multibeat operation (connected at SystemBus.scala:41:30)\n    at Monitor.scala:425 assert (d.bits.opcode === opcode, \"'D' channel opcode changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1961 & _T_1965) begin
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
        if (_T_1961 & _T_1969) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel param changed within multibeat operation (connected at SystemBus.scala:41:30)\n    at Monitor.scala:426 assert (d.bits.param  === param,  \"'D' channel param changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1961 & _T_1969) begin
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
        if (_T_1961 & _T_1973) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel size changed within multibeat operation (connected at SystemBus.scala:41:30)\n    at Monitor.scala:427 assert (d.bits.size   === size,   \"'D' channel size changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1961 & _T_1973) begin
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
        if (_T_1961 & _T_1977) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel source changed within multibeat operation (connected at SystemBus.scala:41:30)\n    at Monitor.scala:428 assert (d.bits.source === source, \"'D' channel source changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1961 & _T_1977) begin
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
        if (_T_1961 & _T_1981) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel sink changed with multibeat operation (connected at SystemBus.scala:41:30)\n    at Monitor.scala:429 assert (d.bits.sink   === sink,   \"'D' channel sink changed with multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1961 & _T_1981) begin
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
        if (_T_1961 & _T_1985) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel denied changed with multibeat operation (connected at SystemBus.scala:41:30)\n    at Monitor.scala:430 assert (d.bits.denied === denied, \"'D' channel denied changed with multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1961 & _T_1985) begin
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
        if (_T_2021 & _T_2025) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel opcode changed within multibeat operation (connected at SystemBus.scala:41:30)\n    at Monitor.scala:378 assert (b.bits.opcode === opcode, \"'B' channel opcode changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2021 & _T_2025) begin
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
        if (_T_2021 & _T_2029) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel param changed within multibeat operation (connected at SystemBus.scala:41:30)\n    at Monitor.scala:379 assert (b.bits.param  === param,  \"'B' channel param changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2021 & _T_2029) begin
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
        if (_T_2021 & _T_2033) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel size changed within multibeat operation (connected at SystemBus.scala:41:30)\n    at Monitor.scala:380 assert (b.bits.size   === size,   \"'B' channel size changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2021 & _T_2033) begin
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
        if (_T_2021 & _T_2037) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel source changed within multibeat operation (connected at SystemBus.scala:41:30)\n    at Monitor.scala:381 assert (b.bits.source === source, \"'B' channel source changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2021 & _T_2037) begin
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
        if (_T_2021 & _T_2041) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel addresss changed with multibeat operation (connected at SystemBus.scala:41:30)\n    at Monitor.scala:382 assert (b.bits.address=== address,\"'B' channel addresss changed with multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2021 & _T_2041) begin
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
        if (_T_2076 & _T_2080) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel opcode changed within multibeat operation (connected at SystemBus.scala:41:30)\n    at Monitor.scala:401 assert (c.bits.opcode === opcode, \"'C' channel opcode changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2076 & _T_2080) begin
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
        if (_T_2076 & _T_2084) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel param changed within multibeat operation (connected at SystemBus.scala:41:30)\n    at Monitor.scala:402 assert (c.bits.param  === param,  \"'C' channel param changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2076 & _T_2084) begin
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
        if (_T_2076 & _T_2088) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel size changed within multibeat operation (connected at SystemBus.scala:41:30)\n    at Monitor.scala:403 assert (c.bits.size   === size,   \"'C' channel size changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2076 & _T_2088) begin
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
        if (_T_2076 & _T_2092) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel source changed within multibeat operation (connected at SystemBus.scala:41:30)\n    at Monitor.scala:404 assert (c.bits.source === source, \"'C' channel source changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2076 & _T_2092) begin
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
        if (_T_2076 & _T_2096) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel address changed with multibeat operation (connected at SystemBus.scala:41:30)\n    at Monitor.scala:405 assert (c.bits.address=== address,\"'C' channel address changed with multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2076 & _T_2096) begin
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
        if (_T_2147 & _T_2155) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel re-used a source ID (connected at SystemBus.scala:41:30)\n    at Monitor.scala:460 assert(!inflight(bundle.a.bits.source), \"'A' channel re-used a source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2147 & _T_2155) begin
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
        if (_T_2163 & _T_2170) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel acknowledged for nothing inflight (connected at SystemBus.scala:41:30)\n    at Monitor.scala:467 assert((a_set | inflight)(bundle.d.bits.source), \"'D' channel acknowledged for nothing inflight\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2163 & _T_2170) begin
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
        if (_T_2177) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' and 'D' concurrent, despite minlatency 3 (connected at SystemBus.scala:41:30)\n    at Monitor.scala:471 assert(a_set =/= d_clr || !a_set.orR, s\"'A' and 'D' concurrent, despite minlatency ${edge.manager.minLatency}\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2177) begin
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
        if (_T_2191) begin
          $fwrite(32'h80000002,"Assertion failed: TileLink timeout expired (connected at SystemBus.scala:41:30)\n    at Monitor.scala:479 assert (!inflight.orR || limit === UInt(0) || watchdog < limit, \"TileLink timeout expired\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2191) begin
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
        if (_T_2228 & _T_2235) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel re-used a sink ID (connected at SystemBus.scala:41:30)\n    at Monitor.scala:494 assert(!inflight(bundle.d.bits.sink), \"'D' channel re-used a sink ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2228 & _T_2235) begin
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
        if (_T_2238 & _T_2247) begin
          $fwrite(32'h80000002,"Assertion failed: 'E' channel acknowledged for nothing inflight (connected at SystemBus.scala:41:30)\n    at Monitor.scala:500 assert((d_set | inflight)(bundle.e.bits.sink), \"'E' channel acknowledged for nothing inflight\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2238 & _T_2247) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
