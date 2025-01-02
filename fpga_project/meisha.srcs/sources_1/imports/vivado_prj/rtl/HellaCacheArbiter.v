module HellaCacheArbiter( 
  input         clock, 
  output        io_requestor_0_req_ready, 
  input         io_requestor_0_req_valid, 
  input  [39:0] io_requestor_0_req_bits_addr, 
  input  [6:0]  io_requestor_0_req_bits_tag, 
  input  [4:0]  io_requestor_0_req_bits_cmd, 
  input  [2:0]  io_requestor_0_req_bits_typ, 
  input         io_requestor_0_req_bits_phys, 
  input         io_requestor_0_s1_kill, 
  input  [63:0] io_requestor_0_s1_data_data, 
  input  [7:0]  io_requestor_0_s1_data_mask, 
  output        io_requestor_0_s2_nack, 
  input         io_requestor_0_s2_kill, 
  output        io_requestor_0_resp_valid, 
  output [63:0] io_requestor_0_resp_bits_data_word_bypass, 
  output        io_requestor_0_s2_xcpt_ae_ld, 
  input         io_requestor_0_keep_clock_enabled, 
  output        io_requestor_1_req_ready, 
  input         io_requestor_1_req_valid, 
  input  [39:0] io_requestor_1_req_bits_addr, 
  input  [6:0]  io_requestor_1_req_bits_tag, 
  input  [4:0]  io_requestor_1_req_bits_cmd, 
  input  [2:0]  io_requestor_1_req_bits_typ, 
  input         io_requestor_1_req_bits_phys, 
  input         io_requestor_1_s1_kill, 
  input  [63:0] io_requestor_1_s1_data_data, 
  input  [7:0]  io_requestor_1_s1_data_mask, 
  output        io_requestor_1_s2_nack, 
  input         io_requestor_1_s2_kill, 
  output        io_requestor_1_resp_valid, 
  output [6:0]  io_requestor_1_resp_bits_tag, 
  output [2:0]  io_requestor_1_resp_bits_typ, 
  output [63:0] io_requestor_1_resp_bits_data, 
  output        io_requestor_1_resp_bits_replay, 
  output        io_requestor_1_resp_bits_has_data, 
  output [63:0] io_requestor_1_resp_bits_data_word_bypass, 
  output        io_requestor_1_replay_next, 
  output        io_requestor_1_s2_xcpt_ma_ld, 
  output        io_requestor_1_s2_xcpt_ma_st, 
  output        io_requestor_1_s2_xcpt_pf_ld, 
  output        io_requestor_1_s2_xcpt_pf_st, 
  output        io_requestor_1_s2_xcpt_ae_ld, 
  output        io_requestor_1_s2_xcpt_ae_st, 
  output        io_requestor_1_ordered, 
  output        io_requestor_1_perf_grant, 
  input         io_requestor_1_keep_clock_enabled, 
  output        io_requestor_1_clock_enabled, 
  input         io_mem_req_ready, 
  output        io_mem_req_valid, 
  output [39:0] io_mem_req_bits_addr, 
  output [6:0]  io_mem_req_bits_tag, 
  output [4:0]  io_mem_req_bits_cmd, 
  output [2:0]  io_mem_req_bits_typ, 
  output        io_mem_req_bits_phys, 
  output        io_mem_s1_kill, 
  output [63:0] io_mem_s1_data_data, 
  output [7:0]  io_mem_s1_data_mask, 
  input         io_mem_s2_nack, 
  output        io_mem_s2_kill, 
  input         io_mem_resp_valid, 
  input  [6:0]  io_mem_resp_bits_tag, 
  input  [2:0]  io_mem_resp_bits_typ, 
  input  [63:0] io_mem_resp_bits_data, 
  input         io_mem_resp_bits_replay, 
  input         io_mem_resp_bits_has_data, 
  input  [63:0] io_mem_resp_bits_data_word_bypass, 
  input         io_mem_replay_next, 
  input         io_mem_s2_xcpt_ma_ld, 
  input         io_mem_s2_xcpt_ma_st, 
  input         io_mem_s2_xcpt_pf_ld, 
  input         io_mem_s2_xcpt_pf_st, 
  input         io_mem_s2_xcpt_ae_ld, 
  input         io_mem_s2_xcpt_ae_st, 
  input         io_mem_ordered, 
  input         io_mem_perf_grant, 
  output        io_mem_keep_clock_enabled, 
  input         io_mem_clock_enabled 
);
  reg  _T_210; 
  reg [31:0] _RAND_0;
  reg  _T_212; 
  reg [31:0] _RAND_1;
  wire  _T_215; 
  wire [7:0] _T_217; 
  wire [7:0] _T_218; 
  wire [7:0] _GEN_4; 
  wire  _T_219; 
  wire  _T_220; 
  wire  _T_221; 
  wire  _T_222; 
  wire [5:0] _T_226; 
  assign _T_215 = io_requestor_0_req_valid == 1'h0; 
  assign _T_217 = {io_requestor_1_req_bits_tag,1'h1}; 
  assign _T_218 = {io_requestor_0_req_bits_tag,1'h0}; 
  assign _GEN_4 = io_requestor_0_req_valid ? _T_218 : _T_217; 
  assign _T_219 = _T_210 == 1'h0; 
  assign _T_220 = _T_212 == 1'h0; 
  assign _T_221 = io_mem_resp_bits_tag[0]; 
  assign _T_222 = _T_221 == 1'h0; 
  assign _T_226 = io_mem_resp_bits_tag[6:1]; 
  assign io_requestor_0_req_ready = io_mem_req_ready; 
  assign io_requestor_0_s2_nack = io_mem_s2_nack & _T_220; 
  assign io_requestor_0_resp_valid = io_mem_resp_valid & _T_222; 
  assign io_requestor_0_resp_bits_data_word_bypass = io_mem_resp_bits_data_word_bypass; 
  assign io_requestor_0_s2_xcpt_ae_ld = io_mem_s2_xcpt_ae_ld; 
  assign io_requestor_1_req_ready = io_requestor_0_req_ready & _T_215; 
  assign io_requestor_1_s2_nack = io_mem_s2_nack & _T_212; 
  assign io_requestor_1_resp_valid = io_mem_resp_valid & _T_221; 
  assign io_requestor_1_resp_bits_tag = {{1'd0}, _T_226}; 
  assign io_requestor_1_resp_bits_typ = io_mem_resp_bits_typ; 
  assign io_requestor_1_resp_bits_data = io_mem_resp_bits_data; 
  assign io_requestor_1_resp_bits_replay = io_mem_resp_bits_replay; 
  assign io_requestor_1_resp_bits_has_data = io_mem_resp_bits_has_data; 
  assign io_requestor_1_resp_bits_data_word_bypass = io_mem_resp_bits_data_word_bypass; 
  assign io_requestor_1_replay_next = io_mem_replay_next; 
  assign io_requestor_1_s2_xcpt_ma_ld = io_mem_s2_xcpt_ma_ld; 
  assign io_requestor_1_s2_xcpt_ma_st = io_mem_s2_xcpt_ma_st; 
  assign io_requestor_1_s2_xcpt_pf_ld = io_mem_s2_xcpt_pf_ld; 
  assign io_requestor_1_s2_xcpt_pf_st = io_mem_s2_xcpt_pf_st; 
  assign io_requestor_1_s2_xcpt_ae_ld = io_mem_s2_xcpt_ae_ld; 
  assign io_requestor_1_s2_xcpt_ae_st = io_mem_s2_xcpt_ae_st; 
  assign io_requestor_1_ordered = io_mem_ordered; 
  assign io_requestor_1_perf_grant = io_mem_perf_grant; 
  assign io_requestor_1_clock_enabled = io_mem_clock_enabled; 
  assign io_mem_req_valid = io_requestor_0_req_valid | io_requestor_1_req_valid; 
  assign io_mem_req_bits_addr = io_requestor_0_req_valid ? io_requestor_0_req_bits_addr : io_requestor_1_req_bits_addr; 
  assign io_mem_req_bits_tag = _GEN_4[6:0]; 
  assign io_mem_req_bits_cmd = io_requestor_0_req_valid ? io_requestor_0_req_bits_cmd : io_requestor_1_req_bits_cmd; 
  assign io_mem_req_bits_typ = io_requestor_0_req_valid ? io_requestor_0_req_bits_typ : io_requestor_1_req_bits_typ; 
  assign io_mem_req_bits_phys = io_requestor_0_req_valid ? io_requestor_0_req_bits_phys : io_requestor_1_req_bits_phys; 
  assign io_mem_s1_kill = _T_219 ? io_requestor_0_s1_kill : io_requestor_1_s1_kill; 
  assign io_mem_s1_data_data = _T_219 ? io_requestor_0_s1_data_data : io_requestor_1_s1_data_data; 
  assign io_mem_s1_data_mask = _T_219 ? io_requestor_0_s1_data_mask : io_requestor_1_s1_data_mask; 
  assign io_mem_s2_kill = _T_220 ? io_requestor_0_s2_kill : io_requestor_1_s2_kill; 
  assign io_mem_keep_clock_enabled = io_requestor_0_keep_clock_enabled | io_requestor_1_keep_clock_enabled; 
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
  _T_210 = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T_212 = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (io_requestor_0_req_valid) begin
      _T_210 <= 1'h0;
    end else begin
      _T_210 <= 1'h1;
    end
    _T_212 <= _T_210;
  end
endmodule
