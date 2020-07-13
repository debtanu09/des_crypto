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

module sbox_perm(in, out);

input [1:32] in;
output [1:32] out;

/*
				   P

                             16   7  20  21
                             29  12  28  17
                              1  15  23  26
                              5  18  31  10
                              2   8  24  14
                             32  27   3   9
                             19  13  30   6
                             22  11   4  25

*/


assign out = {in[16], in[7],  in[20], in[21],
              in[29], in[12], in[28], in[17],
              in[1],  in[15], in[23], in[26],
              in[5],  in[18], in[31], in[10],
              in[2],  in[8],  in[24], in[14],
              in[32], in[27], in[3],  in[9],
              in[19], in[13], in[30], in[6],
              in[22], in[11], in[4],  in[25]};
endmodule
