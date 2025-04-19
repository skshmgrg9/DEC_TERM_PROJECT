module seven_segment_driver
(
    output reg [6:0] segments,
    input [3:0] bcd
    
);
/*
 Corresponding LEDs for the segments output "ABCDEFG", where A is the MSB and G is the LSB
 -- A --
 |     |
 F     B
 |     |
 -- G --
 |     |
 E     C
 |     |
 -- D --
*/

    always @(bcd)
    begin
        case (bcd)
        4'b0000 : segments = 7'b0000001; // Display "0"
       	4'b0001 : segments = 7'b1001111; // Display "1"
        4'b0010 : segments = 7'b0010010; // Display "2"
	    4'b0011 : segments = 7'b0000110; // Display "3"
	    4'b0100 : segments = 7'b1001100; // Display "4"
	    4'b0101 : segments = 7'b0100100; // Display "5"
	    4'b0110 : segments = 7'b0100000; // Display "6"
	    4'b0111 : segments = 7'b0001111; // Display "7"
	    4'b1000 : segments = 7'b0000000; // Display "8"
	    4'b1001 : segments = 7'b0000100; // Display "9"
        default : segments = 7'b1111111; // Blank display
        endcase
    end
endmodule
