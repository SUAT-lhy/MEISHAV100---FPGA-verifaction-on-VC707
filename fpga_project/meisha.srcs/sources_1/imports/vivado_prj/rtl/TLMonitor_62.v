module TLMonitor_62( 
  input        clock, 
  input        reset, 
  input        io_in_a_ready, 
  input        io_in_a_valid, 
  input  [2:0] io_in_a_bits_opcode, 
  input  [2:0] io_in_a_bits_param, 
  input  [1:0] io_in_a_bits_size, 
  input        io_in_a_bits_source, 
  input  [8:0] io_in_a_bits_address, 
  input  [3:0] io_in_a_bits_mask, 
  input        io_in_a_bits_corrupt, 
  input        io_in_d_ready, 
  input        io_in_d_valid, 
  input  [2:0] io_in_d_bits_opcode, 
  input  [1:0] io_in_d_bits_size, 
  input        io_in_d_bits_source 
);
  wire [31:0] plusarg_reader_out; 
  wire  _T_20; 
  wire [4:0] _T_29; 
  wire [1:0] _T_30; 
  wire [1:0] _T_31; 
  wire [8:0] _GEN_18; 
  wire [8:0] _T_32; 
  wire  _T_33; 
  wire  _T_35; 
  wire [1:0] _T_36; 
  wire [1:0] _T_38; 
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
  wire [1:0] _T_64; 
  wire [1:0] _T_65; 
  wire [3:0] _T_66; 
  wire [9:0] _T_70; 
  wire  _T_78; 
  wire [9:0] _T_82; 
  wire [9:0] _T_83; 
  wire  _T_84; 
  wire [8:0] _T_85; 
  wire [9:0] _T_86; 
  wire [9:0] _T_87; 
  wire [9:0] _T_88; 
  wire  _T_89; 
  wire [8:0] _T_90; 
  wire [9:0] _T_91; 
  wire [9:0] _T_92; 
  wire [9:0] _T_93; 
  wire  _T_94; 
  wire [8:0] _T_95; 
  wire [9:0] _T_96; 
  wire [9:0] _T_97; 
  wire [9:0] _T_98; 
  wire  _T_99; 
  wire [8:0] _T_100; 
  wire [9:0] _T_101; 
  wire [9:0] _T_102; 
  wire [9:0] _T_103; 
  wire  _T_104; 
  wire [8:0] _T_105; 
  wire [9:0] _T_106; 
  wire [9:0] _T_107; 
  wire [9:0] _T_108; 
  wire  _T_109; 
  wire [8:0] _T_110; 
  wire [9:0] _T_111; 
  wire [9:0] _T_112; 
  wire [9:0] _T_113; 
  wire  _T_114; 
  wire  _T_115; 
  wire  _T_116; 
  wire  _T_117; 
  wire  _T_118; 
  wire  _T_119; 
  wire  _T_120; 
  wire  _T_125; 
  wire  _T_130; 
  wire  _T_131; 
  wire  _T_134; 
  wire  _T_135; 
  wire  _T_137; 
  wire  _T_138; 
  wire  _T_139; 
  wire  _T_141; 
  wire  _T_142; 
  wire [3:0] _T_143; 
  wire  _T_144; 
  wire  _T_146; 
  wire  _T_147; 
  wire  _T_148; 
  wire  _T_150; 
  wire  _T_151; 
  wire  _T_152; 
  wire  _T_217; 
  wire  _T_219; 
  wire  _T_220; 
  wire  _T_230; 
  wire  _T_232; 
  wire  _T_276; 
  wire  _T_279; 
  wire  _T_280; 
  wire  _T_287; 
  wire  _T_289; 
  wire  _T_290; 
  wire  _T_291; 
  wire  _T_293; 
  wire  _T_294; 
  wire  _T_299; 
  wire  _T_364; 
  wire [3:0] _T_425; 
  wire [3:0] _T_426; 
  wire  _T_427; 
  wire  _T_429; 
  wire  _T_430; 
  wire  _T_431; 
  wire  _T_485; 
  wire  _T_487; 
  wire  _T_488; 
  wire  _T_493; 
  wire  _T_547; 
  wire  _T_549; 
  wire  _T_550; 
  wire  _T_555; 
  wire  _T_617; 
  wire  _T_619; 
  wire  _T_620; 
  wire  _T_621; 
  wire  _T_630; 
  wire  _T_632; 
  wire  _T_633; 
  wire  _T_634; 
  wire  _T_636; 
  wire  _T_637; 
  wire  _T_650; 
  wire  _T_678; 
  wire  _T_707; 
  wire  _T_724; 
  wire  _T_742; 
  wire  _T_771; 
  reg  _T_781; 
  reg [31:0] _RAND_0;
  wire [1:0] _T_782; 
  wire [1:0] _T_783; 
  wire  _T_784; 
  wire  _T_785; 
  reg [2:0] _T_794; 
  reg [31:0] _RAND_1;
  reg [2:0] _T_796; 
  reg [31:0] _RAND_2;
  reg [1:0] _T_798; 
  reg [31:0] _RAND_3;
  reg  _T_800; 
  reg [31:0] _RAND_4;
  reg [8:0] _T_802; 
  reg [31:0] _RAND_5;
  wire  _T_803; 
  wire  _T_804; 
  wire  _T_805; 
  wire  _T_807; 
  wire  _T_808; 
  wire  _T_809; 
  wire  _T_811; 
  wire  _T_812; 
  wire  _T_813; 
  wire  _T_815; 
  wire  _T_816; 
  wire  _T_817; 
  wire  _T_819; 
  wire  _T_820; 
  wire  _T_821; 
  wire  _T_823; 
  wire  _T_824; 
  wire  _T_826; 
  wire  _T_827; 
  reg  _T_836; 
  reg [31:0] _RAND_6;
  wire [1:0] _T_837; 
  wire [1:0] _T_838; 
  wire  _T_839; 
  wire  _T_840; 
  reg [2:0] _T_849; 
  reg [31:0] _RAND_7;
  reg [1:0] _T_853; 
  reg [31:0] _RAND_8;
  reg  _T_855; 
  reg [31:0] _RAND_9;
  wire  _T_860; 
  wire  _T_861; 
  wire  _T_862; 
  wire  _T_864; 
  wire  _T_865; 
  wire  _T_870; 
  wire  _T_872; 
  wire  _T_873; 
  wire  _T_874; 
  wire  _T_876; 
  wire  _T_877; 
  wire  _T_887; 
  reg  _T_889; 
  reg [31:0] _RAND_10;
  reg  _T_900; 
  reg [31:0] _RAND_11;
  wire [1:0] _T_901; 
  wire [1:0] _T_902; 
  wire  _T_903; 
  wire  _T_904; 
  reg  _T_921; 
  reg [31:0] _RAND_12;
  wire [1:0] _T_922; 
  wire [1:0] _T_923; 
  wire  _T_924; 
  wire  _T_925; 
  wire  _T_936; 
  wire [1:0] _T_938; 
  wire  _T_939; 
  wire  _T_941; 
  wire  _T_943; 
  wire  _T_944; 
  wire [1:0] _GEN_15; 
  wire  _T_949; 
  wire  _T_951; 
  wire  _T_952; 
  wire [1:0] _T_953; 
  wire  _T_934; 
  wire  _T_954; 
  wire  _T_955; 
  wire  _T_958; 
  wire  _T_959; 
  wire [1:0] _GEN_16; 
  wire  _T_960; 
  wire  _T_946; 
  wire  _T_961; 
  wire  _T_962; 
  reg [31:0] _T_964; 
  reg [31:0] _RAND_13;
  wire  _T_966; 
  wire  _T_967; 
  wire  _T_968; 
  wire  _T_969; 
  wire  _T_970; 
  wire  _T_972; 
  wire  _T_973; 
  wire [31:0] _T_975; 
  wire  _T_978; 
  wire  _GEN_19; 
  wire  _GEN_35; 
  wire  _GEN_53; 
  wire  _GEN_65; 
  wire  _GEN_75; 
  wire  _GEN_85; 
  wire  _GEN_95; 
  wire  _GEN_105; 
  wire  _GEN_115; 
  wire  _GEN_119; 
  wire  _GEN_125; 
  wire  _GEN_131; 
  wire  _GEN_133; 
  wire  _GEN_135; 
  plusarg_reader #(.FORMAT("tilelink_timeout=%d"), .DEFAULT(0)) plusarg_reader ( 
    .out(plusarg_reader_out)
  );
  assign _T_20 = io_in_a_bits_source == 1'h0; 
  assign _T_29 = 5'h3 << io_in_a_bits_size; 
  assign _T_30 = _T_29[1:0]; 
  assign _T_31 = ~ _T_30; 
  assign _GEN_18 = {{7'd0}, _T_31}; 
  assign _T_32 = io_in_a_bits_address & _GEN_18; 
  assign _T_33 = _T_32 == 9'h0; 
  assign _T_35 = io_in_a_bits_size[0]; 
  assign _T_36 = 2'h1 << _T_35; 
  assign _T_38 = _T_36 | 2'h1; 
  assign _T_39 = io_in_a_bits_size >= 2'h2; 
  assign _T_40 = _T_38[1]; 
  assign _T_41 = io_in_a_bits_address[1]; 
  assign _T_42 = _T_41 == 1'h0; 
  assign _T_44 = _T_40 & _T_42; 
  assign _T_45 = _T_39 | _T_44; 
  assign _T_47 = _T_40 & _T_41; 
  assign _T_48 = _T_39 | _T_47; 
  assign _T_49 = _T_38[0]; 
  assign _T_50 = io_in_a_bits_address[0]; 
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
  assign _T_64 = {_T_57,_T_54}; 
  assign _T_65 = {_T_63,_T_60}; 
  assign _T_66 = {_T_65,_T_64}; 
  assign _T_70 = {1'b0,$signed(io_in_a_bits_address)}; 
  assign _T_78 = io_in_a_bits_opcode == 3'h6; 
  assign _T_82 = $signed(_T_70) & $signed(-10'sh40); 
  assign _T_83 = $signed(_T_82); 
  assign _T_84 = $signed(_T_83) == $signed(10'sh0); 
  assign _T_85 = io_in_a_bits_address ^ 9'h44; 
  assign _T_86 = {1'b0,$signed(_T_85)}; 
  assign _T_87 = $signed(_T_86) & $signed(-10'sh4); 
  assign _T_88 = $signed(_T_87); 
  assign _T_89 = $signed(_T_88) == $signed(10'sh0); 
  assign _T_90 = io_in_a_bits_address ^ 9'h48; 
  assign _T_91 = {1'b0,$signed(_T_90)}; 
  assign _T_92 = $signed(_T_91) & $signed(-10'sh8); 
  assign _T_93 = $signed(_T_92); 
  assign _T_94 = $signed(_T_93) == $signed(10'sh0); 
  assign _T_95 = io_in_a_bits_address ^ 9'h50; 
  assign _T_96 = {1'b0,$signed(_T_95)}; 
  assign _T_97 = $signed(_T_96) & $signed(-10'sh10); 
  assign _T_98 = $signed(_T_97); 
  assign _T_99 = $signed(_T_98) == $signed(10'sh0); 
  assign _T_100 = io_in_a_bits_address ^ 9'h60; 
  assign _T_101 = {1'b0,$signed(_T_100)}; 
  assign _T_102 = $signed(_T_101) & $signed(-10'sh20); 
  assign _T_103 = $signed(_T_102); 
  assign _T_104 = $signed(_T_103) == $signed(10'sh0); 
  assign _T_105 = io_in_a_bits_address ^ 9'h80; 
  assign _T_106 = {1'b0,$signed(_T_105)}; 
  assign _T_107 = $signed(_T_106) & $signed(-10'sh80); 
  assign _T_108 = $signed(_T_107); 
  assign _T_109 = $signed(_T_108) == $signed(10'sh0); 
  assign _T_110 = io_in_a_bits_address ^ 9'h100; 
  assign _T_111 = {1'b0,$signed(_T_110)}; 
  assign _T_112 = $signed(_T_111) & $signed(-10'sh100); 
  assign _T_113 = $signed(_T_112); 
  assign _T_114 = $signed(_T_113) == $signed(10'sh0); 
  assign _T_115 = _T_84 | _T_89; 
  assign _T_116 = _T_115 | _T_94; 
  assign _T_117 = _T_116 | _T_99; 
  assign _T_118 = _T_117 | _T_104; 
  assign _T_119 = _T_118 | _T_109; 
  assign _T_120 = _T_119 | _T_114; 
  assign _T_125 = reset == 1'h0; 
  assign _T_130 = _T_20 | reset; 
  assign _T_131 = _T_130 == 1'h0; 
  assign _T_134 = _T_39 | reset; 
  assign _T_135 = _T_134 == 1'h0; 
  assign _T_137 = _T_33 | reset; 
  assign _T_138 = _T_137 == 1'h0; 
  assign _T_139 = io_in_a_bits_param <= 3'h2; 
  assign _T_141 = _T_139 | reset; 
  assign _T_142 = _T_141 == 1'h0; 
  assign _T_143 = ~ io_in_a_bits_mask; 
  assign _T_144 = _T_143 == 4'h0; 
  assign _T_146 = _T_144 | reset; 
  assign _T_147 = _T_146 == 1'h0; 
  assign _T_148 = io_in_a_bits_corrupt == 1'h0; 
  assign _T_150 = _T_148 | reset; 
  assign _T_151 = _T_150 == 1'h0; 
  assign _T_152 = io_in_a_bits_opcode == 3'h7; 
  assign _T_217 = io_in_a_bits_param != 3'h0; 
  assign _T_219 = _T_217 | reset; 
  assign _T_220 = _T_219 == 1'h0; 
  assign _T_230 = io_in_a_bits_opcode == 3'h4; 
  assign _T_232 = io_in_a_bits_size <= 2'h2; 
  assign _T_276 = _T_232 & _T_120; 
  assign _T_279 = _T_276 | reset; 
  assign _T_280 = _T_279 == 1'h0; 
  assign _T_287 = io_in_a_bits_param == 3'h0; 
  assign _T_289 = _T_287 | reset; 
  assign _T_290 = _T_289 == 1'h0; 
  assign _T_291 = io_in_a_bits_mask == _T_66; 
  assign _T_293 = _T_291 | reset; 
  assign _T_294 = _T_293 == 1'h0; 
  assign _T_299 = io_in_a_bits_opcode == 3'h0; 
  assign _T_364 = io_in_a_bits_opcode == 3'h1; 
  assign _T_425 = ~ _T_66; 
  assign _T_426 = io_in_a_bits_mask & _T_425; 
  assign _T_427 = _T_426 == 4'h0; 
  assign _T_429 = _T_427 | reset; 
  assign _T_430 = _T_429 == 1'h0; 
  assign _T_431 = io_in_a_bits_opcode == 3'h2; 
  assign _T_485 = io_in_a_bits_param <= 3'h4; 
  assign _T_487 = _T_485 | reset; 
  assign _T_488 = _T_487 == 1'h0; 
  assign _T_493 = io_in_a_bits_opcode == 3'h3; 
  assign _T_547 = io_in_a_bits_param <= 3'h3; 
  assign _T_549 = _T_547 | reset; 
  assign _T_550 = _T_549 == 1'h0; 
  assign _T_555 = io_in_a_bits_opcode == 3'h5; 
  assign _T_617 = io_in_d_bits_opcode <= 3'h6; 
  assign _T_619 = _T_617 | reset; 
  assign _T_620 = _T_619 == 1'h0; 
  assign _T_621 = io_in_d_bits_source == 1'h0; 
  assign _T_630 = io_in_d_bits_opcode == 3'h6; 
  assign _T_632 = _T_621 | reset; 
  assign _T_633 = _T_632 == 1'h0; 
  assign _T_634 = io_in_d_bits_size >= 2'h2; 
  assign _T_636 = _T_634 | reset; 
  assign _T_637 = _T_636 == 1'h0; 
  assign _T_650 = io_in_d_bits_opcode == 3'h4; 
  assign _T_678 = io_in_d_bits_opcode == 3'h5; 
  assign _T_707 = io_in_d_bits_opcode == 3'h0; 
  assign _T_724 = io_in_d_bits_opcode == 3'h1; 
  assign _T_742 = io_in_d_bits_opcode == 3'h2; 
  assign _T_771 = io_in_a_ready & io_in_a_valid; 
  assign _T_782 = _T_781 - 1'h1; 
  assign _T_783 = $unsigned(_T_782); 
  assign _T_784 = _T_783[0:0]; 
  assign _T_785 = _T_781 == 1'h0; 
  assign _T_803 = _T_785 == 1'h0; 
  assign _T_804 = io_in_a_valid & _T_803; 
  assign _T_805 = io_in_a_bits_opcode == _T_794; 
  assign _T_807 = _T_805 | reset; 
  assign _T_808 = _T_807 == 1'h0; 
  assign _T_809 = io_in_a_bits_param == _T_796; 
  assign _T_811 = _T_809 | reset; 
  assign _T_812 = _T_811 == 1'h0; 
  assign _T_813 = io_in_a_bits_size == _T_798; 
  assign _T_815 = _T_813 | reset; 
  assign _T_816 = _T_815 == 1'h0; 
  assign _T_817 = io_in_a_bits_source == _T_800; 
  assign _T_819 = _T_817 | reset; 
  assign _T_820 = _T_819 == 1'h0; 
  assign _T_821 = io_in_a_bits_address == _T_802; 
  assign _T_823 = _T_821 | reset; 
  assign _T_824 = _T_823 == 1'h0; 
  assign _T_826 = _T_771 & _T_785; 
  assign _T_827 = io_in_d_ready & io_in_d_valid; 
  assign _T_837 = _T_836 - 1'h1; 
  assign _T_838 = $unsigned(_T_837); 
  assign _T_839 = _T_838[0:0]; 
  assign _T_840 = _T_836 == 1'h0; 
  assign _T_860 = _T_840 == 1'h0; 
  assign _T_861 = io_in_d_valid & _T_860; 
  assign _T_862 = io_in_d_bits_opcode == _T_849; 
  assign _T_864 = _T_862 | reset; 
  assign _T_865 = _T_864 == 1'h0; 
  assign _T_870 = io_in_d_bits_size == _T_853; 
  assign _T_872 = _T_870 | reset; 
  assign _T_873 = _T_872 == 1'h0; 
  assign _T_874 = io_in_d_bits_source == _T_855; 
  assign _T_876 = _T_874 | reset; 
  assign _T_877 = _T_876 == 1'h0; 
  assign _T_887 = _T_827 & _T_840; 
  assign _T_901 = _T_900 - 1'h1; 
  assign _T_902 = $unsigned(_T_901); 
  assign _T_903 = _T_902[0:0]; 
  assign _T_904 = _T_900 == 1'h0; 
  assign _T_922 = _T_921 - 1'h1; 
  assign _T_923 = $unsigned(_T_922); 
  assign _T_924 = _T_923[0:0]; 
  assign _T_925 = _T_921 == 1'h0; 
  assign _T_936 = _T_771 & _T_904; 
  assign _T_938 = 2'h1 << io_in_a_bits_source; 
  assign _T_939 = _T_889 >> io_in_a_bits_source; 
  assign _T_941 = _T_939 == 1'h0; 
  assign _T_943 = _T_941 | reset; 
  assign _T_944 = _T_943 == 1'h0; 
  assign _GEN_15 = _T_936 ? _T_938 : 2'h0; 
  assign _T_949 = _T_827 & _T_925; 
  assign _T_951 = _T_630 == 1'h0; 
  assign _T_952 = _T_949 & _T_951; 
  assign _T_953 = 2'h1 << io_in_d_bits_source; 
  assign _T_934 = _GEN_15[0]; 
  assign _T_954 = _T_934 | _T_889; 
  assign _T_955 = _T_954 >> io_in_d_bits_source; 
  assign _T_958 = _T_955 | reset; 
  assign _T_959 = _T_958 == 1'h0; 
  assign _GEN_16 = _T_952 ? _T_953 : 2'h0; 
  assign _T_960 = _T_889 | _T_934; 
  assign _T_946 = _GEN_16[0]; 
  assign _T_961 = ~ _T_946; 
  assign _T_962 = _T_960 & _T_961; 
  assign _T_966 = _T_889 == 1'h0; 
  assign _T_967 = plusarg_reader_out == 32'h0; 
  assign _T_968 = _T_966 | _T_967; 
  assign _T_969 = _T_964 < plusarg_reader_out; 
  assign _T_970 = _T_968 | _T_969; 
  assign _T_972 = _T_970 | reset; 
  assign _T_973 = _T_972 == 1'h0; 
  assign _T_975 = _T_964 + 32'h1; 
  assign _T_978 = _T_771 | _T_827; 
  assign _GEN_19 = io_in_a_valid & _T_78; 
  assign _GEN_35 = io_in_a_valid & _T_152; 
  assign _GEN_53 = io_in_a_valid & _T_230; 
  assign _GEN_65 = io_in_a_valid & _T_299; 
  assign _GEN_75 = io_in_a_valid & _T_364; 
  assign _GEN_85 = io_in_a_valid & _T_431; 
  assign _GEN_95 = io_in_a_valid & _T_493; 
  assign _GEN_105 = io_in_a_valid & _T_555; 
  assign _GEN_115 = io_in_d_valid & _T_630; 
  assign _GEN_119 = io_in_d_valid & _T_650; 
  assign _GEN_125 = io_in_d_valid & _T_678; 
  assign _GEN_131 = io_in_d_valid & _T_707; 
  assign _GEN_133 = io_in_d_valid & _T_724; 
  assign _GEN_135 = io_in_d_valid & _T_742; 
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
  _T_781 = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T_794 = _RAND_1[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_796 = _RAND_2[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_798 = _RAND_3[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_800 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_802 = _RAND_5[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  _T_836 = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  _T_849 = _RAND_7[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  _T_853 = _RAND_8[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  _T_855 = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  _T_889 = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  _T_900 = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  _T_921 = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  _T_964 = _RAND_13[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      _T_781 <= 1'h0;
    end else begin
      if (_T_771) begin
        if (_T_785) begin
          _T_781 <= 1'h0;
        end else begin
          _T_781 <= _T_784;
        end
      end
    end
    if (_T_826) begin
      _T_794 <= io_in_a_bits_opcode;
    end
    if (_T_826) begin
      _T_796 <= io_in_a_bits_param;
    end
    if (_T_826) begin
      _T_798 <= io_in_a_bits_size;
    end
    if (_T_826) begin
      _T_800 <= io_in_a_bits_source;
    end
    if (_T_826) begin
      _T_802 <= io_in_a_bits_address;
    end
    if (reset) begin
      _T_836 <= 1'h0;
    end else begin
      if (_T_827) begin
        if (_T_840) begin
          _T_836 <= 1'h0;
        end else begin
          _T_836 <= _T_839;
        end
      end
    end
    if (_T_887) begin
      _T_849 <= io_in_d_bits_opcode;
    end
    if (_T_887) begin
      _T_853 <= io_in_d_bits_size;
    end
    if (_T_887) begin
      _T_855 <= io_in_d_bits_source;
    end
    if (reset) begin
      _T_889 <= 1'h0;
    end else begin
      _T_889 <= _T_962;
    end
    if (reset) begin
      _T_900 <= 1'h0;
    end else begin
      if (_T_771) begin
        if (_T_904) begin
          _T_900 <= 1'h0;
        end else begin
          _T_900 <= _T_903;
        end
      end
    end
    if (reset) begin
      _T_921 <= 1'h0;
    end else begin
      if (_T_827) begin
        if (_T_925) begin
          _T_921 <= 1'h0;
        end else begin
          _T_921 <= _T_924;
        end
      end
    end
    if (reset) begin
      _T_964 <= 32'h0;
    end else begin
      if (_T_978) begin
        _T_964 <= 32'h0;
      end else begin
        _T_964 <= _T_975;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel has invalid opcode (connected at Debug.scala:1058:19)\n    at Monitor.scala:39 assert (TLMessages.isA(bundle.opcode), \"'A' channel has invalid opcode\" + extra)\n"); 
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
        if (_GEN_19 & _T_125) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries AcquireBlock type unsupported by manager (connected at Debug.scala:1058:19)\n    at Monitor.scala:49 assert (edge.manager.supportsAcquireBSafe(edge.address(bundle), bundle.size), \"'A' channel carries AcquireBlock type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_19 & _T_125) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_19 & _T_125) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries AcquireBlock from a client which does not support Probe (connected at Debug.scala:1058:19)\n    at Monitor.scala:50 assert (edge.client.supportsProbe(edge.source(bundle), bundle.size), \"'A' channel carries AcquireBlock from a client which does not support Probe\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_19 & _T_125) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_19 & _T_131) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock carries invalid source ID (connected at Debug.scala:1058:19)\n    at Monitor.scala:51 assert (source_ok, \"'A' channel AcquireBlock carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_19 & _T_131) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_19 & _T_135) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock smaller than a beat (connected at Debug.scala:1058:19)\n    at Monitor.scala:52 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'A' channel AcquireBlock smaller than a beat\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_19 & _T_135) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_19 & _T_138) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock address not aligned to size (connected at Debug.scala:1058:19)\n    at Monitor.scala:53 assert (is_aligned, \"'A' channel AcquireBlock address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_19 & _T_138) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_19 & _T_142) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock carries invalid grow param (connected at Debug.scala:1058:19)\n    at Monitor.scala:54 assert (TLPermissions.isGrow(bundle.param), \"'A' channel AcquireBlock carries invalid grow param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_19 & _T_142) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_19 & _T_147) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock contains invalid mask (connected at Debug.scala:1058:19)\n    at Monitor.scala:55 assert (~bundle.mask === UInt(0), \"'A' channel AcquireBlock contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_19 & _T_147) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_19 & _T_151) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock is corrupt (connected at Debug.scala:1058:19)\n    at Monitor.scala:56 assert (!bundle.corrupt, \"'A' channel AcquireBlock is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_19 & _T_151) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_35 & _T_125) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries AcquirePerm type unsupported by manager (connected at Debug.scala:1058:19)\n    at Monitor.scala:60 assert (edge.manager.supportsAcquireBSafe(edge.address(bundle), bundle.size), \"'A' channel carries AcquirePerm type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_35 & _T_125) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_35 & _T_125) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries AcquirePerm from a client which does not support Probe (connected at Debug.scala:1058:19)\n    at Monitor.scala:61 assert (edge.client.supportsProbe(edge.source(bundle), bundle.size), \"'A' channel carries AcquirePerm from a client which does not support Probe\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_35 & _T_125) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_35 & _T_131) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm carries invalid source ID (connected at Debug.scala:1058:19)\n    at Monitor.scala:62 assert (source_ok, \"'A' channel AcquirePerm carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_35 & _T_131) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_35 & _T_135) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm smaller than a beat (connected at Debug.scala:1058:19)\n    at Monitor.scala:63 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'A' channel AcquirePerm smaller than a beat\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_35 & _T_135) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_35 & _T_138) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm address not aligned to size (connected at Debug.scala:1058:19)\n    at Monitor.scala:64 assert (is_aligned, \"'A' channel AcquirePerm address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_35 & _T_138) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_35 & _T_142) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm carries invalid grow param (connected at Debug.scala:1058:19)\n    at Monitor.scala:65 assert (TLPermissions.isGrow(bundle.param), \"'A' channel AcquirePerm carries invalid grow param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_35 & _T_142) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_35 & _T_220) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm requests NtoB (connected at Debug.scala:1058:19)\n    at Monitor.scala:66 assert (bundle.param =/= TLPermissions.NtoB, \"'A' channel AcquirePerm requests NtoB\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_35 & _T_220) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_35 & _T_147) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm contains invalid mask (connected at Debug.scala:1058:19)\n    at Monitor.scala:67 assert (~bundle.mask === UInt(0), \"'A' channel AcquirePerm contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_35 & _T_147) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_35 & _T_151) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm is corrupt (connected at Debug.scala:1058:19)\n    at Monitor.scala:68 assert (!bundle.corrupt, \"'A' channel AcquirePerm is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_35 & _T_151) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_53 & _T_280) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries Get type unsupported by manager (connected at Debug.scala:1058:19)\n    at Monitor.scala:72 assert (edge.manager.supportsGetSafe(edge.address(bundle), bundle.size), \"'A' channel carries Get type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_53 & _T_280) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_53 & _T_131) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Get carries invalid source ID (connected at Debug.scala:1058:19)\n    at Monitor.scala:73 assert (source_ok, \"'A' channel Get carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_53 & _T_131) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_53 & _T_138) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Get address not aligned to size (connected at Debug.scala:1058:19)\n    at Monitor.scala:74 assert (is_aligned, \"'A' channel Get address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_53 & _T_138) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_53 & _T_290) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Get carries invalid param (connected at Debug.scala:1058:19)\n    at Monitor.scala:75 assert (bundle.param === UInt(0), \"'A' channel Get carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_53 & _T_290) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_53 & _T_294) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Get contains invalid mask (connected at Debug.scala:1058:19)\n    at Monitor.scala:76 assert (bundle.mask === mask, \"'A' channel Get contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_53 & _T_294) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_53 & _T_151) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Get is corrupt (connected at Debug.scala:1058:19)\n    at Monitor.scala:77 assert (!bundle.corrupt, \"'A' channel Get is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_53 & _T_151) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_65 & _T_280) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries PutFull type unsupported by manager (connected at Debug.scala:1058:19)\n    at Monitor.scala:81 assert (edge.manager.supportsPutFullSafe(edge.address(bundle), bundle.size), \"'A' channel carries PutFull type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_65 & _T_280) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_65 & _T_131) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutFull carries invalid source ID (connected at Debug.scala:1058:19)\n    at Monitor.scala:82 assert (source_ok, \"'A' channel PutFull carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_65 & _T_131) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_65 & _T_138) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutFull address not aligned to size (connected at Debug.scala:1058:19)\n    at Monitor.scala:83 assert (is_aligned, \"'A' channel PutFull address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_65 & _T_138) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_65 & _T_290) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutFull carries invalid param (connected at Debug.scala:1058:19)\n    at Monitor.scala:84 assert (bundle.param === UInt(0), \"'A' channel PutFull carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_65 & _T_290) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_65 & _T_294) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutFull contains invalid mask (connected at Debug.scala:1058:19)\n    at Monitor.scala:85 assert (bundle.mask === mask, \"'A' channel PutFull contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_65 & _T_294) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_75 & _T_280) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries PutPartial type unsupported by manager (connected at Debug.scala:1058:19)\n    at Monitor.scala:89 assert (edge.manager.supportsPutPartialSafe(edge.address(bundle), bundle.size), \"'A' channel carries PutPartial type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_75 & _T_280) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_75 & _T_131) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutPartial carries invalid source ID (connected at Debug.scala:1058:19)\n    at Monitor.scala:90 assert (source_ok, \"'A' channel PutPartial carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_75 & _T_131) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_75 & _T_138) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutPartial address not aligned to size (connected at Debug.scala:1058:19)\n    at Monitor.scala:91 assert (is_aligned, \"'A' channel PutPartial address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_75 & _T_138) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_75 & _T_290) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutPartial carries invalid param (connected at Debug.scala:1058:19)\n    at Monitor.scala:92 assert (bundle.param === UInt(0), \"'A' channel PutPartial carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_75 & _T_290) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_75 & _T_430) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutPartial contains invalid mask (connected at Debug.scala:1058:19)\n    at Monitor.scala:93 assert ((bundle.mask & ~mask) === UInt(0), \"'A' channel PutPartial contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_75 & _T_430) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_85 & _T_125) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries Arithmetic type unsupported by manager (connected at Debug.scala:1058:19)\n    at Monitor.scala:97 assert (edge.manager.supportsArithmeticSafe(edge.address(bundle), bundle.size), \"'A' channel carries Arithmetic type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_85 & _T_125) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_85 & _T_131) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Arithmetic carries invalid source ID (connected at Debug.scala:1058:19)\n    at Monitor.scala:98 assert (source_ok, \"'A' channel Arithmetic carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_85 & _T_131) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_85 & _T_138) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Arithmetic address not aligned to size (connected at Debug.scala:1058:19)\n    at Monitor.scala:99 assert (is_aligned, \"'A' channel Arithmetic address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_85 & _T_138) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_85 & _T_488) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Arithmetic carries invalid opcode param (connected at Debug.scala:1058:19)\n    at Monitor.scala:100 assert (TLAtomics.isArithmetic(bundle.param), \"'A' channel Arithmetic carries invalid opcode param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_85 & _T_488) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_85 & _T_294) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Arithmetic contains invalid mask (connected at Debug.scala:1058:19)\n    at Monitor.scala:101 assert (bundle.mask === mask, \"'A' channel Arithmetic contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_85 & _T_294) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_95 & _T_125) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries Logical type unsupported by manager (connected at Debug.scala:1058:19)\n    at Monitor.scala:105 assert (edge.manager.supportsLogicalSafe(edge.address(bundle), bundle.size), \"'A' channel carries Logical type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_95 & _T_125) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_95 & _T_131) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Logical carries invalid source ID (connected at Debug.scala:1058:19)\n    at Monitor.scala:106 assert (source_ok, \"'A' channel Logical carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_95 & _T_131) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_95 & _T_138) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Logical address not aligned to size (connected at Debug.scala:1058:19)\n    at Monitor.scala:107 assert (is_aligned, \"'A' channel Logical address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_95 & _T_138) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_95 & _T_550) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Logical carries invalid opcode param (connected at Debug.scala:1058:19)\n    at Monitor.scala:108 assert (TLAtomics.isLogical(bundle.param), \"'A' channel Logical carries invalid opcode param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_95 & _T_550) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_95 & _T_294) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Logical contains invalid mask (connected at Debug.scala:1058:19)\n    at Monitor.scala:109 assert (bundle.mask === mask, \"'A' channel Logical contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_95 & _T_294) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_105 & _T_125) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries Hint type unsupported by manager (connected at Debug.scala:1058:19)\n    at Monitor.scala:113 assert (edge.manager.supportsHintSafe(edge.address(bundle), bundle.size), \"'A' channel carries Hint type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_105 & _T_125) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_105 & _T_131) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Hint carries invalid source ID (connected at Debug.scala:1058:19)\n    at Monitor.scala:114 assert (source_ok, \"'A' channel Hint carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_105 & _T_131) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_105 & _T_138) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Hint address not aligned to size (connected at Debug.scala:1058:19)\n    at Monitor.scala:115 assert (is_aligned, \"'A' channel Hint address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_105 & _T_138) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_105 & _T_294) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Hint contains invalid mask (connected at Debug.scala:1058:19)\n    at Monitor.scala:116 assert (bundle.mask === mask, \"'A' channel Hint contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_105 & _T_294) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_105 & _T_151) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Hint is corrupt (connected at Debug.scala:1058:19)\n    at Monitor.scala:117 assert (!bundle.corrupt, \"'A' channel Hint is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_105 & _T_151) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_in_d_valid & _T_620) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel has invalid opcode (connected at Debug.scala:1058:19)\n    at Monitor.scala:268 assert (TLMessages.isD(bundle.opcode), \"'D' channel has invalid opcode\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_d_valid & _T_620) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_115 & _T_633) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel ReleaseAck carries invalid source ID (connected at Debug.scala:1058:19)\n    at Monitor.scala:276 assert (source_ok, \"'D' channel ReleaseAck carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_115 & _T_633) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_115 & _T_637) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel ReleaseAck smaller than a beat (connected at Debug.scala:1058:19)\n    at Monitor.scala:277 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'D' channel ReleaseAck smaller than a beat\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_115 & _T_637) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel ReleaseeAck carries invalid param (connected at Debug.scala:1058:19)\n    at Monitor.scala:278 assert (bundle.param === UInt(0), \"'D' channel ReleaseeAck carries invalid param\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel ReleaseAck is corrupt (connected at Debug.scala:1058:19)\n    at Monitor.scala:279 assert (!bundle.corrupt, \"'D' channel ReleaseAck is corrupt\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel ReleaseAck is denied (connected at Debug.scala:1058:19)\n    at Monitor.scala:280 assert (!bundle.denied, \"'D' channel ReleaseAck is denied\" + extra)\n"); 
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
        if (_GEN_119 & _T_633) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant carries invalid source ID (connected at Debug.scala:1058:19)\n    at Monitor.scala:284 assert (source_ok, \"'D' channel Grant carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_119 & _T_633) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_119 & _T_125) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant carries invalid sink ID (connected at Debug.scala:1058:19)\n    at Monitor.scala:285 assert (sink_ok, \"'D' channel Grant carries invalid sink ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_119 & _T_125) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_119 & _T_637) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant smaller than a beat (connected at Debug.scala:1058:19)\n    at Monitor.scala:286 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'D' channel Grant smaller than a beat\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_119 & _T_637) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant carries invalid cap param (connected at Debug.scala:1058:19)\n    at Monitor.scala:287 assert (TLPermissions.isCap(bundle.param), \"'D' channel Grant carries invalid cap param\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant carries toN param (connected at Debug.scala:1058:19)\n    at Monitor.scala:288 assert (bundle.param =/= TLPermissions.toN, \"'D' channel Grant carries toN param\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant is corrupt (connected at Debug.scala:1058:19)\n    at Monitor.scala:289 assert (!bundle.corrupt, \"'D' channel Grant is corrupt\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant is denied (connected at Debug.scala:1058:19)\n    at Monitor.scala:290 assert (deny_put_ok || !bundle.denied, \"'D' channel Grant is denied\" + extra)\n"); 
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
        if (_GEN_125 & _T_633) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData carries invalid source ID (connected at Debug.scala:1058:19)\n    at Monitor.scala:294 assert (source_ok, \"'D' channel GrantData carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_125 & _T_633) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_125 & _T_125) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData carries invalid sink ID (connected at Debug.scala:1058:19)\n    at Monitor.scala:295 assert (sink_ok, \"'D' channel GrantData carries invalid sink ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_125 & _T_125) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_125 & _T_637) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData smaller than a beat (connected at Debug.scala:1058:19)\n    at Monitor.scala:296 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'D' channel GrantData smaller than a beat\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_125 & _T_637) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData carries invalid cap param (connected at Debug.scala:1058:19)\n    at Monitor.scala:297 assert (TLPermissions.isCap(bundle.param), \"'D' channel GrantData carries invalid cap param\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData carries toN param (connected at Debug.scala:1058:19)\n    at Monitor.scala:298 assert (bundle.param =/= TLPermissions.toN, \"'D' channel GrantData carries toN param\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData is denied but not corrupt (connected at Debug.scala:1058:19)\n    at Monitor.scala:299 assert (!bundle.denied || bundle.corrupt, \"'D' channel GrantData is denied but not corrupt\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData is denied (connected at Debug.scala:1058:19)\n    at Monitor.scala:300 assert (deny_get_ok || !bundle.denied, \"'D' channel GrantData is denied\" + extra)\n"); 
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
        if (_GEN_131 & _T_633) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAck carries invalid source ID (connected at Debug.scala:1058:19)\n    at Monitor.scala:304 assert (source_ok, \"'D' channel AccessAck carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_131 & _T_633) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAck carries invalid param (connected at Debug.scala:1058:19)\n    at Monitor.scala:306 assert (bundle.param === UInt(0), \"'D' channel AccessAck carries invalid param\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAck is corrupt (connected at Debug.scala:1058:19)\n    at Monitor.scala:307 assert (!bundle.corrupt, \"'D' channel AccessAck is corrupt\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAck is denied (connected at Debug.scala:1058:19)\n    at Monitor.scala:308 assert (deny_put_ok || !bundle.denied, \"'D' channel AccessAck is denied\" + extra)\n"); 
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
        if (_GEN_133 & _T_633) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAckData carries invalid source ID (connected at Debug.scala:1058:19)\n    at Monitor.scala:312 assert (source_ok, \"'D' channel AccessAckData carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_133 & _T_633) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAckData carries invalid param (connected at Debug.scala:1058:19)\n    at Monitor.scala:314 assert (bundle.param === UInt(0), \"'D' channel AccessAckData carries invalid param\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAckData is denied but not corrupt (connected at Debug.scala:1058:19)\n    at Monitor.scala:315 assert (!bundle.denied || bundle.corrupt, \"'D' channel AccessAckData is denied but not corrupt\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAckData is denied (connected at Debug.scala:1058:19)\n    at Monitor.scala:316 assert (deny_get_ok || !bundle.denied, \"'D' channel AccessAckData is denied\" + extra)\n"); 
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
        if (_GEN_135 & _T_633) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel HintAck carries invalid source ID (connected at Debug.scala:1058:19)\n    at Monitor.scala:320 assert (source_ok, \"'D' channel HintAck carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_135 & _T_633) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel HintAck carries invalid param (connected at Debug.scala:1058:19)\n    at Monitor.scala:322 assert (bundle.param === UInt(0), \"'D' channel HintAck carries invalid param\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel HintAck is corrupt (connected at Debug.scala:1058:19)\n    at Monitor.scala:323 assert (!bundle.corrupt, \"'D' channel HintAck is corrupt\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel HintAck is denied (connected at Debug.scala:1058:19)\n    at Monitor.scala:324 assert (deny_put_ok || !bundle.denied, \"'D' channel HintAck is denied\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'B' channel valid and not TL-C (connected at Debug.scala:1058:19)\n    at Monitor.scala:341 assert (!bundle.b.valid, \"'B' channel valid and not TL-C\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'C' channel valid and not TL-C (connected at Debug.scala:1058:19)\n    at Monitor.scala:342 assert (!bundle.c.valid, \"'C' channel valid and not TL-C\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'E' channel valid and not TL-C (connected at Debug.scala:1058:19)\n    at Monitor.scala:343 assert (!bundle.e.valid, \"'E' channel valid and not TL-C\" + extra)\n"); 
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
        if (_T_804 & _T_808) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel opcode changed within multibeat operation (connected at Debug.scala:1058:19)\n    at Monitor.scala:355 assert (a.bits.opcode === opcode, \"'A' channel opcode changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_804 & _T_808) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_804 & _T_812) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel param changed within multibeat operation (connected at Debug.scala:1058:19)\n    at Monitor.scala:356 assert (a.bits.param  === param,  \"'A' channel param changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_804 & _T_812) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_804 & _T_816) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel size changed within multibeat operation (connected at Debug.scala:1058:19)\n    at Monitor.scala:357 assert (a.bits.size   === size,   \"'A' channel size changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_804 & _T_816) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_804 & _T_820) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel source changed within multibeat operation (connected at Debug.scala:1058:19)\n    at Monitor.scala:358 assert (a.bits.source === source, \"'A' channel source changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_804 & _T_820) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_804 & _T_824) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel address changed with multibeat operation (connected at Debug.scala:1058:19)\n    at Monitor.scala:359 assert (a.bits.address=== address,\"'A' channel address changed with multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_804 & _T_824) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_861 & _T_865) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel opcode changed within multibeat operation (connected at Debug.scala:1058:19)\n    at Monitor.scala:425 assert (d.bits.opcode === opcode, \"'D' channel opcode changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_861 & _T_865) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel param changed within multibeat operation (connected at Debug.scala:1058:19)\n    at Monitor.scala:426 assert (d.bits.param  === param,  \"'D' channel param changed within multibeat operation\" + extra)\n"); 
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
        if (_T_861 & _T_873) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel size changed within multibeat operation (connected at Debug.scala:1058:19)\n    at Monitor.scala:427 assert (d.bits.size   === size,   \"'D' channel size changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_861 & _T_873) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_861 & _T_877) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel source changed within multibeat operation (connected at Debug.scala:1058:19)\n    at Monitor.scala:428 assert (d.bits.source === source, \"'D' channel source changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_861 & _T_877) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel sink changed with multibeat operation (connected at Debug.scala:1058:19)\n    at Monitor.scala:429 assert (d.bits.sink   === sink,   \"'D' channel sink changed with multibeat operation\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel denied changed with multibeat operation (connected at Debug.scala:1058:19)\n    at Monitor.scala:430 assert (d.bits.denied === denied, \"'D' channel denied changed with multibeat operation\" + extra)\n"); 
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
        if (_T_936 & _T_944) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel re-used a source ID (connected at Debug.scala:1058:19)\n    at Monitor.scala:460 assert(!inflight(bundle.a.bits.source), \"'A' channel re-used a source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_936 & _T_944) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_952 & _T_959) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel acknowledged for nothing inflight (connected at Debug.scala:1058:19)\n    at Monitor.scala:467 assert((a_set | inflight)(bundle.d.bits.source), \"'D' channel acknowledged for nothing inflight\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_952 & _T_959) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_973) begin
          $fwrite(32'h80000002,"Assertion failed: TileLink timeout expired (connected at Debug.scala:1058:19)\n    at Monitor.scala:479 assert (!inflight.orR || limit === UInt(0) || watchdog < limit, \"TileLink timeout expired\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_973) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
