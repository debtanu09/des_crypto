#!/bin/bash

iverilog selection_table.v
iverilog s1box.v
iverilog s2box.v
iverilog s3box.v
iverilog s4box.v
iverilog s5box.v
iverilog s6box.v
iverilog s7box.v
iverilog s8box.v
iverilog sbox_perm.v
iverilog left_rotate.v
iverilog key_perm2.v
iverilog big_function.v
iverilog des.v
iverilog des_tb.v
vvp a.out
gtkwave wave.vcd
