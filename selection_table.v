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

module selection_table(in, out);

input [1:32] in;
output [1:48] out;

//SELECTION TABLE
/*
                         32     1    2     3     4    5
                          4     5    6     7     8    9
                          8     9   10    11    12   13
                         12    13   14    15    16   17
                         16    17   18    19    20   21
                         20    21   22    23    24   25
                         24    25   26    27    28   29
                         28    29   30    31    32    1

*/

assign out = {in[32], in[1],  in[2],  in[3],  in[4],  in[5],
	      in[4],  in[5],  in[6],  in[7],  in[8],  in[9],
	      in[8],  in[9],  in[10], in[11], in[12], in[13],
	      in[12], in[13], in[14], in[15], in[16], in[17],
	      in[16], in[17], in[18], in[19], in[20], in[21],
	      in[20], in[21], in[22], in[23], in[24], in[25],
	      in[24], in[25], in[26], in[27], in[28], in[29],
	      in[28], in[29], in[30], in[31], in[32], in[1]};

endmodule
