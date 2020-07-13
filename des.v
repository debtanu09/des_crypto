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

`include "left_rotate.v"
`include "key_perm2.v"
`include "big_function.v"
module des(plaintext, key, inv_key, ciphertext);

input [1:64] plaintext, key;
output [1:64] ciphertext;
output inv_key;

//taking first bit (MSB) of every byte is parity bit 8, 16, .... 64


wire [1:56] effective_key;
wire [1:8] key_parity;
wire [1:8] generated_parity;

assign key_parity = {key[8], key[16], key[24], key[32], key[40], key[48], key[56], key[64]};

assign generated_parity[1] = ~^(key[1:7]);
assign generated_parity[2] = ~^(key[9:15]);
assign generated_parity[3] = ~^(key[17:23]);
assign generated_parity[4] = ~^(key[25:31]);
assign generated_parity[5] = ~^(key[33:39]);
assign generated_parity[6] = ~^(key[41:47]);
assign generated_parity[7] = ~^(key[49:55]);
assign generated_parity[8] = ~^(key[57:63]);

assign inv_key = (key_parity != generated_parity);

//FIRST KEY PERMUTATION
/*		  57   49    41   33    25    17    9
                   1   58    50   42    34    26   18
                  10    2    59   51    43    35   27
                  19   11     3   60    52    44   36
                  63   55    47   39    31    23   15
                   7   62    54   46    38    30   22
                  14    6    61   53    45    37   29
                  21   13     5   28    20    12    4

*/


wire [1:56] key_perm1;

assign key_perm1 = {key[57], key[49], key[41], key[33], key[25], key[17], key[9],
		    key[1],  key[58], key[50], key[42], key[34], key[26], key[18],
		    key[10], key[2],  key[59], key[51], key[43], key[35], key[27],
		    key[19], key[11], key[3],  key[60], key[52], key[44], key[36],
		    key[63], key[55], key[47], key[39], key[31], key[23], key[15],
		    key[7],  key[62], key[54], key[46], key[38], key[30], key[22],
		    key[14], key[6],  key[61], key[53], key[45], key[37], key[29],
		    key[21], key[13], key[5],  key[28], key[20], key[12], key[4]};
		    

wire [1:28] c0, d0;

assign c0 = key_perm1[1:28];
assign d0 = key_perm1[29:56];

wire [1:28] c1, d1, c2, d2, c3, d3, c4, d4, c5, d5, c6, d6, c7, d7, c8, d8, c9, d9, c10, d10, c11, d11, c12, d12, c13, d13, c14, d14, c15, d15, c16, d16;
wire shift1, shift2, shift3, shift4, shift5, shift6, shift7, shift8, shift9, shift10, shift11, shift12, shift13, shift14, shift15, shift16;
assign shift1 = 1'b0;
assign shift2 = 1'b0;
assign shift3 = 1'b1;
assign shift4 = 1'b1;
assign shift5 = 1'b1;
assign shift6 = 1'b1;
assign shift7 = 1'b1;
assign shift8 = 1'b1;
assign shift9 = 1'b0;
assign shift10 = 1'b1;
assign shift11 = 1'b1;
assign shift12 = 1'b1;
assign shift13 = 1'b1;
assign shift14 = 1'b1;
assign shift15 = 1'b1;
assign shift16 = 1'b0;

//KEY SHIFTS
/*		    Iteration     Number of
                      Number      Left Shifts

                          1          1
                          2          1
                          3          2
                          4          2
                          5          2
                          6          2
                          7          2
                          8          2
                          9          1
                         10          2
                         11          2
                         12          2
                         13          2
                         14          2
                         15          2
                         16          1
*/


left_rotate for_c1(c0, shift1, c1);
left_rotate for_d1(d0, shift1, d1);

left_rotate for_c2(c1, shift2, c2);
left_rotate for_d2(d1, shift2, d2);

left_rotate for_c3(c2, shift3, c3);
left_rotate for_d3(d2, shift3, d3);

left_rotate for_c4(c3, shift4, c4);
left_rotate for_d4(d3, shift4, d4);

left_rotate for_c5(c4, shift5, c5);
left_rotate for_d5(d4, shift5, d5);

left_rotate for_c6(c5, shift6, c6);
left_rotate for_d6(d5, shift6, d6);

left_rotate for_c7(c6, shift7, c7);
left_rotate for_d7(d6, shift7, d7);

left_rotate for_c8(c7, shift8, c8);
left_rotate for_d8(d7, shift8, d8);

left_rotate for_c9(c8, shift9, c9);
left_rotate for_d9(d8, shift9, d9);

left_rotate for_c10(c9, shift10, c10);
left_rotate for_d10(d9, shift10, d10);

left_rotate for_c11(c10, shift11, c11);
left_rotate for_d11(d10, shift11, d11);

left_rotate for_c12(c11, shift12, c12);
left_rotate for_d12(d11, shift12, d12);

left_rotate for_c13(c12, shift13, c13);
left_rotate for_d13(d12, shift13, d13);

left_rotate for_c14(c13, shift14, c14);
left_rotate for_d14(d13, shift14, d14);

left_rotate for_c15(c14, shift15, c15);
left_rotate for_d15(d14, shift15, d15);

left_rotate for_c16(c15, shift16, c16);
left_rotate for_d16(d15, shift16, d16);

//SECOND KEY PERMUTATION
/*
                 14    17   11    24     1    5
                  3    28   15     6    21   10
                 23    19   12     4    26    8
                 16     7   27    20    13    2
                 41    52   31    37    47   55
                 30    40   51    45    33   48
                 44    49   39    56    34   53
                 46    42   50    36    29   32
*/

wire [1:48] k1, k2, k3, k4, k5, k6, k7, k8, k9, k10, k11, k12, k13, k14, k15, k16;

key_perm2 for_k1 ({c1, d1}, k1);
key_perm2 for_k2 ({c2, d2}, k2);
key_perm2 for_k3 ({c3, d3}, k3);
key_perm2 for_k4 ({c4, d4}, k4);
key_perm2 for_k5 ({c5, d5}, k5);
key_perm2 for_k6 ({c6, d6}, k6);
key_perm2 for_k7 ({c7, d7}, k7);
key_perm2 for_k8 ({c8, d8}, k8);
key_perm2 for_k9 ({c9, d9}, k9);
key_perm2 for_k10 ({c10, d10}, k10);
key_perm2 for_k11 ({c11, d11}, k11);
key_perm2 for_k12 ({c12, d12}, k12);
key_perm2 for_k13 ({c13, d13}, k13);
key_perm2 for_k14 ({c14, d14}, k14);
key_perm2 for_k15 ({c15, d15}, k15);
key_perm2 for_k16 ({c16, d16}, k16);
	     

//FIRST PLAINTEXT PERMUTATION
/*
	    58    50   42    34    26   18    10    2
            60    52   44    36    28   20    12    4
            62    54   46    38    30   22    14    6
            64    56   48    40    32   24    16    8
            57    49   41    33    25   17     9    1
            59    51   43    35    27   19    11    3
            61    53   45    37    29   21    13    5
            63    55   47    39    31   23    15    7
*/

wire [1:64] plaintext_perm1;

assign plaintext_perm1 = {plaintext[58], plaintext[50], plaintext[42], plaintext[34], plaintext[26], plaintext[18], plaintext[10], plaintext[2],
			  plaintext[60], plaintext[52], plaintext[44], plaintext[36], plaintext[28], plaintext[20], plaintext[12], plaintext[4],
			  plaintext[62], plaintext[54], plaintext[46], plaintext[38], plaintext[30], plaintext[22], plaintext[14], plaintext[6],
			  plaintext[64], plaintext[56], plaintext[48], plaintext[40], plaintext[32], plaintext[24], plaintext[16], plaintext[8],
			  plaintext[57], plaintext[49], plaintext[41], plaintext[33], plaintext[25], plaintext[17], plaintext[9],  plaintext[1],
			  plaintext[59], plaintext[51], plaintext[43], plaintext[35], plaintext[27], plaintext[19], plaintext[11], plaintext[3],
			  plaintext[61], plaintext[53], plaintext[45], plaintext[37], plaintext[29], plaintext[21], plaintext[13], plaintext[5],
			  plaintext[63], plaintext[55], plaintext[47], plaintext[39], plaintext[31], plaintext[23], plaintext[15], plaintext[7]};

	     
wire [1:32] l0, r0;

assign l0 = plaintext_perm1[1:32];
assign r0 = plaintext_perm1[33:64];


wire [1:32] l1, r1, l2, r2, l3, r3, l4, r4, l5, r5, l6, r6, l7, r7, l8, r8, l9, r9, l10, r10, l11, r11, l12, r12, l13, r13, l14, r14, l15, r15, l16, r16;
wire [1:32] r1_inter, r2_inter, r3_inter, r4_inter, r5_inter, r6_inter, r7_inter, r8_inter, r9_inter, r10_inter, r11_inter, r12_inter, r13_inter, r14_inter, r15_inter, r16_inter;

assign l1 = r0;
assign l2 = r1;
assign l3 = r2;
assign l4 = r3;
assign l5 = r4;
assign l6 = r5;
assign l7 = r6;
assign l8 = r7;
assign l9 = r8;
assign l10 = r9;
assign l11 = r10;
assign l12 = r11;
assign l13 = r12;
assign l14 = r13;
assign l15 = r14;
assign l16 = r15;

big_function for_r1(r0, k1, r1_inter);
assign r1 = l0 ^ r1_inter;

big_function for_r2(r1, k2, r2_inter);
assign r2 = l1 ^ r2_inter;

big_function for_r3(r2, k3, r3_inter);
assign r3 = l2 ^ r3_inter;

big_function for_r4(r3, k4, r4_inter);
assign r4 = l3 ^ r4_inter;

big_function for_r5(r4, k5, r5_inter);
assign r5 = l4 ^ r5_inter;

big_function for_r6(r5, k6, r6_inter);
assign r6 = l5 ^ r6_inter;

big_function for_r7(r6, k7, r7_inter);
assign r7 = l6 ^ r7_inter;

big_function for_r8(r7, k8, r8_inter);
assign r8 = l7 ^ r8_inter;

big_function for_r9(r8, k9, r9_inter);
assign r9 = l8 ^ r9_inter;

big_function for_r10(r9, k10, r10_inter);
assign r10 = l9 ^ r10_inter;

big_function for_r11(r10, k11, r11_inter);
assign r11 = l10 ^ r11_inter;

big_function for_r12(r11, k12, r12_inter);
assign r12 = l11 ^ r12_inter;

big_function for_r13(r12, k13, r13_inter);
assign r13 = l12 ^ r13_inter;

big_function for_r14(r13, k14, r14_inter);
assign r14 = l13 ^ r14_inter;

big_function for_r15(r14, k15, r15_inter);
assign r15 = l14 ^ r15_inter;

big_function for_r16(r15, k16, r16_inter);
assign r16 = l15 ^ r16_inter;


wire [1:64] r16l16;

assign r16l16 = {r16, l16};

wire [1:64] last_perm;

/*
              			  IP-1

                40     8   48    16    56   24    64   32
                39     7   47    15    55   23    63   31
                38     6   46    14    54   22    62   30
                37     5   45    13    53   21    61   29
                36     4   44    12    52   20    60   28
                35     3   43    11    51   19    59   27
                34     2   42    10    50   18    58   26
                33     1   41     9    49   17    57   25

*/

assign last_perm = {r16l16[40], r16l16[8], r16l16[48], r16l16[16], r16l16[56], r16l16[24], r16l16[64], r16l16[32],
		    r16l16[39], r16l16[7], r16l16[47], r16l16[15], r16l16[55], r16l16[23], r16l16[63], r16l16[31],
		    r16l16[38], r16l16[6], r16l16[46], r16l16[14], r16l16[54], r16l16[22], r16l16[62], r16l16[30],
		    r16l16[37], r16l16[5], r16l16[45], r16l16[13], r16l16[53], r16l16[21], r16l16[61], r16l16[29],
		    r16l16[36], r16l16[4], r16l16[44], r16l16[12], r16l16[52], r16l16[20], r16l16[60], r16l16[28],
		    r16l16[35], r16l16[3], r16l16[43], r16l16[11], r16l16[51], r16l16[19], r16l16[59], r16l16[27],
		    r16l16[34], r16l16[2], r16l16[42], r16l16[10], r16l16[50], r16l16[18], r16l16[58], r16l16[26],
		    r16l16[33], r16l16[1], r16l16[41], r16l16[9],  r16l16[49], r16l16[17], r16l16[57], r16l16[25]};
	
		    
assign ciphertext = (~inv_key) ? last_perm : 64'bz;


endmodule
