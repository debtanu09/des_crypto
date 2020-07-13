/*
MIT License

Copyright (c) 2020 Debtanu Mukherjee

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

module s6box(in, out);
input [1:6] in;
output reg [1:4] out;

//S6 BOX DEFINITIONS

/*
                             S6

     12  1  10 15   9  2   6  8   0 13   3  4  14  7   5 11
     10 15   4  2   7 12   9  5   6  1  13 14   0 11   3  8
      9 14  15  5   2  8  12  3   7  0   4 10   1 13  11  6
      4  3   2 12   9  5  15 10  11 14   1  7   6  0   8 13
*/

always @(in) begin
	case(in)
		6'b000000: out <= 4'd12;
		6'b000001: out <= 4'd10;
		6'b000010: out <= 4'd1;
		6'b000011: out <= 4'd15;
		6'b000100: out <= 4'd10;
		6'b000101: out <= 4'd4;
		6'b000110: out <= 4'd15;
		6'b000111: out <= 4'd2;
		6'b001000: out <= 4'd9;
		6'b001001: out <= 4'd7;
		6'b001010: out <= 4'd2;
		6'b001011: out <= 4'd12;
		6'b001100: out <= 4'd6;
		6'b001101: out <= 4'd9;
		6'b001110: out <= 4'd8;
		6'b001111: out <= 4'd5;
		6'b010000: out <= 4'd0;
		6'b010001: out <= 4'd6;
		6'b010010: out <= 4'd13;
		6'b010011: out <= 4'd1;
		6'b010100: out <= 4'd3;
		6'b010101: out <= 4'd13;
		6'b010110: out <= 4'd4;
		6'b010111: out <= 4'd14;
		6'b011000: out <= 4'd14;
		6'b011001: out <= 4'd0;
		6'b011010: out <= 4'd7;
		6'b011011: out <= 4'd11;
		6'b011100: out <= 4'd5;
		6'b011101: out <= 4'd3;
		6'b011110: out <= 4'd11;
		6'b011111: out <= 4'd8;
		6'b100000: out <= 4'd9;
		6'b100001: out <= 4'd4;
		6'b100010: out <= 4'd14;
		6'b100011: out <= 4'd3;
		6'b100100: out <= 4'd15;
		6'b100101: out <= 4'd2;
		6'b100110: out <= 4'd5;
		6'b100111: out <= 4'd12;
		6'b101000: out <= 4'd2;
		6'b101001: out <= 4'd9;
		6'b101010: out <= 4'd8;
		6'b101011: out <= 4'd5;
		6'b101100: out <= 4'd12;
		6'b101101: out <= 4'd15;
		6'b101110: out <= 4'd3;
		6'b101111: out <= 4'd10;
		6'b110000: out <= 4'd7;
		6'b110001: out <= 4'd11;
		6'b110010: out <= 4'd0;
		6'b110011: out <= 4'd14;
		6'b110100: out <= 4'd4;
		6'b110101: out <= 4'd1;
		6'b110110: out <= 4'd10;
		6'b110111: out <= 4'd7;
		6'b111000: out <= 4'd1;
		6'b111001: out <= 4'd6;
		6'b111010: out <= 4'd13;
		6'b111011: out <= 4'd0;
		6'b111100: out <= 4'd11;
		6'b111101: out <= 4'd8;
		6'b111110: out <= 4'd6;
		6'b111111: out <= 4'd13;
	endcase
end


endmodule
