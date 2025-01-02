module TLSourceShrinker_Param #(
    parameter ADDRESS_WIDTH = 32,
    parameter DATA_WIDTH   = 64,
    parameter SIZE_WIDTH   = 3,
    parameter MASK_WIDTH   = DATA_WIDTH/8,
    parameter BYTES_LOG2_WIDTH = $clog2(MASK_WIDTH),
    parameter USER_WIDTH    = 1
) (
  input         clock,
  input         reset,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
  input  [2:0]  auto_in_a_bits_param,
  input  [SIZE_WIDTH-1:0]  auto_in_a_bits_size,
  input  [6:0]  auto_in_a_bits_source,
  input  [ADDRESS_WIDTH-1:0]  auto_in_a_bits_address,
  input  [MASK_WIDTH-1:0]  auto_in_a_bits_mask,
  input  [DATA_WIDTH-1:0] auto_in_a_bits_data,
  input         auto_in_a_bits_corrupt,
  input         auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [1:0]  auto_in_d_bits_param,
  output [SIZE_WIDTH-1:0]  auto_in_d_bits_size,
  output [6:0]  auto_in_d_bits_source,
  output        auto_in_d_bits_sink,
  output        auto_in_d_bits_denied,
  output [DATA_WIDTH-1:0] auto_in_d_bits_data,
  output        auto_in_d_bits_corrupt,
  input         auto_out_a_ready,
  output        auto_out_a_valid,
  output [2:0]  auto_out_a_bits_opcode,
  output [2:0]  auto_out_a_bits_param,
  output [SIZE_WIDTH-1:0]  auto_out_a_bits_size,
  output [3:0]  auto_out_a_bits_source,
  output [ADDRESS_WIDTH-1:0]  auto_out_a_bits_address,
  output [MASK_WIDTH-1:0]  auto_out_a_bits_mask,
  output [DATA_WIDTH-1:0] auto_out_a_bits_data,
  output        auto_out_a_bits_corrupt,
  output        auto_out_d_ready,
  input         auto_out_d_valid,
  input  [2:0]  auto_out_d_bits_opcode,
  input  [1:0]  auto_out_d_bits_param,
  input  [SIZE_WIDTH-1:0]  auto_out_d_bits_size,
  input  [3:0]  auto_out_d_bits_source,
  input         auto_out_d_bits_sink,
  input         auto_out_d_bits_denied,
  input  [DATA_WIDTH-1:0] auto_out_d_bits_data,
  input         auto_out_d_bits_corrupt
);
`ifdef RANDOMIZE_MEM_INIT
  reg [DATA_WIDTH-1:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [DATA_WIDTH-1:0] _RAND_1;
  reg [DATA_WIDTH-1:0] _RAND_2;
  reg [DATA_WIDTH-1:0] _RAND_3;
  reg [DATA_WIDTH-1:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  wire  monitor_clock;
  wire  monitor_reset;
  wire  monitor_io_in_a_ready;
  wire  monitor_io_in_a_valid;
  wire [2:0] monitor_io_in_a_bits_opcode;
  wire [2:0] monitor_io_in_a_bits_param;
  wire [SIZE_WIDTH-1:0] monitor_io_in_a_bits_size;
  wire [6:0] monitor_io_in_a_bits_source;
  wire [ADDRESS_WIDTH-1:0] monitor_io_in_a_bits_address;
  wire [MASK_WIDTH-1:0] monitor_io_in_a_bits_mask;
  wire  monitor_io_in_a_bits_corrupt;
  wire  monitor_io_in_d_ready;
  wire  monitor_io_in_d_valid;
  wire [2:0] monitor_io_in_d_bits_opcode;
  wire [1:0] monitor_io_in_d_bits_param;
  wire [SIZE_WIDTH-1:0] monitor_io_in_d_bits_size;
  wire [6:0] monitor_io_in_d_bits_source;
  wire  monitor_io_in_d_bits_sink;
  wire  monitor_io_in_d_bits_denied;
  wire  monitor_io_in_d_bits_corrupt;
  reg [6:0] sourceIdMap [0:15];
  wire  sourceIdMap_bundleIn_0_d_bits_source_MPORT_en;
  wire [3:0] sourceIdMap_bundleIn_0_d_bits_source_MPORT_addr;
  wire [6:0] sourceIdMap_bundleIn_0_d_bits_source_MPORT_data;
  wire [6:0] sourceIdMap_MPORT_data;
  wire [3:0] sourceIdMap_MPORT_addr;
  wire  sourceIdMap_MPORT_mask;
  wire  sourceIdMap_MPORT_en;
  reg [15:0] allocated;
  wire [15:0] _nextFreeOH_T = ~allocated;
  wire [16:0] _nextFreeOH_T_1 = {_nextFreeOH_T, 1'h0};
  wire [15:0] _nextFreeOH_T_3 = _nextFreeOH_T | _nextFreeOH_T_1[15:0];
  wire [17:0] _nextFreeOH_T_4 = {_nextFreeOH_T_3, 2'h0};
  wire [15:0] _nextFreeOH_T_6 = _nextFreeOH_T_3 | _nextFreeOH_T_4[15:0];
  wire [19:0] _nextFreeOH_T_7 = {_nextFreeOH_T_6, 4'h0};
  wire [15:0] _nextFreeOH_T_9 = _nextFreeOH_T_6 | _nextFreeOH_T_7[15:0];
  wire [23:0] _nextFreeOH_T_10 = {_nextFreeOH_T_9, 8'h0};
  wire [15:0] _nextFreeOH_T_12 = _nextFreeOH_T_9 | _nextFreeOH_T_10[15:0];
  wire [16:0] _nextFreeOH_T_14 = {_nextFreeOH_T_12, 1'h0};
  wire [16:0] _nextFreeOH_T_15 = ~_nextFreeOH_T_14;
  wire [16:0] _GEN_8 = {{1'd0}, _nextFreeOH_T};
  wire [16:0] nextFreeOH = _nextFreeOH_T_15 & _GEN_8;
  wire  nextFree_hi = nextFreeOH[16];
  wire [15:0] nextFree_lo = nextFreeOH[15:0];
  wire  _nextFree_T = |nextFree_hi;
  wire [15:0] _GEN_9 = {{15'd0}, nextFree_hi};
  wire [15:0] _nextFree_T_1 = _GEN_9 | nextFree_lo;
  wire [7:0] nextFree_hi_1 = _nextFree_T_1[15:8];
  wire [7:0] nextFree_lo_1 = _nextFree_T_1[7:0];
  wire  _nextFree_T_2 = |nextFree_hi_1;
  wire [7:0] _nextFree_T_3 = nextFree_hi_1 | nextFree_lo_1;
  wire [3:0] nextFree_hi_2 = _nextFree_T_3[7:4];
  wire [3:0] nextFree_lo_2 = _nextFree_T_3[3:0];
  wire  _nextFree_T_4 = |nextFree_hi_2;
  wire [3:0] _nextFree_T_5 = nextFree_hi_2 | nextFree_lo_2;
  wire [1:0] nextFree_hi_3 = _nextFree_T_5[3:2];
  wire [1:0] nextFree_lo_3 = _nextFree_T_5[1:0];
  wire  _nextFree_T_6 = |nextFree_hi_3;
  wire [1:0] _nextFree_T_7 = nextFree_hi_3 | nextFree_lo_3;
  wire [4:0] nextFree = {_nextFree_T,_nextFree_T_2,_nextFree_T_4,_nextFree_T_6,_nextFree_T_7[1]};
  wire  full = &allocated;
  reg [5:0] a_first_counter;
  wire  a_first = a_first_counter == 6'h0;
  wire  block = a_first & full;
  wire  _bundleIn_0_a_ready_T = ~block;
  wire  bundleIn_0_a_ready = auto_out_a_ready & ~block;
  wire  _a_first_T = bundleIn_0_a_ready & auto_in_a_valid;
  wire [22:0] _a_first_beats1_decode_T_1 = 23'hff << auto_in_a_bits_size;
  wire [7:0] _a_first_beats1_decode_T_3 = ~_a_first_beats1_decode_T_1[7:0];
  wire [5:0] a_first_beats1_decode = _a_first_beats1_decode_T_3[7:BYTES_LOG2_WIDTH];
  wire  a_first_beats1_opdata = ~auto_in_a_bits_opcode[2];
  wire [5:0] a_first_counter1 = a_first_counter - 6'h1;
  wire  _d_last_T = auto_in_d_ready & auto_out_d_valid;
  wire [22:0] _d_last_beats1_decode_T_1 = 23'hff << auto_out_d_bits_size;
  wire [7:0] _d_last_beats1_decode_T_3 = ~_d_last_beats1_decode_T_1[7:0];
  wire [5:0] d_last_beats1_decode = _d_last_beats1_decode_T_3[7:BYTES_LOG2_WIDTH];
  wire  d_last_beats1_opdata = auto_out_d_bits_opcode[0];
  wire [5:0] d_last_beats1 = d_last_beats1_opdata ? d_last_beats1_decode : 6'h0;
  reg [5:0] d_last_counter;
  wire [5:0] d_last_counter1 = d_last_counter - 6'h1;
  wire  d_last_first = d_last_counter == 6'h0;
  wire  d_last = d_last_counter == 6'h1 | d_last_beats1 == 6'h0;
  wire  d_last_done = d_last & _d_last_T;
  reg [4:0] bundleOut_0_a_bits_source_r;
  wire [4:0] _GEN_2 = a_first ? nextFree : bundleOut_0_a_bits_source_r;
  wire  _T_1 = a_first & _a_first_T;
  wire [16:0] alloc_id = _T_1 ? nextFreeOH : 17'h0;
  wire [15:0] _free_id_T = 16'h1 << auto_out_d_bits_source;
  wire [15:0] free_id = d_last_done ? _free_id_T : 16'h0;
  wire [16:0] _GEN_11 = {{1'd0}, allocated};
  wire [16:0] _allocated_T = _GEN_11 | alloc_id;
  wire [15:0] _allocated_T_1 = ~free_id;
  wire [16:0] _GEN_12 = {{1'd0}, _allocated_T_1};
  wire [16:0] _allocated_T_2 = _allocated_T & _GEN_12;


  assign sourceIdMap_bundleIn_0_d_bits_source_MPORT_en = 1'h1;
  assign sourceIdMap_bundleIn_0_d_bits_source_MPORT_addr = auto_out_d_bits_source;
  assign sourceIdMap_bundleIn_0_d_bits_source_MPORT_data = sourceIdMap[sourceIdMap_bundleIn_0_d_bits_source_MPORT_addr];
  assign sourceIdMap_MPORT_data = auto_in_a_bits_source;
  assign sourceIdMap_MPORT_addr = nextFree[3:0];
  assign sourceIdMap_MPORT_mask = 1'h1;
  assign sourceIdMap_MPORT_en = a_first & _a_first_T;
  assign auto_in_a_ready = auto_out_a_ready & ~block;
  assign auto_in_d_valid = auto_out_d_valid;
  assign auto_in_d_bits_opcode = auto_out_d_bits_opcode;
  assign auto_in_d_bits_param = auto_out_d_bits_param;
  assign auto_in_d_bits_size = auto_out_d_bits_size;
  assign auto_in_d_bits_source = sourceIdMap_bundleIn_0_d_bits_source_MPORT_data;
  assign auto_in_d_bits_sink = auto_out_d_bits_sink;
  assign auto_in_d_bits_denied = auto_out_d_bits_denied;
  assign auto_in_d_bits_data = auto_out_d_bits_data;
  assign auto_in_d_bits_corrupt = auto_out_d_bits_corrupt;
  assign auto_out_a_valid = auto_in_a_valid & _bundleIn_0_a_ready_T;
  assign auto_out_a_bits_opcode = auto_in_a_bits_opcode;
  assign auto_out_a_bits_param = auto_in_a_bits_param;
  assign auto_out_a_bits_size = auto_in_a_bits_size;
  assign auto_out_a_bits_source = _GEN_2[3:0];
  assign auto_out_a_bits_address = auto_in_a_bits_address;
  assign auto_out_a_bits_mask = auto_in_a_bits_mask;
  assign auto_out_a_bits_data = auto_in_a_bits_data;
  assign auto_out_a_bits_corrupt = auto_in_a_bits_corrupt;
  assign auto_out_d_ready = auto_in_d_ready;
  assign monitor_clock = clock;
  assign monitor_reset = reset;
  assign monitor_io_in_a_ready = auto_out_a_ready & ~block;
  assign monitor_io_in_a_valid = auto_in_a_valid;
  assign monitor_io_in_a_bits_opcode = auto_in_a_bits_opcode;
  assign monitor_io_in_a_bits_param = auto_in_a_bits_param;
  assign monitor_io_in_a_bits_size = auto_in_a_bits_size;
  assign monitor_io_in_a_bits_source = auto_in_a_bits_source;
  assign monitor_io_in_a_bits_address = auto_in_a_bits_address;
  assign monitor_io_in_a_bits_mask = auto_in_a_bits_mask;
  assign monitor_io_in_a_bits_corrupt = auto_in_a_bits_corrupt;
  assign monitor_io_in_d_ready = auto_in_d_ready;
  assign monitor_io_in_d_valid = auto_out_d_valid;
  assign monitor_io_in_d_bits_opcode = auto_out_d_bits_opcode;
  assign monitor_io_in_d_bits_param = auto_out_d_bits_param;
  assign monitor_io_in_d_bits_size = auto_out_d_bits_size;
  assign monitor_io_in_d_bits_source = sourceIdMap_bundleIn_0_d_bits_source_MPORT_data;
  assign monitor_io_in_d_bits_sink = auto_out_d_bits_sink;
  assign monitor_io_in_d_bits_denied = auto_out_d_bits_denied;
  assign monitor_io_in_d_bits_corrupt = auto_out_d_bits_corrupt;
  always @(posedge clock) begin
    if (sourceIdMap_MPORT_en & sourceIdMap_MPORT_mask) begin
      sourceIdMap[sourceIdMap_MPORT_addr] <= sourceIdMap_MPORT_data;
    end
    if (reset) begin
      allocated <= 16'h0;
    end else begin
      allocated <= _allocated_T_2[15:0];
    end
    if (reset) begin
      a_first_counter <= 6'h0;
    end else if (_a_first_T) begin
      if (a_first) begin
        if (a_first_beats1_opdata) begin
          a_first_counter <= a_first_beats1_decode;
        end else begin
          a_first_counter <= 6'h0;
        end
      end else begin
        a_first_counter <= a_first_counter1;
      end
    end
    if (reset) begin
      d_last_counter <= 6'h0;
    end else if (_d_last_T) begin
      if (d_last_first) begin
        if (d_last_beats1_opdata) begin
          d_last_counter <= d_last_beats1_decode;
        end else begin
          d_last_counter <= 6'h0;
        end
      end else begin
        d_last_counter <= d_last_counter1;
      end
    end
    if (a_first) begin
      bundleOut_0_a_bits_source_r <= nextFree;
    end
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    sourceIdMap[initvar] = _RAND_0[6:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  allocated = _RAND_1[15:0];
  _RAND_2 = {1{`RANDOM}};
  a_first_counter = _RAND_2[5:0];
  _RAND_3 = {1{`RANDOM}};
  d_last_counter = _RAND_3[5:0];
  _RAND_4 = {1{`RANDOM}};
  bundleOut_0_a_bits_source_r = _RAND_4[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule