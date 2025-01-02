
`ifndef sp_sram_wrapper_V
`define sp_sram_wrapper_V

module sp_sram_wrapper
#(
  parameter p_data_nbits  = 1,
  parameter p_num_entries = 2,

  // Local constants not meant to be set from outside the module
  parameter c_addr_nbits  = $clog2(p_num_entries),
  parameter c_data_nbytes = (p_data_nbits+7)/8 // $ceil(p_data_nbits/8)
)(
  input  wire                      clk,  // clk
  input  wire                      web,  // bar( write en )
  input  wire                      csb,  // bar( whole SRAM en )
  input  wire [c_addr_nbits-1:0]   addr, // address
  `ifdef USE_BYTE_EN
  input  wire [c_data_nbytes-1:0]  byteen,  // byte en
  `else
  input  wire [p_data_nbits-1:0]   biten,  // bit en
  `endif
  input  wire [p_data_nbits-1:0]   din,  // write data
  output wire [p_data_nbits-1:0]   dout  // read data
);




  reg [p_data_nbits-1:0] mem[p_num_entries-1:0];

  reg [p_data_nbits-1:0] rd_data;

  always @( posedge clk ) begin

    // Read path

    if ( csb && ~web )
      rd_data <= mem[addr];
    `ifdef SRAM_DATA_NOT_PRESERVE
    else
      rd_data <= {p_data_nbits{1'bx}};
    `else
      
    `endif

  end

  // Write path

`ifdef USE_BYTE_EN
  genvar i;
  generate
    for ( i = 0; i < c_data_nbytes; i = i + 1 )
    begin : write
      always @( posedge clk ) begin
        if ( csb && web && (byteen[i] == 1'b1) ) begin
          mem[addr][ (i+1)*8-1 : i*8 ] <= din[ (i+1)*8-1 : i*8 ];
        end
      end
    end
  endgenerate

`else

  genvar i;
  generate
    for ( i = 0; i < p_data_nbits; i = i + 1 )
    begin : write
      always @( posedge clk ) begin
        if ( csb && web  && (biten[i] == 1'b1)) begin
          mem[addr][i] <= din[i];
        end
      end
    end
  endgenerate

`endif

  assign dout = rd_data;


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
  reg [p_data_nbits - 1:0] _RAND_0;
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
  _RAND_0 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < p_num_entries - 1; initvar = initvar+1)
    mem[initvar] = _RAND_0;
  `endif // RANDOMIZE_MEM_INIT
  end
`endif // RANDOMIZE



endmodule

`endif /* SRAM_SRAM_GENERIC_V */
