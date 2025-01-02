module TLMonitor_64( 
  input         clock, 
  input         reset, 
  input         io_in_a_ready, 
  input         io_in_a_valid, 
  input  [2:0]  io_in_a_bits_opcode, 
  input  [2:0]  io_in_a_bits_param, 
  input  [2:0]  io_in_a_bits_size, 
  input         io_in_a_bits_source, 
  input  [37:0] io_in_a_bits_address, 
  input  [7:0]  io_in_a_bits_mask, 
  input         io_in_a_bits_corrupt, 
  input         io_in_b_ready, 
  input         io_in_b_valid, 
  input  [2:0]  io_in_b_bits_opcode, 
  input  [1:0]  io_in_b_bits_param, 
  input  [2:0]  io_in_b_bits_size, 
  input         io_in_b_bits_source, 
  input  [37:0] io_in_b_bits_address, 
  input  [7:0]  io_in_b_bits_mask, 
  input         io_in_b_bits_corrupt, 
  input         io_in_c_ready, 
  input         io_in_c_valid, 
  input  [2:0]  io_in_c_bits_opcode, 
  input  [2:0]  io_in_c_bits_param, 
  input  [2:0]  io_in_c_bits_size, 
  input         io_in_c_bits_source, 
  input  [37:0] io_in_c_bits_address, 
  input         io_in_c_bits_corrupt, 
  input         io_in_d_ready, 
  input         io_in_d_valid, 
  input  [2:0]  io_in_d_bits_opcode, 
  input  [1:0]  io_in_d_bits_param, 
  input  [2:0]  io_in_d_bits_size, 
  input         io_in_d_bits_source, 
  input  [2:0]  io_in_d_bits_sink, 
  input         io_in_d_bits_denied, 
  input         io_in_d_bits_corrupt, 
  input         io_in_e_ready, 
  input         io_in_e_valid, 
  input  [2:0]  io_in_e_bits_sink 
);
  wire [31:0] plusarg_reader_out; 
  wire  _T_20; 
  wire  _T_30; 
  wire [13:0] _T_32; 
  wire [6:0] _T_33; 
  wire [6:0] _T_34; 
  wire [37:0] _GEN_33; 
  wire [37:0] _T_35; 
  wire  _T_36; 
  wire [1:0] _T_38; 
  wire [3:0] _T_39; 
  wire [2:0] _T_40; 
  wire [2:0] _T_41; 
  wire  _T_42; 
  wire  _T_43; 
  wire  _T_44; 
  wire  _T_45; 
  wire  _T_47; 
  wire  _T_48; 
  wire  _T_50; 
  wire  _T_51; 
  wire  _T_52; 
  wire  _T_53; 
  wire  _T_54; 
  wire  _T_55; 
  wire  _T_56; 
  wire  _T_57; 
  wire  _T_58; 
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
  wire  _T_71; 
  wire  _T_72; 
  wire  _T_73; 
  wire  _T_74; 
  wire  _T_75; 
  wire  _T_76; 
  wire  _T_77; 
  wire  _T_78; 
  wire  _T_79; 
  wire  _T_80; 
  wire  _T_81; 
  wire  _T_82; 
  wire  _T_83; 
  wire  _T_84; 
  wire  _T_85; 
  wire  _T_86; 
  wire  _T_87; 
  wire  _T_88; 
  wire  _T_89; 
  wire  _T_90; 
  wire  _T_91; 
  wire  _T_92; 
  wire  _T_93; 
  wire [1:0] _T_94; 
  wire [1:0] _T_95; 
  wire [3:0] _T_96; 
  wire [1:0] _T_97; 
  wire [1:0] _T_98; 
  wire [3:0] _T_99; 
  wire [7:0] _T_100; 
  wire [38:0] _T_104; 
  wire  _T_121; 
  wire [37:0] _T_126; 
  wire [38:0] _T_127; 
  wire [38:0] _T_128; 
  wire [38:0] _T_129; 
  wire  _T_130; 
  wire  _T_133; 
  wire [37:0] _T_136; 
  wire [38:0] _T_137; 
  wire [38:0] _T_138; 
  wire [38:0] _T_139; 
  wire  _T_140; 
  wire  _T_141; 
  wire [37:0] _T_143; 
  wire [38:0] _T_144; 
  wire [38:0] _T_145; 
  wire [38:0] _T_146; 
  wire  _T_147; 
  wire [37:0] _T_148; 
  wire [38:0] _T_149; 
  wire [38:0] _T_150; 
  wire [38:0] _T_151; 
  wire  _T_152; 
  wire [37:0] _T_153; 
  wire [38:0] _T_154; 
  wire [38:0] _T_155; 
  wire [38:0] _T_156; 
  wire  _T_157; 
  wire [37:0] _T_158; 
  wire [38:0] _T_159; 
  wire [38:0] _T_160; 
  wire [38:0] _T_161; 
  wire  _T_162; 
  wire [38:0] _T_165; 
  wire [38:0] _T_166; 
  wire  _T_167; 
  wire [37:0] _T_168; 
  wire [38:0] _T_169; 
  wire [38:0] _T_170; 
  wire [38:0] _T_171; 
  wire  _T_172; 
  wire [37:0] _T_173; 
  wire [38:0] _T_174; 
  wire [38:0] _T_175; 
  wire [38:0] _T_176; 
  wire  _T_177; 
  wire [37:0] _T_178; 
  wire [38:0] _T_179; 
  wire [38:0] _T_180; 
  wire [38:0] _T_181; 
  wire  _T_182; 
  wire  _T_183; 
  wire  _T_184; 
  wire  _T_185; 
  wire  _T_186; 
  wire  _T_187; 
  wire  _T_192; 
  wire  _T_195; 
  wire  _T_196; 
  wire  _T_207; 
  wire  _T_209; 
  wire  _T_215; 
  wire  _T_216; 
  wire  _T_218; 
  wire  _T_219; 
  wire  _T_222; 
  wire  _T_223; 
  wire  _T_225; 
  wire  _T_226; 
  wire  _T_227; 
  wire  _T_229; 
  wire  _T_230; 
  wire [7:0] _T_231; 
  wire  _T_232; 
  wire  _T_234; 
  wire  _T_235; 
  wire  _T_236; 
  wire  _T_238; 
  wire  _T_239; 
  wire  _T_240; 
  wire  _T_350; 
  wire  _T_352; 
  wire  _T_353; 
  wire  _T_363; 
  wire  _T_428; 
  wire  _T_429; 
  wire  _T_430; 
  wire  _T_431; 
  wire  _T_433; 
  wire  _T_435; 
  wire  _T_436; 
  wire  _T_443; 
  wire  _T_445; 
  wire  _T_446; 
  wire  _T_447; 
  wire  _T_449; 
  wire  _T_450; 
  wire  _T_455; 
  wire  _T_470; 
  wire  _T_515; 
  wire  _T_516; 
  wire  _T_517; 
  wire  _T_526; 
  wire  _T_529; 
  wire  _T_530; 
  wire  _T_545; 
  wire [7:0] _T_631; 
  wire [7:0] _T_632; 
  wire  _T_633; 
  wire  _T_635; 
  wire  _T_636; 
  wire  _T_637; 
  wire  _T_639; 
  wire  _T_676; 
  wire  _T_677; 
  wire  _T_706; 
  wire  _T_707; 
  wire  _T_714; 
  wire  _T_716; 
  wire  _T_717; 
  wire  _T_722; 
  wire  _T_799; 
  wire  _T_801; 
  wire  _T_802; 
  wire  _T_807; 
  wire  _T_876; 
  wire  _T_877; 
  wire  _T_892; 
  wire  _T_894; 
  wire  _T_895; 
  wire  _T_896; 
  wire  _T_906; 
  wire  _T_908; 
  wire  _T_910; 
  wire  _T_911; 
  wire  _T_912; 
  wire  _T_914; 
  wire  _T_915; 
  wire  _T_916; 
  wire  _T_918; 
  wire  _T_919; 
  wire  _T_920; 
  wire  _T_922; 
  wire  _T_923; 
  wire  _T_924; 
  wire  _T_926; 
  wire  _T_927; 
  wire  _T_928; 
  wire  _T_939; 
  wire  _T_941; 
  wire  _T_942; 
  wire  _T_943; 
  wire  _T_945; 
  wire  _T_946; 
  wire  _T_956; 
  wire  _T_976; 
  wire  _T_978; 
  wire  _T_979; 
  wire  _T_985; 
  wire  _T_1002; 
  wire  _T_1020; 
  wire  _T_1037; 
  wire  _T_1039; 
  wire  _T_1040; 
  wire  _T_1041; 
  wire [38:0] _T_1044; 
  wire [37:0] _T_1061; 
  wire [38:0] _T_1062; 
  wire [38:0] _T_1063; 
  wire [38:0] _T_1064; 
  wire  _T_1065; 
  wire [37:0] _T_1066; 
  wire [38:0] _T_1067; 
  wire [38:0] _T_1068; 
  wire [38:0] _T_1069; 
  wire  _T_1070; 
  wire [37:0] _T_1071; 
  wire [38:0] _T_1072; 
  wire [38:0] _T_1073; 
  wire [38:0] _T_1074; 
  wire  _T_1075; 
  wire [37:0] _T_1076; 
  wire [38:0] _T_1077; 
  wire [38:0] _T_1078; 
  wire [38:0] _T_1079; 
  wire  _T_1080; 
  wire [37:0] _T_1081; 
  wire [38:0] _T_1082; 
  wire [38:0] _T_1083; 
  wire [38:0] _T_1084; 
  wire  _T_1085; 
  wire [38:0] _T_1088; 
  wire [38:0] _T_1089; 
  wire  _T_1090; 
  wire [37:0] _T_1091; 
  wire [38:0] _T_1092; 
  wire [38:0] _T_1093; 
  wire [38:0] _T_1094; 
  wire  _T_1095; 
  wire [37:0] _T_1096; 
  wire [38:0] _T_1097; 
  wire [38:0] _T_1098; 
  wire [38:0] _T_1099; 
  wire  _T_1100; 
  wire [37:0] _T_1101; 
  wire [38:0] _T_1102; 
  wire [38:0] _T_1103; 
  wire [38:0] _T_1104; 
  wire  _T_1105; 
  wire [37:0] _T_1106; 
  wire [38:0] _T_1107; 
  wire [38:0] _T_1108; 
  wire [38:0] _T_1109; 
  wire  _T_1110; 
  wire [37:0] _T_1111; 
  wire [38:0] _T_1112; 
  wire [38:0] _T_1113; 
  wire [38:0] _T_1114; 
  wire  _T_1115; 
  wire  _T_1133; 
  wire  _T_1134; 
  wire  _T_1135; 
  wire  _T_1136; 
  wire  _T_1137; 
  wire  _T_1138; 
  wire  _T_1139; 
  wire  _T_1140; 
  wire  _T_1141; 
  wire  _T_1142; 
  wire [13:0] _T_1144; 
  wire [6:0] _T_1145; 
  wire [6:0] _T_1146; 
  wire [37:0] _GEN_34; 
  wire [37:0] _T_1147; 
  wire  _T_1148; 
  wire [1:0] _T_1150; 
  wire [3:0] _T_1151; 
  wire [2:0] _T_1152; 
  wire [2:0] _T_1153; 
  wire  _T_1154; 
  wire  _T_1155; 
  wire  _T_1156; 
  wire  _T_1157; 
  wire  _T_1159; 
  wire  _T_1160; 
  wire  _T_1162; 
  wire  _T_1163; 
  wire  _T_1164; 
  wire  _T_1165; 
  wire  _T_1166; 
  wire  _T_1167; 
  wire  _T_1168; 
  wire  _T_1169; 
  wire  _T_1170; 
  wire  _T_1171; 
  wire  _T_1172; 
  wire  _T_1173; 
  wire  _T_1174; 
  wire  _T_1175; 
  wire  _T_1176; 
  wire  _T_1177; 
  wire  _T_1178; 
  wire  _T_1179; 
  wire  _T_1180; 
  wire  _T_1181; 
  wire  _T_1182; 
  wire  _T_1183; 
  wire  _T_1184; 
  wire  _T_1185; 
  wire  _T_1186; 
  wire  _T_1187; 
  wire  _T_1188; 
  wire  _T_1189; 
  wire  _T_1190; 
  wire  _T_1191; 
  wire  _T_1192; 
  wire  _T_1193; 
  wire  _T_1194; 
  wire  _T_1195; 
  wire  _T_1196; 
  wire  _T_1197; 
  wire  _T_1198; 
  wire  _T_1199; 
  wire  _T_1200; 
  wire  _T_1201; 
  wire  _T_1202; 
  wire  _T_1203; 
  wire  _T_1204; 
  wire  _T_1205; 
  wire [1:0] _T_1206; 
  wire [1:0] _T_1207; 
  wire [3:0] _T_1208; 
  wire [1:0] _T_1209; 
  wire [1:0] _T_1210; 
  wire [3:0] _T_1211; 
  wire [7:0] _T_1212; 
  wire  _T_1229; 
  wire  _T_1230; 
  wire  _T_1241; 
  wire  _T_1243; 
  wire  _T_1249; 
  wire  _T_1250; 
  wire  _T_1252; 
  wire  _T_1253; 
  wire  _T_1255; 
  wire  _T_1256; 
  wire  _T_1258; 
  wire  _T_1259; 
  wire  _T_1260; 
  wire  _T_1262; 
  wire  _T_1263; 
  wire  _T_1264; 
  wire  _T_1266; 
  wire  _T_1267; 
  wire  _T_1268; 
  wire  _T_1270; 
  wire  _T_1271; 
  wire  _T_1272; 
  wire  _T_1275; 
  wire  _T_1285; 
  wire  _T_1287; 
  wire  _T_1288; 
  wire  _T_1297; 
  wire  _T_1318; 
  wire [7:0] _T_1335; 
  wire [7:0] _T_1336; 
  wire  _T_1337; 
  wire  _T_1339; 
  wire  _T_1340; 
  wire  _T_1341; 
  wire  _T_1362; 
  wire  _T_1383; 
  wire  _T_1408; 
  wire  _T_1418; 
  wire [13:0] _T_1420; 
  wire [6:0] _T_1421; 
  wire [6:0] _T_1422; 
  wire [37:0] _GEN_35; 
  wire [37:0] _T_1423; 
  wire  _T_1424; 
  wire [37:0] _T_1425; 
  wire [38:0] _T_1426; 
  wire [38:0] _T_1427; 
  wire [38:0] _T_1428; 
  wire  _T_1429; 
  wire [37:0] _T_1430; 
  wire [38:0] _T_1431; 
  wire [38:0] _T_1432; 
  wire [38:0] _T_1433; 
  wire  _T_1434; 
  wire [37:0] _T_1435; 
  wire [38:0] _T_1436; 
  wire [38:0] _T_1437; 
  wire [38:0] _T_1438; 
  wire  _T_1439; 
  wire [37:0] _T_1440; 
  wire [38:0] _T_1441; 
  wire [38:0] _T_1442; 
  wire [38:0] _T_1443; 
  wire  _T_1444; 
  wire [37:0] _T_1445; 
  wire [38:0] _T_1446; 
  wire [38:0] _T_1447; 
  wire [38:0] _T_1448; 
  wire  _T_1449; 
  wire [38:0] _T_1451; 
  wire [38:0] _T_1452; 
  wire [38:0] _T_1453; 
  wire  _T_1454; 
  wire [37:0] _T_1455; 
  wire [38:0] _T_1456; 
  wire [38:0] _T_1457; 
  wire [38:0] _T_1458; 
  wire  _T_1459; 
  wire [37:0] _T_1460; 
  wire [38:0] _T_1461; 
  wire [38:0] _T_1462; 
  wire [38:0] _T_1463; 
  wire  _T_1464; 
  wire [37:0] _T_1465; 
  wire [38:0] _T_1466; 
  wire [38:0] _T_1467; 
  wire [38:0] _T_1468; 
  wire  _T_1469; 
  wire [37:0] _T_1470; 
  wire [38:0] _T_1471; 
  wire [38:0] _T_1472; 
  wire [38:0] _T_1473; 
  wire  _T_1474; 
  wire [37:0] _T_1475; 
  wire [38:0] _T_1476; 
  wire [38:0] _T_1477; 
  wire [38:0] _T_1478; 
  wire  _T_1479; 
  wire  _T_1497; 
  wire  _T_1498; 
  wire  _T_1499; 
  wire  _T_1500; 
  wire  _T_1501; 
  wire  _T_1502; 
  wire  _T_1503; 
  wire  _T_1504; 
  wire  _T_1505; 
  wire  _T_1506; 
  wire  _T_1527; 
  wire  _T_1529; 
  wire  _T_1530; 
  wire  _T_1532; 
  wire  _T_1533; 
  wire  _T_1534; 
  wire  _T_1536; 
  wire  _T_1537; 
  wire  _T_1539; 
  wire  _T_1540; 
  wire  _T_1541; 
  wire  _T_1543; 
  wire  _T_1544; 
  wire  _T_1545; 
  wire  _T_1547; 
  wire  _T_1548; 
  wire  _T_1549; 
  wire  _T_1567; 
  wire  _T_1579; 
  wire  _T_1587; 
  wire  _T_1638; 
  wire  _T_1641; 
  wire  _T_1642; 
  wire  _T_1653; 
  wire  _T_1655; 
  wire  _T_1661; 
  wire  _T_1662; 
  wire  _T_1673; 
  wire  _T_1675; 
  wire  _T_1676; 
  wire  _T_1681; 
  wire  _T_1791; 
  wire  _T_1801; 
  wire  _T_1803; 
  wire  _T_1804; 
  wire  _T_1809; 
  wire  _T_1823; 
  wire  _T_1845; 
  wire [3:0] _T_1850; 
  wire  _T_1851; 
  wire  _T_1852; 
  reg [3:0] _T_1855; 
  reg [31:0] _RAND_0;
  wire [4:0] _T_1856; 
  wire [4:0] _T_1857; 
  wire [3:0] _T_1858; 
  wire  _T_1859; 
  reg [2:0] _T_1868; 
  reg [31:0] _RAND_1;
  reg [2:0] _T_1870; 
  reg [31:0] _RAND_2;
  reg [2:0] _T_1872; 
  reg [31:0] _RAND_3;
  reg  _T_1874; 
  reg [31:0] _RAND_4;
  reg [37:0] _T_1876; 
  reg [63:0] _RAND_5;
  wire  _T_1877; 
  wire  _T_1878; 
  wire  _T_1879; 
  wire  _T_1881; 
  wire  _T_1882; 
  wire  _T_1883; 
  wire  _T_1885; 
  wire  _T_1886; 
  wire  _T_1887; 
  wire  _T_1889; 
  wire  _T_1890; 
  wire  _T_1891; 
  wire  _T_1893; 
  wire  _T_1894; 
  wire  _T_1895; 
  wire  _T_1897; 
  wire  _T_1898; 
  wire  _T_1900; 
  wire  _T_1901; 
  wire [13:0] _T_1903; 
  wire [6:0] _T_1904; 
  wire [6:0] _T_1905; 
  wire [3:0] _T_1906; 
  wire  _T_1907; 
  reg [3:0] _T_1910; 
  reg [31:0] _RAND_6;
  wire [4:0] _T_1911; 
  wire [4:0] _T_1912; 
  wire [3:0] _T_1913; 
  wire  _T_1914; 
  reg [2:0] _T_1923; 
  reg [31:0] _RAND_7;
  reg [1:0] _T_1925; 
  reg [31:0] _RAND_8;
  reg [2:0] _T_1927; 
  reg [31:0] _RAND_9;
  reg  _T_1929; 
  reg [31:0] _RAND_10;
  reg [2:0] _T_1931; 
  reg [31:0] _RAND_11;
  reg  _T_1933; 
  reg [31:0] _RAND_12;
  wire  _T_1934; 
  wire  _T_1935; 
  wire  _T_1936; 
  wire  _T_1938; 
  wire  _T_1939; 
  wire  _T_1940; 
  wire  _T_1942; 
  wire  _T_1943; 
  wire  _T_1944; 
  wire  _T_1946; 
  wire  _T_1947; 
  wire  _T_1948; 
  wire  _T_1950; 
  wire  _T_1951; 
  wire  _T_1952; 
  wire  _T_1954; 
  wire  _T_1955; 
  wire  _T_1956; 
  wire  _T_1958; 
  wire  _T_1959; 
  wire  _T_1961; 
  wire  _T_1962; 
  reg [3:0] _T_1972; 
  reg [31:0] _RAND_13;
  wire [4:0] _T_1973; 
  wire [4:0] _T_1974; 
  wire [3:0] _T_1975; 
  wire  _T_1976; 
  reg [2:0] _T_1985; 
  reg [31:0] _RAND_14;
  reg [1:0] _T_1987; 
  reg [31:0] _RAND_15;
  reg [2:0] _T_1989; 
  reg [31:0] _RAND_16;
  reg  _T_1991; 
  reg [31:0] _RAND_17;
  reg [37:0] _T_1993; 
  reg [63:0] _RAND_18;
  wire  _T_1994; 
  wire  _T_1995; 
  wire  _T_1996; 
  wire  _T_1998; 
  wire  _T_1999; 
  wire  _T_2000; 
  wire  _T_2002; 
  wire  _T_2003; 
  wire  _T_2004; 
  wire  _T_2006; 
  wire  _T_2007; 
  wire  _T_2008; 
  wire  _T_2010; 
  wire  _T_2011; 
  wire  _T_2012; 
  wire  _T_2014; 
  wire  _T_2015; 
  wire  _T_2017; 
  wire  _T_2018; 
  wire [3:0] _T_2023; 
  wire  _T_2024; 
  reg [3:0] _T_2027; 
  reg [31:0] _RAND_19;
  wire [4:0] _T_2028; 
  wire [4:0] _T_2029; 
  wire [3:0] _T_2030; 
  wire  _T_2031; 
  reg [2:0] _T_2040; 
  reg [31:0] _RAND_20;
  reg [2:0] _T_2042; 
  reg [31:0] _RAND_21;
  reg [2:0] _T_2044; 
  reg [31:0] _RAND_22;
  reg  _T_2046; 
  reg [31:0] _RAND_23;
  reg [37:0] _T_2048; 
  reg [63:0] _RAND_24;
  wire  _T_2049; 
  wire  _T_2050; 
  wire  _T_2051; 
  wire  _T_2053; 
  wire  _T_2054; 
  wire  _T_2055; 
  wire  _T_2057; 
  wire  _T_2058; 
  wire  _T_2059; 
  wire  _T_2061; 
  wire  _T_2062; 
  wire  _T_2063; 
  wire  _T_2065; 
  wire  _T_2066; 
  wire  _T_2067; 
  wire  _T_2069; 
  wire  _T_2070; 
  wire  _T_2072; 
  reg [1:0] _T_2074; 
  reg [31:0] _RAND_25;
  reg [3:0] _T_2085; 
  reg [31:0] _RAND_26;
  wire [4:0] _T_2086; 
  wire [4:0] _T_2087; 
  wire [3:0] _T_2088; 
  wire  _T_2089; 
  reg [3:0] _T_2106; 
  reg [31:0] _RAND_27;
  wire [4:0] _T_2107; 
  wire [4:0] _T_2108; 
  wire [3:0] _T_2109; 
  wire  _T_2110; 
  wire  _T_2121; 
  wire [1:0] _T_2123; 
  wire [1:0] _T_2124; 
  wire  _T_2125; 
  wire  _T_2126; 
  wire  _T_2128; 
  wire  _T_2129; 
  wire [1:0] _GEN_27; 
  wire  _T_2134; 
  wire  _T_2136; 
  wire  _T_2137; 
  wire [1:0] _T_2138; 
  wire [1:0] _T_2139; 
  wire [1:0] _T_2140; 
  wire  _T_2141; 
  wire  _T_2143; 
  wire  _T_2144; 
  wire [1:0] _GEN_28; 
  wire  _T_2145; 
  wire  _T_2146; 
  wire  _T_2147; 
  wire  _T_2148; 
  wire  _T_2150; 
  wire  _T_2151; 
  wire [1:0] _T_2152; 
  wire [1:0] _T_2153; 
  wire [1:0] _T_2154; 
  reg [31:0] _T_2156; 
  reg [31:0] _RAND_28;
  wire  _T_2157; 
  wire  _T_2158; 
  wire  _T_2159; 
  wire  _T_2160; 
  wire  _T_2161; 
  wire  _T_2162; 
  wire  _T_2164; 
  wire  _T_2165; 
  wire [31:0] _T_2167; 
  wire  _T_2170; 
  reg [7:0] _T_2172; 
  reg [31:0] _RAND_29;
  reg [3:0] _T_2182; 
  reg [31:0] _RAND_30;
  wire [4:0] _T_2183; 
  wire [4:0] _T_2184; 
  wire [3:0] _T_2185; 
  wire  _T_2186; 
  wire  _T_2197; 
  wire  _T_2198; 
  wire  _T_2199; 
  wire  _T_2200; 
  wire  _T_2201; 
  wire  _T_2202; 
  wire [7:0] _T_2203; 
  wire [7:0] _T_2204; 
  wire  _T_2205; 
  wire  _T_2206; 
  wire  _T_2208; 
  wire  _T_2209; 
  wire [7:0] _GEN_31; 
  wire  _T_2212; 
  wire [7:0] _T_2215; 
  wire [7:0] _T_2216; 
  wire [7:0] _T_2217; 
  wire  _T_2218; 
  wire  _T_2220; 
  wire  _T_2221; 
  wire [7:0] _GEN_32; 
  wire [7:0] _T_2222; 
  wire [7:0] _T_2223; 
  wire [7:0] _T_2224; 
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
  wire  _GEN_194; 
  wire  _GEN_208; 
  wire  _GEN_220; 
  wire  _GEN_232; 
  wire  _GEN_242; 
  wire  _GEN_252; 
  wire  _GEN_264; 
  wire  _GEN_276; 
  wire  _GEN_286; 
  wire  _GEN_300; 
  wire  _GEN_312; 
  wire  _GEN_322; 
  wire  _GEN_330; 
  plusarg_reader #(.FORMAT("tilelink_timeout=%d"), .DEFAULT(0)) plusarg_reader ( 
    .out(plusarg_reader_out)
  );
  assign _T_20 = io_in_a_bits_source == 1'h0; 
  assign _T_30 = _T_20 | io_in_a_bits_source; 
  assign _T_32 = 14'h7f << io_in_a_bits_size; 
  assign _T_33 = _T_32[6:0]; 
  assign _T_34 = ~ _T_33; 
  assign _GEN_33 = {{31'd0}, _T_34}; 
  assign _T_35 = io_in_a_bits_address & _GEN_33; 
  assign _T_36 = _T_35 == 38'h0; 
  assign _T_38 = io_in_a_bits_size[1:0]; 
  assign _T_39 = 4'h1 << _T_38; 
  assign _T_40 = _T_39[2:0]; 
  assign _T_41 = _T_40 | 3'h1; 
  assign _T_42 = io_in_a_bits_size >= 3'h3; 
  assign _T_43 = _T_41[2]; 
  assign _T_44 = io_in_a_bits_address[2]; 
  assign _T_45 = _T_44 == 1'h0; 
  assign _T_47 = _T_43 & _T_45; 
  assign _T_48 = _T_42 | _T_47; 
  assign _T_50 = _T_43 & _T_44; 
  assign _T_51 = _T_42 | _T_50; 
  assign _T_52 = _T_41[1]; 
  assign _T_53 = io_in_a_bits_address[1]; 
  assign _T_54 = _T_53 == 1'h0; 
  assign _T_55 = _T_45 & _T_54; 
  assign _T_56 = _T_52 & _T_55; 
  assign _T_57 = _T_48 | _T_56; 
  assign _T_58 = _T_45 & _T_53; 
  assign _T_59 = _T_52 & _T_58; 
  assign _T_60 = _T_48 | _T_59; 
  assign _T_61 = _T_44 & _T_54; 
  assign _T_62 = _T_52 & _T_61; 
  assign _T_63 = _T_51 | _T_62; 
  assign _T_64 = _T_44 & _T_53; 
  assign _T_65 = _T_52 & _T_64; 
  assign _T_66 = _T_51 | _T_65; 
  assign _T_67 = _T_41[0]; 
  assign _T_68 = io_in_a_bits_address[0]; 
  assign _T_69 = _T_68 == 1'h0; 
  assign _T_70 = _T_55 & _T_69; 
  assign _T_71 = _T_67 & _T_70; 
  assign _T_72 = _T_57 | _T_71; 
  assign _T_73 = _T_55 & _T_68; 
  assign _T_74 = _T_67 & _T_73; 
  assign _T_75 = _T_57 | _T_74; 
  assign _T_76 = _T_58 & _T_69; 
  assign _T_77 = _T_67 & _T_76; 
  assign _T_78 = _T_60 | _T_77; 
  assign _T_79 = _T_58 & _T_68; 
  assign _T_80 = _T_67 & _T_79; 
  assign _T_81 = _T_60 | _T_80; 
  assign _T_82 = _T_61 & _T_69; 
  assign _T_83 = _T_67 & _T_82; 
  assign _T_84 = _T_63 | _T_83; 
  assign _T_85 = _T_61 & _T_68; 
  assign _T_86 = _T_67 & _T_85; 
  assign _T_87 = _T_63 | _T_86; 
  assign _T_88 = _T_64 & _T_69; 
  assign _T_89 = _T_67 & _T_88; 
  assign _T_90 = _T_66 | _T_89; 
  assign _T_91 = _T_64 & _T_68; 
  assign _T_92 = _T_67 & _T_91; 
  assign _T_93 = _T_66 | _T_92; 
  assign _T_94 = {_T_75,_T_72}; 
  assign _T_95 = {_T_81,_T_78}; 
  assign _T_96 = {_T_95,_T_94}; 
  assign _T_97 = {_T_87,_T_84}; 
  assign _T_98 = {_T_93,_T_90}; 
  assign _T_99 = {_T_98,_T_97}; 
  assign _T_100 = {_T_99,_T_96}; 
  assign _T_104 = {1'b0,$signed(io_in_a_bits_address)}; 
  assign _T_121 = io_in_a_bits_opcode == 3'h6; 
  assign _T_126 = io_in_a_bits_address ^ 38'h3000; 
  assign _T_127 = {1'b0,$signed(_T_126)}; 
  assign _T_128 = $signed(_T_127) & $signed(-39'sh1000); 
  assign _T_129 = $signed(_T_128); 
  assign _T_130 = $signed(_T_129) == $signed(39'sh0); 
  assign _T_133 = io_in_a_bits_size <= 3'h6; 
  assign _T_136 = io_in_a_bits_address ^ 38'h80000000; 
  assign _T_137 = {1'b0,$signed(_T_136)}; 
  assign _T_138 = $signed(_T_137) & $signed(-39'sh40000000); 
  assign _T_139 = $signed(_T_138); 
  assign _T_140 = $signed(_T_139) == $signed(39'sh0); 
  assign _T_141 = _T_133 & _T_140; 
  assign _T_143 = io_in_a_bits_address ^ 38'h64000000; 
  assign _T_144 = {1'b0,$signed(_T_143)}; 
  assign _T_145 = $signed(_T_144) & $signed(-39'sh2000); 
  assign _T_146 = $signed(_T_145); 
  assign _T_147 = $signed(_T_146) == $signed(39'sh0); 
  assign _T_148 = io_in_a_bits_address ^ 38'h64002000; 
  assign _T_149 = {1'b0,$signed(_T_148)}; 
  assign _T_150 = $signed(_T_149) & $signed(-39'sh1000); 
  assign _T_151 = $signed(_T_150); 
  assign _T_152 = $signed(_T_151) == $signed(39'sh0); 
  assign _T_153 = io_in_a_bits_address ^ 38'hc000000; 
  assign _T_154 = {1'b0,$signed(_T_153)}; 
  assign _T_155 = $signed(_T_154) & $signed(-39'sh4000000); 
  assign _T_156 = $signed(_T_155); 
  assign _T_157 = $signed(_T_156) == $signed(39'sh0); 
  assign _T_158 = io_in_a_bits_address ^ 38'h2000000; 
  assign _T_159 = {1'b0,$signed(_T_158)}; 
  assign _T_160 = $signed(_T_159) & $signed(-39'sh10000); 
  assign _T_161 = $signed(_T_160); 
  assign _T_162 = $signed(_T_161) == $signed(39'sh0); 
  assign _T_165 = $signed(_T_104) & $signed(-39'sh1000); 
  assign _T_166 = $signed(_T_165); 
  assign _T_167 = $signed(_T_166) == $signed(39'sh0); 
  assign _T_168 = io_in_a_bits_address ^ 38'h10000; 
  assign _T_169 = {1'b0,$signed(_T_168)}; 
  assign _T_170 = $signed(_T_169) & $signed(-39'sh2000); 
  assign _T_171 = $signed(_T_170); 
  assign _T_172 = $signed(_T_171) == $signed(39'sh0); 
  assign _T_173 = io_in_a_bits_address ^ 38'h40000000; 
  assign _T_174 = {1'b0,$signed(_T_173)}; 
  assign _T_175 = $signed(_T_174) & $signed(-39'sh20000000); 
  assign _T_176 = $signed(_T_175); 
  assign _T_177 = $signed(_T_176) == $signed(39'sh0); 
  assign _T_178 = io_in_a_bits_address ^ 38'h2000000000; 
  assign _T_179 = {1'b0,$signed(_T_178)}; 
  assign _T_180 = $signed(_T_179) & $signed(-39'sh4000000); 
  assign _T_181 = $signed(_T_180); 
  assign _T_182 = $signed(_T_181) == $signed(39'sh0); 
  assign _T_183 = _T_147 | _T_152; 
  assign _T_184 = _T_183 | _T_157; 
  assign _T_185 = _T_184 | _T_162; 
  assign _T_186 = _T_185 | _T_167; 
  assign _T_187 = _T_186 | _T_172; 
  assign _T_192 = _T_130 | _T_141; 
  assign _T_195 = _T_192 | reset; 
  assign _T_196 = _T_195 == 1'h0; 
  assign _T_207 = 3'h6 == io_in_a_bits_size; 
  assign _T_209 = _T_20 ? _T_207 : 1'h0; 
  assign _T_215 = _T_209 | reset; 
  assign _T_216 = _T_215 == 1'h0; 
  assign _T_218 = _T_30 | reset; 
  assign _T_219 = _T_218 == 1'h0; 
  assign _T_222 = _T_42 | reset; 
  assign _T_223 = _T_222 == 1'h0; 
  assign _T_225 = _T_36 | reset; 
  assign _T_226 = _T_225 == 1'h0; 
  assign _T_227 = io_in_a_bits_param <= 3'h2; 
  assign _T_229 = _T_227 | reset; 
  assign _T_230 = _T_229 == 1'h0; 
  assign _T_231 = ~ io_in_a_bits_mask; 
  assign _T_232 = _T_231 == 8'h0; 
  assign _T_234 = _T_232 | reset; 
  assign _T_235 = _T_234 == 1'h0; 
  assign _T_236 = io_in_a_bits_corrupt == 1'h0; 
  assign _T_238 = _T_236 | reset; 
  assign _T_239 = _T_238 == 1'h0; 
  assign _T_240 = io_in_a_bits_opcode == 3'h7; 
  assign _T_350 = io_in_a_bits_param != 3'h0; 
  assign _T_352 = _T_350 | reset; 
  assign _T_353 = _T_352 == 1'h0; 
  assign _T_363 = io_in_a_bits_opcode == 3'h4; 
  assign _T_428 = _T_187 | _T_140; 
  assign _T_429 = _T_428 | _T_177; 
  assign _T_430 = _T_429 | _T_182; 
  assign _T_431 = _T_133 & _T_430; 
  assign _T_433 = _T_130 | _T_431; 
  assign _T_435 = _T_433 | reset; 
  assign _T_436 = _T_435 == 1'h0; 
  assign _T_443 = io_in_a_bits_param == 3'h0; 
  assign _T_445 = _T_443 | reset; 
  assign _T_446 = _T_445 == 1'h0; 
  assign _T_447 = io_in_a_bits_mask == _T_100; 
  assign _T_449 = _T_447 | reset; 
  assign _T_450 = _T_449 == 1'h0; 
  assign _T_455 = io_in_a_bits_opcode == 3'h0; 
  assign _T_470 = _T_130 | _T_177; 
  assign _T_515 = _T_186 | _T_140; 
  assign _T_516 = _T_515 | _T_182; 
  assign _T_517 = _T_133 & _T_516; 
  assign _T_526 = _T_470 | _T_517; 
  assign _T_529 = _T_526 | reset; 
  assign _T_530 = _T_529 == 1'h0; 
  assign _T_545 = io_in_a_bits_opcode == 3'h1; 
  assign _T_631 = ~ _T_100; 
  assign _T_632 = io_in_a_bits_mask & _T_631; 
  assign _T_633 = _T_632 == 8'h0; 
  assign _T_635 = _T_633 | reset; 
  assign _T_636 = _T_635 == 1'h0; 
  assign _T_637 = io_in_a_bits_opcode == 3'h2; 
  assign _T_639 = io_in_a_bits_size <= 3'h3; 
  assign _T_676 = _T_186 | _T_130; 
  assign _T_677 = _T_639 & _T_676; 
  assign _T_706 = _T_677 | reset; 
  assign _T_707 = _T_706 == 1'h0; 
  assign _T_714 = io_in_a_bits_param <= 3'h4; 
  assign _T_716 = _T_714 | reset; 
  assign _T_717 = _T_716 == 1'h0; 
  assign _T_722 = io_in_a_bits_opcode == 3'h3; 
  assign _T_799 = io_in_a_bits_param <= 3'h3; 
  assign _T_801 = _T_799 | reset; 
  assign _T_802 = _T_801 == 1'h0; 
  assign _T_807 = io_in_a_bits_opcode == 3'h5; 
  assign _T_876 = _T_130 | reset; 
  assign _T_877 = _T_876 == 1'h0; 
  assign _T_892 = io_in_d_bits_opcode <= 3'h6; 
  assign _T_894 = _T_892 | reset; 
  assign _T_895 = _T_894 == 1'h0; 
  assign _T_896 = io_in_d_bits_source == 1'h0; 
  assign _T_906 = _T_896 | io_in_d_bits_source; 
  assign _T_908 = io_in_d_bits_opcode == 3'h6; 
  assign _T_910 = _T_906 | reset; 
  assign _T_911 = _T_910 == 1'h0; 
  assign _T_912 = io_in_d_bits_size >= 3'h3; 
  assign _T_914 = _T_912 | reset; 
  assign _T_915 = _T_914 == 1'h0; 
  assign _T_916 = io_in_d_bits_param == 2'h0; 
  assign _T_918 = _T_916 | reset; 
  assign _T_919 = _T_918 == 1'h0; 
  assign _T_920 = io_in_d_bits_corrupt == 1'h0; 
  assign _T_922 = _T_920 | reset; 
  assign _T_923 = _T_922 == 1'h0; 
  assign _T_924 = io_in_d_bits_denied == 1'h0; 
  assign _T_926 = _T_924 | reset; 
  assign _T_927 = _T_926 == 1'h0; 
  assign _T_928 = io_in_d_bits_opcode == 3'h4; 
  assign _T_939 = io_in_d_bits_param <= 2'h2; 
  assign _T_941 = _T_939 | reset; 
  assign _T_942 = _T_941 == 1'h0; 
  assign _T_943 = io_in_d_bits_param != 2'h2; 
  assign _T_945 = _T_943 | reset; 
  assign _T_946 = _T_945 == 1'h0; 
  assign _T_956 = io_in_d_bits_opcode == 3'h5; 
  assign _T_976 = _T_924 | io_in_d_bits_corrupt; 
  assign _T_978 = _T_976 | reset; 
  assign _T_979 = _T_978 == 1'h0; 
  assign _T_985 = io_in_d_bits_opcode == 3'h0; 
  assign _T_1002 = io_in_d_bits_opcode == 3'h1; 
  assign _T_1020 = io_in_d_bits_opcode == 3'h2; 
  assign _T_1037 = io_in_b_bits_opcode <= 3'h6; 
  assign _T_1039 = _T_1037 | reset; 
  assign _T_1040 = _T_1039 == 1'h0; 
  assign _T_1041 = io_in_b_bits_source == 1'h0; 
  assign _T_1044 = {1'b0,$signed(io_in_b_bits_address)}; 
  assign _T_1061 = io_in_b_bits_address ^ 38'h64000000; 
  assign _T_1062 = {1'b0,$signed(_T_1061)}; 
  assign _T_1063 = $signed(_T_1062) & $signed(-39'sh1000); 
  assign _T_1064 = $signed(_T_1063); 
  assign _T_1065 = $signed(_T_1064) == $signed(39'sh0); 
  assign _T_1066 = io_in_b_bits_address ^ 38'h64001000; 
  assign _T_1067 = {1'b0,$signed(_T_1066)}; 
  assign _T_1068 = $signed(_T_1067) & $signed(-39'sh1000); 
  assign _T_1069 = $signed(_T_1068); 
  assign _T_1070 = $signed(_T_1069) == $signed(39'sh0); 
  assign _T_1071 = io_in_b_bits_address ^ 38'h64002000; 
  assign _T_1072 = {1'b0,$signed(_T_1071)}; 
  assign _T_1073 = $signed(_T_1072) & $signed(-39'sh1000); 
  assign _T_1074 = $signed(_T_1073); 
  assign _T_1075 = $signed(_T_1074) == $signed(39'sh0); 
  assign _T_1076 = io_in_b_bits_address ^ 38'hc000000; 
  assign _T_1077 = {1'b0,$signed(_T_1076)}; 
  assign _T_1078 = $signed(_T_1077) & $signed(-39'sh4000000); 
  assign _T_1079 = $signed(_T_1078); 
  assign _T_1080 = $signed(_T_1079) == $signed(39'sh0); 
  assign _T_1081 = io_in_b_bits_address ^ 38'h2000000; 
  assign _T_1082 = {1'b0,$signed(_T_1081)}; 
  assign _T_1083 = $signed(_T_1082) & $signed(-39'sh10000); 
  assign _T_1084 = $signed(_T_1083); 
  assign _T_1085 = $signed(_T_1084) == $signed(39'sh0); 
  assign _T_1088 = $signed(_T_1044) & $signed(-39'sh1000); 
  assign _T_1089 = $signed(_T_1088); 
  assign _T_1090 = $signed(_T_1089) == $signed(39'sh0); 
  assign _T_1091 = io_in_b_bits_address ^ 38'h10000; 
  assign _T_1092 = {1'b0,$signed(_T_1091)}; 
  assign _T_1093 = $signed(_T_1092) & $signed(-39'sh2000); 
  assign _T_1094 = $signed(_T_1093); 
  assign _T_1095 = $signed(_T_1094) == $signed(39'sh0); 
  assign _T_1096 = io_in_b_bits_address ^ 38'h3000; 
  assign _T_1097 = {1'b0,$signed(_T_1096)}; 
  assign _T_1098 = $signed(_T_1097) & $signed(-39'sh1000); 
  assign _T_1099 = $signed(_T_1098); 
  assign _T_1100 = $signed(_T_1099) == $signed(39'sh0); 
  assign _T_1101 = io_in_b_bits_address ^ 38'h80000000; 
  assign _T_1102 = {1'b0,$signed(_T_1101)}; 
  assign _T_1103 = $signed(_T_1102) & $signed(-39'sh40000000); 
  assign _T_1104 = $signed(_T_1103); 
  assign _T_1105 = $signed(_T_1104) == $signed(39'sh0); 
  assign _T_1106 = io_in_b_bits_address ^ 38'h40000000; 
  assign _T_1107 = {1'b0,$signed(_T_1106)}; 
  assign _T_1108 = $signed(_T_1107) & $signed(-39'sh20000000); 
  assign _T_1109 = $signed(_T_1108); 
  assign _T_1110 = $signed(_T_1109) == $signed(39'sh0); 
  assign _T_1111 = io_in_b_bits_address ^ 38'h2000000000; 
  assign _T_1112 = {1'b0,$signed(_T_1111)}; 
  assign _T_1113 = $signed(_T_1112) & $signed(-39'sh4000000); 
  assign _T_1114 = $signed(_T_1113); 
  assign _T_1115 = $signed(_T_1114) == $signed(39'sh0); 
  assign _T_1133 = _T_1065 | _T_1070; 
  assign _T_1134 = _T_1133 | _T_1075; 
  assign _T_1135 = _T_1134 | _T_1080; 
  assign _T_1136 = _T_1135 | _T_1085; 
  assign _T_1137 = _T_1136 | _T_1090; 
  assign _T_1138 = _T_1137 | _T_1095; 
  assign _T_1139 = _T_1138 | _T_1100; 
  assign _T_1140 = _T_1139 | _T_1105; 
  assign _T_1141 = _T_1140 | _T_1110; 
  assign _T_1142 = _T_1141 | _T_1115; 
  assign _T_1144 = 14'h7f << io_in_b_bits_size; 
  assign _T_1145 = _T_1144[6:0]; 
  assign _T_1146 = ~ _T_1145; 
  assign _GEN_34 = {{31'd0}, _T_1146}; 
  assign _T_1147 = io_in_b_bits_address & _GEN_34; 
  assign _T_1148 = _T_1147 == 38'h0; 
  assign _T_1150 = io_in_b_bits_size[1:0]; 
  assign _T_1151 = 4'h1 << _T_1150; 
  assign _T_1152 = _T_1151[2:0]; 
  assign _T_1153 = _T_1152 | 3'h1; 
  assign _T_1154 = io_in_b_bits_size >= 3'h3; 
  assign _T_1155 = _T_1153[2]; 
  assign _T_1156 = io_in_b_bits_address[2]; 
  assign _T_1157 = _T_1156 == 1'h0; 
  assign _T_1159 = _T_1155 & _T_1157; 
  assign _T_1160 = _T_1154 | _T_1159; 
  assign _T_1162 = _T_1155 & _T_1156; 
  assign _T_1163 = _T_1154 | _T_1162; 
  assign _T_1164 = _T_1153[1]; 
  assign _T_1165 = io_in_b_bits_address[1]; 
  assign _T_1166 = _T_1165 == 1'h0; 
  assign _T_1167 = _T_1157 & _T_1166; 
  assign _T_1168 = _T_1164 & _T_1167; 
  assign _T_1169 = _T_1160 | _T_1168; 
  assign _T_1170 = _T_1157 & _T_1165; 
  assign _T_1171 = _T_1164 & _T_1170; 
  assign _T_1172 = _T_1160 | _T_1171; 
  assign _T_1173 = _T_1156 & _T_1166; 
  assign _T_1174 = _T_1164 & _T_1173; 
  assign _T_1175 = _T_1163 | _T_1174; 
  assign _T_1176 = _T_1156 & _T_1165; 
  assign _T_1177 = _T_1164 & _T_1176; 
  assign _T_1178 = _T_1163 | _T_1177; 
  assign _T_1179 = _T_1153[0]; 
  assign _T_1180 = io_in_b_bits_address[0]; 
  assign _T_1181 = _T_1180 == 1'h0; 
  assign _T_1182 = _T_1167 & _T_1181; 
  assign _T_1183 = _T_1179 & _T_1182; 
  assign _T_1184 = _T_1169 | _T_1183; 
  assign _T_1185 = _T_1167 & _T_1180; 
  assign _T_1186 = _T_1179 & _T_1185; 
  assign _T_1187 = _T_1169 | _T_1186; 
  assign _T_1188 = _T_1170 & _T_1181; 
  assign _T_1189 = _T_1179 & _T_1188; 
  assign _T_1190 = _T_1172 | _T_1189; 
  assign _T_1191 = _T_1170 & _T_1180; 
  assign _T_1192 = _T_1179 & _T_1191; 
  assign _T_1193 = _T_1172 | _T_1192; 
  assign _T_1194 = _T_1173 & _T_1181; 
  assign _T_1195 = _T_1179 & _T_1194; 
  assign _T_1196 = _T_1175 | _T_1195; 
  assign _T_1197 = _T_1173 & _T_1180; 
  assign _T_1198 = _T_1179 & _T_1197; 
  assign _T_1199 = _T_1175 | _T_1198; 
  assign _T_1200 = _T_1176 & _T_1181; 
  assign _T_1201 = _T_1179 & _T_1200; 
  assign _T_1202 = _T_1178 | _T_1201; 
  assign _T_1203 = _T_1176 & _T_1180; 
  assign _T_1204 = _T_1179 & _T_1203; 
  assign _T_1205 = _T_1178 | _T_1204; 
  assign _T_1206 = {_T_1187,_T_1184}; 
  assign _T_1207 = {_T_1193,_T_1190}; 
  assign _T_1208 = {_T_1207,_T_1206}; 
  assign _T_1209 = {_T_1199,_T_1196}; 
  assign _T_1210 = {_T_1205,_T_1202}; 
  assign _T_1211 = {_T_1210,_T_1209}; 
  assign _T_1212 = {_T_1211,_T_1208}; 
  assign _T_1229 = io_in_b_bits_source == io_in_b_bits_source; 
  assign _T_1230 = io_in_b_bits_opcode == 3'h6; 
  assign _T_1241 = 3'h6 == io_in_b_bits_size; 
  assign _T_1243 = _T_1041 ? _T_1241 : 1'h0; 
  assign _T_1249 = _T_1243 | reset; 
  assign _T_1250 = _T_1249 == 1'h0; 
  assign _T_1252 = _T_1142 | reset; 
  assign _T_1253 = _T_1252 == 1'h0; 
  assign _T_1255 = _T_1229 | reset; 
  assign _T_1256 = _T_1255 == 1'h0; 
  assign _T_1258 = _T_1148 | reset; 
  assign _T_1259 = _T_1258 == 1'h0; 
  assign _T_1260 = io_in_b_bits_param <= 2'h2; 
  assign _T_1262 = _T_1260 | reset; 
  assign _T_1263 = _T_1262 == 1'h0; 
  assign _T_1264 = io_in_b_bits_mask == _T_1212; 
  assign _T_1266 = _T_1264 | reset; 
  assign _T_1267 = _T_1266 == 1'h0; 
  assign _T_1268 = io_in_b_bits_corrupt == 1'h0; 
  assign _T_1270 = _T_1268 | reset; 
  assign _T_1271 = _T_1270 == 1'h0; 
  assign _T_1272 = io_in_b_bits_opcode == 3'h4; 
  assign _T_1275 = reset == 1'h0; 
  assign _T_1285 = io_in_b_bits_param == 2'h0; 
  assign _T_1287 = _T_1285 | reset; 
  assign _T_1288 = _T_1287 == 1'h0; 
  assign _T_1297 = io_in_b_bits_opcode == 3'h0; 
  assign _T_1318 = io_in_b_bits_opcode == 3'h1; 
  assign _T_1335 = ~ _T_1212; 
  assign _T_1336 = io_in_b_bits_mask & _T_1335; 
  assign _T_1337 = _T_1336 == 8'h0; 
  assign _T_1339 = _T_1337 | reset; 
  assign _T_1340 = _T_1339 == 1'h0; 
  assign _T_1341 = io_in_b_bits_opcode == 3'h2; 
  assign _T_1362 = io_in_b_bits_opcode == 3'h3; 
  assign _T_1383 = io_in_b_bits_opcode == 3'h5; 
  assign _T_1408 = io_in_c_bits_source == 1'h0; 
  assign _T_1418 = _T_1408 | io_in_c_bits_source; 
  assign _T_1420 = 14'h7f << io_in_c_bits_size; 
  assign _T_1421 = _T_1420[6:0]; 
  assign _T_1422 = ~ _T_1421; 
  assign _GEN_35 = {{31'd0}, _T_1422}; 
  assign _T_1423 = io_in_c_bits_address & _GEN_35; 
  assign _T_1424 = _T_1423 == 38'h0; 
  assign _T_1425 = io_in_c_bits_address ^ 38'h64000000; 
  assign _T_1426 = {1'b0,$signed(_T_1425)}; 
  assign _T_1427 = $signed(_T_1426) & $signed(-39'sh1000); 
  assign _T_1428 = $signed(_T_1427); 
  assign _T_1429 = $signed(_T_1428) == $signed(39'sh0); 
  assign _T_1430 = io_in_c_bits_address ^ 38'h64001000; 
  assign _T_1431 = {1'b0,$signed(_T_1430)}; 
  assign _T_1432 = $signed(_T_1431) & $signed(-39'sh1000); 
  assign _T_1433 = $signed(_T_1432); 
  assign _T_1434 = $signed(_T_1433) == $signed(39'sh0); 
  assign _T_1435 = io_in_c_bits_address ^ 38'h64002000; 
  assign _T_1436 = {1'b0,$signed(_T_1435)}; 
  assign _T_1437 = $signed(_T_1436) & $signed(-39'sh1000); 
  assign _T_1438 = $signed(_T_1437); 
  assign _T_1439 = $signed(_T_1438) == $signed(39'sh0); 
  assign _T_1440 = io_in_c_bits_address ^ 38'hc000000; 
  assign _T_1441 = {1'b0,$signed(_T_1440)}; 
  assign _T_1442 = $signed(_T_1441) & $signed(-39'sh4000000); 
  assign _T_1443 = $signed(_T_1442); 
  assign _T_1444 = $signed(_T_1443) == $signed(39'sh0); 
  assign _T_1445 = io_in_c_bits_address ^ 38'h2000000; 
  assign _T_1446 = {1'b0,$signed(_T_1445)}; 
  assign _T_1447 = $signed(_T_1446) & $signed(-39'sh10000); 
  assign _T_1448 = $signed(_T_1447); 
  assign _T_1449 = $signed(_T_1448) == $signed(39'sh0); 
  assign _T_1451 = {1'b0,$signed(io_in_c_bits_address)}; 
  assign _T_1452 = $signed(_T_1451) & $signed(-39'sh1000); 
  assign _T_1453 = $signed(_T_1452); 
  assign _T_1454 = $signed(_T_1453) == $signed(39'sh0); 
  assign _T_1455 = io_in_c_bits_address ^ 38'h10000; 
  assign _T_1456 = {1'b0,$signed(_T_1455)}; 
  assign _T_1457 = $signed(_T_1456) & $signed(-39'sh2000); 
  assign _T_1458 = $signed(_T_1457); 
  assign _T_1459 = $signed(_T_1458) == $signed(39'sh0); 
  assign _T_1460 = io_in_c_bits_address ^ 38'h3000; 
  assign _T_1461 = {1'b0,$signed(_T_1460)}; 
  assign _T_1462 = $signed(_T_1461) & $signed(-39'sh1000); 
  assign _T_1463 = $signed(_T_1462); 
  assign _T_1464 = $signed(_T_1463) == $signed(39'sh0); 
  assign _T_1465 = io_in_c_bits_address ^ 38'h80000000; 
  assign _T_1466 = {1'b0,$signed(_T_1465)}; 
  assign _T_1467 = $signed(_T_1466) & $signed(-39'sh40000000); 
  assign _T_1468 = $signed(_T_1467); 
  assign _T_1469 = $signed(_T_1468) == $signed(39'sh0); 
  assign _T_1470 = io_in_c_bits_address ^ 38'h40000000; 
  assign _T_1471 = {1'b0,$signed(_T_1470)}; 
  assign _T_1472 = $signed(_T_1471) & $signed(-39'sh20000000); 
  assign _T_1473 = $signed(_T_1472); 
  assign _T_1474 = $signed(_T_1473) == $signed(39'sh0); 
  assign _T_1475 = io_in_c_bits_address ^ 38'h2000000000; 
  assign _T_1476 = {1'b0,$signed(_T_1475)}; 
  assign _T_1477 = $signed(_T_1476) & $signed(-39'sh4000000); 
  assign _T_1478 = $signed(_T_1477); 
  assign _T_1479 = $signed(_T_1478) == $signed(39'sh0); 
  assign _T_1497 = _T_1429 | _T_1434; 
  assign _T_1498 = _T_1497 | _T_1439; 
  assign _T_1499 = _T_1498 | _T_1444; 
  assign _T_1500 = _T_1499 | _T_1449; 
  assign _T_1501 = _T_1500 | _T_1454; 
  assign _T_1502 = _T_1501 | _T_1459; 
  assign _T_1503 = _T_1502 | _T_1464; 
  assign _T_1504 = _T_1503 | _T_1469; 
  assign _T_1505 = _T_1504 | _T_1474; 
  assign _T_1506 = _T_1505 | _T_1479; 
  assign _T_1527 = io_in_c_bits_opcode == 3'h4; 
  assign _T_1529 = _T_1506 | reset; 
  assign _T_1530 = _T_1529 == 1'h0; 
  assign _T_1532 = _T_1418 | reset; 
  assign _T_1533 = _T_1532 == 1'h0; 
  assign _T_1534 = io_in_c_bits_size >= 3'h3; 
  assign _T_1536 = _T_1534 | reset; 
  assign _T_1537 = _T_1536 == 1'h0; 
  assign _T_1539 = _T_1424 | reset; 
  assign _T_1540 = _T_1539 == 1'h0; 
  assign _T_1541 = io_in_c_bits_param <= 3'h5; 
  assign _T_1543 = _T_1541 | reset; 
  assign _T_1544 = _T_1543 == 1'h0; 
  assign _T_1545 = io_in_c_bits_corrupt == 1'h0; 
  assign _T_1547 = _T_1545 | reset; 
  assign _T_1548 = _T_1547 == 1'h0; 
  assign _T_1549 = io_in_c_bits_opcode == 3'h5; 
  assign _T_1567 = io_in_c_bits_opcode == 3'h6; 
  assign _T_1579 = io_in_c_bits_size <= 3'h6; 
  assign _T_1587 = _T_1579 & _T_1469; 
  assign _T_1638 = _T_1464 | _T_1587; 
  assign _T_1641 = _T_1638 | reset; 
  assign _T_1642 = _T_1641 == 1'h0; 
  assign _T_1653 = 3'h6 == io_in_c_bits_size; 
  assign _T_1655 = _T_1408 ? _T_1653 : 1'h0; 
  assign _T_1661 = _T_1655 | reset; 
  assign _T_1662 = _T_1661 == 1'h0; 
  assign _T_1673 = io_in_c_bits_param <= 3'h2; 
  assign _T_1675 = _T_1673 | reset; 
  assign _T_1676 = _T_1675 == 1'h0; 
  assign _T_1681 = io_in_c_bits_opcode == 3'h7; 
  assign _T_1791 = io_in_c_bits_opcode == 3'h0; 
  assign _T_1801 = io_in_c_bits_param == 3'h0; 
  assign _T_1803 = _T_1801 | reset; 
  assign _T_1804 = _T_1803 == 1'h0; 
  assign _T_1809 = io_in_c_bits_opcode == 3'h1; 
  assign _T_1823 = io_in_c_bits_opcode == 3'h2; 
  assign _T_1845 = io_in_a_ready & io_in_a_valid; 
  assign _T_1850 = _T_34[6:3]; 
  assign _T_1851 = io_in_a_bits_opcode[2]; 
  assign _T_1852 = _T_1851 == 1'h0; 
  assign _T_1856 = _T_1855 - 4'h1; 
  assign _T_1857 = $unsigned(_T_1856); 
  assign _T_1858 = _T_1857[3:0]; 
  assign _T_1859 = _T_1855 == 4'h0; 
  assign _T_1877 = _T_1859 == 1'h0; 
  assign _T_1878 = io_in_a_valid & _T_1877; 
  assign _T_1879 = io_in_a_bits_opcode == _T_1868; 
  assign _T_1881 = _T_1879 | reset; 
  assign _T_1882 = _T_1881 == 1'h0; 
  assign _T_1883 = io_in_a_bits_param == _T_1870; 
  assign _T_1885 = _T_1883 | reset; 
  assign _T_1886 = _T_1885 == 1'h0; 
  assign _T_1887 = io_in_a_bits_size == _T_1872; 
  assign _T_1889 = _T_1887 | reset; 
  assign _T_1890 = _T_1889 == 1'h0; 
  assign _T_1891 = io_in_a_bits_source == _T_1874; 
  assign _T_1893 = _T_1891 | reset; 
  assign _T_1894 = _T_1893 == 1'h0; 
  assign _T_1895 = io_in_a_bits_address == _T_1876; 
  assign _T_1897 = _T_1895 | reset; 
  assign _T_1898 = _T_1897 == 1'h0; 
  assign _T_1900 = _T_1845 & _T_1859; 
  assign _T_1901 = io_in_d_ready & io_in_d_valid; 
  assign _T_1903 = 14'h7f << io_in_d_bits_size; 
  assign _T_1904 = _T_1903[6:0]; 
  assign _T_1905 = ~ _T_1904; 
  assign _T_1906 = _T_1905[6:3]; 
  assign _T_1907 = io_in_d_bits_opcode[0]; 
  assign _T_1911 = _T_1910 - 4'h1; 
  assign _T_1912 = $unsigned(_T_1911); 
  assign _T_1913 = _T_1912[3:0]; 
  assign _T_1914 = _T_1910 == 4'h0; 
  assign _T_1934 = _T_1914 == 1'h0; 
  assign _T_1935 = io_in_d_valid & _T_1934; 
  assign _T_1936 = io_in_d_bits_opcode == _T_1923; 
  assign _T_1938 = _T_1936 | reset; 
  assign _T_1939 = _T_1938 == 1'h0; 
  assign _T_1940 = io_in_d_bits_param == _T_1925; 
  assign _T_1942 = _T_1940 | reset; 
  assign _T_1943 = _T_1942 == 1'h0; 
  assign _T_1944 = io_in_d_bits_size == _T_1927; 
  assign _T_1946 = _T_1944 | reset; 
  assign _T_1947 = _T_1946 == 1'h0; 
  assign _T_1948 = io_in_d_bits_source == _T_1929; 
  assign _T_1950 = _T_1948 | reset; 
  assign _T_1951 = _T_1950 == 1'h0; 
  assign _T_1952 = io_in_d_bits_sink == _T_1931; 
  assign _T_1954 = _T_1952 | reset; 
  assign _T_1955 = _T_1954 == 1'h0; 
  assign _T_1956 = io_in_d_bits_denied == _T_1933; 
  assign _T_1958 = _T_1956 | reset; 
  assign _T_1959 = _T_1958 == 1'h0; 
  assign _T_1961 = _T_1901 & _T_1914; 
  assign _T_1962 = io_in_b_ready & io_in_b_valid; 
  assign _T_1973 = _T_1972 - 4'h1; 
  assign _T_1974 = $unsigned(_T_1973); 
  assign _T_1975 = _T_1974[3:0]; 
  assign _T_1976 = _T_1972 == 4'h0; 
  assign _T_1994 = _T_1976 == 1'h0; 
  assign _T_1995 = io_in_b_valid & _T_1994; 
  assign _T_1996 = io_in_b_bits_opcode == _T_1985; 
  assign _T_1998 = _T_1996 | reset; 
  assign _T_1999 = _T_1998 == 1'h0; 
  assign _T_2000 = io_in_b_bits_param == _T_1987; 
  assign _T_2002 = _T_2000 | reset; 
  assign _T_2003 = _T_2002 == 1'h0; 
  assign _T_2004 = io_in_b_bits_size == _T_1989; 
  assign _T_2006 = _T_2004 | reset; 
  assign _T_2007 = _T_2006 == 1'h0; 
  assign _T_2008 = io_in_b_bits_source == _T_1991; 
  assign _T_2010 = _T_2008 | reset; 
  assign _T_2011 = _T_2010 == 1'h0; 
  assign _T_2012 = io_in_b_bits_address == _T_1993; 
  assign _T_2014 = _T_2012 | reset; 
  assign _T_2015 = _T_2014 == 1'h0; 
  assign _T_2017 = _T_1962 & _T_1976; 
  assign _T_2018 = io_in_c_ready & io_in_c_valid; 
  assign _T_2023 = _T_1422[6:3]; 
  assign _T_2024 = io_in_c_bits_opcode[0]; 
  assign _T_2028 = _T_2027 - 4'h1; 
  assign _T_2029 = $unsigned(_T_2028); 
  assign _T_2030 = _T_2029[3:0]; 
  assign _T_2031 = _T_2027 == 4'h0; 
  assign _T_2049 = _T_2031 == 1'h0; 
  assign _T_2050 = io_in_c_valid & _T_2049; 
  assign _T_2051 = io_in_c_bits_opcode == _T_2040; 
  assign _T_2053 = _T_2051 | reset; 
  assign _T_2054 = _T_2053 == 1'h0; 
  assign _T_2055 = io_in_c_bits_param == _T_2042; 
  assign _T_2057 = _T_2055 | reset; 
  assign _T_2058 = _T_2057 == 1'h0; 
  assign _T_2059 = io_in_c_bits_size == _T_2044; 
  assign _T_2061 = _T_2059 | reset; 
  assign _T_2062 = _T_2061 == 1'h0; 
  assign _T_2063 = io_in_c_bits_source == _T_2046; 
  assign _T_2065 = _T_2063 | reset; 
  assign _T_2066 = _T_2065 == 1'h0; 
  assign _T_2067 = io_in_c_bits_address == _T_2048; 
  assign _T_2069 = _T_2067 | reset; 
  assign _T_2070 = _T_2069 == 1'h0; 
  assign _T_2072 = _T_2018 & _T_2031; 
  assign _T_2086 = _T_2085 - 4'h1; 
  assign _T_2087 = $unsigned(_T_2086); 
  assign _T_2088 = _T_2087[3:0]; 
  assign _T_2089 = _T_2085 == 4'h0; 
  assign _T_2107 = _T_2106 - 4'h1; 
  assign _T_2108 = $unsigned(_T_2107); 
  assign _T_2109 = _T_2108[3:0]; 
  assign _T_2110 = _T_2106 == 4'h0; 
  assign _T_2121 = _T_1845 & _T_2089; 
  assign _T_2123 = 2'h1 << io_in_a_bits_source; 
  assign _T_2124 = _T_2074 >> io_in_a_bits_source; 
  assign _T_2125 = _T_2124[0]; 
  assign _T_2126 = _T_2125 == 1'h0; 
  assign _T_2128 = _T_2126 | reset; 
  assign _T_2129 = _T_2128 == 1'h0; 
  assign _GEN_27 = _T_2121 ? _T_2123 : 2'h0; 
  assign _T_2134 = _T_1901 & _T_2110; 
  assign _T_2136 = _T_908 == 1'h0; 
  assign _T_2137 = _T_2134 & _T_2136; 
  assign _T_2138 = 2'h1 << io_in_d_bits_source; 
  assign _T_2139 = _GEN_27 | _T_2074; 
  assign _T_2140 = _T_2139 >> io_in_d_bits_source; 
  assign _T_2141 = _T_2140[0]; 
  assign _T_2143 = _T_2141 | reset; 
  assign _T_2144 = _T_2143 == 1'h0; 
  assign _GEN_28 = _T_2137 ? _T_2138 : 2'h0; 
  assign _T_2145 = _GEN_27 != _GEN_28; 
  assign _T_2146 = _GEN_27 != 2'h0; 
  assign _T_2147 = _T_2146 == 1'h0; 
  assign _T_2148 = _T_2145 | _T_2147; 
  assign _T_2150 = _T_2148 | reset; 
  assign _T_2151 = _T_2150 == 1'h0; 
  assign _T_2152 = _T_2074 | _GEN_27; 
  assign _T_2153 = ~ _GEN_28; 
  assign _T_2154 = _T_2152 & _T_2153; 
  assign _T_2157 = _T_2074 != 2'h0; 
  assign _T_2158 = _T_2157 == 1'h0; 
  assign _T_2159 = plusarg_reader_out == 32'h0; 
  assign _T_2160 = _T_2158 | _T_2159; 
  assign _T_2161 = _T_2156 < plusarg_reader_out; 
  assign _T_2162 = _T_2160 | _T_2161; 
  assign _T_2164 = _T_2162 | reset; 
  assign _T_2165 = _T_2164 == 1'h0; 
  assign _T_2167 = _T_2156 + 32'h1; 
  assign _T_2170 = _T_1845 | _T_1901; 
  assign _T_2183 = _T_2182 - 4'h1; 
  assign _T_2184 = $unsigned(_T_2183); 
  assign _T_2185 = _T_2184[3:0]; 
  assign _T_2186 = _T_2182 == 4'h0; 
  assign _T_2197 = _T_1901 & _T_2186; 
  assign _T_2198 = io_in_d_bits_opcode[2]; 
  assign _T_2199 = io_in_d_bits_opcode[1]; 
  assign _T_2200 = _T_2199 == 1'h0; 
  assign _T_2201 = _T_2198 & _T_2200; 
  assign _T_2202 = _T_2197 & _T_2201; 
  assign _T_2203 = 8'h1 << io_in_d_bits_sink; 
  assign _T_2204 = _T_2172 >> io_in_d_bits_sink; 
  assign _T_2205 = _T_2204[0]; 
  assign _T_2206 = _T_2205 == 1'h0; 
  assign _T_2208 = _T_2206 | reset; 
  assign _T_2209 = _T_2208 == 1'h0; 
  assign _GEN_31 = _T_2202 ? _T_2203 : 8'h0; 
  assign _T_2212 = io_in_e_ready & io_in_e_valid; 
  assign _T_2215 = 8'h1 << io_in_e_bits_sink; 
  assign _T_2216 = _GEN_31 | _T_2172; 
  assign _T_2217 = _T_2216 >> io_in_e_bits_sink; 
  assign _T_2218 = _T_2217[0]; 
  assign _T_2220 = _T_2218 | reset; 
  assign _T_2221 = _T_2220 == 1'h0; 
  assign _GEN_32 = _T_2212 ? _T_2215 : 8'h0; 
  assign _T_2222 = _T_2172 | _GEN_31; 
  assign _T_2223 = ~ _GEN_32; 
  assign _T_2224 = _T_2222 & _T_2223; 
  assign _GEN_36 = io_in_a_valid & _T_121; 
  assign _GEN_52 = io_in_a_valid & _T_240; 
  assign _GEN_70 = io_in_a_valid & _T_363; 
  assign _GEN_82 = io_in_a_valid & _T_455; 
  assign _GEN_92 = io_in_a_valid & _T_545; 
  assign _GEN_102 = io_in_a_valid & _T_637; 
  assign _GEN_112 = io_in_a_valid & _T_722; 
  assign _GEN_122 = io_in_a_valid & _T_807; 
  assign _GEN_132 = io_in_d_valid & _T_908; 
  assign _GEN_142 = io_in_d_valid & _T_928; 
  assign _GEN_152 = io_in_d_valid & _T_956; 
  assign _GEN_162 = io_in_d_valid & _T_985; 
  assign _GEN_168 = io_in_d_valid & _T_1002; 
  assign _GEN_174 = io_in_d_valid & _T_1020; 
  assign _GEN_180 = io_in_b_valid & _T_1230; 
  assign _GEN_194 = io_in_b_valid & _T_1272; 
  assign _GEN_208 = io_in_b_valid & _T_1297; 
  assign _GEN_220 = io_in_b_valid & _T_1318; 
  assign _GEN_232 = io_in_b_valid & _T_1341; 
  assign _GEN_242 = io_in_b_valid & _T_1362; 
  assign _GEN_252 = io_in_b_valid & _T_1383; 
  assign _GEN_264 = io_in_c_valid & _T_1527; 
  assign _GEN_276 = io_in_c_valid & _T_1549; 
  assign _GEN_286 = io_in_c_valid & _T_1567; 
  assign _GEN_300 = io_in_c_valid & _T_1681; 
  assign _GEN_312 = io_in_c_valid & _T_1791; 
  assign _GEN_322 = io_in_c_valid & _T_1809; 
  assign _GEN_330 = io_in_c_valid & _T_1823; 
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
  _T_1855 = _RAND_0[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T_1868 = _RAND_1[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_1870 = _RAND_2[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_1872 = _RAND_3[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_1874 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {2{`RANDOM}};
  _T_1876 = _RAND_5[37:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  _T_1910 = _RAND_6[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  _T_1923 = _RAND_7[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  _T_1925 = _RAND_8[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  _T_1927 = _RAND_9[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  _T_1929 = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  _T_1931 = _RAND_11[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  _T_1933 = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  _T_1972 = _RAND_13[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  _T_1985 = _RAND_14[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  _T_1987 = _RAND_15[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  _T_1989 = _RAND_16[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  _T_1991 = _RAND_17[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {2{`RANDOM}};
  _T_1993 = _RAND_18[37:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  _T_2027 = _RAND_19[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  _T_2040 = _RAND_20[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{`RANDOM}};
  _T_2042 = _RAND_21[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{`RANDOM}};
  _T_2044 = _RAND_22[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{`RANDOM}};
  _T_2046 = _RAND_23[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {2{`RANDOM}};
  _T_2048 = _RAND_24[37:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{`RANDOM}};
  _T_2074 = _RAND_25[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{`RANDOM}};
  _T_2085 = _RAND_26[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{`RANDOM}};
  _T_2106 = _RAND_27[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {1{`RANDOM}};
  _T_2156 = _RAND_28[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_29 = {1{`RANDOM}};
  _T_2172 = _RAND_29[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_30 = {1{`RANDOM}};
  _T_2182 = _RAND_30[3:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      _T_1855 <= 4'h0;
    end else begin
      if (_T_1845) begin
        if (_T_1859) begin
          if (_T_1852) begin
            _T_1855 <= _T_1850;
          end else begin
            _T_1855 <= 4'h0;
          end
        end else begin
          _T_1855 <= _T_1858;
        end
      end
    end
    if (_T_1900) begin
      _T_1868 <= io_in_a_bits_opcode;
    end
    if (_T_1900) begin
      _T_1870 <= io_in_a_bits_param;
    end
    if (_T_1900) begin
      _T_1872 <= io_in_a_bits_size;
    end
    if (_T_1900) begin
      _T_1874 <= io_in_a_bits_source;
    end
    if (_T_1900) begin
      _T_1876 <= io_in_a_bits_address;
    end
    if (reset) begin
      _T_1910 <= 4'h0;
    end else begin
      if (_T_1901) begin
        if (_T_1914) begin
          if (_T_1907) begin
            _T_1910 <= _T_1906;
          end else begin
            _T_1910 <= 4'h0;
          end
        end else begin
          _T_1910 <= _T_1913;
        end
      end
    end
    if (_T_1961) begin
      _T_1923 <= io_in_d_bits_opcode;
    end
    if (_T_1961) begin
      _T_1925 <= io_in_d_bits_param;
    end
    if (_T_1961) begin
      _T_1927 <= io_in_d_bits_size;
    end
    if (_T_1961) begin
      _T_1929 <= io_in_d_bits_source;
    end
    if (_T_1961) begin
      _T_1931 <= io_in_d_bits_sink;
    end
    if (_T_1961) begin
      _T_1933 <= io_in_d_bits_denied;
    end
    if (reset) begin
      _T_1972 <= 4'h0;
    end else begin
      if (_T_1962) begin
        if (_T_1976) begin
          _T_1972 <= 4'h0;
        end else begin
          _T_1972 <= _T_1975;
        end
      end
    end
    if (_T_2017) begin
      _T_1985 <= io_in_b_bits_opcode;
    end
    if (_T_2017) begin
      _T_1987 <= io_in_b_bits_param;
    end
    if (_T_2017) begin
      _T_1989 <= io_in_b_bits_size;
    end
    if (_T_2017) begin
      _T_1991 <= io_in_b_bits_source;
    end
    if (_T_2017) begin
      _T_1993 <= io_in_b_bits_address;
    end
    if (reset) begin
      _T_2027 <= 4'h0;
    end else begin
      if (_T_2018) begin
        if (_T_2031) begin
          if (_T_2024) begin
            _T_2027 <= _T_2023;
          end else begin
            _T_2027 <= 4'h0;
          end
        end else begin
          _T_2027 <= _T_2030;
        end
      end
    end
    if (_T_2072) begin
      _T_2040 <= io_in_c_bits_opcode;
    end
    if (_T_2072) begin
      _T_2042 <= io_in_c_bits_param;
    end
    if (_T_2072) begin
      _T_2044 <= io_in_c_bits_size;
    end
    if (_T_2072) begin
      _T_2046 <= io_in_c_bits_source;
    end
    if (_T_2072) begin
      _T_2048 <= io_in_c_bits_address;
    end
    if (reset) begin
      _T_2074 <= 2'h0;
    end else begin
      _T_2074 <= _T_2154;
    end
    if (reset) begin
      _T_2085 <= 4'h0;
    end else begin
      if (_T_1845) begin
        if (_T_2089) begin
          if (_T_1852) begin
            _T_2085 <= _T_1850;
          end else begin
            _T_2085 <= 4'h0;
          end
        end else begin
          _T_2085 <= _T_2088;
        end
      end
    end
    if (reset) begin
      _T_2106 <= 4'h0;
    end else begin
      if (_T_1901) begin
        if (_T_2110) begin
          if (_T_1907) begin
            _T_2106 <= _T_1906;
          end else begin
            _T_2106 <= 4'h0;
          end
        end else begin
          _T_2106 <= _T_2109;
        end
      end
    end
    if (reset) begin
      _T_2156 <= 32'h0;
    end else begin
      if (_T_2170) begin
        _T_2156 <= 32'h0;
      end else begin
        _T_2156 <= _T_2167;
      end
    end
    if (reset) begin
      _T_2172 <= 8'h0;
    end else begin
      _T_2172 <= _T_2224;
    end
    if (reset) begin
      _T_2182 <= 4'h0;
    end else begin
      if (_T_1901) begin
        if (_T_2186) begin
          if (_T_1907) begin
            _T_2182 <= _T_1906;
          end else begin
            _T_2182 <= 4'h0;
          end
        end else begin
          _T_2182 <= _T_2185;
        end
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel has invalid opcode (connected at HellaCache.scala:220:21)\n    at Monitor.scala:39 assert (TLMessages.isA(bundle.opcode), \"'A' channel has invalid opcode\" + extra)\n"); 
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
        if (_GEN_36 & _T_196) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries AcquireBlock type unsupported by manager (connected at HellaCache.scala:220:21)\n    at Monitor.scala:49 assert (edge.manager.supportsAcquireBSafe(edge.address(bundle), bundle.size), \"'A' channel carries AcquireBlock type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_36 & _T_196) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_36 & _T_216) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries AcquireBlock from a client which does not support Probe (connected at HellaCache.scala:220:21)\n    at Monitor.scala:50 assert (edge.client.supportsProbe(edge.source(bundle), bundle.size), \"'A' channel carries AcquireBlock from a client which does not support Probe\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_36 & _T_216) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_36 & _T_219) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock carries invalid source ID (connected at HellaCache.scala:220:21)\n    at Monitor.scala:51 assert (source_ok, \"'A' channel AcquireBlock carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_36 & _T_219) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_36 & _T_223) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock smaller than a beat (connected at HellaCache.scala:220:21)\n    at Monitor.scala:52 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'A' channel AcquireBlock smaller than a beat\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_36 & _T_223) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_36 & _T_226) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock address not aligned to size (connected at HellaCache.scala:220:21)\n    at Monitor.scala:53 assert (is_aligned, \"'A' channel AcquireBlock address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_36 & _T_226) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_36 & _T_230) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock carries invalid grow param (connected at HellaCache.scala:220:21)\n    at Monitor.scala:54 assert (TLPermissions.isGrow(bundle.param), \"'A' channel AcquireBlock carries invalid grow param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_36 & _T_230) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_36 & _T_235) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock contains invalid mask (connected at HellaCache.scala:220:21)\n    at Monitor.scala:55 assert (~bundle.mask === UInt(0), \"'A' channel AcquireBlock contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_36 & _T_235) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_36 & _T_239) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock is corrupt (connected at HellaCache.scala:220:21)\n    at Monitor.scala:56 assert (!bundle.corrupt, \"'A' channel AcquireBlock is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_36 & _T_239) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_52 & _T_196) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries AcquirePerm type unsupported by manager (connected at HellaCache.scala:220:21)\n    at Monitor.scala:60 assert (edge.manager.supportsAcquireBSafe(edge.address(bundle), bundle.size), \"'A' channel carries AcquirePerm type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_52 & _T_196) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_52 & _T_216) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries AcquirePerm from a client which does not support Probe (connected at HellaCache.scala:220:21)\n    at Monitor.scala:61 assert (edge.client.supportsProbe(edge.source(bundle), bundle.size), \"'A' channel carries AcquirePerm from a client which does not support Probe\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_52 & _T_216) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_52 & _T_219) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm carries invalid source ID (connected at HellaCache.scala:220:21)\n    at Monitor.scala:62 assert (source_ok, \"'A' channel AcquirePerm carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_52 & _T_219) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_52 & _T_223) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm smaller than a beat (connected at HellaCache.scala:220:21)\n    at Monitor.scala:63 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'A' channel AcquirePerm smaller than a beat\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_52 & _T_223) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_52 & _T_226) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm address not aligned to size (connected at HellaCache.scala:220:21)\n    at Monitor.scala:64 assert (is_aligned, \"'A' channel AcquirePerm address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_52 & _T_226) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_52 & _T_230) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm carries invalid grow param (connected at HellaCache.scala:220:21)\n    at Monitor.scala:65 assert (TLPermissions.isGrow(bundle.param), \"'A' channel AcquirePerm carries invalid grow param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_52 & _T_230) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_52 & _T_353) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm requests NtoB (connected at HellaCache.scala:220:21)\n    at Monitor.scala:66 assert (bundle.param =/= TLPermissions.NtoB, \"'A' channel AcquirePerm requests NtoB\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_52 & _T_353) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_52 & _T_235) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm contains invalid mask (connected at HellaCache.scala:220:21)\n    at Monitor.scala:67 assert (~bundle.mask === UInt(0), \"'A' channel AcquirePerm contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_52 & _T_235) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_52 & _T_239) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm is corrupt (connected at HellaCache.scala:220:21)\n    at Monitor.scala:68 assert (!bundle.corrupt, \"'A' channel AcquirePerm is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_52 & _T_239) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_70 & _T_436) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries Get type unsupported by manager (connected at HellaCache.scala:220:21)\n    at Monitor.scala:72 assert (edge.manager.supportsGetSafe(edge.address(bundle), bundle.size), \"'A' channel carries Get type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_70 & _T_436) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_70 & _T_219) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Get carries invalid source ID (connected at HellaCache.scala:220:21)\n    at Monitor.scala:73 assert (source_ok, \"'A' channel Get carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_70 & _T_219) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_70 & _T_226) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Get address not aligned to size (connected at HellaCache.scala:220:21)\n    at Monitor.scala:74 assert (is_aligned, \"'A' channel Get address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_70 & _T_226) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_70 & _T_446) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Get carries invalid param (connected at HellaCache.scala:220:21)\n    at Monitor.scala:75 assert (bundle.param === UInt(0), \"'A' channel Get carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_70 & _T_446) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_70 & _T_450) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Get contains invalid mask (connected at HellaCache.scala:220:21)\n    at Monitor.scala:76 assert (bundle.mask === mask, \"'A' channel Get contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_70 & _T_450) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_70 & _T_239) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Get is corrupt (connected at HellaCache.scala:220:21)\n    at Monitor.scala:77 assert (!bundle.corrupt, \"'A' channel Get is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_70 & _T_239) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_82 & _T_530) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries PutFull type unsupported by manager (connected at HellaCache.scala:220:21)\n    at Monitor.scala:81 assert (edge.manager.supportsPutFullSafe(edge.address(bundle), bundle.size), \"'A' channel carries PutFull type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_82 & _T_530) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_82 & _T_219) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutFull carries invalid source ID (connected at HellaCache.scala:220:21)\n    at Monitor.scala:82 assert (source_ok, \"'A' channel PutFull carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_82 & _T_219) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_82 & _T_226) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutFull address not aligned to size (connected at HellaCache.scala:220:21)\n    at Monitor.scala:83 assert (is_aligned, \"'A' channel PutFull address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_82 & _T_226) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_82 & _T_446) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutFull carries invalid param (connected at HellaCache.scala:220:21)\n    at Monitor.scala:84 assert (bundle.param === UInt(0), \"'A' channel PutFull carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_82 & _T_446) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_82 & _T_450) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutFull contains invalid mask (connected at HellaCache.scala:220:21)\n    at Monitor.scala:85 assert (bundle.mask === mask, \"'A' channel PutFull contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_82 & _T_450) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_92 & _T_530) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries PutPartial type unsupported by manager (connected at HellaCache.scala:220:21)\n    at Monitor.scala:89 assert (edge.manager.supportsPutPartialSafe(edge.address(bundle), bundle.size), \"'A' channel carries PutPartial type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_92 & _T_530) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_92 & _T_219) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutPartial carries invalid source ID (connected at HellaCache.scala:220:21)\n    at Monitor.scala:90 assert (source_ok, \"'A' channel PutPartial carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_92 & _T_219) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_92 & _T_226) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutPartial address not aligned to size (connected at HellaCache.scala:220:21)\n    at Monitor.scala:91 assert (is_aligned, \"'A' channel PutPartial address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_92 & _T_226) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_92 & _T_446) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutPartial carries invalid param (connected at HellaCache.scala:220:21)\n    at Monitor.scala:92 assert (bundle.param === UInt(0), \"'A' channel PutPartial carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_92 & _T_446) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_92 & _T_636) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutPartial contains invalid mask (connected at HellaCache.scala:220:21)\n    at Monitor.scala:93 assert ((bundle.mask & ~mask) === UInt(0), \"'A' channel PutPartial contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_92 & _T_636) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_102 & _T_707) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries Arithmetic type unsupported by manager (connected at HellaCache.scala:220:21)\n    at Monitor.scala:97 assert (edge.manager.supportsArithmeticSafe(edge.address(bundle), bundle.size), \"'A' channel carries Arithmetic type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_102 & _T_707) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_102 & _T_219) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Arithmetic carries invalid source ID (connected at HellaCache.scala:220:21)\n    at Monitor.scala:98 assert (source_ok, \"'A' channel Arithmetic carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_102 & _T_219) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_102 & _T_226) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Arithmetic address not aligned to size (connected at HellaCache.scala:220:21)\n    at Monitor.scala:99 assert (is_aligned, \"'A' channel Arithmetic address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_102 & _T_226) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_102 & _T_717) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Arithmetic carries invalid opcode param (connected at HellaCache.scala:220:21)\n    at Monitor.scala:100 assert (TLAtomics.isArithmetic(bundle.param), \"'A' channel Arithmetic carries invalid opcode param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_102 & _T_717) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_102 & _T_450) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Arithmetic contains invalid mask (connected at HellaCache.scala:220:21)\n    at Monitor.scala:101 assert (bundle.mask === mask, \"'A' channel Arithmetic contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_102 & _T_450) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_112 & _T_707) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries Logical type unsupported by manager (connected at HellaCache.scala:220:21)\n    at Monitor.scala:105 assert (edge.manager.supportsLogicalSafe(edge.address(bundle), bundle.size), \"'A' channel carries Logical type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_112 & _T_707) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_112 & _T_219) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Logical carries invalid source ID (connected at HellaCache.scala:220:21)\n    at Monitor.scala:106 assert (source_ok, \"'A' channel Logical carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_112 & _T_219) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_112 & _T_226) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Logical address not aligned to size (connected at HellaCache.scala:220:21)\n    at Monitor.scala:107 assert (is_aligned, \"'A' channel Logical address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_112 & _T_226) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_112 & _T_802) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Logical carries invalid opcode param (connected at HellaCache.scala:220:21)\n    at Monitor.scala:108 assert (TLAtomics.isLogical(bundle.param), \"'A' channel Logical carries invalid opcode param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_112 & _T_802) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_112 & _T_450) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Logical contains invalid mask (connected at HellaCache.scala:220:21)\n    at Monitor.scala:109 assert (bundle.mask === mask, \"'A' channel Logical contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_112 & _T_450) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_122 & _T_877) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries Hint type unsupported by manager (connected at HellaCache.scala:220:21)\n    at Monitor.scala:113 assert (edge.manager.supportsHintSafe(edge.address(bundle), bundle.size), \"'A' channel carries Hint type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_122 & _T_877) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_122 & _T_219) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Hint carries invalid source ID (connected at HellaCache.scala:220:21)\n    at Monitor.scala:114 assert (source_ok, \"'A' channel Hint carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_122 & _T_219) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_122 & _T_226) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Hint address not aligned to size (connected at HellaCache.scala:220:21)\n    at Monitor.scala:115 assert (is_aligned, \"'A' channel Hint address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_122 & _T_226) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_122 & _T_450) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Hint contains invalid mask (connected at HellaCache.scala:220:21)\n    at Monitor.scala:116 assert (bundle.mask === mask, \"'A' channel Hint contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_122 & _T_450) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_122 & _T_239) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Hint is corrupt (connected at HellaCache.scala:220:21)\n    at Monitor.scala:117 assert (!bundle.corrupt, \"'A' channel Hint is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_122 & _T_239) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_895) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel has invalid opcode (connected at HellaCache.scala:220:21)\n    at Monitor.scala:268 assert (TLMessages.isD(bundle.opcode), \"'D' channel has invalid opcode\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_d_valid & _T_895) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_132 & _T_911) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel ReleaseAck carries invalid source ID (connected at HellaCache.scala:220:21)\n    at Monitor.scala:276 assert (source_ok, \"'D' channel ReleaseAck carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_132 & _T_911) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_132 & _T_915) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel ReleaseAck smaller than a beat (connected at HellaCache.scala:220:21)\n    at Monitor.scala:277 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'D' channel ReleaseAck smaller than a beat\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_132 & _T_915) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_132 & _T_919) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel ReleaseeAck carries invalid param (connected at HellaCache.scala:220:21)\n    at Monitor.scala:278 assert (bundle.param === UInt(0), \"'D' channel ReleaseeAck carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_132 & _T_919) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_132 & _T_923) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel ReleaseAck is corrupt (connected at HellaCache.scala:220:21)\n    at Monitor.scala:279 assert (!bundle.corrupt, \"'D' channel ReleaseAck is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_132 & _T_923) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_132 & _T_927) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel ReleaseAck is denied (connected at HellaCache.scala:220:21)\n    at Monitor.scala:280 assert (!bundle.denied, \"'D' channel ReleaseAck is denied\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_132 & _T_927) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_142 & _T_911) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant carries invalid source ID (connected at HellaCache.scala:220:21)\n    at Monitor.scala:284 assert (source_ok, \"'D' channel Grant carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_142 & _T_911) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant carries invalid sink ID (connected at HellaCache.scala:220:21)\n    at Monitor.scala:285 assert (sink_ok, \"'D' channel Grant carries invalid sink ID\" + extra)\n"); 
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
        if (_GEN_142 & _T_915) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant smaller than a beat (connected at HellaCache.scala:220:21)\n    at Monitor.scala:286 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'D' channel Grant smaller than a beat\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_142 & _T_915) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_142 & _T_942) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant carries invalid cap param (connected at HellaCache.scala:220:21)\n    at Monitor.scala:287 assert (TLPermissions.isCap(bundle.param), \"'D' channel Grant carries invalid cap param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_142 & _T_942) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_142 & _T_946) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant carries toN param (connected at HellaCache.scala:220:21)\n    at Monitor.scala:288 assert (bundle.param =/= TLPermissions.toN, \"'D' channel Grant carries toN param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_142 & _T_946) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_142 & _T_923) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant is corrupt (connected at HellaCache.scala:220:21)\n    at Monitor.scala:289 assert (!bundle.corrupt, \"'D' channel Grant is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_142 & _T_923) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant is denied (connected at HellaCache.scala:220:21)\n    at Monitor.scala:290 assert (deny_put_ok || !bundle.denied, \"'D' channel Grant is denied\" + extra)\n"); 
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
        if (_GEN_152 & _T_911) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData carries invalid source ID (connected at HellaCache.scala:220:21)\n    at Monitor.scala:294 assert (source_ok, \"'D' channel GrantData carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_152 & _T_911) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData carries invalid sink ID (connected at HellaCache.scala:220:21)\n    at Monitor.scala:295 assert (sink_ok, \"'D' channel GrantData carries invalid sink ID\" + extra)\n"); 
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
        if (_GEN_152 & _T_915) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData smaller than a beat (connected at HellaCache.scala:220:21)\n    at Monitor.scala:296 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'D' channel GrantData smaller than a beat\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_152 & _T_915) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_152 & _T_942) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData carries invalid cap param (connected at HellaCache.scala:220:21)\n    at Monitor.scala:297 assert (TLPermissions.isCap(bundle.param), \"'D' channel GrantData carries invalid cap param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_152 & _T_942) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_152 & _T_946) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData carries toN param (connected at HellaCache.scala:220:21)\n    at Monitor.scala:298 assert (bundle.param =/= TLPermissions.toN, \"'D' channel GrantData carries toN param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_152 & _T_946) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_152 & _T_979) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData is denied but not corrupt (connected at HellaCache.scala:220:21)\n    at Monitor.scala:299 assert (!bundle.denied || bundle.corrupt, \"'D' channel GrantData is denied but not corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_152 & _T_979) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData is denied (connected at HellaCache.scala:220:21)\n    at Monitor.scala:300 assert (deny_get_ok || !bundle.denied, \"'D' channel GrantData is denied\" + extra)\n"); 
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
        if (_GEN_162 & _T_911) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAck carries invalid source ID (connected at HellaCache.scala:220:21)\n    at Monitor.scala:304 assert (source_ok, \"'D' channel AccessAck carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_162 & _T_911) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_162 & _T_919) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAck carries invalid param (connected at HellaCache.scala:220:21)\n    at Monitor.scala:306 assert (bundle.param === UInt(0), \"'D' channel AccessAck carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_162 & _T_919) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_162 & _T_923) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAck is corrupt (connected at HellaCache.scala:220:21)\n    at Monitor.scala:307 assert (!bundle.corrupt, \"'D' channel AccessAck is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_162 & _T_923) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAck is denied (connected at HellaCache.scala:220:21)\n    at Monitor.scala:308 assert (deny_put_ok || !bundle.denied, \"'D' channel AccessAck is denied\" + extra)\n"); 
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
        if (_GEN_168 & _T_911) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAckData carries invalid source ID (connected at HellaCache.scala:220:21)\n    at Monitor.scala:312 assert (source_ok, \"'D' channel AccessAckData carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_168 & _T_911) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_168 & _T_919) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAckData carries invalid param (connected at HellaCache.scala:220:21)\n    at Monitor.scala:314 assert (bundle.param === UInt(0), \"'D' channel AccessAckData carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_168 & _T_919) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_168 & _T_979) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAckData is denied but not corrupt (connected at HellaCache.scala:220:21)\n    at Monitor.scala:315 assert (!bundle.denied || bundle.corrupt, \"'D' channel AccessAckData is denied but not corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_168 & _T_979) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAckData is denied (connected at HellaCache.scala:220:21)\n    at Monitor.scala:316 assert (deny_get_ok || !bundle.denied, \"'D' channel AccessAckData is denied\" + extra)\n"); 
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
        if (_GEN_174 & _T_911) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel HintAck carries invalid source ID (connected at HellaCache.scala:220:21)\n    at Monitor.scala:320 assert (source_ok, \"'D' channel HintAck carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_174 & _T_911) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_174 & _T_919) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel HintAck carries invalid param (connected at HellaCache.scala:220:21)\n    at Monitor.scala:322 assert (bundle.param === UInt(0), \"'D' channel HintAck carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_174 & _T_919) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_174 & _T_923) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel HintAck is corrupt (connected at HellaCache.scala:220:21)\n    at Monitor.scala:323 assert (!bundle.corrupt, \"'D' channel HintAck is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_174 & _T_923) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel HintAck is denied (connected at HellaCache.scala:220:21)\n    at Monitor.scala:324 assert (deny_put_ok || !bundle.denied, \"'D' channel HintAck is denied\" + extra)\n"); 
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
        if (io_in_b_valid & _T_1040) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel has invalid opcode (connected at HellaCache.scala:220:21)\n    at Monitor.scala:122 assert (TLMessages.isB(bundle.opcode), \"'B' channel has invalid opcode\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_b_valid & _T_1040) begin
          $fatal; 
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
        if (_GEN_180 & _T_1250) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel carries Probe type unsupported by client (connected at HellaCache.scala:220:21)\n    at Monitor.scala:133 assert (edge.client.supportsProbe(bundle.source, bundle.size), \"'B' channel carries Probe type unsupported by client\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_180 & _T_1250) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_180 & _T_1253) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Probe carries unmanaged address (connected at HellaCache.scala:220:21)\n    at Monitor.scala:134 assert (address_ok, \"'B' channel Probe carries unmanaged address\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_180 & _T_1253) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_180 & _T_1256) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Probe carries source that is not first source (connected at HellaCache.scala:220:21)\n    at Monitor.scala:135 assert (legal_source, \"'B' channel Probe carries source that is not first source\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_180 & _T_1256) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_180 & _T_1259) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Probe address not aligned to size (connected at HellaCache.scala:220:21)\n    at Monitor.scala:136 assert (is_aligned, \"'B' channel Probe address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_180 & _T_1259) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_180 & _T_1263) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Probe carries invalid cap param (connected at HellaCache.scala:220:21)\n    at Monitor.scala:137 assert (TLPermissions.isCap(bundle.param), \"'B' channel Probe carries invalid cap param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_180 & _T_1263) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_180 & _T_1267) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Probe contains invalid mask (connected at HellaCache.scala:220:21)\n    at Monitor.scala:138 assert (bundle.mask === mask, \"'B' channel Probe contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_180 & _T_1267) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_180 & _T_1271) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Probe is corrupt (connected at HellaCache.scala:220:21)\n    at Monitor.scala:139 assert (!bundle.corrupt, \"'B' channel Probe is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_180 & _T_1271) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_194 & _T_1275) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel carries Get type unsupported by client (connected at HellaCache.scala:220:21)\n    at Monitor.scala:143 assert (edge.client.supportsGet(bundle.source, bundle.size), \"'B' channel carries Get type unsupported by client\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_194 & _T_1275) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_194 & _T_1253) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Get carries unmanaged address (connected at HellaCache.scala:220:21)\n    at Monitor.scala:144 assert (address_ok, \"'B' channel Get carries unmanaged address\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_194 & _T_1253) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_194 & _T_1256) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Get carries source that is not first source (connected at HellaCache.scala:220:21)\n    at Monitor.scala:145 assert (legal_source, \"'B' channel Get carries source that is not first source\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_194 & _T_1256) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_194 & _T_1259) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Get address not aligned to size (connected at HellaCache.scala:220:21)\n    at Monitor.scala:146 assert (is_aligned, \"'B' channel Get address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_194 & _T_1259) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_194 & _T_1288) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Get carries invalid param (connected at HellaCache.scala:220:21)\n    at Monitor.scala:147 assert (bundle.param === UInt(0), \"'B' channel Get carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_194 & _T_1288) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_194 & _T_1267) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Get contains invalid mask (connected at HellaCache.scala:220:21)\n    at Monitor.scala:148 assert (bundle.mask === mask, \"'B' channel Get contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_194 & _T_1267) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_194 & _T_1271) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Get is corrupt (connected at HellaCache.scala:220:21)\n    at Monitor.scala:149 assert (!bundle.corrupt, \"'B' channel Get is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_194 & _T_1271) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_208 & _T_1275) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel carries PutFull type unsupported by client (connected at HellaCache.scala:220:21)\n    at Monitor.scala:153 assert (edge.client.supportsPutFull(bundle.source, bundle.size), \"'B' channel carries PutFull type unsupported by client\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_208 & _T_1275) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_208 & _T_1253) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel PutFull carries unmanaged address (connected at HellaCache.scala:220:21)\n    at Monitor.scala:154 assert (address_ok, \"'B' channel PutFull carries unmanaged address\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_208 & _T_1253) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_208 & _T_1256) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel PutFull carries source that is not first source (connected at HellaCache.scala:220:21)\n    at Monitor.scala:155 assert (legal_source, \"'B' channel PutFull carries source that is not first source\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_208 & _T_1256) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_208 & _T_1259) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel PutFull address not aligned to size (connected at HellaCache.scala:220:21)\n    at Monitor.scala:156 assert (is_aligned, \"'B' channel PutFull address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_208 & _T_1259) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_208 & _T_1288) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel PutFull carries invalid param (connected at HellaCache.scala:220:21)\n    at Monitor.scala:157 assert (bundle.param === UInt(0), \"'B' channel PutFull carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_208 & _T_1288) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_208 & _T_1267) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel PutFull contains invalid mask (connected at HellaCache.scala:220:21)\n    at Monitor.scala:158 assert (bundle.mask === mask, \"'B' channel PutFull contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_208 & _T_1267) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_220 & _T_1275) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel carries PutPartial type unsupported by client (connected at HellaCache.scala:220:21)\n    at Monitor.scala:162 assert (edge.client.supportsPutPartial(bundle.source, bundle.size), \"'B' channel carries PutPartial type unsupported by client\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_220 & _T_1275) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_220 & _T_1253) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel PutPartial carries unmanaged address (connected at HellaCache.scala:220:21)\n    at Monitor.scala:163 assert (address_ok, \"'B' channel PutPartial carries unmanaged address\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_220 & _T_1253) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_220 & _T_1256) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel PutPartial carries source that is not first source (connected at HellaCache.scala:220:21)\n    at Monitor.scala:164 assert (legal_source, \"'B' channel PutPartial carries source that is not first source\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_220 & _T_1256) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_220 & _T_1259) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel PutPartial address not aligned to size (connected at HellaCache.scala:220:21)\n    at Monitor.scala:165 assert (is_aligned, \"'B' channel PutPartial address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_220 & _T_1259) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_220 & _T_1288) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel PutPartial carries invalid param (connected at HellaCache.scala:220:21)\n    at Monitor.scala:166 assert (bundle.param === UInt(0), \"'B' channel PutPartial carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_220 & _T_1288) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_220 & _T_1340) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel PutPartial contains invalid mask (connected at HellaCache.scala:220:21)\n    at Monitor.scala:167 assert ((bundle.mask & ~mask) === UInt(0), \"'B' channel PutPartial contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_220 & _T_1340) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_232 & _T_1275) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel carries Arithmetic type unsupported by client (connected at HellaCache.scala:220:21)\n    at Monitor.scala:171 assert (edge.client.supportsArithmetic(bundle.source, bundle.size), \"'B' channel carries Arithmetic type unsupported by client\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_232 & _T_1275) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_232 & _T_1253) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Arithmetic carries unmanaged address (connected at HellaCache.scala:220:21)\n    at Monitor.scala:172 assert (address_ok, \"'B' channel Arithmetic carries unmanaged address\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_232 & _T_1253) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_232 & _T_1256) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Arithmetic carries source that is not first source (connected at HellaCache.scala:220:21)\n    at Monitor.scala:173 assert (legal_source, \"'B' channel Arithmetic carries source that is not first source\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_232 & _T_1256) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_232 & _T_1259) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Arithmetic address not aligned to size (connected at HellaCache.scala:220:21)\n    at Monitor.scala:174 assert (is_aligned, \"'B' channel Arithmetic address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_232 & _T_1259) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Arithmetic carries invalid opcode param (connected at HellaCache.scala:220:21)\n    at Monitor.scala:175 assert (TLAtomics.isArithmetic(bundle.param), \"'B' channel Arithmetic carries invalid opcode param\" + extra)\n"); 
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
        if (_GEN_232 & _T_1267) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Arithmetic contains invalid mask (connected at HellaCache.scala:220:21)\n    at Monitor.scala:176 assert (bundle.mask === mask, \"'B' channel Arithmetic contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_232 & _T_1267) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_242 & _T_1275) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel carries Logical type unsupported by client (connected at HellaCache.scala:220:21)\n    at Monitor.scala:180 assert (edge.client.supportsLogical(bundle.source, bundle.size), \"'B' channel carries Logical type unsupported by client\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_242 & _T_1275) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_242 & _T_1253) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Logical carries unmanaged address (connected at HellaCache.scala:220:21)\n    at Monitor.scala:181 assert (address_ok, \"'B' channel Logical carries unmanaged address\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_242 & _T_1253) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_242 & _T_1256) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Logical carries source that is not first source (connected at HellaCache.scala:220:21)\n    at Monitor.scala:182 assert (legal_source, \"'B' channel Logical carries source that is not first source\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_242 & _T_1256) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_242 & _T_1259) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Logical address not aligned to size (connected at HellaCache.scala:220:21)\n    at Monitor.scala:183 assert (is_aligned, \"'B' channel Logical address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_242 & _T_1259) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Logical carries invalid opcode param (connected at HellaCache.scala:220:21)\n    at Monitor.scala:184 assert (TLAtomics.isLogical(bundle.param), \"'B' channel Logical carries invalid opcode param\" + extra)\n"); 
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
        if (_GEN_242 & _T_1267) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Logical contains invalid mask (connected at HellaCache.scala:220:21)\n    at Monitor.scala:185 assert (bundle.mask === mask, \"'B' channel Logical contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_242 & _T_1267) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_252 & _T_1275) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel carries Hint type unsupported by client (connected at HellaCache.scala:220:21)\n    at Monitor.scala:189 assert (edge.client.supportsHint(bundle.source, bundle.size), \"'B' channel carries Hint type unsupported by client\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_252 & _T_1275) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_252 & _T_1253) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Hint carries unmanaged address (connected at HellaCache.scala:220:21)\n    at Monitor.scala:190 assert (address_ok, \"'B' channel Hint carries unmanaged address\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_252 & _T_1253) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_252 & _T_1256) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Hint carries source that is not first source (connected at HellaCache.scala:220:21)\n    at Monitor.scala:191 assert (legal_source, \"'B' channel Hint carries source that is not first source\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_252 & _T_1256) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_252 & _T_1259) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Hint address not aligned to size (connected at HellaCache.scala:220:21)\n    at Monitor.scala:192 assert (is_aligned, \"'B' channel Hint address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_252 & _T_1259) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_252 & _T_1267) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Hint contains invalid mask (connected at HellaCache.scala:220:21)\n    at Monitor.scala:193 assert (bundle.mask === mask, \"'B' channel Hint contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_252 & _T_1267) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_252 & _T_1271) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel Hint is corrupt (connected at HellaCache.scala:220:21)\n    at Monitor.scala:194 assert (!bundle.corrupt, \"'B' channel Hint is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_252 & _T_1271) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'C' channel has invalid opcode (connected at HellaCache.scala:220:21)\n    at Monitor.scala:199 assert (TLMessages.isC(bundle.opcode), \"'C' channel has invalid opcode\" + extra)\n"); 
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
        if (_GEN_264 & _T_1530) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ProbeAck carries unmanaged address (connected at HellaCache.scala:220:21)\n    at Monitor.scala:208 assert (address_ok, \"'C' channel ProbeAck carries unmanaged address\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_264 & _T_1530) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_264 & _T_1533) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ProbeAck carries invalid source ID (connected at HellaCache.scala:220:21)\n    at Monitor.scala:209 assert (source_ok, \"'C' channel ProbeAck carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_264 & _T_1533) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_264 & _T_1537) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ProbeAck smaller than a beat (connected at HellaCache.scala:220:21)\n    at Monitor.scala:210 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'C' channel ProbeAck smaller than a beat\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_264 & _T_1537) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_264 & _T_1540) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ProbeAck address not aligned to size (connected at HellaCache.scala:220:21)\n    at Monitor.scala:211 assert (is_aligned, \"'C' channel ProbeAck address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_264 & _T_1540) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_264 & _T_1544) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ProbeAck carries invalid report param (connected at HellaCache.scala:220:21)\n    at Monitor.scala:212 assert (TLPermissions.isReport(bundle.param), \"'C' channel ProbeAck carries invalid report param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_264 & _T_1544) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_264 & _T_1548) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ProbeAck is corrupt (connected at HellaCache.scala:220:21)\n    at Monitor.scala:213 assert (!bundle.corrupt, \"'C' channel ProbeAck is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_264 & _T_1548) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_276 & _T_1530) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ProbeAckData carries unmanaged address (connected at HellaCache.scala:220:21)\n    at Monitor.scala:217 assert (address_ok, \"'C' channel ProbeAckData carries unmanaged address\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_276 & _T_1530) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_276 & _T_1533) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ProbeAckData carries invalid source ID (connected at HellaCache.scala:220:21)\n    at Monitor.scala:218 assert (source_ok, \"'C' channel ProbeAckData carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_276 & _T_1533) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_276 & _T_1537) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ProbeAckData smaller than a beat (connected at HellaCache.scala:220:21)\n    at Monitor.scala:219 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'C' channel ProbeAckData smaller than a beat\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_276 & _T_1537) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_276 & _T_1540) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ProbeAckData address not aligned to size (connected at HellaCache.scala:220:21)\n    at Monitor.scala:220 assert (is_aligned, \"'C' channel ProbeAckData address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_276 & _T_1540) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_276 & _T_1544) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ProbeAckData carries invalid report param (connected at HellaCache.scala:220:21)\n    at Monitor.scala:221 assert (TLPermissions.isReport(bundle.param), \"'C' channel ProbeAckData carries invalid report param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_276 & _T_1544) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_286 & _T_1642) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel carries Release type unsupported by manager (connected at HellaCache.scala:220:21)\n    at Monitor.scala:225 assert (edge.manager.supportsAcquireBSafe(edge.address(bundle), bundle.size), \"'C' channel carries Release type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_286 & _T_1642) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_286 & _T_1662) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel carries Release from a client which does not support Probe (connected at HellaCache.scala:220:21)\n    at Monitor.scala:226 assert (edge.client.supportsProbe(edge.source(bundle), bundle.size), \"'C' channel carries Release from a client which does not support Probe\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_286 & _T_1662) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_286 & _T_1533) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel Release carries invalid source ID (connected at HellaCache.scala:220:21)\n    at Monitor.scala:227 assert (source_ok, \"'C' channel Release carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_286 & _T_1533) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_286 & _T_1537) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel Release smaller than a beat (connected at HellaCache.scala:220:21)\n    at Monitor.scala:228 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'C' channel Release smaller than a beat\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_286 & _T_1537) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_286 & _T_1540) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel Release address not aligned to size (connected at HellaCache.scala:220:21)\n    at Monitor.scala:229 assert (is_aligned, \"'C' channel Release address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_286 & _T_1540) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_286 & _T_1676) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel Release carries invalid shrink param (connected at HellaCache.scala:220:21)\n    at Monitor.scala:230 assert (TLPermissions.isShrink(bundle.param), \"'C' channel Release carries invalid shrink param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_286 & _T_1676) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_286 & _T_1548) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel Release is corrupt (connected at HellaCache.scala:220:21)\n    at Monitor.scala:231 assert (!bundle.corrupt, \"'C' channel Release is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_286 & _T_1548) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_300 & _T_1642) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel carries ReleaseData type unsupported by manager (connected at HellaCache.scala:220:21)\n    at Monitor.scala:235 assert (edge.manager.supportsAcquireBSafe(edge.address(bundle), bundle.size), \"'C' channel carries ReleaseData type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_300 & _T_1642) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_300 & _T_1662) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel carries Release from a client which does not support Probe (connected at HellaCache.scala:220:21)\n    at Monitor.scala:236 assert (edge.client.supportsProbe(edge.source(bundle), bundle.size), \"'C' channel carries Release from a client which does not support Probe\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_300 & _T_1662) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_300 & _T_1533) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ReleaseData carries invalid source ID (connected at HellaCache.scala:220:21)\n    at Monitor.scala:237 assert (source_ok, \"'C' channel ReleaseData carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_300 & _T_1533) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_300 & _T_1537) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ReleaseData smaller than a beat (connected at HellaCache.scala:220:21)\n    at Monitor.scala:238 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'C' channel ReleaseData smaller than a beat\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_300 & _T_1537) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_300 & _T_1540) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ReleaseData address not aligned to size (connected at HellaCache.scala:220:21)\n    at Monitor.scala:239 assert (is_aligned, \"'C' channel ReleaseData address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_300 & _T_1540) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_300 & _T_1676) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel ReleaseData carries invalid shrink param (connected at HellaCache.scala:220:21)\n    at Monitor.scala:240 assert (TLPermissions.isShrink(bundle.param), \"'C' channel ReleaseData carries invalid shrink param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_300 & _T_1676) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_312 & _T_1530) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel AccessAck carries unmanaged address (connected at HellaCache.scala:220:21)\n    at Monitor.scala:244 assert (address_ok, \"'C' channel AccessAck carries unmanaged address\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_312 & _T_1530) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_312 & _T_1533) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel AccessAck carries invalid source ID (connected at HellaCache.scala:220:21)\n    at Monitor.scala:245 assert (source_ok, \"'C' channel AccessAck carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_312 & _T_1533) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_312 & _T_1540) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel AccessAck address not aligned to size (connected at HellaCache.scala:220:21)\n    at Monitor.scala:246 assert (is_aligned, \"'C' channel AccessAck address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_312 & _T_1540) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_312 & _T_1804) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel AccessAck carries invalid param (connected at HellaCache.scala:220:21)\n    at Monitor.scala:247 assert (bundle.param === UInt(0), \"'C' channel AccessAck carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_312 & _T_1804) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_312 & _T_1548) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel AccessAck is corrupt (connected at HellaCache.scala:220:21)\n    at Monitor.scala:248 assert (!bundle.corrupt, \"'C' channel AccessAck is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_312 & _T_1548) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_322 & _T_1530) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel AccessAckData carries unmanaged address (connected at HellaCache.scala:220:21)\n    at Monitor.scala:252 assert (address_ok, \"'C' channel AccessAckData carries unmanaged address\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_322 & _T_1530) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_322 & _T_1533) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel AccessAckData carries invalid source ID (connected at HellaCache.scala:220:21)\n    at Monitor.scala:253 assert (source_ok, \"'C' channel AccessAckData carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_322 & _T_1533) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_322 & _T_1540) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel AccessAckData address not aligned to size (connected at HellaCache.scala:220:21)\n    at Monitor.scala:254 assert (is_aligned, \"'C' channel AccessAckData address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_322 & _T_1540) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_322 & _T_1804) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel AccessAckData carries invalid param (connected at HellaCache.scala:220:21)\n    at Monitor.scala:255 assert (bundle.param === UInt(0), \"'C' channel AccessAckData carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_322 & _T_1804) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_330 & _T_1530) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel HintAck carries unmanaged address (connected at HellaCache.scala:220:21)\n    at Monitor.scala:259 assert (address_ok, \"'C' channel HintAck carries unmanaged address\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_330 & _T_1530) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_330 & _T_1533) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel HintAck carries invalid source ID (connected at HellaCache.scala:220:21)\n    at Monitor.scala:260 assert (source_ok, \"'C' channel HintAck carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_330 & _T_1533) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_330 & _T_1540) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel HintAck address not aligned to size (connected at HellaCache.scala:220:21)\n    at Monitor.scala:261 assert (is_aligned, \"'C' channel HintAck address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_330 & _T_1540) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_330 & _T_1804) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel HintAck carries invalid param (connected at HellaCache.scala:220:21)\n    at Monitor.scala:262 assert (bundle.param === UInt(0), \"'C' channel HintAck carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_330 & _T_1804) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_330 & _T_1548) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel HintAck is corrupt (connected at HellaCache.scala:220:21)\n    at Monitor.scala:263 assert (!bundle.corrupt, \"'C' channel HintAck is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_330 & _T_1548) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'E' channels carries invalid sink ID (connected at HellaCache.scala:220:21)\n    at Monitor.scala:330 assert (sink_ok, \"'E' channels carries invalid sink ID\" + extra)\n"); 
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
        if (_T_1878 & _T_1882) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel opcode changed within multibeat operation (connected at HellaCache.scala:220:21)\n    at Monitor.scala:355 assert (a.bits.opcode === opcode, \"'A' channel opcode changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1878 & _T_1882) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1878 & _T_1886) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel param changed within multibeat operation (connected at HellaCache.scala:220:21)\n    at Monitor.scala:356 assert (a.bits.param  === param,  \"'A' channel param changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1878 & _T_1886) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1878 & _T_1890) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel size changed within multibeat operation (connected at HellaCache.scala:220:21)\n    at Monitor.scala:357 assert (a.bits.size   === size,   \"'A' channel size changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1878 & _T_1890) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1878 & _T_1894) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel source changed within multibeat operation (connected at HellaCache.scala:220:21)\n    at Monitor.scala:358 assert (a.bits.source === source, \"'A' channel source changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1878 & _T_1894) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1878 & _T_1898) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel address changed with multibeat operation (connected at HellaCache.scala:220:21)\n    at Monitor.scala:359 assert (a.bits.address=== address,\"'A' channel address changed with multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1878 & _T_1898) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1935 & _T_1939) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel opcode changed within multibeat operation (connected at HellaCache.scala:220:21)\n    at Monitor.scala:425 assert (d.bits.opcode === opcode, \"'D' channel opcode changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1935 & _T_1939) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1935 & _T_1943) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel param changed within multibeat operation (connected at HellaCache.scala:220:21)\n    at Monitor.scala:426 assert (d.bits.param  === param,  \"'D' channel param changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1935 & _T_1943) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1935 & _T_1947) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel size changed within multibeat operation (connected at HellaCache.scala:220:21)\n    at Monitor.scala:427 assert (d.bits.size   === size,   \"'D' channel size changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1935 & _T_1947) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1935 & _T_1951) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel source changed within multibeat operation (connected at HellaCache.scala:220:21)\n    at Monitor.scala:428 assert (d.bits.source === source, \"'D' channel source changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1935 & _T_1951) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1935 & _T_1955) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel sink changed with multibeat operation (connected at HellaCache.scala:220:21)\n    at Monitor.scala:429 assert (d.bits.sink   === sink,   \"'D' channel sink changed with multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1935 & _T_1955) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1935 & _T_1959) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel denied changed with multibeat operation (connected at HellaCache.scala:220:21)\n    at Monitor.scala:430 assert (d.bits.denied === denied, \"'D' channel denied changed with multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1935 & _T_1959) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1995 & _T_1999) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel opcode changed within multibeat operation (connected at HellaCache.scala:220:21)\n    at Monitor.scala:378 assert (b.bits.opcode === opcode, \"'B' channel opcode changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1995 & _T_1999) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1995 & _T_2003) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel param changed within multibeat operation (connected at HellaCache.scala:220:21)\n    at Monitor.scala:379 assert (b.bits.param  === param,  \"'B' channel param changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1995 & _T_2003) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1995 & _T_2007) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel size changed within multibeat operation (connected at HellaCache.scala:220:21)\n    at Monitor.scala:380 assert (b.bits.size   === size,   \"'B' channel size changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1995 & _T_2007) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1995 & _T_2011) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel source changed within multibeat operation (connected at HellaCache.scala:220:21)\n    at Monitor.scala:381 assert (b.bits.source === source, \"'B' channel source changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1995 & _T_2011) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1995 & _T_2015) begin
          $fwrite(32'h80000002,"Assertion failed: 'B' channel addresss changed with multibeat operation (connected at HellaCache.scala:220:21)\n    at Monitor.scala:382 assert (b.bits.address=== address,\"'B' channel addresss changed with multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1995 & _T_2015) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2050 & _T_2054) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel opcode changed within multibeat operation (connected at HellaCache.scala:220:21)\n    at Monitor.scala:401 assert (c.bits.opcode === opcode, \"'C' channel opcode changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2050 & _T_2054) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2050 & _T_2058) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel param changed within multibeat operation (connected at HellaCache.scala:220:21)\n    at Monitor.scala:402 assert (c.bits.param  === param,  \"'C' channel param changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2050 & _T_2058) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2050 & _T_2062) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel size changed within multibeat operation (connected at HellaCache.scala:220:21)\n    at Monitor.scala:403 assert (c.bits.size   === size,   \"'C' channel size changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2050 & _T_2062) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2050 & _T_2066) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel source changed within multibeat operation (connected at HellaCache.scala:220:21)\n    at Monitor.scala:404 assert (c.bits.source === source, \"'C' channel source changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2050 & _T_2066) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2050 & _T_2070) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel address changed with multibeat operation (connected at HellaCache.scala:220:21)\n    at Monitor.scala:405 assert (c.bits.address=== address,\"'C' channel address changed with multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2050 & _T_2070) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2121 & _T_2129) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel re-used a source ID (connected at HellaCache.scala:220:21)\n    at Monitor.scala:460 assert(!inflight(bundle.a.bits.source), \"'A' channel re-used a source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2121 & _T_2129) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2137 & _T_2144) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel acknowledged for nothing inflight (connected at HellaCache.scala:220:21)\n    at Monitor.scala:467 assert((a_set | inflight)(bundle.d.bits.source), \"'D' channel acknowledged for nothing inflight\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2137 & _T_2144) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2151) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' and 'D' concurrent, despite minlatency 4 (connected at HellaCache.scala:220:21)\n    at Monitor.scala:471 assert(a_set =/= d_clr || !a_set.orR, s\"'A' and 'D' concurrent, despite minlatency ${edge.manager.minLatency}\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2151) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2165) begin
          $fwrite(32'h80000002,"Assertion failed: TileLink timeout expired (connected at HellaCache.scala:220:21)\n    at Monitor.scala:479 assert (!inflight.orR || limit === UInt(0) || watchdog < limit, \"TileLink timeout expired\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2165) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2202 & _T_2209) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel re-used a sink ID (connected at HellaCache.scala:220:21)\n    at Monitor.scala:494 assert(!inflight(bundle.d.bits.sink), \"'D' channel re-used a sink ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2202 & _T_2209) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_2212 & _T_2221) begin
          $fwrite(32'h80000002,"Assertion failed: 'E' channel acknowledged for nothing inflight (connected at HellaCache.scala:220:21)\n    at Monitor.scala:500 assert((d_set | inflight)(bundle.e.bits.sink), \"'E' channel acknowledged for nothing inflight\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_2212 & _T_2221) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
