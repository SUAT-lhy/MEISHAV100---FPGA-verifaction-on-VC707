module TLMonitor_17( 
  input         clock, 
  input         reset, 
  input         io_in_a_ready, 
  input         io_in_a_valid, 
  input  [2:0]  io_in_a_bits_opcode, 
  input  [2:0]  io_in_a_bits_param, 
  input  [2:0]  io_in_a_bits_size, 
  input  [4:0]  io_in_a_bits_source, 
  input  [16:0] io_in_a_bits_address, 
  input  [3:0]  io_in_a_bits_mask, 
  input         io_in_a_bits_corrupt, 
  input         io_in_d_ready, 
  input         io_in_d_valid, 
  input  [2:0]  io_in_d_bits_size, 
  input  [4:0]  io_in_d_bits_source 
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
  wire [16:0] _GEN_18; 
  wire [16:0] _T_75; 
  wire  _T_76; 
  wire  _T_78; 
  wire [1:0] _T_79; 
  wire [1:0] _T_81; 
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
  wire [1:0] _T_107; 
  wire [1:0] _T_108; 
  wire [3:0] _T_109; 
  wire  _T_236; 
  wire [16:0] _T_238; 
  wire [17:0] _T_239; 
  wire [17:0] _T_240; 
  wire [17:0] _T_241; 
  wire  _T_242; 
  wire  _T_247; 
  wire  _T_287; 
  wire  _T_292; 
  wire  _T_295; 
  wire  _T_298; 
  wire  _T_301; 
  wire  _T_307; 
  wire  _T_310; 
  wire  _T_313; 
  wire  _T_320; 
  wire  _T_321; 
  wire  _T_323; 
  wire  _T_324; 
  wire  _T_327; 
  wire  _T_328; 
  wire  _T_330; 
  wire  _T_331; 
  wire  _T_332; 
  wire  _T_334; 
  wire  _T_335; 
  wire [3:0] _T_336; 
  wire  _T_337; 
  wire  _T_339; 
  wire  _T_340; 
  wire  _T_341; 
  wire  _T_343; 
  wire  _T_344; 
  wire  _T_345; 
  wire  _T_445; 
  wire  _T_447; 
  wire  _T_448; 
  wire  _T_458; 
  wire  _T_460; 
  wire  _T_468; 
  wire  _T_471; 
  wire  _T_472; 
  wire  _T_479; 
  wire  _T_481; 
  wire  _T_482; 
  wire  _T_483; 
  wire  _T_485; 
  wire  _T_486; 
  wire  _T_491; 
  wire  _T_517; 
  wire [3:0] _T_539; 
  wire [3:0] _T_540; 
  wire  _T_541; 
  wire  _T_543; 
  wire  _T_544; 
  wire  _T_545; 
  wire  _T_563; 
  wire  _T_565; 
  wire  _T_566; 
  wire  _T_571; 
  wire  _T_589; 
  wire  _T_591; 
  wire  _T_592; 
  wire  _T_597; 
  wire  _T_627; 
  wire  _T_628; 
  wire  _T_629; 
  wire  _T_630; 
  wire  _T_631; 
  wire  _T_632; 
  wire  _T_633; 
  wire  _T_634; 
  wire  _T_635; 
  wire  _T_636; 
  wire  _T_637; 
  wire  _T_638; 
  wire  _T_641; 
  wire  _T_642; 
  wire  _T_666; 
  wire  _T_667; 
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
  wire  _T_681; 
  wire  _T_682; 
  wire  _T_820; 
  reg [3:0] _T_830; 
  reg [31:0] _RAND_0;
  wire [4:0] _T_831; 
  wire [4:0] _T_832; 
  wire [3:0] _T_833; 
  wire  _T_834; 
  reg [2:0] _T_843; 
  reg [31:0] _RAND_1;
  reg [2:0] _T_845; 
  reg [31:0] _RAND_2;
  reg [2:0] _T_847; 
  reg [31:0] _RAND_3;
  reg [4:0] _T_849; 
  reg [31:0] _RAND_4;
  reg [16:0] _T_851; 
  reg [31:0] _RAND_5;
  wire  _T_852; 
  wire  _T_853; 
  wire  _T_854; 
  wire  _T_856; 
  wire  _T_857; 
  wire  _T_858; 
  wire  _T_860; 
  wire  _T_861; 
  wire  _T_862; 
  wire  _T_864; 
  wire  _T_865; 
  wire  _T_866; 
  wire  _T_868; 
  wire  _T_869; 
  wire  _T_870; 
  wire  _T_872; 
  wire  _T_873; 
  wire  _T_875; 
  wire  _T_876; 
  wire [12:0] _T_878; 
  wire [5:0] _T_879; 
  wire [5:0] _T_880; 
  wire [3:0] _T_881; 
  reg [3:0] _T_885; 
  reg [31:0] _RAND_6;
  wire [4:0] _T_886; 
  wire [4:0] _T_887; 
  wire [3:0] _T_888; 
  wire  _T_889; 
  reg [2:0] _T_902; 
  reg [31:0] _RAND_7;
  reg [4:0] _T_904; 
  reg [31:0] _RAND_8;
  wire  _T_909; 
  wire  _T_910; 
  wire  _T_919; 
  wire  _T_921; 
  wire  _T_922; 
  wire  _T_923; 
  wire  _T_925; 
  wire  _T_926; 
  wire  _T_936; 
  reg [30:0] _T_938; 
  reg [31:0] _RAND_9;
  reg [3:0] _T_949; 
  reg [31:0] _RAND_10;
  wire [4:0] _T_950; 
  wire [4:0] _T_951; 
  wire [3:0] _T_952; 
  wire  _T_953; 
  reg [3:0] _T_970; 
  reg [31:0] _RAND_11;
  wire [4:0] _T_971; 
  wire [4:0] _T_972; 
  wire [3:0] _T_973; 
  wire  _T_974; 
  wire  _T_985; 
  wire [31:0] _T_987; 
  wire [30:0] _T_988; 
  wire  _T_989; 
  wire  _T_990; 
  wire  _T_992; 
  wire  _T_993; 
  wire [31:0] _GEN_15; 
  wire  _T_998; 
  wire [31:0] _T_1002; 
  wire [30:0] _T_983; 
  wire [30:0] _T_1003; 
  wire [30:0] _T_1004; 
  wire  _T_1005; 
  wire  _T_1007; 
  wire  _T_1008; 
  wire [31:0] _GEN_16; 
  wire [30:0] _T_1009; 
  wire [30:0] _T_995; 
  wire [30:0] _T_1010; 
  wire [30:0] _T_1011; 
  reg [31:0] _T_1013; 
  reg [31:0] _RAND_12;
  wire  _T_1014; 
  wire  _T_1015; 
  wire  _T_1016; 
  wire  _T_1017; 
  wire  _T_1018; 
  wire  _T_1019; 
  wire  _T_1021; 
  wire  _T_1022; 
  wire [31:0] _T_1024; 
  wire  _T_1027; 
  wire  _GEN_19; 
  wire  _GEN_35; 
  wire  _GEN_53; 
  wire  _GEN_65; 
  wire  _GEN_75; 
  wire  _GEN_85; 
  wire  _GEN_95; 
  wire  _GEN_105; 
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
  assign _GEN_18 = {{11'd0}, _T_74}; 
  assign _T_75 = io_in_a_bits_address & _GEN_18; 
  assign _T_76 = _T_75 == 17'h0; 
  assign _T_78 = io_in_a_bits_size[0]; 
  assign _T_79 = 2'h1 << _T_78; 
  assign _T_81 = _T_79 | 2'h1; 
  assign _T_82 = io_in_a_bits_size >= 3'h2; 
  assign _T_83 = _T_81[1]; 
  assign _T_84 = io_in_a_bits_address[1]; 
  assign _T_85 = _T_84 == 1'h0; 
  assign _T_87 = _T_83 & _T_85; 
  assign _T_88 = _T_82 | _T_87; 
  assign _T_90 = _T_83 & _T_84; 
  assign _T_91 = _T_82 | _T_90; 
  assign _T_92 = _T_81[0]; 
  assign _T_93 = io_in_a_bits_address[0]; 
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
  assign _T_107 = {_T_100,_T_97}; 
  assign _T_108 = {_T_106,_T_103}; 
  assign _T_109 = {_T_108,_T_107}; 
  assign _T_236 = io_in_a_bits_opcode == 3'h6; 
  assign _T_238 = io_in_a_bits_address ^ 17'h10000; 
  assign _T_239 = {1'b0,$signed(_T_238)}; 
  assign _T_240 = $signed(_T_239) & $signed(-18'sh2000); 
  assign _T_241 = $signed(_T_240); 
  assign _T_242 = $signed(_T_241) == $signed(18'sh0); 
  assign _T_247 = reset == 1'h0; 
  assign _T_287 = 3'h6 == io_in_a_bits_size; 
  assign _T_292 = _T_20 ? _T_287 : 1'h0; 
  assign _T_295 = _T_23 ? _T_287 : 1'h0; 
  assign _T_298 = _T_26 ? _T_287 : 1'h0; 
  assign _T_301 = _T_29 ? _T_287 : 1'h0; 
  assign _T_307 = _T_292 | _T_295; 
  assign _T_310 = _T_307 | _T_298; 
  assign _T_313 = _T_310 | _T_301; 
  assign _T_320 = _T_313 | reset; 
  assign _T_321 = _T_320 == 1'h0; 
  assign _T_323 = _T_70 | reset; 
  assign _T_324 = _T_323 == 1'h0; 
  assign _T_327 = _T_82 | reset; 
  assign _T_328 = _T_327 == 1'h0; 
  assign _T_330 = _T_76 | reset; 
  assign _T_331 = _T_330 == 1'h0; 
  assign _T_332 = io_in_a_bits_param <= 3'h2; 
  assign _T_334 = _T_332 | reset; 
  assign _T_335 = _T_334 == 1'h0; 
  assign _T_336 = ~ io_in_a_bits_mask; 
  assign _T_337 = _T_336 == 4'h0; 
  assign _T_339 = _T_337 | reset; 
  assign _T_340 = _T_339 == 1'h0; 
  assign _T_341 = io_in_a_bits_corrupt == 1'h0; 
  assign _T_343 = _T_341 | reset; 
  assign _T_344 = _T_343 == 1'h0; 
  assign _T_345 = io_in_a_bits_opcode == 3'h7; 
  assign _T_445 = io_in_a_bits_param != 3'h0; 
  assign _T_447 = _T_445 | reset; 
  assign _T_448 = _T_447 == 1'h0; 
  assign _T_458 = io_in_a_bits_opcode == 3'h4; 
  assign _T_460 = io_in_a_bits_size <= 3'h6; 
  assign _T_468 = _T_460 & _T_242; 
  assign _T_471 = _T_468 | reset; 
  assign _T_472 = _T_471 == 1'h0; 
  assign _T_479 = io_in_a_bits_param == 3'h0; 
  assign _T_481 = _T_479 | reset; 
  assign _T_482 = _T_481 == 1'h0; 
  assign _T_483 = io_in_a_bits_mask == _T_109; 
  assign _T_485 = _T_483 | reset; 
  assign _T_486 = _T_485 == 1'h0; 
  assign _T_491 = io_in_a_bits_opcode == 3'h0; 
  assign _T_517 = io_in_a_bits_opcode == 3'h1; 
  assign _T_539 = ~ _T_109; 
  assign _T_540 = io_in_a_bits_mask & _T_539; 
  assign _T_541 = _T_540 == 4'h0; 
  assign _T_543 = _T_541 | reset; 
  assign _T_544 = _T_543 == 1'h0; 
  assign _T_545 = io_in_a_bits_opcode == 3'h2; 
  assign _T_563 = io_in_a_bits_param <= 3'h4; 
  assign _T_565 = _T_563 | reset; 
  assign _T_566 = _T_565 == 1'h0; 
  assign _T_571 = io_in_a_bits_opcode == 3'h3; 
  assign _T_589 = io_in_a_bits_param <= 3'h3; 
  assign _T_591 = _T_589 | reset; 
  assign _T_592 = _T_591 == 1'h0; 
  assign _T_597 = io_in_a_bits_opcode == 3'h5; 
  assign _T_627 = io_in_d_bits_source == 5'h1c; 
  assign _T_628 = io_in_d_bits_source == 5'h1d; 
  assign _T_629 = io_in_d_bits_source == 5'h1e; 
  assign _T_630 = io_in_d_bits_source == 5'h18; 
  assign _T_631 = io_in_d_bits_source == 5'h19; 
  assign _T_632 = io_in_d_bits_source == 5'h1a; 
  assign _T_633 = io_in_d_bits_source == 5'h14; 
  assign _T_634 = io_in_d_bits_source == 5'h15; 
  assign _T_635 = io_in_d_bits_source == 5'h16; 
  assign _T_636 = io_in_d_bits_source == 5'h10; 
  assign _T_637 = io_in_d_bits_source == 5'h11; 
  assign _T_638 = io_in_d_bits_source == 5'h12; 
  assign _T_641 = io_in_d_bits_source[4:4]; 
  assign _T_642 = _T_641 == 1'h0; 
  assign _T_666 = _T_627 | _T_628; 
  assign _T_667 = _T_666 | _T_629; 
  assign _T_668 = _T_667 | _T_630; 
  assign _T_669 = _T_668 | _T_631; 
  assign _T_670 = _T_669 | _T_632; 
  assign _T_671 = _T_670 | _T_633; 
  assign _T_672 = _T_671 | _T_634; 
  assign _T_673 = _T_672 | _T_635; 
  assign _T_674 = _T_673 | _T_636; 
  assign _T_675 = _T_674 | _T_637; 
  assign _T_676 = _T_675 | _T_638; 
  assign _T_677 = _T_676 | _T_642; 
  assign _T_681 = _T_677 | reset; 
  assign _T_682 = _T_681 == 1'h0; 
  assign _T_820 = io_in_a_ready & io_in_a_valid; 
  assign _T_831 = _T_830 - 4'h1; 
  assign _T_832 = $unsigned(_T_831); 
  assign _T_833 = _T_832[3:0]; 
  assign _T_834 = _T_830 == 4'h0; 
  assign _T_852 = _T_834 == 1'h0; 
  assign _T_853 = io_in_a_valid & _T_852; 
  assign _T_854 = io_in_a_bits_opcode == _T_843; 
  assign _T_856 = _T_854 | reset; 
  assign _T_857 = _T_856 == 1'h0; 
  assign _T_858 = io_in_a_bits_param == _T_845; 
  assign _T_860 = _T_858 | reset; 
  assign _T_861 = _T_860 == 1'h0; 
  assign _T_862 = io_in_a_bits_size == _T_847; 
  assign _T_864 = _T_862 | reset; 
  assign _T_865 = _T_864 == 1'h0; 
  assign _T_866 = io_in_a_bits_source == _T_849; 
  assign _T_868 = _T_866 | reset; 
  assign _T_869 = _T_868 == 1'h0; 
  assign _T_870 = io_in_a_bits_address == _T_851; 
  assign _T_872 = _T_870 | reset; 
  assign _T_873 = _T_872 == 1'h0; 
  assign _T_875 = _T_820 & _T_834; 
  assign _T_876 = io_in_d_ready & io_in_d_valid; 
  assign _T_878 = 13'h3f << io_in_d_bits_size; 
  assign _T_879 = _T_878[5:0]; 
  assign _T_880 = ~ _T_879; 
  assign _T_881 = _T_880[5:2]; 
  assign _T_886 = _T_885 - 4'h1; 
  assign _T_887 = $unsigned(_T_886); 
  assign _T_888 = _T_887[3:0]; 
  assign _T_889 = _T_885 == 4'h0; 
  assign _T_909 = _T_889 == 1'h0; 
  assign _T_910 = io_in_d_valid & _T_909; 
  assign _T_919 = io_in_d_bits_size == _T_902; 
  assign _T_921 = _T_919 | reset; 
  assign _T_922 = _T_921 == 1'h0; 
  assign _T_923 = io_in_d_bits_source == _T_904; 
  assign _T_925 = _T_923 | reset; 
  assign _T_926 = _T_925 == 1'h0; 
  assign _T_936 = _T_876 & _T_889; 
  assign _T_950 = _T_949 - 4'h1; 
  assign _T_951 = $unsigned(_T_950); 
  assign _T_952 = _T_951[3:0]; 
  assign _T_953 = _T_949 == 4'h0; 
  assign _T_971 = _T_970 - 4'h1; 
  assign _T_972 = $unsigned(_T_971); 
  assign _T_973 = _T_972[3:0]; 
  assign _T_974 = _T_970 == 4'h0; 
  assign _T_985 = _T_820 & _T_953; 
  assign _T_987 = 32'h1 << io_in_a_bits_source; 
  assign _T_988 = _T_938 >> io_in_a_bits_source; 
  assign _T_989 = _T_988[0]; 
  assign _T_990 = _T_989 == 1'h0; 
  assign _T_992 = _T_990 | reset; 
  assign _T_993 = _T_992 == 1'h0; 
  assign _GEN_15 = _T_985 ? _T_987 : 32'h0; 
  assign _T_998 = _T_876 & _T_974; 
  assign _T_1002 = 32'h1 << io_in_d_bits_source; 
  assign _T_983 = _GEN_15[30:0]; 
  assign _T_1003 = _T_983 | _T_938; 
  assign _T_1004 = _T_1003 >> io_in_d_bits_source; 
  assign _T_1005 = _T_1004[0]; 
  assign _T_1007 = _T_1005 | reset; 
  assign _T_1008 = _T_1007 == 1'h0; 
  assign _GEN_16 = _T_998 ? _T_1002 : 32'h0; 
  assign _T_1009 = _T_938 | _T_983; 
  assign _T_995 = _GEN_16[30:0]; 
  assign _T_1010 = ~ _T_995; 
  assign _T_1011 = _T_1009 & _T_1010; 
  assign _T_1014 = _T_938 != 31'h0; 
  assign _T_1015 = _T_1014 == 1'h0; 
  assign _T_1016 = plusarg_reader_out == 32'h0; 
  assign _T_1017 = _T_1015 | _T_1016; 
  assign _T_1018 = _T_1013 < plusarg_reader_out; 
  assign _T_1019 = _T_1017 | _T_1018; 
  assign _T_1021 = _T_1019 | reset; 
  assign _T_1022 = _T_1021 == 1'h0; 
  assign _T_1024 = _T_1013 + 32'h1; 
  assign _T_1027 = _T_820 | _T_876; 
  assign _GEN_19 = io_in_a_valid & _T_236; 
  assign _GEN_35 = io_in_a_valid & _T_345; 
  assign _GEN_53 = io_in_a_valid & _T_458; 
  assign _GEN_65 = io_in_a_valid & _T_491; 
  assign _GEN_75 = io_in_a_valid & _T_517; 
  assign _GEN_85 = io_in_a_valid & _T_545; 
  assign _GEN_95 = io_in_a_valid & _T_571; 
  assign _GEN_105 = io_in_a_valid & _T_597; 
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
  _T_830 = _RAND_0[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T_843 = _RAND_1[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_845 = _RAND_2[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_847 = _RAND_3[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_849 = _RAND_4[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_851 = _RAND_5[16:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  _T_885 = _RAND_6[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  _T_902 = _RAND_7[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  _T_904 = _RAND_8[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  _T_938 = _RAND_9[30:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  _T_949 = _RAND_10[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  _T_970 = _RAND_11[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  _T_1013 = _RAND_12[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      _T_830 <= 4'h0;
    end else begin
      if (_T_820) begin
        if (_T_834) begin
          _T_830 <= 4'h0;
        end else begin
          _T_830 <= _T_833;
        end
      end
    end
    if (_T_875) begin
      _T_843 <= io_in_a_bits_opcode;
    end
    if (_T_875) begin
      _T_845 <= io_in_a_bits_param;
    end
    if (_T_875) begin
      _T_847 <= io_in_a_bits_size;
    end
    if (_T_875) begin
      _T_849 <= io_in_a_bits_source;
    end
    if (_T_875) begin
      _T_851 <= io_in_a_bits_address;
    end
    if (reset) begin
      _T_885 <= 4'h0;
    end else begin
      if (_T_876) begin
        if (_T_889) begin
          _T_885 <= _T_881;
        end else begin
          _T_885 <= _T_888;
        end
      end
    end
    if (_T_936) begin
      _T_902 <= io_in_d_bits_size;
    end
    if (_T_936) begin
      _T_904 <= io_in_d_bits_source;
    end
    if (reset) begin
      _T_938 <= 31'h0;
    end else begin
      _T_938 <= _T_1011;
    end
    if (reset) begin
      _T_949 <= 4'h0;
    end else begin
      if (_T_820) begin
        if (_T_953) begin
          _T_949 <= 4'h0;
        end else begin
          _T_949 <= _T_952;
        end
      end
    end
    if (reset) begin
      _T_970 <= 4'h0;
    end else begin
      if (_T_876) begin
        if (_T_974) begin
          _T_970 <= _T_881;
        end else begin
          _T_970 <= _T_973;
        end
      end
    end
    if (reset) begin
      _T_1013 <= 32'h0;
    end else begin
      if (_T_1027) begin
        _T_1013 <= 32'h0;
      end else begin
        _T_1013 <= _T_1024;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (1'h0) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel has invalid opcode (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:39 assert (TLMessages.isA(bundle.opcode), \"'A' channel has invalid opcode\" + extra)\n"); 
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
        if (_GEN_19 & _T_247) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries AcquireBlock type unsupported by manager (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:49 assert (edge.manager.supportsAcquireBSafe(edge.address(bundle), bundle.size), \"'A' channel carries AcquireBlock type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_19 & _T_247) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_19 & _T_321) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries AcquireBlock from a client which does not support Probe (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:50 assert (edge.client.supportsProbe(edge.source(bundle), bundle.size), \"'A' channel carries AcquireBlock from a client which does not support Probe\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_19 & _T_321) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_19 & _T_324) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock carries invalid source ID (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:51 assert (source_ok, \"'A' channel AcquireBlock carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_19 & _T_324) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_19 & _T_328) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock smaller than a beat (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:52 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'A' channel AcquireBlock smaller than a beat\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_19 & _T_328) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_19 & _T_331) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock address not aligned to size (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:53 assert (is_aligned, \"'A' channel AcquireBlock address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_19 & _T_331) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_19 & _T_335) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock carries invalid grow param (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:54 assert (TLPermissions.isGrow(bundle.param), \"'A' channel AcquireBlock carries invalid grow param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_19 & _T_335) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_19 & _T_340) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock contains invalid mask (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:55 assert (~bundle.mask === UInt(0), \"'A' channel AcquireBlock contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_19 & _T_340) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_19 & _T_344) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquireBlock is corrupt (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:56 assert (!bundle.corrupt, \"'A' channel AcquireBlock is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_19 & _T_344) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_35 & _T_247) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries AcquirePerm type unsupported by manager (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:60 assert (edge.manager.supportsAcquireBSafe(edge.address(bundle), bundle.size), \"'A' channel carries AcquirePerm type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_35 & _T_247) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_35 & _T_321) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries AcquirePerm from a client which does not support Probe (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:61 assert (edge.client.supportsProbe(edge.source(bundle), bundle.size), \"'A' channel carries AcquirePerm from a client which does not support Probe\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_35 & _T_321) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_35 & _T_324) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm carries invalid source ID (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:62 assert (source_ok, \"'A' channel AcquirePerm carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_35 & _T_324) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_35 & _T_328) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm smaller than a beat (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:63 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'A' channel AcquirePerm smaller than a beat\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_35 & _T_328) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_35 & _T_331) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm address not aligned to size (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:64 assert (is_aligned, \"'A' channel AcquirePerm address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_35 & _T_331) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_35 & _T_335) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm carries invalid grow param (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:65 assert (TLPermissions.isGrow(bundle.param), \"'A' channel AcquirePerm carries invalid grow param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_35 & _T_335) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_35 & _T_448) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm requests NtoB (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:66 assert (bundle.param =/= TLPermissions.NtoB, \"'A' channel AcquirePerm requests NtoB\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_35 & _T_448) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_35 & _T_340) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm contains invalid mask (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:67 assert (~bundle.mask === UInt(0), \"'A' channel AcquirePerm contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_35 & _T_340) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_35 & _T_344) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel AcquirePerm is corrupt (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:68 assert (!bundle.corrupt, \"'A' channel AcquirePerm is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_35 & _T_344) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_53 & _T_472) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries Get type unsupported by manager (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:72 assert (edge.manager.supportsGetSafe(edge.address(bundle), bundle.size), \"'A' channel carries Get type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_53 & _T_472) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_53 & _T_324) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Get carries invalid source ID (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:73 assert (source_ok, \"'A' channel Get carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_53 & _T_324) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_53 & _T_331) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Get address not aligned to size (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:74 assert (is_aligned, \"'A' channel Get address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_53 & _T_331) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_53 & _T_482) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Get carries invalid param (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:75 assert (bundle.param === UInt(0), \"'A' channel Get carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_53 & _T_482) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_53 & _T_486) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Get contains invalid mask (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:76 assert (bundle.mask === mask, \"'A' channel Get contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_53 & _T_486) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_53 & _T_344) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Get is corrupt (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:77 assert (!bundle.corrupt, \"'A' channel Get is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_53 & _T_344) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_65 & _T_247) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries PutFull type unsupported by manager (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:81 assert (edge.manager.supportsPutFullSafe(edge.address(bundle), bundle.size), \"'A' channel carries PutFull type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_65 & _T_247) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_65 & _T_324) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutFull carries invalid source ID (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:82 assert (source_ok, \"'A' channel PutFull carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_65 & _T_324) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_65 & _T_331) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutFull address not aligned to size (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:83 assert (is_aligned, \"'A' channel PutFull address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_65 & _T_331) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_65 & _T_482) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutFull carries invalid param (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:84 assert (bundle.param === UInt(0), \"'A' channel PutFull carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_65 & _T_482) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_65 & _T_486) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutFull contains invalid mask (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:85 assert (bundle.mask === mask, \"'A' channel PutFull contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_65 & _T_486) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_75 & _T_247) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries PutPartial type unsupported by manager (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:89 assert (edge.manager.supportsPutPartialSafe(edge.address(bundle), bundle.size), \"'A' channel carries PutPartial type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_75 & _T_247) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_75 & _T_324) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutPartial carries invalid source ID (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:90 assert (source_ok, \"'A' channel PutPartial carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_75 & _T_324) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_75 & _T_331) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutPartial address not aligned to size (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:91 assert (is_aligned, \"'A' channel PutPartial address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_75 & _T_331) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_75 & _T_482) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutPartial carries invalid param (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:92 assert (bundle.param === UInt(0), \"'A' channel PutPartial carries invalid param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_75 & _T_482) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_75 & _T_544) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel PutPartial contains invalid mask (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:93 assert ((bundle.mask & ~mask) === UInt(0), \"'A' channel PutPartial contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_75 & _T_544) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_85 & _T_247) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries Arithmetic type unsupported by manager (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:97 assert (edge.manager.supportsArithmeticSafe(edge.address(bundle), bundle.size), \"'A' channel carries Arithmetic type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_85 & _T_247) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_85 & _T_324) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Arithmetic carries invalid source ID (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:98 assert (source_ok, \"'A' channel Arithmetic carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_85 & _T_324) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_85 & _T_331) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Arithmetic address not aligned to size (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:99 assert (is_aligned, \"'A' channel Arithmetic address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_85 & _T_331) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_85 & _T_566) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Arithmetic carries invalid opcode param (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:100 assert (TLAtomics.isArithmetic(bundle.param), \"'A' channel Arithmetic carries invalid opcode param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_85 & _T_566) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_85 & _T_486) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Arithmetic contains invalid mask (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:101 assert (bundle.mask === mask, \"'A' channel Arithmetic contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_85 & _T_486) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_95 & _T_247) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries Logical type unsupported by manager (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:105 assert (edge.manager.supportsLogicalSafe(edge.address(bundle), bundle.size), \"'A' channel carries Logical type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_95 & _T_247) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_95 & _T_324) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Logical carries invalid source ID (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:106 assert (source_ok, \"'A' channel Logical carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_95 & _T_324) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_95 & _T_331) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Logical address not aligned to size (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:107 assert (is_aligned, \"'A' channel Logical address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_95 & _T_331) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_95 & _T_592) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Logical carries invalid opcode param (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:108 assert (TLAtomics.isLogical(bundle.param), \"'A' channel Logical carries invalid opcode param\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_95 & _T_592) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_95 & _T_486) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Logical contains invalid mask (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:109 assert (bundle.mask === mask, \"'A' channel Logical contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_95 & _T_486) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_105 & _T_247) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel carries Hint type unsupported by manager (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:113 assert (edge.manager.supportsHintSafe(edge.address(bundle), bundle.size), \"'A' channel carries Hint type unsupported by manager\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_105 & _T_247) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_105 & _T_324) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Hint carries invalid source ID (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:114 assert (source_ok, \"'A' channel Hint carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_105 & _T_324) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_105 & _T_331) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Hint address not aligned to size (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:115 assert (is_aligned, \"'A' channel Hint address not aligned to size\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_105 & _T_331) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_105 & _T_486) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Hint contains invalid mask (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:116 assert (bundle.mask === mask, \"'A' channel Hint contains invalid mask\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_105 & _T_486) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_GEN_105 & _T_344) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel Hint is corrupt (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:117 assert (!bundle.corrupt, \"'A' channel Hint is corrupt\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_GEN_105 & _T_344) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel has invalid opcode (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:268 assert (TLMessages.isD(bundle.opcode), \"'D' channel has invalid opcode\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel ReleaseAck carries invalid source ID (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:276 assert (source_ok, \"'D' channel ReleaseAck carries invalid source ID\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel ReleaseAck smaller than a beat (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:277 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'D' channel ReleaseAck smaller than a beat\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel ReleaseeAck carries invalid param (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:278 assert (bundle.param === UInt(0), \"'D' channel ReleaseeAck carries invalid param\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel ReleaseAck is corrupt (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:279 assert (!bundle.corrupt, \"'D' channel ReleaseAck is corrupt\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel ReleaseAck is denied (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:280 assert (!bundle.denied, \"'D' channel ReleaseAck is denied\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant carries invalid source ID (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:284 assert (source_ok, \"'D' channel Grant carries invalid source ID\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant carries invalid sink ID (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:285 assert (sink_ok, \"'D' channel Grant carries invalid sink ID\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant smaller than a beat (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:286 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'D' channel Grant smaller than a beat\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant carries invalid cap param (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:287 assert (TLPermissions.isCap(bundle.param), \"'D' channel Grant carries invalid cap param\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant carries toN param (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:288 assert (bundle.param =/= TLPermissions.toN, \"'D' channel Grant carries toN param\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant is corrupt (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:289 assert (!bundle.corrupt, \"'D' channel Grant is corrupt\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel Grant is denied (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:290 assert (deny_put_ok || !bundle.denied, \"'D' channel Grant is denied\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData carries invalid source ID (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:294 assert (source_ok, \"'D' channel GrantData carries invalid source ID\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData carries invalid sink ID (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:295 assert (sink_ok, \"'D' channel GrantData carries invalid sink ID\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData smaller than a beat (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:296 assert (bundle.size >= UInt(log2Ceil(edge.manager.beatBytes)), \"'D' channel GrantData smaller than a beat\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData carries invalid cap param (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:297 assert (TLPermissions.isCap(bundle.param), \"'D' channel GrantData carries invalid cap param\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData carries toN param (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:298 assert (bundle.param =/= TLPermissions.toN, \"'D' channel GrantData carries toN param\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData is denied but not corrupt (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:299 assert (!bundle.denied || bundle.corrupt, \"'D' channel GrantData is denied but not corrupt\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel GrantData is denied (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:300 assert (deny_get_ok || !bundle.denied, \"'D' channel GrantData is denied\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAck carries invalid source ID (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:304 assert (source_ok, \"'D' channel AccessAck carries invalid source ID\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAck carries invalid param (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:306 assert (bundle.param === UInt(0), \"'D' channel AccessAck carries invalid param\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAck is corrupt (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:307 assert (!bundle.corrupt, \"'D' channel AccessAck is corrupt\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAck is denied (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:308 assert (deny_put_ok || !bundle.denied, \"'D' channel AccessAck is denied\" + extra)\n"); 
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
        if (io_in_d_valid & _T_682) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAckData carries invalid source ID (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:312 assert (source_ok, \"'D' channel AccessAckData carries invalid source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (io_in_d_valid & _T_682) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAckData carries invalid param (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:314 assert (bundle.param === UInt(0), \"'D' channel AccessAckData carries invalid param\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAckData is denied but not corrupt (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:315 assert (!bundle.denied || bundle.corrupt, \"'D' channel AccessAckData is denied but not corrupt\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel AccessAckData is denied (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:316 assert (deny_get_ok || !bundle.denied, \"'D' channel AccessAckData is denied\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel HintAck carries invalid source ID (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:320 assert (source_ok, \"'D' channel HintAck carries invalid source ID\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel HintAck carries invalid param (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:322 assert (bundle.param === UInt(0), \"'D' channel HintAck carries invalid param\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel HintAck is corrupt (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:323 assert (!bundle.corrupt, \"'D' channel HintAck is corrupt\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel HintAck is denied (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:324 assert (deny_put_ok || !bundle.denied, \"'D' channel HintAck is denied\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'B' channel valid and not TL-C (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:341 assert (!bundle.b.valid, \"'B' channel valid and not TL-C\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'C' channel valid and not TL-C (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:342 assert (!bundle.c.valid, \"'C' channel valid and not TL-C\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'E' channel valid and not TL-C (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:343 assert (!bundle.e.valid, \"'E' channel valid and not TL-C\" + extra)\n"); 
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
        if (_T_853 & _T_857) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel opcode changed within multibeat operation (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:355 assert (a.bits.opcode === opcode, \"'A' channel opcode changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_853 & _T_857) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_853 & _T_861) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel param changed within multibeat operation (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:356 assert (a.bits.param  === param,  \"'A' channel param changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_853 & _T_861) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_853 & _T_865) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel size changed within multibeat operation (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:357 assert (a.bits.size   === size,   \"'A' channel size changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_853 & _T_865) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_853 & _T_869) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel source changed within multibeat operation (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:358 assert (a.bits.source === source, \"'A' channel source changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_853 & _T_869) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_853 & _T_873) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel address changed with multibeat operation (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:359 assert (a.bits.address=== address,\"'A' channel address changed with multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_853 & _T_873) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel opcode changed within multibeat operation (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:425 assert (d.bits.opcode === opcode, \"'D' channel opcode changed within multibeat operation\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel param changed within multibeat operation (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:426 assert (d.bits.param  === param,  \"'D' channel param changed within multibeat operation\" + extra)\n"); 
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
        if (_T_910 & _T_922) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel size changed within multibeat operation (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:427 assert (d.bits.size   === size,   \"'D' channel size changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_910 & _T_922) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_910 & _T_926) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel source changed within multibeat operation (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:428 assert (d.bits.source === source, \"'D' channel source changed within multibeat operation\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_910 & _T_926) begin
          $fatal; 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel sink changed with multibeat operation (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:429 assert (d.bits.sink   === sink,   \"'D' channel sink changed with multibeat operation\" + extra)\n"); 
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
          $fwrite(32'h80000002,"Assertion failed: 'D' channel denied changed with multibeat operation (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:430 assert (d.bits.denied === denied, \"'D' channel denied changed with multibeat operation\" + extra)\n"); 
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
        if (_T_985 & _T_993) begin
          $fwrite(32'h80000002,"Assertion failed: 'A' channel re-used a source ID (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:460 assert(!inflight(bundle.a.bits.source), \"'A' channel re-used a source ID\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_985 & _T_993) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_998 & _T_1008) begin
          $fwrite(32'h80000002,"Assertion failed: 'D' channel acknowledged for nothing inflight (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:467 assert((a_set | inflight)(bundle.d.bits.source), \"'D' channel acknowledged for nothing inflight\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_998 & _T_1008) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_1022) begin
          $fwrite(32'h80000002,"Assertion failed: TileLink timeout expired (connected at BusWrapper.scala:99:52)\n    at Monitor.scala:479 assert (!inflight.orR || limit === UInt(0) || watchdog < limit, \"TileLink timeout expired\" + extra)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_1022) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
