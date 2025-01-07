// This file created by /home/zdd/freedom/rocket-chip/scripts/vlsi_rom_gen

module BootROM(
  input clock,
  input oe,
  input me,
  input [10:0] address,
  output [31:0] q
);
  reg [31:0] out;
  reg [31:0] rom [0:2047];


  // 1024 is the maximum length of $readmemh filename supported by Cadence Incisive
  reg [1024 * 8 - 1:0] path;

  integer i;
  initial begin
`ifdef RANDOMIZE
  `ifdef RANDOMIZE_MEM_INIT
    for (i = 0; i < 2048; i = i + 1) begin
      rom[i] = {1{$random}};
    end
  `endif
`endif
    if (!$value$plusargs("maskromhex=%s", path)) begin
      path ="/home/test/vivado_prj/MEISHAV100---FPGA-verifaction-on-VC707/fpga_project/sdboot.hex" ;
    end
    $readmemh(path, rom);
  end


  always @(posedge clock) begin
    if (me) begin
      out <= rom[address];
    end
  end

  assign q = oe ? out : 32'bZ;

endmodule

