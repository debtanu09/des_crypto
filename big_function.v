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

`include "selection_table.v"
`include "s1box.v"
`include "s2box.v"
`include "s3box.v"
`include "s4box.v"
`include "s5box.v"
`include "s6box.v"
`include "s7box.v"
`include "s8box.v"
`include "sbox_perm.v"
module big_function(in, key, out);

input [1:32] in;
input [1:48] key;
output [1:32] out;


wire [1:48] expanded;
selection_table uut(in, expanded);

wire [1:6] box1, box2, box3, box4, box5, box6, box7, box8;

assign {box1, box2, box3, box4, box5, box6, box7, box8} = expanded ^ key;

wire [1:4] box1_reduced, box2_reduced, box3_reduced, box4_reduced, box5_reduced, box6_reduced, box7_reduced, box8_reduced;

s1box s1(box1, box1_reduced);
s2box s2(box2, box2_reduced);
s3box s3(box3, box3_reduced);
s4box s4(box4, box4_reduced);
s5box s5(box5, box5_reduced);
s6box s6(box6, box6_reduced);
s7box s7(box7, box7_reduced);
s8box s8(box8, box8_reduced);


sbox_perm perm({box1_reduced, box2_reduced, box3_reduced, box4_reduced, box5_reduced, box6_reduced, box7_reduced, box8_reduced}, out);

endmodule
