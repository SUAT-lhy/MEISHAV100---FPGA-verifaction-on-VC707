module QueueCompatibility_axi4UserYanker(
  input        clock,
  input        reset,
  output       io_enq_ready,
  input        io_enq_valid,
  input  [6:0] io_enq_bits_extra_id,
  input        io_enq_bits_real_last,
  input        io_deq_ready,
  output       io_deq_valid,
  output [6:0] io_deq_bits_extra_id,
  output       io_deq_bits_real_last
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [6:0] ram_extra_id [0:3]; // @[Decoupled.scala 259:95]
  wire  ram_extra_id_io_deq_bits_MPORT_en; // @[Decoupled.scala 259:95]
  wire [1:0] ram_extra_id_io_deq_bits_MPORT_addr; // @[Decoupled.scala 259:95]
  wire [6:0] ram_extra_id_io_deq_bits_MPORT_data; // @[Decoupled.scala 259:95]
  wire [6:0] ram_extra_id_MPORT_data; // @[Decoupled.scala 259:95]
  wire [1:0] ram_extra_id_MPORT_addr; // @[Decoupled.scala 259:95]
  wire  ram_extra_id_MPORT_mask; // @[Decoupled.scala 259:95]
  wire  ram_extra_id_MPORT_en; // @[Decoupled.scala 259:95]
  reg  ram_real_last [0:3]; // @[Decoupled.scala 259:95]
  wire  ram_real_last_io_deq_bits_MPORT_en; // @[Decoupled.scala 259:95]
  wire [1:0] ram_real_last_io_deq_bits_MPORT_addr; // @[Decoupled.scala 259:95]
  wire  ram_real_last_io_deq_bits_MPORT_data; // @[Decoupled.scala 259:95]
  wire  ram_real_last_MPORT_data; // @[Decoupled.scala 259:95]
  wire [1:0] ram_real_last_MPORT_addr; // @[Decoupled.scala 259:95]
  wire  ram_real_last_MPORT_mask; // @[Decoupled.scala 259:95]
  wire  ram_real_last_MPORT_en; // @[Decoupled.scala 259:95]
  reg [1:0] enq_ptr_value; // @[Counter.scala 62:40]
  reg [1:0] deq_ptr_value; // @[Counter.scala 62:40]
  reg  maybe_full; // @[Decoupled.scala 262:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[Decoupled.scala 263:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 264:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 265:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 50:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 50:35]
  wire [1:0] _value_T_1 = enq_ptr_value + 2'h1; // @[Counter.scala 78:24]
  wire [1:0] _value_T_3 = deq_ptr_value + 2'h1; // @[Counter.scala 78:24]
  assign ram_extra_id_io_deq_bits_MPORT_en = 1'h1;
  assign ram_extra_id_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_extra_id_io_deq_bits_MPORT_data = ram_extra_id[ram_extra_id_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 259:95]
  assign ram_extra_id_MPORT_data = io_enq_bits_extra_id;
  assign ram_extra_id_MPORT_addr = enq_ptr_value;
  assign ram_extra_id_MPORT_mask = 1'h1;
  assign ram_extra_id_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_real_last_io_deq_bits_MPORT_en = 1'h1;
  assign ram_real_last_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_real_last_io_deq_bits_MPORT_data = ram_real_last[ram_real_last_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 259:95]
  assign ram_real_last_MPORT_data = io_enq_bits_real_last;
  assign ram_real_last_MPORT_addr = enq_ptr_value;
  assign ram_real_last_MPORT_mask = 1'h1;
  assign ram_real_last_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 289:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 288:19]
  assign io_deq_bits_extra_id = ram_extra_id_io_deq_bits_MPORT_data; // @[Decoupled.scala 296:17]
  assign io_deq_bits_real_last = ram_real_last_io_deq_bits_MPORT_data; // @[Decoupled.scala 296:17]
  always @(posedge clock) begin
    if (ram_extra_id_MPORT_en & ram_extra_id_MPORT_mask) begin
      ram_extra_id[ram_extra_id_MPORT_addr] <= ram_extra_id_MPORT_data; // @[Decoupled.scala 259:95]
    end
    if (ram_real_last_MPORT_en & ram_real_last_MPORT_mask) begin
      ram_real_last[ram_real_last_MPORT_addr] <= ram_real_last_MPORT_data; // @[Decoupled.scala 259:95]
    end
    if (reset) begin // @[Counter.scala 62:40]
      enq_ptr_value <= 2'h0; // @[Counter.scala 62:40]
    end else if (do_enq) begin // @[Decoupled.scala 272:16]
      enq_ptr_value <= _value_T_1; // @[Counter.scala 78:15]
    end
    if (reset) begin // @[Counter.scala 62:40]
      deq_ptr_value <= 2'h0; // @[Counter.scala 62:40]
    end else if (do_deq) begin // @[Decoupled.scala 276:16]
      deq_ptr_value <= _value_T_3; // @[Counter.scala 78:15]
    end
    if (reset) begin // @[Decoupled.scala 262:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 262:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 279:27]
      maybe_full <= do_enq; // @[Decoupled.scala 280:16]
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
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_extra_id[initvar] = _RAND_0[6:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_real_last[initvar] = _RAND_1[0:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  enq_ptr_value = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  deq_ptr_value = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  maybe_full = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule