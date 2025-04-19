module mod_ten_counter
(
    output reg [3:0] q,
    input clk,
    input clear
);

initial
begin
    q <= 4'b1001;
end

always @(negedge clk, posedge clear)
begin
    if(clear)
	q <= 4'b0;
    else if (q != 4'b1001)
        q <= q + 1'b1;
    else
        q <= 4'b0;
end

endmodule
