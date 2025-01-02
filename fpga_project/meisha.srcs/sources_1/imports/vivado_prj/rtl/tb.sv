`timescale 1ns / 1ps
module tb();
    reg clk_200m_p;
    reg hard_reset;
    reg pwr_reset;
    always #1ns clk_200m_p <= ~clk_200m_p;
    initial begin
      clk_200m_p <= 1'b0;
      #100000;
    end
    initial begin
      hard_reset <= 1'b0;
      #40
      hard_reset <= 1'b1;
      #40
      hard_reset <= 1'b0;
      #100000;
    end
    initial begin
      pwr_reset <= 1'b0;
      #40
      pwr_reset <= 1'b1;
      #200ns
      pwr_reset <= 1'b0;
      #100000;
    end
MEISHAV100_TOP u_MEISHAV100_TOP(
    .PWR_RESET(pwr_reset),
    .HARD_RESET(hard_reset),
    .AUTO_SPI_SOURCE_OUT_DQ_1_I(),
    .AUTO_UART_SOURCE_OUT_RXD(), 
    .DEBUG_SYSTEMJTAG_JTAG_TCK(),
    .DEBUG_SYSTEMJTAG_JTAG_TMS(), 
    .DEBUG_SYSTEMJTAG_JTAG_TDI(),
    .AUTO_SPI_SOURCE_OUT_SCK(), 
    .AUTO_SPI_SOURCE_OUT_DQ_0_O(), 
    .AUTO_SPI_SOURCE_OUT_CS_0(), 
    .AUTO_UART_SOURCE_OUT_TXD(),
    .DEBUG_SYSTEMJTAG_JTAG_TDO(), 
  
    .DEBUG_MODE_SEL(1'b0),

    //=============================================add=============================================//
    .SPI_SDO0(),
    .SPI_SDO1(),
    .SPI_SDO2(),
    .SPI_SDO3(),
    .SPI_SDI0(),
    .SPI_SDI1(),
    .SPI_SDI2(),
    .SPI_SDI3(),
    .SPI_CS(),
    .SPI_SCLK(),
    .SPI_MASTER_CLK(),
    .SPI_MASTER_CSN(),
    .SPI_MASTER_SDO(),
    .SPI_MASTER_SDI(),
    .SYS_CLOCK_P(clk_200m_p), 
    .SYS_CLOCK_N(~clk_200m_p),
    //=============================================add===============================================//

    .DDR_IO_C2B_CLK(),   // output
    .DDR_IO_C2B_RST(),
    .DDR_IO_C2B_SEND(),
    .DDR_IO_C2B_DATA(),
    .DDR_IO_B2C_CLK(),
    .DDR_IO_B2C_RST(),
    .DDR_IO_B2C_SEND(),
    .DDR_IO_B2C_DATA()
    );
endmodule

