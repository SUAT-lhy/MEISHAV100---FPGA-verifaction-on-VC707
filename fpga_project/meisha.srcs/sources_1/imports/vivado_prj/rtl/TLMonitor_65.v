module TLMonitor_65( 
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
  input         io_in_c_valid, 
  input         io_in_d_ready, 
  input         io_in_d_valid, 
  input  [2:0]  io_in_d_bits_opcode, 
  input  [1:0]  io_in_d_bits_param, 
  input  [2:0]  io_in_d_bits_size, 
  input  [2:0]  io_in_d_bits_sink, 
  input         io_in_d_bits_denied, 
  input         io_in_d_bits_corrupt, 
  input         io_in_e_valid 
);
  wire [31:0] plusarg_reader_out; 
  wire  _T_20; 
  wire [13:0] _T_29; 
  wire [6:0] _T_30; 
  wire [6:0] _T_31; 
  wire [37:0] _GEN_18; 
  wire [37:0] _T_32; 
  wire  _T_33; 
  wire [1:0] _T_35; 
  wire [3:0] _T_36; 
  wire [2:0] _T_37; 
  wire [2:0] _T_38; 
  wire  _T_39; 
  wire  _T_40; 
  wire  _T_41; 
  wire  _T_42; 
  wire  _T_44; 
  wire  _T_45; 
  wire  _T_47; 
  wire  _T_48; 
  wire  _T_49; 
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
  wire [1:0] _T_91; 
  wire [1:0] _T_92; 
  wire [3:0] _T_93; 
  wire [1:0] _T_94; 
  wire [1:0] _T_95; 
  wire [3:0] _T_96; 
  wire [7:0] _T_97; 
  wire [38:0] _T_101; 
  wire  _T_109; 
  wire [37:0] _T_114; 
  wire [38:0] _T_115; 
  wire [38:0] _T_116; 
  wire [38:0] _T_117; 
  wire  _T_118; 
  wire  _T_121; 
  wire [37:0] _T_124; 
  wire [38:0] _T_125; 
  wire [38:0] _T_126; 
  wire [38:0] _T_127; 
  wire  _T_128; 
  wire  _T_129; 
  wire [37:0] _T_131; 
  wire [38:0] _T_132; 
  wire [38:0] _T_133; 
  wire [38:0] _T_134; 
  wire  _T_135; 
  wire [37:0] _T_136; 
  wire [38:0] _T_137; 
  wire [38:0] _T_138; 
  wire [38:0] _T_139; 
  wire  _T_140; 
  wire [37:0] _T_141; 
  wire [38:0] _T_142; 
  wire [38:0] _T_143; 
  wire [38:0] _T_144; 
  wire  _T_145; 
  wire [37:0] _T_146; 
  wire [38:0] _T_147; 
  wire [38:0] _T_148; 
  wire [38:0] _T_149; 
  wire  _T_150; 
  wire [38:0] _T_153; 
  wire [38:0] _T_154; 
  wire  _T_155; 
  wire [37:0] _T_156; 
  wire [38:0] _T_157; 
  wire [38:0] _T_158; 
  wire [38:0] _T_159; 
  wire  _T_160; 
  wire [37:0] _T_161; 
  wire [38:0] _T_162; 
  wire [38:0] _T_163; 
  wire [38:0] _T_164; 
  wire  _T_165; 
  wire [37:0] _T_166; 
  wire [38:0] _T_167; 
  wire [38:0] _T_168; 
  wire [38:0] _T_169; 
  wire  _T_170; 
  wire  _T_171; 
  wire  _T_172; 
  wire  _T_173; 
  wire  _T_174; 
  wire  _T_175; 
  wire  _T_180; 
  wire  _T_183; 
  wire  _T_184; 
  wire  _T_187; 
  wire  _T_189; 
  wire  _T_190; 
  wire  _T_193; 
  wire  _T_194; 
  wire  _T_196; 
  wire  _T_197; 
  wire  _T_198; 
  wire  _T_200; 
  wire  _T_201; 
  wire [7:0] _T_202; 
  wire  _T_203; 
  wire  _T_205; 
  wire  _T_206; 
  wire  _T_207; 
  wire  _T_209; 
  wire  _T_210; 
  wire  _T_211; 
  wire  _T_304; 
  wire  _T_306; 
  wire  _T_307; 
  wire  _T_317; 
  wire  _T_382; 
  wire  _T_383; 
  wire  _T_384; 
  wire  _T_385; 
  wire  _T_387; 
  wire  _T_389; 
  wire  _T_390; 
  wire  _T_397; 
  wire  _T_399; 
  wire  _T_400; 
  wire  _T_401; 
  wire  _T_403; 
  wire  _T_404; 
  wire  _T_409; 
  wire  _T_424; 
  wire  _T_469; 
  wire  _T_470; 
  wire  _T_471; 
  wire  _T_480; 
  wire  _T_483; 
  wire  _T_484; 
  wire  _T_499; 
  wire [7:0] _T_585; 
  wire [7:0] _T_586; 
  wire  _T_587; 
  wire  _T_589; 
  wire  _T_590; 
  wire  _T_591; 
  wire  _T_593; 
  wire  _T_630; 
  wire  _T_631; 
  wire  _T_660; 
  wire  _T_661; 
  wire  _T_668; 
  wire  _T_670; 
  wire  _T_671; 
  wire  _T_676; 
  wire  _T_753; 
  wire  _T_755; 
  wire  _T_756; 
  wire  _T_761; 
  wire  _T_830; 
  wire  _T_831; 
  wire  _T_846; 
  wire  _T_848; 
  wire  _T_849; 
  wire  _T_859; 
  wire  _T_863; 
  wire  _T_865; 
  wire  _T_866; 
  wire  _T_867; 
  wire  _T_869; 
  wire  _T_870; 
  wire  _T_871; 
  wire  _T_873; 
  wire  _T_874; 
  wire  _T_875; 
  wire  _T_877; 
  wire  _T_878; 
  wire  _T_879; 
  wire  _T_890; 
  wire  _T_892; 
  wire  _T_893; 
  wire  _T_894; 
  wire  _T_896; 
  wire  _T_897; 
  wire  _T_907; 
  wire  _T_927; 
  wire  _T_929; 
  wire  _T_930; 
  wire  _T_936; 
  wire  _T_953; 
  wire  _T_971; 
  wire  _T_992; 
  wire  _T_994; 
  wire  _T_995; 
  wire  _T_996; 
  wire  _T_998; 
  wire  _T_999; 
  wire  _T_1000; 
  wire [3:0] _T_1005; 
  wire  _T_1006; 
  wire  _T_1007; 
  reg [3:0] _T_1010; 
  reg [31:0] _RAND_0;
  wire [4:0] _T_1011; 
  wire [4:0] _T_1012; 
  wire [3:0] _T_1013; 
  wire  _T_1014; 
  reg [2:0] _T_1023; 
  reg [31:0] _RAND_1;
  reg [2:0] _T_1025; 
  reg [31:0] _RAND_2;
  reg [2:0] _T_1027; 
  reg [31:0] _RAND_3;
  reg  _T_1029; 
  reg [31:0] _RAND_4;
  reg [37:0] _T_1031; 
  reg [63:0] _RAND_5;
  wire  _T_1032; 
  wire  _T_1033; 
  wire  _T_1034; 
  wire  _T_1036; 
  wire  _T_1037; 
  wire  _T_1038; 
  wire  _T_1040; 
  wire  _T_1041; 
  wire  _T_1042; 
  wire  _T_1044; 
  wire  _T_1045; 
  wire  _T_1046; 
  wire  _T_1048; 
  wire  _T_1049; 
  wire  _T_1050; 
  wire  _T_1052; 
  wire  _T_1053; 
  wire  _T_1055; 
  wire  _T_1056; 
  wire [13:0] _T_1058; 
  wire [6:0] _T_1059; 
  wire [6:0] _T_1060; 
  wire [3:0] _T_1061; 
  wire  _T_1062; 
  reg [3:0] _T_1065; 
  reg [31:0] _RAND_6;
  wire [4:0] _T_1066; 
  wire [4:0] _T_1067; 
  wire [3:0] _T_1068; 
  wire  _T_1069; 
  reg [2:0] _T_1078; 
  reg [31:0] _RAND_7;
  reg [1:0] _T_1080; 
  reg [31:0] _RAND_8;
  reg [2:0] _T_1082; 
  reg [31:0] _RAND_9;
  reg [2:0] _T_1086; 
  reg [31:0] _RAND_10;
  reg  _T_1088; 
  reg [31:0] _RAND_11;
  wire  _T_1089; 
  wire  _T_1090; 
  wire  _T_1091; 
  wire  _T_1093; 
  wire  _T_1094; 
  wire  _T_1095; 
  wire  _T_1097; 
  wire  _T_1098; 
  wire  _T_1099; 
  wire  _T_1101; 
  wire  _T_1102; 
  wire  _T_1107; 
  wire  _T_1109; 
  wire  _T_1110; 
  wire  _T_1111; 
  wire  _T_1113; 
  wire  _T_1114; 
  wire  _T_1116; 
  reg  _T_1118; 
  reg [31:0] _RAND_12;
  reg [3:0] _T_1129; 
  reg [31:0] _RAND_13;
  wire [4:0] _T_1130; 
  wire [4:0] _T_1131; 
  wire [3:0] _T_1132; 
  wire  _T_1133; 
  reg [3:0] _T_1150; 
  reg [31:0] _RAND_14;
  wire [4:0] _T_1151; 
  wire [4:0] _T_1152; 
  wire [3:0] _T_1153; 
  wire  _T_1154; 
  wire  _T_1165; 
  wire [1:0] _T_1167; 
  wire  _T_1168; 
  wire  _T_1170; 
  wire  _T_1172; 
  wire  _T_1173; 
  wire [1:0] _GEN_15; 
  wire  _T_1178; 
  wire  _T_1180; 
  wire  _T_1181; 
  wire [1:0] _T_1182; 
  wire  _T_1163; 
  wire  _T_1183; 
  wire  _T_1184; 
  wire  _T_1187; 
  wire  _T_1188; 
  wire [1:0] _GEN_16; 
  wire  _T_1175; 
  wire  _T_1189; 
  wire  _T_1191; 
  wire  _T_1192; 
  wire  _T_1194; 
  wire  _T_1195; 
  wire  _T_1196; 
  wire  _T_1197; 
  wire  _T_1198; 
  reg [31:0] _T_1200; 
  reg [31:0] _RAND_15;
  wire  _T_1202; 
  wire  _T_1203; 
  wire  _T_1204; 
  wire  _T_1205; 
  wire  _T_1206; 
  wire  _T_1208; 
  wire  _T_1209; 
  wire [31:0] _T_1211; 
  wire  _T_1214; 
  wire  _GEN_19; 
  wire  _GEN_35; 
  wire  _GEN_53; 
  wire  _GEN_65; 
  wire  _GEN_75; 
  wire  _GEN_85; 
  wire  _GEN_95; 
  wire  _GEN_105; 
  wire  _GEN_115; 
  wire  _GEN_123; 
  wire  _GEN_131; 
  wire  _GEN_139; 
  wire  _GEN_143; 
  wire  _GEN_147; 
  plusarg_reader #(.FORMAT("tilelink_timeout=%d"), .DEFAULT(0)) plusarg_reader ( 
    .out(plusarg_reader_out)
  );
  assign _T_20 = io_in_a_bits_source == 1'h0; 
  assign _T_29 = 14'h7f << io_in_a_bits_size; 
  assign _T_30 = _T_29[6:0]; 
  assign _T_31 = ~ _T_30; 
  assign _GEN_18 = {{31'd0}, _T_31}; 
  assign _T_32 = io_in_a_bits_address & _GEN_18; 
  assign _T_33 = _T_32 == 38'h0; 
  assign _T_35 = io_in_a_bits_size[1:0]; 
  assign _T_36 = 4'h1 << _T_35; 
  assign _T_37 = _T_36[2:0]; 
  assign _T_38 = _T_37 | 3'h1; 
  assign _T_39 = io_in_a_bits_size >= 3'h3; 
  assign _T_40 = _T_38[2]; 
  assign _T_41 = io_in_a_bits_address[2]; 
  assign _T_42 = _T_41 == 1'h0; 
  assign _T_44 = _T_40 & _T_42; 
  assign _T_45 = _T_39 | _T_44; 
  assign _T_47 = _T_40 & _T_41; 
  assign _T_48 = _T_39 | _T_47; 
  assign _T_49 = _T_38[1]; 
  assign _T_50 = io_in_a_bits_address[1]; 
  assign _T_51 = _T_50 == 1'h0; 
  assign _T_52 = _T_42 & _T_51; 
  assign _T_53 = _T_49 & _T_52; 
  assign _T_54 = _T_45 | _T_53; 
  assign _T_55 = _T_42 & _T_50; 
  assign _T_56 = _T_49 & _T_55; 
  assign _T_57 = _T_45 | _T_56; 
  assign _T_58 = _T_41 & _T_51; 
  assign _T_59 = _T_49 & _T_58; 
  assign _T_60 = _T_48 | _T_59; 
  assign _T_61 = _T_41 & _T_50; 
  assign _T_62 = _T_49 & _T_61; 
  assign _T_63 = _T_48 | _T_62; 
  assign _T_64 = _T_38[0]; 
  assign _T_65 = io_in_a_bits_address[0]; 
  assign _T_66 = _T_65 == 1'h0; 
  assign _T_67 = _T_52 & _T_66; 
  assign _T_68 = _T_64 & _T_67; 
  assign _T_69 = _T_54 | _T_68; 
  assign _T_70 = _T_52 & _T_65; 
  assign _T_71 = _T_64 & _T_70; 
  assign _T_72 = _T_54 | _T_71; 
  assign _T_73 = _T_55 & _T_66; 
  assign _T_74 = _T_64 & _T_73; 
  assign _T_75 = _T_57 | _T_74; 
  assign _T_76 = _T_55 & _T_65; 
  assign _T_77 = _T_64 & _T_76; 
  assign _T_78 = _T_57 | _T_77; 
  assign _T_79 = _T_58 & _T_66; 
  assign _T_80 = _T_64 & _T_79; 
  assign _T_81 = _T_60 | _T_80; 
  assign _T_82 = _T_58 & _T_65; 
  assign _T_83 = _T_64 & _T_82; 
  assign _T_84 = _T_60 | _T_83; 
  assign _T_85 = _T_61 & _T_66; 
  assign _T_86 = _T_64 & _T_85; 
  assign _T_87 = _T_63 | _T_86; 
  assign _T_88 = _T_61 & _T_65; 
  assign _T_89 = _T_64 & _T_88; 
  assign _T_90 = _T_63 | _T_89; 
  assign _T_91 = {_T_72,_T_69}; 
  assign _T_92 = {_T_78,_T_75}; 
  assign _T_93 = {_T_92,_T_91}; 
  assign _T_94 = {_T_84,_T_81}; 
  assign _T_95 = {_T_90,_T_87}; 
  assign _T_96 = {_T_95,_T_94}; 
  assign _T_97 = {_T_96,_T_93}; 
  assign _T_101 = {1'b0,$signed(io_in_a_bits_address)}; 
  assign _T_109 = io_in_a_bits_opcode == 3'h6; 
  assign _T_114 = io_in_a_bits_address ^ 38'h3000; 
  assign _T_115 = {1'b0,$signed(_T_114)}; 
  assign _T_116 = $signed(_T_115) & $signed(-39'sh1000); 
  assign _T_117 = $signed(_T_116); 
  assign _T_118 = $signed(_T_117) == $signed(39'sh0); 
  assign _T_121 = io_in_a_bits_size <= 3'h6; 
  assign _T_124 = io_in_a_bits_address ^ 38'h80000000; 
  assign _T_125 = {1'b0,$signed(_T_124)}; 
  assign _T_126 = $signed(_T_125) & $signed(-39'sh40000000); 
  assign _T_127 = $signed(_T_126); 
  assign _T_128 = $signed(_T_127) == $signed(39'sh0); 
  assign _T_129 = _T_121 & _T_128; 
  assign _T_131 = io_in_a_bits_address ^ 38'h64000000; 
  assign _T_132 = {1'b0,$signed(_T_131)}; 
  assign _T_133 = $signed(_T_132) & $signed(-39'sh2000); 
  assign _T_134 = $signed(_T_133); 
  assign _T_135 = $signed(_T_134) == $signed(39'sh0); 
  assign _T_136 = io_in_a_bits_address ^ 38'h64002000; 
  assign _T_137 = {1'b0,$signed(_T_136)}; 
  assign _T_138 = $signed(_T_137) & $signed(-39'sh1000); 
  assign _T_139 = $signed(_T_138); 
  assign _T_140 = $signed(_T_139) == $signed(39'sh0); 
  assign _T_141 = io_in_a_bits_address ^ 38'hc000000; 
  assign _T_142 = {1'b0,$signed(_T_141)}; 
  assign _T_143 = $signed(_T_142) & $signed(-39'sh4000000); 
  assign _T_144 = $signed(_T_143); 
  assign _T_145 = $signed(_T_144) == $signed(39'sh0); 
  assign _T_146 = io_in_a_bits_address ^ 38'h2000000; 
  assign _T_147 = {1'b0,$signed(_T_146)}; 
  assign _T_148 = $signed(_T_147) & $signed(-39'sh10000); 
  assign _T_149 = $signed(_T_148); 
  assign _T_150 = $signed(_T_149) == $signed(39'sh0); 
  assign _T_153 = $signed(_T_101) & $signed(-39'sh1000); 
  assign _T_154 = $signed(_T_153); 
  assign _T_155 = $signed(_T_154) == $signed(39'sh0); 
  assign _T_156 = io_in_a_bits_address ^ 38'h10000; 
  assign _T_157 = {1'b0,$signed(_T_156)}; 
  assign _T_158 = $signed(_T_157) & $signed(-39'sh2000); 
  assign _T_159 = $signed(_T_158); 
  assign _T_160 = $signed(_T_159) == $signed(39'sh0); 
  assign _T_161 = io_in_a_bits_address ^ 38'h40000000; 
  assign _T_162 = {1'b0,$signed(_T_161)}; 
  assign _T_163 = $signed(_T_162) & $signed(-39'sh20000000); 
  assign _T_164 = $signed(_T_163); 
  assign _T_165 = $signed(_T_164) == $signed(39'sh0); 
  assign _T_166 = io_in_a_bits_address ^ 38'h2000000000; 
  assign _T_167 = {1'b0,$signed(_T_166)}; 
  assign _T_168 = $signed(_T_167) & $signed(-39'sh4000000); 
  assign _T_169 = $signed(_T_168); 
  assign _T_170 = $signed(_T_169) == $signed(39'sh0); 
  assign _T_171 = _T_135 | _T_140; 
  assign _T_172 = _T_171 | _T_145; 
  assign _T_173 = _T_172 | _T_150; 
  assign _T_174 = _T_173 | _T_155; 
  assign _T_175 = _T_174 | _T_160; 
  assign _T_180 = _T_118 | _T_129; 
  assign _T_183 = _T_180 | reset; 
  assign _T_184 = _T_183 == 1'h0; 
  assign _T_187 = reset == 1'h0; 
  assign _T_189 = _T_20 | reset; 
  assign _T_190 = _T_189 == 1'h0; 
  assign _T_193 = _T_39 | reset; 
  assign _T_194 = _T_193 == 1'h0; 
  assign _T_196 = _T_33 | reset; 
  assign _T_197 = _T_196 == 1'h0; 
  assign _T_198 = io_in_a_bits_param <= 3'h2; 
  assign _T_200 = _T_198 | reset; 
  assign _T_201 = _T_200 == 1'h0; 
  assign _T_202 = ~ io_in_a_bits_mask; 
  assign _T_203 = _T_202 == 8'h0; 
  assign _T_205 = _T_203 | reset; 
  assign _T_206 = _T_205 == 1'h0; 
  assign _T_207 = io_in_a_bits_corrupt == 1'h0; 
  assign _T_209 = _T_207 | reset; 
  assign _T_210 = _T_209 == 1'h0; 
  assign _T_211 = io_in_a_bits_opcode == 3'h7; 
  assign _T_304 = io_in_a_bits_param != 3'h0; 
  assign _T_306 = _T_304 | reset; 
  assign _T_307 = _T_306 == 1'h0; 
  assign _T_317 = io_in_a_bits_opcode == 3'h4; 
  assign _T_382 = _T_175 | _T_128; 
  assign _T_383 = _T_382 | _T_165; 
  assign _T_384 = _T_383 | _T_170; 
  assign _T_385 = _T_121 & _T_384; 
  assign _T_387 = _T_118 | _T_385; 
  assign _T_389 = _T_387 | reset; 
  assign _T_390 = _T_389 == 1'h0; 
  assign _T_397 = io_in_a_bits_param == 3'h0; 
  assign _T_399 = _T_397 | reset; 
  assign _T_400 = _T_399 == 1'h0; 
  assign _T_401 = io_in_a_bits_mask == _T_97; 
  assign _T_403 = _T_401 | reset; 
  assign _T_404 = _T_403 == 1'h0; 
  assign _T_409 = io_in_a_bits_opcode == 3'h0; 
  assign _T_424 = _T_118 | _T_165; 
  assign _T_469 = _T_174 | _T_128; 
  assign _T_470 = _T_469 | _T_170; 
  assign _T_471 = _T_121 & _T_470; 
  assign _T_480 = _T_424 | _T_471; 
  assign _T_483 = _T_480 | reset; 
  assign _T_484 = _T_483 == 1'h0; 
  assign _T_499 = io_in_a_bits_opcode == 3'h1; 
  assign _T_585 = ~ _T_97; 
  assign _T_586 = io_in_a_bits_mask & _T_585; 
  assign _T_587 = _T_586 == 8'h0; 
  assign _T_589 = _T_587 | reset; 
  assign _T_590 = _T_589 == 1'h0; 
  assign _T_591 = io_in_a_bits_opcode == 3'h2; 
  assign _T_593 = io_in_a_bits_size <= 3'h3; 
  assign _T_630 = _T_174 | _T_118; 
  assign _T_631 = _T_593 & _T_630; 
  assign _T_660 = _T_631 | reset; 
  assign _T_661 = _T_660 == 1'h0; 
  assign _T_668 = io_in_a_bits_param <= 3'h4; 
  assign _T_670 = _T_668 | reset; 
  assign _T_671 = _T_670 == 1'h0; 
  assign _T_676 = io_in_a_bits_opcode == 3'h3; 
  assign _T_753 = io_in_a_bits_param <= 3'h3; 
  assign _T_755 = _T_753 | reset; 
  assign _T_756 = _T_755 == 1'h0; 
  assign _T_761 = io_in_a_bits_opcode == 3'h5; 
  assign _T_830 = _T_118 | reset; 
  assign _T_831 = _T_830 == 1'h0; 
  assign _T_846 = io_in_d_bits_opcode <= 3'h6; 
  assign _T_848 = _T_846 | reset; 
  assign _T_849 = _T_848 == 1'h0; 
  assign _T_859 = io_in_d_bits_opcode == 3'h6; 
  assign _T_863 = io_in_d_bits_size >= 3'h3; 
  assign _T_865 = _T_863 | reset; 
  assign _T_866 = _T_865 == 1'h0; 
  assign _T_867 = io_in_d_bits_param == 2'h0; 
  assign _T_869 = _T_867 | reset; 
  assign _T_870 = _T_869 == 1'h0; 
  assign _T_871 = io_in_d_bits_corrupt == 1'h0; 
  assign _T_873 = _T_871 | reset; 
  assign _T_874 = _T_873 == 1'h0; 
  assign _T_875 = io_in_d_bits_denied == 1'h0; 
  assign _T_877 = _T_875 | reset; 
  assign _T_878 = _T_877 == 1'h0; 
  assign _T_879 = io_in_d_bits_opcode == 3'h4; 
  assign _T_890 = io_in_d_bits_param <= 2'h2; 
  assign _T_892 = _T_890 | reset; 
  assign _T_893 = _T_892 == 1'h0; 
  assign _T_894 = io_in_d_bits_param != 2'h2; 
  assign _T_896 = _T_894 | reset; 
  assign _T_897 = _T_896 == 1'h0; 
  assign _T_907 = io_in_d_bits_opcode == 3'h5; 
  assign _T_927 = _T_875 | io_in_d_bits_corrupt; 
  assign _T_929 = _T_927 | reset; 
  assign _T_930 = _T_929 == 1'h0; 
  assign _T_936 = io_in_d_bits_opcode == 3'h0; 
  assign _T_953 = io_in_d_bits_opcode == 3'h1; 
  assign _T_971 = io_in_d_bits_opcode == 3'h2; 
  assign _T_992 = io_in_c_valid == 1'h0; 
  assign _T_994 = _T_992 | reset; 
  assign _T_995 = _T_994 == 1'h0; 
  assign _T_996 = io_in_e_valid == 1'h0; 
  assign _T_998 = _T_996 | reset; 
  assign _T_999 = _T_998 == 1'h0; 
  assign _T_1000 = io_in_a_ready & io_in_a_valid; 
  assign _T_1005 = _T_31[6:3]; 
  assign _T_1006 = io_in_a_bits_opcode[2]; 
  assign _T_1007 = _T_1006 == 1'h0; 
  assign _T_1011 = _T_1010 - 4'h1; 
  assign _T_1012 = $unsigned(_T_1011); 
  assign _T_1013 = _T_1012[3:0]; 
  assign _T_1014 = _T_1010 == 4'h0; 
  assign _T_1032 = _T_1014 == 1'h0; 
  assign _T_1033 = io_in_a_valid & _T_1032; 
  assign _T_1034 = io_in_a_bits_opcode == _T_1023; 
  assign _T_1036 = _T_1034 | reset; 
  assign _T_1037 = _T_1036 == 1'h0; 
  assign _T_1038 = io_in_a_bits_param == _T_1025; 
  assign _T_1040 = _T_1038 | reset; 
  assign _T_1041 = _T_1040 == 1'h0; 
  assign _T_1042 = io_in_a_bits_size == _T_1027; 
  assign _T_1044 = _T_1042 | reset; 
  assign _T_1045 = _T_1044 == 1'h0; 
  assign _T_1046 = io_in_a_bits_source == _T_1029; 
  assign _T_1048 = _T_1046 | reset; 
  assign _T_1049 = _T_1048 == 1'h0; 
  assign _T_1050 = io_in_a_bits_address == _T_1031; 
  assign _T_1052 = _T_1050 | reset; 
  assign _T_1053 = _T_1052 == 1'h0; 
  assign _T_1055 = _T_1000 & _T_1014; 
  assign _T_1056 = io_in_d_ready & io_in_d_valid; 
  assign _T_1058 = 14'h7f << io_in_d_bits_size; 
  assign _T_1059 = _T_1058[6:0]; 
  assign _T_1060 = ~ _T_1059; 
  assign _T_1061 = _T_1060[6:3]; 
  assign _T_1062 = io_in_d_bits_opcode[0]; 
  assign _T_1066 = _T_1065 - 4'h1; 
  assign _T_1067 = $unsigned(_T_1066); 
  assign _T_1068 = _T_1067[3:0]; 
  assign _T_1069 = _T_1065 == 4'h0; 
  assign _T_1089 = _T_1069 == 1'h0; 
  assign _T_1090 = io_in_d_valid & _T_1089; 
  assign _T_1091 = io_in_d_bits_opcode == _T_1078; 
  assign _T_1093 = _T_1091 | reset; 
  assign _T_1094 = _T_1093 == 1'h0; 
  assign _T_1095 = io_in_d_bits_param == _T_1080; 
  assign _T_1097 = _T_1095 | reset; 
  assign _T_1098 = _T_1097 == 1'h0; 
  assign _T_1099 = io_in_d_bits_size == _T_1082; 
  assign _T_1101 = _T_1099 | reset; 
  assign _T_1102 = _T_1101 == 1'h0; 
  assign _T_1107 = io_in_d_bits_sink == _T_1086; 
  assign _T_1109 = _T_1107 | reset; 
  assign _T_1110 = _T_1109 == 1'h0; 
  assign _T_1111 = io_in_d_bits_denied == _T_1088; 
  assign _T_1113 = _T_1111 | reset; 
  assign _T_1114 = _T_1113 == 1'h0; 
  assign _T_1116 = _T_1056 & _T_1069; 
  assign _T_1130 = _T_1129 - 4'h1; 
  assign _T_1131 = $unsigned(_T_1130); 
  assign _T_1132 = _T_1131[3:0]; 
  assign _T_1133 = _T_1129 == 4'h0; 
  assign _T_1151 = _T_1150 - 4'h1; 
  assign _T_1152 = $unsigned(_T_1151); 
  assign _T_1153 = _T_1152[3:0]; 
  assign _T_1154 = _T_1150 == 4'h0; 
  assign _T_1165 = _T_1000 & _T_1133; 
  assign _T_1167 = 2'h1 << io_in_a_bits_source; 
  assign _T_1168 = _T_1118 >> io_in_a_bits_source; 
  assign _T_1170 = _T_1168 == 1'h0; 
  assign _T_1172 = _T_1170 | reset; 
  assign _T_1173 = _T_1172 == 1'h0; 
  assign _GEN_15 = _T_1165 ? _T_1167 : 2'h0; 
  assign _T_1178 = _T_1056 & _T_1154; 
  assign _T_1180 = _T_859 == 1'h0; 
  assign _T_1181 = _T_1178 & _T_1180; 
  assign _T_1182 = 2'h1 << 1'h0; 
  assign _T_1163 = _GEN_15[0]; 
  assign _T_1183 = _T_1163 | _T_1118; 
  assign _T_1184 = _T_1183 >> 1'h0; 
  assign _T_1187 = _T_1184 | reset; 
  assign _T_1188 = _T_1187 == 1'h0; 
  assign _GEN_16 = _T_1181 ? _T_1182 : 2'h0; 
  assign _T_1175 = _GEN_16[0]; 
  assign _T_1189 = _T_1163 != _T_1175; 
  assign _T_1191 = _T_1163 == 1'h0; 
  assign _T_1192 = _T_1189 | _T_1191; 
  assign _T_1194 = _T_1192 | reset; 
  assign _T_1195 = _T_1194 == 1'h0; 
  assign _T_1196 = _T_1118 | _T_1163; 
  assign _T_1197 = ~ _T_1175; 
  assign _T_1198 = _T_1196 & _T_1197; 
  assign _T_1202 = _T_1118 == 1'h0; 
  assign _T_1203 = plusarg_reader_out == 32'h0; 
  assign _T_1204 = _T_1202 | _T_1203; 
  assign _T_1205 = _T_1200 < plusarg_reader_out; 
  assign _T_1206 = _T_1204 | _T_1205; 
  assign _T_1208 = _T_1206 | reset; 
  assign _T_1209 = _T_1208 == 1'h0; 
  assign _T_1211 = _T_1200 + 32'h1; 
  assign _T_1214 = _T_1000 | _T_1056; 
  assign _GEN_19 = io_in_a_valid & _T_109; 
  assign _GEN_35 = io_in_a_valid & _T_211; 
  assign _GEN_53 = io_in_a_valid & _T_317; 
  assign _GEN_65 = io_in_a_valid & _T_409; 
  assign _GEN_75 = io_in_a_valid & _T_499; 
  assign _GEN_85 = io_in_a_valid & _T_591; 
  assign _GEN_95 = io_in_a_valid & _T_676; 
  assign _GEN_105 = io_in_a_valid & _T_761; 
  assign _GEN_115 = io_in_d_valid & _T_859; 
  assign _GEN_123 = io_in_d_valid & _T_879; 
  assign _GEN_131 = io_in_d_valid & _T_907; 
  assign _GEN_139 = io_in_d_valid & _T_936; 
  assign _GEN_143 = io_in_d_valid & _T_953; 
  assign _GEN_147 = io_in_d_valid & _T_971; 
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
  _T_1010 = _RAND_0[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T_1023 = _RAND_1[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_1025 = _RAND_2[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_1027 = _RAND_3[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_1029 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {2{`RANDOM}};
  _T_1031 = _RAND_5[37:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  _T_1065 = _RAND_6[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  _T_1078 = _RAND_7[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  _T_1080 = _RAND_8[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  _T_1082 = _RAND_9[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  _T_1086 = _RAND_10[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  _T_1088 = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  _T_1118 = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  _T_1129 = _RAND_13[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  _T_1150 = _RAND_14[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  _T_1200 = _RAND_15[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      _T_1010 <= 4'h0;
    end else begin
      if (_T_1000) begin
        if (_T_1014) begin
          if (_T_1007) begin
            _T_1010 <= _T_1005;
          end else begin
            _T_1010 <= 4'h0;
          end
        end else begin
          _T_1010 <= _T_1013;
        end
      end
    end
    if (_T_1055) begin
      _T_1023 <= io_in_a_bits_opcode;
    end
    if (_T_1055) begin
      _T_1025 <= io_in_a_bits_param;
    end
    if (_T_1055) begin
      _T_1027 <= io_in_a_bits_size;
    end
    if (_T_1055) begin
      _T_1029 <= io_in_a_bits_source;
    end
    if (_T_1055) begin
      _T_1031 <= io_in_a_bits_address;
    end
    if (reset) begin
      _T_1065 <= 4'h0;
    end else begin
      if (_T_1056) begin
        if (_T_1069) begin
          if (_T_1062) begin
            _T_1065 <= _T_1061;
          end else begin
            _T_1065 <= 4'h0;
          end
        end else begin
          _T_1065 <= _T_1068;
        end
      end
    end
    if (_T_1116) begin
      _T_1078 <= io_in_d_bits_opcode;
    end
    if (_T_1116) begin
      _T_1080 <= io_in_d_bits_param;
    end
    if (_T_1116) begin
      _T_1082 <= io_in_d_bits_size;
    end
    if (_T_1116) begin
      _T_1086 <= io_in_d_bits_sink;
    end
    if (_T_1116) begin
      _T_1088 <= io_in_d_bits_denied;
    end
    if (reset) begin
      _T_1118 <= 1'h0;
    end else begin
      _T_1118 <= _T_1198;
    end
    if (reset) begin
      _T_1129 <= 4'h0;
    end else begin
      if (_T_1000) begin
        if (_T_1133) begin
          if (_T_1007) begin
            _T_1129 <= _T_1005;
          end else begin
            _T_1129 <= 4'h0;
          end
        end else begin
          _T_1129 <= _T_1132;
        end
      end
    end
    if (reset) begin
      _T_1150 <= 4'h0;
    end else begin
      if (_T_1056) begin
        if (_T_1154) begin
          if (_T_1062) begin
            _T_1150 <= _T_1061;
          end else begin
            _T_1150 <= 4'h0;
          end
        end else begin
          _T_1150 <= _T_1153;
        end
      end
    end
    if (reset) begin
      _T_1200 <= 32'h0;
    end else begin
      if (_T_1214) begin
        _T_1200 <= 32'h0;
      end else begin
        _T_1200 <= _T_1211;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel has invalid opcode (connected at Frontend.scala:341:21)\n    at Monitor.scala:39 assert (TLMessages.isA(bundle.opcode), \"'A' channel has invalid opcode\" + extra)\n"); 
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
        if (_GEN_19 & _T_184) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries AcquireBlock type unsupported by manager (connected at Frontend.scala:341:21)\n    at Monitor.scala:49 assert (edge.manager.supportsAcquireBSafe(edge.address(bundle), bundle.size), \"'A' channel carries AcquireBlock type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_19 & _T_184) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_19 & _T_187) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries AcquireBlock from a client which does not support Probe (connected at Frontend.scala:341:21)\n    at Monitor.scala:50 assert (edge.client.supportsProbe(edge.source(bundle), bundle.size), \"'A' channel carries AcquireBlock from a client which does not support Probe\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_19 & _T_187) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_19 & _T_190) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock carries invalid source ID (connected at Frontend.scala:341:21)\n    at Monitor.scala:51 assert (source_ok, \"'A' channel AcquireBlock carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_19 & _T_190) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_19 & _T_194) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock smaller than a beat (connected at Frontend.scala:341:21)\n    at Monitor.scala:52 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'A' channel AcquireBlock smaller than a beat\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_19 & _T_194) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_19 & _T_197) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock address not aligned to size (connected at Frontend.scala:341:21)\n    at Monitor.scala:53 assert (is_aligned, \"'A' channel AcquireBlock address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_19 & _T_197) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock carries invalid grow param (connected at Frontend.scala:341:21)\n    at Monitor.scala:54 assert (TLPermissions.isGrow(bundle.param), \"'A' channel AcquireBlock carries invalid grow param\" + extra)\n"); 
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
        if (_GEN_19 & _T_206) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock contains invalid mask (connected at Frontend.scala:341:21)\n    at Monitor.scala:55 assert (~bundle.mask === UInt(0), \"'A' channel AcquireBlock contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_19 & _T_206) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_19 & _T_210) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock is corrupt (connected at Frontend.scala:341:21)\n    at Monitor.scala:56 assert (!bundle.corrupt, \"'A' channel AcquireBlock is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_19 & _T_210) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_35 & _T_184) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries AcquirePerm type unsupported by manager (connected at Frontend.scala:341:21)\n    at Monitor.scala:60 assert (edge.manager.supportsAcquireBSafe(edge.address(bundle), bundle.size), \"'A' channel carries AcquirePerm type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_35 & _T_184) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_35 & _T_187) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries AcquirePerm from a client which does not support Probe (connected at Frontend.scala:341:21)\n    at Monitor.scala:61 assert (edge.client.supportsProbe(edge.source(bundle), bundle.size), \"'A' channel carries AcquirePerm from a client which does not support Probe\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_35 & _T_187) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_35 & _T_190) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm carries invalid source ID (connected at Frontend.scala:341:21)\n    at Monitor.scala:62 assert (source_ok, \"'A' channel AcquirePerm carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_35 & _T_190) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_35 & _T_194) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm smaller than a beat (connected at Frontend.scala:341:21)\n    at Monitor.scala:63 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'A' channel AcquirePerm smaller than a beat\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_35 & _T_194) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_35 & _T_197) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm address not aligned to size (connected at Frontend.scala:341:21)\n    at Monitor.scala:64 assert (is_aligned, \"'A' channel AcquirePerm address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_35 & _T_197) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_35 & _T_201) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm carries invalid grow param (connected at Frontend.scala:341:21)\n    at Monitor.scala:65 assert (TLPermissions.isGrow(bundle.param), \"'A' channel AcquirePerm carries invalid grow param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_35 & _T_201) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_35 & _T_307) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm requests NtoB (connected at Frontend.scala:341:21)\n    at Monitor.scala:66 assert (bundle.param =/= TLPermissions.NtoB, \"'A' channel AcquirePerm requests NtoB\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_35 & _T_307) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_35 & _T_206) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm contains invalid mask (connected at Frontend.scala:341:21)\n    at Monitor.scala:67 assert (~bundle.mask === UInt(0), \"'A' channel AcquirePerm contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_35 & _T_206) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_35 & _T_210) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm is corrupt (connected at Frontend.scala:341:21)\n    at Monitor.scala:68 assert (!bundle.corrupt, \"'A' channel AcquirePerm is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_35 & _T_210) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_53 & _T_390) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries Get type unsupported by manager (connected at Frontend.scala:341:21)\n    at Monitor.scala:72 assert (edge.manager.supportsGetSafe(edge.address(bundle), bundle.size), \"'A' channel carries Get type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_53 & _T_390) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_53 & _T_190) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Get carries invalid source ID (connected at Frontend.scala:341:21)\n    at Monitor.scala:73 assert (source_ok, \"'A' channel Get carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_53 & _T_190) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_53 & _T_197) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Get address not aligned to size (connected at Frontend.scala:341:21)\n    at Monitor.scala:74 assert (is_aligned, \"'A' channel Get address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_53 & _T_197) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_53 & _T_400) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Get carries invalid param (connected at Frontend.scala:341:21)\n    at Monitor.scala:75 assert (bundle.param === UInt(0), \"'A' channel Get carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_53 & _T_400) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_53 & _T_404) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Get contains invalid mask (connected at Frontend.scala:341:21)\n    at Monitor.scala:76 assert (bundle.mask === mask, \"'A' channel Get contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_53 & _T_404) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_53 & _T_210) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Get is corrupt (connected at Frontend.scala:341:21)\n    at Monitor.scala:77 assert (!bundle.corrupt, \"'A' channel Get is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_53 & _T_210) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_65 & _T_484) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries PutFull type unsupported by manager (connected at Frontend.scala:341:21)\n    at Monitor.scala:81 assert (edge.manager.supportsPutFullSafe(edge.address(bundle), bundle.size), \"'A' channel carries PutFull type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_65 & _T_484) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_65 & _T_190) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutFull carries invalid source ID (connected at Frontend.scala:341:21)\n    at Monitor.scala:82 assert (source_ok, \"'A' channel PutFull carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_65 & _T_190) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_65 & _T_197) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutFull address not aligned to size (connected at Frontend.scala:341:21)\n    at Monitor.scala:83 assert (is_aligned, \"'A' channel PutFull address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_65 & _T_197) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_65 & _T_400) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutFull carries invalid param (connected at Frontend.scala:341:21)\n    at Monitor.scala:84 assert (bundle.param === UInt(0), \"'A' channel PutFull carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_65 & _T_400) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_65 & _T_404) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutFull contains invalid mask (connected at Frontend.scala:341:21)\n    at Monitor.scala:85 assert (bundle.mask === mask, \"'A' channel PutFull contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_65 & _T_404) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_75 & _T_484) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries PutPartial type unsupported by manager (connected at Frontend.scala:341:21)\n    at Monitor.scala:89 assert (edge.manager.supportsPutPartialSafe(edge.address(bundle), bundle.size), \"'A' channel carries PutPartial type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_75 & _T_484) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_75 & _T_190) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutPartial carries invalid source ID (connected at Frontend.scala:341:21)\n    at Monitor.scala:90 assert (source_ok, \"'A' channel PutPartial carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_75 & _T_190) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_75 & _T_197) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutPartial address not aligned to size (connected at Frontend.scala:341:21)\n    at Monitor.scala:91 assert (is_aligned, \"'A' channel PutPartial address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_75 & _T_197) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_75 & _T_400) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutPartial carries invalid param (connected at Frontend.scala:341:21)\n    at Monitor.scala:92 assert (bundle.param === UInt(0), \"'A' channel PutPartial carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_75 & _T_400) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_75 & _T_590) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutPartial contains invalid mask (connected at Frontend.scala:341:21)\n    at Monitor.scala:93 assert ((bundle.mask & ~mask) === UInt(0), \"'A' channel PutPartial contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_75 & _T_590) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_85 & _T_661) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries Arithmetic type unsupported by manager (connected at Frontend.scala:341:21)\n    at Monitor.scala:97 assert (edge.manager.supportsArithmeticSafe(edge.address(bundle), bundle.size), \"'A' channel carries Arithmetic type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_85 & _T_661) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_85 & _T_190) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Arithmetic carries invalid source ID (connected at Frontend.scala:341:21)\n    at Monitor.scala:98 assert (source_ok, \"'A' channel Arithmetic carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_85 & _T_190) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_85 & _T_197) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Arithmetic address not aligned to size (connected at Frontend.scala:341:21)\n    at Monitor.scala:99 assert (is_aligned, \"'A' channel Arithmetic address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_85 & _T_197) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_85 & _T_671) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Arithmetic carries invalid opcode param (connected at Frontend.scala:341:21)\n    at Monitor.scala:100 assert (TLAtomics.isArithmetic(bundle.param), \"'A' channel Arithmetic carries invalid opcode param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_85 & _T_671) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_85 & _T_404) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Arithmetic contains invalid mask (connected at Frontend.scala:341:21)\n    at Monitor.scala:101 assert (bundle.mask === mask, \"'A' channel Arithmetic contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_85 & _T_404) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_95 & _T_661) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries Logical type unsupported by manager (connected at Frontend.scala:341:21)\n    at Monitor.scala:105 assert (edge.manager.supportsLogicalSafe(edge.address(bundle), bundle.size), \"'A' channel carries Logical type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_95 & _T_661) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_95 & _T_190) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Logical carries invalid source ID (connected at Frontend.scala:341:21)\n    at Monitor.scala:106 assert (source_ok, \"'A' channel Logical carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_95 & _T_190) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_95 & _T_197) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Logical address not aligned to size (connected at Frontend.scala:341:21)\n    at Monitor.scala:107 assert (is_aligned, \"'A' channel Logical address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_95 & _T_197) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_95 & _T_756) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Logical carries invalid opcode param (connected at Frontend.scala:341:21)\n    at Monitor.scala:108 assert (TLAtomics.isLogical(bundle.param), \"'A' channel Logical carries invalid opcode param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_95 & _T_756) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_95 & _T_404) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Logical contains invalid mask (connected at Frontend.scala:341:21)\n    at Monitor.scala:109 assert (bundle.mask === mask, \"'A' channel Logical contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_95 & _T_404) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_105 & _T_831) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries Hint type unsupported by manager (connected at Frontend.scala:341:21)\n    at Monitor.scala:113 assert (edge.manager.supportsHintSafe(edge.address(bundle), bundle.size), \"'A' channel carries Hint type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_105 & _T_831) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_105 & _T_190) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Hint carries invalid source ID (connected at Frontend.scala:341:21)\n    at Monitor.scala:114 assert (source_ok, \"'A' channel Hint carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_105 & _T_190) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_105 & _T_197) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Hint address not aligned to size (connected at Frontend.scala:341:21)\n    at Monitor.scala:115 assert (is_aligned, \"'A' channel Hint address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_105 & _T_197) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_105 & _T_404) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Hint contains invalid mask (connected at Frontend.scala:341:21)\n    at Monitor.scala:116 assert (bundle.mask === mask, \"'A' channel Hint contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_105 & _T_404) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_105 & _T_210) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Hint is corrupt (connected at Frontend.scala:341:21)\n    at Monitor.scala:117 assert (!bundle.corrupt, \"'A' channel Hint is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_105 & _T_210) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_849) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel has invalid opcode (connected at Frontend.scala:341:21)\n    at Monitor.scala:268 assert (TLMessages.isD(bundle.opcode), \"'D' channel has invalid opcode\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_d_valid & _T_849) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel ReleaseAck carries invalid source ID (connected at Frontend.scala:341:21)\n    at Monitor.scala:276 assert (source_ok, \"'D' channel ReleaseAck carries invalid source ID\" + extra)\n"); 
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
        if (_GEN_115 & _T_866) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel ReleaseAck smaller than a beat (connected at Frontend.scala:341:21)\n    at Monitor.scala:277 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'D' channel ReleaseAck smaller than a beat\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_115 & _T_866) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_115 & _T_870) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel ReleaseeAck carries invalid param (connected at Frontend.scala:341:21)\n    at Monitor.scala:278 assert (bundle.param === UInt(0), \"'D' channel ReleaseeAck carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_115 & _T_870) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_115 & _T_874) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel ReleaseAck is corrupt (connected at Frontend.scala:341:21)\n    at Monitor.scala:279 assert (!bundle.corrupt, \"'D' channel ReleaseAck is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_115 & _T_874) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_115 & _T_878) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel ReleaseAck is denied (connected at Frontend.scala:341:21)\n    at Monitor.scala:280 assert (!bundle.denied, \"'D' channel ReleaseAck is denied\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_115 & _T_878) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant carries invalid source ID (connected at Frontend.scala:341:21)\n    at Monitor.scala:284 assert (source_ok, \"'D' channel Grant carries invalid source ID\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant carries invalid sink ID (connected at Frontend.scala:341:21)\n    at Monitor.scala:285 assert (sink_ok, \"'D' channel Grant carries invalid sink ID\" + extra)\n"); 
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
        if (_GEN_123 & _T_866) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant smaller than a beat (connected at Frontend.scala:341:21)\n    at Monitor.scala:286 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'D' channel Grant smaller than a beat\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_123 & _T_866) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_123 & _T_893) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant carries invalid cap param (connected at Frontend.scala:341:21)\n    at Monitor.scala:287 assert (TLPermissions.isCap(bundle.param), \"'D' channel Grant carries invalid cap param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_123 & _T_893) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_123 & _T_897) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant carries toN param (connected at Frontend.scala:341:21)\n    at Monitor.scala:288 assert (bundle.param =/= TLPermissions.toN, \"'D' channel Grant carries toN param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_123 & _T_897) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_123 & _T_874) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant is corrupt (connected at Frontend.scala:341:21)\n    at Monitor.scala:289 assert (!bundle.corrupt, \"'D' channel Grant is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_123 & _T_874) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant is denied (connected at Frontend.scala:341:21)\n    at Monitor.scala:290 assert (deny_put_ok || !bundle.denied, \"'D' channel Grant is denied\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData carries invalid source ID (connected at Frontend.scala:341:21)\n    at Monitor.scala:294 assert (source_ok, \"'D' channel GrantData carries invalid source ID\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData carries invalid sink ID (connected at Frontend.scala:341:21)\n    at Monitor.scala:295 assert (sink_ok, \"'D' channel GrantData carries invalid sink ID\" + extra)\n"); 
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
        if (_GEN_131 & _T_866) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData smaller than a beat (connected at Frontend.scala:341:21)\n    at Monitor.scala:296 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'D' channel GrantData smaller than a beat\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_131 & _T_866) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_131 & _T_893) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData carries invalid cap param (connected at Frontend.scala:341:21)\n    at Monitor.scala:297 assert (TLPermissions.isCap(bundle.param), \"'D' channel GrantData carries invalid cap param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_131 & _T_893) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_131 & _T_897) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData carries toN param (connected at Frontend.scala:341:21)\n    at Monitor.scala:298 assert (bundle.param =/= TLPermissions.toN, \"'D' channel GrantData carries toN param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_131 & _T_897) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_131 & _T_930) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData is denied but not corrupt (connected at Frontend.scala:341:21)\n    at Monitor.scala:299 assert (!bundle.denied || bundle.corrupt, \"'D' channel GrantData is denied but not corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_131 & _T_930) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData is denied (connected at Frontend.scala:341:21)\n    at Monitor.scala:300 assert (deny_get_ok || !bundle.denied, \"'D' channel GrantData is denied\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAck carries invalid source ID (connected at Frontend.scala:341:21)\n    at Monitor.scala:304 assert (source_ok, \"'D' channel AccessAck carries invalid source ID\" + extra)\n"); 
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
        if (_GEN_139 & _T_870) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAck carries invalid param (connected at Frontend.scala:341:21)\n    at Monitor.scala:306 assert (bundle.param === UInt(0), \"'D' channel AccessAck carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_139 & _T_870) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_139 & _T_874) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAck is corrupt (connected at Frontend.scala:341:21)\n    at Monitor.scala:307 assert (!bundle.corrupt, \"'D' channel AccessAck is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_139 & _T_874) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAck is denied (connected at Frontend.scala:341:21)\n    at Monitor.scala:308 assert (deny_put_ok || !bundle.denied, \"'D' channel AccessAck is denied\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAckData carries invalid source ID (connected at Frontend.scala:341:21)\n    at Monitor.scala:312 assert (source_ok, \"'D' channel AccessAckData carries invalid source ID\" + extra)\n"); 
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
        if (_GEN_143 & _T_870) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAckData carries invalid param (connected at Frontend.scala:341:21)\n    at Monitor.scala:314 assert (bundle.param === UInt(0), \"'D' channel AccessAckData carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_143 & _T_870) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_143 & _T_930) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAckData is denied but not corrupt (connected at Frontend.scala:341:21)\n    at Monitor.scala:315 assert (!bundle.denied || bundle.corrupt, \"'D' channel AccessAckData is denied but not corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_143 & _T_930) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAckData is denied (connected at Frontend.scala:341:21)\n    at Monitor.scala:316 assert (deny_get_ok || !bundle.denied, \"'D' channel AccessAckData is denied\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel HintAck carries invalid source ID (connected at Frontend.scala:341:21)\n    at Monitor.scala:320 assert (source_ok, \"'D' channel HintAck carries invalid source ID\" + extra)\n"); 
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
        if (_GEN_147 & _T_870) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel HintAck carries invalid param (connected at Frontend.scala:341:21)\n    at Monitor.scala:322 assert (bundle.param === UInt(0), \"'D' channel HintAck carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_147 & _T_870) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_147 & _T_874) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel HintAck is corrupt (connected at Frontend.scala:341:21)\n    at Monitor.scala:323 assert (!bundle.corrupt, \"'D' channel HintAck is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_147 & _T_874) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel HintAck is denied (connected at Frontend.scala:341:21)\n    at Monitor.scala:324 assert (deny_put_ok || !bundle.denied, \"'D' channel HintAck is denied\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'B' channel valid and not TL-C (connected at Frontend.scala:341:21)\n    at Monitor.scala:341 assert (!bundle.b.valid, \"'B' channel valid and not TL-C\" + extra)\n"); 
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
        if (_T_995) begin
          $fwrite(32'h80000002,"Assertion failed: 'C' channel valid and not TL-C (connected at Frontend.scala:341:21)\n    at Monitor.scala:342 assert (!bundle.c.valid, \"'C' channel valid and not TL-C\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_995) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_999) begin
          $fwrite(32'h80000002,"Assertion failed: 'E' channel valid and not TL-C (connected at Frontend.scala:341:21)\n    at Monitor.scala:343 assert (!bundle.e.valid, \"'E' channel valid and not TL-C\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_999) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1033 & _T_1037) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel opcode changed within multibeat operation (connected at Frontend.scala:341:21)\n    at Monitor.scala:355 assert (a.bits.opcode === opcode, \"'A' channel opcode changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1033 & _T_1037) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1033 & _T_1041) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel param changed within multibeat operation (connected at Frontend.scala:341:21)\n    at Monitor.scala:356 assert (a.bits.param  === param,  \"'A' channel param changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1033 & _T_1041) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1033 & _T_1045) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel size changed within multibeat operation (connected at Frontend.scala:341:21)\n    at Monitor.scala:357 assert (a.bits.size   === size,   \"'A' channel size changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1033 & _T_1045) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1033 & _T_1049) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel source changed within multibeat operation (connected at Frontend.scala:341:21)\n    at Monitor.scala:358 assert (a.bits.source === source, \"'A' channel source changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1033 & _T_1049) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1033 & _T_1053) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel address changed with multibeat operation (connected at Frontend.scala:341:21)\n    at Monitor.scala:359 assert (a.bits.address=== address,\"'A' channel address changed with multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1033 & _T_1053) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1090 & _T_1094) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel opcode changed within multibeat operation (connected at Frontend.scala:341:21)\n    at Monitor.scala:425 assert (d.bits.opcode === opcode, \"'D' channel opcode changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1090 & _T_1094) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1090 & _T_1098) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel param changed within multibeat operation (connected at Frontend.scala:341:21)\n    at Monitor.scala:426 assert (d.bits.param  === param,  \"'D' channel param changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1090 & _T_1098) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1090 & _T_1102) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel size changed within multibeat operation (connected at Frontend.scala:341:21)\n    at Monitor.scala:427 assert (d.bits.size   === size,   \"'D' channel size changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1090 & _T_1102) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel source changed within multibeat operation (connected at Frontend.scala:341:21)\n    at Monitor.scala:428 assert (d.bits.source === source, \"'D' channel source changed within multibeat operation\" + extra)\n"); 
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
        if (_T_1090 & _T_1110) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel sink changed with multibeat operation (connected at Frontend.scala:341:21)\n    at Monitor.scala:429 assert (d.bits.sink   === sink,   \"'D' channel sink changed with multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1090 & _T_1110) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1090 & _T_1114) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel denied changed with multibeat operation (connected at Frontend.scala:341:21)\n    at Monitor.scala:430 assert (d.bits.denied === denied, \"'D' channel denied changed with multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1090 & _T_1114) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1165 & _T_1173) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel re-used a source ID (connected at Frontend.scala:341:21)\n    at Monitor.scala:460 assert(!inflight(bundle.a.bits.source), \"'A' channel re-used a source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1165 & _T_1173) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1181 & _T_1188) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel acknowledged for nothing inflight (connected at Frontend.scala:341:21)\n    at Monitor.scala:467 assert((a_set | inflight)(bundle.d.bits.source), \"'D' channel acknowledged for nothing inflight\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1181 & _T_1188) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1195) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' and 'D' concurrent, despite minlatency 4 (connected at Frontend.scala:341:21)\n    at Monitor.scala:471 assert(a_set =/= d_clr || !a_set.orR, s\"'A' and 'D' concurrent, despite minlatency ${edge.manager.minLatency}\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1195) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1209) begin
          $fwrite(32'h80000002,"Assertion failed: TileLink timeout expired (connected at Frontend.scala:341:21)\n    at Monitor.scala:479 assert (!inflight.orR || limit === UInt(0) || watchdog < limit, \"TileLink timeout expired\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1209) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
