module TLError_Queue_Param # (
    parameter SOURCE_WIDTH   = 4
    ) (
  input        clock,
  input        reset,
  output       io_enq_ready,
  input        io_enq_valid,
  input  [2:0] io_enq_bits_opcode,
  input  [2:0] io_enq_bits_size,
  input  [SOURCE_WIDTH-1:0] io_enq_bits_source,
  input        io_deq_ready,
  output       io_deq_valid,
  output [2:0] io_deq_bits_opcode,
  output [2:0] io_deq_bits_size,
  output [SOURCE_WIDTH-1:0] io_deq_bits_source
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] ram_opcode [0:0];
  wire [2:0] ram_opcode_io_deq_bits_MPORT_data;
  wire  ram_opcode_io_deq_bits_MPORT_addr;
  wire [2:0] ram_opcode_MPORT_data;
  wire  ram_opcode_MPORT_addr;
  wire  ram_opcode_MPORT_mask;
  wire  ram_opcode_MPORT_en;
  reg [2:0] ram_size [0:0];
  wire [2:0] ram_size_io_deq_bits_MPORT_data;
  wire  ram_size_io_deq_bits_MPORT_addr;
  wire [2:0] ram_size_MPORT_data;
  wire  ram_size_MPORT_addr;
  wire  ram_size_MPORT_mask;
  wire  ram_size_MPORT_en;
  reg [SOURCE_WIDTH-1:0] ram_source [0:0];
  wire [SOURCE_WIDTH-1:0] ram_source_io_deq_bits_MPORT_data;
  wire  ram_source_io_deq_bits_MPORT_addr;
  wire [SOURCE_WIDTH-1:0] ram_source_MPORT_data;
  wire  ram_source_MPORT_addr;
  wire  ram_source_MPORT_mask;
  wire  ram_source_MPORT_en;
  reg  maybe_full;
  wire  empty = ~maybe_full;
  wire  do_enq = io_enq_ready & io_enq_valid;
  wire  do_deq = io_deq_ready & io_deq_valid;
  assign ram_opcode_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_opcode_io_deq_bits_MPORT_data = ram_opcode[ram_opcode_io_deq_bits_MPORT_addr];
  assign ram_opcode_MPORT_data = io_enq_bits_opcode;
  assign ram_opcode_MPORT_addr = 1'h0;
  assign ram_opcode_MPORT_mask = 1'h1;
  assign ram_opcode_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_size_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_size_io_deq_bits_MPORT_data = ram_size[ram_size_io_deq_bits_MPORT_addr];
  assign ram_size_MPORT_data = io_enq_bits_size;
  assign ram_size_MPORT_addr = 1'h0;
  assign ram_size_MPORT_mask = 1'h1;
  assign ram_size_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_source_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_source_io_deq_bits_MPORT_data = ram_source[ram_source_io_deq_bits_MPORT_addr];
  assign ram_source_MPORT_data = io_enq_bits_source;
  assign ram_source_MPORT_addr = 1'h0;
  assign ram_source_MPORT_mask = 1'h1;
  assign ram_source_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~maybe_full;
  assign io_deq_valid = ~empty;
  assign io_deq_bits_opcode = ram_opcode_io_deq_bits_MPORT_data;
  assign io_deq_bits_size = ram_size_io_deq_bits_MPORT_data;
  assign io_deq_bits_source = ram_source_io_deq_bits_MPORT_data;
  always @(posedge clock) begin
    if(ram_opcode_MPORT_en & ram_opcode_MPORT_mask) begin
      ram_opcode[ram_opcode_MPORT_addr] <= ram_opcode_MPORT_data;
    end
    if(ram_size_MPORT_en & ram_size_MPORT_mask) begin
      ram_size[ram_size_MPORT_addr] <= ram_size_MPORT_data;
    end
    if(ram_source_MPORT_en & ram_source_MPORT_mask) begin
      ram_source[ram_source_MPORT_addr] <= ram_source_MPORT_data;
    end
    if (reset) begin
      maybe_full <= 1'h0;
    end else if (do_enq != do_deq) begin
      maybe_full <= do_enq;
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
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_opcode[initvar] = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_size[initvar] = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_source[initvar] = _RAND_2[SOURCE_WIDTH-1:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  maybe_full = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule