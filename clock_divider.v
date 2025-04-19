module clock_divider
(
    output reg clk_1kHz,
    input clk_100MHz
);

// Converts 100 MHz clock to 1kHz clock (with cycle time period of 1 ms)
    reg [15:0] count = 0;

    initial
    begin
    	clk_1kHz <= 0;
    end

    always @(negedge clk_100MHz)
    begin
        count <= count + 1;
	//100k original cycles (edges) of 100 MHz implies 1 full cycle of 1kHz
	//50k original cycles (edges) of 100 MHz implies 1 half cycle of 1kHz
	if (count == 49999) 
	begin
            clk_1kHz <= ~clk_1kHz;
            count <= 0;
        end
    end
endmodule
