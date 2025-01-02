module IBuf( 
  input         clock, 
  input         reset, 
  output        io_imem_ready, 
  input         io_imem_valid, 
  input         io_imem_bits_btb_taken, 
  input         io_imem_bits_btb_bridx, 
  input  [4:0]  io_imem_bits_btb_entry, 
  input  [7:0]  io_imem_bits_btb_bht_history, 
  input  [39:0] io_imem_bits_pc, 
  input  [31:0] io_imem_bits_data, 
  input         io_imem_bits_xcpt_pf_inst, 
  input         io_imem_bits_xcpt_ae_inst, 
  input         io_imem_bits_replay, 
  input         io_kill, 
  output [39:0] io_pc, 
  output [4:0]  io_btb_resp_entry, 
  output [7:0]  io_btb_resp_bht_history, 
  input         io_inst_0_ready, 
  output        io_inst_0_valid, 
  output        io_inst_0_bits_xcpt0_pf_inst, 
  output        io_inst_0_bits_xcpt0_ae_inst, 
  output        io_inst_0_bits_xcpt1_pf_inst, 
  output        io_inst_0_bits_xcpt1_ae_inst, 
  output        io_inst_0_bits_replay, 
  output        io_inst_0_bits_rvc, 
  output [31:0] io_inst_0_bits_inst_bits, 
  output [4:0]  io_inst_0_bits_inst_rd, 
  output [4:0]  io_inst_0_bits_inst_rs1, 
  output [4:0]  io_inst_0_bits_inst_rs2, 
  output [4:0]  io_inst_0_bits_inst_rs3, 
  output [31:0] io_inst_0_bits_raw 
);
  wire [31:0] RVCExpander_io_in; 
  wire [31:0] RVCExpander_io_out_bits; 
  wire [4:0] RVCExpander_io_out_rd; 
  wire [4:0] RVCExpander_io_out_rs1; 
  wire [4:0] RVCExpander_io_out_rs2; 
  wire [4:0] RVCExpander_io_out_rs3; 
  wire  RVCExpander_io_rvc; 
  reg  nBufValid; 
  reg [31:0] _RAND_0;
  reg [39:0] buf__pc; 
  reg [63:0] _RAND_1;
  reg [31:0] buf__data; 
  reg [31:0] _RAND_2;
  reg  buf__xcpt_pf_inst; 
  reg [31:0] _RAND_3;
  reg  buf__xcpt_ae_inst; 
  reg [31:0] _RAND_4;
  reg  buf__replay; 
  reg [31:0] _RAND_5;
  reg [4:0] ibufBTBResp_entry; 
  reg [31:0] _RAND_6;
  reg [7:0] ibufBTBResp_bht_history; 
  reg [31:0] _RAND_7;
  wire  pcWordBits; 
  wire [1:0] _T_25; 
  wire [1:0] _T_26; 
  wire [1:0] _GEN_56; 
  wire [2:0] _T_27; 
  wire [2:0] _T_28; 
  wire [1:0] nIC; 
  wire [1:0] _T_31; 
  wire [1:0] _GEN_57; 
  wire [1:0] nValid; 
  wire [3:0] _T_94; 
  wire [4:0] _T_95; 
  wire [4:0] _T_96; 
  wire [3:0] _T_97; 
  wire [1:0] valid; 
  wire [1:0] _T_127; 
  wire  _T_128; 
  wire  _T_129; 
  wire [1:0] _T_98; 
  wire [2:0] _T_99; 
  wire [2:0] _T_100; 
  wire [1:0] bufMask; 
  wire [1:0] buf_replay; 
  wire [1:0] _T_130; 
  wire  _T_131; 
  wire  _T_132; 
  wire [1:0] _T_165; 
  wire [1:0] nReady; 
  wire [2:0] _T_29; 
  wire [2:0] _T_30; 
  wire [1:0] nICReady; 
  wire  _T_33; 
  wire  _T_34; 
  wire  _T_35; 
  wire [2:0] _T_36; 
  wire [2:0] _T_37; 
  wire [1:0] _T_38; 
  wire  _T_39; 
  wire  _T_40; 
  wire [2:0] _T_43; 
  wire [2:0] _T_44; 
  wire [1:0] _T_45; 
  wire [1:0] _T_46; 
  wire  _T_48; 
  wire  _T_49; 
  wire  _T_50; 
  wire  _T_55; 
  wire [1:0] _T_57; 
  wire [15:0] _T_61; 
  wire [31:0] _T_62; 
  wire [63:0] _T_63; 
  wire [5:0] _GEN_64; 
  wire [5:0] _T_64; 
  wire [63:0] _T_65; 
  wire [15:0] _T_66; 
  wire [39:0] _T_68; 
  wire [2:0] _GEN_65; 
  wire [2:0] _T_69; 
  wire [39:0] _GEN_66; 
  wire [39:0] _T_71; 
  wire [39:0] _T_72; 
  wire [39:0] _T_73; 
  wire [1:0] _GEN_0; 
  wire [1:0] _GEN_23; 
  wire [1:0] _GEN_46; 
  wire [1:0] _T_75; 
  wire [2:0] _T_76; 
  wire [2:0] _T_77; 
  wire [1:0] icShiftAmt; 
  wire [15:0] _T_79; 
  wire [31:0] _T_80; 
  wire [63:0] _T_81; 
  wire [15:0] _T_82; 
  wire [31:0] _T_83; 
  wire [63:0] _T_84; 
  wire [127:0] _T_85; 
  wire [5:0] _GEN_69; 
  wire [5:0] _T_86; 
  wire [190:0] _GEN_70; 
  wire [190:0] _T_87; 
  wire [31:0] icData; 
  wire [4:0] _GEN_71; 
  wire [4:0] _T_89; 
  wire [62:0] _T_90; 
  wire [31:0] icMask; 
  wire [31:0] _T_91; 
  wire [31:0] _T_92; 
  wire [31:0] _T_93; 
  wire  _T_101; 
  wire  _T_102; 
  wire  xcpt_1_pf_inst; 
  wire  xcpt_1_ae_inst; 
  wire [1:0] _T_103; 
  wire [1:0] _T_104; 
  wire [1:0] _T_105; 
  wire [1:0] ic_replay; 
  wire  _T_106; 
  wire  _T_107; 
  wire  _T_108; 
  wire  _T_109; 
  wire  _T_110; 
  wire  _T_112; 
  wire  _T_113; 
  wire  _T_114; 
  wire [1:0] _T_116; 
  wire  _T_117; 
  wire  _T_118; 
  wire [1:0] _T_121; 
  wire  _T_122; 
  wire  _T_123; 
  wire [1:0] _T_133; 
  wire  _T_134; 
  wire [1:0] _T_142; 
  wire [1:0] _T_143; 
  wire [1:0] _T_151; 
  wire  _T_152; 
  wire  _T_153; 
  wire [1:0] _T_156; 
  wire  _T_157; 
  wire  _T_158; 
  RVCExpander RVCExpander ( 
    .io_in(RVCExpander_io_in),
    .io_out_bits(RVCExpander_io_out_bits),
    .io_out_rd(RVCExpander_io_out_rd),
    .io_out_rs1(RVCExpander_io_out_rs1),
    .io_out_rs2(RVCExpander_io_out_rs2),
    .io_out_rs3(RVCExpander_io_out_rs3),
    .io_rvc(RVCExpander_io_rvc)
  );
  assign pcWordBits = io_imem_bits_pc[1]; 
  assign _T_25 = io_imem_bits_btb_bridx + 1'h1; 
  assign _T_26 = io_imem_bits_btb_taken ? _T_25 : 2'h2; 
  assign _GEN_56 = {{1'd0}, pcWordBits}; 
  assign _T_27 = _T_26 - _GEN_56; 
  assign _T_28 = $unsigned(_T_27); 
  assign nIC = _T_28[1:0]; 
  assign _T_31 = io_imem_valid ? nIC : 2'h0; 
  assign _GEN_57 = {{1'd0}, nBufValid}; 
  assign nValid = _T_31 + _GEN_57; 
  assign _T_94 = 4'h1 << nValid; 
  assign _T_95 = _T_94 - 4'h1; 
  assign _T_96 = $unsigned(_T_95); 
  assign _T_97 = _T_96[3:0]; 
  assign valid = _T_97[1:0]; 
  assign _T_127 = valid >> 1'h1; 
  assign _T_128 = _T_127[0]; 
  assign _T_129 = RVCExpander_io_rvc | _T_128; 
  assign _T_98 = 2'h1 << nBufValid; 
  assign _T_99 = _T_98 - 2'h1; 
  assign _T_100 = $unsigned(_T_99); 
  assign bufMask = _T_100[1:0]; 
  assign buf_replay = buf__replay ? bufMask : 2'h0; 
  assign _T_130 = buf_replay >> 1'h0; 
  assign _T_131 = _T_130[0]; 
  assign _T_132 = _T_129 | _T_131; 
  assign _T_165 = RVCExpander_io_rvc ? 2'h1 : 2'h2; 
  assign nReady = _T_132 ? _T_165 : 2'h0; 
  assign _T_29 = nReady - _GEN_57; 
  assign _T_30 = $unsigned(_T_29); 
  assign nICReady = _T_30[1:0]; 
  assign _T_33 = nReady >= _GEN_57; 
  assign _T_34 = io_inst_0_ready & _T_33; 
  assign _T_35 = nICReady >= nIC; 
  assign _T_36 = nIC - nICReady; 
  assign _T_37 = $unsigned(_T_36); 
  assign _T_38 = _T_37[1:0]; 
  assign _T_39 = 2'h1 >= _T_38; 
  assign _T_40 = _T_35 | _T_39; 
  assign _T_43 = _GEN_57 - nReady; 
  assign _T_44 = $unsigned(_T_43); 
  assign _T_45 = _T_44[1:0]; 
  assign _T_46 = _T_33 ? 2'h0 : _T_45; 
  assign _T_48 = io_imem_valid & _T_33; 
  assign _T_49 = nICReady < nIC; 
  assign _T_50 = _T_48 & _T_49; 
  assign _T_55 = _T_50 & _T_39; 
  assign _T_57 = _GEN_56 + nICReady; 
  assign _T_61 = io_imem_bits_data[31:16]; 
  assign _T_62 = {_T_61,_T_61}; 
  assign _T_63 = {_T_62,io_imem_bits_data}; 
  assign _GEN_64 = {{4'd0}, _T_57}; 
  assign _T_64 = _GEN_64 << 4; 
  assign _T_65 = _T_63 >> _T_64; 
  assign _T_66 = _T_65[15:0]; 
  assign _T_68 = io_imem_bits_pc & 40'hfffffffffc; 
  assign _GEN_65 = {{1'd0}, nICReady}; 
  assign _T_69 = _GEN_65 << 1; 
  assign _GEN_66 = {{37'd0}, _T_69}; 
  assign _T_71 = io_imem_bits_pc + _GEN_66; 
  assign _T_72 = _T_71 & 40'h3; 
  assign _T_73 = _T_68 | _T_72; 
  assign _GEN_0 = _T_55 ? _T_38 : _T_46; 
  assign _GEN_23 = io_inst_0_ready ? _GEN_0 : {{1'd0}, nBufValid}; 
  assign _GEN_46 = io_kill ? 2'h0 : _GEN_23; 
  assign _T_75 = 2'h2 + _GEN_57; 
  assign _T_76 = _T_75 - _GEN_56; 
  assign _T_77 = $unsigned(_T_76); 
  assign icShiftAmt = _T_77[1:0]; 
  assign _T_79 = io_imem_bits_data[15:0]; 
  assign _T_80 = {_T_79,_T_79}; 
  assign _T_81 = {io_imem_bits_data,_T_80}; 
  assign _T_82 = _T_81[63:48]; 
  assign _T_83 = {_T_82,_T_82}; 
  assign _T_84 = {_T_83,_T_83}; 
  assign _T_85 = {_T_84,_T_81}; 
  assign _GEN_69 = {{4'd0}, icShiftAmt}; 
  assign _T_86 = _GEN_69 << 4; 
  assign _GEN_70 = {{63'd0}, _T_85}; 
  assign _T_87 = _GEN_70 << _T_86; 
  assign icData = _T_87[95:64]; 
  assign _GEN_71 = {{4'd0}, nBufValid}; 
  assign _T_89 = _GEN_71 << 4; 
  assign _T_90 = 63'hffffffff << _T_89; 
  assign icMask = _T_90[31:0]; 
  assign _T_91 = icData & icMask; 
  assign _T_92 = ~ icMask; 
  assign _T_93 = buf__data & _T_92; 
  assign _T_101 = bufMask[0]; 
  assign _T_102 = bufMask[1]; 
  assign xcpt_1_pf_inst = _T_102 ? buf__xcpt_pf_inst : io_imem_bits_xcpt_pf_inst; 
  assign xcpt_1_ae_inst = _T_102 ? buf__xcpt_ae_inst : io_imem_bits_xcpt_ae_inst; 
  assign _T_103 = ~ bufMask; 
  assign _T_104 = valid & _T_103; 
  assign _T_105 = io_imem_bits_replay ? _T_104 : 2'h0; 
  assign ic_replay = buf_replay | _T_105; 
  assign _T_106 = io_imem_valid == 1'h0; 
  assign _T_107 = io_imem_bits_btb_taken == 1'h0; 
  assign _T_108 = _T_106 | _T_107; 
  assign _T_109 = io_imem_bits_btb_bridx >= pcWordBits; 
  assign _T_110 = _T_108 | _T_109; 
  assign _T_112 = _T_110 | reset; 
  assign _T_113 = _T_112 == 1'h0; 
  assign _T_114 = nBufValid > 1'h0; 
  assign _T_116 = ic_replay >> 1'h0; 
  assign _T_117 = _T_116[0]; 
  assign _T_118 = RVCExpander_io_rvc == 1'h0; 
  assign _T_121 = ic_replay >> 1'h1; 
  assign _T_122 = _T_121[0]; 
  assign _T_123 = _T_118 & _T_122; 
  assign _T_133 = valid >> 1'h0; 
  assign _T_134 = _T_133[0]; 
  assign _T_142 = {xcpt_1_pf_inst,xcpt_1_ae_inst}; 
  assign _T_143 = RVCExpander_io_rvc ? 2'h0 : _T_142; 
  assign _T_151 = bufMask >> 1'h0; 
  assign _T_152 = _T_151[0]; 
  assign _T_153 = _T_152 & RVCExpander_io_rvc; 
  assign _T_156 = bufMask >> 1'h1; 
  assign _T_157 = _T_156[0]; 
  assign _T_158 = _T_153 | _T_157; 
  assign io_imem_ready = _T_34 & _T_40; 
  assign io_pc = _T_114 ? buf__pc : io_imem_bits_pc; 
  assign io_btb_resp_entry = _T_158 ? ibufBTBResp_entry : io_imem_bits_btb_entry; 
  assign io_btb_resp_bht_history = _T_158 ? ibufBTBResp_bht_history : io_imem_bits_btb_bht_history; 
  assign io_inst_0_valid = _T_134 & _T_132; 
  assign io_inst_0_bits_xcpt0_pf_inst = _T_101 ? buf__xcpt_pf_inst : io_imem_bits_xcpt_pf_inst; 
  assign io_inst_0_bits_xcpt0_ae_inst = _T_101 ? buf__xcpt_ae_inst : io_imem_bits_xcpt_ae_inst; 
  assign io_inst_0_bits_xcpt1_pf_inst = _T_143[1]; 
  assign io_inst_0_bits_xcpt1_ae_inst = _T_143[0]; 
  assign io_inst_0_bits_replay = _T_117 | _T_123; 
  assign io_inst_0_bits_rvc = RVCExpander_io_rvc; 
  assign io_inst_0_bits_inst_bits = RVCExpander_io_out_bits; 
  assign io_inst_0_bits_inst_rd = RVCExpander_io_out_rd; 
  assign io_inst_0_bits_inst_rs1 = RVCExpander_io_out_rs1; 
  assign io_inst_0_bits_inst_rs2 = RVCExpander_io_out_rs2; 
  assign io_inst_0_bits_inst_rs3 = RVCExpander_io_out_rs3; 
  assign io_inst_0_bits_raw = _T_91 | _T_93; 
  assign RVCExpander_io_in = _T_91 | _T_93; 
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
  nBufValid = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {2{`RANDOM}};
  buf__pc = _RAND_1[39:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  buf__data = _RAND_2[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  buf__xcpt_pf_inst = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  buf__xcpt_ae_inst = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  buf__replay = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  ibufBTBResp_entry = _RAND_6[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  ibufBTBResp_bht_history = _RAND_7[7:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      nBufValid <= 1'h0;
    end else begin
      nBufValid <= _GEN_46[0];
    end
    if (io_inst_0_ready) begin
      if (_T_55) begin
        buf__pc <= _T_73;
      end
    end
    if (io_inst_0_ready) begin
      if (_T_55) begin
        buf__data <= {{16'd0}, _T_66};
      end
    end
    if (io_inst_0_ready) begin
      if (_T_55) begin
        buf__xcpt_pf_inst <= io_imem_bits_xcpt_pf_inst;
      end
    end
    if (io_inst_0_ready) begin
      if (_T_55) begin
        buf__xcpt_ae_inst <= io_imem_bits_xcpt_ae_inst;
      end
    end
    if (io_inst_0_ready) begin
      if (_T_55) begin
        buf__replay <= io_imem_bits_replay;
      end
    end
    if (io_inst_0_ready) begin
      if (_T_55) begin
        ibufBTBResp_entry <= io_imem_bits_btb_entry;
      end
    end
    if (io_inst_0_ready) begin
      if (_T_55) begin
        ibufBTBResp_bht_history <= io_imem_bits_btb_bht_history;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_113) begin
          $fwrite(32'h80000002,"Assertion failed\n    at IBuf.scala:79 assert(!io.imem.valid || !io.imem.bits.btb.taken || io.imem.bits.btb.bridx >= pcWordBits)\n"); 
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_113) begin
          $fatal; 
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
