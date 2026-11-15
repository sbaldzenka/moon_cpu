/*
---------------------------------------------------------------------------------------

MIT License

Copyright (c) 2026 Siarhei Baldzenka

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
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

---------------------------------------------------------------------------------------

project     : moon_cpu
version     : 1.0
date        : 04.11.2026
author      : siarhei baldzenka
e-mail      : sbaldzenka@proton.me
description : defines for moon_cpu

---------------------------------------------------------------------------------------
*/

`ifndef MOON_CPU_DEFS_VH
`define MOON_CPU_DEFS_VH

    // instruction memory defines
    `define MEM_ADDR_WIDTH 10
    `define MEM_DATA_WIDTH 18

    // registers defines
    `define REG_NUM        16
    `define REG_WIDTH      8

    // opcodes
    `define OPCODE_WIDTH   5
    // system and special
    `define OP_NOP         5'b00000

    // data movement
    `define OP_LDA         5'b00001
    `define OP_INP         5'b00010
    `define OP_OUTP        5'b00011

    // arithmetic
    `define OP_INC         5'b00100
    `define OP_DEC         5'b00101
    `define OP_ADD         5'b00110
    `define OP_SUB         5'b00111
    `define OP_CMP         5'b01000

    // logical
    `define OP_NOT         5'b01001
    `define OP_AND         5'b01010
    `define OP_OR          5'b01011
    `define OP_XOR         5'b01100
    `define OP_SLL         5'b01101
    `define OP_SRL         5'b01110

    // control flow / branching
    `define OP_JMP         5'b01111
    `define OP_CAL         5'b10000
    `define OP_RET         5'b10001

`endif