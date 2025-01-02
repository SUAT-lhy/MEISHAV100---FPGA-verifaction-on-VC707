
module corePLL
(
    output  wire  locked,
    output  wire  [31:0] pll_state,
    input   wire  [31:0] use_which_clk,
    input   wire  [63:0] pll_cfg,
    input   wire    reset_n, // input hardreset and pwr reset
    output  wire    clk_out_cpu,
    output  wire    clk_out_main,
    output  wire    clk_out_chiplink,
    input   wire    clk_in1   // input ref clk
);

    localparam MAX_DIV_VALUE = 60;  // 1G/20 = 50M
    
    localparam MAX_DIV_CNT = MAX_DIV_VALUE/2;
    localparam DIV_SelWidth = $clog2(MAX_DIV_CNT+2);

    reg pll_output_clk;
    
    wire [MAX_DIV_CNT-1:0] clk_out_cpu_temp;
    wire [MAX_DIV_CNT-1:0] clk_out_main_temp;
    wire [MAX_DIV_CNT-1:0] clk_out_chiplink_temp;

    wire [DIV_SelWidth-1:0] pll_cpu_cfg;
    wire [DIV_SelWidth-1:0] pll_main_cfg;
    wire [DIV_SelWidth-1:0] pll_chiplink_cfg;

    reg [31:0]  use_which_clk_reg;
    reg  [63:0] pll_cfg_reg;

    always @(posedge clk_in1 or negedge reset_n) begin
        if(!reset_n) begin
            use_which_clk_reg[31:0] <= 32'b0;
        end
        else begin
            use_which_clk_reg[31:0] <= use_which_clk;
        end
    end

    
    always @(posedge clk_in1 or negedge reset_n) begin
        if(!reset_n) begin
            pll_cfg_reg[63:0] <= 32'b0;
        end
        else begin
            pll_cfg_reg[63:0] <= pll_cfg;
        end
    end

    assign pll_cpu_cfg[DIV_SelWidth-1:0] = use_which_clk_reg[0+:DIV_SelWidth];
    assign pll_main_cfg[DIV_SelWidth-1:0] = use_which_clk_reg[10+:DIV_SelWidth];
    assign pll_chiplink_cfg[DIV_SelWidth-1:0] = use_which_clk_reg[20+:DIV_SelWidth];

  `ifndef SYNTHESIS
    // pll wrapper
    initial begin
      pll_output_clk = 1'b0;
      forever begin
        #0.5 pll_output_clk <= ~pll_output_clk;  // 1GHz
      end
    end
  `endif

  // TBD 
    assign pll_state[0] = locked;

  clk_mux_glitch_free #(
    .NUM_INPUTS(MAX_DIV_CNT+2)
  ) i_clk_out_cpu_mux (
    .clks_i       ( {clk_out_cpu_temp[MAX_DIV_CNT-1:0], pll_output_clk, clk_in1}       ),
    .test_clk_i   ( 1'b0           ),
    .test_en_i    ( 1'b0           ),
    .async_rstn_i ( reset_n         ),
    .async_sel_i  ( pll_cpu_cfg),
    .clk_o        ( clk_out_cpu )
  ); 

  clk_mux_glitch_free #(
    .NUM_INPUTS(MAX_DIV_CNT+2)
  ) i_clk_out_main_mux (
    .clks_i       ( {clk_out_main_temp[MAX_DIV_CNT-1:0], pll_output_clk, clk_in1}       ),
    .test_clk_i   ( 1'b0           ),
    .test_en_i    ( 1'b0           ),
    .async_rstn_i ( reset_n         ),
    .async_sel_i  ( pll_main_cfg),
    .clk_o        ( clk_out_main )
  );

  clk_mux_glitch_free #(
    .NUM_INPUTS(MAX_DIV_CNT+2)
  ) i_clk_out_chiplink_mux (
    .clks_i       ( {clk_out_chiplink_temp[MAX_DIV_CNT-1:0], pll_output_clk, clk_in1}      ),
    .test_clk_i   ( 1'b0           ),
    .test_en_i    ( 1'b0           ),
    .async_rstn_i ( reset_n         ),
    .async_sel_i  ( pll_chiplink_cfg),
    .clk_o        ( clk_out_chiplink )
  );

  // 2 4 6 8 10 12 14 16 18
generate
  for(genvar i = 0; i < MAX_DIV_VALUE; i = i + 2) begin

    clk_int_div_static #(
        .DIV_VALUE(i+2),
        .ENABLE_CLOCK_IN_RESET(1'b0)
    ) u_clk_div_cpu(
        .clk_i          ( pll_output_clk          ),
        .rst_ni         ( reset_n         ),
        .en_i           ( 1'b1       ),
        .test_mode_en_i ( 1'b0 ),
        .clk_o          ( clk_out_cpu_temp[i/2]  )
        );

    clk_int_div_static #(
        .DIV_VALUE(i+2),
        .ENABLE_CLOCK_IN_RESET(1'b0)
    ) u_clk_div_main(
        .clk_i          ( pll_output_clk          ),
        .rst_ni         ( reset_n         ),
        .en_i           ( 1'b1       ),
        .test_mode_en_i ( 1'b0 ),
        .clk_o          ( clk_out_main_temp[i/2]  )
        );

    clk_int_div_static #(
        .DIV_VALUE(i+2),
        .ENABLE_CLOCK_IN_RESET(1'b0)
    ) u_clk_div_chiplink(
        .clk_i          ( pll_output_clk          ),
        .rst_ni         ( reset_n         ),
        .en_i           ( 1'b1       ),
        .test_mode_en_i ( 1'b0 ),
        .clk_o          ( clk_out_chiplink_temp[i/2]   )
        );

  end

endgenerate
    
        
    // clk_div #(
    //     .DIV(2),
    //     .IDLE_HIGH(1),
    //     .COVER(0)
    // ) u_clk_div_main (
    //     .clk_i(clk_in1),
    //     .enable_i(reset_n),
    //     .idle_o(),
    //     .clk_o(clk_out_main)
    // );


endmodule