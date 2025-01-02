module TLBuffer_33( 
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
  output [1:0]  auto_in_d_bits_param, 
  output [2:0]  auto_in_d_bits_size, 
  output [6:0]  auto_in_d_bits_source, 
  output        auto_in_d_bits_sink, 
  output        auto_in_d_bits_denied, 
  output [63:0] auto_in_d_bits_data, 
  output        auto_in_d_bits_corrupt, 
  input         auto_out_a_ready, 
  output        auto_out_a_valid, 
  output [2:0]  auto_out_a_bits_opcode, 
  output [2:0]  auto_out_a_bits_param, 
  output [2:0]  auto_out_a_bits_size, 
  output [6:0]  auto_out_a_bits_source, 
  output [31:0] auto_out_a_bits_address, 
  output [7:0]  auto_out_a_bits_mask, 
  output [63:0] auto_out_a_bits_data, 
  output        auto_out_a_bits_corrupt, 
  output        auto_out_d_ready, 
  input         auto_out_d_valid, 
  input  [2:0]  auto_out_d_bits_opcode, 
  input  [2:0]  auto_out_d_bits_size, 
  input  [6:0]  auto_out_d_bits_source, 
  input         auto_out_d_bits_denied, 
  input  [63:0] auto_out_d_bits_data, 
  input         auto_out_d_bits_corrupt 
);
  wire  TLMonitor_clock; 
  wire  TLMonitor_reset; 
  wire  TLMonitor_io_in_a_ready; 
  wire  TLMonitor_io_in_a_valid; 
  wire [2:0] TLMonitor_io_in_a_bits_opcode; 
  wire [2:0] TLMonitor_io_in_a_bits_param; 
  wire [2:0] TLMonitor_io_in_a_bits_size; 
  wire [6:0] TLMonitor_io_in_a_bits_source; 
  wire [31:0] TLMonitor_io_in_a_bits_address; 
  wire [7:0] TLMonitor_io_in_a_bits_mask; 
  wire  TLMonitor_io_in_a_bits_corrupt; 
  wire  TLMonitor_io_in_d_ready; 
  wire  TLMonitor_io_in_d_valid; 
  wire [2:0] TLMonitor_io_in_d_bits_opcode; 
  wire [1:0] TLMonitor_io_in_d_bits_param; 
  wire [2:0] TLMonitor_io_in_d_bits_size; 
  wire [6:0] TLMonitor_io_in_d_bits_source; 
  wire  TLMonitor_io_in_d_bits_sink; 
  wire  TLMonitor_io_in_d_bits_denied; 
  wire  TLMonitor_io_in_d_bits_corrupt; 
  wire  Queue_clock; 
  wire  Queue_reset; 
  wire  Queue_io_enq_ready; 
  wire  Queue_io_enq_valid; 
  wire [2:0] Queue_io_enq_bits_opcode; 
  wire [2:0] Queue_io_enq_bits_param; 
  wire [2:0] Queue_io_enq_bits_size; 
  wire [6:0] Queue_io_enq_bits_source; 
  wire [31:0] Queue_io_enq_bits_address; 
  wire [7:0] Queue_io_enq_bits_mask; 
  wire [63:0] Queue_io_enq_bits_data; 
  wire  Queue_io_enq_bits_corrupt; 
  wire  Queue_io_deq_ready; 
  wire  Queue_io_deq_valid; 
  wire [2:0] Queue_io_deq_bits_opcode; 
  wire [2:0] Queue_io_deq_bits_param; 
  wire [2:0] Queue_io_deq_bits_size; 
  wire [6:0] Queue_io_deq_bits_source; 
  wire [31:0] Queue_io_deq_bits_address; 
  wire [7:0] Queue_io_deq_bits_mask; 
  wire [63:0] Queue_io_deq_bits_data; 
  wire  Queue_io_deq_bits_corrupt; 
  wire  Queue_1_clock; 
  wire  Queue_1_reset; 
  wire  Queue_1_io_enq_ready; 
  wire  Queue_1_io_enq_valid; 
  wire [2:0] Queue_1_io_enq_bits_opcode; 
  wire [2:0] Queue_1_io_enq_bits_size; 
  wire [6:0] Queue_1_io_enq_bits_source; 
  wire  Queue_1_io_enq_bits_denied; 
  wire [63:0] Queue_1_io_enq_bits_data; 
  wire  Queue_1_io_enq_bits_corrupt; 
  wire  Queue_1_io_deq_ready; 
  wire  Queue_1_io_deq_valid; 
  wire [2:0] Queue_1_io_deq_bits_opcode; 
  wire [1:0] Queue_1_io_deq_bits_param; 
  wire [2:0] Queue_1_io_deq_bits_size; 
  wire [6:0] Queue_1_io_deq_bits_source; 
  wire  Queue_1_io_deq_bits_sink; 
  wire  Queue_1_io_deq_bits_denied; 
  wire [63:0] Queue_1_io_deq_bits_data; 
  wire  Queue_1_io_deq_bits_corrupt; 
  TLMonitor_81 TLMonitor ( 
    .clock(TLMonitor_clock),
    .reset(TLMonitor_reset),
    .io_in_a_ready(TLMonitor_io_in_a_ready),
    .io_in_a_valid(TLMonitor_io_in_a_valid),
    .io_in_a_bits_opcode(TLMonitor_io_in_a_bits_opcode),
    .io_in_a_bits_param(TLMonitor_io_in_a_bits_param),
    .io_in_a_bits_size(TLMonitor_io_in_a_bits_size),
    .io_in_a_bits_source(TLMonitor_io_in_a_bits_source),
    .io_in_a_bits_address(TLMonitor_io_in_a_bits_address),
    .io_in_a_bits_mask(TLMonitor_io_in_a_bits_mask),
    .io_in_a_bits_corrupt(TLMonitor_io_in_a_bits_corrupt),
    .io_in_d_ready(TLMonitor_io_in_d_ready),
    .io_in_d_valid(TLMonitor_io_in_d_valid),
    .io_in_d_bits_opcode(TLMonitor_io_in_d_bits_opcode),
    .io_in_d_bits_param(TLMonitor_io_in_d_bits_param),
    .io_in_d_bits_size(TLMonitor_io_in_d_bits_size),
    .io_in_d_bits_source(TLMonitor_io_in_d_bits_source),
    .io_in_d_bits_sink(TLMonitor_io_in_d_bits_sink),
    .io_in_d_bits_denied(TLMonitor_io_in_d_bits_denied),
    .io_in_d_bits_corrupt(TLMonitor_io_in_d_bits_corrupt)
  );
  Queue_42 Queue ( 
    .clock(Queue_clock),
    .reset(Queue_reset),
    .io_enq_ready(Queue_io_enq_ready),
    .io_enq_valid(Queue_io_enq_valid),
    .io_enq_bits_opcode(Queue_io_enq_bits_opcode),
    .io_enq_bits_param(Queue_io_enq_bits_param),
    .io_enq_bits_size(Queue_io_enq_bits_size),
    .io_enq_bits_source(Queue_io_enq_bits_source),
    .io_enq_bits_address(Queue_io_enq_bits_address),
    .io_enq_bits_mask(Queue_io_enq_bits_mask),
    .io_enq_bits_data(Queue_io_enq_bits_data),
    .io_enq_bits_corrupt(Queue_io_enq_bits_corrupt),
    .io_deq_ready(Queue_io_deq_ready),
    .io_deq_valid(Queue_io_deq_valid),
    .io_deq_bits_opcode(Queue_io_deq_bits_opcode),
    .io_deq_bits_param(Queue_io_deq_bits_param),
    .io_deq_bits_size(Queue_io_deq_bits_size),
    .io_deq_bits_source(Queue_io_deq_bits_source),
    .io_deq_bits_address(Queue_io_deq_bits_address),
    .io_deq_bits_mask(Queue_io_deq_bits_mask),
    .io_deq_bits_data(Queue_io_deq_bits_data),
    .io_deq_bits_corrupt(Queue_io_deq_bits_corrupt)
  );
  Queue_43 Queue_1 ( 
    .clock(Queue_1_clock),
    .reset(Queue_1_reset),
    .io_enq_ready(Queue_1_io_enq_ready),
    .io_enq_valid(Queue_1_io_enq_valid),
    .io_enq_bits_opcode(Queue_1_io_enq_bits_opcode),
    .io_enq_bits_size(Queue_1_io_enq_bits_size),
    .io_enq_bits_source(Queue_1_io_enq_bits_source),
    .io_enq_bits_denied(Queue_1_io_enq_bits_denied),
    .io_enq_bits_data(Queue_1_io_enq_bits_data),
    .io_enq_bits_corrupt(Queue_1_io_enq_bits_corrupt),
    .io_deq_ready(Queue_1_io_deq_ready),
    .io_deq_valid(Queue_1_io_deq_valid),
    .io_deq_bits_opcode(Queue_1_io_deq_bits_opcode),
    .io_deq_bits_param(Queue_1_io_deq_bits_param),
    .io_deq_bits_size(Queue_1_io_deq_bits_size),
    .io_deq_bits_source(Queue_1_io_deq_bits_source),
    .io_deq_bits_sink(Queue_1_io_deq_bits_sink),
    .io_deq_bits_denied(Queue_1_io_deq_bits_denied),
    .io_deq_bits_data(Queue_1_io_deq_bits_data),
    .io_deq_bits_corrupt(Queue_1_io_deq_bits_corrupt)
  );
  assign auto_in_a_ready = Queue_io_enq_ready; 
  assign auto_in_d_valid = Queue_1_io_deq_valid; 
  assign auto_in_d_bits_opcode = Queue_1_io_deq_bits_opcode; 
  assign auto_in_d_bits_param = Queue_1_io_deq_bits_param; 
  assign auto_in_d_bits_size = Queue_1_io_deq_bits_size; 
  assign auto_in_d_bits_source = Queue_1_io_deq_bits_source; 
  assign auto_in_d_bits_sink = Queue_1_io_deq_bits_sink; 
  assign auto_in_d_bits_denied = Queue_1_io_deq_bits_denied; 
  assign auto_in_d_bits_data = Queue_1_io_deq_bits_data; 
  assign auto_in_d_bits_corrupt = Queue_1_io_deq_bits_corrupt; 
  assign auto_out_a_valid = Queue_io_deq_valid; 
  assign auto_out_a_bits_opcode = Queue_io_deq_bits_opcode; 
  assign auto_out_a_bits_param = Queue_io_deq_bits_param; 
  assign auto_out_a_bits_size = Queue_io_deq_bits_size; 
  assign auto_out_a_bits_source = Queue_io_deq_bits_source; 
  assign auto_out_a_bits_address = Queue_io_deq_bits_address; 
  assign auto_out_a_bits_mask = Queue_io_deq_bits_mask; 
  assign auto_out_a_bits_data = Queue_io_deq_bits_data; 
  assign auto_out_a_bits_corrupt = Queue_io_deq_bits_corrupt; 
  assign auto_out_d_ready = Queue_1_io_enq_ready; 
  assign TLMonitor_clock = clock; 
  assign TLMonitor_reset = reset; 
  assign TLMonitor_io_in_a_ready = Queue_io_enq_ready; 
  assign TLMonitor_io_in_a_valid = auto_in_a_valid; 
  assign TLMonitor_io_in_a_bits_opcode = auto_in_a_bits_opcode; 
  assign TLMonitor_io_in_a_bits_param = auto_in_a_bits_param; 
  assign TLMonitor_io_in_a_bits_size = auto_in_a_bits_size; 
  assign TLMonitor_io_in_a_bits_source = auto_in_a_bits_source; 
  assign TLMonitor_io_in_a_bits_address = auto_in_a_bits_address; 
  assign TLMonitor_io_in_a_bits_mask = auto_in_a_bits_mask; 
  assign TLMonitor_io_in_a_bits_corrupt = auto_in_a_bits_corrupt; 
  assign TLMonitor_io_in_d_ready = auto_in_d_ready; 
  assign TLMonitor_io_in_d_valid = Queue_1_io_deq_valid; 
  assign TLMonitor_io_in_d_bits_opcode = Queue_1_io_deq_bits_opcode; 
  assign TLMonitor_io_in_d_bits_param = Queue_1_io_deq_bits_param; 
  assign TLMonitor_io_in_d_bits_size = Queue_1_io_deq_bits_size; 
  assign TLMonitor_io_in_d_bits_source = Queue_1_io_deq_bits_source; 
  assign TLMonitor_io_in_d_bits_sink = Queue_1_io_deq_bits_sink; 
  assign TLMonitor_io_in_d_bits_denied = Queue_1_io_deq_bits_denied; 
  assign TLMonitor_io_in_d_bits_corrupt = Queue_1_io_deq_bits_corrupt; 
  assign Queue_clock = clock; 
  assign Queue_reset = reset; 
  assign Queue_io_enq_valid = auto_in_a_valid; 
  assign Queue_io_enq_bits_opcode = auto_in_a_bits_opcode; 
  assign Queue_io_enq_bits_param = auto_in_a_bits_param; 
  assign Queue_io_enq_bits_size = auto_in_a_bits_size; 
  assign Queue_io_enq_bits_source = auto_in_a_bits_source; 
  assign Queue_io_enq_bits_address = auto_in_a_bits_address; 
  assign Queue_io_enq_bits_mask = auto_in_a_bits_mask; 
  assign Queue_io_enq_bits_data = auto_in_a_bits_data; 
  assign Queue_io_enq_bits_corrupt = auto_in_a_bits_corrupt; 
  assign Queue_io_deq_ready = auto_out_a_ready; 
  assign Queue_1_clock = clock; 
  assign Queue_1_reset = reset; 
  assign Queue_1_io_enq_valid = auto_out_d_valid; 
  assign Queue_1_io_enq_bits_opcode = auto_out_d_bits_opcode; 
  assign Queue_1_io_enq_bits_size = auto_out_d_bits_size; 
  assign Queue_1_io_enq_bits_source = auto_out_d_bits_source; 
  assign Queue_1_io_enq_bits_denied = auto_out_d_bits_denied; 
  assign Queue_1_io_enq_bits_data = auto_out_d_bits_data; 
  assign Queue_1_io_enq_bits_corrupt = auto_out_d_bits_corrupt; 
  assign Queue_1_io_deq_ready = auto_in_d_ready; 
endmodule
