module TLMonitor_37( 
  input         clock, 
  input         reset, 
  input         io_in_a_ready, 
  input         io_in_a_valid, 
  input  [2:0]  io_in_a_bits_opcode, 
  input  [2:0]  io_in_a_bits_param, 
  input  [2:0]  io_in_a_bits_size, 
  input  [3:0]  io_in_a_bits_source, 
  input  [37:0] io_in_a_bits_address, 
  input  [7:0]  io_in_a_bits_mask, 
  input         io_in_a_bits_corrupt, 
  input         io_in_d_ready, 
  input         io_in_d_valid, 
  input  [2:0]  io_in_d_bits_opcode, 
  input  [1:0]  io_in_d_bits_param, 
  input  [2:0]  io_in_d_bits_size, 
  input  [3:0]  io_in_d_bits_source, 
  input  [2:0]  io_in_d_bits_sink, 
  input         io_in_d_bits_denied, 
  input         io_in_d_bits_corrupt 
);
  wire [31:0] plusarg_reader_out; 
  wire [13:0] _T_36; 
  wire [6:0] _T_37; 
  wire [6:0] _T_38; 
  wire [37:0] _GEN_18; 
  wire [37:0] _T_39; 
  wire  _T_40; 
  wire [1:0] _T_42; 
  wire [3:0] _T_43; 
  wire [2:0] _T_44; 
  wire [2:0] _T_45; 
  wire  _T_46; 
  wire  _T_47; 
  wire  _T_48; 
  wire  _T_49; 
  wire  _T_51; 
  wire  _T_52; 
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
  wire  _T_94; 
  wire  _T_95; 
  wire  _T_96; 
  wire  _T_97; 
  wire [1:0] _T_98; 
  wire [1:0] _T_99; 
  wire [3:0] _T_100; 
  wire [1:0] _T_101; 
  wire [1:0] _T_102; 
  wire [3:0] _T_103; 
  wire [7:0] _T_104; 
  wire [38:0] _T_115; 
  wire  _T_123; 
  wire [37:0] _T_128; 
  wire [38:0] _T_129; 
  wire [38:0] _T_130; 
  wire [38:0] _T_131; 
  wire  _T_132; 
  wire  _T_135; 
  wire [37:0] _T_138; 
  wire [38:0] _T_139; 
  wire [38:0] _T_140; 
  wire [38:0] _T_141; 
  wire  _T_142; 
  wire  _T_143; 
  wire [37:0] _T_145; 
  wire [38:0] _T_146; 
  wire [38:0] _T_147; 
  wire [38:0] _T_148; 
  wire  _T_149; 
  wire [37:0] _T_150; 
  wire [38:0] _T_151; 
  wire [38:0] _T_152; 
  wire [38:0] _T_153; 
  wire  _T_154; 
  wire [37:0] _T_155; 
  wire [38:0] _T_156; 
  wire [38:0] _T_157; 
  wire [38:0] _T_158; 
  wire  _T_159; 
  wire [37:0] _T_160; 
  wire [38:0] _T_161; 
  wire [38:0] _T_162; 
  wire [38:0] _T_163; 
  wire  _T_164; 
  wire [38:0] _T_167; 
  wire [38:0] _T_168; 
  wire  _T_169; 
  wire [37:0] _T_170; 
  wire [38:0] _T_171; 
  wire [38:0] _T_172; 
  wire [38:0] _T_173; 
  wire  _T_174; 
  wire [37:0] _T_175; 
  wire [38:0] _T_176; 
  wire [38:0] _T_177; 
  wire [38:0] _T_178; 
  wire  _T_179; 
  wire [37:0] _T_180; 
  wire [38:0] _T_181; 
  wire [38:0] _T_182; 
  wire [38:0] _T_183; 
  wire  _T_184; 
  wire  _T_185; 
  wire  _T_186; 
  wire  _T_187; 
  wire  _T_188; 
  wire  _T_189; 
  wire  _T_194; 
  wire  _T_197; 
  wire  _T_198; 
  wire  _T_201; 
  wire  _T_207; 
  wire  _T_208; 
  wire  _T_210; 
  wire  _T_211; 
  wire  _T_212; 
  wire  _T_214; 
  wire  _T_215; 
  wire [7:0] _T_216; 
  wire  _T_217; 
  wire  _T_219; 
  wire  _T_220; 
  wire  _T_221; 
  wire  _T_223; 
  wire  _T_224; 
  wire  _T_225; 
  wire  _T_318; 
  wire  _T_320; 
  wire  _T_321; 
  wire  _T_331; 
  wire  _T_396; 
  wire  _T_397; 
  wire  _T_398; 
  wire  _T_399; 
  wire  _T_401; 
  wire  _T_403; 
  wire  _T_404; 
  wire  _T_411; 
  wire  _T_413; 
  wire  _T_414; 
  wire  _T_415; 
  wire  _T_417; 
  wire  _T_418; 
  wire  _T_423; 
  wire  _T_438; 
  wire  _T_483; 
  wire  _T_484; 
  wire  _T_485; 
  wire  _T_494; 
  wire  _T_497; 
  wire  _T_498; 
  wire  _T_513; 
  wire [7:0] _T_599; 
  wire [7:0] _T_600; 
  wire  _T_601; 
  wire  _T_603; 
  wire  _T_604; 
  wire  _T_605; 
  wire  _T_607; 
  wire  _T_644; 
  wire  _T_645; 
  wire  _T_674; 
  wire  _T_675; 
  wire  _T_682; 
  wire  _T_684; 
  wire  _T_685; 
  wire  _T_690; 
  wire  _T_767; 
  wire  _T_769; 
  wire  _T_770; 
  wire  _T_775; 
  wire  _T_844; 
  wire  _T_845; 
  wire  _T_860; 
  wire  _T_862; 
  wire  _T_863; 
  wire  _T_879; 
  wire  _T_880; 
  wire  _T_884; 
  wire  _T_886; 
  wire  _T_887; 
  wire  _T_888; 
  wire  _T_890; 
  wire  _T_891; 
  wire  _T_892; 
  wire  _T_894; 
  wire  _T_895; 
  wire  _T_896; 
  wire  _T_898; 
  wire  _T_899; 
  wire  _T_900; 
  wire  _T_905; 
  wire  _T_906; 
  wire  _T_911; 
  wire  _T_913; 
  wire  _T_914; 
  wire  _T_915; 
  wire  _T_917; 
  wire  _T_918; 
  wire  _T_928; 
  wire  _T_948; 
  wire  _T_950; 
  wire  _T_951; 
  wire  _T_957; 
  wire  _T_974; 
  wire  _T_992; 
  wire  _T_1021; 
  wire [3:0] _T_1026; 
  wire  _T_1027; 
  wire  _T_1028; 
  reg [3:0] _T_1031; 
  reg [31:0] _RAND_0;
  wire [4:0] _T_1032; 
  wire [4:0] _T_1033; 
  wire [3:0] _T_1034; 
  wire  _T_1035; 
  reg [2:0] _T_1044; 
  reg [31:0] _RAND_1;
  reg [2:0] _T_1046; 
  reg [31:0] _RAND_2;
  reg [2:0] _T_1048; 
  reg [31:0] _RAND_3;
  reg [3:0] _T_1050; 
  reg [31:0] _RAND_4;
  reg [37:0] _T_1052; 
  reg [63:0] _RAND_5;
  wire  _T_1053; 
  wire  _T_1054; 
  wire  _T_1055; 
  wire  _T_1057; 
  wire  _T_1058; 
  wire  _T_1059; 
  wire  _T_1061; 
  wire  _T_1062; 
  wire  _T_1063; 
  wire  _T_1065; 
  wire  _T_1066; 
  wire  _T_1067; 
  wire  _T_1069; 
  wire  _T_1070; 
  wire  _T_1071; 
  wire  _T_1073; 
  wire  _T_1074; 
  wire  _T_1076; 
  wire  _T_1077; 
  wire [13:0] _T_1079; 
  wire [6:0] _T_1080; 
  wire [6:0] _T_1081; 
  wire [3:0] _T_1082; 
  wire  _T_1083; 
  reg [3:0] _T_1086; 
  reg [31:0] _RAND_6;
  wire [4:0] _T_1087; 
  wire [4:0] _T_1088; 
  wire [3:0] _T_1089; 
  wire  _T_1090; 
  reg [2:0] _T_1099; 
  reg [31:0] _RAND_7;
  reg [1:0] _T_1101; 
  reg [31:0] _RAND_8;
  reg [2:0] _T_1103; 
  reg [31:0] _RAND_9;
  reg [3:0] _T_1105; 
  reg [31:0] _RAND_10;
  reg [2:0] _T_1107; 
  reg [31:0] _RAND_11;
  reg  _T_1109; 
  reg [31:0] _RAND_12;
  wire  _T_1110; 
  wire  _T_1111; 
  wire  _T_1112; 
  wire  _T_1114; 
  wire  _T_1115; 
  wire  _T_1116; 
  wire  _T_1118; 
  wire  _T_1119; 
  wire  _T_1120; 
  wire  _T_1122; 
  wire  _T_1123; 
  wire  _T_1124; 
  wire  _T_1126; 
  wire  _T_1127; 
  wire  _T_1128; 
  wire  _T_1130; 
  wire  _T_1131; 
  wire  _T_1132; 
  wire  _T_1134; 
  wire  _T_1135; 
  wire  _T_1137; 
  reg [15:0] _T_1139; 
  reg [31:0] _RAND_13;
  reg [3:0] _T_1150; 
  reg [31:0] _RAND_14;
  wire [4:0] _T_1151; 
  wire [4:0] _T_1152; 
  wire [3:0] _T_1153; 
  wire  _T_1154; 
  reg [3:0] _T_1171; 
  reg [31:0] _RAND_15;
  wire [4:0] _T_1172; 
  wire [4:0] _T_1173; 
  wire [3:0] _T_1174; 
  wire  _T_1175; 
  wire  _T_1186; 
  wire [15:0] _T_1188; 
  wire [15:0] _T_1189; 
  wire  _T_1190; 
  wire  _T_1191; 
  wire  _T_1193; 
  wire  _T_1194; 
  wire [15:0] _GEN_15; 
  wire  _T_1199; 
  wire  _T_1201; 
  wire  _T_1202; 
  wire [15:0] _T_1203; 
  wire [15:0] _T_1204; 
  wire [15:0] _T_1205; 
  wire  _T_1206; 
  wire  _T_1208; 
  wire  _T_1209; 
  wire [15:0] _GEN_16; 
  wire  _T_1210; 
  wire  _T_1211; 
  wire  _T_1212; 
  wire  _T_1213; 
  wire  _T_1215; 
  wire  _T_1216; 
  wire [15:0] _T_1217; 
  wire [15:0] _T_1218; 
  wire [15:0] _T_1219; 
  reg [31:0] _T_1221; 
  reg [31:0] _RAND_16;
  wire  _T_1222; 
  wire  _T_1223; 
  wire  _T_1224; 
  wire  _T_1225; 
  wire  _T_1226; 
  wire  _T_1227; 
  wire  _T_1229; 
  wire  _T_1230; 
  wire [31:0] _T_1232; 
  wire  _T_1235; 
  wire  _GEN_19; 
  wire  _GEN_33; 
  wire  _GEN_49; 
  wire  _GEN_59; 
  wire  _GEN_67; 
  wire  _GEN_75; 
  wire  _GEN_83; 
  wire  _GEN_91; 
  wire  _GEN_99; 
  wire  _GEN_107; 
  wire  _GEN_117; 
  wire  _GEN_127; 
  wire  _GEN_131; 
  wire  _GEN_135; 
  plusarg_reader #(.FORMAT("tilelink_timeout=%d"), .DEFAULT(0)) plusarg_reader ( 
    .out(plusarg_reader_out)
  );
  assign _T_36 = 14'h7f << io_in_a_bits_size; 
  assign _T_37 = _T_36[6:0]; 
  assign _T_38 = ~ _T_37; 
  assign _GEN_18 = {{31'd0}, _T_38}; 
  assign _T_39 = io_in_a_bits_address & _GEN_18; 
  assign _T_40 = _T_39 == 38'h0; 
  assign _T_42 = io_in_a_bits_size[1:0]; 
  assign _T_43 = 4'h1 << _T_42; 
  assign _T_44 = _T_43[2:0]; 
  assign _T_45 = _T_44 | 3'h1; 
  assign _T_46 = io_in_a_bits_size >= 3'h3; 
  assign _T_47 = _T_45[2]; 
  assign _T_48 = io_in_a_bits_address[2]; 
  assign _T_49 = _T_48 == 1'h0; 
  assign _T_51 = _T_47 & _T_49; 
  assign _T_52 = _T_46 | _T_51; 
  assign _T_54 = _T_47 & _T_48; 
  assign _T_55 = _T_46 | _T_54; 
  assign _T_56 = _T_45[1]; 
  assign _T_57 = io_in_a_bits_address[1]; 
  assign _T_58 = _T_57 == 1'h0; 
  assign _T_59 = _T_49 & _T_58; 
  assign _T_60 = _T_56 & _T_59; 
  assign _T_61 = _T_52 | _T_60; 
  assign _T_62 = _T_49 & _T_57; 
  assign _T_63 = _T_56 & _T_62; 
  assign _T_64 = _T_52 | _T_63; 
  assign _T_65 = _T_48 & _T_58; 
  assign _T_66 = _T_56 & _T_65; 
  assign _T_67 = _T_55 | _T_66; 
  assign _T_68 = _T_48 & _T_57; 
  assign _T_69 = _T_56 & _T_68; 
  assign _T_70 = _T_55 | _T_69; 
  assign _T_71 = _T_45[0]; 
  assign _T_72 = io_in_a_bits_address[0]; 
  assign _T_73 = _T_72 == 1'h0; 
  assign _T_74 = _T_59 & _T_73; 
  assign _T_75 = _T_71 & _T_74; 
  assign _T_76 = _T_61 | _T_75; 
  assign _T_77 = _T_59 & _T_72; 
  assign _T_78 = _T_71 & _T_77; 
  assign _T_79 = _T_61 | _T_78; 
  assign _T_80 = _T_62 & _T_73; 
  assign _T_81 = _T_71 & _T_80; 
  assign _T_82 = _T_64 | _T_81; 
  assign _T_83 = _T_62 & _T_72; 
  assign _T_84 = _T_71 & _T_83; 
  assign _T_85 = _T_64 | _T_84; 
  assign _T_86 = _T_65 & _T_73; 
  assign _T_87 = _T_71 & _T_86; 
  assign _T_88 = _T_67 | _T_87; 
  assign _T_89 = _T_65 & _T_72; 
  assign _T_90 = _T_71 & _T_89; 
  assign _T_91 = _T_67 | _T_90; 
  assign _T_92 = _T_68 & _T_73; 
  assign _T_93 = _T_71 & _T_92; 
  assign _T_94 = _T_70 | _T_93; 
  assign _T_95 = _T_68 & _T_72; 
  assign _T_96 = _T_71 & _T_95; 
  assign _T_97 = _T_70 | _T_96; 
  assign _T_98 = {_T_79,_T_76}; 
  assign _T_99 = {_T_85,_T_82}; 
  assign _T_100 = {_T_99,_T_98}; 
  assign _T_101 = {_T_91,_T_88}; 
  assign _T_102 = {_T_97,_T_94}; 
  assign _T_103 = {_T_102,_T_101}; 
  assign _T_104 = {_T_103,_T_100}; 
  assign _T_115 = {1'b0,$signed(io_in_a_bits_address)}; 
  assign _T_123 = io_in_a_bits_opcode == 3'h6; 
  assign _T_128 = io_in_a_bits_address ^ 38'h3000; 
  assign _T_129 = {1'b0,$signed(_T_128)}; 
  assign _T_130 = $signed(_T_129) & $signed(-39'sh1000); 
  assign _T_131 = $signed(_T_130); 
  assign _T_132 = $signed(_T_131) == $signed(39'sh0); 
  assign _T_135 = io_in_a_bits_size <= 3'h6; 
  assign _T_138 = io_in_a_bits_address ^ 38'h80000000; 
  assign _T_139 = {1'b0,$signed(_T_138)}; 
  assign _T_140 = $signed(_T_139) & $signed(-39'sh40000000); 
  assign _T_141 = $signed(_T_140); 
  assign _T_142 = $signed(_T_141) == $signed(39'sh0); 
  assign _T_143 = _T_135 & _T_142; 
  assign _T_145 = io_in_a_bits_address ^ 38'h64000000; 
  assign _T_146 = {1'b0,$signed(_T_145)}; 
  assign _T_147 = $signed(_T_146) & $signed(-39'sh2000); 
  assign _T_148 = $signed(_T_147); 
  assign _T_149 = $signed(_T_148) == $signed(39'sh0); 
  assign _T_150 = io_in_a_bits_address ^ 38'h64002000; 
  assign _T_151 = {1'b0,$signed(_T_150)}; 
  assign _T_152 = $signed(_T_151) & $signed(-39'sh1000); 
  assign _T_153 = $signed(_T_152); 
  assign _T_154 = $signed(_T_153) == $signed(39'sh0); 
  assign _T_155 = io_in_a_bits_address ^ 38'hc000000; 
  assign _T_156 = {1'b0,$signed(_T_155)}; 
  assign _T_157 = $signed(_T_156) & $signed(-39'sh4000000); 
  assign _T_158 = $signed(_T_157); 
  assign _T_159 = $signed(_T_158) == $signed(39'sh0); 
  assign _T_160 = io_in_a_bits_address ^ 38'h2000000; 
  assign _T_161 = {1'b0,$signed(_T_160)}; 
  assign _T_162 = $signed(_T_161) & $signed(-39'sh10000); 
  assign _T_163 = $signed(_T_162); 
  assign _T_164 = $signed(_T_163) == $signed(39'sh0); 
  assign _T_167 = $signed(_T_115) & $signed(-39'sh1000); 
  assign _T_168 = $signed(_T_167); 
  assign _T_169 = $signed(_T_168) == $signed(39'sh0); 
  assign _T_170 = io_in_a_bits_address ^ 38'h10000; 
  assign _T_171 = {1'b0,$signed(_T_170)}; 
  assign _T_172 = $signed(_T_171) & $signed(-39'sh2000); 
  assign _T_173 = $signed(_T_172); 
  assign _T_174 = $signed(_T_173) == $signed(39'sh0); 
  assign _T_175 = io_in_a_bits_address ^ 38'h40000000; 
  assign _T_176 = {1'b0,$signed(_T_175)}; 
  assign _T_177 = $signed(_T_176) & $signed(-39'sh20000000); 
  assign _T_178 = $signed(_T_177); 
  assign _T_179 = $signed(_T_178) == $signed(39'sh0); 
  assign _T_180 = io_in_a_bits_address ^ 38'h2000000000; 
  assign _T_181 = {1'b0,$signed(_T_180)}; 
  assign _T_182 = $signed(_T_181) & $signed(-39'sh4000000); 
  assign _T_183 = $signed(_T_182); 
  assign _T_184 = $signed(_T_183) == $signed(39'sh0); 
  assign _T_185 = _T_149 | _T_154; 
  assign _T_186 = _T_185 | _T_159; 
  assign _T_187 = _T_186 | _T_164; 
  assign _T_188 = _T_187 | _T_169; 
  assign _T_189 = _T_188 | _T_174; 
  assign _T_194 = _T_132 | _T_143; 
  assign _T_197 = _T_194 | reset; 
  assign _T_198 = _T_197 == 1'h0; 
  assign _T_201 = reset == 1'h0; 
  assign _T_207 = _T_46 | reset; 
  assign _T_208 = _T_207 == 1'h0; 
  assign _T_210 = _T_40 | reset; 
  assign _T_211 = _T_210 == 1'h0; 
  assign _T_212 = io_in_a_bits_param <= 3'h2; 
  assign _T_214 = _T_212 | reset; 
  assign _T_215 = _T_214 == 1'h0; 
  assign _T_216 = ~ io_in_a_bits_mask; 
  assign _T_217 = _T_216 == 8'h0; 
  assign _T_219 = _T_217 | reset; 
  assign _T_220 = _T_219 == 1'h0; 
  assign _T_221 = io_in_a_bits_corrupt == 1'h0; 
  assign _T_223 = _T_221 | reset; 
  assign _T_224 = _T_223 == 1'h0; 
  assign _T_225 = io_in_a_bits_opcode == 3'h7; 
  assign _T_318 = io_in_a_bits_param != 3'h0; 
  assign _T_320 = _T_318 | reset; 
  assign _T_321 = _T_320 == 1'h0; 
  assign _T_331 = io_in_a_bits_opcode == 3'h4; 
  assign _T_396 = _T_189 | _T_142; 
  assign _T_397 = _T_396 | _T_179; 
  assign _T_398 = _T_397 | _T_184; 
  assign _T_399 = _T_135 & _T_398; 
  assign _T_401 = _T_132 | _T_399; 
  assign _T_403 = _T_401 | reset; 
  assign _T_404 = _T_403 == 1'h0; 
  assign _T_411 = io_in_a_bits_param == 3'h0; 
  assign _T_413 = _T_411 | reset; 
  assign _T_414 = _T_413 == 1'h0; 
  assign _T_415 = io_in_a_bits_mask == _T_104; 
  assign _T_417 = _T_415 | reset; 
  assign _T_418 = _T_417 == 1'h0; 
  assign _T_423 = io_in_a_bits_opcode == 3'h0; 
  assign _T_438 = _T_132 | _T_179; 
  assign _T_483 = _T_188 | _T_142; 
  assign _T_484 = _T_483 | _T_184; 
  assign _T_485 = _T_135 & _T_484; 
  assign _T_494 = _T_438 | _T_485; 
  assign _T_497 = _T_494 | reset; 
  assign _T_498 = _T_497 == 1'h0; 
  assign _T_513 = io_in_a_bits_opcode == 3'h1; 
  assign _T_599 = ~ _T_104; 
  assign _T_600 = io_in_a_bits_mask & _T_599; 
  assign _T_601 = _T_600 == 8'h0; 
  assign _T_603 = _T_601 | reset; 
  assign _T_604 = _T_603 == 1'h0; 
  assign _T_605 = io_in_a_bits_opcode == 3'h2; 
  assign _T_607 = io_in_a_bits_size <= 3'h3; 
  assign _T_644 = _T_188 | _T_132; 
  assign _T_645 = _T_607 & _T_644; 
  assign _T_674 = _T_645 | reset; 
  assign _T_675 = _T_674 == 1'h0; 
  assign _T_682 = io_in_a_bits_param <= 3'h4; 
  assign _T_684 = _T_682 | reset; 
  assign _T_685 = _T_684 == 1'h0; 
  assign _T_690 = io_in_a_bits_opcode == 3'h3; 
  assign _T_767 = io_in_a_bits_param <= 3'h3; 
  assign _T_769 = _T_767 | reset; 
  assign _T_770 = _T_769 == 1'h0; 
  assign _T_775 = io_in_a_bits_opcode == 3'h5; 
  assign _T_844 = _T_132 | reset; 
  assign _T_845 = _T_844 == 1'h0; 
  assign _T_860 = io_in_d_bits_opcode <= 3'h6; 
  assign _T_862 = _T_860 | reset; 
  assign _T_863 = _T_862 == 1'h0; 
  assign _T_879 = io_in_d_bits_sink < 3'h5; 
  assign _T_880 = io_in_d_bits_opcode == 3'h6; 
  assign _T_884 = io_in_d_bits_size >= 3'h3; 
  assign _T_886 = _T_884 | reset; 
  assign _T_887 = _T_886 == 1'h0; 
  assign _T_888 = io_in_d_bits_param == 2'h0; 
  assign _T_890 = _T_888 | reset; 
  assign _T_891 = _T_890 == 1'h0; 
  assign _T_892 = io_in_d_bits_corrupt == 1'h0; 
  assign _T_894 = _T_892 | reset; 
  assign _T_895 = _T_894 == 1'h0; 
  assign _T_896 = io_in_d_bits_denied == 1'h0; 
  assign _T_898 = _T_896 | reset; 
  assign _T_899 = _T_898 == 1'h0; 
  assign _T_900 = io_in_d_bits_opcode == 3'h4; 
  assign _T_905 = _T_879 | reset; 
  assign _T_906 = _T_905 == 1'h0; 
  assign _T_911 = io_in_d_bits_param <= 2'h2; 
  assign _T_913 = _T_911 | reset; 
  assign _T_914 = _T_913 == 1'h0; 
  assign _T_915 = io_in_d_bits_param != 2'h2; 
  assign _T_917 = _T_915 | reset; 
  assign _T_918 = _T_917 == 1'h0; 
  assign _T_928 = io_in_d_bits_opcode == 3'h5; 
  assign _T_948 = _T_896 | io_in_d_bits_corrupt; 
  assign _T_950 = _T_948 | reset; 
  assign _T_951 = _T_950 == 1'h0; 
  assign _T_957 = io_in_d_bits_opcode == 3'h0; 
  assign _T_974 = io_in_d_bits_opcode == 3'h1; 
  assign _T_992 = io_in_d_bits_opcode == 3'h2; 
  assign _T_1021 = io_in_a_ready & io_in_a_valid; 
  assign _T_1026 = _T_38[6:3]; 
  assign _T_1027 = io_in_a_bits_opcode[2]; 
  assign _T_1028 = _T_1027 == 1'h0; 
  assign _T_1032 = _T_1031 - 4'h1; 
  assign _T_1033 = $unsigned(_T_1032); 
  assign _T_1034 = _T_1033[3:0]; 
  assign _T_1035 = _T_1031 == 4'h0; 
  assign _T_1053 = _T_1035 == 1'h0; 
  assign _T_1054 = io_in_a_valid & _T_1053; 
  assign _T_1055 = io_in_a_bits_opcode == _T_1044; 
  assign _T_1057 = _T_1055 | reset; 
  assign _T_1058 = _T_1057 == 1'h0; 
  assign _T_1059 = io_in_a_bits_param == _T_1046; 
  assign _T_1061 = _T_1059 | reset; 
  assign _T_1062 = _T_1061 == 1'h0; 
  assign _T_1063 = io_in_a_bits_size == _T_1048; 
  assign _T_1065 = _T_1063 | reset; 
  assign _T_1066 = _T_1065 == 1'h0; 
  assign _T_1067 = io_in_a_bits_source == _T_1050; 
  assign _T_1069 = _T_1067 | reset; 
  assign _T_1070 = _T_1069 == 1'h0; 
  assign _T_1071 = io_in_a_bits_address == _T_1052; 
  assign _T_1073 = _T_1071 | reset; 
  assign _T_1074 = _T_1073 == 1'h0; 
  assign _T_1076 = _T_1021 & _T_1035; 
  assign _T_1077 = io_in_d_ready & io_in_d_valid; 
  assign _T_1079 = 14'h7f << io_in_d_bits_size; 
  assign _T_1080 = _T_1079[6:0]; 
  assign _T_1081 = ~ _T_1080; 
  assign _T_1082 = _T_1081[6:3]; 
  assign _T_1083 = io_in_d_bits_opcode[0]; 
  assign _T_1087 = _T_1086 - 4'h1; 
  assign _T_1088 = $unsigned(_T_1087); 
  assign _T_1089 = _T_1088[3:0]; 
  assign _T_1090 = _T_1086 == 4'h0; 
  assign _T_1110 = _T_1090 == 1'h0; 
  assign _T_1111 = io_in_d_valid & _T_1110; 
  assign _T_1112 = io_in_d_bits_opcode == _T_1099; 
  assign _T_1114 = _T_1112 | reset; 
  assign _T_1115 = _T_1114 == 1'h0; 
  assign _T_1116 = io_in_d_bits_param == _T_1101; 
  assign _T_1118 = _T_1116 | reset; 
  assign _T_1119 = _T_1118 == 1'h0; 
  assign _T_1120 = io_in_d_bits_size == _T_1103; 
  assign _T_1122 = _T_1120 | reset; 
  assign _T_1123 = _T_1122 == 1'h0; 
  assign _T_1124 = io_in_d_bits_source == _T_1105; 
  assign _T_1126 = _T_1124 | reset; 
  assign _T_1127 = _T_1126 == 1'h0; 
  assign _T_1128 = io_in_d_bits_sink == _T_1107; 
  assign _T_1130 = _T_1128 | reset; 
  assign _T_1131 = _T_1130 == 1'h0; 
  assign _T_1132 = io_in_d_bits_denied == _T_1109; 
  assign _T_1134 = _T_1132 | reset; 
  assign _T_1135 = _T_1134 == 1'h0; 
  assign _T_1137 = _T_1077 & _T_1090; 
  assign _T_1151 = _T_1150 - 4'h1; 
  assign _T_1152 = $unsigned(_T_1151); 
  assign _T_1153 = _T_1152[3:0]; 
  assign _T_1154 = _T_1150 == 4'h0; 
  assign _T_1172 = _T_1171 - 4'h1; 
  assign _T_1173 = $unsigned(_T_1172); 
  assign _T_1174 = _T_1173[3:0]; 
  assign _T_1175 = _T_1171 == 4'h0; 
  assign _T_1186 = _T_1021 & _T_1154; 
  assign _T_1188 = 16'h1 << io_in_a_bits_source; 
  assign _T_1189 = _T_1139 >> io_in_a_bits_source; 
  assign _T_1190 = _T_1189[0]; 
  assign _T_1191 = _T_1190 == 1'h0; 
  assign _T_1193 = _T_1191 | reset; 
  assign _T_1194 = _T_1193 == 1'h0; 
  assign _GEN_15 = _T_1186 ? _T_1188 : 16'h0; 
  assign _T_1199 = _T_1077 & _T_1175; 
  assign _T_1201 = _T_880 == 1'h0; 
  assign _T_1202 = _T_1199 & _T_1201; 
  assign _T_1203 = 16'h1 << io_in_d_bits_source; 
  assign _T_1204 = _GEN_15 | _T_1139; 
  assign _T_1205 = _T_1204 >> io_in_d_bits_source; 
  assign _T_1206 = _T_1205[0]; 
  assign _T_1208 = _T_1206 | reset; 
  assign _T_1209 = _T_1208 == 1'h0; 
  assign _GEN_16 = _T_1202 ? _T_1203 : 16'h0; 
  assign _T_1210 = _GEN_15 != _GEN_16; 
  assign _T_1211 = _GEN_15 != 16'h0; 
  assign _T_1212 = _T_1211 == 1'h0; 
  assign _T_1213 = _T_1210 | _T_1212; 
  assign _T_1215 = _T_1213 | reset; 
  assign _T_1216 = _T_1215 == 1'h0; 
  assign _T_1217 = _T_1139 | _GEN_15; 
  assign _T_1218 = ~ _GEN_16; 
  assign _T_1219 = _T_1217 & _T_1218; 
  assign _T_1222 = _T_1139 != 16'h0; 
  assign _T_1223 = _T_1222 == 1'h0; 
  assign _T_1224 = plusarg_reader_out == 32'h0; 
  assign _T_1225 = _T_1223 | _T_1224; 
  assign _T_1226 = _T_1221 < plusarg_reader_out; 
  assign _T_1227 = _T_1225 | _T_1226; 
  assign _T_1229 = _T_1227 | reset; 
  assign _T_1230 = _T_1229 == 1'h0; 
  assign _T_1232 = _T_1221 + 32'h1; 
  assign _T_1235 = _T_1021 | _T_1077; 
  assign _GEN_19 = io_in_a_valid & _T_123; 
  assign _GEN_33 = io_in_a_valid & _T_225; 
  assign _GEN_49 = io_in_a_valid & _T_331; 
  assign _GEN_59 = io_in_a_valid & _T_423; 
  assign _GEN_67 = io_in_a_valid & _T_513; 
  assign _GEN_75 = io_in_a_valid & _T_605; 
  assign _GEN_83 = io_in_a_valid & _T_690; 
  assign _GEN_91 = io_in_a_valid & _T_775; 
  assign _GEN_99 = io_in_d_valid & _T_880; 
  assign _GEN_107 = io_in_d_valid & _T_900; 
  assign _GEN_117 = io_in_d_valid & _T_928; 
  assign _GEN_127 = io_in_d_valid & _T_957; 
  assign _GEN_131 = io_in_d_valid & _T_974; 
  assign _GEN_135 = io_in_d_valid & _T_992; 
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
  _T_1031 = _RAND_0[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T_1044 = _RAND_1[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_1046 = _RAND_2[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_1048 = _RAND_3[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_1050 = _RAND_4[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {2{`RANDOM}};
  _T_1052 = _RAND_5[37:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  _T_1086 = _RAND_6[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  _T_1099 = _RAND_7[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  _T_1101 = _RAND_8[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  _T_1103 = _RAND_9[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  _T_1105 = _RAND_10[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  _T_1107 = _RAND_11[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  _T_1109 = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  _T_1139 = _RAND_13[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  _T_1150 = _RAND_14[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  _T_1171 = _RAND_15[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  _T_1221 = _RAND_16[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      _T_1031 <= 4'h0;
    end else begin
      if (_T_1021) begin
        if (_T_1035) begin
          if (_T_1028) begin
            _T_1031 <= _T_1026;
          end else begin
            _T_1031 <= 4'h0;
          end
        end else begin
          _T_1031 <= _T_1034;
        end
      end
    end
    if (_T_1076) begin
      _T_1044 <= io_in_a_bits_opcode;
    end
    if (_T_1076) begin
      _T_1046 <= io_in_a_bits_param;
    end
    if (_T_1076) begin
      _T_1048 <= io_in_a_bits_size;
    end
    if (_T_1076) begin
      _T_1050 <= io_in_a_bits_source;
    end
    if (_T_1076) begin
      _T_1052 <= io_in_a_bits_address;
    end
    if (reset) begin
      _T_1086 <= 4'h0;
    end else begin
      if (_T_1077) begin
        if (_T_1090) begin
          if (_T_1083) begin
            _T_1086 <= _T_1082;
          end else begin
            _T_1086 <= 4'h0;
          end
        end else begin
          _T_1086 <= _T_1089;
        end
      end
    end
    if (_T_1137) begin
      _T_1099 <= io_in_d_bits_opcode;
    end
    if (_T_1137) begin
      _T_1101 <= io_in_d_bits_param;
    end
    if (_T_1137) begin
      _T_1103 <= io_in_d_bits_size;
    end
    if (_T_1137) begin
      _T_1105 <= io_in_d_bits_source;
    end
    if (_T_1137) begin
      _T_1107 <= io_in_d_bits_sink;
    end
    if (_T_1137) begin
      _T_1109 <= io_in_d_bits_denied;
    end
    if (reset) begin
      _T_1139 <= 16'h0;
    end else begin
      _T_1139 <= _T_1219;
    end
    if (reset) begin
      _T_1150 <= 4'h0;
    end else begin
      if (_T_1021) begin
        if (_T_1154) begin
          if (_T_1028) begin
            _T_1150 <= _T_1026;
          end else begin
            _T_1150 <= 4'h0;
          end
        end else begin
          _T_1150 <= _T_1153;
        end
      end
    end
    if (reset) begin
      _T_1171 <= 4'h0;
    end else begin
      if (_T_1077) begin
        if (_T_1175) begin
          if (_T_1083) begin
            _T_1171 <= _T_1082;
          end else begin
            _T_1171 <= 4'h0;
          end
        end else begin
          _T_1171 <= _T_1174;
        end
      end
    end
    if (reset) begin
      _T_1221 <= 32'h0;
    end else begin
      if (_T_1235) begin
        _T_1221 <= 32'h0;
      end else begin
        _T_1221 <= _T_1232;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel has invalid opcode (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:39 assert (TLMessages.isA(bundle.opcode), \"'A' channel has invalid opcode\" + extra)\n"); 
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
        if (_GEN_19 & _T_198) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries AcquireBlock type unsupported by manager (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:49 assert (edge.manager.supportsAcquireBSafe(edge.address(bundle), bundle.size), \"'A' channel carries AcquireBlock type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_19 & _T_198) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_19 & _T_201) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries AcquireBlock from a client which does not support Probe (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:50 assert (edge.client.supportsProbe(edge.source(bundle), bundle.size), \"'A' channel carries AcquireBlock from a client which does not support Probe\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_19 & _T_201) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock carries invalid source ID (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:51 assert (source_ok, \"'A' channel AcquireBlock carries invalid source ID\" + extra)\n"); 
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
        if (_GEN_19 & _T_208) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock smaller than a beat (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:52 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'A' channel AcquireBlock smaller than a beat\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_19 & _T_208) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_19 & _T_211) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock address not aligned to size (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:53 assert (is_aligned, \"'A' channel AcquireBlock address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_19 & _T_211) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_19 & _T_215) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock carries invalid grow param (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:54 assert (TLPermissions.isGrow(bundle.param), \"'A' channel AcquireBlock carries invalid grow param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_19 & _T_215) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_19 & _T_220) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock contains invalid mask (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:55 assert (~bundle.mask === UInt(0), \"'A' channel AcquireBlock contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_19 & _T_220) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_19 & _T_224) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock is corrupt (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:56 assert (!bundle.corrupt, \"'A' channel AcquireBlock is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_19 & _T_224) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_33 & _T_198) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries AcquirePerm type unsupported by manager (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:60 assert (edge.manager.supportsAcquireBSafe(edge.address(bundle), bundle.size), \"'A' channel carries AcquirePerm type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_33 & _T_198) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_33 & _T_201) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries AcquirePerm from a client which does not support Probe (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:61 assert (edge.client.supportsProbe(edge.source(bundle), bundle.size), \"'A' channel carries AcquirePerm from a client which does not support Probe\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_33 & _T_201) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm carries invalid source ID (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:62 assert (source_ok, \"'A' channel AcquirePerm carries invalid source ID\" + extra)\n"); 
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
        if (_GEN_33 & _T_208) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm smaller than a beat (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:63 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'A' channel AcquirePerm smaller than a beat\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_33 & _T_208) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_33 & _T_211) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm address not aligned to size (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:64 assert (is_aligned, \"'A' channel AcquirePerm address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_33 & _T_211) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_33 & _T_215) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm carries invalid grow param (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:65 assert (TLPermissions.isGrow(bundle.param), \"'A' channel AcquirePerm carries invalid grow param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_33 & _T_215) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_33 & _T_321) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm requests NtoB (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:66 assert (bundle.param =/= TLPermissions.NtoB, \"'A' channel AcquirePerm requests NtoB\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_33 & _T_321) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_33 & _T_220) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm contains invalid mask (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:67 assert (~bundle.mask === UInt(0), \"'A' channel AcquirePerm contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_33 & _T_220) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_33 & _T_224) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm is corrupt (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:68 assert (!bundle.corrupt, \"'A' channel AcquirePerm is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_33 & _T_224) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_49 & _T_404) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries Get type unsupported by manager (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:72 assert (edge.manager.supportsGetSafe(edge.address(bundle), bundle.size), \"'A' channel carries Get type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_49 & _T_404) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Get carries invalid source ID (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:73 assert (source_ok, \"'A' channel Get carries invalid source ID\" + extra)\n"); 
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
        if (_GEN_49 & _T_211) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Get address not aligned to size (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:74 assert (is_aligned, \"'A' channel Get address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_49 & _T_211) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_49 & _T_414) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Get carries invalid param (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:75 assert (bundle.param === UInt(0), \"'A' channel Get carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_49 & _T_414) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_49 & _T_418) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Get contains invalid mask (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:76 assert (bundle.mask === mask, \"'A' channel Get contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_49 & _T_418) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_49 & _T_224) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Get is corrupt (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:77 assert (!bundle.corrupt, \"'A' channel Get is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_49 & _T_224) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_59 & _T_498) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries PutFull type unsupported by manager (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:81 assert (edge.manager.supportsPutFullSafe(edge.address(bundle), bundle.size), \"'A' channel carries PutFull type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_59 & _T_498) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutFull carries invalid source ID (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:82 assert (source_ok, \"'A' channel PutFull carries invalid source ID\" + extra)\n"); 
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
        if (_GEN_59 & _T_211) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutFull address not aligned to size (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:83 assert (is_aligned, \"'A' channel PutFull address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_59 & _T_211) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_59 & _T_414) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutFull carries invalid param (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:84 assert (bundle.param === UInt(0), \"'A' channel PutFull carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_59 & _T_414) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_59 & _T_418) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutFull contains invalid mask (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:85 assert (bundle.mask === mask, \"'A' channel PutFull contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_59 & _T_418) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_67 & _T_498) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries PutPartial type unsupported by manager (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:89 assert (edge.manager.supportsPutPartialSafe(edge.address(bundle), bundle.size), \"'A' channel carries PutPartial type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_67 & _T_498) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutPartial carries invalid source ID (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:90 assert (source_ok, \"'A' channel PutPartial carries invalid source ID\" + extra)\n"); 
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
        if (_GEN_67 & _T_211) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutPartial address not aligned to size (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:91 assert (is_aligned, \"'A' channel PutPartial address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_67 & _T_211) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_67 & _T_414) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutPartial carries invalid param (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:92 assert (bundle.param === UInt(0), \"'A' channel PutPartial carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_67 & _T_414) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_67 & _T_604) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutPartial contains invalid mask (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:93 assert ((bundle.mask & ~mask) === UInt(0), \"'A' channel PutPartial contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_67 & _T_604) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_75 & _T_675) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries Arithmetic type unsupported by manager (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:97 assert (edge.manager.supportsArithmeticSafe(edge.address(bundle), bundle.size), \"'A' channel carries Arithmetic type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_75 & _T_675) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Arithmetic carries invalid source ID (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:98 assert (source_ok, \"'A' channel Arithmetic carries invalid source ID\" + extra)\n"); 
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
        if (_GEN_75 & _T_211) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Arithmetic address not aligned to size (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:99 assert (is_aligned, \"'A' channel Arithmetic address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_75 & _T_211) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_75 & _T_685) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Arithmetic carries invalid opcode param (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:100 assert (TLAtomics.isArithmetic(bundle.param), \"'A' channel Arithmetic carries invalid opcode param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_75 & _T_685) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_75 & _T_418) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Arithmetic contains invalid mask (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:101 assert (bundle.mask === mask, \"'A' channel Arithmetic contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_75 & _T_418) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_83 & _T_675) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries Logical type unsupported by manager (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:105 assert (edge.manager.supportsLogicalSafe(edge.address(bundle), bundle.size), \"'A' channel carries Logical type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_83 & _T_675) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Logical carries invalid source ID (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:106 assert (source_ok, \"'A' channel Logical carries invalid source ID\" + extra)\n"); 
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
        if (_GEN_83 & _T_211) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Logical address not aligned to size (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:107 assert (is_aligned, \"'A' channel Logical address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_83 & _T_211) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_83 & _T_770) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Logical carries invalid opcode param (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:108 assert (TLAtomics.isLogical(bundle.param), \"'A' channel Logical carries invalid opcode param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_83 & _T_770) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_83 & _T_418) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Logical contains invalid mask (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:109 assert (bundle.mask === mask, \"'A' channel Logical contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_83 & _T_418) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_91 & _T_845) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries Hint type unsupported by manager (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:113 assert (edge.manager.supportsHintSafe(edge.address(bundle), bundle.size), \"'A' channel carries Hint type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_91 & _T_845) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Hint carries invalid source ID (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:114 assert (source_ok, \"'A' channel Hint carries invalid source ID\" + extra)\n"); 
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
        if (_GEN_91 & _T_211) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Hint address not aligned to size (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:115 assert (is_aligned, \"'A' channel Hint address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_91 & _T_211) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_91 & _T_418) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Hint contains invalid mask (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:116 assert (bundle.mask === mask, \"'A' channel Hint contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_91 & _T_418) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_91 & _T_224) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Hint is corrupt (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:117 assert (!bundle.corrupt, \"'A' channel Hint is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_91 & _T_224) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_863) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel has invalid opcode (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:268 assert (TLMessages.isD(bundle.opcode), \"'D' channel has invalid opcode\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_d_valid & _T_863) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel ReleaseAck carries invalid source ID (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:276 assert (source_ok, \"'D' channel ReleaseAck carries invalid source ID\" + extra)\n"); 
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
        if (_GEN_99 & _T_887) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel ReleaseAck smaller than a beat (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:277 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'D' channel ReleaseAck smaller than a beat\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_99 & _T_887) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_99 & _T_891) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel ReleaseeAck carries invalid param (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:278 assert (bundle.param === UInt(0), \"'D' channel ReleaseeAck carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_99 & _T_891) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_99 & _T_895) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel ReleaseAck is corrupt (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:279 assert (!bundle.corrupt, \"'D' channel ReleaseAck is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_99 & _T_895) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_99 & _T_899) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel ReleaseAck is denied (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:280 assert (!bundle.denied, \"'D' channel ReleaseAck is denied\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_99 & _T_899) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant carries invalid source ID (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:284 assert (source_ok, \"'D' channel Grant carries invalid source ID\" + extra)\n"); 
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
        if (_GEN_107 & _T_906) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant carries invalid sink ID (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:285 assert (sink_ok, \"'D' channel Grant carries invalid sink ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_107 & _T_906) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_107 & _T_887) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant smaller than a beat (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:286 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'D' channel Grant smaller than a beat\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_107 & _T_887) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_107 & _T_914) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant carries invalid cap param (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:287 assert (TLPermissions.isCap(bundle.param), \"'D' channel Grant carries invalid cap param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_107 & _T_914) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_107 & _T_918) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant carries toN param (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:288 assert (bundle.param =/= TLPermissions.toN, \"'D' channel Grant carries toN param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_107 & _T_918) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_107 & _T_895) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant is corrupt (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:289 assert (!bundle.corrupt, \"'D' channel Grant is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_107 & _T_895) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant is denied (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:290 assert (deny_put_ok || !bundle.denied, \"'D' channel Grant is denied\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData carries invalid source ID (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:294 assert (source_ok, \"'D' channel GrantData carries invalid source ID\" + extra)\n"); 
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
        if (_GEN_117 & _T_906) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData carries invalid sink ID (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:295 assert (sink_ok, \"'D' channel GrantData carries invalid sink ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_117 & _T_906) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_117 & _T_887) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData smaller than a beat (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:296 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'D' channel GrantData smaller than a beat\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_117 & _T_887) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_117 & _T_914) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData carries invalid cap param (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:297 assert (TLPermissions.isCap(bundle.param), \"'D' channel GrantData carries invalid cap param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_117 & _T_914) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_117 & _T_918) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData carries toN param (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:298 assert (bundle.param =/= TLPermissions.toN, \"'D' channel GrantData carries toN param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_117 & _T_918) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_117 & _T_951) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData is denied but not corrupt (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:299 assert (!bundle.denied || bundle.corrupt, \"'D' channel GrantData is denied but not corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_117 & _T_951) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData is denied (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:300 assert (deny_get_ok || !bundle.denied, \"'D' channel GrantData is denied\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAck carries invalid source ID (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:304 assert (source_ok, \"'D' channel AccessAck carries invalid source ID\" + extra)\n"); 
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
        if (_GEN_127 & _T_891) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAck carries invalid param (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:306 assert (bundle.param === UInt(0), \"'D' channel AccessAck carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_127 & _T_891) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_127 & _T_895) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAck is corrupt (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:307 assert (!bundle.corrupt, \"'D' channel AccessAck is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_127 & _T_895) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAck is denied (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:308 assert (deny_put_ok || !bundle.denied, \"'D' channel AccessAck is denied\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAckData carries invalid source ID (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:312 assert (source_ok, \"'D' channel AccessAckData carries invalid source ID\" + extra)\n"); 
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
        if (_GEN_131 & _T_891) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAckData carries invalid param (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:314 assert (bundle.param === UInt(0), \"'D' channel AccessAckData carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_131 & _T_891) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_131 & _T_951) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAckData is denied but not corrupt (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:315 assert (!bundle.denied || bundle.corrupt, \"'D' channel AccessAckData is denied but not corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_131 & _T_951) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAckData is denied (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:316 assert (deny_get_ok || !bundle.denied, \"'D' channel AccessAckData is denied\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel HintAck carries invalid source ID (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:320 assert (source_ok, \"'D' channel HintAck carries invalid source ID\" + extra)\n"); 
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
        if (_GEN_135 & _T_891) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel HintAck carries invalid param (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:322 assert (bundle.param === UInt(0), \"'D' channel HintAck carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_135 & _T_891) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_135 & _T_895) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel HintAck is corrupt (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:323 assert (!bundle.corrupt, \"'D' channel HintAck is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_135 & _T_895) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel HintAck is denied (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:324 assert (deny_put_ok || !bundle.denied, \"'D' channel HintAck is denied\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'B' channel valid and not TL-C (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:341 assert (!bundle.b.valid, \"'B' channel valid and not TL-C\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'C' channel valid and not TL-C (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:342 assert (!bundle.c.valid, \"'C' channel valid and not TL-C\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'E' channel valid and not TL-C (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:343 assert (!bundle.e.valid, \"'E' channel valid and not TL-C\" + extra)\n"); 
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
        if (_T_1054 & _T_1058) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel opcode changed within multibeat operation (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:355 assert (a.bits.opcode === opcode, \"'A' channel opcode changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1054 & _T_1058) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1054 & _T_1062) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel param changed within multibeat operation (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:356 assert (a.bits.param  === param,  \"'A' channel param changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1054 & _T_1062) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1054 & _T_1066) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel size changed within multibeat operation (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:357 assert (a.bits.size   === size,   \"'A' channel size changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1054 & _T_1066) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1054 & _T_1070) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel source changed within multibeat operation (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:358 assert (a.bits.source === source, \"'A' channel source changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1054 & _T_1070) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1054 & _T_1074) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel address changed with multibeat operation (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:359 assert (a.bits.address=== address,\"'A' channel address changed with multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1054 & _T_1074) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1111 & _T_1115) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel opcode changed within multibeat operation (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:425 assert (d.bits.opcode === opcode, \"'D' channel opcode changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1111 & _T_1115) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1111 & _T_1119) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel param changed within multibeat operation (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:426 assert (d.bits.param  === param,  \"'D' channel param changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1111 & _T_1119) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1111 & _T_1123) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel size changed within multibeat operation (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:427 assert (d.bits.size   === size,   \"'D' channel size changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1111 & _T_1123) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1111 & _T_1127) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel source changed within multibeat operation (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:428 assert (d.bits.source === source, \"'D' channel source changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1111 & _T_1127) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1111 & _T_1131) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel sink changed with multibeat operation (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:429 assert (d.bits.sink   === sink,   \"'D' channel sink changed with multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1111 & _T_1131) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1111 & _T_1135) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel denied changed with multibeat operation (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:430 assert (d.bits.denied === denied, \"'D' channel denied changed with multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1111 & _T_1135) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1186 & _T_1194) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel re-used a source ID (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:460 assert(!inflight(bundle.a.bits.source), \"'A' channel re-used a source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1186 & _T_1194) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1202 & _T_1209) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel acknowledged for nothing inflight (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:467 assert((a_set | inflight)(bundle.d.bits.source), \"'D' channel acknowledged for nothing inflight\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1202 & _T_1209) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1216) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' and 'D' concurrent, despite minlatency 2 (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:471 assert(a_set =/= d_clr || !a_set.orR, s\"'A' and 'D' concurrent, despite minlatency ${edge.manager.minLatency}\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1216) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1230) begin
          $fwrite(32'h80000002,"Assertion failed: TileLink timeout expired (connected at BusWrapper.scala:136:39)\n    at Monitor.scala:479 assert (!inflight.orR || limit === UInt(0) || watchdog < limit, \"TileLink timeout expired\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1230) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
