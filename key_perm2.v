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

module key_perm2(in, out);

input [1:56] in;
output [1:48] out;

/*
	                      PC-2

                 14    17   11    24     1    5
                  3    28   15     6    21   10
                 23    19   12     4    26    8
                 16     7   27    20    13    2
                 41    52   31    37    47   55
                 30    40   51    45    33   48
                 44    49   39    56    34   53
                 46    42   50    36    29   32
*/

assign out = {in[14], in[17], in[11], in[24], in[1],  in[5],
	     in[3],  in[28], in[15], in[6],  in[21], in[10],
	     in[23], in[19], in[12], in[4],  in[26], in[8],
	     in[16], in[7],  in[27], in[20], in[13], in[2],
	     in[41], in[52], in[31], in[37], in[47], in[55],
	     in[30], in[40], in[51], in[45], in[33], in[48],
	     in[44], in[49], in[39], in[56], in[34], in[53],
	     in[46], in[42], in[50], in[36], in[29], in[32]};
	     
endmodule
