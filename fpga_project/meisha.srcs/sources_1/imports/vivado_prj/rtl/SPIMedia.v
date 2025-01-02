module SPIMedia( 
  input         clock, 
  input         reset, 
  output        io_port_sck, 
  output        io_port_dq_0_o, 
  input         io_port_dq_1_i, 
  output        io_port_cs_0, 
  input  [11:0] io_ctrl_sck_div, 
  input         io_ctrl_sck_pol, 
  input         io_ctrl_sck_pha, 
  input  [7:0]  io_ctrl_dla_cssck, 
  input  [7:0]  io_ctrl_dla_sckcs, 
  input  [7:0]  io_ctrl_dla_intercs, 
  input  [7:0]  io_ctrl_dla_interxfr, 
  input         io_ctrl_cs_id, 
  input         io_ctrl_cs_dflt_0, 
  input  [11:0] io_ctrl_extradel_coarse, 
  input  [4:0]  io_ctrl_sampledel_sd, 
  output        io_link_tx_ready, 
  input         io_link_tx_valid, 
  input  [7:0]  io_link_tx_bits, 
  output        io_link_rx_valid, 
  output [7:0]  io_link_rx_bits, 
  input  [7:0]  io_link_cnt, 
  input  [1:0]  io_link_fmt_proto, 
  input         io_link_fmt_endian, 
  input         io_link_cs_set, 
  input         io_link_cs_clear 
);
  wire  phy_clock; 
  wire  phy_reset; 
  wire  phy_io_port_sck; 
  wire  phy_io_port_dq_0_o; 
  wire  phy_io_port_dq_1_i; 
  wire [11:0] phy_io_ctrl_sck_div; 
  wire  phy_io_ctrl_sck_pol; 
  wire  phy_io_ctrl_sck_pha; 
  wire [1:0] phy_io_ctrl_fmt_proto; 
  wire  phy_io_ctrl_fmt_endian; 
  wire [11:0] phy_io_ctrl_extradel_coarse; 
  wire [4:0] phy_io_ctrl_sampledel_sd; 
  wire  phy_io_op_ready; 
  wire  phy_io_op_valid; 
  wire  phy_io_op_bits_fn; 
  wire  phy_io_op_bits_stb; 
  wire [7:0] phy_io_op_bits_cnt; 
  wire [7:0] phy_io_op_bits_data; 
  wire  phy_io_rx_valid; 
  wire [7:0] phy_io_rx_bits; 
  reg  cs_id; 
  reg [31:0] _RAND_0;
  reg  cs_dflt_0; 
  reg [31:0] _RAND_1;
  reg  cs_set; 
  reg [31:0] _RAND_2;
  wire [1:0] _GEN_54; 
  wire [1:0] _T_67; 
  wire [1:0] _GEN_55; 
  wire [1:0] _T_68; 
  wire  cs_active_0; 
  wire  cs_update; 
  reg  clear; 
  reg [31:0] _RAND_3;
  reg  cs_assert; 
  reg [31:0] _RAND_4;
  wire  cs_deassert; 
  wire  _T_80; 
  wire  _T_81; 
  wire  continuous; 
  reg [1:0] state; 
  reg [31:0] _RAND_5;
  wire  _T_84; 
  wire  _T_85; 
  wire [7:0] _GEN_2; 
  wire  _GEN_5; 
  wire  _GEN_6; 
  wire  _GEN_7; 
  wire [7:0] _GEN_11; 
  wire  _GEN_15; 
  wire [7:0] _GEN_17; 
  wire  _GEN_19; 
  wire  _GEN_20; 
  wire  _GEN_21; 
  wire  _GEN_22; 
  wire  _T_86; 
  wire  _T_87; 
  wire  _T_88; 
  wire  _T_89; 
  wire [1:0] _GEN_56; 
  wire [1:0] _T_90; 
  wire [1:0] _GEN_57; 
  wire [1:0] _T_91; 
  wire  _T_92; 
  wire [7:0] _GEN_30; 
  wire  _GEN_36; 
  wire [7:0] _GEN_37; 
  wire  _GEN_39; 
  SPIPhysical phy ( 
    .clock(phy_clock),
    .reset(phy_reset),
    .io_port_sck(phy_io_port_sck),
    .io_port_dq_0_o(phy_io_port_dq_0_o),
    .io_port_dq_1_i(phy_io_port_dq_1_i),
    .io_ctrl_sck_div(phy_io_ctrl_sck_div),
    .io_ctrl_sck_pol(phy_io_ctrl_sck_pol),
    .io_ctrl_sck_pha(phy_io_ctrl_sck_pha),
    .io_ctrl_fmt_proto(phy_io_ctrl_fmt_proto),
    .io_ctrl_fmt_endian(phy_io_ctrl_fmt_endian),
    .io_ctrl_extradel_coarse(phy_io_ctrl_extradel_coarse),
    .io_ctrl_sampledel_sd(phy_io_ctrl_sampledel_sd),
    .io_op_ready(phy_io_op_ready),
    .io_op_valid(phy_io_op_valid),
    .io_op_bits_fn(phy_io_op_bits_fn),
    .io_op_bits_stb(phy_io_op_bits_stb),
    .io_op_bits_cnt(phy_io_op_bits_cnt),
    .io_op_bits_data(phy_io_op_bits_data),
    .io_rx_valid(phy_io_rx_valid),
    .io_rx_bits(phy_io_rx_bits)
  );
  assign _GEN_54 = {{1'd0}, io_link_cs_set}; 
  assign _T_67 = _GEN_54 << io_ctrl_cs_id; 
  assign _GEN_55 = {{1'd0}, io_ctrl_cs_dflt_0}; 
  assign _T_68 = _GEN_55 ^ _T_67; 
  assign cs_active_0 = _T_68[0]; 
  assign cs_update = cs_active_0 != cs_dflt_0; 
  assign cs_deassert = clear | cs_update; 
  assign _T_80 = io_link_cs_clear & cs_assert; 
  assign _T_81 = clear | _T_80; 
  assign continuous = io_ctrl_dla_interxfr == 8'h0; 
  assign _T_84 = 2'h0 == state; 
  assign _T_85 = phy_io_op_ready & phy_io_op_valid; 
  assign _GEN_2 = cs_deassert ? io_ctrl_dla_sckcs : io_link_cnt; 
  assign _GEN_5 = cs_deassert ? 1'h0 : 1'h1; 
  assign _GEN_6 = cs_deassert ? 1'h1 : io_link_tx_valid; 
  assign _GEN_7 = cs_deassert ? 1'h0 : phy_io_op_ready; 
  assign _GEN_11 = io_link_tx_valid ? io_ctrl_dla_cssck : 8'h0; 
  assign _GEN_15 = io_link_tx_valid ? 1'h0 : 1'h1; 
  assign _GEN_17 = cs_assert ? _GEN_2 : _GEN_11; 
  assign _GEN_19 = cs_assert ? cs_deassert : 1'h1; 
  assign _GEN_20 = cs_assert ? _GEN_5 : _GEN_15; 
  assign _GEN_21 = cs_assert ? _GEN_6 : 1'h1; 
  assign _GEN_22 = cs_assert ? _GEN_7 : 1'h0; 
  assign _T_86 = 2'h1 == state; 
  assign _T_87 = continuous == 1'h0; 
  assign _T_88 = phy_io_op_ready | continuous; 
  assign _T_89 = 2'h2 == state; 
  assign _GEN_56 = {{1'd0}, cs_set}; 
  assign _T_90 = _GEN_56 << cs_id; 
  assign _GEN_57 = {{1'd0}, cs_dflt_0}; 
  assign _T_91 = _GEN_57 ^ _T_90; 
  assign _T_92 = _T_91[0]; 
  assign _GEN_30 = _T_89 ? io_ctrl_dla_intercs : io_link_cnt; 
  assign _GEN_36 = _T_86 ? _T_87 : 1'h1; 
  assign _GEN_37 = _T_86 ? io_ctrl_dla_interxfr : _GEN_30; 
  assign _GEN_39 = _T_86 ? 1'h0 : _T_89; 
  assign io_port_sck = phy_io_port_sck; 
  assign io_port_dq_0_o = phy_io_port_dq_0_o; 
  assign io_port_cs_0 = cs_dflt_0; 
  assign io_link_tx_ready = _T_84 ? _GEN_22 : 1'h0; 
  assign io_link_rx_valid = phy_io_rx_valid; 
  assign io_link_rx_bits = phy_io_rx_bits; 
  assign phy_clock = clock; 
  assign phy_reset = reset; 
  assign phy_io_port_dq_1_i = io_port_dq_1_i; 
  assign phy_io_ctrl_sck_div = io_ctrl_sck_div; 
  assign phy_io_ctrl_sck_pol = io_ctrl_sck_pol; 
  assign phy_io_ctrl_sck_pha = io_ctrl_sck_pha; 
  assign phy_io_ctrl_fmt_proto = io_link_fmt_proto; 
  assign phy_io_ctrl_fmt_endian = io_link_fmt_endian; 
  assign phy_io_ctrl_extradel_coarse = io_ctrl_extradel_coarse; 
  assign phy_io_ctrl_sampledel_sd = io_ctrl_sampledel_sd; 
  assign phy_io_op_valid = _T_84 ? _GEN_21 : _GEN_36; 
  assign phy_io_op_bits_fn = _T_84 ? _GEN_19 : 1'h1; 
  assign phy_io_op_bits_stb = _T_84 ? _GEN_20 : _GEN_39; 
  assign phy_io_op_bits_cnt = _T_84 ? _GEN_17 : _GEN_37; 
  assign phy_io_op_bits_data = io_link_tx_bits; 
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
  cs_id = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  cs_dflt_0 = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  cs_set = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  clear = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  cs_assert = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  state = _RAND_5[1:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (_T_84) begin
      if (!(cs_assert)) begin
        if (!(io_link_tx_valid)) begin
          cs_id <= io_ctrl_cs_id;
        end
      end
    end
    if (_T_84) begin
      if (!(cs_assert)) begin
        if (io_link_tx_valid) begin
          if (phy_io_op_ready) begin
            cs_dflt_0 <= cs_active_0;
          end
        end else begin
          cs_dflt_0 <= io_ctrl_cs_dflt_0;
        end
      end
    end else begin
      if (!(_T_86)) begin
        if (_T_89) begin
          if (phy_io_op_ready) begin
            cs_dflt_0 <= _T_92;
          end
        end
      end
    end
    if (_T_84) begin
      if (!(cs_assert)) begin
        if (io_link_tx_valid) begin
          if (phy_io_op_ready) begin
            cs_set <= io_link_cs_set;
          end
        end
      end
    end
    if (reset) begin
      clear <= 1'h0;
    end else begin
      if (_T_84) begin
        clear <= _T_81;
      end else begin
        if (_T_86) begin
          clear <= _T_81;
        end else begin
          if (_T_89) begin
            clear <= 1'h0;
          end else begin
            clear <= _T_81;
          end
        end
      end
    end
    if (reset) begin
      cs_assert <= 1'h0;
    end else begin
      if (_T_84) begin
        if (!(cs_assert)) begin
          if (io_link_tx_valid) begin
            if (phy_io_op_ready) begin
              cs_assert <= 1'h1;
            end
          end
        end
      end else begin
        if (!(_T_86)) begin
          if (_T_89) begin
            cs_assert <= 1'h0;
          end
        end
      end
    end
    if (reset) begin
      state <= 2'h0;
    end else begin
      if (_T_84) begin
        if (cs_assert) begin
          if (cs_deassert) begin
            if (phy_io_op_ready) begin
              state <= 2'h2;
            end
          end else begin
            if (_T_85) begin
              state <= 2'h1;
            end
          end
        end
      end else begin
        if (_T_86) begin
          if (_T_88) begin
            state <= 2'h0;
          end
        end else begin
          if (_T_89) begin
            if (phy_io_op_ready) begin
              state <= 2'h0;
            end
          end
        end
      end
    end
  end
endmodule
