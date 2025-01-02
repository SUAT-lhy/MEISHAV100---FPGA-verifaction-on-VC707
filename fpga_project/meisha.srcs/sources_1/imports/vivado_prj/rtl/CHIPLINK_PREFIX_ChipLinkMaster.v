module CHIPLINK_PREFIX_ChipLinkMaster(
  input         clock,
  input         reset,
  // tx dfx 
  output wire [31:0] transferDataReg,
  output wire        send_1p_valid,
  // rx dfx
  output wire [31:0] b2c_data_concat,
  output wire        b2c_data_valid,
`ifdef CHIPLINK_CONNECT_DIRECT_TL
  input wire mig_input_takeover_en,
  output  widget_auto_in_a_ready,
  input  widget_auto_in_a_valid,
  input [2:0] widget_auto_in_a_bits_opcode,
  input [2:0] widget_auto_in_a_bits_size,
  input [3:0] widget_auto_in_a_bits_source,
  input [31:0] widget_auto_in_a_bits_address,
  input [7:0] widget_auto_in_a_bits_mask,
  input [63:0] widget_auto_in_a_bits_data,
  input  widget_auto_in_d_ready,
  output  widget_auto_in_d_valid,
  output [2:0] widget_auto_in_d_bits_opcode,
  output [2:0] widget_auto_in_d_bits_size,
  output [3:0] widget_auto_in_d_bits_source,
  output  widget_auto_in_d_bits_denied,
  output [63:0] widget_auto_in_d_bits_data,
  output  widget_auto_in_d_bits_corrupt,
`else
  output        slave_0_awready,
  input         slave_0_awvalid,
  input  [3:0]  slave_0_awid,
  input  [31:0] slave_0_awaddr,
  input  [7:0]  slave_0_awlen,
  input  [2:0]  slave_0_awsize,
  input  [1:0]  slave_0_awburst,
  output        slave_0_wready,
  input         slave_0_wvalid,
  input  [63:0] slave_0_wdata,
  input  [7:0]  slave_0_wstrb,
  input         slave_0_wlast,
  input         slave_0_bready,
  output        slave_0_bvalid,
  output [3:0]  slave_0_bid,
  output [1:0]  slave_0_bresp,
  output        slave_0_arready,
  input         slave_0_arvalid,
  input  [3:0]  slave_0_arid,
  input  [31:0] slave_0_araddr,
  input  [7:0]  slave_0_arlen,
  input  [2:0]  slave_0_arsize,
  input  [1:0]  slave_0_arburst,
  input         slave_0_rready,
  output        slave_0_rvalid,
  output [3:0]  slave_0_rid,
  output [63:0] slave_0_rdata,
  output [1:0]  slave_0_rresp,
  output        slave_0_rlast,
`endif
  input         master_mem_0_awready,
  output        master_mem_0_awvalid,
  output [3:0]  master_mem_0_awid,
  output [31:0] master_mem_0_awaddr,
  output [7:0]  master_mem_0_awlen,
  output [2:0]  master_mem_0_awsize,
  output [1:0]  master_mem_0_awburst,
  input         master_mem_0_wready,
  output        master_mem_0_wvalid,
  output [63:0] master_mem_0_wdata,
  output [7:0]  master_mem_0_wstrb,
  output        master_mem_0_wlast,
  output        master_mem_0_bready,
  input         master_mem_0_bvalid,
  input  [3:0]  master_mem_0_bid,
  input  [1:0]  master_mem_0_bresp,
  input         master_mem_0_arready,
  output        master_mem_0_arvalid,
  output [3:0]  master_mem_0_arid,
  output [31:0] master_mem_0_araddr,
  output [7:0]  master_mem_0_arlen,
  output [2:0]  master_mem_0_arsize,
  output [1:0]  master_mem_0_arburst,
  output        master_mem_0_rready,
  input         master_mem_0_rvalid,
  input  [3:0]  master_mem_0_rid,
  input  [63:0] master_mem_0_rdata,
  input  [1:0]  master_mem_0_rresp,
  input         master_mem_0_rlast,
  output        fpga_io_c2b_clk,
  output        fpga_io_c2b_rst,
  output        fpga_io_c2b_send,
  output [7:0]  fpga_io_c2b_data,
  input         fpga_io_b2c_clk,
  input         fpga_io_b2c_rst,
  input         fpga_io_b2c_send,
  input  [7:0]  fpga_io_b2c_data
);
    
  wire  widget_clock;
  wire  widget_reset;
  wire  xbar_clock;
  wire  xbar_reset;
  wire  xbar_auto_in_a_ready;
  wire  xbar_auto_in_a_valid;
  wire [2:0] xbar_auto_in_a_bits_opcode;
  wire [2:0] xbar_auto_in_a_bits_param;
  wire [2:0] xbar_auto_in_a_bits_size;
  wire [6:0] xbar_auto_in_a_bits_source;
  wire [31:0] xbar_auto_in_a_bits_address;
  wire [7:0] xbar_auto_in_a_bits_mask;
  wire [63:0] xbar_auto_in_a_bits_data;
  wire  xbar_auto_in_a_bits_corrupt;
  wire  xbar_auto_in_c_ready;
  wire  xbar_auto_in_c_valid;
  wire [2:0] xbar_auto_in_c_bits_opcode;
  wire [2:0] xbar_auto_in_c_bits_param;
  wire [2:0] xbar_auto_in_c_bits_size;
  wire [6:0] xbar_auto_in_c_bits_source;
  wire [31:0] xbar_auto_in_c_bits_address;
  wire  xbar_auto_in_d_ready;
  wire  xbar_auto_in_d_valid;
  wire [2:0] xbar_auto_in_d_bits_opcode;
  wire [1:0] xbar_auto_in_d_bits_param;
  wire [2:0] xbar_auto_in_d_bits_size;
  wire [6:0] xbar_auto_in_d_bits_source;
  wire  xbar_auto_in_d_bits_denied;
  wire [63:0] xbar_auto_in_d_bits_data;
  wire  xbar_auto_in_d_bits_corrupt;
  wire  xbar_auto_in_e_ready;
  wire  xbar_auto_in_e_valid;
  wire  xbar_auto_in_e_bits_sink;
  wire  xbar_auto_out_1_a_ready;
  wire  xbar_auto_out_1_a_valid;
  wire [2:0] xbar_auto_out_1_a_bits_opcode;
  wire [2:0] xbar_auto_out_1_a_bits_param;
  wire [2:0] xbar_auto_out_1_a_bits_size;
  wire [6:0] xbar_auto_out_1_a_bits_source;
  wire [12:0] xbar_auto_out_1_a_bits_address;
  wire [7:0] xbar_auto_out_1_a_bits_mask;
  wire  xbar_auto_out_1_a_bits_corrupt;
  wire  xbar_auto_out_1_c_ready;
  wire  xbar_auto_out_1_c_valid;
  wire [2:0] xbar_auto_out_1_c_bits_opcode;
  wire [2:0] xbar_auto_out_1_c_bits_param;
  wire [2:0] xbar_auto_out_1_c_bits_size;
  wire [6:0] xbar_auto_out_1_c_bits_source;
  wire [12:0] xbar_auto_out_1_c_bits_address;
  wire  xbar_auto_out_1_d_ready;
  wire  xbar_auto_out_1_d_valid;
  wire [2:0] xbar_auto_out_1_d_bits_opcode;
  wire [1:0] xbar_auto_out_1_d_bits_param;
  wire [2:0] xbar_auto_out_1_d_bits_size;
  wire [6:0] xbar_auto_out_1_d_bits_source;
  wire  xbar_auto_out_1_d_bits_denied;
  wire  xbar_auto_out_1_d_bits_corrupt;
  wire  xbar_auto_out_1_e_valid;
  wire  xbar_auto_out_0_a_ready;
  wire  xbar_auto_out_0_a_valid;
  wire [2:0] xbar_auto_out_0_a_bits_opcode;
  wire [2:0] xbar_auto_out_0_a_bits_param;
  wire [2:0] xbar_auto_out_0_a_bits_size;
  wire [6:0] xbar_auto_out_0_a_bits_source;
  wire [31:0] xbar_auto_out_0_a_bits_address;
  wire [7:0] xbar_auto_out_0_a_bits_mask;
  wire [63:0] xbar_auto_out_0_a_bits_data;
  wire  xbar_auto_out_0_a_bits_corrupt;
  wire  xbar_auto_out_0_d_ready;
  wire  xbar_auto_out_0_d_valid;
  wire [2:0] xbar_auto_out_0_d_bits_opcode;
  wire [2:0] xbar_auto_out_0_d_bits_size;
  wire [6:0] xbar_auto_out_0_d_bits_source;
  wire  xbar_auto_out_0_d_bits_denied;
  wire [63:0] xbar_auto_out_0_d_bits_data;
  wire  xbar_auto_out_0_d_bits_corrupt;
  wire  xbar_1_clock;
  wire  xbar_1_reset;
  wire  xbar_1_auto_in_a_ready;
  wire  xbar_1_auto_in_a_valid;
  wire [2:0] xbar_1_auto_in_a_bits_opcode;
  wire [2:0] xbar_1_auto_in_a_bits_size;
  wire [3:0] xbar_1_auto_in_a_bits_source;
  wire [31:0] xbar_1_auto_in_a_bits_address;
  wire [3:0] xbar_1_auto_in_a_bits_mask;
  wire [31:0] xbar_1_auto_in_a_bits_data;
  wire  xbar_1_auto_in_d_ready;
  wire  xbar_1_auto_in_d_valid;
  wire [2:0] xbar_1_auto_in_d_bits_opcode;
  wire [1:0] xbar_1_auto_in_d_bits_param;
  wire [2:0] xbar_1_auto_in_d_bits_size;
  wire [3:0] xbar_1_auto_in_d_bits_source;
  wire [5:0] xbar_1_auto_in_d_bits_sink;
  wire  xbar_1_auto_in_d_bits_denied;
  wire [31:0] xbar_1_auto_in_d_bits_data;
  wire  xbar_1_auto_in_d_bits_corrupt;
  wire  xbar_1_auto_out_1_a_ready;
  wire  xbar_1_auto_out_1_a_valid;
  wire [2:0] xbar_1_auto_out_1_a_bits_opcode;
  wire [2:0] xbar_1_auto_out_1_a_bits_size;
  wire [3:0] xbar_1_auto_out_1_a_bits_source;
  wire [12:0] xbar_1_auto_out_1_a_bits_address;
  wire [3:0] xbar_1_auto_out_1_a_bits_mask;
  wire  xbar_1_auto_out_1_d_ready;
  wire  xbar_1_auto_out_1_d_valid;
  wire [2:0] xbar_1_auto_out_1_d_bits_opcode;
  wire [2:0] xbar_1_auto_out_1_d_bits_size;
  wire [3:0] xbar_1_auto_out_1_d_bits_source;
  wire  xbar_1_auto_out_1_d_bits_denied;
  wire  xbar_1_auto_out_1_d_bits_corrupt;
  wire  xbar_1_auto_out_0_a_ready;
  wire  xbar_1_auto_out_0_a_valid;
  wire [2:0] xbar_1_auto_out_0_a_bits_opcode;
  wire [2:0] xbar_1_auto_out_0_a_bits_size;
  wire [3:0] xbar_1_auto_out_0_a_bits_source;
  wire [31:0] xbar_1_auto_out_0_a_bits_address;
  wire [3:0] xbar_1_auto_out_0_a_bits_mask;
  wire [31:0] xbar_1_auto_out_0_a_bits_data;
  wire  xbar_1_auto_out_0_d_ready;
  wire  xbar_1_auto_out_0_d_valid;
  wire [2:0] xbar_1_auto_out_0_d_bits_opcode;
  wire [1:0] xbar_1_auto_out_0_d_bits_param;
  wire [2:0] xbar_1_auto_out_0_d_bits_size;
  wire [3:0] xbar_1_auto_out_0_d_bits_source;
  wire [4:0] xbar_1_auto_out_0_d_bits_sink;
  wire  xbar_1_auto_out_0_d_bits_denied;
  wire [31:0] xbar_1_auto_out_0_d_bits_data;
  wire  xbar_1_auto_out_0_d_bits_corrupt;
  wire  ferr_clock;
  wire  ferr_reset;
  wire  ferr_auto_in_a_ready;
  wire  ferr_auto_in_a_valid;
  wire [2:0] ferr_auto_in_a_bits_opcode;
  wire [2:0] ferr_auto_in_a_bits_size;
  wire [3:0] ferr_auto_in_a_bits_source;
  wire [12:0] ferr_auto_in_a_bits_address;
  wire [3:0] ferr_auto_in_a_bits_mask;
  wire  ferr_auto_in_d_ready;
  wire  ferr_auto_in_d_valid;
  wire [2:0] ferr_auto_in_d_bits_opcode;
  wire [2:0] ferr_auto_in_d_bits_size;
  wire [3:0] ferr_auto_in_d_bits_source;
  wire  ferr_auto_in_d_bits_denied;
  wire  ferr_auto_in_d_bits_corrupt;
  wire  chiplink_clock;
  wire  chiplink_reset;
  wire  chiplink_auto_mbypass_out_a_ready;
  wire  chiplink_auto_mbypass_out_a_valid;
  wire [2:0] chiplink_auto_mbypass_out_a_bits_opcode;
  wire [2:0] chiplink_auto_mbypass_out_a_bits_param;
  wire [2:0] chiplink_auto_mbypass_out_a_bits_size;
  wire [5:0] chiplink_auto_mbypass_out_a_bits_source;
  wire [31:0] chiplink_auto_mbypass_out_a_bits_address;
  wire [3:0] chiplink_auto_mbypass_out_a_bits_mask;
  wire [31:0] chiplink_auto_mbypass_out_a_bits_data;
  wire  chiplink_auto_mbypass_out_c_ready;
  wire  chiplink_auto_mbypass_out_c_valid;
  wire [2:0] chiplink_auto_mbypass_out_c_bits_opcode;
  wire [2:0] chiplink_auto_mbypass_out_c_bits_param;
  wire [2:0] chiplink_auto_mbypass_out_c_bits_size;
  wire [5:0] chiplink_auto_mbypass_out_c_bits_source;
  wire [31:0] chiplink_auto_mbypass_out_c_bits_address;
  wire  chiplink_auto_mbypass_out_d_ready;
  wire  chiplink_auto_mbypass_out_d_valid;
  wire [2:0] chiplink_auto_mbypass_out_d_bits_opcode;
  wire [1:0] chiplink_auto_mbypass_out_d_bits_param;
  wire [2:0] chiplink_auto_mbypass_out_d_bits_size;
  wire [5:0] chiplink_auto_mbypass_out_d_bits_source;
  wire  chiplink_auto_mbypass_out_d_bits_denied;
  wire [31:0] chiplink_auto_mbypass_out_d_bits_data;
  wire  chiplink_auto_mbypass_out_d_bits_corrupt;
  wire  chiplink_auto_mbypass_out_e_ready;
  wire  chiplink_auto_mbypass_out_e_valid;
  wire  chiplink_auto_mbypass_out_e_bits_sink;
  wire  chiplink_auto_sbypass_node_in_in_a_ready;
  wire  chiplink_auto_sbypass_node_in_in_a_valid;
  wire [2:0] chiplink_auto_sbypass_node_in_in_a_bits_opcode;
  wire [2:0] chiplink_auto_sbypass_node_in_in_a_bits_size;
  wire [3:0] chiplink_auto_sbypass_node_in_in_a_bits_source;
  wire [31:0] chiplink_auto_sbypass_node_in_in_a_bits_address;
  wire [3:0] chiplink_auto_sbypass_node_in_in_a_bits_mask;
  wire [31:0] chiplink_auto_sbypass_node_in_in_a_bits_data;
  wire  chiplink_auto_sbypass_node_in_in_d_ready;
  wire  chiplink_auto_sbypass_node_in_in_d_valid;
  wire [2:0] chiplink_auto_sbypass_node_in_in_d_bits_opcode;
  wire [1:0] chiplink_auto_sbypass_node_in_in_d_bits_param;
  wire [2:0] chiplink_auto_sbypass_node_in_in_d_bits_size;
  wire [3:0] chiplink_auto_sbypass_node_in_in_d_bits_source;
  wire [4:0] chiplink_auto_sbypass_node_in_in_d_bits_sink;
  wire  chiplink_auto_sbypass_node_in_in_d_bits_denied;
  wire [31:0] chiplink_auto_sbypass_node_in_in_d_bits_data;
  wire  chiplink_auto_sbypass_node_in_in_d_bits_corrupt;
  wire  chiplink_auto_io_out_c2b_clk;
  wire  chiplink_auto_io_out_c2b_rst;
  wire  chiplink_auto_io_out_c2b_send;
  wire [7:0] chiplink_auto_io_out_c2b_data;
  wire  chiplink_auto_io_out_b2c_clk;
  wire  chiplink_auto_io_out_b2c_rst;
  wire  chiplink_auto_io_out_b2c_send;
  wire [7:0] chiplink_auto_io_out_b2c_data;
  wire  fixer_clock;
  wire  fixer_reset;
  wire  fixer_auto_in_a_ready;
  wire  fixer_auto_in_a_valid;
  wire [2:0] fixer_auto_in_a_bits_opcode;
  wire [2:0] fixer_auto_in_a_bits_size;
  wire [3:0] fixer_auto_in_a_bits_source;
  wire [31:0] fixer_auto_in_a_bits_address;
  wire [3:0] fixer_auto_in_a_bits_mask;
  wire [31:0] fixer_auto_in_a_bits_data;
  wire  fixer_auto_in_d_ready;
  wire  fixer_auto_in_d_valid;
  wire [2:0] fixer_auto_in_d_bits_opcode;
  wire [1:0] fixer_auto_in_d_bits_param;
  wire [2:0] fixer_auto_in_d_bits_size;
  wire [3:0] fixer_auto_in_d_bits_source;
  wire [5:0] fixer_auto_in_d_bits_sink;
  wire  fixer_auto_in_d_bits_denied;
  wire [31:0] fixer_auto_in_d_bits_data;
  wire  fixer_auto_in_d_bits_corrupt;
  wire  fixer_auto_out_a_ready;
  wire  fixer_auto_out_a_valid;
  wire [2:0] fixer_auto_out_a_bits_opcode;
  wire [2:0] fixer_auto_out_a_bits_size;
  wire [3:0] fixer_auto_out_a_bits_source;
  wire [31:0] fixer_auto_out_a_bits_address;
  wire [3:0] fixer_auto_out_a_bits_mask;
  wire [31:0] fixer_auto_out_a_bits_data;
  wire  fixer_auto_out_d_ready;
  wire  fixer_auto_out_d_valid;
  wire [2:0] fixer_auto_out_d_bits_opcode;
  wire [1:0] fixer_auto_out_d_bits_param;
  wire [2:0] fixer_auto_out_d_bits_size;
  wire [3:0] fixer_auto_out_d_bits_source;
  wire [5:0] fixer_auto_out_d_bits_sink;
  wire  fixer_auto_out_d_bits_denied;
  wire [31:0] fixer_auto_out_d_bits_data;
  wire  fixer_auto_out_d_bits_corrupt;

`ifndef CHIPLINK_CONNECT_DIRECT_TL
  wire  widget_auto_in_a_ready;
  wire   widget_auto_in_a_valid;
  wire  [2:0] widget_auto_in_a_bits_opcode;
  wire  [2:0] widget_auto_in_a_bits_size;
  wire  [3:0] widget_auto_in_a_bits_source;
  wire  [31:0] widget_auto_in_a_bits_address;
  wire  [7:0] widget_auto_in_a_bits_mask;
  wire  [63:0] widget_auto_in_a_bits_data;
  wire   widget_auto_in_d_ready;
  wire  widget_auto_in_d_valid;
  wire [2:0] widget_auto_in_d_bits_opcode;
  wire [2:0] widget_auto_in_d_bits_size;
  wire [3:0] widget_auto_in_d_bits_source;
  wire  widget_auto_in_d_bits_denied;
  wire [63:0] widget_auto_in_d_bits_data;
  wire  widget_auto_in_d_bits_corrupt;

`else
  // add takeover function
  wire        tl_uh_ferr_mux_out_d_ready;
  wire        tl_uh_ferr_mux_out_d_valid;
  wire [2:0]  tl_uh_ferr_mux_out_d_bits_opcode;
  wire [2:0]  tl_uh_ferr_mux_out_d_bits_size;
  wire [4-1:0]  tl_uh_ferr_mux_out_d_bits_source;
  wire        tl_uh_ferr_mux_out_d_bits_denied;
  wire        tl_uh_ferr_mux_out_d_bits_corrupt;

  wire        tl_uh_ferr_mux_out_a_ready;

  wire  chiplink_auto_sbypass_node_mux_in_d_ready;
  wire  chiplink_auto_sbypass_node_mux_in_d_valid;
  wire [2:0] chiplink_auto_sbypass_node_mux_in_d_bits_opcode;
  wire [1:0] chiplink_auto_sbypass_node_mux_in_d_bits_param;
  wire [2:0] chiplink_auto_sbypass_node_mux_in_d_bits_size;
  wire [3:0] chiplink_auto_sbypass_node_mux_in_d_bits_source;
  wire [5:0] chiplink_auto_sbypass_node_mux_in_d_bits_sink;
  wire  chiplink_auto_sbypass_node_mux_in_d_bits_denied;
  wire [31:0] chiplink_auto_sbypass_node_mux_in_d_bits_data;
  wire  chiplink_auto_sbypass_node_mux_in_d_bits_corrupt;
  
  wire chiplink_auto_sbypass_node_mux_in_a_ready;

`endif

  wire  widget_auto_out_a_ready;
  wire  widget_auto_out_a_valid;
  wire [2:0] widget_auto_out_a_bits_opcode;
  wire [2:0] widget_auto_out_a_bits_size;
  wire [3:0] widget_auto_out_a_bits_source;
  wire [31:0] widget_auto_out_a_bits_address;
  wire [3:0] widget_auto_out_a_bits_mask;
  wire [31:0] widget_auto_out_a_bits_data;


  wire  widget_auto_out_d_ready;
  wire  widget_auto_out_d_valid;
  wire [2:0] widget_auto_out_d_bits_opcode;
  wire [1:0] widget_auto_out_d_bits_param;
  wire [2:0] widget_auto_out_d_bits_size;
  wire [3:0] widget_auto_out_d_bits_source;
  wire [5:0] widget_auto_out_d_bits_sink;
  wire  widget_auto_out_d_bits_denied;
  wire [31:0] widget_auto_out_d_bits_data;
  wire  widget_auto_out_d_bits_corrupt;


  // mux for takeover for chiplink cannot setup link
  
`ifdef CHIPLINK_CONNECT_DIRECT_TL

  assign  tl_uh_ferr_mux_out_d_ready = widget_auto_out_d_ready;
  assign  chiplink_auto_sbypass_node_mux_in_d_ready = widget_auto_out_d_ready;
  assign  widget_auto_out_a_ready = mig_input_takeover_en ? tl_uh_ferr_mux_out_a_ready: chiplink_auto_sbypass_node_mux_in_a_ready;


  assign  widget_auto_out_d_valid = mig_input_takeover_en ? tl_uh_ferr_mux_out_d_valid: chiplink_auto_sbypass_node_mux_in_d_valid;
  assign  widget_auto_out_d_bits_opcode = mig_input_takeover_en ? tl_uh_ferr_mux_out_d_bits_opcode: chiplink_auto_sbypass_node_mux_in_d_bits_opcode;
  assign  widget_auto_out_d_bits_param = mig_input_takeover_en ? 2'b0: chiplink_auto_sbypass_node_mux_in_d_bits_param;
  assign  widget_auto_out_d_bits_size = mig_input_takeover_en ? tl_uh_ferr_mux_out_d_bits_size: chiplink_auto_sbypass_node_mux_in_d_bits_size;
  assign  widget_auto_out_d_bits_source = mig_input_takeover_en ? tl_uh_ferr_mux_out_d_bits_source: chiplink_auto_sbypass_node_mux_in_d_bits_source;
  assign  widget_auto_out_d_bits_sink[5:0] = mig_input_takeover_en ? 6'b0: chiplink_auto_sbypass_node_mux_in_d_bits_sink;
  assign  widget_auto_out_d_bits_denied = mig_input_takeover_en ? tl_uh_ferr_mux_out_d_bits_denied: chiplink_auto_sbypass_node_mux_in_d_bits_denied;
  assign  widget_auto_out_d_bits_data = mig_input_takeover_en ? 32'b0: chiplink_auto_sbypass_node_mux_in_d_bits_data;
  assign  widget_auto_out_d_bits_corrupt = mig_input_takeover_en ? tl_uh_ferr_mux_out_d_bits_corrupt: chiplink_auto_sbypass_node_mux_in_d_bits_corrupt;


  assign chiplink_auto_sbypass_node_mux_in_d_bits_sink[5] = 1'b0;

`endif

  wire  axi42tl_clock;
  wire  axi42tl_reset;
  wire  axi42tl_auto_in_awready;
  wire  axi42tl_auto_in_awvalid;
  wire  axi42tl_auto_in_awid;
  wire [31:0] axi42tl_auto_in_awaddr;
  wire [7:0] axi42tl_auto_in_awlen;
  wire [2:0] axi42tl_auto_in_awsize;
  wire  axi42tl_auto_in_wready;
  wire  axi42tl_auto_in_wvalid;
  wire [63:0] axi42tl_auto_in_wdata;
  wire [7:0] axi42tl_auto_in_wstrb;
  wire  axi42tl_auto_in_wlast;
  wire  axi42tl_auto_in_bready;
  wire  axi42tl_auto_in_bvalid;
  wire  axi42tl_auto_in_bid;
  wire [1:0] axi42tl_auto_in_bresp;
  wire  axi42tl_auto_in_arready;
  wire  axi42tl_auto_in_arvalid;
  wire  axi42tl_auto_in_arid;
  wire [31:0] axi42tl_auto_in_araddr;
  wire [7:0] axi42tl_auto_in_arlen;
  wire [2:0] axi42tl_auto_in_arsize;
  wire  axi42tl_auto_in_rready;
  wire  axi42tl_auto_in_rvalid;
  wire  axi42tl_auto_in_rid;
  wire [63:0] axi42tl_auto_in_rdata;
  wire [1:0] axi42tl_auto_in_rresp;
  wire  axi42tl_auto_in_rlast;
  wire  axi42tl_auto_out_a_ready;
  wire  axi42tl_auto_out_a_valid;
  wire [2:0] axi42tl_auto_out_a_bits_opcode;
  wire [2:0] axi42tl_auto_out_a_bits_size;
  wire [3:0] axi42tl_auto_out_a_bits_source;
  wire [31:0] axi42tl_auto_out_a_bits_address;
  wire [7:0] axi42tl_auto_out_a_bits_mask;
  wire [63:0] axi42tl_auto_out_a_bits_data;
  wire  axi42tl_auto_out_d_ready;
  wire  axi42tl_auto_out_d_valid;
  wire [2:0] axi42tl_auto_out_d_bits_opcode;
  wire [2:0] axi42tl_auto_out_d_bits_size;
  wire [3:0] axi42tl_auto_out_d_bits_source;
  wire  axi42tl_auto_out_d_bits_denied;
  wire [63:0] axi42tl_auto_out_d_bits_data;
  wire  axi42tl_auto_out_d_bits_corrupt;
  wire  axi4yank_clock;
  wire  axi4yank_reset;
  wire  axi4yank_auto_in_awready;
  wire  axi4yank_auto_in_awvalid;
  wire  axi4yank_auto_in_awid;
  wire [31:0] axi4yank_auto_in_awaddr;
  wire [7:0] axi4yank_auto_in_awlen;
  wire [2:0] axi4yank_auto_in_awsize;
  wire [2:0] axi4yank_auto_in_awecho_extra_id;
  wire  axi4yank_auto_in_awecho_real_last;
  wire  axi4yank_auto_in_wready;
  wire  axi4yank_auto_in_wvalid;
  wire [63:0] axi4yank_auto_in_wdata;
  wire [7:0] axi4yank_auto_in_wstrb;
  wire  axi4yank_auto_in_wlast;
  wire  axi4yank_auto_in_bready;
  wire  axi4yank_auto_in_bvalid;
  wire  axi4yank_auto_in_bid;
  wire [1:0] axi4yank_auto_in_bresp;
  wire [2:0] axi4yank_auto_in_becho_extra_id;
  wire  axi4yank_auto_in_becho_real_last;
  wire  axi4yank_auto_in_arready;
  wire  axi4yank_auto_in_arvalid;
  wire  axi4yank_auto_in_arid;
  wire [31:0] axi4yank_auto_in_araddr;
  wire [7:0] axi4yank_auto_in_arlen;
  wire [2:0] axi4yank_auto_in_arsize;
  wire [2:0] axi4yank_auto_in_arecho_extra_id;
  wire  axi4yank_auto_in_arecho_real_last;
  wire  axi4yank_auto_in_rready;
  wire  axi4yank_auto_in_rvalid;
  wire  axi4yank_auto_in_rid;
  wire [63:0] axi4yank_auto_in_rdata;
  wire [1:0] axi4yank_auto_in_rresp;
  wire [2:0] axi4yank_auto_in_recho_extra_id;
  wire  axi4yank_auto_in_recho_real_last;
  wire  axi4yank_auto_in_rlast;
  wire  axi4yank_auto_out_awready;
  wire  axi4yank_auto_out_awvalid;
  wire  axi4yank_auto_out_awid;
  wire [31:0] axi4yank_auto_out_awaddr;
  wire [7:0] axi4yank_auto_out_awlen;
  wire [2:0] axi4yank_auto_out_awsize;
  wire  axi4yank_auto_out_wready;
  wire  axi4yank_auto_out_wvalid;
  wire [63:0] axi4yank_auto_out_wdata;
  wire [7:0] axi4yank_auto_out_wstrb;
  wire  axi4yank_auto_out_wlast;
  wire  axi4yank_auto_out_bready;
  wire  axi4yank_auto_out_bvalid;
  wire  axi4yank_auto_out_bid;
  wire [1:0] axi4yank_auto_out_bresp;
  wire  axi4yank_auto_out_arready;
  wire  axi4yank_auto_out_arvalid;
  wire  axi4yank_auto_out_arid;
  wire [31:0] axi4yank_auto_out_araddr;
  wire [7:0] axi4yank_auto_out_arlen;
  wire [2:0] axi4yank_auto_out_arsize;
  wire  axi4yank_auto_out_rready;
  wire  axi4yank_auto_out_rvalid;
  wire  axi4yank_auto_out_rid;
  wire [63:0] axi4yank_auto_out_rdata;
  wire [1:0] axi4yank_auto_out_rresp;
  wire  axi4yank_auto_out_rlast;
  wire  axi4frag_clock;
  wire  axi4frag_reset;
  wire  axi4frag_auto_in_awready;
  wire  axi4frag_auto_in_awvalid;
  wire  axi4frag_auto_in_awid;
  wire [31:0] axi4frag_auto_in_awaddr;
  wire [7:0] axi4frag_auto_in_awlen;
  wire [2:0] axi4frag_auto_in_awsize;
  wire [1:0] axi4frag_auto_in_awburst;
  wire [2:0] axi4frag_auto_in_awecho_extra_id;
  wire  axi4frag_auto_in_wready;
  wire  axi4frag_auto_in_wvalid;
  wire [63:0] axi4frag_auto_in_wdata;
  wire [7:0] axi4frag_auto_in_wstrb;
  wire  axi4frag_auto_in_wlast;
  wire  axi4frag_auto_in_bready;
  wire  axi4frag_auto_in_bvalid;
  wire  axi4frag_auto_in_bid;
  wire [1:0] axi4frag_auto_in_bresp;
  wire [2:0] axi4frag_auto_in_becho_extra_id;
  wire  axi4frag_auto_in_arready;
  wire  axi4frag_auto_in_arvalid;
  wire  axi4frag_auto_in_arid;
  wire [31:0] axi4frag_auto_in_araddr;
  wire [7:0] axi4frag_auto_in_arlen;
  wire [2:0] axi4frag_auto_in_arsize;
  wire [1:0] axi4frag_auto_in_arburst;
  wire [2:0] axi4frag_auto_in_arecho_extra_id;
  wire  axi4frag_auto_in_rready;
  wire  axi4frag_auto_in_rvalid;
  wire  axi4frag_auto_in_rid;
  wire [63:0] axi4frag_auto_in_rdata;
  wire [1:0] axi4frag_auto_in_rresp;
  wire [2:0] axi4frag_auto_in_recho_extra_id;
  wire  axi4frag_auto_in_rlast;
  wire  axi4frag_auto_out_awready;
  wire  axi4frag_auto_out_awvalid;
  wire  axi4frag_auto_out_awid;
  wire [31:0] axi4frag_auto_out_awaddr;
  wire [7:0] axi4frag_auto_out_awlen;
  wire [2:0] axi4frag_auto_out_awsize;
  wire [2:0] axi4frag_auto_out_awecho_extra_id;
  wire  axi4frag_auto_out_awecho_real_last;
  wire  axi4frag_auto_out_wready;
  wire  axi4frag_auto_out_wvalid;
  wire [63:0] axi4frag_auto_out_wdata;
  wire [7:0] axi4frag_auto_out_wstrb;
  wire  axi4frag_auto_out_wlast;
  wire  axi4frag_auto_out_bready;
  wire  axi4frag_auto_out_bvalid;
  wire  axi4frag_auto_out_bid;
  wire [1:0] axi4frag_auto_out_bresp;
  wire [2:0] axi4frag_auto_out_becho_extra_id;
  wire  axi4frag_auto_out_becho_real_last;
  wire  axi4frag_auto_out_arready;
  wire  axi4frag_auto_out_arvalid;
  wire  axi4frag_auto_out_arid;
  wire [31:0] axi4frag_auto_out_araddr;
  wire [7:0] axi4frag_auto_out_arlen;
  wire [2:0] axi4frag_auto_out_arsize;
  wire [2:0] axi4frag_auto_out_arecho_extra_id;
  wire  axi4frag_auto_out_arecho_real_last;
  wire  axi4frag_auto_out_rready;
  wire  axi4frag_auto_out_rvalid;
  wire  axi4frag_auto_out_rid;
  wire [63:0] axi4frag_auto_out_rdata;
  wire [1:0] axi4frag_auto_out_rresp;
  wire [2:0] axi4frag_auto_out_recho_extra_id;
  wire  axi4frag_auto_out_recho_real_last;
  wire  axi4frag_auto_out_rlast;
  wire  axi4index_auto_in_awready;
  wire  axi4index_auto_in_awvalid;
  wire [3:0] axi4index_auto_in_awid;
  wire [31:0] axi4index_auto_in_awaddr;
  wire [7:0] axi4index_auto_in_awlen;
  wire [2:0] axi4index_auto_in_awsize;
  wire [1:0] axi4index_auto_in_awburst;
  wire  axi4index_auto_in_wready;
  wire  axi4index_auto_in_wvalid;
  wire [63:0] axi4index_auto_in_wdata;
  wire [7:0] axi4index_auto_in_wstrb;
  wire  axi4index_auto_in_wlast;
  wire  axi4index_auto_in_bready;
  wire  axi4index_auto_in_bvalid;
  wire [3:0] axi4index_auto_in_bid;
  wire [1:0] axi4index_auto_in_bresp;
  wire  axi4index_auto_in_arready;
  wire  axi4index_auto_in_arvalid;
  wire [3:0] axi4index_auto_in_arid;
  wire [31:0] axi4index_auto_in_araddr;
  wire [7:0] axi4index_auto_in_arlen;
  wire [2:0] axi4index_auto_in_arsize;
  wire [1:0] axi4index_auto_in_arburst;
  wire  axi4index_auto_in_rready;
  wire  axi4index_auto_in_rvalid;
  wire [3:0] axi4index_auto_in_rid;
  wire [63:0] axi4index_auto_in_rdata;
  wire [1:0] axi4index_auto_in_rresp;
  wire  axi4index_auto_in_rlast;
  wire  axi4index_auto_out_awready;
  wire  axi4index_auto_out_awvalid;
  wire  axi4index_auto_out_awid;
  wire [31:0] axi4index_auto_out_awaddr;
  wire [7:0] axi4index_auto_out_awlen;
  wire [2:0] axi4index_auto_out_awsize;
  wire [1:0] axi4index_auto_out_awburst;
  wire [2:0] axi4index_auto_out_awecho_extra_id;
  wire  axi4index_auto_out_wready;
  wire  axi4index_auto_out_wvalid;
  wire [63:0] axi4index_auto_out_wdata;
  wire [7:0] axi4index_auto_out_wstrb;
  wire  axi4index_auto_out_wlast;
  wire  axi4index_auto_out_bready;
  wire  axi4index_auto_out_bvalid;
  wire  axi4index_auto_out_bid;
  wire [1:0] axi4index_auto_out_bresp;
  wire [2:0] axi4index_auto_out_becho_extra_id;
  wire  axi4index_auto_out_arready;
  wire  axi4index_auto_out_arvalid;
  wire  axi4index_auto_out_arid;
  wire [31:0] axi4index_auto_out_araddr;
  wire [7:0] axi4index_auto_out_arlen;
  wire [2:0] axi4index_auto_out_arsize;
  wire [1:0] axi4index_auto_out_arburst;
  wire [2:0] axi4index_auto_out_arecho_extra_id;
  wire  axi4index_auto_out_rready;
  wire  axi4index_auto_out_rvalid;
  wire  axi4index_auto_out_rid;
  wire [63:0] axi4index_auto_out_rdata;
  wire [1:0] axi4index_auto_out_rresp;
  wire [2:0] axi4index_auto_out_recho_extra_id;
  wire  axi4index_auto_out_rlast;
  wire  axi4yank_1_clock;
  wire  axi4yank_1_reset;
  wire  axi4yank_1_auto_in_awready;
  wire  axi4yank_1_auto_in_awvalid;
  wire [3:0] axi4yank_1_auto_in_awid;
  wire [31:0] axi4yank_1_auto_in_awaddr;
  wire [7:0] axi4yank_1_auto_in_awlen;
  wire [2:0] axi4yank_1_auto_in_awsize;
  wire [1:0] axi4yank_1_auto_in_awburst;
  wire [3:0] axi4yank_1_auto_in_awecho_tl_state_size;
  wire [6:0] axi4yank_1_auto_in_awecho_tl_state_source;
  wire  axi4yank_1_auto_in_awecho_extra_id;
  wire  axi4yank_1_auto_in_wready;
  wire  axi4yank_1_auto_in_wvalid;
  wire [63:0] axi4yank_1_auto_in_wdata;
  wire [7:0] axi4yank_1_auto_in_wstrb;
  wire  axi4yank_1_auto_in_wlast;
  wire  axi4yank_1_auto_in_bready;
  wire  axi4yank_1_auto_in_bvalid;
  wire [3:0] axi4yank_1_auto_in_bid;
  wire [1:0] axi4yank_1_auto_in_bresp;
  wire [3:0] axi4yank_1_auto_in_becho_tl_state_size;
  wire [6:0] axi4yank_1_auto_in_becho_tl_state_source;
  wire  axi4yank_1_auto_in_becho_extra_id;
  wire  axi4yank_1_auto_in_arready;
  wire  axi4yank_1_auto_in_arvalid;
  wire [3:0] axi4yank_1_auto_in_arid;
  wire [31:0] axi4yank_1_auto_in_araddr;
  wire [7:0] axi4yank_1_auto_in_arlen;
  wire [2:0] axi4yank_1_auto_in_arsize;
  wire [1:0] axi4yank_1_auto_in_arburst;
  wire [3:0] axi4yank_1_auto_in_arecho_tl_state_size;
  wire [6:0] axi4yank_1_auto_in_arecho_tl_state_source;
  wire  axi4yank_1_auto_in_arecho_extra_id;
  wire  axi4yank_1_auto_in_rready;
  wire  axi4yank_1_auto_in_rvalid;
  wire [3:0] axi4yank_1_auto_in_rid;
  wire [63:0] axi4yank_1_auto_in_rdata;
  wire [1:0] axi4yank_1_auto_in_rresp;
  wire [3:0] axi4yank_1_auto_in_recho_tl_state_size;
  wire [6:0] axi4yank_1_auto_in_recho_tl_state_source;
  wire  axi4yank_1_auto_in_recho_extra_id;
  wire  axi4yank_1_auto_in_rlast;


  wire  axi4yank_1_auto_out_awready;
  wire  axi4yank_1_auto_out_awvalid;
  wire [3:0] axi4yank_1_auto_out_awid;
  wire [31:0] axi4yank_1_auto_out_awaddr;
  wire [7:0] axi4yank_1_auto_out_awlen;
  wire [2:0] axi4yank_1_auto_out_awsize;
  wire [1:0] axi4yank_1_auto_out_awburst;
  wire  axi4yank_1_auto_out_wready;
  wire  axi4yank_1_auto_out_wvalid;
  wire [63:0] axi4yank_1_auto_out_wdata;
  wire [7:0] axi4yank_1_auto_out_wstrb;
  wire  axi4yank_1_auto_out_wlast;
  wire  axi4yank_1_auto_out_bready;
  wire  axi4yank_1_auto_out_bvalid;
  wire [3:0] axi4yank_1_auto_out_bid;
  wire [1:0] axi4yank_1_auto_out_bresp;
  wire  axi4yank_1_auto_out_arready;
  wire  axi4yank_1_auto_out_arvalid;
  wire [3:0] axi4yank_1_auto_out_arid;
  wire [31:0] axi4yank_1_auto_out_araddr;
  wire [7:0] axi4yank_1_auto_out_arlen;
  wire [2:0] axi4yank_1_auto_out_arsize;
  wire [1:0] axi4yank_1_auto_out_arburst;
  wire  axi4yank_1_auto_out_rready;
  wire  axi4yank_1_auto_out_rvalid;
  wire [3:0] axi4yank_1_auto_out_rid;
  wire [63:0] axi4yank_1_auto_out_rdata;
  wire [1:0] axi4yank_1_auto_out_rresp;
  wire  axi4yank_1_auto_out_rlast;

  wire  axi4index_1_axi4yank_1_buf_awready;
  wire  axi4index_1_axi4yank_1_buf_awvalid;
  wire [3:0] axi4index_1_axi4yank_1_buf_awid;
  wire [31:0] axi4index_1_axi4yank_1_buf_awaddr;
  wire [7:0] axi4index_1_axi4yank_1_buf_awlen;
  wire [2:0] axi4index_1_axi4yank_1_buf_awsize;
  wire [1:0] axi4index_1_axi4yank_1_buf_awburst;
  wire  axi4index_1_axi4yank_1_buf_wready;
  wire  axi4index_1_axi4yank_1_buf_wvalid;
  wire [63:0] axi4index_1_axi4yank_1_buf_wdata;
  wire [7:0] axi4index_1_axi4yank_1_buf_wstrb;
  wire  axi4index_1_axi4yank_1_buf_wlast;
  wire  axi4index_1_axi4yank_1_buf_bready;
  wire  axi4index_1_axi4yank_1_buf_bvalid;
  wire [3:0] axi4index_1_axi4yank_1_buf_bid;
  wire [1:0] axi4index_1_axi4yank_1_buf_bresp;
  wire  axi4index_1_axi4yank_1_buf_arready;
  wire  axi4index_1_axi4yank_1_buf_arvalid;
  wire [3:0] axi4index_1_axi4yank_1_buf_arid;
  wire [31:0] axi4index_1_axi4yank_1_buf_araddr;
  wire [7:0] axi4index_1_axi4yank_1_buf_arlen;
  wire [2:0] axi4index_1_axi4yank_1_buf_arsize;
  wire [1:0] axi4index_1_axi4yank_1_buf_arburst;
  wire  axi4index_1_axi4yank_1_buf_rready;
  wire  axi4index_1_axi4yank_1_buf_rvalid;
  wire [3:0] axi4index_1_axi4yank_1_buf_rid;
  wire [63:0] axi4index_1_axi4yank_1_buf_rdata;
  wire [1:0] axi4index_1_axi4yank_1_buf_rresp;
  wire  axi4index_1_axi4yank_1_buf_rlast;

  wire  axi4index_1_auto_in_awready;
  wire  axi4index_1_auto_in_awvalid;
  wire [4:0] axi4index_1_auto_in_awid;
  wire [31:0] axi4index_1_auto_in_awaddr;
  wire [7:0] axi4index_1_auto_in_awlen;
  wire [2:0] axi4index_1_auto_in_awsize;
  wire [1:0] axi4index_1_auto_in_awburst;
  wire [3:0] axi4index_1_auto_in_awecho_tl_state_size;
  wire [6:0] axi4index_1_auto_in_awecho_tl_state_source;
  wire  axi4index_1_auto_in_wready;
  wire  axi4index_1_auto_in_wvalid;
  wire [63:0] axi4index_1_auto_in_wdata;
  wire [7:0] axi4index_1_auto_in_wstrb;
  wire  axi4index_1_auto_in_wlast;
  wire  axi4index_1_auto_in_bready;
  wire  axi4index_1_auto_in_bvalid;
  wire [4:0] axi4index_1_auto_in_bid;
  wire [1:0] axi4index_1_auto_in_bresp;
  wire [3:0] axi4index_1_auto_in_becho_tl_state_size;
  wire [6:0] axi4index_1_auto_in_becho_tl_state_source;
  wire  axi4index_1_auto_in_arready;
  wire  axi4index_1_auto_in_arvalid;
  wire [4:0] axi4index_1_auto_in_arid;
  wire [31:0] axi4index_1_auto_in_araddr;
  wire [7:0] axi4index_1_auto_in_arlen;
  wire [2:0] axi4index_1_auto_in_arsize;
  wire [1:0] axi4index_1_auto_in_arburst;
  wire [3:0] axi4index_1_auto_in_arecho_tl_state_size;
  wire [6:0] axi4index_1_auto_in_arecho_tl_state_source;
  wire  axi4index_1_auto_in_rready;
  wire  axi4index_1_auto_in_rvalid;
  wire [4:0] axi4index_1_auto_in_rid;
  wire [63:0] axi4index_1_auto_in_rdata;
  wire [1:0] axi4index_1_auto_in_rresp;
  wire [3:0] axi4index_1_auto_in_recho_tl_state_size;
  wire [6:0] axi4index_1_auto_in_recho_tl_state_source;
  wire  axi4index_1_auto_in_rlast;
  wire  axi4index_1_auto_out_awready;
  wire  axi4index_1_auto_out_awvalid;
  wire [3:0] axi4index_1_auto_out_awid;
  wire [31:0] axi4index_1_auto_out_awaddr;
  wire [7:0] axi4index_1_auto_out_awlen;
  wire [2:0] axi4index_1_auto_out_awsize;
  wire [1:0] axi4index_1_auto_out_awburst;
  wire [3:0] axi4index_1_auto_out_awecho_tl_state_size;
  wire [6:0] axi4index_1_auto_out_awecho_tl_state_source;
  wire  axi4index_1_auto_out_awecho_extra_id;
  wire  axi4index_1_auto_out_wready;
  wire  axi4index_1_auto_out_wvalid;
  wire [63:0] axi4index_1_auto_out_wdata;
  wire [7:0] axi4index_1_auto_out_wstrb;
  wire  axi4index_1_auto_out_wlast;
  wire  axi4index_1_auto_out_bready;
  wire  axi4index_1_auto_out_bvalid;
  wire [3:0] axi4index_1_auto_out_bid;
  wire [1:0] axi4index_1_auto_out_bresp;
  wire [3:0] axi4index_1_auto_out_becho_tl_state_size;
  wire [6:0] axi4index_1_auto_out_becho_tl_state_source;
  wire  axi4index_1_auto_out_becho_extra_id;
  wire  axi4index_1_auto_out_arready;
  wire  axi4index_1_auto_out_arvalid;
  wire [3:0] axi4index_1_auto_out_arid;
  wire [31:0] axi4index_1_auto_out_araddr;
  wire [7:0] axi4index_1_auto_out_arlen;
  wire [2:0] axi4index_1_auto_out_arsize;
  wire [1:0] axi4index_1_auto_out_arburst;
  wire [3:0] axi4index_1_auto_out_arecho_tl_state_size;
  wire [6:0] axi4index_1_auto_out_arecho_tl_state_source;
  wire  axi4index_1_auto_out_arecho_extra_id;
  wire  axi4index_1_auto_out_rready;
  wire  axi4index_1_auto_out_rvalid;
  wire [3:0] axi4index_1_auto_out_rid;
  wire [63:0] axi4index_1_auto_out_rdata;
  wire [1:0] axi4index_1_auto_out_rresp;
  wire [3:0] axi4index_1_auto_out_recho_tl_state_size;
  wire [6:0] axi4index_1_auto_out_recho_tl_state_source;
  wire  axi4index_1_auto_out_recho_extra_id;
  wire  axi4index_1_auto_out_rlast;
  wire  tl2axi4_clock;
  wire  tl2axi4_reset;
  wire  tl2axi4_auto_in_a_ready;
  wire  tl2axi4_auto_in_a_valid;
  wire [2:0] tl2axi4_auto_in_a_bits_opcode;
  wire [2:0] tl2axi4_auto_in_a_bits_param;
  wire [2:0] tl2axi4_auto_in_a_bits_size;
  wire [6:0] tl2axi4_auto_in_a_bits_source;
  wire [31:0] tl2axi4_auto_in_a_bits_address;
  wire [7:0] tl2axi4_auto_in_a_bits_mask;
  wire [63:0] tl2axi4_auto_in_a_bits_data;
  wire  tl2axi4_auto_in_a_bits_corrupt;
  wire  tl2axi4_auto_in_d_ready;
  wire  tl2axi4_auto_in_d_valid;
  wire [2:0] tl2axi4_auto_in_d_bits_opcode;
  wire [2:0] tl2axi4_auto_in_d_bits_size;
  wire [6:0] tl2axi4_auto_in_d_bits_source;
  wire  tl2axi4_auto_in_d_bits_denied;
  wire [63:0] tl2axi4_auto_in_d_bits_data;
  wire  tl2axi4_auto_in_d_bits_corrupt;
  wire  tl2axi4_auto_out_awready;
  wire  tl2axi4_auto_out_awvalid;
  wire [4:0] tl2axi4_auto_out_awid;
  wire [31:0] tl2axi4_auto_out_awaddr;
  wire [7:0] tl2axi4_auto_out_awlen;
  wire [2:0] tl2axi4_auto_out_awsize;
  wire [1:0] tl2axi4_auto_out_awburst;
  wire [3:0] tl2axi4_auto_out_awecho_tl_state_size;
  wire [6:0] tl2axi4_auto_out_awecho_tl_state_source;
  wire  tl2axi4_auto_out_wready;
  wire  tl2axi4_auto_out_wvalid;
  wire [63:0] tl2axi4_auto_out_wdata;
  wire [7:0] tl2axi4_auto_out_wstrb;
  wire  tl2axi4_auto_out_wlast;
  wire  tl2axi4_auto_out_bready;
  wire  tl2axi4_auto_out_bvalid;
  wire [4:0] tl2axi4_auto_out_bid;
  wire [1:0] tl2axi4_auto_out_bresp;
  wire [3:0] tl2axi4_auto_out_becho_tl_state_size;
  wire [6:0] tl2axi4_auto_out_becho_tl_state_source;
  wire  tl2axi4_auto_out_arready;
  wire  tl2axi4_auto_out_arvalid;
  wire [4:0] tl2axi4_auto_out_arid;
  wire [31:0] tl2axi4_auto_out_araddr;
  wire [7:0] tl2axi4_auto_out_arlen;
  wire [2:0] tl2axi4_auto_out_arsize;
  wire [1:0] tl2axi4_auto_out_arburst;
  wire [3:0] tl2axi4_auto_out_arecho_tl_state_size;
  wire [6:0] tl2axi4_auto_out_arecho_tl_state_source;
  wire  tl2axi4_auto_out_rready;
  wire  tl2axi4_auto_out_rvalid;
  wire [4:0] tl2axi4_auto_out_rid;
  wire [63:0] tl2axi4_auto_out_rdata;
  wire [1:0] tl2axi4_auto_out_rresp;
  wire [3:0] tl2axi4_auto_out_recho_tl_state_size;
  wire [6:0] tl2axi4_auto_out_recho_tl_state_source;
  wire  tl2axi4_auto_out_rlast;

  wire  tl2axi4_axi4index_1_buf_awready;
  wire  tl2axi4_axi4index_1_buf_awvalid;
  wire [4:0] tl2axi4_axi4index_1_buf_awid;
  wire [31:0] tl2axi4_axi4index_1_buf_awaddr;
  wire [7:0] tl2axi4_axi4index_1_buf_awlen;
  wire [2:0] tl2axi4_axi4index_1_buf_awsize;
  wire [1:0] tl2axi4_axi4index_1_buf_awburst;
  wire [3:0] tl2axi4_axi4index_1_buf_awecho_tl_state_size;
  wire [6:0] tl2axi4_axi4index_1_buf_awecho_tl_state_source;
  wire  tl2axi4_axi4index_1_buf_wready;
  wire  tl2axi4_axi4index_1_buf_wvalid;
  wire [63:0] tl2axi4_axi4index_1_buf_wdata;
  wire [7:0] tl2axi4_axi4index_1_buf_wstrb;
  wire  tl2axi4_axi4index_1_buf_wlast;
  wire  tl2axi4_axi4index_1_buf_bready;
  wire  tl2axi4_axi4index_1_buf_bvalid;
  wire [4:0] tl2axi4_axi4index_1_buf_bid;
  wire [1:0] tl2axi4_axi4index_1_buf_bresp;
  wire [3:0] tl2axi4_axi4index_1_buf_becho_tl_state_size;
  wire [6:0] tl2axi4_axi4index_1_buf_becho_tl_state_source;
  wire  tl2axi4_axi4index_1_buf_arready;
  wire  tl2axi4_axi4index_1_buf_arvalid;
  wire [4:0] tl2axi4_axi4index_1_buf_arid;
  wire [31:0] tl2axi4_axi4index_1_buf_araddr;
  wire [7:0] tl2axi4_axi4index_1_buf_arlen;
  wire [2:0] tl2axi4_axi4index_1_buf_arsize;
  wire [1:0] tl2axi4_axi4index_1_buf_arburst;
  wire [3:0] tl2axi4_axi4index_1_buf_arecho_tl_state_size;
  wire [6:0] tl2axi4_axi4index_1_buf_arecho_tl_state_source;
  wire  tl2axi4_axi4index_1_buf_rready;
  wire  tl2axi4_axi4index_1_buf_rvalid;
  wire [4:0] tl2axi4_axi4index_1_buf_rid;
  wire [63:0] tl2axi4_axi4index_1_buf_rdata;
  wire [1:0] tl2axi4_axi4index_1_buf_rresp;
  wire [3:0] tl2axi4_axi4index_1_buf_recho_tl_state_size;
  wire [6:0] tl2axi4_axi4index_1_buf_recho_tl_state_source;
  wire  tl2axi4_axi4index_1_buf_rlast;


  wire  err_clock;
  wire  err_reset;
  wire  err_auto_in_a_ready;
  wire  err_auto_in_a_valid;
  wire [2:0] err_auto_in_a_bits_opcode;
  wire [2:0] err_auto_in_a_bits_param;
  wire [2:0] err_auto_in_a_bits_size;
  wire [6:0] err_auto_in_a_bits_source;
  wire [12:0] err_auto_in_a_bits_address;
  wire [3:0] err_auto_in_a_bits_mask;
  wire  err_auto_in_a_bits_corrupt;
  wire  err_auto_in_c_ready;
  wire  err_auto_in_c_valid;
  wire [2:0] err_auto_in_c_bits_opcode;
  wire [2:0] err_auto_in_c_bits_param;
  wire [2:0] err_auto_in_c_bits_size;
  wire [6:0] err_auto_in_c_bits_source;
  wire [12:0] err_auto_in_c_bits_address;
  wire  err_auto_in_d_ready;
  wire  err_auto_in_d_valid;
  wire [2:0] err_auto_in_d_bits_opcode;
  wire [1:0] err_auto_in_d_bits_param;
  wire [2:0] err_auto_in_d_bits_size;
  wire [6:0] err_auto_in_d_bits_source;
  wire  err_auto_in_d_bits_denied;
  wire  err_auto_in_d_bits_corrupt;
  wire  err_auto_in_e_valid;
  wire  atomics_clock;
  wire  atomics_reset;
  wire  atomics_auto_in_a_ready;
  wire  atomics_auto_in_a_valid;
  wire [2:0] atomics_auto_in_a_bits_opcode;
  wire [2:0] atomics_auto_in_a_bits_param;
  wire [2:0] atomics_auto_in_a_bits_size;
  wire [6:0] atomics_auto_in_a_bits_source;
  wire [31:0] atomics_auto_in_a_bits_address;
  wire [7:0] atomics_auto_in_a_bits_mask;
  wire [63:0] atomics_auto_in_a_bits_data;
  wire  atomics_auto_in_c_ready;
  wire  atomics_auto_in_c_valid;
  wire [2:0] atomics_auto_in_c_bits_opcode;
  wire [2:0] atomics_auto_in_c_bits_param;
  wire [2:0] atomics_auto_in_c_bits_size;
  wire [6:0] atomics_auto_in_c_bits_source;
  wire [31:0] atomics_auto_in_c_bits_address;
  wire  atomics_auto_in_d_ready;
  wire  atomics_auto_in_d_valid;
  wire [2:0] atomics_auto_in_d_bits_opcode;
  wire [1:0] atomics_auto_in_d_bits_param;
  wire [2:0] atomics_auto_in_d_bits_size;
  wire [6:0] atomics_auto_in_d_bits_source;
  wire  atomics_auto_in_d_bits_denied;
  wire [63:0] atomics_auto_in_d_bits_data;
  wire  atomics_auto_in_d_bits_corrupt;
  wire  atomics_auto_in_e_ready;
  wire  atomics_auto_in_e_valid;
  wire  atomics_auto_in_e_bits_sink;
  wire  atomics_auto_out_a_ready;
  wire  atomics_auto_out_a_valid;
  wire [2:0] atomics_auto_out_a_bits_opcode;
  wire [2:0] atomics_auto_out_a_bits_param;
  wire [2:0] atomics_auto_out_a_bits_size;
  wire [6:0] atomics_auto_out_a_bits_source;
  wire [31:0] atomics_auto_out_a_bits_address;
  wire [7:0] atomics_auto_out_a_bits_mask;
  wire [63:0] atomics_auto_out_a_bits_data;
  wire  atomics_auto_out_a_bits_corrupt;
  wire  atomics_auto_out_c_ready;
  wire  atomics_auto_out_c_valid;
  wire [2:0] atomics_auto_out_c_bits_opcode;
  wire [2:0] atomics_auto_out_c_bits_param;
  wire [2:0] atomics_auto_out_c_bits_size;
  wire [6:0] atomics_auto_out_c_bits_source;
  wire [31:0] atomics_auto_out_c_bits_address;
  wire  atomics_auto_out_d_ready;
  wire  atomics_auto_out_d_valid;
  wire [2:0] atomics_auto_out_d_bits_opcode;
  wire [1:0] atomics_auto_out_d_bits_param;
  wire [2:0] atomics_auto_out_d_bits_size;
  wire [6:0] atomics_auto_out_d_bits_source;
  wire  atomics_auto_out_d_bits_denied;
  wire [63:0] atomics_auto_out_d_bits_data;
  wire  atomics_auto_out_d_bits_corrupt;
  wire  atomics_auto_out_e_ready;
  wire  atomics_auto_out_e_valid;
  wire  atomics_auto_out_e_bits_sink;
  wire  fixer_1_clock;
  wire  fixer_1_reset;
  wire  fixer_1_auto_in_a_ready;
  wire  fixer_1_auto_in_a_valid;
  wire [2:0] fixer_1_auto_in_a_bits_opcode;
  wire [2:0] fixer_1_auto_in_a_bits_param;
  wire [2:0] fixer_1_auto_in_a_bits_size;
  wire [6:0] fixer_1_auto_in_a_bits_source;
  wire [31:0] fixer_1_auto_in_a_bits_address;
  wire [7:0] fixer_1_auto_in_a_bits_mask;
  wire [63:0] fixer_1_auto_in_a_bits_data;
  wire  fixer_1_auto_in_c_ready;
  wire  fixer_1_auto_in_c_valid;
  wire [2:0] fixer_1_auto_in_c_bits_opcode;
  wire [2:0] fixer_1_auto_in_c_bits_param;
  wire [2:0] fixer_1_auto_in_c_bits_size;
  wire [6:0] fixer_1_auto_in_c_bits_source;
  wire [31:0] fixer_1_auto_in_c_bits_address;
  wire  fixer_1_auto_in_d_ready;
  wire  fixer_1_auto_in_d_valid;
  wire [2:0] fixer_1_auto_in_d_bits_opcode;
  wire [1:0] fixer_1_auto_in_d_bits_param;
  wire [2:0] fixer_1_auto_in_d_bits_size;
  wire [6:0] fixer_1_auto_in_d_bits_source;
  wire  fixer_1_auto_in_d_bits_denied;
  wire [63:0] fixer_1_auto_in_d_bits_data;
  wire  fixer_1_auto_in_d_bits_corrupt;
  wire  fixer_1_auto_in_e_ready;
  wire  fixer_1_auto_in_e_valid;
  wire  fixer_1_auto_in_e_bits_sink;
  wire  fixer_1_auto_out_a_ready;
  wire  fixer_1_auto_out_a_valid;
  wire [2:0] fixer_1_auto_out_a_bits_opcode;
  wire [2:0] fixer_1_auto_out_a_bits_param;
  wire [2:0] fixer_1_auto_out_a_bits_size;
  wire [6:0] fixer_1_auto_out_a_bits_source;
  wire [31:0] fixer_1_auto_out_a_bits_address;
  wire [7:0] fixer_1_auto_out_a_bits_mask;
  wire [63:0] fixer_1_auto_out_a_bits_data;
  wire  fixer_1_auto_out_c_ready;
  wire  fixer_1_auto_out_c_valid;
  wire [2:0] fixer_1_auto_out_c_bits_opcode;
  wire [2:0] fixer_1_auto_out_c_bits_param;
  wire [2:0] fixer_1_auto_out_c_bits_size;
  wire [6:0] fixer_1_auto_out_c_bits_source;
  wire [31:0] fixer_1_auto_out_c_bits_address;
  wire  fixer_1_auto_out_d_ready;
  wire  fixer_1_auto_out_d_valid;
  wire [2:0] fixer_1_auto_out_d_bits_opcode;
  wire [1:0] fixer_1_auto_out_d_bits_param;
  wire [2:0] fixer_1_auto_out_d_bits_size;
  wire [6:0] fixer_1_auto_out_d_bits_source;
  wire  fixer_1_auto_out_d_bits_denied;
  wire [63:0] fixer_1_auto_out_d_bits_data;
  wire  fixer_1_auto_out_d_bits_corrupt;
  wire  fixer_1_auto_out_e_ready;
  wire  fixer_1_auto_out_e_valid;
  wire  fixer_1_auto_out_e_bits_sink;
  wire  hints_clock;
  wire  hints_reset;
  wire  hints_auto_in_a_ready;
  wire  hints_auto_in_a_valid;
  wire [2:0] hints_auto_in_a_bits_opcode;
  wire [2:0] hints_auto_in_a_bits_param;
  wire [2:0] hints_auto_in_a_bits_size;
  wire [5:0] hints_auto_in_a_bits_source;
  wire [31:0] hints_auto_in_a_bits_address;
  wire [7:0] hints_auto_in_a_bits_mask;
  wire [63:0] hints_auto_in_a_bits_data;
  wire  hints_auto_in_c_ready;
  wire  hints_auto_in_c_valid;
  wire [2:0] hints_auto_in_c_bits_opcode;
  wire [2:0] hints_auto_in_c_bits_param;
  wire [2:0] hints_auto_in_c_bits_size;
  wire [5:0] hints_auto_in_c_bits_source;
  wire [31:0] hints_auto_in_c_bits_address;
  wire  hints_auto_in_d_ready;
  wire  hints_auto_in_d_valid;
  wire [2:0] hints_auto_in_d_bits_opcode;
  wire [1:0] hints_auto_in_d_bits_param;
  wire [2:0] hints_auto_in_d_bits_size;
  wire [5:0] hints_auto_in_d_bits_source;
  wire  hints_auto_in_d_bits_denied;
  wire [63:0] hints_auto_in_d_bits_data;
  wire  hints_auto_in_d_bits_corrupt;
  wire  hints_auto_in_e_ready;
  wire  hints_auto_in_e_valid;
  wire  hints_auto_in_e_bits_sink;
  wire  hints_auto_out_a_ready;
  wire  hints_auto_out_a_valid;
  wire [2:0] hints_auto_out_a_bits_opcode;
  wire [2:0] hints_auto_out_a_bits_param;
  wire [2:0] hints_auto_out_a_bits_size;
  wire [6:0] hints_auto_out_a_bits_source;
  wire [31:0] hints_auto_out_a_bits_address;
  wire [7:0] hints_auto_out_a_bits_mask;
  wire [63:0] hints_auto_out_a_bits_data;
  wire  hints_auto_out_c_ready;
  wire  hints_auto_out_c_valid;
  wire [2:0] hints_auto_out_c_bits_opcode;
  wire [2:0] hints_auto_out_c_bits_param;
  wire [2:0] hints_auto_out_c_bits_size;
  wire [6:0] hints_auto_out_c_bits_source;
  wire [31:0] hints_auto_out_c_bits_address;
  wire  hints_auto_out_d_ready;
  wire  hints_auto_out_d_valid;
  wire [2:0] hints_auto_out_d_bits_opcode;
  wire [1:0] hints_auto_out_d_bits_param;
  wire [2:0] hints_auto_out_d_bits_size;
  wire [6:0] hints_auto_out_d_bits_source;
  wire  hints_auto_out_d_bits_denied;
  wire [63:0] hints_auto_out_d_bits_data;
  wire  hints_auto_out_d_bits_corrupt;
  wire  hints_auto_out_e_ready;
  wire  hints_auto_out_e_valid;
  wire  hints_auto_out_e_bits_sink;
  wire  widget_1_clock;
  wire  widget_1_reset;
  wire  widget_1_auto_in_a_ready;
  wire  widget_1_auto_in_a_valid;
  wire [2:0] widget_1_auto_in_a_bits_opcode;
  wire [2:0] widget_1_auto_in_a_bits_param;
  wire [2:0] widget_1_auto_in_a_bits_size;
  wire [5:0] widget_1_auto_in_a_bits_source;
  wire [31:0] widget_1_auto_in_a_bits_address;
  wire [3:0] widget_1_auto_in_a_bits_mask;
  wire [31:0] widget_1_auto_in_a_bits_data;
  wire  widget_1_auto_in_c_ready;
  wire  widget_1_auto_in_c_valid;
  wire [2:0] widget_1_auto_in_c_bits_opcode;
  wire [2:0] widget_1_auto_in_c_bits_param;
  wire [2:0] widget_1_auto_in_c_bits_size;
  wire [5:0] widget_1_auto_in_c_bits_source;
  wire [31:0] widget_1_auto_in_c_bits_address;
  wire  widget_1_auto_in_d_ready;
  wire  widget_1_auto_in_d_valid;
  wire [2:0] widget_1_auto_in_d_bits_opcode;
  wire [1:0] widget_1_auto_in_d_bits_param;
  wire [2:0] widget_1_auto_in_d_bits_size;
  wire [5:0] widget_1_auto_in_d_bits_source;
  wire  widget_1_auto_in_d_bits_denied;
  wire [31:0] widget_1_auto_in_d_bits_data;
  wire  widget_1_auto_in_d_bits_corrupt;
  wire  widget_1_auto_in_e_ready;
  wire  widget_1_auto_in_e_valid;
  wire  widget_1_auto_in_e_bits_sink;
  wire  widget_1_auto_out_a_ready;
  wire  widget_1_auto_out_a_valid;
  wire [2:0] widget_1_auto_out_a_bits_opcode;
  wire [2:0] widget_1_auto_out_a_bits_param;
  wire [2:0] widget_1_auto_out_a_bits_size;
  wire [5:0] widget_1_auto_out_a_bits_source;
  wire [31:0] widget_1_auto_out_a_bits_address;
  wire [7:0] widget_1_auto_out_a_bits_mask;
  wire [63:0] widget_1_auto_out_a_bits_data;
  wire  widget_1_auto_out_c_ready;
  wire  widget_1_auto_out_c_valid;
  wire [2:0] widget_1_auto_out_c_bits_opcode;
  wire [2:0] widget_1_auto_out_c_bits_param;
  wire [2:0] widget_1_auto_out_c_bits_size;
  wire [5:0] widget_1_auto_out_c_bits_source;
  wire [31:0] widget_1_auto_out_c_bits_address;
  wire  widget_1_auto_out_d_ready;
  wire  widget_1_auto_out_d_valid;
  wire [2:0] widget_1_auto_out_d_bits_opcode;
  wire [1:0] widget_1_auto_out_d_bits_param;
  wire [2:0] widget_1_auto_out_d_bits_size;
  wire [5:0] widget_1_auto_out_d_bits_source;
  wire  widget_1_auto_out_d_bits_denied;
  wire [63:0] widget_1_auto_out_d_bits_data;
  wire  widget_1_auto_out_d_bits_corrupt;
  wire  widget_1_auto_out_e_ready;
  wire  widget_1_auto_out_e_valid;
  wire  widget_1_auto_out_e_bits_sink;
  wire  widget_2_clock;
  wire  widget_2_reset;
  wire  widget_2_auto_in_a_ready;
  wire  widget_2_auto_in_a_valid;
  wire [2:0] widget_2_auto_in_a_bits_opcode;
  wire [2:0] widget_2_auto_in_a_bits_param;
  wire [2:0] widget_2_auto_in_a_bits_size;
  wire [6:0] widget_2_auto_in_a_bits_source;
  wire [12:0] widget_2_auto_in_a_bits_address;
  wire [7:0] widget_2_auto_in_a_bits_mask;
  wire  widget_2_auto_in_a_bits_corrupt;
  wire  widget_2_auto_in_c_ready;
  wire  widget_2_auto_in_c_valid;
  wire [2:0] widget_2_auto_in_c_bits_opcode;
  wire [2:0] widget_2_auto_in_c_bits_param;
  wire [2:0] widget_2_auto_in_c_bits_size;
  wire [6:0] widget_2_auto_in_c_bits_source;
  wire [12:0] widget_2_auto_in_c_bits_address;
  wire  widget_2_auto_in_d_ready;
  wire  widget_2_auto_in_d_valid;
  wire [2:0] widget_2_auto_in_d_bits_opcode;
  wire [1:0] widget_2_auto_in_d_bits_param;
  wire [2:0] widget_2_auto_in_d_bits_size;
  wire [6:0] widget_2_auto_in_d_bits_source;
  wire  widget_2_auto_in_d_bits_denied;
  wire  widget_2_auto_in_d_bits_corrupt;
  wire  widget_2_auto_in_e_valid;
  wire  widget_2_auto_out_a_ready;
  wire  widget_2_auto_out_a_valid;
  wire [2:0] widget_2_auto_out_a_bits_opcode;
  wire [2:0] widget_2_auto_out_a_bits_param;
  wire [2:0] widget_2_auto_out_a_bits_size;
  wire [6:0] widget_2_auto_out_a_bits_source;
  wire [12:0] widget_2_auto_out_a_bits_address;
  wire [3:0] widget_2_auto_out_a_bits_mask;
  wire  widget_2_auto_out_a_bits_corrupt;
  wire  widget_2_auto_out_c_ready;
  wire  widget_2_auto_out_c_valid;
  wire [2:0] widget_2_auto_out_c_bits_opcode;
  wire [2:0] widget_2_auto_out_c_bits_param;
  wire [2:0] widget_2_auto_out_c_bits_size;
  wire [6:0] widget_2_auto_out_c_bits_source;
  wire [12:0] widget_2_auto_out_c_bits_address;
  wire  widget_2_auto_out_d_ready;
  wire  widget_2_auto_out_d_valid;
  wire [2:0] widget_2_auto_out_d_bits_opcode;
  wire [1:0] widget_2_auto_out_d_bits_param;
  wire [2:0] widget_2_auto_out_d_bits_size;
  wire [6:0] widget_2_auto_out_d_bits_source;
  wire  widget_2_auto_out_d_bits_denied;
  wire  widget_2_auto_out_d_bits_corrupt;
  wire  widget_2_auto_out_e_valid;
  CHIPLINK_PREFIX_TLXbar xbar (
    .clock(xbar_clock),
    .reset(xbar_reset),
    .auto_in_a_ready(xbar_auto_in_a_ready),
    .auto_in_a_valid(xbar_auto_in_a_valid),
    .auto_in_a_bits_opcode(xbar_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(xbar_auto_in_a_bits_param),
    .auto_in_a_bits_size(xbar_auto_in_a_bits_size),
    .auto_in_a_bits_source(xbar_auto_in_a_bits_source),
    .auto_in_a_bits_address(xbar_auto_in_a_bits_address),
    .auto_in_a_bits_mask(xbar_auto_in_a_bits_mask),
    .auto_in_a_bits_data(xbar_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(xbar_auto_in_a_bits_corrupt),
    .auto_in_c_ready(xbar_auto_in_c_ready),
    .auto_in_c_valid(xbar_auto_in_c_valid),
    .auto_in_c_bits_opcode(xbar_auto_in_c_bits_opcode),
    .auto_in_c_bits_param(xbar_auto_in_c_bits_param),
    .auto_in_c_bits_size(xbar_auto_in_c_bits_size),
    .auto_in_c_bits_source(xbar_auto_in_c_bits_source),
    .auto_in_c_bits_address(xbar_auto_in_c_bits_address),
    .auto_in_d_ready(xbar_auto_in_d_ready),
    .auto_in_d_valid(xbar_auto_in_d_valid),
    .auto_in_d_bits_opcode(xbar_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(xbar_auto_in_d_bits_param),
    .auto_in_d_bits_size(xbar_auto_in_d_bits_size),
    .auto_in_d_bits_source(xbar_auto_in_d_bits_source),
    .auto_in_d_bits_denied(xbar_auto_in_d_bits_denied),
    .auto_in_d_bits_data(xbar_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(xbar_auto_in_d_bits_corrupt),
    .auto_in_e_ready(xbar_auto_in_e_ready),
    .auto_in_e_valid(xbar_auto_in_e_valid),
    .auto_in_e_bits_sink(xbar_auto_in_e_bits_sink),
    .auto_out_1_a_ready(xbar_auto_out_1_a_ready),
    .auto_out_1_a_valid(xbar_auto_out_1_a_valid),
    .auto_out_1_a_bits_opcode(xbar_auto_out_1_a_bits_opcode),
    .auto_out_1_a_bits_param(xbar_auto_out_1_a_bits_param),
    .auto_out_1_a_bits_size(xbar_auto_out_1_a_bits_size),
    .auto_out_1_a_bits_source(xbar_auto_out_1_a_bits_source),
    .auto_out_1_a_bits_address(xbar_auto_out_1_a_bits_address),
    .auto_out_1_a_bits_mask(xbar_auto_out_1_a_bits_mask),
    .auto_out_1_a_bits_corrupt(xbar_auto_out_1_a_bits_corrupt),
    .auto_out_1_c_ready(xbar_auto_out_1_c_ready),
    .auto_out_1_c_valid(xbar_auto_out_1_c_valid),
    .auto_out_1_c_bits_opcode(xbar_auto_out_1_c_bits_opcode),
    .auto_out_1_c_bits_param(xbar_auto_out_1_c_bits_param),
    .auto_out_1_c_bits_size(xbar_auto_out_1_c_bits_size),
    .auto_out_1_c_bits_source(xbar_auto_out_1_c_bits_source),
    .auto_out_1_c_bits_address(xbar_auto_out_1_c_bits_address),
    .auto_out_1_d_ready(xbar_auto_out_1_d_ready),
    .auto_out_1_d_valid(xbar_auto_out_1_d_valid),
    .auto_out_1_d_bits_opcode(xbar_auto_out_1_d_bits_opcode),
    .auto_out_1_d_bits_param(xbar_auto_out_1_d_bits_param),
    .auto_out_1_d_bits_size(xbar_auto_out_1_d_bits_size),
    .auto_out_1_d_bits_source(xbar_auto_out_1_d_bits_source),
    .auto_out_1_d_bits_denied(xbar_auto_out_1_d_bits_denied),
    .auto_out_1_d_bits_corrupt(xbar_auto_out_1_d_bits_corrupt),
    .auto_out_1_e_valid(xbar_auto_out_1_e_valid),
    .auto_out_0_a_ready(xbar_auto_out_0_a_ready),
    .auto_out_0_a_valid(xbar_auto_out_0_a_valid),
    .auto_out_0_a_bits_opcode(xbar_auto_out_0_a_bits_opcode),
    .auto_out_0_a_bits_param(xbar_auto_out_0_a_bits_param),
    .auto_out_0_a_bits_size(xbar_auto_out_0_a_bits_size),
    .auto_out_0_a_bits_source(xbar_auto_out_0_a_bits_source),
    .auto_out_0_a_bits_address(xbar_auto_out_0_a_bits_address),
    .auto_out_0_a_bits_mask(xbar_auto_out_0_a_bits_mask),
    .auto_out_0_a_bits_data(xbar_auto_out_0_a_bits_data),
    .auto_out_0_a_bits_corrupt(xbar_auto_out_0_a_bits_corrupt),
    .auto_out_0_d_ready(xbar_auto_out_0_d_ready),
    .auto_out_0_d_valid(xbar_auto_out_0_d_valid),
    .auto_out_0_d_bits_opcode(xbar_auto_out_0_d_bits_opcode),
    .auto_out_0_d_bits_size(xbar_auto_out_0_d_bits_size),
    .auto_out_0_d_bits_source(xbar_auto_out_0_d_bits_source),
    .auto_out_0_d_bits_denied(xbar_auto_out_0_d_bits_denied),
    .auto_out_0_d_bits_data(xbar_auto_out_0_d_bits_data),
    .auto_out_0_d_bits_corrupt(xbar_auto_out_0_d_bits_corrupt)
  );
  CHIPLINK_PREFIX_TLXbar_1 xbar_1 (
    .clock(xbar_1_clock),
    .reset(xbar_1_reset),
    .auto_in_a_ready(xbar_1_auto_in_a_ready),
    .auto_in_a_valid(xbar_1_auto_in_a_valid),
    .auto_in_a_bits_opcode(xbar_1_auto_in_a_bits_opcode),
    .auto_in_a_bits_size(xbar_1_auto_in_a_bits_size),
    .auto_in_a_bits_source(xbar_1_auto_in_a_bits_source),
    .auto_in_a_bits_address(xbar_1_auto_in_a_bits_address),
    .auto_in_a_bits_mask(xbar_1_auto_in_a_bits_mask),
    .auto_in_a_bits_data(xbar_1_auto_in_a_bits_data),
    .auto_in_d_ready(xbar_1_auto_in_d_ready),
    .auto_in_d_valid(xbar_1_auto_in_d_valid),
    .auto_in_d_bits_opcode(xbar_1_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(xbar_1_auto_in_d_bits_param),
    .auto_in_d_bits_size(xbar_1_auto_in_d_bits_size),
    .auto_in_d_bits_source(xbar_1_auto_in_d_bits_source),
    .auto_in_d_bits_sink(xbar_1_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(xbar_1_auto_in_d_bits_denied),
    .auto_in_d_bits_data(xbar_1_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(xbar_1_auto_in_d_bits_corrupt),
    .auto_out_1_a_ready(xbar_1_auto_out_1_a_ready),
    .auto_out_1_a_valid(xbar_1_auto_out_1_a_valid),
    .auto_out_1_a_bits_opcode(xbar_1_auto_out_1_a_bits_opcode),
    .auto_out_1_a_bits_size(xbar_1_auto_out_1_a_bits_size),
    .auto_out_1_a_bits_source(xbar_1_auto_out_1_a_bits_source),
    .auto_out_1_a_bits_address(xbar_1_auto_out_1_a_bits_address),
    .auto_out_1_a_bits_mask(xbar_1_auto_out_1_a_bits_mask),
    .auto_out_1_d_ready(xbar_1_auto_out_1_d_ready),
    .auto_out_1_d_valid(xbar_1_auto_out_1_d_valid),
    .auto_out_1_d_bits_opcode(xbar_1_auto_out_1_d_bits_opcode),
    .auto_out_1_d_bits_size(xbar_1_auto_out_1_d_bits_size),
    .auto_out_1_d_bits_source(xbar_1_auto_out_1_d_bits_source),
    .auto_out_1_d_bits_denied(xbar_1_auto_out_1_d_bits_denied),
    .auto_out_1_d_bits_corrupt(xbar_1_auto_out_1_d_bits_corrupt),
    .auto_out_0_a_ready(xbar_1_auto_out_0_a_ready),
    .auto_out_0_a_valid(xbar_1_auto_out_0_a_valid),
    .auto_out_0_a_bits_opcode(xbar_1_auto_out_0_a_bits_opcode),
    .auto_out_0_a_bits_size(xbar_1_auto_out_0_a_bits_size),
    .auto_out_0_a_bits_source(xbar_1_auto_out_0_a_bits_source),
    .auto_out_0_a_bits_address(xbar_1_auto_out_0_a_bits_address),
    .auto_out_0_a_bits_mask(xbar_1_auto_out_0_a_bits_mask),
    .auto_out_0_a_bits_data(xbar_1_auto_out_0_a_bits_data),
    .auto_out_0_d_ready(xbar_1_auto_out_0_d_ready),
    .auto_out_0_d_valid(xbar_1_auto_out_0_d_valid),
    .auto_out_0_d_bits_opcode(xbar_1_auto_out_0_d_bits_opcode),
    .auto_out_0_d_bits_param(xbar_1_auto_out_0_d_bits_param),
    .auto_out_0_d_bits_size(xbar_1_auto_out_0_d_bits_size),
    .auto_out_0_d_bits_source(xbar_1_auto_out_0_d_bits_source),
    .auto_out_0_d_bits_sink(xbar_1_auto_out_0_d_bits_sink),
    .auto_out_0_d_bits_denied(xbar_1_auto_out_0_d_bits_denied),
    .auto_out_0_d_bits_data(xbar_1_auto_out_0_d_bits_data),
    .auto_out_0_d_bits_corrupt(xbar_1_auto_out_0_d_bits_corrupt)
  );
  CHIPLINK_PREFIX_TLError ferr (
    .clock(ferr_clock),
    .reset(ferr_reset),
    .auto_in_a_ready(ferr_auto_in_a_ready),
    .auto_in_a_valid(ferr_auto_in_a_valid),
    .auto_in_a_bits_opcode(ferr_auto_in_a_bits_opcode),
    .auto_in_a_bits_size(ferr_auto_in_a_bits_size),
    .auto_in_a_bits_source(ferr_auto_in_a_bits_source),
    .auto_in_a_bits_address(ferr_auto_in_a_bits_address),
    .auto_in_a_bits_mask(ferr_auto_in_a_bits_mask),
    .auto_in_d_ready(ferr_auto_in_d_ready),
    .auto_in_d_valid(ferr_auto_in_d_valid),
    .auto_in_d_bits_opcode(ferr_auto_in_d_bits_opcode),
    .auto_in_d_bits_size(ferr_auto_in_d_bits_size),
    .auto_in_d_bits_source(ferr_auto_in_d_bits_source),
    .auto_in_d_bits_denied(ferr_auto_in_d_bits_denied),
    .auto_in_d_bits_corrupt(ferr_auto_in_d_bits_corrupt)
  );
  CHIPLINK_PREFIX_ChipLink chiplink (
    .clock(chiplink_clock),
    .reset(chiplink_reset),
    .transferDataReg(transferDataReg),
    .send_1p_valid(send_1p_valid),
    .b2c_data_concat(b2c_data_concat),
    .b2c_data_valid(b2c_data_valid),
    .auto_mbypass_out_a_ready(chiplink_auto_mbypass_out_a_ready),
    .auto_mbypass_out_a_valid(chiplink_auto_mbypass_out_a_valid),
    .auto_mbypass_out_a_bits_opcode(chiplink_auto_mbypass_out_a_bits_opcode),
    .auto_mbypass_out_a_bits_param(chiplink_auto_mbypass_out_a_bits_param),
    .auto_mbypass_out_a_bits_size(chiplink_auto_mbypass_out_a_bits_size),
    .auto_mbypass_out_a_bits_source(chiplink_auto_mbypass_out_a_bits_source),
    .auto_mbypass_out_a_bits_address(chiplink_auto_mbypass_out_a_bits_address),
    .auto_mbypass_out_a_bits_mask(chiplink_auto_mbypass_out_a_bits_mask),
    .auto_mbypass_out_a_bits_data(chiplink_auto_mbypass_out_a_bits_data),
    .auto_mbypass_out_c_ready(chiplink_auto_mbypass_out_c_ready),
    .auto_mbypass_out_c_valid(chiplink_auto_mbypass_out_c_valid),
    .auto_mbypass_out_c_bits_opcode(chiplink_auto_mbypass_out_c_bits_opcode),
    .auto_mbypass_out_c_bits_param(chiplink_auto_mbypass_out_c_bits_param),
    .auto_mbypass_out_c_bits_size(chiplink_auto_mbypass_out_c_bits_size),
    .auto_mbypass_out_c_bits_source(chiplink_auto_mbypass_out_c_bits_source),
    .auto_mbypass_out_c_bits_address(chiplink_auto_mbypass_out_c_bits_address),
    .auto_mbypass_out_d_ready(chiplink_auto_mbypass_out_d_ready),
    .auto_mbypass_out_d_valid(chiplink_auto_mbypass_out_d_valid),
    .auto_mbypass_out_d_bits_opcode(chiplink_auto_mbypass_out_d_bits_opcode),
    .auto_mbypass_out_d_bits_param(chiplink_auto_mbypass_out_d_bits_param),
    .auto_mbypass_out_d_bits_size(chiplink_auto_mbypass_out_d_bits_size),
    .auto_mbypass_out_d_bits_source(chiplink_auto_mbypass_out_d_bits_source),
    .auto_mbypass_out_d_bits_denied(chiplink_auto_mbypass_out_d_bits_denied),
    .auto_mbypass_out_d_bits_data(chiplink_auto_mbypass_out_d_bits_data),
    .auto_mbypass_out_d_bits_corrupt(chiplink_auto_mbypass_out_d_bits_corrupt),
    .auto_mbypass_out_e_ready(chiplink_auto_mbypass_out_e_ready),
    .auto_mbypass_out_e_valid(chiplink_auto_mbypass_out_e_valid),
    .auto_mbypass_out_e_bits_sink(chiplink_auto_mbypass_out_e_bits_sink),
`ifdef CHIPLINK_CONNECT_DIRECT_TL
    .auto_sbypass_node_in_in_a_ready(chiplink_auto_sbypass_node_mux_in_a_ready),
    .auto_sbypass_node_in_in_a_valid(widget_auto_out_a_valid),
    .auto_sbypass_node_in_in_a_bits_opcode(widget_auto_out_a_bits_opcode),
    .auto_sbypass_node_in_in_a_bits_size(widget_auto_out_a_bits_size),
    .auto_sbypass_node_in_in_a_bits_source(widget_auto_out_a_bits_source),
    .auto_sbypass_node_in_in_a_bits_address(widget_auto_out_a_bits_address),
    .auto_sbypass_node_in_in_a_bits_mask(widget_auto_out_a_bits_mask),
    .auto_sbypass_node_in_in_a_bits_data(widget_auto_out_a_bits_data),
    .auto_sbypass_node_in_in_d_ready(chiplink_auto_sbypass_node_mux_in_d_ready),
    .auto_sbypass_node_in_in_d_valid(chiplink_auto_sbypass_node_mux_in_d_valid),
    .auto_sbypass_node_in_in_d_bits_opcode(chiplink_auto_sbypass_node_mux_in_d_bits_opcode),
    .auto_sbypass_node_in_in_d_bits_param(chiplink_auto_sbypass_node_mux_in_d_bits_param),
    .auto_sbypass_node_in_in_d_bits_size(chiplink_auto_sbypass_node_mux_in_d_bits_size),
    .auto_sbypass_node_in_in_d_bits_source(chiplink_auto_sbypass_node_mux_in_d_bits_source),
    .auto_sbypass_node_in_in_d_bits_sink(chiplink_auto_sbypass_node_mux_in_d_bits_sink[4:0]),
    .auto_sbypass_node_in_in_d_bits_denied(chiplink_auto_sbypass_node_mux_in_d_bits_denied),
    .auto_sbypass_node_in_in_d_bits_data(chiplink_auto_sbypass_node_mux_in_d_bits_data),
    .auto_sbypass_node_in_in_d_bits_corrupt(chiplink_auto_sbypass_node_mux_in_d_bits_corrupt),
`else
    .auto_sbypass_node_in_in_a_ready(chiplink_auto_sbypass_node_in_in_a_ready),
    .auto_sbypass_node_in_in_a_valid(chiplink_auto_sbypass_node_in_in_a_valid),
    .auto_sbypass_node_in_in_a_bits_opcode(chiplink_auto_sbypass_node_in_in_a_bits_opcode),
    .auto_sbypass_node_in_in_a_bits_size(chiplink_auto_sbypass_node_in_in_a_bits_size),
    .auto_sbypass_node_in_in_a_bits_source(chiplink_auto_sbypass_node_in_in_a_bits_source),
    .auto_sbypass_node_in_in_a_bits_address(chiplink_auto_sbypass_node_in_in_a_bits_address),
    .auto_sbypass_node_in_in_a_bits_mask(chiplink_auto_sbypass_node_in_in_a_bits_mask),
    .auto_sbypass_node_in_in_a_bits_data(chiplink_auto_sbypass_node_in_in_a_bits_data),
    .auto_sbypass_node_in_in_d_ready(chiplink_auto_sbypass_node_in_in_d_ready),
    .auto_sbypass_node_in_in_d_valid(chiplink_auto_sbypass_node_in_in_d_valid),
    .auto_sbypass_node_in_in_d_bits_opcode(chiplink_auto_sbypass_node_in_in_d_bits_opcode),
    .auto_sbypass_node_in_in_d_bits_param(chiplink_auto_sbypass_node_in_in_d_bits_param),
    .auto_sbypass_node_in_in_d_bits_size(chiplink_auto_sbypass_node_in_in_d_bits_size),
    .auto_sbypass_node_in_in_d_bits_source(chiplink_auto_sbypass_node_in_in_d_bits_source),
    .auto_sbypass_node_in_in_d_bits_sink(chiplink_auto_sbypass_node_in_in_d_bits_sink),
    .auto_sbypass_node_in_in_d_bits_denied(chiplink_auto_sbypass_node_in_in_d_bits_denied),
    .auto_sbypass_node_in_in_d_bits_data(chiplink_auto_sbypass_node_in_in_d_bits_data),
    .auto_sbypass_node_in_in_d_bits_corrupt(chiplink_auto_sbypass_node_in_in_d_bits_corrupt),
`endif
    .auto_io_out_c2b_clk(chiplink_auto_io_out_c2b_clk),
    .auto_io_out_c2b_rst(chiplink_auto_io_out_c2b_rst),
    .auto_io_out_c2b_send(chiplink_auto_io_out_c2b_send),
    .auto_io_out_c2b_data(chiplink_auto_io_out_c2b_data),
    .auto_io_out_b2c_clk(chiplink_auto_io_out_b2c_clk),
    .auto_io_out_b2c_rst(chiplink_auto_io_out_b2c_rst),
    .auto_io_out_b2c_send(chiplink_auto_io_out_b2c_send),
    .auto_io_out_b2c_data(chiplink_auto_io_out_b2c_data)
  );
  CHIPLINK_PREFIX_TLFIFOFixer fixer (
    .clock(fixer_clock),
    .reset(fixer_reset),
    .auto_in_a_ready(fixer_auto_in_a_ready),
    .auto_in_a_valid(fixer_auto_in_a_valid),
    .auto_in_a_bits_opcode(fixer_auto_in_a_bits_opcode),
    .auto_in_a_bits_size(fixer_auto_in_a_bits_size),
    .auto_in_a_bits_source(fixer_auto_in_a_bits_source),
    .auto_in_a_bits_address(fixer_auto_in_a_bits_address),
    .auto_in_a_bits_mask(fixer_auto_in_a_bits_mask),
    .auto_in_a_bits_data(fixer_auto_in_a_bits_data),
    .auto_in_d_ready(fixer_auto_in_d_ready),
    .auto_in_d_valid(fixer_auto_in_d_valid),
    .auto_in_d_bits_opcode(fixer_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(fixer_auto_in_d_bits_param),
    .auto_in_d_bits_size(fixer_auto_in_d_bits_size),
    .auto_in_d_bits_source(fixer_auto_in_d_bits_source),
    .auto_in_d_bits_sink(fixer_auto_in_d_bits_sink),
    .auto_in_d_bits_denied(fixer_auto_in_d_bits_denied),
    .auto_in_d_bits_data(fixer_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(fixer_auto_in_d_bits_corrupt),
    .auto_out_a_ready(fixer_auto_out_a_ready),
    .auto_out_a_valid(fixer_auto_out_a_valid),
    .auto_out_a_bits_opcode(fixer_auto_out_a_bits_opcode),
    .auto_out_a_bits_size(fixer_auto_out_a_bits_size),
    .auto_out_a_bits_source(fixer_auto_out_a_bits_source),
    .auto_out_a_bits_address(fixer_auto_out_a_bits_address),
    .auto_out_a_bits_mask(fixer_auto_out_a_bits_mask),
    .auto_out_a_bits_data(fixer_auto_out_a_bits_data),
    .auto_out_d_ready(fixer_auto_out_d_ready),
    .auto_out_d_valid(fixer_auto_out_d_valid),
    .auto_out_d_bits_opcode(fixer_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(fixer_auto_out_d_bits_param),
    .auto_out_d_bits_size(fixer_auto_out_d_bits_size),
    .auto_out_d_bits_source(fixer_auto_out_d_bits_source),
    .auto_out_d_bits_sink(fixer_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(fixer_auto_out_d_bits_denied),
    .auto_out_d_bits_data(fixer_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(fixer_auto_out_d_bits_corrupt)
  );
  CHIPLINK_PREFIX_TLWidthWidget widget (
    .clock(widget_clock),
    .reset(widget_reset),
    .auto_in_a_ready(widget_auto_in_a_ready),
    .auto_in_a_valid(widget_auto_in_a_valid),
    .auto_in_a_bits_opcode(widget_auto_in_a_bits_opcode),
    .auto_in_a_bits_size(widget_auto_in_a_bits_size),
    .auto_in_a_bits_source(widget_auto_in_a_bits_source),
    .auto_in_a_bits_address(widget_auto_in_a_bits_address),
    .auto_in_a_bits_mask(widget_auto_in_a_bits_mask),
    .auto_in_a_bits_data(widget_auto_in_a_bits_data),
    .auto_in_d_ready(widget_auto_in_d_ready),
    .auto_in_d_valid(widget_auto_in_d_valid),
    .auto_in_d_bits_opcode(widget_auto_in_d_bits_opcode),
    .auto_in_d_bits_size(widget_auto_in_d_bits_size),
    .auto_in_d_bits_source(widget_auto_in_d_bits_source),
    .auto_in_d_bits_denied(widget_auto_in_d_bits_denied),
    .auto_in_d_bits_data(widget_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(widget_auto_in_d_bits_corrupt),
    .auto_out_a_ready(widget_auto_out_a_ready),
    .auto_out_a_valid(widget_auto_out_a_valid),
    .auto_out_a_bits_opcode(widget_auto_out_a_bits_opcode),
    .auto_out_a_bits_size(widget_auto_out_a_bits_size),
    .auto_out_a_bits_source(widget_auto_out_a_bits_source),
    .auto_out_a_bits_address(widget_auto_out_a_bits_address),
    .auto_out_a_bits_mask(widget_auto_out_a_bits_mask),
    .auto_out_a_bits_data(widget_auto_out_a_bits_data),
    .auto_out_d_ready(widget_auto_out_d_ready),
    .auto_out_d_valid(widget_auto_out_d_valid),
    .auto_out_d_bits_opcode(widget_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(widget_auto_out_d_bits_param),
    .auto_out_d_bits_size(widget_auto_out_d_bits_size),
    .auto_out_d_bits_source(widget_auto_out_d_bits_source),
    .auto_out_d_bits_sink(widget_auto_out_d_bits_sink),
    .auto_out_d_bits_denied(widget_auto_out_d_bits_denied),
    .auto_out_d_bits_data(widget_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(widget_auto_out_d_bits_corrupt)
  );

`ifdef CHIPLINK_CONNECT_DIRECT_TL
  TLError_Param tl_uh_ferr (
    .clock(widget_clock),
    .reset(widget_reset),
    .auto_in_a_ready(tl_uh_ferr_mux_out_a_ready),
    .auto_in_a_valid(widget_auto_out_a_valid & mig_input_takeover_en),
    .auto_in_a_bits_opcode(widget_auto_out_a_bits_opcode),
    .auto_in_a_bits_size(widget_auto_out_a_bits_size),
    .auto_in_a_bits_source(widget_auto_out_a_bits_source),
    .auto_in_a_bits_address({widget_auto_out_a_bits_address[12:0]}),
    .auto_in_a_bits_mask(widget_auto_out_a_bits_mask),
    .auto_in_d_ready(tl_uh_ferr_mux_out_d_ready),
    .auto_in_d_valid(tl_uh_ferr_mux_out_d_valid),
    .auto_in_d_bits_opcode(tl_uh_ferr_mux_out_d_bits_opcode),
    .auto_in_d_bits_size(tl_uh_ferr_mux_out_d_bits_size),
    .auto_in_d_bits_source(tl_uh_ferr_mux_out_d_bits_source),
    .auto_in_d_bits_denied(tl_uh_ferr_mux_out_d_bits_denied),
    .auto_in_d_bits_corrupt(tl_uh_ferr_mux_out_d_bits_corrupt)
  );

`else

  CHIPLINK_PREFIX_AXI4ToTL axi42tl (
    .clock(axi42tl_clock),
    .reset(axi42tl_reset),
    .auto_in_awready(axi42tl_auto_in_awready),
    .auto_in_awvalid(axi42tl_auto_in_awvalid),
    .auto_in_awid(axi42tl_auto_in_awid),
    .auto_in_awaddr(axi42tl_auto_in_awaddr),
    .auto_in_awlen(axi42tl_auto_in_awlen),
    .auto_in_awsize(axi42tl_auto_in_awsize),
    .auto_in_wready(axi42tl_auto_in_wready),
    .auto_in_wvalid(axi42tl_auto_in_wvalid),
    .auto_in_wdata(axi42tl_auto_in_wdata),
    .auto_in_wstrb(axi42tl_auto_in_wstrb),
    .auto_in_wlast(axi42tl_auto_in_wlast),
    .auto_in_bready(axi42tl_auto_in_bready),
    .auto_in_bvalid(axi42tl_auto_in_bvalid),
    .auto_in_bid(axi42tl_auto_in_bid),
    .auto_in_bresp(axi42tl_auto_in_bresp),
    .auto_in_arready(axi42tl_auto_in_arready),
    .auto_in_arvalid(axi42tl_auto_in_arvalid),
    .auto_in_arid(axi42tl_auto_in_arid),
    .auto_in_araddr(axi42tl_auto_in_araddr),
    .auto_in_arlen(axi42tl_auto_in_arlen),
    .auto_in_arsize(axi42tl_auto_in_arsize),
    .auto_in_rready(axi42tl_auto_in_rready),
    .auto_in_rvalid(axi42tl_auto_in_rvalid),
    .auto_in_rid(axi42tl_auto_in_rid),
    .auto_in_rdata(axi42tl_auto_in_rdata),
    .auto_in_rresp(axi42tl_auto_in_rresp),
    .auto_in_rlast(axi42tl_auto_in_rlast),
    .auto_out_a_ready(axi42tl_auto_out_a_ready),
    .auto_out_a_valid(axi42tl_auto_out_a_valid),
    .auto_out_a_bits_opcode(axi42tl_auto_out_a_bits_opcode),
    .auto_out_a_bits_size(axi42tl_auto_out_a_bits_size),
    .auto_out_a_bits_source(axi42tl_auto_out_a_bits_source),
    .auto_out_a_bits_address(axi42tl_auto_out_a_bits_address),
    .auto_out_a_bits_mask(axi42tl_auto_out_a_bits_mask),
    .auto_out_a_bits_data(axi42tl_auto_out_a_bits_data),
    .auto_out_d_ready(axi42tl_auto_out_d_ready),
    .auto_out_d_valid(axi42tl_auto_out_d_valid),
    .auto_out_d_bits_opcode(axi42tl_auto_out_d_bits_opcode),
    .auto_out_d_bits_size(axi42tl_auto_out_d_bits_size),
    .auto_out_d_bits_source(axi42tl_auto_out_d_bits_source),
    .auto_out_d_bits_denied(axi42tl_auto_out_d_bits_denied),
    .auto_out_d_bits_data(axi42tl_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(axi42tl_auto_out_d_bits_corrupt)
  );

  CHIPLINK_PREFIX_AXI4UserYanker axi4yank (
    .clock(axi4yank_clock),
    .reset(axi4yank_reset),
    .auto_in_awready(axi4yank_auto_in_awready),
    .auto_in_awvalid(axi4yank_auto_in_awvalid),
    .auto_in_awid(axi4yank_auto_in_awid),
    .auto_in_awaddr(axi4yank_auto_in_awaddr),
    .auto_in_awlen(axi4yank_auto_in_awlen),
    .auto_in_awsize(axi4yank_auto_in_awsize),
    .auto_in_awecho_extra_id(axi4yank_auto_in_awecho_extra_id),
    .auto_in_awecho_real_last(axi4yank_auto_in_awecho_real_last),
    .auto_in_wready(axi4yank_auto_in_wready),
    .auto_in_wvalid(axi4yank_auto_in_wvalid),
    .auto_in_wdata(axi4yank_auto_in_wdata),
    .auto_in_wstrb(axi4yank_auto_in_wstrb),
    .auto_in_wlast(axi4yank_auto_in_wlast),
    .auto_in_bready(axi4yank_auto_in_bready),
    .auto_in_bvalid(axi4yank_auto_in_bvalid),
    .auto_in_bid(axi4yank_auto_in_bid),
    .auto_in_bresp(axi4yank_auto_in_bresp),
    .auto_in_becho_extra_id(axi4yank_auto_in_becho_extra_id),
    .auto_in_becho_real_last(axi4yank_auto_in_becho_real_last),
    .auto_in_arready(axi4yank_auto_in_arready),
    .auto_in_arvalid(axi4yank_auto_in_arvalid),
    .auto_in_arid(axi4yank_auto_in_arid),
    .auto_in_araddr(axi4yank_auto_in_araddr),
    .auto_in_arlen(axi4yank_auto_in_arlen),
    .auto_in_arsize(axi4yank_auto_in_arsize),
    .auto_in_arecho_extra_id(axi4yank_auto_in_arecho_extra_id),
    .auto_in_arecho_real_last(axi4yank_auto_in_arecho_real_last),
    .auto_in_rready(axi4yank_auto_in_rready),
    .auto_in_rvalid(axi4yank_auto_in_rvalid),
    .auto_in_rid(axi4yank_auto_in_rid),
    .auto_in_rdata(axi4yank_auto_in_rdata),
    .auto_in_rresp(axi4yank_auto_in_rresp),
    .auto_in_recho_extra_id(axi4yank_auto_in_recho_extra_id),
    .auto_in_recho_real_last(axi4yank_auto_in_recho_real_last),
    .auto_in_rlast(axi4yank_auto_in_rlast),
    .auto_out_awready(axi4yank_auto_out_awready),
    .auto_out_awvalid(axi4yank_auto_out_awvalid),
    .auto_out_awid(axi4yank_auto_out_awid),
    .auto_out_awaddr(axi4yank_auto_out_awaddr),
    .auto_out_awlen(axi4yank_auto_out_awlen),
    .auto_out_awsize(axi4yank_auto_out_awsize),
    .auto_out_wready(axi4yank_auto_out_wready),
    .auto_out_wvalid(axi4yank_auto_out_wvalid),
    .auto_out_wdata(axi4yank_auto_out_wdata),
    .auto_out_wstrb(axi4yank_auto_out_wstrb),
    .auto_out_wlast(axi4yank_auto_out_wlast),
    .auto_out_bready(axi4yank_auto_out_bready),
    .auto_out_bvalid(axi4yank_auto_out_bvalid),
    .auto_out_bid(axi4yank_auto_out_bid),
    .auto_out_bresp(axi4yank_auto_out_bresp),
    .auto_out_arready(axi4yank_auto_out_arready),
    .auto_out_arvalid(axi4yank_auto_out_arvalid),
    .auto_out_arid(axi4yank_auto_out_arid),
    .auto_out_araddr(axi4yank_auto_out_araddr),
    .auto_out_arlen(axi4yank_auto_out_arlen),
    .auto_out_arsize(axi4yank_auto_out_arsize),
    .auto_out_rready(axi4yank_auto_out_rready),
    .auto_out_rvalid(axi4yank_auto_out_rvalid),
    .auto_out_rid(axi4yank_auto_out_rid),
    .auto_out_rdata(axi4yank_auto_out_rdata),
    .auto_out_rresp(axi4yank_auto_out_rresp),
    .auto_out_rlast(axi4yank_auto_out_rlast)
  );

  CHIPLINK_PREFIX_AXI4Fragmenter axi4frag (
    .clock(axi4frag_clock),
    .reset(axi4frag_reset),
    .auto_in_awready(axi4frag_auto_in_awready),
    .auto_in_awvalid(axi4frag_auto_in_awvalid),
    .auto_in_awid(axi4frag_auto_in_awid),
    .auto_in_awaddr(axi4frag_auto_in_awaddr),
    .auto_in_awlen(axi4frag_auto_in_awlen),
    .auto_in_awsize(axi4frag_auto_in_awsize),
    .auto_in_awburst(axi4frag_auto_in_awburst),
    .auto_in_awecho_extra_id(axi4frag_auto_in_awecho_extra_id),
    .auto_in_wready(axi4frag_auto_in_wready),
    .auto_in_wvalid(axi4frag_auto_in_wvalid),
    .auto_in_wdata(axi4frag_auto_in_wdata),
    .auto_in_wstrb(axi4frag_auto_in_wstrb),
    .auto_in_wlast(axi4frag_auto_in_wlast),
    .auto_in_bready(axi4frag_auto_in_bready),
    .auto_in_bvalid(axi4frag_auto_in_bvalid),
    .auto_in_bid(axi4frag_auto_in_bid),
    .auto_in_bresp(axi4frag_auto_in_bresp),
    .auto_in_becho_extra_id(axi4frag_auto_in_becho_extra_id),
    .auto_in_arready(axi4frag_auto_in_arready),
    .auto_in_arvalid(axi4frag_auto_in_arvalid),
    .auto_in_arid(axi4frag_auto_in_arid),
    .auto_in_araddr(axi4frag_auto_in_araddr),
    .auto_in_arlen(axi4frag_auto_in_arlen),
    .auto_in_arsize(axi4frag_auto_in_arsize),
    .auto_in_arburst(axi4frag_auto_in_arburst),
    .auto_in_arecho_extra_id(axi4frag_auto_in_arecho_extra_id),
    .auto_in_rready(axi4frag_auto_in_rready),
    .auto_in_rvalid(axi4frag_auto_in_rvalid),
    .auto_in_rid(axi4frag_auto_in_rid),
    .auto_in_rdata(axi4frag_auto_in_rdata),
    .auto_in_rresp(axi4frag_auto_in_rresp),
    .auto_in_recho_extra_id(axi4frag_auto_in_recho_extra_id),
    .auto_in_rlast(axi4frag_auto_in_rlast),
    .auto_out_awready(axi4frag_auto_out_awready),
    .auto_out_awvalid(axi4frag_auto_out_awvalid),
    .auto_out_awid(axi4frag_auto_out_awid),
    .auto_out_awaddr(axi4frag_auto_out_awaddr),
    .auto_out_awlen(axi4frag_auto_out_awlen),
    .auto_out_awsize(axi4frag_auto_out_awsize),
    .auto_out_awecho_extra_id(axi4frag_auto_out_awecho_extra_id),
    .auto_out_awecho_real_last(axi4frag_auto_out_awecho_real_last),
    .auto_out_wready(axi4frag_auto_out_wready),
    .auto_out_wvalid(axi4frag_auto_out_wvalid),
    .auto_out_wdata(axi4frag_auto_out_wdata),
    .auto_out_wstrb(axi4frag_auto_out_wstrb),
    .auto_out_wlast(axi4frag_auto_out_wlast),
    .auto_out_bready(axi4frag_auto_out_bready),
    .auto_out_bvalid(axi4frag_auto_out_bvalid),
    .auto_out_bid(axi4frag_auto_out_bid),
    .auto_out_bresp(axi4frag_auto_out_bresp),
    .auto_out_becho_extra_id(axi4frag_auto_out_becho_extra_id),
    .auto_out_becho_real_last(axi4frag_auto_out_becho_real_last),
    .auto_out_arready(axi4frag_auto_out_arready),
    .auto_out_arvalid(axi4frag_auto_out_arvalid),
    .auto_out_arid(axi4frag_auto_out_arid),
    .auto_out_araddr(axi4frag_auto_out_araddr),
    .auto_out_arlen(axi4frag_auto_out_arlen),
    .auto_out_arsize(axi4frag_auto_out_arsize),
    .auto_out_arecho_extra_id(axi4frag_auto_out_arecho_extra_id),
    .auto_out_arecho_real_last(axi4frag_auto_out_arecho_real_last),
    .auto_out_rready(axi4frag_auto_out_rready),
    .auto_out_rvalid(axi4frag_auto_out_rvalid),
    .auto_out_rid(axi4frag_auto_out_rid),
    .auto_out_rdata(axi4frag_auto_out_rdata),
    .auto_out_rresp(axi4frag_auto_out_rresp),
    .auto_out_recho_extra_id(axi4frag_auto_out_recho_extra_id),
    .auto_out_recho_real_last(axi4frag_auto_out_recho_real_last),
    .auto_out_rlast(axi4frag_auto_out_rlast)
  );


  CHIPLINK_PREFIX_AXI4IdIndexer axi4index (
    .auto_in_awready(axi4index_auto_in_awready),
    .auto_in_awvalid(axi4index_auto_in_awvalid),
    .auto_in_awid(axi4index_auto_in_awid),
    .auto_in_awaddr(axi4index_auto_in_awaddr),
    .auto_in_awlen(axi4index_auto_in_awlen),
    .auto_in_awsize(axi4index_auto_in_awsize),
    .auto_in_awburst(axi4index_auto_in_awburst),
    .auto_in_wready(axi4index_auto_in_wready),
    .auto_in_wvalid(axi4index_auto_in_wvalid),
    .auto_in_wdata(axi4index_auto_in_wdata),
    .auto_in_wstrb(axi4index_auto_in_wstrb),
    .auto_in_wlast(axi4index_auto_in_wlast),
    .auto_in_bready(axi4index_auto_in_bready),
    .auto_in_bvalid(axi4index_auto_in_bvalid),
    .auto_in_bid(axi4index_auto_in_bid),
    .auto_in_bresp(axi4index_auto_in_bresp),
    .auto_in_arready(axi4index_auto_in_arready),
    .auto_in_arvalid(axi4index_auto_in_arvalid),
    .auto_in_arid(axi4index_auto_in_arid),
    .auto_in_araddr(axi4index_auto_in_araddr),
    .auto_in_arlen(axi4index_auto_in_arlen),
    .auto_in_arsize(axi4index_auto_in_arsize),
    .auto_in_arburst(axi4index_auto_in_arburst),
    .auto_in_rready(axi4index_auto_in_rready),
    .auto_in_rvalid(axi4index_auto_in_rvalid),
    .auto_in_rid(axi4index_auto_in_rid),
    .auto_in_rdata(axi4index_auto_in_rdata),
    .auto_in_rresp(axi4index_auto_in_rresp),
    .auto_in_rlast(axi4index_auto_in_rlast),
    .auto_out_awready(axi4index_auto_out_awready),
    .auto_out_awvalid(axi4index_auto_out_awvalid),
    .auto_out_awid(axi4index_auto_out_awid),
    .auto_out_awaddr(axi4index_auto_out_awaddr),
    .auto_out_awlen(axi4index_auto_out_awlen),
    .auto_out_awsize(axi4index_auto_out_awsize),
    .auto_out_awburst(axi4index_auto_out_awburst),
    .auto_out_awecho_extra_id(axi4index_auto_out_awecho_extra_id),
    .auto_out_wready(axi4index_auto_out_wready),
    .auto_out_wvalid(axi4index_auto_out_wvalid),
    .auto_out_wdata(axi4index_auto_out_wdata),
    .auto_out_wstrb(axi4index_auto_out_wstrb),
    .auto_out_wlast(axi4index_auto_out_wlast),
    .auto_out_bready(axi4index_auto_out_bready),
    .auto_out_bvalid(axi4index_auto_out_bvalid),
    .auto_out_bid(axi4index_auto_out_bid),
    .auto_out_bresp(axi4index_auto_out_bresp),
    .auto_out_becho_extra_id(axi4index_auto_out_becho_extra_id),
    .auto_out_arready(axi4index_auto_out_arready),
    .auto_out_arvalid(axi4index_auto_out_arvalid),
    .auto_out_arid(axi4index_auto_out_arid),
    .auto_out_araddr(axi4index_auto_out_araddr),
    .auto_out_arlen(axi4index_auto_out_arlen),
    .auto_out_arsize(axi4index_auto_out_arsize),
    .auto_out_arburst(axi4index_auto_out_arburst),
    .auto_out_arecho_extra_id(axi4index_auto_out_arecho_extra_id),
    .auto_out_rready(axi4index_auto_out_rready),
    .auto_out_rvalid(axi4index_auto_out_rvalid),
    .auto_out_rid(axi4index_auto_out_rid),
    .auto_out_rdata(axi4index_auto_out_rdata),
    .auto_out_rresp(axi4index_auto_out_rresp),
    .auto_out_recho_extra_id(axi4index_auto_out_recho_extra_id),
    .auto_out_rlast(axi4index_auto_out_rlast)
  );
`endif

  CHIPLINK_PREFIX_AXI4UserYanker_1 axi4yank_1 (
    .clock(axi4yank_1_clock),
    .reset(axi4yank_1_reset),
    .auto_in_awready(axi4yank_1_auto_in_awready),
    .auto_in_awvalid(axi4yank_1_auto_in_awvalid),
    .auto_in_awid(axi4yank_1_auto_in_awid),
    .auto_in_awaddr(axi4yank_1_auto_in_awaddr),
    .auto_in_awlen(axi4yank_1_auto_in_awlen),
    .auto_in_awsize(axi4yank_1_auto_in_awsize),
    .auto_in_awburst(axi4yank_1_auto_in_awburst),
    .auto_in_awecho_tl_state_size(axi4yank_1_auto_in_awecho_tl_state_size),
    .auto_in_awecho_tl_state_source(axi4yank_1_auto_in_awecho_tl_state_source),
    .auto_in_awecho_extra_id(axi4yank_1_auto_in_awecho_extra_id),
    .auto_in_wready(axi4yank_1_auto_in_wready),
    .auto_in_wvalid(axi4yank_1_auto_in_wvalid),
    .auto_in_wdata(axi4yank_1_auto_in_wdata),
    .auto_in_wstrb(axi4yank_1_auto_in_wstrb),
    .auto_in_wlast(axi4yank_1_auto_in_wlast),
    .auto_in_bready(axi4yank_1_auto_in_bready),
    .auto_in_bvalid(axi4yank_1_auto_in_bvalid),
    .auto_in_bid(axi4yank_1_auto_in_bid),
    .auto_in_bresp(axi4yank_1_auto_in_bresp),
    .auto_in_becho_tl_state_size(axi4yank_1_auto_in_becho_tl_state_size),
    .auto_in_becho_tl_state_source(axi4yank_1_auto_in_becho_tl_state_source),
    .auto_in_becho_extra_id(axi4yank_1_auto_in_becho_extra_id),
    .auto_in_arready(axi4yank_1_auto_in_arready),
    .auto_in_arvalid(axi4yank_1_auto_in_arvalid),
    .auto_in_arid(axi4yank_1_auto_in_arid),
    .auto_in_araddr(axi4yank_1_auto_in_araddr),
    .auto_in_arlen(axi4yank_1_auto_in_arlen),
    .auto_in_arsize(axi4yank_1_auto_in_arsize),
    .auto_in_arburst(axi4yank_1_auto_in_arburst),
    .auto_in_arecho_tl_state_size(axi4yank_1_auto_in_arecho_tl_state_size),
    .auto_in_arecho_tl_state_source(axi4yank_1_auto_in_arecho_tl_state_source),
    .auto_in_arecho_extra_id(axi4yank_1_auto_in_arecho_extra_id),
    .auto_in_rready(axi4yank_1_auto_in_rready),
    .auto_in_rvalid(axi4yank_1_auto_in_rvalid),
    .auto_in_rid(axi4yank_1_auto_in_rid),
    .auto_in_rdata(axi4yank_1_auto_in_rdata),
    .auto_in_rresp(axi4yank_1_auto_in_rresp),
    .auto_in_recho_tl_state_size(axi4yank_1_auto_in_recho_tl_state_size),
    .auto_in_recho_tl_state_source(axi4yank_1_auto_in_recho_tl_state_source),
    .auto_in_recho_extra_id(axi4yank_1_auto_in_recho_extra_id),
    .auto_in_rlast(axi4yank_1_auto_in_rlast),
    .auto_out_awready(axi4index_1_axi4yank_1_buf_awready),
    .auto_out_awvalid(axi4index_1_axi4yank_1_buf_awvalid),
    .auto_out_awid(axi4index_1_axi4yank_1_buf_awid),
    .auto_out_awaddr(axi4index_1_axi4yank_1_buf_awaddr),
    .auto_out_awlen(axi4index_1_axi4yank_1_buf_awlen),
    .auto_out_awsize(axi4index_1_axi4yank_1_buf_awsize),
    .auto_out_awburst(axi4index_1_axi4yank_1_buf_awburst),
    .auto_out_wready(axi4index_1_axi4yank_1_buf_wready),
    .auto_out_wvalid(axi4index_1_axi4yank_1_buf_wvalid),
    .auto_out_wdata(axi4index_1_axi4yank_1_buf_wdata),
    .auto_out_wstrb(axi4index_1_axi4yank_1_buf_wstrb),
    .auto_out_wlast(axi4index_1_axi4yank_1_buf_wlast),
    .auto_out_bready(axi4index_1_axi4yank_1_buf_bready),
    .auto_out_bvalid(axi4index_1_axi4yank_1_buf_bvalid),
    .auto_out_bid(axi4index_1_axi4yank_1_buf_bid),
    .auto_out_bresp(axi4index_1_axi4yank_1_buf_bresp),
    .auto_out_arready(axi4index_1_axi4yank_1_buf_arready),
    .auto_out_arvalid(axi4index_1_axi4yank_1_buf_arvalid),
    .auto_out_arid(axi4index_1_axi4yank_1_buf_arid),
    .auto_out_araddr(axi4index_1_axi4yank_1_buf_araddr),
    .auto_out_arlen(axi4index_1_axi4yank_1_buf_arlen),
    .auto_out_arsize(axi4index_1_axi4yank_1_buf_arsize),
    .auto_out_arburst(axi4index_1_axi4yank_1_buf_arburst),
    .auto_out_rready(axi4index_1_axi4yank_1_buf_rready),
    .auto_out_rvalid(axi4index_1_axi4yank_1_buf_rvalid),
    .auto_out_rid(axi4index_1_axi4yank_1_buf_rid),
    .auto_out_rdata(axi4index_1_axi4yank_1_buf_rdata),
    .auto_out_rresp(axi4index_1_axi4yank_1_buf_rresp),
    .auto_out_rlast(axi4index_1_axi4yank_1_buf_rlast)
  );

  AXI4Buffer_Param #(
    .ADDR_WIDTH(32),
    .DATA_WIDTH(64),
    .ID_WIDTH(4)  // id
  ) axi4index_1_axi4yank_1_buf ( 
    .clock(axi4yank_1_clock),
    .reset(axi4yank_1_reset),
    .auto_in_awready(axi4index_1_axi4yank_1_buf_awready),
    .auto_in_awvalid(axi4index_1_axi4yank_1_buf_awvalid),
    .auto_in_awid({axi4index_1_axi4yank_1_buf_awid}),
    .auto_in_awaddr(axi4index_1_axi4yank_1_buf_awaddr),
    .auto_in_awlen(axi4index_1_axi4yank_1_buf_awlen),
    .auto_in_awsize(axi4index_1_axi4yank_1_buf_awsize),
    .auto_in_awburst(axi4index_1_axi4yank_1_buf_awburst),
    .auto_in_wready(axi4index_1_axi4yank_1_buf_wready),
    .auto_in_wvalid(axi4index_1_axi4yank_1_buf_wvalid),
    .auto_in_wdata(axi4index_1_axi4yank_1_buf_wdata),
    .auto_in_wstrb(axi4index_1_axi4yank_1_buf_wstrb),
    .auto_in_wlast(axi4index_1_axi4yank_1_buf_wlast),
    .auto_in_bready(axi4index_1_axi4yank_1_buf_bready),
    .auto_in_bvalid(axi4index_1_axi4yank_1_buf_bvalid),
    .auto_in_bid({axi4index_1_axi4yank_1_buf_bid}),
    .auto_in_bresp(axi4index_1_axi4yank_1_buf_bresp),
    .auto_in_arready(axi4index_1_axi4yank_1_buf_arready),
    .auto_in_arvalid(axi4index_1_axi4yank_1_buf_arvalid),
    .auto_in_arid({axi4index_1_axi4yank_1_buf_arid}),
    .auto_in_araddr(axi4index_1_axi4yank_1_buf_araddr),
    .auto_in_arlen(axi4index_1_axi4yank_1_buf_arlen),
    .auto_in_arsize(axi4index_1_axi4yank_1_buf_arsize),
    .auto_in_arburst(axi4index_1_axi4yank_1_buf_arburst),
    .auto_in_rready(axi4index_1_axi4yank_1_buf_rready),
    .auto_in_rvalid(axi4index_1_axi4yank_1_buf_rvalid),
    .auto_in_rid({axi4index_1_axi4yank_1_buf_rid}),
    .auto_in_rdata(axi4index_1_axi4yank_1_buf_rdata),
    .auto_in_rresp(axi4index_1_axi4yank_1_buf_rresp),
    .auto_in_rlast(axi4index_1_axi4yank_1_buf_rlast),
    .auto_out_awready(axi4yank_1_auto_out_awready),
    .auto_out_awvalid(axi4yank_1_auto_out_awvalid),
    .auto_out_awid({axi4yank_1_auto_out_awid}),
    .auto_out_awaddr(axi4yank_1_auto_out_awaddr),
    .auto_out_awlen(axi4yank_1_auto_out_awlen),
    .auto_out_awsize(axi4yank_1_auto_out_awsize),
    .auto_out_awburst(axi4yank_1_auto_out_awburst),
    .auto_out_wready(axi4yank_1_auto_out_wready),
    .auto_out_wvalid(axi4yank_1_auto_out_wvalid),
    .auto_out_wdata(axi4yank_1_auto_out_wdata),
    .auto_out_wstrb(axi4yank_1_auto_out_wstrb),
    .auto_out_wlast(axi4yank_1_auto_out_wlast),
    .auto_out_bready(axi4yank_1_auto_out_bready),
    .auto_out_bvalid(axi4yank_1_auto_out_bvalid),
    .auto_out_bid({axi4yank_1_auto_out_bid}),
    .auto_out_bresp(axi4yank_1_auto_out_bresp),
    .auto_out_arready(axi4yank_1_auto_out_arready),
    .auto_out_arvalid(axi4yank_1_auto_out_arvalid),
    .auto_out_arid({axi4yank_1_auto_out_arid}),
    .auto_out_araddr(axi4yank_1_auto_out_araddr),
    .auto_out_arlen(axi4yank_1_auto_out_arlen),
    .auto_out_arsize(axi4yank_1_auto_out_arsize),
    .auto_out_arburst(axi4yank_1_auto_out_arburst),
    .auto_out_rready(axi4yank_1_auto_out_rready),
    .auto_out_rvalid(axi4yank_1_auto_out_rvalid),
    .auto_out_rid({axi4yank_1_auto_out_rid}),
    .auto_out_rdata(axi4yank_1_auto_out_rdata),
    .auto_out_rresp(axi4yank_1_auto_out_rresp),
    .auto_out_rlast(axi4yank_1_auto_out_rlast)
  );


  CHIPLINK_PREFIX_AXI4IdIndexer_1 axi4index_1 (
    .auto_in_awready(axi4index_1_auto_in_awready),
    .auto_in_awvalid(axi4index_1_auto_in_awvalid),
    .auto_in_awid(axi4index_1_auto_in_awid),
    .auto_in_awaddr(axi4index_1_auto_in_awaddr),
    .auto_in_awlen(axi4index_1_auto_in_awlen),
    .auto_in_awsize(axi4index_1_auto_in_awsize),
    .auto_in_awburst(axi4index_1_auto_in_awburst),
    .auto_in_awecho_tl_state_size(axi4index_1_auto_in_awecho_tl_state_size),
    .auto_in_awecho_tl_state_source(axi4index_1_auto_in_awecho_tl_state_source),
    .auto_in_wready(axi4index_1_auto_in_wready),
    .auto_in_wvalid(axi4index_1_auto_in_wvalid),
    .auto_in_wdata(axi4index_1_auto_in_wdata),
    .auto_in_wstrb(axi4index_1_auto_in_wstrb),
    .auto_in_wlast(axi4index_1_auto_in_wlast),
    .auto_in_bready(axi4index_1_auto_in_bready),
    .auto_in_bvalid(axi4index_1_auto_in_bvalid),
    .auto_in_bid(axi4index_1_auto_in_bid),
    .auto_in_bresp(axi4index_1_auto_in_bresp),
    .auto_in_becho_tl_state_size(axi4index_1_auto_in_becho_tl_state_size),
    .auto_in_becho_tl_state_source(axi4index_1_auto_in_becho_tl_state_source),
    .auto_in_arready(axi4index_1_auto_in_arready),
    .auto_in_arvalid(axi4index_1_auto_in_arvalid),
    .auto_in_arid(axi4index_1_auto_in_arid),
    .auto_in_araddr(axi4index_1_auto_in_araddr),
    .auto_in_arlen(axi4index_1_auto_in_arlen),
    .auto_in_arsize(axi4index_1_auto_in_arsize),
    .auto_in_arburst(axi4index_1_auto_in_arburst),
    .auto_in_arecho_tl_state_size(axi4index_1_auto_in_arecho_tl_state_size),
    .auto_in_arecho_tl_state_source(axi4index_1_auto_in_arecho_tl_state_source),
    .auto_in_rready(axi4index_1_auto_in_rready),
    .auto_in_rvalid(axi4index_1_auto_in_rvalid),
    .auto_in_rid(axi4index_1_auto_in_rid),
    .auto_in_rdata(axi4index_1_auto_in_rdata),
    .auto_in_rresp(axi4index_1_auto_in_rresp),
    .auto_in_recho_tl_state_size(axi4index_1_auto_in_recho_tl_state_size),
    .auto_in_recho_tl_state_source(axi4index_1_auto_in_recho_tl_state_source),
    .auto_in_rlast(axi4index_1_auto_in_rlast),
    .auto_out_awready(axi4index_1_auto_out_awready),
    .auto_out_awvalid(axi4index_1_auto_out_awvalid),
    .auto_out_awid(axi4index_1_auto_out_awid),
    .auto_out_awaddr(axi4index_1_auto_out_awaddr),
    .auto_out_awlen(axi4index_1_auto_out_awlen),
    .auto_out_awsize(axi4index_1_auto_out_awsize),
    .auto_out_awburst(axi4index_1_auto_out_awburst),
    .auto_out_awecho_tl_state_size(axi4index_1_auto_out_awecho_tl_state_size),
    .auto_out_awecho_tl_state_source(axi4index_1_auto_out_awecho_tl_state_source),
    .auto_out_awecho_extra_id(axi4index_1_auto_out_awecho_extra_id),
    .auto_out_wready(axi4index_1_auto_out_wready),
    .auto_out_wvalid(axi4index_1_auto_out_wvalid),
    .auto_out_wdata(axi4index_1_auto_out_wdata),
    .auto_out_wstrb(axi4index_1_auto_out_wstrb),
    .auto_out_wlast(axi4index_1_auto_out_wlast),
    .auto_out_bready(axi4index_1_auto_out_bready),
    .auto_out_bvalid(axi4index_1_auto_out_bvalid),
    .auto_out_bid(axi4index_1_auto_out_bid),
    .auto_out_bresp(axi4index_1_auto_out_bresp),
    .auto_out_becho_tl_state_size(axi4index_1_auto_out_becho_tl_state_size),
    .auto_out_becho_tl_state_source(axi4index_1_auto_out_becho_tl_state_source),
    .auto_out_becho_extra_id(axi4index_1_auto_out_becho_extra_id),
    .auto_out_arready(axi4index_1_auto_out_arready),
    .auto_out_arvalid(axi4index_1_auto_out_arvalid),
    .auto_out_arid(axi4index_1_auto_out_arid),
    .auto_out_araddr(axi4index_1_auto_out_araddr),
    .auto_out_arlen(axi4index_1_auto_out_arlen),
    .auto_out_arsize(axi4index_1_auto_out_arsize),
    .auto_out_arburst(axi4index_1_auto_out_arburst),
    .auto_out_arecho_tl_state_size(axi4index_1_auto_out_arecho_tl_state_size),
    .auto_out_arecho_tl_state_source(axi4index_1_auto_out_arecho_tl_state_source),
    .auto_out_arecho_extra_id(axi4index_1_auto_out_arecho_extra_id),
    .auto_out_rready(axi4index_1_auto_out_rready),
    .auto_out_rvalid(axi4index_1_auto_out_rvalid),
    .auto_out_rid(axi4index_1_auto_out_rid),
    .auto_out_rdata(axi4index_1_auto_out_rdata),
    .auto_out_rresp(axi4index_1_auto_out_rresp),
    .auto_out_recho_tl_state_size(axi4index_1_auto_out_recho_tl_state_size),
    .auto_out_recho_tl_state_source(axi4index_1_auto_out_recho_tl_state_source),
    .auto_out_recho_extra_id(axi4index_1_auto_out_recho_extra_id),
    .auto_out_rlast(axi4index_1_auto_out_rlast)
  );
  CHIPLINK_PREFIX_TLToAXI4 tl2axi4 (
    .clock(tl2axi4_clock),
    .reset(tl2axi4_reset),
    .auto_in_a_ready(tl2axi4_auto_in_a_ready),
    .auto_in_a_valid(tl2axi4_auto_in_a_valid),
    .auto_in_a_bits_opcode(tl2axi4_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(tl2axi4_auto_in_a_bits_param),
    .auto_in_a_bits_size(tl2axi4_auto_in_a_bits_size),
    .auto_in_a_bits_source(tl2axi4_auto_in_a_bits_source),
    .auto_in_a_bits_address(tl2axi4_auto_in_a_bits_address),
    .auto_in_a_bits_mask(tl2axi4_auto_in_a_bits_mask),
    .auto_in_a_bits_data(tl2axi4_auto_in_a_bits_data),
    .auto_in_a_bits_corrupt(tl2axi4_auto_in_a_bits_corrupt),
    .auto_in_d_ready(tl2axi4_auto_in_d_ready),
    .auto_in_d_valid(tl2axi4_auto_in_d_valid),
    .auto_in_d_bits_opcode(tl2axi4_auto_in_d_bits_opcode),
    .auto_in_d_bits_size(tl2axi4_auto_in_d_bits_size),
    .auto_in_d_bits_source(tl2axi4_auto_in_d_bits_source),
    .auto_in_d_bits_denied(tl2axi4_auto_in_d_bits_denied),
    .auto_in_d_bits_data(tl2axi4_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(tl2axi4_auto_in_d_bits_corrupt),
    .auto_out_awready(tl2axi4_axi4index_1_buf_awready),
    .auto_out_awvalid(tl2axi4_axi4index_1_buf_awvalid),
    .auto_out_awid(tl2axi4_axi4index_1_buf_awid),
    .auto_out_awaddr(tl2axi4_axi4index_1_buf_awaddr),
    .auto_out_awlen(tl2axi4_axi4index_1_buf_awlen),
    .auto_out_awsize(tl2axi4_axi4index_1_buf_awsize),
    .auto_out_awburst(tl2axi4_axi4index_1_buf_awburst),
    .auto_out_awecho_tl_state_size(tl2axi4_axi4index_1_buf_awecho_tl_state_size),
    .auto_out_awecho_tl_state_source(tl2axi4_axi4index_1_buf_awecho_tl_state_source),
    .auto_out_wready(tl2axi4_axi4index_1_buf_wready),
    .auto_out_wvalid(tl2axi4_axi4index_1_buf_wvalid),
    .auto_out_wdata(tl2axi4_axi4index_1_buf_wdata),
    .auto_out_wstrb(tl2axi4_axi4index_1_buf_wstrb),
    .auto_out_wlast(tl2axi4_axi4index_1_buf_wlast),
    .auto_out_bready(tl2axi4_axi4index_1_buf_bready),
    .auto_out_bvalid(tl2axi4_axi4index_1_buf_bvalid),
    .auto_out_bid(tl2axi4_axi4index_1_buf_bid),
    .auto_out_bresp(tl2axi4_axi4index_1_buf_bresp),
    .auto_out_becho_tl_state_size(tl2axi4_axi4index_1_buf_becho_tl_state_size),
    .auto_out_becho_tl_state_source(tl2axi4_axi4index_1_buf_becho_tl_state_source),
    .auto_out_arready(tl2axi4_axi4index_1_buf_arready),
    .auto_out_arvalid(tl2axi4_axi4index_1_buf_arvalid),
    .auto_out_arid(tl2axi4_axi4index_1_buf_arid),
    .auto_out_araddr(tl2axi4_axi4index_1_buf_araddr),
    .auto_out_arlen(tl2axi4_axi4index_1_buf_arlen),
    .auto_out_arsize(tl2axi4_axi4index_1_buf_arsize),
    .auto_out_arburst(tl2axi4_axi4index_1_buf_arburst),
    .auto_out_arecho_tl_state_size(tl2axi4_axi4index_1_buf_arecho_tl_state_size),
    .auto_out_arecho_tl_state_source(tl2axi4_axi4index_1_buf_arecho_tl_state_source),
    .auto_out_rready(tl2axi4_axi4index_1_buf_rready),
    .auto_out_rvalid(tl2axi4_axi4index_1_buf_rvalid),
    .auto_out_rid(tl2axi4_axi4index_1_buf_rid),
    .auto_out_rdata(tl2axi4_axi4index_1_buf_rdata),
    .auto_out_rresp(tl2axi4_axi4index_1_buf_rresp),
    .auto_out_recho_tl_state_size(tl2axi4_axi4index_1_buf_recho_tl_state_size),
    .auto_out_recho_tl_state_source(tl2axi4_axi4index_1_buf_recho_tl_state_source),
    .auto_out_rlast(tl2axi4_axi4index_1_buf_rlast)
  );

  AXI4Buffer_Param #(
    .ADDR_WIDTH(32),
    .DATA_WIDTH(64),
    .ID_WIDTH(5+4+7)  // id + tl_state_size + tl_state_source
  ) tl2axi4_axi4index_1_buf ( 
    .clock(tl2axi4_clock),
    .reset(tl2axi4_reset),
    .auto_in_awready(tl2axi4_axi4index_1_buf_awready),
    .auto_in_awvalid(tl2axi4_axi4index_1_buf_awvalid),
    .auto_in_awid({tl2axi4_axi4index_1_buf_awid, tl2axi4_axi4index_1_buf_awecho_tl_state_size, tl2axi4_axi4index_1_buf_awecho_tl_state_source}),
    .auto_in_awaddr(tl2axi4_axi4index_1_buf_awaddr),
    .auto_in_awlen(tl2axi4_axi4index_1_buf_awlen),
    .auto_in_awsize(tl2axi4_axi4index_1_buf_awsize),
    .auto_in_awburst(tl2axi4_axi4index_1_buf_awburst),
    .auto_in_wready(tl2axi4_axi4index_1_buf_wready),
    .auto_in_wvalid(tl2axi4_axi4index_1_buf_wvalid),
    .auto_in_wdata(tl2axi4_axi4index_1_buf_wdata),
    .auto_in_wstrb(tl2axi4_axi4index_1_buf_wstrb),
    .auto_in_wlast(tl2axi4_axi4index_1_buf_wlast),
    .auto_in_bready(tl2axi4_axi4index_1_buf_bready),
    .auto_in_bvalid(tl2axi4_axi4index_1_buf_bvalid),
    .auto_in_bid({tl2axi4_axi4index_1_buf_bid, tl2axi4_axi4index_1_buf_becho_tl_state_size, tl2axi4_axi4index_1_buf_becho_tl_state_source}),
    .auto_in_bresp(tl2axi4_axi4index_1_buf_bresp),
    .auto_in_arready(tl2axi4_axi4index_1_buf_arready),
    .auto_in_arvalid(tl2axi4_axi4index_1_buf_arvalid),
    .auto_in_arid({tl2axi4_axi4index_1_buf_arid, tl2axi4_axi4index_1_buf_arecho_tl_state_size, tl2axi4_axi4index_1_buf_arecho_tl_state_source}),
    .auto_in_araddr(tl2axi4_axi4index_1_buf_araddr),
    .auto_in_arlen(tl2axi4_axi4index_1_buf_arlen),
    .auto_in_arsize(tl2axi4_axi4index_1_buf_arsize),
    .auto_in_arburst(tl2axi4_axi4index_1_buf_arburst),
    .auto_in_rready(tl2axi4_axi4index_1_buf_rready),
    .auto_in_rvalid(tl2axi4_axi4index_1_buf_rvalid),
    .auto_in_rid({tl2axi4_axi4index_1_buf_rid, tl2axi4_axi4index_1_buf_recho_tl_state_size, tl2axi4_axi4index_1_buf_recho_tl_state_source}),
    .auto_in_rdata(tl2axi4_axi4index_1_buf_rdata),
    .auto_in_rresp(tl2axi4_axi4index_1_buf_rresp),
    .auto_in_rlast(tl2axi4_axi4index_1_buf_rlast),
    .auto_out_awready(tl2axi4_auto_out_awready),
    .auto_out_awvalid(tl2axi4_auto_out_awvalid),
    .auto_out_awid({tl2axi4_auto_out_awid, tl2axi4_auto_out_awecho_tl_state_size, tl2axi4_auto_out_awecho_tl_state_source}),
    .auto_out_awaddr(tl2axi4_auto_out_awaddr),
    .auto_out_awlen(tl2axi4_auto_out_awlen),
    .auto_out_awsize(tl2axi4_auto_out_awsize),
    .auto_out_awburst(tl2axi4_auto_out_awburst),
    .auto_out_wready(tl2axi4_auto_out_wready),
    .auto_out_wvalid(tl2axi4_auto_out_wvalid),
    .auto_out_wdata(tl2axi4_auto_out_wdata),
    .auto_out_wstrb(tl2axi4_auto_out_wstrb),
    .auto_out_wlast(tl2axi4_auto_out_wlast),
    .auto_out_bready(tl2axi4_auto_out_bready),
    .auto_out_bvalid(tl2axi4_auto_out_bvalid),
    .auto_out_bid({tl2axi4_auto_out_bid, tl2axi4_auto_out_becho_tl_state_size, tl2axi4_auto_out_becho_tl_state_source}),
    .auto_out_bresp(tl2axi4_auto_out_bresp),
    .auto_out_arready(tl2axi4_auto_out_arready),
    .auto_out_arvalid(tl2axi4_auto_out_arvalid),
    .auto_out_arid({tl2axi4_auto_out_arid, tl2axi4_auto_out_arecho_tl_state_size, tl2axi4_auto_out_arecho_tl_state_source}),
    .auto_out_araddr(tl2axi4_auto_out_araddr),
    .auto_out_arlen(tl2axi4_auto_out_arlen),
    .auto_out_arsize(tl2axi4_auto_out_arsize),
    .auto_out_arburst(tl2axi4_auto_out_arburst),
    .auto_out_rready(tl2axi4_auto_out_rready),
    .auto_out_rvalid(tl2axi4_auto_out_rvalid),
    .auto_out_rid({tl2axi4_auto_out_rid, tl2axi4_auto_out_recho_tl_state_size, tl2axi4_auto_out_recho_tl_state_source}),
    .auto_out_rdata(tl2axi4_auto_out_rdata),
    .auto_out_rresp(tl2axi4_auto_out_rresp),
    .auto_out_rlast(tl2axi4_auto_out_rlast)
  );


  CHIPLINK_PREFIX_TLError_2 err (
    .clock(err_clock),
    .reset(err_reset),
    .auto_in_a_ready(err_auto_in_a_ready),
    .auto_in_a_valid(err_auto_in_a_valid),
    .auto_in_a_bits_opcode(err_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(err_auto_in_a_bits_param),
    .auto_in_a_bits_size(err_auto_in_a_bits_size),
    .auto_in_a_bits_source(err_auto_in_a_bits_source),
    .auto_in_a_bits_address(err_auto_in_a_bits_address),
    .auto_in_a_bits_mask(err_auto_in_a_bits_mask),
    .auto_in_a_bits_corrupt(err_auto_in_a_bits_corrupt),
    .auto_in_c_ready(err_auto_in_c_ready),
    .auto_in_c_valid(err_auto_in_c_valid),
    .auto_in_c_bits_opcode(err_auto_in_c_bits_opcode),
    .auto_in_c_bits_param(err_auto_in_c_bits_param),
    .auto_in_c_bits_size(err_auto_in_c_bits_size),
    .auto_in_c_bits_source(err_auto_in_c_bits_source),
    .auto_in_c_bits_address(err_auto_in_c_bits_address),
    .auto_in_d_ready(err_auto_in_d_ready),
    .auto_in_d_valid(err_auto_in_d_valid),
    .auto_in_d_bits_opcode(err_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(err_auto_in_d_bits_param),
    .auto_in_d_bits_size(err_auto_in_d_bits_size),
    .auto_in_d_bits_source(err_auto_in_d_bits_source),
    .auto_in_d_bits_denied(err_auto_in_d_bits_denied),
    .auto_in_d_bits_corrupt(err_auto_in_d_bits_corrupt),
    .auto_in_e_valid(err_auto_in_e_valid)
  );
  CHIPLINK_PREFIX_TLAtomicAutomata atomics (
    .clock(atomics_clock),
    .reset(atomics_reset),
    .auto_in_a_ready(atomics_auto_in_a_ready),
    .auto_in_a_valid(atomics_auto_in_a_valid),
    .auto_in_a_bits_opcode(atomics_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(atomics_auto_in_a_bits_param),
    .auto_in_a_bits_size(atomics_auto_in_a_bits_size),
    .auto_in_a_bits_source(atomics_auto_in_a_bits_source),
    .auto_in_a_bits_address(atomics_auto_in_a_bits_address),
    .auto_in_a_bits_mask(atomics_auto_in_a_bits_mask),
    .auto_in_a_bits_data(atomics_auto_in_a_bits_data),
    .auto_in_c_ready(atomics_auto_in_c_ready),
    .auto_in_c_valid(atomics_auto_in_c_valid),
    .auto_in_c_bits_opcode(atomics_auto_in_c_bits_opcode),
    .auto_in_c_bits_param(atomics_auto_in_c_bits_param),
    .auto_in_c_bits_size(atomics_auto_in_c_bits_size),
    .auto_in_c_bits_source(atomics_auto_in_c_bits_source),
    .auto_in_c_bits_address(atomics_auto_in_c_bits_address),
    .auto_in_d_ready(atomics_auto_in_d_ready),
    .auto_in_d_valid(atomics_auto_in_d_valid),
    .auto_in_d_bits_opcode(atomics_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(atomics_auto_in_d_bits_param),
    .auto_in_d_bits_size(atomics_auto_in_d_bits_size),
    .auto_in_d_bits_source(atomics_auto_in_d_bits_source),
    .auto_in_d_bits_denied(atomics_auto_in_d_bits_denied),
    .auto_in_d_bits_data(atomics_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(atomics_auto_in_d_bits_corrupt),
    .auto_in_e_ready(atomics_auto_in_e_ready),
    .auto_in_e_valid(atomics_auto_in_e_valid),
    .auto_in_e_bits_sink(atomics_auto_in_e_bits_sink),
    .auto_out_a_ready(atomics_auto_out_a_ready),
    .auto_out_a_valid(atomics_auto_out_a_valid),
    .auto_out_a_bits_opcode(atomics_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(atomics_auto_out_a_bits_param),
    .auto_out_a_bits_size(atomics_auto_out_a_bits_size),
    .auto_out_a_bits_source(atomics_auto_out_a_bits_source),
    .auto_out_a_bits_address(atomics_auto_out_a_bits_address),
    .auto_out_a_bits_mask(atomics_auto_out_a_bits_mask),
    .auto_out_a_bits_data(atomics_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt(atomics_auto_out_a_bits_corrupt),
    .auto_out_c_ready(atomics_auto_out_c_ready),
    .auto_out_c_valid(atomics_auto_out_c_valid),
    .auto_out_c_bits_opcode(atomics_auto_out_c_bits_opcode),
    .auto_out_c_bits_param(atomics_auto_out_c_bits_param),
    .auto_out_c_bits_size(atomics_auto_out_c_bits_size),
    .auto_out_c_bits_source(atomics_auto_out_c_bits_source),
    .auto_out_c_bits_address(atomics_auto_out_c_bits_address),
    .auto_out_d_ready(atomics_auto_out_d_ready),
    .auto_out_d_valid(atomics_auto_out_d_valid),
    .auto_out_d_bits_opcode(atomics_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(atomics_auto_out_d_bits_param),
    .auto_out_d_bits_size(atomics_auto_out_d_bits_size),
    .auto_out_d_bits_source(atomics_auto_out_d_bits_source),
    .auto_out_d_bits_denied(atomics_auto_out_d_bits_denied),
    .auto_out_d_bits_data(atomics_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(atomics_auto_out_d_bits_corrupt),
    .auto_out_e_ready(atomics_auto_out_e_ready),
    .auto_out_e_valid(atomics_auto_out_e_valid),
    .auto_out_e_bits_sink(atomics_auto_out_e_bits_sink)
  );
  CHIPLINK_PREFIX_TLFIFOFixer_1 fixer_1 (
    .clock(fixer_1_clock),
    .reset(fixer_1_reset),
    .auto_in_a_ready(fixer_1_auto_in_a_ready),
    .auto_in_a_valid(fixer_1_auto_in_a_valid),
    .auto_in_a_bits_opcode(fixer_1_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(fixer_1_auto_in_a_bits_param),
    .auto_in_a_bits_size(fixer_1_auto_in_a_bits_size),
    .auto_in_a_bits_source(fixer_1_auto_in_a_bits_source),
    .auto_in_a_bits_address(fixer_1_auto_in_a_bits_address),
    .auto_in_a_bits_mask(fixer_1_auto_in_a_bits_mask),
    .auto_in_a_bits_data(fixer_1_auto_in_a_bits_data),
    .auto_in_c_ready(fixer_1_auto_in_c_ready),
    .auto_in_c_valid(fixer_1_auto_in_c_valid),
    .auto_in_c_bits_opcode(fixer_1_auto_in_c_bits_opcode),
    .auto_in_c_bits_param(fixer_1_auto_in_c_bits_param),
    .auto_in_c_bits_size(fixer_1_auto_in_c_bits_size),
    .auto_in_c_bits_source(fixer_1_auto_in_c_bits_source),
    .auto_in_c_bits_address(fixer_1_auto_in_c_bits_address),
    .auto_in_d_ready(fixer_1_auto_in_d_ready),
    .auto_in_d_valid(fixer_1_auto_in_d_valid),
    .auto_in_d_bits_opcode(fixer_1_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(fixer_1_auto_in_d_bits_param),
    .auto_in_d_bits_size(fixer_1_auto_in_d_bits_size),
    .auto_in_d_bits_source(fixer_1_auto_in_d_bits_source),
    .auto_in_d_bits_denied(fixer_1_auto_in_d_bits_denied),
    .auto_in_d_bits_data(fixer_1_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(fixer_1_auto_in_d_bits_corrupt),
    .auto_in_e_ready(fixer_1_auto_in_e_ready),
    .auto_in_e_valid(fixer_1_auto_in_e_valid),
    .auto_in_e_bits_sink(fixer_1_auto_in_e_bits_sink),
    .auto_out_a_ready(fixer_1_auto_out_a_ready),
    .auto_out_a_valid(fixer_1_auto_out_a_valid),
    .auto_out_a_bits_opcode(fixer_1_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(fixer_1_auto_out_a_bits_param),
    .auto_out_a_bits_size(fixer_1_auto_out_a_bits_size),
    .auto_out_a_bits_source(fixer_1_auto_out_a_bits_source),
    .auto_out_a_bits_address(fixer_1_auto_out_a_bits_address),
    .auto_out_a_bits_mask(fixer_1_auto_out_a_bits_mask),
    .auto_out_a_bits_data(fixer_1_auto_out_a_bits_data),
    .auto_out_c_ready(fixer_1_auto_out_c_ready),
    .auto_out_c_valid(fixer_1_auto_out_c_valid),
    .auto_out_c_bits_opcode(fixer_1_auto_out_c_bits_opcode),
    .auto_out_c_bits_param(fixer_1_auto_out_c_bits_param),
    .auto_out_c_bits_size(fixer_1_auto_out_c_bits_size),
    .auto_out_c_bits_source(fixer_1_auto_out_c_bits_source),
    .auto_out_c_bits_address(fixer_1_auto_out_c_bits_address),
    .auto_out_d_ready(fixer_1_auto_out_d_ready),
    .auto_out_d_valid(fixer_1_auto_out_d_valid),
    .auto_out_d_bits_opcode(fixer_1_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(fixer_1_auto_out_d_bits_param),
    .auto_out_d_bits_size(fixer_1_auto_out_d_bits_size),
    .auto_out_d_bits_source(fixer_1_auto_out_d_bits_source),
    .auto_out_d_bits_denied(fixer_1_auto_out_d_bits_denied),
    .auto_out_d_bits_data(fixer_1_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(fixer_1_auto_out_d_bits_corrupt),
    .auto_out_e_ready(fixer_1_auto_out_e_ready),
    .auto_out_e_valid(fixer_1_auto_out_e_valid),
    .auto_out_e_bits_sink(fixer_1_auto_out_e_bits_sink)
  );
  CHIPLINK_PREFIX_TLHintHandler hints (
    .clock(hints_clock),
    .reset(hints_reset),
    .auto_in_a_ready(hints_auto_in_a_ready),
    .auto_in_a_valid(hints_auto_in_a_valid),
    .auto_in_a_bits_opcode(hints_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(hints_auto_in_a_bits_param),
    .auto_in_a_bits_size(hints_auto_in_a_bits_size),
    .auto_in_a_bits_source(hints_auto_in_a_bits_source),
    .auto_in_a_bits_address(hints_auto_in_a_bits_address),
    .auto_in_a_bits_mask(hints_auto_in_a_bits_mask),
    .auto_in_a_bits_data(hints_auto_in_a_bits_data),
    .auto_in_c_ready(hints_auto_in_c_ready),
    .auto_in_c_valid(hints_auto_in_c_valid),
    .auto_in_c_bits_opcode(hints_auto_in_c_bits_opcode),
    .auto_in_c_bits_param(hints_auto_in_c_bits_param),
    .auto_in_c_bits_size(hints_auto_in_c_bits_size),
    .auto_in_c_bits_source(hints_auto_in_c_bits_source),
    .auto_in_c_bits_address(hints_auto_in_c_bits_address),
    .auto_in_d_ready(hints_auto_in_d_ready),
    .auto_in_d_valid(hints_auto_in_d_valid),
    .auto_in_d_bits_opcode(hints_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(hints_auto_in_d_bits_param),
    .auto_in_d_bits_size(hints_auto_in_d_bits_size),
    .auto_in_d_bits_source(hints_auto_in_d_bits_source),
    .auto_in_d_bits_denied(hints_auto_in_d_bits_denied),
    .auto_in_d_bits_data(hints_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(hints_auto_in_d_bits_corrupt),
    .auto_in_e_ready(hints_auto_in_e_ready),
    .auto_in_e_valid(hints_auto_in_e_valid),
    .auto_in_e_bits_sink(hints_auto_in_e_bits_sink),
    .auto_out_a_ready(hints_auto_out_a_ready),
    .auto_out_a_valid(hints_auto_out_a_valid),
    .auto_out_a_bits_opcode(hints_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(hints_auto_out_a_bits_param),
    .auto_out_a_bits_size(hints_auto_out_a_bits_size),
    .auto_out_a_bits_source(hints_auto_out_a_bits_source),
    .auto_out_a_bits_address(hints_auto_out_a_bits_address),
    .auto_out_a_bits_mask(hints_auto_out_a_bits_mask),
    .auto_out_a_bits_data(hints_auto_out_a_bits_data),
    .auto_out_c_ready(hints_auto_out_c_ready),
    .auto_out_c_valid(hints_auto_out_c_valid),
    .auto_out_c_bits_opcode(hints_auto_out_c_bits_opcode),
    .auto_out_c_bits_param(hints_auto_out_c_bits_param),
    .auto_out_c_bits_size(hints_auto_out_c_bits_size),
    .auto_out_c_bits_source(hints_auto_out_c_bits_source),
    .auto_out_c_bits_address(hints_auto_out_c_bits_address),
    .auto_out_d_ready(hints_auto_out_d_ready),
    .auto_out_d_valid(hints_auto_out_d_valid),
    .auto_out_d_bits_opcode(hints_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(hints_auto_out_d_bits_param),
    .auto_out_d_bits_size(hints_auto_out_d_bits_size),
    .auto_out_d_bits_source(hints_auto_out_d_bits_source),
    .auto_out_d_bits_denied(hints_auto_out_d_bits_denied),
    .auto_out_d_bits_data(hints_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(hints_auto_out_d_bits_corrupt),
    .auto_out_e_ready(hints_auto_out_e_ready),
    .auto_out_e_valid(hints_auto_out_e_valid),
    .auto_out_e_bits_sink(hints_auto_out_e_bits_sink)
  );
  CHIPLINK_PREFIX_TLWidthWidget_1 widget_1 (
    .clock(widget_1_clock),
    .reset(widget_1_reset),
    .auto_in_a_ready(widget_1_auto_in_a_ready),
    .auto_in_a_valid(widget_1_auto_in_a_valid),
    .auto_in_a_bits_opcode(widget_1_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(widget_1_auto_in_a_bits_param),
    .auto_in_a_bits_size(widget_1_auto_in_a_bits_size),
    .auto_in_a_bits_source(widget_1_auto_in_a_bits_source),
    .auto_in_a_bits_address(widget_1_auto_in_a_bits_address),
    .auto_in_a_bits_mask(widget_1_auto_in_a_bits_mask),
    .auto_in_a_bits_data(widget_1_auto_in_a_bits_data),
    .auto_in_c_ready(widget_1_auto_in_c_ready),
    .auto_in_c_valid(widget_1_auto_in_c_valid),
    .auto_in_c_bits_opcode(widget_1_auto_in_c_bits_opcode),
    .auto_in_c_bits_param(widget_1_auto_in_c_bits_param),
    .auto_in_c_bits_size(widget_1_auto_in_c_bits_size),
    .auto_in_c_bits_source(widget_1_auto_in_c_bits_source),
    .auto_in_c_bits_address(widget_1_auto_in_c_bits_address),
    .auto_in_d_ready(widget_1_auto_in_d_ready),
    .auto_in_d_valid(widget_1_auto_in_d_valid),
    .auto_in_d_bits_opcode(widget_1_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(widget_1_auto_in_d_bits_param),
    .auto_in_d_bits_size(widget_1_auto_in_d_bits_size),
    .auto_in_d_bits_source(widget_1_auto_in_d_bits_source),
    .auto_in_d_bits_denied(widget_1_auto_in_d_bits_denied),
    .auto_in_d_bits_data(widget_1_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt(widget_1_auto_in_d_bits_corrupt),
    .auto_in_e_ready(widget_1_auto_in_e_ready),
    .auto_in_e_valid(widget_1_auto_in_e_valid),
    .auto_in_e_bits_sink(widget_1_auto_in_e_bits_sink),
    .auto_out_a_ready(widget_1_auto_out_a_ready),
    .auto_out_a_valid(widget_1_auto_out_a_valid),
    .auto_out_a_bits_opcode(widget_1_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(widget_1_auto_out_a_bits_param),
    .auto_out_a_bits_size(widget_1_auto_out_a_bits_size),
    .auto_out_a_bits_source(widget_1_auto_out_a_bits_source),
    .auto_out_a_bits_address(widget_1_auto_out_a_bits_address),
    .auto_out_a_bits_mask(widget_1_auto_out_a_bits_mask),
    .auto_out_a_bits_data(widget_1_auto_out_a_bits_data),
    .auto_out_c_ready(widget_1_auto_out_c_ready),
    .auto_out_c_valid(widget_1_auto_out_c_valid),
    .auto_out_c_bits_opcode(widget_1_auto_out_c_bits_opcode),
    .auto_out_c_bits_param(widget_1_auto_out_c_bits_param),
    .auto_out_c_bits_size(widget_1_auto_out_c_bits_size),
    .auto_out_c_bits_source(widget_1_auto_out_c_bits_source),
    .auto_out_c_bits_address(widget_1_auto_out_c_bits_address),
    .auto_out_d_ready(widget_1_auto_out_d_ready),
    .auto_out_d_valid(widget_1_auto_out_d_valid),
    .auto_out_d_bits_opcode(widget_1_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(widget_1_auto_out_d_bits_param),
    .auto_out_d_bits_size(widget_1_auto_out_d_bits_size),
    .auto_out_d_bits_source(widget_1_auto_out_d_bits_source),
    .auto_out_d_bits_denied(widget_1_auto_out_d_bits_denied),
    .auto_out_d_bits_data(widget_1_auto_out_d_bits_data),
    .auto_out_d_bits_corrupt(widget_1_auto_out_d_bits_corrupt),
    .auto_out_e_ready(widget_1_auto_out_e_ready),
    .auto_out_e_valid(widget_1_auto_out_e_valid),
    .auto_out_e_bits_sink(widget_1_auto_out_e_bits_sink)
  );
  CHIPLINK_PREFIX_TLWidthWidget_2 widget_2 (
    .clock(widget_2_clock),
    .reset(widget_2_reset),
    .auto_in_a_ready(widget_2_auto_in_a_ready),
    .auto_in_a_valid(widget_2_auto_in_a_valid),
    .auto_in_a_bits_opcode(widget_2_auto_in_a_bits_opcode),
    .auto_in_a_bits_param(widget_2_auto_in_a_bits_param),
    .auto_in_a_bits_size(widget_2_auto_in_a_bits_size),
    .auto_in_a_bits_source(widget_2_auto_in_a_bits_source),
    .auto_in_a_bits_address(widget_2_auto_in_a_bits_address),
    .auto_in_a_bits_mask(widget_2_auto_in_a_bits_mask),
    .auto_in_a_bits_corrupt(widget_2_auto_in_a_bits_corrupt),
    .auto_in_c_ready(widget_2_auto_in_c_ready),
    .auto_in_c_valid(widget_2_auto_in_c_valid),
    .auto_in_c_bits_opcode(widget_2_auto_in_c_bits_opcode),
    .auto_in_c_bits_param(widget_2_auto_in_c_bits_param),
    .auto_in_c_bits_size(widget_2_auto_in_c_bits_size),
    .auto_in_c_bits_source(widget_2_auto_in_c_bits_source),
    .auto_in_c_bits_address(widget_2_auto_in_c_bits_address),
    .auto_in_d_ready(widget_2_auto_in_d_ready),
    .auto_in_d_valid(widget_2_auto_in_d_valid),
    .auto_in_d_bits_opcode(widget_2_auto_in_d_bits_opcode),
    .auto_in_d_bits_param(widget_2_auto_in_d_bits_param),
    .auto_in_d_bits_size(widget_2_auto_in_d_bits_size),
    .auto_in_d_bits_source(widget_2_auto_in_d_bits_source),
    .auto_in_d_bits_denied(widget_2_auto_in_d_bits_denied),
    .auto_in_d_bits_corrupt(widget_2_auto_in_d_bits_corrupt),
    .auto_in_e_valid(widget_2_auto_in_e_valid),
    .auto_out_a_ready(widget_2_auto_out_a_ready),
    .auto_out_a_valid(widget_2_auto_out_a_valid),
    .auto_out_a_bits_opcode(widget_2_auto_out_a_bits_opcode),
    .auto_out_a_bits_param(widget_2_auto_out_a_bits_param),
    .auto_out_a_bits_size(widget_2_auto_out_a_bits_size),
    .auto_out_a_bits_source(widget_2_auto_out_a_bits_source),
    .auto_out_a_bits_address(widget_2_auto_out_a_bits_address),
    .auto_out_a_bits_mask(widget_2_auto_out_a_bits_mask),
    .auto_out_a_bits_corrupt(widget_2_auto_out_a_bits_corrupt),
    .auto_out_c_ready(widget_2_auto_out_c_ready),
    .auto_out_c_valid(widget_2_auto_out_c_valid),
    .auto_out_c_bits_opcode(widget_2_auto_out_c_bits_opcode),
    .auto_out_c_bits_param(widget_2_auto_out_c_bits_param),
    .auto_out_c_bits_size(widget_2_auto_out_c_bits_size),
    .auto_out_c_bits_source(widget_2_auto_out_c_bits_source),
    .auto_out_c_bits_address(widget_2_auto_out_c_bits_address),
    .auto_out_d_ready(widget_2_auto_out_d_ready),
    .auto_out_d_valid(widget_2_auto_out_d_valid),
    .auto_out_d_bits_opcode(widget_2_auto_out_d_bits_opcode),
    .auto_out_d_bits_param(widget_2_auto_out_d_bits_param),
    .auto_out_d_bits_size(widget_2_auto_out_d_bits_size),
    .auto_out_d_bits_source(widget_2_auto_out_d_bits_source),
    .auto_out_d_bits_denied(widget_2_auto_out_d_bits_denied),
    .auto_out_d_bits_corrupt(widget_2_auto_out_d_bits_corrupt),
    .auto_out_e_valid(widget_2_auto_out_e_valid)
  );
`ifndef CHIPLINK_CONNECT_DIRECT_TL
  assign slave_0_awready = axi4index_auto_in_awready;
  assign slave_0_wready = axi4index_auto_in_wready;
  assign slave_0_bvalid = axi4index_auto_in_bvalid;
  assign slave_0_bid = axi4index_auto_in_bid;
  assign slave_0_bresp = axi4index_auto_in_bresp;
  assign slave_0_arready = axi4index_auto_in_arready;
  assign slave_0_rvalid = axi4index_auto_in_rvalid;
  assign slave_0_rid = axi4index_auto_in_rid;
  assign slave_0_rdata = axi4index_auto_in_rdata;
  assign slave_0_rresp = axi4index_auto_in_rresp;
  assign slave_0_rlast = axi4index_auto_in_rlast;
`endif
  assign master_mem_0_awvalid = axi4yank_1_auto_out_awvalid;
  assign master_mem_0_awid = axi4yank_1_auto_out_awid;
  assign master_mem_0_awaddr = axi4yank_1_auto_out_awaddr;
  assign master_mem_0_awlen = axi4yank_1_auto_out_awlen;
  assign master_mem_0_awsize = axi4yank_1_auto_out_awsize;
  assign master_mem_0_awburst = axi4yank_1_auto_out_awburst;
  assign master_mem_0_wvalid = axi4yank_1_auto_out_wvalid;
  assign master_mem_0_wdata = axi4yank_1_auto_out_wdata;
  assign master_mem_0_wstrb = axi4yank_1_auto_out_wstrb;
  assign master_mem_0_wlast = axi4yank_1_auto_out_wlast;
  assign master_mem_0_bready = axi4yank_1_auto_out_bready;
  assign master_mem_0_arvalid = axi4yank_1_auto_out_arvalid;
  assign master_mem_0_arid = axi4yank_1_auto_out_arid;
  assign master_mem_0_araddr = axi4yank_1_auto_out_araddr;
  assign master_mem_0_arlen = axi4yank_1_auto_out_arlen;
  assign master_mem_0_arsize = axi4yank_1_auto_out_arsize;
  assign master_mem_0_arburst = axi4yank_1_auto_out_arburst;
  assign master_mem_0_rready = axi4yank_1_auto_out_rready;
  assign fpga_io_c2b_clk = chiplink_auto_io_out_c2b_clk;
  assign fpga_io_c2b_rst = chiplink_auto_io_out_c2b_rst;
  assign fpga_io_c2b_send = chiplink_auto_io_out_c2b_send;
  assign fpga_io_c2b_data = chiplink_auto_io_out_c2b_data;
  assign xbar_clock = clock;
  assign xbar_reset = reset;
  assign xbar_auto_in_a_valid = atomics_auto_out_a_valid;
  assign xbar_auto_in_a_bits_opcode = atomics_auto_out_a_bits_opcode;
  assign xbar_auto_in_a_bits_param = atomics_auto_out_a_bits_param;
  assign xbar_auto_in_a_bits_size = atomics_auto_out_a_bits_size;
  assign xbar_auto_in_a_bits_source = atomics_auto_out_a_bits_source;
  assign xbar_auto_in_a_bits_address = atomics_auto_out_a_bits_address;
  assign xbar_auto_in_a_bits_mask = atomics_auto_out_a_bits_mask;
  assign xbar_auto_in_a_bits_data = atomics_auto_out_a_bits_data;
  assign xbar_auto_in_a_bits_corrupt = atomics_auto_out_a_bits_corrupt;
  assign xbar_auto_in_c_valid = atomics_auto_out_c_valid;
  assign xbar_auto_in_c_bits_opcode = atomics_auto_out_c_bits_opcode;
  assign xbar_auto_in_c_bits_param = atomics_auto_out_c_bits_param;
  assign xbar_auto_in_c_bits_size = atomics_auto_out_c_bits_size;
  assign xbar_auto_in_c_bits_source = atomics_auto_out_c_bits_source;
  assign xbar_auto_in_c_bits_address = atomics_auto_out_c_bits_address;
  assign xbar_auto_in_d_ready = atomics_auto_out_d_ready;
  assign xbar_auto_in_e_valid = atomics_auto_out_e_valid;
  assign xbar_auto_in_e_bits_sink = atomics_auto_out_e_bits_sink;
  assign xbar_auto_out_1_a_ready = widget_2_auto_in_a_ready;
  assign xbar_auto_out_1_c_ready = widget_2_auto_in_c_ready;
  assign xbar_auto_out_1_d_valid = widget_2_auto_in_d_valid;
  assign xbar_auto_out_1_d_bits_opcode = widget_2_auto_in_d_bits_opcode;
  assign xbar_auto_out_1_d_bits_param = widget_2_auto_in_d_bits_param;
  assign xbar_auto_out_1_d_bits_size = widget_2_auto_in_d_bits_size;
  assign xbar_auto_out_1_d_bits_source = widget_2_auto_in_d_bits_source;
  assign xbar_auto_out_1_d_bits_denied = widget_2_auto_in_d_bits_denied;
  assign xbar_auto_out_1_d_bits_corrupt = widget_2_auto_in_d_bits_corrupt;
  assign xbar_auto_out_0_a_ready = tl2axi4_auto_in_a_ready;
  assign xbar_auto_out_0_d_valid = tl2axi4_auto_in_d_valid;
  assign xbar_auto_out_0_d_bits_opcode = tl2axi4_auto_in_d_bits_opcode;
  assign xbar_auto_out_0_d_bits_size = tl2axi4_auto_in_d_bits_size;
  assign xbar_auto_out_0_d_bits_source = tl2axi4_auto_in_d_bits_source;
  assign xbar_auto_out_0_d_bits_denied = tl2axi4_auto_in_d_bits_denied;
  assign xbar_auto_out_0_d_bits_data = tl2axi4_auto_in_d_bits_data;
  assign xbar_auto_out_0_d_bits_corrupt = tl2axi4_auto_in_d_bits_corrupt;
  assign xbar_1_clock = clock;
  assign xbar_1_reset = reset;
  assign xbar_1_auto_in_a_valid = fixer_auto_out_a_valid;
  assign xbar_1_auto_in_a_bits_opcode = fixer_auto_out_a_bits_opcode;
  assign xbar_1_auto_in_a_bits_size = fixer_auto_out_a_bits_size;
  assign xbar_1_auto_in_a_bits_source = fixer_auto_out_a_bits_source;
  assign xbar_1_auto_in_a_bits_address = fixer_auto_out_a_bits_address;
  assign xbar_1_auto_in_a_bits_mask = fixer_auto_out_a_bits_mask;
  assign xbar_1_auto_in_a_bits_data = fixer_auto_out_a_bits_data;
  assign xbar_1_auto_in_d_ready = fixer_auto_out_d_ready;
  assign xbar_1_auto_out_1_a_ready = ferr_auto_in_a_ready;
  assign xbar_1_auto_out_1_d_valid = ferr_auto_in_d_valid;
  assign xbar_1_auto_out_1_d_bits_opcode = ferr_auto_in_d_bits_opcode;
  assign xbar_1_auto_out_1_d_bits_size = ferr_auto_in_d_bits_size;
  assign xbar_1_auto_out_1_d_bits_source = ferr_auto_in_d_bits_source;
  assign xbar_1_auto_out_1_d_bits_denied = ferr_auto_in_d_bits_denied;
  assign xbar_1_auto_out_1_d_bits_corrupt = ferr_auto_in_d_bits_corrupt;
  assign xbar_1_auto_out_0_a_ready = chiplink_auto_sbypass_node_in_in_a_ready;
  assign xbar_1_auto_out_0_d_valid = chiplink_auto_sbypass_node_in_in_d_valid;
  assign xbar_1_auto_out_0_d_bits_opcode = chiplink_auto_sbypass_node_in_in_d_bits_opcode;
  assign xbar_1_auto_out_0_d_bits_param = chiplink_auto_sbypass_node_in_in_d_bits_param;
  assign xbar_1_auto_out_0_d_bits_size = chiplink_auto_sbypass_node_in_in_d_bits_size;
  assign xbar_1_auto_out_0_d_bits_source = chiplink_auto_sbypass_node_in_in_d_bits_source;
  assign xbar_1_auto_out_0_d_bits_sink = chiplink_auto_sbypass_node_in_in_d_bits_sink;
  assign xbar_1_auto_out_0_d_bits_denied = chiplink_auto_sbypass_node_in_in_d_bits_denied;
  assign xbar_1_auto_out_0_d_bits_data = chiplink_auto_sbypass_node_in_in_d_bits_data;
  assign xbar_1_auto_out_0_d_bits_corrupt = chiplink_auto_sbypass_node_in_in_d_bits_corrupt;
  assign ferr_clock = clock;
  assign ferr_reset = reset;
  assign ferr_auto_in_a_valid = xbar_1_auto_out_1_a_valid;
  assign ferr_auto_in_a_bits_opcode = xbar_1_auto_out_1_a_bits_opcode;
  assign ferr_auto_in_a_bits_size = xbar_1_auto_out_1_a_bits_size;
  assign ferr_auto_in_a_bits_source = xbar_1_auto_out_1_a_bits_source;
  assign ferr_auto_in_a_bits_address = xbar_1_auto_out_1_a_bits_address;
  assign ferr_auto_in_a_bits_mask = xbar_1_auto_out_1_a_bits_mask;
  assign ferr_auto_in_d_ready = xbar_1_auto_out_1_d_ready;
  assign chiplink_clock = clock;
  assign chiplink_reset = reset;
  assign chiplink_auto_mbypass_out_a_ready = widget_1_auto_in_a_ready;
  assign chiplink_auto_mbypass_out_c_ready = widget_1_auto_in_c_ready;
  assign chiplink_auto_mbypass_out_d_valid = widget_1_auto_in_d_valid;
  assign chiplink_auto_mbypass_out_d_bits_opcode = widget_1_auto_in_d_bits_opcode;
  assign chiplink_auto_mbypass_out_d_bits_param = widget_1_auto_in_d_bits_param;
  assign chiplink_auto_mbypass_out_d_bits_size = widget_1_auto_in_d_bits_size;
  assign chiplink_auto_mbypass_out_d_bits_source = widget_1_auto_in_d_bits_source;
  assign chiplink_auto_mbypass_out_d_bits_denied = widget_1_auto_in_d_bits_denied;
  assign chiplink_auto_mbypass_out_d_bits_data = widget_1_auto_in_d_bits_data;
  assign chiplink_auto_mbypass_out_d_bits_corrupt = widget_1_auto_in_d_bits_corrupt;
  assign chiplink_auto_mbypass_out_e_ready = widget_1_auto_in_e_ready;
  assign chiplink_auto_sbypass_node_in_in_a_valid = xbar_1_auto_out_0_a_valid;
  assign chiplink_auto_sbypass_node_in_in_a_bits_opcode = xbar_1_auto_out_0_a_bits_opcode;
  assign chiplink_auto_sbypass_node_in_in_a_bits_size = xbar_1_auto_out_0_a_bits_size;
  assign chiplink_auto_sbypass_node_in_in_a_bits_source = xbar_1_auto_out_0_a_bits_source;
  assign chiplink_auto_sbypass_node_in_in_a_bits_address = xbar_1_auto_out_0_a_bits_address;
  assign chiplink_auto_sbypass_node_in_in_a_bits_mask = xbar_1_auto_out_0_a_bits_mask;
  assign chiplink_auto_sbypass_node_in_in_a_bits_data = xbar_1_auto_out_0_a_bits_data;
  assign chiplink_auto_sbypass_node_in_in_d_ready = xbar_1_auto_out_0_d_ready;
  assign chiplink_auto_io_out_b2c_clk = fpga_io_b2c_clk;
  assign chiplink_auto_io_out_b2c_rst = fpga_io_b2c_rst;
  assign chiplink_auto_io_out_b2c_send = fpga_io_b2c_send;
  assign chiplink_auto_io_out_b2c_data = fpga_io_b2c_data;
  assign fixer_clock = clock;
  assign fixer_reset = reset;
`ifndef CHIPLINK_CONNECT_DIRECT_TL
  assign fixer_auto_in_a_valid = widget_auto_out_a_valid;
  assign fixer_auto_in_a_bits_opcode = widget_auto_out_a_bits_opcode;
  assign fixer_auto_in_a_bits_size = widget_auto_out_a_bits_size;
  assign fixer_auto_in_a_bits_source = widget_auto_out_a_bits_source;
  assign fixer_auto_in_a_bits_address = widget_auto_out_a_bits_address;
  assign fixer_auto_in_a_bits_mask = widget_auto_out_a_bits_mask;
  assign fixer_auto_in_a_bits_data = widget_auto_out_a_bits_data;
  assign fixer_auto_in_d_ready = widget_auto_out_d_ready;
`else
  assign fixer_auto_in_a_valid = 1'b0;
  assign fixer_auto_in_a_bits_opcode = 3'b0;
  assign fixer_auto_in_a_bits_size = 3'b0;
  assign fixer_auto_in_a_bits_source = 4'b0;
  assign fixer_auto_in_a_bits_address = 32'b0;
  assign fixer_auto_in_a_bits_mask = 4'b0;
  assign fixer_auto_in_a_bits_data = 32'b0;
  assign fixer_auto_in_d_ready = 1'b0;
`endif
  assign fixer_auto_out_a_ready = xbar_1_auto_in_a_ready;
  assign fixer_auto_out_d_valid = xbar_1_auto_in_d_valid;
  assign fixer_auto_out_d_bits_opcode = xbar_1_auto_in_d_bits_opcode;
  assign fixer_auto_out_d_bits_param = xbar_1_auto_in_d_bits_param;
  assign fixer_auto_out_d_bits_size = xbar_1_auto_in_d_bits_size;
  assign fixer_auto_out_d_bits_source = xbar_1_auto_in_d_bits_source;
  assign fixer_auto_out_d_bits_sink = xbar_1_auto_in_d_bits_sink;
  assign fixer_auto_out_d_bits_denied = xbar_1_auto_in_d_bits_denied;
  assign fixer_auto_out_d_bits_data = xbar_1_auto_in_d_bits_data;
  assign fixer_auto_out_d_bits_corrupt = xbar_1_auto_in_d_bits_corrupt;
  assign widget_clock = clock;
  assign widget_reset = reset;
`ifndef CHIPLINK_CONNECT_DIRECT_TL
  assign widget_auto_in_a_valid = axi42tl_auto_out_a_valid;
  assign widget_auto_in_a_bits_opcode = axi42tl_auto_out_a_bits_opcode;
  assign widget_auto_in_a_bits_size = axi42tl_auto_out_a_bits_size;
  assign widget_auto_in_a_bits_source = axi42tl_auto_out_a_bits_source;
  assign widget_auto_in_a_bits_address = axi42tl_auto_out_a_bits_address;
  assign widget_auto_in_a_bits_mask = axi42tl_auto_out_a_bits_mask;
  assign widget_auto_in_a_bits_data = axi42tl_auto_out_a_bits_data;
  assign widget_auto_in_d_ready = axi42tl_auto_out_d_ready;

  assign widget_auto_out_a_ready = fixer_auto_in_a_ready;
  assign widget_auto_out_d_valid = fixer_auto_in_d_valid;
  assign widget_auto_out_d_bits_opcode = fixer_auto_in_d_bits_opcode;
  assign widget_auto_out_d_bits_param = fixer_auto_in_d_bits_param;
  assign widget_auto_out_d_bits_size = fixer_auto_in_d_bits_size;
  assign widget_auto_out_d_bits_source = fixer_auto_in_d_bits_source;
  assign widget_auto_out_d_bits_sink = fixer_auto_in_d_bits_sink;
  assign widget_auto_out_d_bits_denied = fixer_auto_in_d_bits_denied;
  assign widget_auto_out_d_bits_data = fixer_auto_in_d_bits_data;
  assign widget_auto_out_d_bits_corrupt = fixer_auto_in_d_bits_corrupt;
`else
`endif
  assign axi42tl_clock = clock;
  assign axi42tl_reset = reset;
  assign axi42tl_auto_in_awvalid = axi4yank_auto_out_awvalid;
  assign axi42tl_auto_in_awid = axi4yank_auto_out_awid;
  assign axi42tl_auto_in_awaddr = axi4yank_auto_out_awaddr;
  assign axi42tl_auto_in_awlen = axi4yank_auto_out_awlen;
  assign axi42tl_auto_in_awsize = axi4yank_auto_out_awsize;
  assign axi42tl_auto_in_wvalid = axi4yank_auto_out_wvalid;
  assign axi42tl_auto_in_wdata = axi4yank_auto_out_wdata;
  assign axi42tl_auto_in_wstrb = axi4yank_auto_out_wstrb;
  assign axi42tl_auto_in_wlast = axi4yank_auto_out_wlast;
  assign axi42tl_auto_in_bready = axi4yank_auto_out_bready;
  assign axi42tl_auto_in_arvalid = axi4yank_auto_out_arvalid;
  assign axi42tl_auto_in_arid = axi4yank_auto_out_arid;
  assign axi42tl_auto_in_araddr = axi4yank_auto_out_araddr;
  assign axi42tl_auto_in_arlen = axi4yank_auto_out_arlen;
  assign axi42tl_auto_in_arsize = axi4yank_auto_out_arsize;
  assign axi42tl_auto_in_rready = axi4yank_auto_out_rready;
`ifndef CHIPLINK_CONNECT_DIRECT_TL
  assign axi42tl_auto_out_a_ready = widget_auto_in_a_ready;
  assign axi42tl_auto_out_d_valid = widget_auto_in_d_valid;
  assign axi42tl_auto_out_d_bits_opcode = widget_auto_in_d_bits_opcode;
  assign axi42tl_auto_out_d_bits_size = widget_auto_in_d_bits_size;
  assign axi42tl_auto_out_d_bits_source = widget_auto_in_d_bits_source;
  assign axi42tl_auto_out_d_bits_denied = widget_auto_in_d_bits_denied;
  assign axi42tl_auto_out_d_bits_data = widget_auto_in_d_bits_data;
  assign axi42tl_auto_out_d_bits_corrupt = widget_auto_in_d_bits_corrupt;

  assign axi4yank_clock = clock;
  assign axi4yank_reset = reset;
  assign axi4yank_auto_in_awvalid = axi4frag_auto_out_awvalid;
  assign axi4yank_auto_in_awid = axi4frag_auto_out_awid;
  assign axi4yank_auto_in_awaddr = axi4frag_auto_out_awaddr;
  assign axi4yank_auto_in_awlen = axi4frag_auto_out_awlen;
  assign axi4yank_auto_in_awsize = axi4frag_auto_out_awsize;
  assign axi4yank_auto_in_awecho_extra_id = axi4frag_auto_out_awecho_extra_id;
  assign axi4yank_auto_in_awecho_real_last = axi4frag_auto_out_awecho_real_last;
  assign axi4yank_auto_in_wvalid = axi4frag_auto_out_wvalid;
  assign axi4yank_auto_in_wdata = axi4frag_auto_out_wdata;
  assign axi4yank_auto_in_wstrb = axi4frag_auto_out_wstrb;
  assign axi4yank_auto_in_wlast = axi4frag_auto_out_wlast;
  assign axi4yank_auto_in_bready = axi4frag_auto_out_bready;
  assign axi4yank_auto_in_arvalid = axi4frag_auto_out_arvalid;
  assign axi4yank_auto_in_arid = axi4frag_auto_out_arid;
  assign axi4yank_auto_in_araddr = axi4frag_auto_out_araddr;
  assign axi4yank_auto_in_arlen = axi4frag_auto_out_arlen;
  assign axi4yank_auto_in_arsize = axi4frag_auto_out_arsize;
  assign axi4yank_auto_in_arecho_extra_id = axi4frag_auto_out_arecho_extra_id;
  assign axi4yank_auto_in_arecho_real_last = axi4frag_auto_out_arecho_real_last;
  assign axi4yank_auto_in_rready = axi4frag_auto_out_rready;
  assign axi4yank_auto_out_awready = axi42tl_auto_in_awready;
  assign axi4yank_auto_out_wready = axi42tl_auto_in_wready;
  assign axi4yank_auto_out_bvalid = axi42tl_auto_in_bvalid;
  assign axi4yank_auto_out_bid = axi42tl_auto_in_bid;
  assign axi4yank_auto_out_bresp = axi42tl_auto_in_bresp;
  assign axi4yank_auto_out_arready = axi42tl_auto_in_arready;
  assign axi4yank_auto_out_rvalid = axi42tl_auto_in_rvalid;
  assign axi4yank_auto_out_rid = axi42tl_auto_in_rid;
  assign axi4yank_auto_out_rdata = axi42tl_auto_in_rdata;
  assign axi4yank_auto_out_rresp = axi42tl_auto_in_rresp;
  assign axi4yank_auto_out_rlast = axi42tl_auto_in_rlast;
  assign axi4frag_clock = clock;
  assign axi4frag_reset = reset;
  assign axi4frag_auto_in_awvalid = axi4index_auto_out_awvalid;
  assign axi4frag_auto_in_awid = axi4index_auto_out_awid;
  assign axi4frag_auto_in_awaddr = axi4index_auto_out_awaddr;
  assign axi4frag_auto_in_awlen = axi4index_auto_out_awlen;
  assign axi4frag_auto_in_awsize = axi4index_auto_out_awsize;
  assign axi4frag_auto_in_awburst = axi4index_auto_out_awburst;
  assign axi4frag_auto_in_awecho_extra_id = axi4index_auto_out_awecho_extra_id;
  assign axi4frag_auto_in_wvalid = axi4index_auto_out_wvalid;
  assign axi4frag_auto_in_wdata = axi4index_auto_out_wdata;
  assign axi4frag_auto_in_wstrb = axi4index_auto_out_wstrb;
  assign axi4frag_auto_in_wlast = axi4index_auto_out_wlast;
  assign axi4frag_auto_in_bready = axi4index_auto_out_bready;
  assign axi4frag_auto_in_arvalid = axi4index_auto_out_arvalid;
  assign axi4frag_auto_in_arid = axi4index_auto_out_arid;
  assign axi4frag_auto_in_araddr = axi4index_auto_out_araddr;
  assign axi4frag_auto_in_arlen = axi4index_auto_out_arlen;
  assign axi4frag_auto_in_arsize = axi4index_auto_out_arsize;
  assign axi4frag_auto_in_arburst = axi4index_auto_out_arburst;
  assign axi4frag_auto_in_arecho_extra_id = axi4index_auto_out_arecho_extra_id;
  assign axi4frag_auto_in_rready = axi4index_auto_out_rready;
  assign axi4frag_auto_out_awready = axi4yank_auto_in_awready;
  assign axi4frag_auto_out_wready = axi4yank_auto_in_wready;
  assign axi4frag_auto_out_bvalid = axi4yank_auto_in_bvalid;
  assign axi4frag_auto_out_bid = axi4yank_auto_in_bid;
  assign axi4frag_auto_out_bresp = axi4yank_auto_in_bresp;
  assign axi4frag_auto_out_becho_extra_id = axi4yank_auto_in_becho_extra_id;
  assign axi4frag_auto_out_becho_real_last = axi4yank_auto_in_becho_real_last;
  assign axi4frag_auto_out_arready = axi4yank_auto_in_arready;
  assign axi4frag_auto_out_rvalid = axi4yank_auto_in_rvalid;
  assign axi4frag_auto_out_rid = axi4yank_auto_in_rid;
  assign axi4frag_auto_out_rdata = axi4yank_auto_in_rdata;
  assign axi4frag_auto_out_rresp = axi4yank_auto_in_rresp;
  assign axi4frag_auto_out_recho_extra_id = axi4yank_auto_in_recho_extra_id;
  assign axi4frag_auto_out_recho_real_last = axi4yank_auto_in_recho_real_last;
  assign axi4frag_auto_out_rlast = axi4yank_auto_in_rlast;
`else
  assign axi42tl_auto_out_a_ready = 1'b0;
  assign axi42tl_auto_out_d_valid = 1'b0;
  assign axi42tl_auto_out_d_bits_opcode = 3'b0;
  assign axi42tl_auto_out_d_bits_size = 3'b0;
  assign axi42tl_auto_out_d_bits_source = 4'b1;
  assign axi42tl_auto_out_d_bits_denied = 1'b0;
  assign axi42tl_auto_out_d_bits_data = 64'b0;
  assign axi42tl_auto_out_d_bits_corrupt = 1'b0;
`endif

`ifndef CHIPLINK_CONNECT_DIRECT_TL
  assign axi4index_auto_in_awvalid = slave_0_awvalid;
  assign axi4index_auto_in_awid = slave_0_awid;
  assign axi4index_auto_in_awaddr = slave_0_awaddr;
  assign axi4index_auto_in_awlen = slave_0_awlen;
  assign axi4index_auto_in_awsize = slave_0_awsize;
  assign axi4index_auto_in_awburst = slave_0_awburst;
  assign axi4index_auto_in_wvalid = slave_0_wvalid;
  assign axi4index_auto_in_wdata = slave_0_wdata;
  assign axi4index_auto_in_wstrb = slave_0_wstrb;
  assign axi4index_auto_in_wlast = slave_0_wlast;
  assign axi4index_auto_in_bready = slave_0_bready;
  assign axi4index_auto_in_arvalid = slave_0_arvalid;
  assign axi4index_auto_in_arid = slave_0_arid;
  assign axi4index_auto_in_araddr = slave_0_araddr;
  assign axi4index_auto_in_arlen = slave_0_arlen;
  assign axi4index_auto_in_arsize = slave_0_arsize;
  assign axi4index_auto_in_arburst = slave_0_arburst;
  assign axi4index_auto_in_rready = slave_0_rready;
`endif
  assign axi4index_auto_out_awready = axi4frag_auto_in_awready;
  assign axi4index_auto_out_wready = axi4frag_auto_in_wready;
  assign axi4index_auto_out_bvalid = axi4frag_auto_in_bvalid;
  assign axi4index_auto_out_bid = axi4frag_auto_in_bid;
  assign axi4index_auto_out_bresp = axi4frag_auto_in_bresp;
  assign axi4index_auto_out_becho_extra_id = axi4frag_auto_in_becho_extra_id;
  assign axi4index_auto_out_arready = axi4frag_auto_in_arready;
  assign axi4index_auto_out_rvalid = axi4frag_auto_in_rvalid;
  assign axi4index_auto_out_rid = axi4frag_auto_in_rid;
  assign axi4index_auto_out_rdata = axi4frag_auto_in_rdata;
  assign axi4index_auto_out_rresp = axi4frag_auto_in_rresp;
  assign axi4index_auto_out_recho_extra_id = axi4frag_auto_in_recho_extra_id;
  assign axi4index_auto_out_rlast = axi4frag_auto_in_rlast;
  assign axi4yank_1_clock = clock;
  assign axi4yank_1_reset = reset;
  assign axi4yank_1_auto_in_awvalid = axi4index_1_auto_out_awvalid;
  assign axi4yank_1_auto_in_awid = axi4index_1_auto_out_awid;
  assign axi4yank_1_auto_in_awaddr = axi4index_1_auto_out_awaddr;
  assign axi4yank_1_auto_in_awlen = axi4index_1_auto_out_awlen;
  assign axi4yank_1_auto_in_awsize = axi4index_1_auto_out_awsize;
  assign axi4yank_1_auto_in_awburst = axi4index_1_auto_out_awburst;
  assign axi4yank_1_auto_in_awecho_tl_state_size = axi4index_1_auto_out_awecho_tl_state_size;
  assign axi4yank_1_auto_in_awecho_tl_state_source = axi4index_1_auto_out_awecho_tl_state_source;
  assign axi4yank_1_auto_in_awecho_extra_id = axi4index_1_auto_out_awecho_extra_id;
  assign axi4yank_1_auto_in_wvalid = axi4index_1_auto_out_wvalid;
  assign axi4yank_1_auto_in_wdata = axi4index_1_auto_out_wdata;
  assign axi4yank_1_auto_in_wstrb = axi4index_1_auto_out_wstrb;
  assign axi4yank_1_auto_in_wlast = axi4index_1_auto_out_wlast;
  assign axi4yank_1_auto_in_bready = axi4index_1_auto_out_bready;
  assign axi4yank_1_auto_in_arvalid = axi4index_1_auto_out_arvalid;
  assign axi4yank_1_auto_in_arid = axi4index_1_auto_out_arid;
  assign axi4yank_1_auto_in_araddr = axi4index_1_auto_out_araddr;
  assign axi4yank_1_auto_in_arlen = axi4index_1_auto_out_arlen;
  assign axi4yank_1_auto_in_arsize = axi4index_1_auto_out_arsize;
  assign axi4yank_1_auto_in_arburst = axi4index_1_auto_out_arburst;
  assign axi4yank_1_auto_in_arecho_tl_state_size = axi4index_1_auto_out_arecho_tl_state_size;
  assign axi4yank_1_auto_in_arecho_tl_state_source = axi4index_1_auto_out_arecho_tl_state_source;
  assign axi4yank_1_auto_in_arecho_extra_id = axi4index_1_auto_out_arecho_extra_id;
  assign axi4yank_1_auto_in_rready = axi4index_1_auto_out_rready;
  assign axi4yank_1_auto_out_awready = master_mem_0_awready;
  assign axi4yank_1_auto_out_wready = master_mem_0_wready;
  assign axi4yank_1_auto_out_bvalid = master_mem_0_bvalid;
  assign axi4yank_1_auto_out_bid = master_mem_0_bid;
  assign axi4yank_1_auto_out_bresp = master_mem_0_bresp;
  assign axi4yank_1_auto_out_arready = master_mem_0_arready;
  assign axi4yank_1_auto_out_rvalid = master_mem_0_rvalid;
  assign axi4yank_1_auto_out_rid = master_mem_0_rid;
  assign axi4yank_1_auto_out_rdata = master_mem_0_rdata;
  assign axi4yank_1_auto_out_rresp = master_mem_0_rresp;
  assign axi4yank_1_auto_out_rlast = master_mem_0_rlast;
  assign axi4index_1_auto_in_awvalid = tl2axi4_auto_out_awvalid;
  assign axi4index_1_auto_in_awid = tl2axi4_auto_out_awid;
  assign axi4index_1_auto_in_awaddr = tl2axi4_auto_out_awaddr;
  assign axi4index_1_auto_in_awlen = tl2axi4_auto_out_awlen;
  assign axi4index_1_auto_in_awsize = tl2axi4_auto_out_awsize;
  assign axi4index_1_auto_in_awburst = tl2axi4_auto_out_awburst;
  assign axi4index_1_auto_in_awecho_tl_state_size = tl2axi4_auto_out_awecho_tl_state_size;
  assign axi4index_1_auto_in_awecho_tl_state_source = tl2axi4_auto_out_awecho_tl_state_source;
  assign axi4index_1_auto_in_wvalid = tl2axi4_auto_out_wvalid;
  assign axi4index_1_auto_in_wdata = tl2axi4_auto_out_wdata;
  assign axi4index_1_auto_in_wstrb = tl2axi4_auto_out_wstrb;
  assign axi4index_1_auto_in_wlast = tl2axi4_auto_out_wlast;
  assign axi4index_1_auto_in_bready = tl2axi4_auto_out_bready;
  assign axi4index_1_auto_in_arvalid = tl2axi4_auto_out_arvalid;
  assign axi4index_1_auto_in_arid = tl2axi4_auto_out_arid;
  assign axi4index_1_auto_in_araddr = tl2axi4_auto_out_araddr;
  assign axi4index_1_auto_in_arlen = tl2axi4_auto_out_arlen;
  assign axi4index_1_auto_in_arsize = tl2axi4_auto_out_arsize;
  assign axi4index_1_auto_in_arburst = tl2axi4_auto_out_arburst;
  assign axi4index_1_auto_in_arecho_tl_state_size = tl2axi4_auto_out_arecho_tl_state_size;
  assign axi4index_1_auto_in_arecho_tl_state_source = tl2axi4_auto_out_arecho_tl_state_source;
  assign axi4index_1_auto_in_rready = tl2axi4_auto_out_rready;
  assign axi4index_1_auto_out_awready = axi4yank_1_auto_in_awready;
  assign axi4index_1_auto_out_wready = axi4yank_1_auto_in_wready;
  assign axi4index_1_auto_out_bvalid = axi4yank_1_auto_in_bvalid;
  assign axi4index_1_auto_out_bid = axi4yank_1_auto_in_bid;
  assign axi4index_1_auto_out_bresp = axi4yank_1_auto_in_bresp;
  assign axi4index_1_auto_out_becho_tl_state_size = axi4yank_1_auto_in_becho_tl_state_size;
  assign axi4index_1_auto_out_becho_tl_state_source = axi4yank_1_auto_in_becho_tl_state_source;
  assign axi4index_1_auto_out_becho_extra_id = axi4yank_1_auto_in_becho_extra_id;
  assign axi4index_1_auto_out_arready = axi4yank_1_auto_in_arready;
  assign axi4index_1_auto_out_rvalid = axi4yank_1_auto_in_rvalid;
  assign axi4index_1_auto_out_rid = axi4yank_1_auto_in_rid;
  assign axi4index_1_auto_out_rdata = axi4yank_1_auto_in_rdata;
  assign axi4index_1_auto_out_rresp = axi4yank_1_auto_in_rresp;
  assign axi4index_1_auto_out_recho_tl_state_size = axi4yank_1_auto_in_recho_tl_state_size;
  assign axi4index_1_auto_out_recho_tl_state_source = axi4yank_1_auto_in_recho_tl_state_source;
  assign axi4index_1_auto_out_recho_extra_id = axi4yank_1_auto_in_recho_extra_id;
  assign axi4index_1_auto_out_rlast = axi4yank_1_auto_in_rlast;
  assign tl2axi4_clock = clock;
  assign tl2axi4_reset = reset;
  assign tl2axi4_auto_in_a_valid = xbar_auto_out_0_a_valid;
  assign tl2axi4_auto_in_a_bits_opcode = xbar_auto_out_0_a_bits_opcode;
  assign tl2axi4_auto_in_a_bits_param = xbar_auto_out_0_a_bits_param;
  assign tl2axi4_auto_in_a_bits_size = xbar_auto_out_0_a_bits_size;
  assign tl2axi4_auto_in_a_bits_source = xbar_auto_out_0_a_bits_source;
  assign tl2axi4_auto_in_a_bits_address = xbar_auto_out_0_a_bits_address;
  assign tl2axi4_auto_in_a_bits_mask = xbar_auto_out_0_a_bits_mask;
  assign tl2axi4_auto_in_a_bits_data = xbar_auto_out_0_a_bits_data;
  assign tl2axi4_auto_in_a_bits_corrupt = xbar_auto_out_0_a_bits_corrupt;
  assign tl2axi4_auto_in_d_ready = xbar_auto_out_0_d_ready;
  assign tl2axi4_auto_out_awready = axi4index_1_auto_in_awready;
  assign tl2axi4_auto_out_wready = axi4index_1_auto_in_wready;
  assign tl2axi4_auto_out_bvalid = axi4index_1_auto_in_bvalid;
  assign tl2axi4_auto_out_bid = axi4index_1_auto_in_bid;
  assign tl2axi4_auto_out_bresp = axi4index_1_auto_in_bresp;
  assign tl2axi4_auto_out_becho_tl_state_size = axi4index_1_auto_in_becho_tl_state_size;
  assign tl2axi4_auto_out_becho_tl_state_source = axi4index_1_auto_in_becho_tl_state_source;
  assign tl2axi4_auto_out_arready = axi4index_1_auto_in_arready;
  assign tl2axi4_auto_out_rvalid = axi4index_1_auto_in_rvalid;
  assign tl2axi4_auto_out_rid = axi4index_1_auto_in_rid;
  assign tl2axi4_auto_out_rdata = axi4index_1_auto_in_rdata;
  assign tl2axi4_auto_out_rresp = axi4index_1_auto_in_rresp;
  assign tl2axi4_auto_out_recho_tl_state_size = axi4index_1_auto_in_recho_tl_state_size;
  assign tl2axi4_auto_out_recho_tl_state_source = axi4index_1_auto_in_recho_tl_state_source;
  assign tl2axi4_auto_out_rlast = axi4index_1_auto_in_rlast;
  assign err_clock = clock;
  assign err_reset = reset;
  assign err_auto_in_a_valid = widget_2_auto_out_a_valid;
  assign err_auto_in_a_bits_opcode = widget_2_auto_out_a_bits_opcode;
  assign err_auto_in_a_bits_param = widget_2_auto_out_a_bits_param;
  assign err_auto_in_a_bits_size = widget_2_auto_out_a_bits_size;
  assign err_auto_in_a_bits_source = widget_2_auto_out_a_bits_source;
  assign err_auto_in_a_bits_address = widget_2_auto_out_a_bits_address;
  assign err_auto_in_a_bits_mask = widget_2_auto_out_a_bits_mask;
  assign err_auto_in_a_bits_corrupt = widget_2_auto_out_a_bits_corrupt;
  assign err_auto_in_c_valid = widget_2_auto_out_c_valid;
  assign err_auto_in_c_bits_opcode = widget_2_auto_out_c_bits_opcode;
  assign err_auto_in_c_bits_param = widget_2_auto_out_c_bits_param;
  assign err_auto_in_c_bits_size = widget_2_auto_out_c_bits_size;
  assign err_auto_in_c_bits_source = widget_2_auto_out_c_bits_source;
  assign err_auto_in_c_bits_address = widget_2_auto_out_c_bits_address;
  assign err_auto_in_d_ready = widget_2_auto_out_d_ready;
  assign err_auto_in_e_valid = widget_2_auto_out_e_valid;
  assign atomics_clock = clock;
  assign atomics_reset = reset;
  assign atomics_auto_in_a_valid = fixer_1_auto_out_a_valid;
  assign atomics_auto_in_a_bits_opcode = fixer_1_auto_out_a_bits_opcode;
  assign atomics_auto_in_a_bits_param = fixer_1_auto_out_a_bits_param;
  assign atomics_auto_in_a_bits_size = fixer_1_auto_out_a_bits_size;
  assign atomics_auto_in_a_bits_source = fixer_1_auto_out_a_bits_source;
  assign atomics_auto_in_a_bits_address = fixer_1_auto_out_a_bits_address;
  assign atomics_auto_in_a_bits_mask = fixer_1_auto_out_a_bits_mask;
  assign atomics_auto_in_a_bits_data = fixer_1_auto_out_a_bits_data;
  assign atomics_auto_in_c_valid = fixer_1_auto_out_c_valid;
  assign atomics_auto_in_c_bits_opcode = fixer_1_auto_out_c_bits_opcode;
  assign atomics_auto_in_c_bits_param = fixer_1_auto_out_c_bits_param;
  assign atomics_auto_in_c_bits_size = fixer_1_auto_out_c_bits_size;
  assign atomics_auto_in_c_bits_source = fixer_1_auto_out_c_bits_source;
  assign atomics_auto_in_c_bits_address = fixer_1_auto_out_c_bits_address;
  assign atomics_auto_in_d_ready = fixer_1_auto_out_d_ready;
  assign atomics_auto_in_e_valid = fixer_1_auto_out_e_valid;
  assign atomics_auto_in_e_bits_sink = fixer_1_auto_out_e_bits_sink;
  assign atomics_auto_out_a_ready = xbar_auto_in_a_ready;
  assign atomics_auto_out_c_ready = xbar_auto_in_c_ready;
  assign atomics_auto_out_d_valid = xbar_auto_in_d_valid;
  assign atomics_auto_out_d_bits_opcode = xbar_auto_in_d_bits_opcode;
  assign atomics_auto_out_d_bits_param = xbar_auto_in_d_bits_param;
  assign atomics_auto_out_d_bits_size = xbar_auto_in_d_bits_size;
  assign atomics_auto_out_d_bits_source = xbar_auto_in_d_bits_source;
  assign atomics_auto_out_d_bits_denied = xbar_auto_in_d_bits_denied;
  assign atomics_auto_out_d_bits_data = xbar_auto_in_d_bits_data;
  assign atomics_auto_out_d_bits_corrupt = xbar_auto_in_d_bits_corrupt;
  assign atomics_auto_out_e_ready = xbar_auto_in_e_ready;
  assign fixer_1_clock = clock;
  assign fixer_1_reset = reset;
  assign fixer_1_auto_in_a_valid = hints_auto_out_a_valid;
  assign fixer_1_auto_in_a_bits_opcode = hints_auto_out_a_bits_opcode;
  assign fixer_1_auto_in_a_bits_param = hints_auto_out_a_bits_param;
  assign fixer_1_auto_in_a_bits_size = hints_auto_out_a_bits_size;
  assign fixer_1_auto_in_a_bits_source = hints_auto_out_a_bits_source;
  assign fixer_1_auto_in_a_bits_address = hints_auto_out_a_bits_address;
  assign fixer_1_auto_in_a_bits_mask = hints_auto_out_a_bits_mask;
  assign fixer_1_auto_in_a_bits_data = hints_auto_out_a_bits_data;
  assign fixer_1_auto_in_c_valid = hints_auto_out_c_valid;
  assign fixer_1_auto_in_c_bits_opcode = hints_auto_out_c_bits_opcode;
  assign fixer_1_auto_in_c_bits_param = hints_auto_out_c_bits_param;
  assign fixer_1_auto_in_c_bits_size = hints_auto_out_c_bits_size;
  assign fixer_1_auto_in_c_bits_source = hints_auto_out_c_bits_source;
  assign fixer_1_auto_in_c_bits_address = hints_auto_out_c_bits_address;
  assign fixer_1_auto_in_d_ready = hints_auto_out_d_ready;
  assign fixer_1_auto_in_e_valid = hints_auto_out_e_valid;
  assign fixer_1_auto_in_e_bits_sink = hints_auto_out_e_bits_sink;
  assign fixer_1_auto_out_a_ready = atomics_auto_in_a_ready;
  assign fixer_1_auto_out_c_ready = atomics_auto_in_c_ready;
  assign fixer_1_auto_out_d_valid = atomics_auto_in_d_valid;
  assign fixer_1_auto_out_d_bits_opcode = atomics_auto_in_d_bits_opcode;
  assign fixer_1_auto_out_d_bits_param = atomics_auto_in_d_bits_param;
  assign fixer_1_auto_out_d_bits_size = atomics_auto_in_d_bits_size;
  assign fixer_1_auto_out_d_bits_source = atomics_auto_in_d_bits_source;
  assign fixer_1_auto_out_d_bits_denied = atomics_auto_in_d_bits_denied;
  assign fixer_1_auto_out_d_bits_data = atomics_auto_in_d_bits_data;
  assign fixer_1_auto_out_d_bits_corrupt = atomics_auto_in_d_bits_corrupt;
  assign fixer_1_auto_out_e_ready = atomics_auto_in_e_ready;
  assign hints_clock = clock;
  assign hints_reset = reset;
  assign hints_auto_in_a_valid = widget_1_auto_out_a_valid;
  assign hints_auto_in_a_bits_opcode = widget_1_auto_out_a_bits_opcode;
  assign hints_auto_in_a_bits_param = widget_1_auto_out_a_bits_param;
  assign hints_auto_in_a_bits_size = widget_1_auto_out_a_bits_size;
  assign hints_auto_in_a_bits_source = widget_1_auto_out_a_bits_source;
  assign hints_auto_in_a_bits_address = widget_1_auto_out_a_bits_address;
  assign hints_auto_in_a_bits_mask = widget_1_auto_out_a_bits_mask;
  assign hints_auto_in_a_bits_data = widget_1_auto_out_a_bits_data;
  assign hints_auto_in_c_valid = widget_1_auto_out_c_valid;
  assign hints_auto_in_c_bits_opcode = widget_1_auto_out_c_bits_opcode;
  assign hints_auto_in_c_bits_param = widget_1_auto_out_c_bits_param;
  assign hints_auto_in_c_bits_size = widget_1_auto_out_c_bits_size;
  assign hints_auto_in_c_bits_source = widget_1_auto_out_c_bits_source;
  assign hints_auto_in_c_bits_address = widget_1_auto_out_c_bits_address;
  assign hints_auto_in_d_ready = widget_1_auto_out_d_ready;
  assign hints_auto_in_e_valid = widget_1_auto_out_e_valid;
  assign hints_auto_in_e_bits_sink = widget_1_auto_out_e_bits_sink;
  assign hints_auto_out_a_ready = fixer_1_auto_in_a_ready;
  assign hints_auto_out_c_ready = fixer_1_auto_in_c_ready;
  assign hints_auto_out_d_valid = fixer_1_auto_in_d_valid;
  assign hints_auto_out_d_bits_opcode = fixer_1_auto_in_d_bits_opcode;
  assign hints_auto_out_d_bits_param = fixer_1_auto_in_d_bits_param;
  assign hints_auto_out_d_bits_size = fixer_1_auto_in_d_bits_size;
  assign hints_auto_out_d_bits_source = fixer_1_auto_in_d_bits_source;
  assign hints_auto_out_d_bits_denied = fixer_1_auto_in_d_bits_denied;
  assign hints_auto_out_d_bits_data = fixer_1_auto_in_d_bits_data;
  assign hints_auto_out_d_bits_corrupt = fixer_1_auto_in_d_bits_corrupt;
  assign hints_auto_out_e_ready = fixer_1_auto_in_e_ready;
  assign widget_1_clock = clock;
  assign widget_1_reset = reset;
  assign widget_1_auto_in_a_valid = chiplink_auto_mbypass_out_a_valid;
  assign widget_1_auto_in_a_bits_opcode = chiplink_auto_mbypass_out_a_bits_opcode;
  assign widget_1_auto_in_a_bits_param = chiplink_auto_mbypass_out_a_bits_param;
  assign widget_1_auto_in_a_bits_size = chiplink_auto_mbypass_out_a_bits_size;
  assign widget_1_auto_in_a_bits_source = chiplink_auto_mbypass_out_a_bits_source;
  assign widget_1_auto_in_a_bits_address = chiplink_auto_mbypass_out_a_bits_address;
  assign widget_1_auto_in_a_bits_mask = chiplink_auto_mbypass_out_a_bits_mask;
  assign widget_1_auto_in_a_bits_data = chiplink_auto_mbypass_out_a_bits_data;
  assign widget_1_auto_in_c_valid = chiplink_auto_mbypass_out_c_valid;
  assign widget_1_auto_in_c_bits_opcode = chiplink_auto_mbypass_out_c_bits_opcode;
  assign widget_1_auto_in_c_bits_param = chiplink_auto_mbypass_out_c_bits_param;
  assign widget_1_auto_in_c_bits_size = chiplink_auto_mbypass_out_c_bits_size;
  assign widget_1_auto_in_c_bits_source = chiplink_auto_mbypass_out_c_bits_source;
  assign widget_1_auto_in_c_bits_address = chiplink_auto_mbypass_out_c_bits_address;
  assign widget_1_auto_in_d_ready = chiplink_auto_mbypass_out_d_ready;
  assign widget_1_auto_in_e_valid = chiplink_auto_mbypass_out_e_valid;
  assign widget_1_auto_in_e_bits_sink = chiplink_auto_mbypass_out_e_bits_sink;
  assign widget_1_auto_out_a_ready = hints_auto_in_a_ready;
  assign widget_1_auto_out_c_ready = hints_auto_in_c_ready;
  assign widget_1_auto_out_d_valid = hints_auto_in_d_valid;
  assign widget_1_auto_out_d_bits_opcode = hints_auto_in_d_bits_opcode;
  assign widget_1_auto_out_d_bits_param = hints_auto_in_d_bits_param;
  assign widget_1_auto_out_d_bits_size = hints_auto_in_d_bits_size;
  assign widget_1_auto_out_d_bits_source = hints_auto_in_d_bits_source;
  assign widget_1_auto_out_d_bits_denied = hints_auto_in_d_bits_denied;
  assign widget_1_auto_out_d_bits_data = hints_auto_in_d_bits_data;
  assign widget_1_auto_out_d_bits_corrupt = hints_auto_in_d_bits_corrupt;
  assign widget_1_auto_out_e_ready = hints_auto_in_e_ready;
  assign widget_2_clock = clock;
  assign widget_2_reset = reset;
  assign widget_2_auto_in_a_valid = xbar_auto_out_1_a_valid;
  assign widget_2_auto_in_a_bits_opcode = xbar_auto_out_1_a_bits_opcode;
  assign widget_2_auto_in_a_bits_param = xbar_auto_out_1_a_bits_param;
  assign widget_2_auto_in_a_bits_size = xbar_auto_out_1_a_bits_size;
  assign widget_2_auto_in_a_bits_source = xbar_auto_out_1_a_bits_source;
  assign widget_2_auto_in_a_bits_address = xbar_auto_out_1_a_bits_address;
  assign widget_2_auto_in_a_bits_mask = xbar_auto_out_1_a_bits_mask;
  assign widget_2_auto_in_a_bits_corrupt = xbar_auto_out_1_a_bits_corrupt;
  assign widget_2_auto_in_c_valid = xbar_auto_out_1_c_valid;
  assign widget_2_auto_in_c_bits_opcode = xbar_auto_out_1_c_bits_opcode;
  assign widget_2_auto_in_c_bits_param = xbar_auto_out_1_c_bits_param;
  assign widget_2_auto_in_c_bits_size = xbar_auto_out_1_c_bits_size;
  assign widget_2_auto_in_c_bits_source = xbar_auto_out_1_c_bits_source;
  assign widget_2_auto_in_c_bits_address = xbar_auto_out_1_c_bits_address;
  assign widget_2_auto_in_d_ready = xbar_auto_out_1_d_ready;
  assign widget_2_auto_in_e_valid = xbar_auto_out_1_e_valid;
  assign widget_2_auto_out_a_ready = err_auto_in_a_ready;
  assign widget_2_auto_out_c_ready = err_auto_in_c_ready;
  assign widget_2_auto_out_d_valid = err_auto_in_d_valid;
  assign widget_2_auto_out_d_bits_opcode = err_auto_in_d_bits_opcode;
  assign widget_2_auto_out_d_bits_param = err_auto_in_d_bits_param;
  assign widget_2_auto_out_d_bits_size = err_auto_in_d_bits_size;
  assign widget_2_auto_out_d_bits_source = err_auto_in_d_bits_source;
  assign widget_2_auto_out_d_bits_denied = err_auto_in_d_bits_denied;
  assign widget_2_auto_out_d_bits_corrupt = err_auto_in_d_bits_corrupt;
endmodule