module CHIPLINK_PREFIX_TLToAXI4(
  input         clock,
  input         reset,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
  input  [2:0]  auto_in_a_bits_param,
  input  [2:0]  auto_in_a_bits_size,
  input  [6:0]  auto_in_a_bits_source,
  input  [31:0] auto_in_a_bits_address,
  input  [7:0]  auto_in_a_bits_mask,
  input  [63:0] auto_in_a_bits_data,
  input         auto_in_a_bits_corrupt,
  input         auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [2:0]  auto_in_d_bits_size,
  output [6:0]  auto_in_d_bits_source,
  output        auto_in_d_bits_denied,
  output [63:0] auto_in_d_bits_data,
  output        auto_in_d_bits_corrupt,
  input         auto_out_awready,
  output        auto_out_awvalid,
  output [4:0]  auto_out_awid,
  output [31:0] auto_out_awaddr,
  output [7:0]  auto_out_awlen,
  output [2:0]  auto_out_awsize,
  output [1:0]  auto_out_awburst,
  output [3:0]  auto_out_awecho_tl_state_size,
  output [6:0]  auto_out_awecho_tl_state_source,
  input         auto_out_wready,
  output        auto_out_wvalid,
  output [63:0] auto_out_wdata,
  output [7:0]  auto_out_wstrb,
  output        auto_out_wlast,
  output        auto_out_bready,
  input         auto_out_bvalid,
  input  [4:0]  auto_out_bid,
  input  [1:0]  auto_out_bresp,
  input  [3:0]  auto_out_becho_tl_state_size,
  input  [6:0]  auto_out_becho_tl_state_source,
  input         auto_out_arready,
  output        auto_out_arvalid,
  output [4:0]  auto_out_arid,
  output [31:0] auto_out_araddr,
  output [7:0]  auto_out_arlen,
  output [2:0]  auto_out_arsize,
  output [1:0]  auto_out_arburst,
  output [3:0]  auto_out_arecho_tl_state_size,
  output [6:0]  auto_out_arecho_tl_state_source,
  output        auto_out_rready,
  input         auto_out_rvalid,
  input  [4:0]  auto_out_rid,
  input  [63:0] auto_out_rdata,
  input  [1:0]  auto_out_rresp,
  input  [3:0]  auto_out_recho_tl_state_size,
  input  [6:0]  auto_out_recho_tl_state_source,
  input         auto_out_rlast
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
  reg [31:0] _RAND_32;
  reg [31:0] _RAND_33;
  reg [31:0] _RAND_34;
  reg [31:0] _RAND_35;
`endif // RANDOMIZE_REG_INIT
  wire  monitor_clock;
  wire  monitor_reset;
  wire  monitor_io_in_a_ready;
  wire  monitor_io_in_a_valid;
  wire [2:0] monitor_io_in_a_bits_opcode;
  wire [2:0] monitor_io_in_a_bits_param;
  wire [2:0] monitor_io_in_a_bits_size;
  wire [6:0] monitor_io_in_a_bits_source;
  wire [31:0] monitor_io_in_a_bits_address;
  wire [7:0] monitor_io_in_a_bits_mask;
  wire  monitor_io_in_a_bits_corrupt;
  wire  monitor_io_in_d_ready;
  wire  monitor_io_in_d_valid;
  wire [2:0] monitor_io_in_d_bits_opcode;
  wire [2:0] monitor_io_in_d_bits_size;
  wire [6:0] monitor_io_in_d_bits_source;
  wire  monitor_io_in_d_bits_denied;
  wire  monitor_io_in_d_bits_corrupt;
  wire  deq_clock;
  wire  deq_reset;
  wire  deq_io_enq_ready;
  wire  deq_io_enq_valid;
  wire [63:0] deq_io_enq_bits_data;
  wire [7:0] deq_io_enq_bits_strb;
  wire  deq_io_enq_bits_last;
  wire  deq_io_deq_ready;
  wire  deq_io_deq_valid;
  wire [63:0] deq_io_deq_bits_data;
  wire [7:0] deq_io_deq_bits_strb;
  wire  deq_io_deq_bits_last;
  wire  queue_arw_deq_clock;
  wire  queue_arw_deq_reset;
  wire  queue_arw_deq_io_enq_ready;
  wire  queue_arw_deq_io_enq_valid;
  wire [4:0] queue_arw_deq_io_enq_bits_id;
  wire [31:0] queue_arw_deq_io_enq_bits_addr;
  wire [7:0] queue_arw_deq_io_enq_bits_len;
  wire [2:0] queue_arw_deq_io_enq_bits_size;
  wire [3:0] queue_arw_deq_io_enq_bits_echo_tl_state_size;
  wire [6:0] queue_arw_deq_io_enq_bits_echo_tl_state_source;
  wire  queue_arw_deq_io_enq_bits_wen;
  wire  queue_arw_deq_io_deq_ready;
  wire  queue_arw_deq_io_deq_valid;
  wire [4:0] queue_arw_deq_io_deq_bits_id;
  wire [31:0] queue_arw_deq_io_deq_bits_addr;
  wire [7:0] queue_arw_deq_io_deq_bits_len;
  wire [2:0] queue_arw_deq_io_deq_bits_size;
  wire [1:0] queue_arw_deq_io_deq_bits_burst;
  wire [3:0] queue_arw_deq_io_deq_bits_echo_tl_state_size;
  wire [6:0] queue_arw_deq_io_deq_bits_echo_tl_state_source;
  wire  queue_arw_deq_io_deq_bits_wen;
  wire  a_isPut = ~auto_in_a_bits_opcode[2];
  reg [4:0] count_7;
  wire  idle_6 = count_7 == 5'h0;
  reg  write_6;
  wire  mismatch_6 = write_6 != a_isPut;
  wire  idStall_6 = ~idle_6 & mismatch_6 | count_7 == 5'h10;
  reg [4:0] count_6;
  wire  idle_5 = count_6 == 5'h0;
  reg  write_5;
  wire  mismatch_5 = write_5 != a_isPut;
  wire  idStall_5 = ~idle_5 & mismatch_5 | count_6 == 5'h10;
  reg [4:0] count_5;
  wire  idle_4 = count_5 == 5'h0;
  reg  write_4;
  wire  mismatch_4 = write_4 != a_isPut;
  wire  idStall_4 = ~idle_4 & mismatch_4 | count_5 == 5'h10;
  reg [4:0] count_4;
  wire  idle_3 = count_4 == 5'h0;
  reg  write_3;
  wire  mismatch_3 = write_3 != a_isPut;
  wire  idStall_3 = ~idle_3 & mismatch_3 | count_4 == 5'h10;
  reg [4:0] count_3;
  wire  idle_2 = count_3 == 5'h0;
  reg  write_2;
  wire  mismatch_2 = write_2 != a_isPut;
  wire  idStall_2 = ~idle_2 & mismatch_2 | count_3 == 5'h10;
  reg [4:0] count_2;
  wire  idle_1 = count_2 == 5'h0;
  reg  write_1;
  wire  mismatch_1 = write_1 != a_isPut;
  wire  idStall_1 = ~idle_1 & mismatch_1 | count_2 == 5'h10;
  reg [4:0] count_1;
  wire  idle = count_1 == 5'h0;
  reg  write;
  wire  mismatch = write != a_isPut;
  wire  idStall_0 = ~idle & mismatch | count_1 == 5'h10;
  reg  count_23;
  wire  idle_22 = ~count_23;
  reg  count_22;
  wire  idle_21 = ~count_22;
  reg  count_21;
  wire  idle_20 = ~count_21;
  reg  count_20;
  wire  idle_19 = ~count_20;
  reg  count_19;
  wire  idle_18 = ~count_19;
  reg  count_18;
  wire  idle_17 = ~count_18;
  reg  count_17;
  wire  idle_16 = ~count_17;
  reg  count_16;
  wire  idle_15 = ~count_16;
  reg  count_15;
  wire  idle_14 = ~count_15;
  reg  count_14;
  wire  idle_13 = ~count_14;
  reg  count_13;
  wire  idle_12 = ~count_13;
  reg  count_12;
  wire  idle_11 = ~count_12;
  reg  count_11;
  wire  idle_10 = ~count_11;
  reg  count_10;
  wire  idle_9 = ~count_10;
  reg  count_9;
  wire  idle_8 = ~count_9;
  reg  count_8;
  wire  idle_7 = ~count_8;
  wire  _GEN_131 = 7'h1 == auto_in_a_bits_source ? count_9 : count_8;
  wire  _GEN_132 = 7'h2 == auto_in_a_bits_source ? count_10 : _GEN_131;
  wire  _GEN_133 = 7'h3 == auto_in_a_bits_source ? count_11 : _GEN_132;
  wire  _GEN_134 = 7'h4 == auto_in_a_bits_source ? count_12 : _GEN_133;
  wire  _GEN_135 = 7'h5 == auto_in_a_bits_source ? count_13 : _GEN_134;
  wire  _GEN_136 = 7'h6 == auto_in_a_bits_source ? count_14 : _GEN_135;
  wire  _GEN_137 = 7'h7 == auto_in_a_bits_source ? count_15 : _GEN_136;
  wire  _GEN_138 = 7'h8 == auto_in_a_bits_source ? count_16 : _GEN_137;
  wire  _GEN_139 = 7'h9 == auto_in_a_bits_source ? count_17 : _GEN_138;
  wire  _GEN_140 = 7'ha == auto_in_a_bits_source ? count_18 : _GEN_139;
  wire  _GEN_141 = 7'hb == auto_in_a_bits_source ? count_19 : _GEN_140;
  wire  _GEN_142 = 7'hc == auto_in_a_bits_source ? count_20 : _GEN_141;
  wire  _GEN_143 = 7'hd == auto_in_a_bits_source ? count_21 : _GEN_142;
  wire  _GEN_144 = 7'he == auto_in_a_bits_source ? count_22 : _GEN_143;
  wire  _GEN_145 = 7'hf == auto_in_a_bits_source ? count_23 : _GEN_144;
  wire  _GEN_146 = 7'h10 == auto_in_a_bits_source ? idStall_0 : _GEN_145;
  wire  _GEN_147 = 7'h11 == auto_in_a_bits_source ? idStall_0 : _GEN_146;
  wire  _GEN_148 = 7'h12 == auto_in_a_bits_source ? idStall_0 : _GEN_147;
  wire  _GEN_149 = 7'h13 == auto_in_a_bits_source ? idStall_0 : _GEN_148;
  wire  _GEN_150 = 7'h14 == auto_in_a_bits_source ? idStall_0 : _GEN_149;
  wire  _GEN_151 = 7'h15 == auto_in_a_bits_source ? idStall_0 : _GEN_150;
  wire  _GEN_152 = 7'h16 == auto_in_a_bits_source ? idStall_0 : _GEN_151;
  wire  _GEN_153 = 7'h17 == auto_in_a_bits_source ? idStall_0 : _GEN_152;
  wire  _GEN_154 = 7'h18 == auto_in_a_bits_source ? idStall_0 : _GEN_153;
  wire  _GEN_155 = 7'h19 == auto_in_a_bits_source ? idStall_0 : _GEN_154;
  wire  _GEN_156 = 7'h1a == auto_in_a_bits_source ? idStall_0 : _GEN_155;
  wire  _GEN_157 = 7'h1b == auto_in_a_bits_source ? idStall_0 : _GEN_156;
  wire  _GEN_158 = 7'h1c == auto_in_a_bits_source ? idStall_0 : _GEN_157;
  wire  _GEN_159 = 7'h1d == auto_in_a_bits_source ? idStall_0 : _GEN_158;
  wire  _GEN_160 = 7'h1e == auto_in_a_bits_source ? idStall_0 : _GEN_159;
  wire  _GEN_161 = 7'h1f == auto_in_a_bits_source ? idStall_0 : _GEN_160;
  wire  _GEN_162 = 7'h20 == auto_in_a_bits_source ? idStall_1 : _GEN_161;
  wire  _GEN_163 = 7'h21 == auto_in_a_bits_source ? idStall_1 : _GEN_162;
  wire  _GEN_164 = 7'h22 == auto_in_a_bits_source ? idStall_1 : _GEN_163;
  wire  _GEN_165 = 7'h23 == auto_in_a_bits_source ? idStall_1 : _GEN_164;
  wire  _GEN_166 = 7'h24 == auto_in_a_bits_source ? idStall_1 : _GEN_165;
  wire  _GEN_167 = 7'h25 == auto_in_a_bits_source ? idStall_1 : _GEN_166;
  wire  _GEN_168 = 7'h26 == auto_in_a_bits_source ? idStall_1 : _GEN_167;
  wire  _GEN_169 = 7'h27 == auto_in_a_bits_source ? idStall_1 : _GEN_168;
  wire  _GEN_170 = 7'h28 == auto_in_a_bits_source ? idStall_1 : _GEN_169;
  wire  _GEN_171 = 7'h29 == auto_in_a_bits_source ? idStall_1 : _GEN_170;
  wire  _GEN_172 = 7'h2a == auto_in_a_bits_source ? idStall_1 : _GEN_171;
  wire  _GEN_173 = 7'h2b == auto_in_a_bits_source ? idStall_1 : _GEN_172;
  wire  _GEN_174 = 7'h2c == auto_in_a_bits_source ? idStall_1 : _GEN_173;
  wire  _GEN_175 = 7'h2d == auto_in_a_bits_source ? idStall_1 : _GEN_174;
  wire  _GEN_176 = 7'h2e == auto_in_a_bits_source ? idStall_1 : _GEN_175;
  wire  _GEN_177 = 7'h2f == auto_in_a_bits_source ? idStall_1 : _GEN_176;
  wire  _GEN_178 = 7'h30 == auto_in_a_bits_source ? idStall_2 : _GEN_177;
  wire  _GEN_179 = 7'h31 == auto_in_a_bits_source ? idStall_2 : _GEN_178;
  wire  _GEN_180 = 7'h32 == auto_in_a_bits_source ? idStall_2 : _GEN_179;
  wire  _GEN_181 = 7'h33 == auto_in_a_bits_source ? idStall_2 : _GEN_180;
  wire  _GEN_182 = 7'h34 == auto_in_a_bits_source ? idStall_2 : _GEN_181;
  wire  _GEN_183 = 7'h35 == auto_in_a_bits_source ? idStall_2 : _GEN_182;
  wire  _GEN_184 = 7'h36 == auto_in_a_bits_source ? idStall_2 : _GEN_183;
  wire  _GEN_185 = 7'h37 == auto_in_a_bits_source ? idStall_2 : _GEN_184;
  wire  _GEN_186 = 7'h38 == auto_in_a_bits_source ? idStall_2 : _GEN_185;
  wire  _GEN_187 = 7'h39 == auto_in_a_bits_source ? idStall_2 : _GEN_186;
  wire  _GEN_188 = 7'h3a == auto_in_a_bits_source ? idStall_2 : _GEN_187;
  wire  _GEN_189 = 7'h3b == auto_in_a_bits_source ? idStall_2 : _GEN_188;
  wire  _GEN_190 = 7'h3c == auto_in_a_bits_source ? idStall_2 : _GEN_189;
  wire  _GEN_191 = 7'h3d == auto_in_a_bits_source ? idStall_2 : _GEN_190;
  wire  _GEN_192 = 7'h3e == auto_in_a_bits_source ? idStall_2 : _GEN_191;
  wire  _GEN_193 = 7'h3f == auto_in_a_bits_source ? idStall_2 : _GEN_192;
  wire  _GEN_194 = 7'h40 == auto_in_a_bits_source ? idStall_3 : _GEN_193;
  wire  _GEN_195 = 7'h41 == auto_in_a_bits_source ? idStall_3 : _GEN_194;
  wire  _GEN_196 = 7'h42 == auto_in_a_bits_source ? idStall_3 : _GEN_195;
  wire  _GEN_197 = 7'h43 == auto_in_a_bits_source ? idStall_3 : _GEN_196;
  wire  _GEN_198 = 7'h44 == auto_in_a_bits_source ? idStall_3 : _GEN_197;
  wire  _GEN_199 = 7'h45 == auto_in_a_bits_source ? idStall_3 : _GEN_198;
  wire  _GEN_200 = 7'h46 == auto_in_a_bits_source ? idStall_3 : _GEN_199;
  wire  _GEN_201 = 7'h47 == auto_in_a_bits_source ? idStall_3 : _GEN_200;
  wire  _GEN_202 = 7'h48 == auto_in_a_bits_source ? idStall_3 : _GEN_201;
  wire  _GEN_203 = 7'h49 == auto_in_a_bits_source ? idStall_3 : _GEN_202;
  wire  _GEN_204 = 7'h4a == auto_in_a_bits_source ? idStall_3 : _GEN_203;
  wire  _GEN_205 = 7'h4b == auto_in_a_bits_source ? idStall_3 : _GEN_204;
  wire  _GEN_206 = 7'h4c == auto_in_a_bits_source ? idStall_3 : _GEN_205;
  wire  _GEN_207 = 7'h4d == auto_in_a_bits_source ? idStall_3 : _GEN_206;
  wire  _GEN_208 = 7'h4e == auto_in_a_bits_source ? idStall_3 : _GEN_207;
  wire  _GEN_209 = 7'h4f == auto_in_a_bits_source ? idStall_3 : _GEN_208;
  wire  _GEN_210 = 7'h50 == auto_in_a_bits_source ? idStall_4 : _GEN_209;
  wire  _GEN_211 = 7'h51 == auto_in_a_bits_source ? idStall_4 : _GEN_210;
  wire  _GEN_212 = 7'h52 == auto_in_a_bits_source ? idStall_4 : _GEN_211;
  wire  _GEN_213 = 7'h53 == auto_in_a_bits_source ? idStall_4 : _GEN_212;
  wire  _GEN_214 = 7'h54 == auto_in_a_bits_source ? idStall_4 : _GEN_213;
  wire  _GEN_215 = 7'h55 == auto_in_a_bits_source ? idStall_4 : _GEN_214;
  wire  _GEN_216 = 7'h56 == auto_in_a_bits_source ? idStall_4 : _GEN_215;
  wire  _GEN_217 = 7'h57 == auto_in_a_bits_source ? idStall_4 : _GEN_216;
  wire  _GEN_218 = 7'h58 == auto_in_a_bits_source ? idStall_4 : _GEN_217;
  wire  _GEN_219 = 7'h59 == auto_in_a_bits_source ? idStall_4 : _GEN_218;
  wire  _GEN_220 = 7'h5a == auto_in_a_bits_source ? idStall_4 : _GEN_219;
  wire  _GEN_221 = 7'h5b == auto_in_a_bits_source ? idStall_4 : _GEN_220;
  wire  _GEN_222 = 7'h5c == auto_in_a_bits_source ? idStall_4 : _GEN_221;
  wire  _GEN_223 = 7'h5d == auto_in_a_bits_source ? idStall_4 : _GEN_222;
  wire  _GEN_224 = 7'h5e == auto_in_a_bits_source ? idStall_4 : _GEN_223;
  wire  _GEN_225 = 7'h5f == auto_in_a_bits_source ? idStall_4 : _GEN_224;
  wire  _GEN_226 = 7'h60 == auto_in_a_bits_source ? idStall_5 : _GEN_225;
  wire  _GEN_227 = 7'h61 == auto_in_a_bits_source ? idStall_5 : _GEN_226;
  wire  _GEN_228 = 7'h62 == auto_in_a_bits_source ? idStall_5 : _GEN_227;
  wire  _GEN_229 = 7'h63 == auto_in_a_bits_source ? idStall_5 : _GEN_228;
  wire  _GEN_230 = 7'h64 == auto_in_a_bits_source ? idStall_5 : _GEN_229;
  wire  _GEN_231 = 7'h65 == auto_in_a_bits_source ? idStall_5 : _GEN_230;
  wire  _GEN_232 = 7'h66 == auto_in_a_bits_source ? idStall_5 : _GEN_231;
  wire  _GEN_233 = 7'h67 == auto_in_a_bits_source ? idStall_5 : _GEN_232;
  wire  _GEN_234 = 7'h68 == auto_in_a_bits_source ? idStall_5 : _GEN_233;
  wire  _GEN_235 = 7'h69 == auto_in_a_bits_source ? idStall_5 : _GEN_234;
  wire  _GEN_236 = 7'h6a == auto_in_a_bits_source ? idStall_5 : _GEN_235;
  wire  _GEN_237 = 7'h6b == auto_in_a_bits_source ? idStall_5 : _GEN_236;
  wire  _GEN_238 = 7'h6c == auto_in_a_bits_source ? idStall_5 : _GEN_237;
  wire  _GEN_239 = 7'h6d == auto_in_a_bits_source ? idStall_5 : _GEN_238;
  wire  _GEN_240 = 7'h6e == auto_in_a_bits_source ? idStall_5 : _GEN_239;
  wire  _GEN_241 = 7'h6f == auto_in_a_bits_source ? idStall_5 : _GEN_240;
  wire  _GEN_242 = 7'h70 == auto_in_a_bits_source ? idStall_6 : _GEN_241;
  wire  _GEN_243 = 7'h71 == auto_in_a_bits_source ? idStall_6 : _GEN_242;
  wire  _GEN_244 = 7'h72 == auto_in_a_bits_source ? idStall_6 : _GEN_243;
  wire  _GEN_245 = 7'h73 == auto_in_a_bits_source ? idStall_6 : _GEN_244;
  wire  _GEN_246 = 7'h74 == auto_in_a_bits_source ? idStall_6 : _GEN_245;
  wire  _GEN_247 = 7'h75 == auto_in_a_bits_source ? idStall_6 : _GEN_246;
  wire  _GEN_248 = 7'h76 == auto_in_a_bits_source ? idStall_6 : _GEN_247;
  wire  _GEN_249 = 7'h77 == auto_in_a_bits_source ? idStall_6 : _GEN_248;
  wire  _GEN_250 = 7'h78 == auto_in_a_bits_source ? idStall_6 : _GEN_249;
  wire  _GEN_251 = 7'h79 == auto_in_a_bits_source ? idStall_6 : _GEN_250;
  wire  _GEN_252 = 7'h7a == auto_in_a_bits_source ? idStall_6 : _GEN_251;
  wire  _GEN_253 = 7'h7b == auto_in_a_bits_source ? idStall_6 : _GEN_252;
  wire  _GEN_254 = 7'h7c == auto_in_a_bits_source ? idStall_6 : _GEN_253;
  wire  _GEN_255 = 7'h7d == auto_in_a_bits_source ? idStall_6 : _GEN_254;
  wire  _GEN_256 = 7'h7e == auto_in_a_bits_source ? idStall_6 : _GEN_255;
  wire  _GEN_257 = 7'h7f == auto_in_a_bits_source ? idStall_6 : _GEN_256;
  reg [2:0] counter;
  wire  a_first = counter == 3'h0;
  wire  stall = _GEN_257 & a_first;
  wire  _bundleIn_0_a_ready_T = ~stall;
  reg  doneAW;
  wire  out_arw_ready = queue_arw_deq_io_enq_ready;
  wire  _bundleIn_0_a_ready_T_1 = doneAW | out_arw_ready;
  wire  out_wready = deq_io_enq_ready;
  wire  _bundleIn_0_a_ready_T_3 = a_isPut ? (doneAW | out_arw_ready) & out_wready : out_arw_ready;
  wire  bundleIn_0_a_ready = ~stall & _bundleIn_0_a_ready_T_3;
  wire  _T = bundleIn_0_a_ready & auto_in_a_valid;
  wire [12:0] _beats1_decode_T_1 = 13'h3f << auto_in_a_bits_size;
  wire [5:0] _beats1_decode_T_3 = ~_beats1_decode_T_1[5:0];
  wire [2:0] beats1_decode = _beats1_decode_T_3[5:3];
  wire [2:0] beats1 = a_isPut ? beats1_decode : 3'h0;
  wire [2:0] counter1 = counter - 3'h1;
  wire  a_last = counter == 3'h1 | beats1 == 3'h0;
  wire  queue_arw_bits_wen = queue_arw_deq_io_deq_bits_wen;
  wire  queue_arw_valid = queue_arw_deq_io_deq_valid;
  wire [4:0] _GEN_3 = 7'h1 == auto_in_a_bits_source ? 5'h8 : 5'h7;
  wire [4:0] _GEN_4 = 7'h2 == auto_in_a_bits_source ? 5'h9 : _GEN_3;
  wire [4:0] _GEN_5 = 7'h3 == auto_in_a_bits_source ? 5'ha : _GEN_4;
  wire [4:0] _GEN_6 = 7'h4 == auto_in_a_bits_source ? 5'hb : _GEN_5;
  wire [4:0] _GEN_7 = 7'h5 == auto_in_a_bits_source ? 5'hc : _GEN_6;
  wire [4:0] _GEN_8 = 7'h6 == auto_in_a_bits_source ? 5'hd : _GEN_7;
  wire [4:0] _GEN_9 = 7'h7 == auto_in_a_bits_source ? 5'he : _GEN_8;
  wire [4:0] _GEN_10 = 7'h8 == auto_in_a_bits_source ? 5'hf : _GEN_9;
  wire [4:0] _GEN_11 = 7'h9 == auto_in_a_bits_source ? 5'h10 : _GEN_10;
  wire [4:0] _GEN_12 = 7'ha == auto_in_a_bits_source ? 5'h11 : _GEN_11;
  wire [4:0] _GEN_13 = 7'hb == auto_in_a_bits_source ? 5'h12 : _GEN_12;
  wire [4:0] _GEN_14 = 7'hc == auto_in_a_bits_source ? 5'h13 : _GEN_13;
  wire [4:0] _GEN_15 = 7'hd == auto_in_a_bits_source ? 5'h14 : _GEN_14;
  wire [4:0] _GEN_16 = 7'he == auto_in_a_bits_source ? 5'h15 : _GEN_15;
  wire [4:0] _GEN_17 = 7'hf == auto_in_a_bits_source ? 5'h16 : _GEN_16;
  wire [4:0] _GEN_18 = 7'h10 == auto_in_a_bits_source ? 5'h0 : _GEN_17;
  wire [4:0] _GEN_19 = 7'h11 == auto_in_a_bits_source ? 5'h0 : _GEN_18;
  wire [4:0] _GEN_20 = 7'h12 == auto_in_a_bits_source ? 5'h0 : _GEN_19;
  wire [4:0] _GEN_21 = 7'h13 == auto_in_a_bits_source ? 5'h0 : _GEN_20;
  wire [4:0] _GEN_22 = 7'h14 == auto_in_a_bits_source ? 5'h0 : _GEN_21;
  wire [4:0] _GEN_23 = 7'h15 == auto_in_a_bits_source ? 5'h0 : _GEN_22;
  wire [4:0] _GEN_24 = 7'h16 == auto_in_a_bits_source ? 5'h0 : _GEN_23;
  wire [4:0] _GEN_25 = 7'h17 == auto_in_a_bits_source ? 5'h0 : _GEN_24;
  wire [4:0] _GEN_26 = 7'h18 == auto_in_a_bits_source ? 5'h0 : _GEN_25;
  wire [4:0] _GEN_27 = 7'h19 == auto_in_a_bits_source ? 5'h0 : _GEN_26;
  wire [4:0] _GEN_28 = 7'h1a == auto_in_a_bits_source ? 5'h0 : _GEN_27;
  wire [4:0] _GEN_29 = 7'h1b == auto_in_a_bits_source ? 5'h0 : _GEN_28;
  wire [4:0] _GEN_30 = 7'h1c == auto_in_a_bits_source ? 5'h0 : _GEN_29;
  wire [4:0] _GEN_31 = 7'h1d == auto_in_a_bits_source ? 5'h0 : _GEN_30;
  wire [4:0] _GEN_32 = 7'h1e == auto_in_a_bits_source ? 5'h0 : _GEN_31;
  wire [4:0] _GEN_33 = 7'h1f == auto_in_a_bits_source ? 5'h0 : _GEN_32;
  wire [4:0] _GEN_34 = 7'h20 == auto_in_a_bits_source ? 5'h1 : _GEN_33;
  wire [4:0] _GEN_35 = 7'h21 == auto_in_a_bits_source ? 5'h1 : _GEN_34;
  wire [4:0] _GEN_36 = 7'h22 == auto_in_a_bits_source ? 5'h1 : _GEN_35;
  wire [4:0] _GEN_37 = 7'h23 == auto_in_a_bits_source ? 5'h1 : _GEN_36;
  wire [4:0] _GEN_38 = 7'h24 == auto_in_a_bits_source ? 5'h1 : _GEN_37;
  wire [4:0] _GEN_39 = 7'h25 == auto_in_a_bits_source ? 5'h1 : _GEN_38;
  wire [4:0] _GEN_40 = 7'h26 == auto_in_a_bits_source ? 5'h1 : _GEN_39;
  wire [4:0] _GEN_41 = 7'h27 == auto_in_a_bits_source ? 5'h1 : _GEN_40;
  wire [4:0] _GEN_42 = 7'h28 == auto_in_a_bits_source ? 5'h1 : _GEN_41;
  wire [4:0] _GEN_43 = 7'h29 == auto_in_a_bits_source ? 5'h1 : _GEN_42;
  wire [4:0] _GEN_44 = 7'h2a == auto_in_a_bits_source ? 5'h1 : _GEN_43;
  wire [4:0] _GEN_45 = 7'h2b == auto_in_a_bits_source ? 5'h1 : _GEN_44;
  wire [4:0] _GEN_46 = 7'h2c == auto_in_a_bits_source ? 5'h1 : _GEN_45;
  wire [4:0] _GEN_47 = 7'h2d == auto_in_a_bits_source ? 5'h1 : _GEN_46;
  wire [4:0] _GEN_48 = 7'h2e == auto_in_a_bits_source ? 5'h1 : _GEN_47;
  wire [4:0] _GEN_49 = 7'h2f == auto_in_a_bits_source ? 5'h1 : _GEN_48;
  wire [4:0] _GEN_50 = 7'h30 == auto_in_a_bits_source ? 5'h2 : _GEN_49;
  wire [4:0] _GEN_51 = 7'h31 == auto_in_a_bits_source ? 5'h2 : _GEN_50;
  wire [4:0] _GEN_52 = 7'h32 == auto_in_a_bits_source ? 5'h2 : _GEN_51;
  wire [4:0] _GEN_53 = 7'h33 == auto_in_a_bits_source ? 5'h2 : _GEN_52;
  wire [4:0] _GEN_54 = 7'h34 == auto_in_a_bits_source ? 5'h2 : _GEN_53;
  wire [4:0] _GEN_55 = 7'h35 == auto_in_a_bits_source ? 5'h2 : _GEN_54;
  wire [4:0] _GEN_56 = 7'h36 == auto_in_a_bits_source ? 5'h2 : _GEN_55;
  wire [4:0] _GEN_57 = 7'h37 == auto_in_a_bits_source ? 5'h2 : _GEN_56;
  wire [4:0] _GEN_58 = 7'h38 == auto_in_a_bits_source ? 5'h2 : _GEN_57;
  wire [4:0] _GEN_59 = 7'h39 == auto_in_a_bits_source ? 5'h2 : _GEN_58;
  wire [4:0] _GEN_60 = 7'h3a == auto_in_a_bits_source ? 5'h2 : _GEN_59;
  wire [4:0] _GEN_61 = 7'h3b == auto_in_a_bits_source ? 5'h2 : _GEN_60;
  wire [4:0] _GEN_62 = 7'h3c == auto_in_a_bits_source ? 5'h2 : _GEN_61;
  wire [4:0] _GEN_63 = 7'h3d == auto_in_a_bits_source ? 5'h2 : _GEN_62;
  wire [4:0] _GEN_64 = 7'h3e == auto_in_a_bits_source ? 5'h2 : _GEN_63;
  wire [4:0] _GEN_65 = 7'h3f == auto_in_a_bits_source ? 5'h2 : _GEN_64;
  wire [4:0] _GEN_66 = 7'h40 == auto_in_a_bits_source ? 5'h3 : _GEN_65;
  wire [4:0] _GEN_67 = 7'h41 == auto_in_a_bits_source ? 5'h3 : _GEN_66;
  wire [4:0] _GEN_68 = 7'h42 == auto_in_a_bits_source ? 5'h3 : _GEN_67;
  wire [4:0] _GEN_69 = 7'h43 == auto_in_a_bits_source ? 5'h3 : _GEN_68;
  wire [4:0] _GEN_70 = 7'h44 == auto_in_a_bits_source ? 5'h3 : _GEN_69;
  wire [4:0] _GEN_71 = 7'h45 == auto_in_a_bits_source ? 5'h3 : _GEN_70;
  wire [4:0] _GEN_72 = 7'h46 == auto_in_a_bits_source ? 5'h3 : _GEN_71;
  wire [4:0] _GEN_73 = 7'h47 == auto_in_a_bits_source ? 5'h3 : _GEN_72;
  wire [4:0] _GEN_74 = 7'h48 == auto_in_a_bits_source ? 5'h3 : _GEN_73;
  wire [4:0] _GEN_75 = 7'h49 == auto_in_a_bits_source ? 5'h3 : _GEN_74;
  wire [4:0] _GEN_76 = 7'h4a == auto_in_a_bits_source ? 5'h3 : _GEN_75;
  wire [4:0] _GEN_77 = 7'h4b == auto_in_a_bits_source ? 5'h3 : _GEN_76;
  wire [4:0] _GEN_78 = 7'h4c == auto_in_a_bits_source ? 5'h3 : _GEN_77;
  wire [4:0] _GEN_79 = 7'h4d == auto_in_a_bits_source ? 5'h3 : _GEN_78;
  wire [4:0] _GEN_80 = 7'h4e == auto_in_a_bits_source ? 5'h3 : _GEN_79;
  wire [4:0] _GEN_81 = 7'h4f == auto_in_a_bits_source ? 5'h3 : _GEN_80;
  wire [4:0] _GEN_82 = 7'h50 == auto_in_a_bits_source ? 5'h4 : _GEN_81;
  wire [4:0] _GEN_83 = 7'h51 == auto_in_a_bits_source ? 5'h4 : _GEN_82;
  wire [4:0] _GEN_84 = 7'h52 == auto_in_a_bits_source ? 5'h4 : _GEN_83;
  wire [4:0] _GEN_85 = 7'h53 == auto_in_a_bits_source ? 5'h4 : _GEN_84;
  wire [4:0] _GEN_86 = 7'h54 == auto_in_a_bits_source ? 5'h4 : _GEN_85;
  wire [4:0] _GEN_87 = 7'h55 == auto_in_a_bits_source ? 5'h4 : _GEN_86;
  wire [4:0] _GEN_88 = 7'h56 == auto_in_a_bits_source ? 5'h4 : _GEN_87;
  wire [4:0] _GEN_89 = 7'h57 == auto_in_a_bits_source ? 5'h4 : _GEN_88;
  wire [4:0] _GEN_90 = 7'h58 == auto_in_a_bits_source ? 5'h4 : _GEN_89;
  wire [4:0] _GEN_91 = 7'h59 == auto_in_a_bits_source ? 5'h4 : _GEN_90;
  wire [4:0] _GEN_92 = 7'h5a == auto_in_a_bits_source ? 5'h4 : _GEN_91;
  wire [4:0] _GEN_93 = 7'h5b == auto_in_a_bits_source ? 5'h4 : _GEN_92;
  wire [4:0] _GEN_94 = 7'h5c == auto_in_a_bits_source ? 5'h4 : _GEN_93;
  wire [4:0] _GEN_95 = 7'h5d == auto_in_a_bits_source ? 5'h4 : _GEN_94;
  wire [4:0] _GEN_96 = 7'h5e == auto_in_a_bits_source ? 5'h4 : _GEN_95;
  wire [4:0] _GEN_97 = 7'h5f == auto_in_a_bits_source ? 5'h4 : _GEN_96;
  wire [4:0] _GEN_98 = 7'h60 == auto_in_a_bits_source ? 5'h5 : _GEN_97;
  wire [4:0] _GEN_99 = 7'h61 == auto_in_a_bits_source ? 5'h5 : _GEN_98;
  wire [4:0] _GEN_100 = 7'h62 == auto_in_a_bits_source ? 5'h5 : _GEN_99;
  wire [4:0] _GEN_101 = 7'h63 == auto_in_a_bits_source ? 5'h5 : _GEN_100;
  wire [4:0] _GEN_102 = 7'h64 == auto_in_a_bits_source ? 5'h5 : _GEN_101;
  wire [4:0] _GEN_103 = 7'h65 == auto_in_a_bits_source ? 5'h5 : _GEN_102;
  wire [4:0] _GEN_104 = 7'h66 == auto_in_a_bits_source ? 5'h5 : _GEN_103;
  wire [4:0] _GEN_105 = 7'h67 == auto_in_a_bits_source ? 5'h5 : _GEN_104;
  wire [4:0] _GEN_106 = 7'h68 == auto_in_a_bits_source ? 5'h5 : _GEN_105;
  wire [4:0] _GEN_107 = 7'h69 == auto_in_a_bits_source ? 5'h5 : _GEN_106;
  wire [4:0] _GEN_108 = 7'h6a == auto_in_a_bits_source ? 5'h5 : _GEN_107;
  wire [4:0] _GEN_109 = 7'h6b == auto_in_a_bits_source ? 5'h5 : _GEN_108;
  wire [4:0] _GEN_110 = 7'h6c == auto_in_a_bits_source ? 5'h5 : _GEN_109;
  wire [4:0] _GEN_111 = 7'h6d == auto_in_a_bits_source ? 5'h5 : _GEN_110;
  wire [4:0] _GEN_112 = 7'h6e == auto_in_a_bits_source ? 5'h5 : _GEN_111;
  wire [4:0] _GEN_113 = 7'h6f == auto_in_a_bits_source ? 5'h5 : _GEN_112;
  wire [4:0] _GEN_114 = 7'h70 == auto_in_a_bits_source ? 5'h6 : _GEN_113;
  wire [4:0] _GEN_115 = 7'h71 == auto_in_a_bits_source ? 5'h6 : _GEN_114;
  wire [4:0] _GEN_116 = 7'h72 == auto_in_a_bits_source ? 5'h6 : _GEN_115;
  wire [4:0] _GEN_117 = 7'h73 == auto_in_a_bits_source ? 5'h6 : _GEN_116;
  wire [4:0] _GEN_118 = 7'h74 == auto_in_a_bits_source ? 5'h6 : _GEN_117;
  wire [4:0] _GEN_119 = 7'h75 == auto_in_a_bits_source ? 5'h6 : _GEN_118;
  wire [4:0] _GEN_120 = 7'h76 == auto_in_a_bits_source ? 5'h6 : _GEN_119;
  wire [4:0] _GEN_121 = 7'h77 == auto_in_a_bits_source ? 5'h6 : _GEN_120;
  wire [4:0] _GEN_122 = 7'h78 == auto_in_a_bits_source ? 5'h6 : _GEN_121;
  wire [4:0] _GEN_123 = 7'h79 == auto_in_a_bits_source ? 5'h6 : _GEN_122;
  wire [4:0] _GEN_124 = 7'h7a == auto_in_a_bits_source ? 5'h6 : _GEN_123;
  wire [4:0] _GEN_125 = 7'h7b == auto_in_a_bits_source ? 5'h6 : _GEN_124;
  wire [4:0] _GEN_126 = 7'h7c == auto_in_a_bits_source ? 5'h6 : _GEN_125;
  wire [4:0] _GEN_127 = 7'h7d == auto_in_a_bits_source ? 5'h6 : _GEN_126;
  wire [4:0] _GEN_128 = 7'h7e == auto_in_a_bits_source ? 5'h6 : _GEN_127;
  wire [4:0] out_arw_bits_id = 7'h7f == auto_in_a_bits_source ? 5'h6 : _GEN_128;
  wire [17:0] _out_arw_bits_len_T_1 = 18'h7ff << auto_in_a_bits_size;
  wire [10:0] _out_arw_bits_len_T_3 = ~_out_arw_bits_len_T_1[10:0];
  wire  _out_arw_valid_T_1 = _bundleIn_0_a_ready_T & auto_in_a_valid;
  wire  _out_arw_valid_T_4 = a_isPut ? ~doneAW & out_wready : 1'h1;
  wire  out_arw_valid = _bundleIn_0_a_ready_T & auto_in_a_valid & _out_arw_valid_T_4;
  reg  r_holds_d;
  reg [2:0] b_delay;
  wire  r_wins = auto_out_rvalid & b_delay != 3'h7 | r_holds_d;
  wire  bundleOut_0_rready = auto_in_d_ready & r_wins;
  wire  _T_2 = bundleOut_0_rready & auto_out_rvalid;
  wire  bundleOut_0_bready = auto_in_d_ready & ~r_wins;
  wire [2:0] _bdelay_T_1 = b_delay + 3'h1;
  wire  bundleIn_0_d_valid = r_wins ? auto_out_rvalid : auto_out_bvalid;
  reg  r_first;
  wire  _GEN_260 = _T_2 ? auto_out_rlast : r_first;
  wire  _rdenied_T = auto_out_rresp == 2'h3;
  reg  r_denied_r;
  wire  _GEN_261 = r_first ? _rdenied_T : r_denied_r;
  wire  r_corrupt = auto_out_rresp != 2'h0;
  wire  b_denied = auto_out_bresp != 2'h0;
  wire  r_d_corrupt = r_corrupt | _GEN_261;
  wire [2:0] r_d_size = auto_out_recho_tl_state_size[2:0];
  wire [2:0] b_d_size = auto_out_becho_tl_state_size[2:0];
  wire [31:0] _a_sel_T = 32'h1 << out_arw_bits_id;
  wire  a_sel_0 = _a_sel_T[0];
  wire  a_sel_1 = _a_sel_T[1];
  wire  a_sel_2 = _a_sel_T[2];
  wire  a_sel_3 = _a_sel_T[3];
  wire  a_sel_4 = _a_sel_T[4];
  wire  a_sel_5 = _a_sel_T[5];
  wire  a_sel_6 = _a_sel_T[6];
  wire  a_sel_7 = _a_sel_T[7];
  wire  a_sel_8 = _a_sel_T[8];
  wire  a_sel_9 = _a_sel_T[9];
  wire  a_sel_10 = _a_sel_T[10];
  wire  a_sel_11 = _a_sel_T[11];
  wire  a_sel_12 = _a_sel_T[12];
  wire  a_sel_13 = _a_sel_T[13];
  wire  a_sel_14 = _a_sel_T[14];
  wire  a_sel_15 = _a_sel_T[15];
  wire  a_sel_16 = _a_sel_T[16];
  wire  a_sel_17 = _a_sel_T[17];
  wire  a_sel_18 = _a_sel_T[18];
  wire  a_sel_19 = _a_sel_T[19];
  wire  a_sel_20 = _a_sel_T[20];
  wire  a_sel_21 = _a_sel_T[21];
  wire  a_sel_22 = _a_sel_T[22];
  wire [4:0] d_sel_shiftAmount = r_wins ? auto_out_rid : auto_out_bid;
  wire [31:0] _d_sel_T_1 = 32'h1 << d_sel_shiftAmount;
  wire  d_sel_0 = _d_sel_T_1[0];
  wire  d_sel_1 = _d_sel_T_1[1];
  wire  d_sel_2 = _d_sel_T_1[2];
  wire  d_sel_3 = _d_sel_T_1[3];
  wire  d_sel_4 = _d_sel_T_1[4];
  wire  d_sel_5 = _d_sel_T_1[5];
  wire  d_sel_6 = _d_sel_T_1[6];
  wire  d_sel_7 = _d_sel_T_1[7];
  wire  d_sel_8 = _d_sel_T_1[8];
  wire  d_sel_9 = _d_sel_T_1[9];
  wire  d_sel_10 = _d_sel_T_1[10];
  wire  d_sel_11 = _d_sel_T_1[11];
  wire  d_sel_12 = _d_sel_T_1[12];
  wire  d_sel_13 = _d_sel_T_1[13];
  wire  d_sel_14 = _d_sel_T_1[14];
  wire  d_sel_15 = _d_sel_T_1[15];
  wire  d_sel_16 = _d_sel_T_1[16];
  wire  d_sel_17 = _d_sel_T_1[17];
  wire  d_sel_18 = _d_sel_T_1[18];
  wire  d_sel_19 = _d_sel_T_1[19];
  wire  d_sel_20 = _d_sel_T_1[20];
  wire  d_sel_21 = _d_sel_T_1[21];
  wire  d_sel_22 = _d_sel_T_1[22];
  wire  d_last = r_wins ? auto_out_rlast : 1'h1;
  wire  _inc_T = out_arw_ready & out_arw_valid;
  wire  inc = a_sel_0 & _inc_T;
  wire  _dec_T_1 = auto_in_d_ready & bundleIn_0_d_valid;
  wire  dec = d_sel_0 & d_last & _dec_T_1;
  wire [4:0] _GEN_285 = {{4'd0}, inc};
  wire [4:0] _count_T_2 = count_1 + _GEN_285;
  wire [4:0] _GEN_286 = {{4'd0}, dec};
  wire [4:0] _count_T_4 = _count_T_2 - _GEN_286;
  wire  inc_1 = a_sel_1 & _inc_T;
  wire  dec_1 = d_sel_1 & d_last & _dec_T_1;
  wire [4:0] _GEN_287 = {{4'd0}, inc_1};
  wire [4:0] _count_T_6 = count_2 + _GEN_287;
  wire [4:0] _GEN_288 = {{4'd0}, dec_1};
  wire [4:0] _count_T_8 = _count_T_6 - _GEN_288;
  wire  inc_2 = a_sel_2 & _inc_T;
  wire  dec_2 = d_sel_2 & d_last & _dec_T_1;
  wire [4:0] _GEN_289 = {{4'd0}, inc_2};
  wire [4:0] _count_T_10 = count_3 + _GEN_289;
  wire [4:0] _GEN_290 = {{4'd0}, dec_2};
  wire [4:0] _count_T_12 = _count_T_10 - _GEN_290;
  wire  inc_3 = a_sel_3 & _inc_T;
  wire  dec_3 = d_sel_3 & d_last & _dec_T_1;
  wire [4:0] _GEN_291 = {{4'd0}, inc_3};
  wire [4:0] _count_T_14 = count_4 + _GEN_291;
  wire [4:0] _GEN_292 = {{4'd0}, dec_3};
  wire [4:0] _count_T_16 = _count_T_14 - _GEN_292;
  wire  inc_4 = a_sel_4 & _inc_T;
  wire  dec_4 = d_sel_4 & d_last & _dec_T_1;
  wire [4:0] _GEN_293 = {{4'd0}, inc_4};
  wire [4:0] _count_T_18 = count_5 + _GEN_293;
  wire [4:0] _GEN_294 = {{4'd0}, dec_4};
  wire [4:0] _count_T_20 = _count_T_18 - _GEN_294;
  wire  inc_5 = a_sel_5 & _inc_T;
  wire  dec_5 = d_sel_5 & d_last & _dec_T_1;
  wire [4:0] _GEN_295 = {{4'd0}, inc_5};
  wire [4:0] _count_T_22 = count_6 + _GEN_295;
  wire [4:0] _GEN_296 = {{4'd0}, dec_5};
  wire [4:0] _count_T_24 = _count_T_22 - _GEN_296;
  wire  inc_6 = a_sel_6 & _inc_T;
  wire  dec_6 = d_sel_6 & d_last & _dec_T_1;
  wire [4:0] _GEN_297 = {{4'd0}, inc_6};
  wire [4:0] _count_T_26 = count_7 + _GEN_297;
  wire [4:0] _GEN_298 = {{4'd0}, dec_6};
  wire [4:0] _count_T_28 = _count_T_26 - _GEN_298;
  wire  inc_7 = a_sel_7 & _inc_T;
  wire  dec_7 = d_sel_7 & d_last & _dec_T_1;
  wire  _count_T_30 = count_8 + inc_7;
  wire  inc_8 = a_sel_8 & _inc_T;
  wire  dec_8 = d_sel_8 & d_last & _dec_T_1;
  wire  _count_T_34 = count_9 + inc_8;
  wire  inc_9 = a_sel_9 & _inc_T;
  wire  dec_9 = d_sel_9 & d_last & _dec_T_1;
  wire  _count_T_38 = count_10 + inc_9;
  wire  inc_10 = a_sel_10 & _inc_T;
  wire  dec_10 = d_sel_10 & d_last & _dec_T_1;
  wire  _count_T_42 = count_11 + inc_10;
  wire  inc_11 = a_sel_11 & _inc_T;
  wire  dec_11 = d_sel_11 & d_last & _dec_T_1;
  wire  _count_T_46 = count_12 + inc_11;
  wire  inc_12 = a_sel_12 & _inc_T;
  wire  dec_12 = d_sel_12 & d_last & _dec_T_1;
  wire  _count_T_50 = count_13 + inc_12;
  wire  inc_13 = a_sel_13 & _inc_T;
  wire  dec_13 = d_sel_13 & d_last & _dec_T_1;
  wire  _count_T_54 = count_14 + inc_13;
  wire  inc_14 = a_sel_14 & _inc_T;
  wire  dec_14 = d_sel_14 & d_last & _dec_T_1;
  wire  _count_T_58 = count_15 + inc_14;
  wire  inc_15 = a_sel_15 & _inc_T;
  wire  dec_15 = d_sel_15 & d_last & _dec_T_1;
  wire  _count_T_62 = count_16 + inc_15;
  wire  inc_16 = a_sel_16 & _inc_T;
  wire  dec_16 = d_sel_16 & d_last & _dec_T_1;
  wire  _count_T_66 = count_17 + inc_16;
  wire  inc_17 = a_sel_17 & _inc_T;
  wire  dec_17 = d_sel_17 & d_last & _dec_T_1;
  wire  _count_T_70 = count_18 + inc_17;
  wire  inc_18 = a_sel_18 & _inc_T;
  wire  dec_18 = d_sel_18 & d_last & _dec_T_1;
  wire  _count_T_74 = count_19 + inc_18;
  wire  inc_19 = a_sel_19 & _inc_T;
  wire  dec_19 = d_sel_19 & d_last & _dec_T_1;
  wire  _count_T_78 = count_20 + inc_19;
  wire  inc_20 = a_sel_20 & _inc_T;
  wire  dec_20 = d_sel_20 & d_last & _dec_T_1;
  wire  _count_T_82 = count_21 + inc_20;
  wire  inc_21 = a_sel_21 & _inc_T;
  wire  dec_21 = d_sel_21 & d_last & _dec_T_1;
  wire  _count_T_86 = count_22 + inc_21;
  wire  inc_22 = a_sel_22 & _inc_T;
  wire  dec_22 = d_sel_22 & d_last & _dec_T_1;
  wire  _count_T_90 = count_23 + inc_22;
  CHIPLINK_PREFIX_Chiplink_TLMonitor_10 monitor (
    .clock(monitor_clock),
    .reset(monitor_reset),
    .io_in_a_ready(monitor_io_in_a_ready),
    .io_in_a_valid(monitor_io_in_a_valid),
    .io_in_a_bits_opcode(monitor_io_in_a_bits_opcode),
    .io_in_a_bits_param(monitor_io_in_a_bits_param),
    .io_in_a_bits_size(monitor_io_in_a_bits_size),
    .io_in_a_bits_source(monitor_io_in_a_bits_source),
    .io_in_a_bits_address(monitor_io_in_a_bits_address),
    .io_in_a_bits_mask(monitor_io_in_a_bits_mask),
    .io_in_a_bits_corrupt(monitor_io_in_a_bits_corrupt),
    .io_in_d_ready(monitor_io_in_d_ready),
    .io_in_d_valid(monitor_io_in_d_valid),
    .io_in_d_bits_opcode(monitor_io_in_d_bits_opcode),
    .io_in_d_bits_size(monitor_io_in_d_bits_size),
    .io_in_d_bits_source(monitor_io_in_d_bits_source),
    .io_in_d_bits_denied(monitor_io_in_d_bits_denied),
    .io_in_d_bits_corrupt(monitor_io_in_d_bits_corrupt)
  );
  CHIPLINK_PREFIX_Queue_15 deq (
    .clock(deq_clock),
    .reset(deq_reset),
    .io_enq_ready(deq_io_enq_ready),
    .io_enq_valid(deq_io_enq_valid),
    .io_enq_bits_data(deq_io_enq_bits_data),
    .io_enq_bits_strb(deq_io_enq_bits_strb),
    .io_enq_bits_last(deq_io_enq_bits_last),
    .io_deq_ready(deq_io_deq_ready),
    .io_deq_valid(deq_io_deq_valid),
    .io_deq_bits_data(deq_io_deq_bits_data),
    .io_deq_bits_strb(deq_io_deq_bits_strb),
    .io_deq_bits_last(deq_io_deq_bits_last)
  );
  CHIPLINK_PREFIX_Queue_17 queue_arw_deq (
    .clock(queue_arw_deq_clock),
    .reset(queue_arw_deq_reset),
    .io_enq_ready(queue_arw_deq_io_enq_ready),
    .io_enq_valid(queue_arw_deq_io_enq_valid),
    .io_enq_bits_id(queue_arw_deq_io_enq_bits_id),
    .io_enq_bits_addr(queue_arw_deq_io_enq_bits_addr),
    .io_enq_bits_len(queue_arw_deq_io_enq_bits_len),
    .io_enq_bits_size(queue_arw_deq_io_enq_bits_size),
    .io_enq_bits_echo_tl_state_size(queue_arw_deq_io_enq_bits_echo_tl_state_size),
    .io_enq_bits_echo_tl_state_source(queue_arw_deq_io_enq_bits_echo_tl_state_source),
    .io_enq_bits_wen(queue_arw_deq_io_enq_bits_wen),
    .io_deq_ready(queue_arw_deq_io_deq_ready),
    .io_deq_valid(queue_arw_deq_io_deq_valid),
    .io_deq_bits_id(queue_arw_deq_io_deq_bits_id),
    .io_deq_bits_addr(queue_arw_deq_io_deq_bits_addr),
    .io_deq_bits_len(queue_arw_deq_io_deq_bits_len),
    .io_deq_bits_size(queue_arw_deq_io_deq_bits_size),
    .io_deq_bits_burst(queue_arw_deq_io_deq_bits_burst),
    .io_deq_bits_echo_tl_state_size(queue_arw_deq_io_deq_bits_echo_tl_state_size),
    .io_deq_bits_echo_tl_state_source(queue_arw_deq_io_deq_bits_echo_tl_state_source),
    .io_deq_bits_wen(queue_arw_deq_io_deq_bits_wen)
  );
  assign auto_in_a_ready = ~stall & _bundleIn_0_a_ready_T_3;
  assign auto_in_d_valid = r_wins ? auto_out_rvalid : auto_out_bvalid;
  assign auto_in_d_bits_opcode = r_wins ? 3'h1 : 3'h0;
  assign auto_in_d_bits_size = r_wins ? r_d_size : b_d_size;
  assign auto_in_d_bits_source = r_wins ? auto_out_recho_tl_state_source : auto_out_becho_tl_state_source;
  assign auto_in_d_bits_denied = r_wins ? _GEN_261 : b_denied;
  assign auto_in_d_bits_data = auto_out_rdata;
  assign auto_in_d_bits_corrupt = r_wins & r_d_corrupt;
  assign auto_out_awvalid = queue_arw_valid & queue_arw_bits_wen;
  assign auto_out_awid = queue_arw_deq_io_deq_bits_id;
  assign auto_out_awaddr = queue_arw_deq_io_deq_bits_addr;
  assign auto_out_awlen = queue_arw_deq_io_deq_bits_len;
  assign auto_out_awsize = queue_arw_deq_io_deq_bits_size;
  assign auto_out_awburst = queue_arw_deq_io_deq_bits_burst;
  assign auto_out_awecho_tl_state_size = queue_arw_deq_io_deq_bits_echo_tl_state_size;
  assign auto_out_awecho_tl_state_source = queue_arw_deq_io_deq_bits_echo_tl_state_source;
  assign auto_out_wvalid = deq_io_deq_valid;
  assign auto_out_wdata = deq_io_deq_bits_data;
  assign auto_out_wstrb = deq_io_deq_bits_strb;
  assign auto_out_wlast = deq_io_deq_bits_last;
  assign auto_out_bready = auto_in_d_ready & ~r_wins;
  assign auto_out_arvalid = queue_arw_valid & ~queue_arw_bits_wen;
  assign auto_out_arid = queue_arw_deq_io_deq_bits_id;
  assign auto_out_araddr = queue_arw_deq_io_deq_bits_addr;
  assign auto_out_arlen = queue_arw_deq_io_deq_bits_len;
  assign auto_out_arsize = queue_arw_deq_io_deq_bits_size;
  assign auto_out_arburst = queue_arw_deq_io_deq_bits_burst;
  assign auto_out_arecho_tl_state_size = queue_arw_deq_io_deq_bits_echo_tl_state_size;
  assign auto_out_arecho_tl_state_source = queue_arw_deq_io_deq_bits_echo_tl_state_source;
  assign auto_out_rready = auto_in_d_ready & r_wins;
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = ~stall & _bundleIn_0_a_ready_T_3;
  assign monitor_io_in_a_valid = auto_in_a_valid;
  assign monitor_io_in_a_bits_opcode = auto_in_a_bits_opcode;
  assign monitor_io_in_a_bits_param = auto_in_a_bits_param;
  assign monitor_io_in_a_bits_size = auto_in_a_bits_size;
  assign monitor_io_in_a_bits_source = auto_in_a_bits_source;
  assign monitor_io_in_a_bits_address = auto_in_a_bits_address;
  assign monitor_io_in_a_bits_mask = auto_in_a_bits_mask;
  assign monitor_io_in_a_bits_corrupt = auto_in_a_bits_corrupt;
  assign monitor_io_in_d_ready = auto_in_d_ready;
  assign monitor_io_in_d_valid = r_wins ? auto_out_rvalid : auto_out_bvalid;
  assign monitor_io_in_d_bits_opcode = r_wins ? 3'h1 : 3'h0;
  assign monitor_io_in_d_bits_size = r_wins ? r_d_size : b_d_size;
  assign monitor_io_in_d_bits_source = r_wins ? auto_out_recho_tl_state_source :
    auto_out_becho_tl_state_source;
  assign monitor_io_in_d_bits_denied = r_wins ? _GEN_261 : b_denied;
  assign monitor_io_in_d_bits_corrupt = r_wins & r_d_corrupt;
  assign deq_clock = clock;
  assign deq_reset = reset;
  assign deq_io_enq_valid = _out_arw_valid_T_1 & a_isPut & _bundleIn_0_a_ready_T_1;
  assign deq_io_enq_bits_data = auto_in_a_bits_data;
  assign deq_io_enq_bits_strb = auto_in_a_bits_mask;
  assign deq_io_enq_bits_last = counter == 3'h1 | beats1 == 3'h0;
  assign deq_io_deq_ready = auto_out_wready;
  assign queue_arw_deq_clock = clock;
  assign queue_arw_deq_reset = reset;
  assign queue_arw_deq_io_enq_valid = _bundleIn_0_a_ready_T & auto_in_a_valid & _out_arw_valid_T_4;
  assign queue_arw_deq_io_enq_bits_id = 7'h7f == auto_in_a_bits_source ? 5'h6 : _GEN_128;
  assign queue_arw_deq_io_enq_bits_addr = auto_in_a_bits_address;
  assign queue_arw_deq_io_enq_bits_len = _out_arw_bits_len_T_3[10:3];
  assign queue_arw_deq_io_enq_bits_size = auto_in_a_bits_size >= 3'h3 ? 3'h3 : auto_in_a_bits_size;
  assign queue_arw_deq_io_enq_bits_echo_tl_state_size = {{1'd0}, auto_in_a_bits_size};
  assign queue_arw_deq_io_enq_bits_echo_tl_state_source = auto_in_a_bits_source;
  assign queue_arw_deq_io_enq_bits_wen = ~auto_in_a_bits_opcode[2];
  assign queue_arw_deq_io_deq_ready = queue_arw_bits_wen ? auto_out_awready : auto_out_arready;
  always @(posedge clock) begin
    if (reset) begin
      count_7 <= 5'h0;
    end else begin
      count_7 <= _count_T_28;
    end
    if (inc_6) begin
      write_6 <= a_isPut;
    end
    if (reset) begin
      count_6 <= 5'h0;
    end else begin
      count_6 <= _count_T_24;
    end
    if (inc_5) begin
      write_5 <= a_isPut;
    end
    if (reset) begin
      count_5 <= 5'h0;
    end else begin
      count_5 <= _count_T_20;
    end
    if (inc_4) begin
      write_4 <= a_isPut;
    end
    if (reset) begin
      count_4 <= 5'h0;
    end else begin
      count_4 <= _count_T_16;
    end
    if (inc_3) begin
      write_3 <= a_isPut;
    end
    if (reset) begin
      count_3 <= 5'h0;
    end else begin
      count_3 <= _count_T_12;
    end
    if (inc_2) begin
      write_2 <= a_isPut;
    end
    if (reset) begin
      count_2 <= 5'h0;
    end else begin
      count_2 <= _count_T_8;
    end
    if (inc_1) begin
      write_1 <= a_isPut;
    end
    if (reset) begin
      count_1 <= 5'h0;
    end else begin
      count_1 <= _count_T_4;
    end
    if (inc) begin
      write <= a_isPut;
    end
    if (reset) begin
      count_23 <= 1'h0;
    end else begin
      count_23 <= _count_T_90 - dec_22;
    end
    if (reset) begin
      count_22 <= 1'h0;
    end else begin
      count_22 <= _count_T_86 - dec_21;
    end
    if (reset) begin
      count_21 <= 1'h0;
    end else begin
      count_21 <= _count_T_82 - dec_20;
    end
    if (reset) begin
      count_20 <= 1'h0;
    end else begin
      count_20 <= _count_T_78 - dec_19;
    end
    if (reset) begin
      count_19 <= 1'h0;
    end else begin
      count_19 <= _count_T_74 - dec_18;
    end
    if (reset) begin
      count_18 <= 1'h0;
    end else begin
      count_18 <= _count_T_70 - dec_17;
    end
    if (reset) begin
      count_17 <= 1'h0;
    end else begin
      count_17 <= _count_T_66 - dec_16;
    end
    if (reset) begin
      count_16 <= 1'h0;
    end else begin
      count_16 <= _count_T_62 - dec_15;
    end
    if (reset) begin
      count_15 <= 1'h0;
    end else begin
      count_15 <= _count_T_58 - dec_14;
    end
    if (reset) begin
      count_14 <= 1'h0;
    end else begin
      count_14 <= _count_T_54 - dec_13;
    end
    if (reset) begin
      count_13 <= 1'h0;
    end else begin
      count_13 <= _count_T_50 - dec_12;
    end
    if (reset) begin
      count_12 <= 1'h0;
    end else begin
      count_12 <= _count_T_46 - dec_11;
    end
    if (reset) begin
      count_11 <= 1'h0;
    end else begin
      count_11 <= _count_T_42 - dec_10;
    end
    if (reset) begin
      count_10 <= 1'h0;
    end else begin
      count_10 <= _count_T_38 - dec_9;
    end
    if (reset) begin
      count_9 <= 1'h0;
    end else begin
      count_9 <= _count_T_34 - dec_8;
    end
    if (reset) begin
      count_8 <= 1'h0;
    end else begin
      count_8 <= _count_T_30 - dec_7;
    end
    if (reset) begin
      counter <= 3'h0;
    end else if (_T) begin
      if (a_first) begin
        if (a_isPut) begin
          counter <= beats1_decode;
        end else begin
          counter <= 3'h0;
        end
      end else begin
        counter <= counter1;
      end
    end
    if (reset) begin
      doneAW <= 1'h0;
    end else if (_T) begin
      doneAW <= ~a_last;
    end
    if (reset) begin
      r_holds_d <= 1'h0;
    end else if (_T_2) begin
      r_holds_d <= ~auto_out_rlast;
    end
    if (auto_out_bvalid & ~bundleOut_0_bready) begin
      b_delay <= _bdelay_T_1;
    end else begin
      b_delay <= 3'h0;
    end
    r_first <= reset | _GEN_260;
    if (r_first) begin
      r_denied_r <= _rdenied_T;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~dec | count_1 != 5'h0 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec | count_1 != 5'h0 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~inc | count_1 != 5'h10 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc | count_1 != 5'h10 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~dec_1 | count_2 != 5'h0 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_1 | count_2 != 5'h0 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~inc_1 | count_2 != 5'h10 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_1 | count_2 != 5'h10 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~dec_2 | count_3 != 5'h0 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_2 | count_3 != 5'h0 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~inc_2 | count_3 != 5'h10 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_2 | count_3 != 5'h10 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~dec_3 | count_4 != 5'h0 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_3 | count_4 != 5'h0 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~inc_3 | count_4 != 5'h10 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_3 | count_4 != 5'h10 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~dec_4 | count_5 != 5'h0 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_4 | count_5 != 5'h0 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~inc_4 | count_5 != 5'h10 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_4 | count_5 != 5'h10 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~dec_5 | count_6 != 5'h0 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_5 | count_6 != 5'h0 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~inc_5 | count_6 != 5'h10 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_5 | count_6 != 5'h10 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~dec_6 | count_7 != 5'h0 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_6 | count_7 != 5'h0 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~inc_6 | count_7 != 5'h10 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_6 | count_7 != 5'h10 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~dec_7 | count_8 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_7 | count_8 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~inc_7 | idle_7 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_7 | idle_7 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~dec_8 | count_9 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_8 | count_9 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~inc_8 | idle_8 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_8 | idle_8 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~dec_9 | count_10 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_9 | count_10 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~inc_9 | idle_9 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_9 | idle_9 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~dec_10 | count_11 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_10 | count_11 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~inc_10 | idle_10 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_10 | idle_10 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~dec_11 | count_12 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_11 | count_12 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~inc_11 | idle_11 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_11 | idle_11 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~dec_12 | count_13 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_12 | count_13 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~inc_12 | idle_12 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_12 | idle_12 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~dec_13 | count_14 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_13 | count_14 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~inc_13 | idle_13 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_13 | idle_13 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~dec_14 | count_15 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_14 | count_15 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~inc_14 | idle_14 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_14 | idle_14 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~dec_15 | count_16 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_15 | count_16 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~inc_15 | idle_15 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_15 | idle_15 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~dec_16 | count_17 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_16 | count_17 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~inc_16 | idle_16 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_16 | idle_16 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~dec_17 | count_18 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_17 | count_18 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~inc_17 | idle_17 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_17 | idle_17 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~dec_18 | count_19 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_18 | count_19 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~inc_18 | idle_18 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_18 | idle_18 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~dec_19 | count_20 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_19 | count_20 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~inc_19 | idle_19 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_19 | idle_19 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~dec_20 | count_21 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_20 | count_21 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~inc_20 | idle_20 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_20 | idle_20 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~dec_21 | count_22 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_21 | count_22 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~inc_21 | idle_21 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_21 | idle_21 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~dec_22 | count_23 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:262 assert (!dec || count =/= UInt(0))        // underflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~dec_22 | count_23 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~(~inc_22 | idle_22 | reset)) begin
          $fwrite(32'h80000002,
            "Assertion failed\n    at ToAXI4.scala:263 assert (!inc || count =/= UInt(maxCount)) // overflow\n");
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~(~inc_22 | idle_22 | reset)) begin
          $fatal;
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
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
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
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
  count_7 = _RAND_0[4:0];
  _RAND_1 = {1{`RANDOM}};
  write_6 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  count_6 = _RAND_2[4:0];
  _RAND_3 = {1{`RANDOM}};
  write_5 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  count_5 = _RAND_4[4:0];
  _RAND_5 = {1{`RANDOM}};
  write_4 = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  count_4 = _RAND_6[4:0];
  _RAND_7 = {1{`RANDOM}};
  write_3 = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  count_3 = _RAND_8[4:0];
  _RAND_9 = {1{`RANDOM}};
  write_2 = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  count_2 = _RAND_10[4:0];
  _RAND_11 = {1{`RANDOM}};
  write_1 = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  count_1 = _RAND_12[4:0];
  _RAND_13 = {1{`RANDOM}};
  write = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  count_23 = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  count_22 = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  count_21 = _RAND_16[0:0];
  _RAND_17 = {1{`RANDOM}};
  count_20 = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  count_19 = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  count_18 = _RAND_19[0:0];
  _RAND_20 = {1{`RANDOM}};
  count_17 = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  count_16 = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  count_15 = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  count_14 = _RAND_23[0:0];
  _RAND_24 = {1{`RANDOM}};
  count_13 = _RAND_24[0:0];
  _RAND_25 = {1{`RANDOM}};
  count_12 = _RAND_25[0:0];
  _RAND_26 = {1{`RANDOM}};
  count_11 = _RAND_26[0:0];
  _RAND_27 = {1{`RANDOM}};
  count_10 = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  count_9 = _RAND_28[0:0];
  _RAND_29 = {1{`RANDOM}};
  count_8 = _RAND_29[0:0];
  _RAND_30 = {1{`RANDOM}};
  counter = _RAND_30[2:0];
  _RAND_31 = {1{`RANDOM}};
  doneAW = _RAND_31[0:0];
  _RAND_32 = {1{`RANDOM}};
  r_holds_d = _RAND_32[0:0];
  _RAND_33 = {1{`RANDOM}};
  b_delay = _RAND_33[2:0];
  _RAND_34 = {1{`RANDOM}};
  r_first = _RAND_34[0:0];
  _RAND_35 = {1{`RANDOM}};
  r_denied_r = _RAND_35[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule