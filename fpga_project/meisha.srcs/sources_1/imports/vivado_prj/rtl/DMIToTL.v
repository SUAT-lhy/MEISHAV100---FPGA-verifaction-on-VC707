module DMIToTL( 
  input         auto_out_a_ready, 
  output        auto_out_a_valid, 
  output [2:0]  auto_out_a_bits_opcode, 
  output [8:0]  auto_out_a_bits_address, 
  output [3:0]  auto_out_a_bits_mask, 
  output [31:0] auto_out_a_bits_data, 
  output        auto_out_d_ready, 
  input         auto_out_d_valid, 
  input         auto_out_d_bits_denied, 
  input  [31:0] auto_out_d_bits_data, 
  input         auto_out_d_bits_corrupt, 
  output        io_dmi_req_ready, 
  input         io_dmi_req_valid, 
  input  [6:0]  io_dmi_req_bits_addr, 
  input  [31:0] io_dmi_req_bits_data, 
  input  [1:0]  io_dmi_req_bits_op, 
  input         io_dmi_resp_ready, 
  output        io_dmi_resp_valid, 
  output [31:0] io_dmi_resp_bits_data, 
  output [1:0]  io_dmi_resp_bits_resp 
);
  wire [8:0] _GEN_16; 
  wire [8:0] addr; 
  wire  _T_234; 
  wire  _T_235; 
  wire [2:0] _GEN_0; 
  wire [8:0] _GEN_4; 
  wire [3:0] _GEN_5; 
  wire  _T_236; 
  assign _GEN_16 = {{2'd0}, io_dmi_req_bits_addr}; 
  assign addr = _GEN_16 << 2; 
  assign _T_234 = io_dmi_req_bits_op == 2'h2; 
  assign _T_235 = io_dmi_req_bits_op == 2'h1; 
  assign _GEN_0 = _T_235 ? 3'h4 : 3'h1; 
  assign _GEN_4 = _T_235 ? addr : 9'h40; 
  assign _GEN_5 = _T_235 ? 4'hf : 4'h0; 
  assign _T_236 = auto_out_d_bits_corrupt | auto_out_d_bits_denied; 
  assign auto_out_a_valid = io_dmi_req_valid; 
  assign auto_out_a_bits_opcode = _T_234 ? 3'h0 : _GEN_0; 
  assign auto_out_a_bits_address = _T_234 ? addr : _GEN_4; 
  assign auto_out_a_bits_mask = _T_234 ? 4'hf : _GEN_5; 
  assign auto_out_a_bits_data = _T_234 ? io_dmi_req_bits_data : 32'h0; 
  assign auto_out_d_ready = io_dmi_resp_ready; 
  assign io_dmi_req_ready = auto_out_a_ready; 
  assign io_dmi_resp_valid = auto_out_d_valid; 
  assign io_dmi_resp_bits_data = auto_out_d_bits_data; 
  assign io_dmi_resp_bits_resp = {{1'd0}, _T_236}; 
endmodule
