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

`include "des.v"
module des_tb;

reg [1:64] plaintext, key;
reg encry_decry;
wire inv_key;
wire [1:64] ciphertext;

initial begin
$dumpfile("wave.vcd");
$dumpvars(0, des_tb);
end

des encrypt(plaintext, key, encry_decry, inv_key, ciphertext);

//encry_decry - 0 for encrypt and 1 for decrypt
initial begin
	key = 64'h0E329232EA6D0D73;
	encry_decry = 0;
	repeat(1000) begin
		#10
		plaintext = $random;
		encry_decry = ~encry_decry;
	end
	#10
		$finish;
end

endmodule
