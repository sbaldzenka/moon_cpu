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



    // system and special
    `define OP_NOP

    // control flow / branching
    `define OP_JMP
    `define OP_CAL
    `define OP_RET

    // data movement
    `define OP_INP
    `define OP_OUTP

    // arithmetic
    `define OP_INC
    `define OP_DEC
    `define OP_ADD
    `define OP_SUB
    `define OP_CMP

    // logical
    `define OP_NOT
    `define OP_AND
    `define OP_OR
    `define OP_XOR
    `define OP_SHL
    `define OP_SHR

`endif