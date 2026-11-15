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
date        : 08.10.2026
author      : siarhei baldzenka
e-mail      : sbaldzenka@proton.me
description : parameters and defines for ALU

---------------------------------------------------------------------------------------
*/

`ifndef ALU_DEFS_VH
`define ALU_DEFS_VH

    // ALU parameters
    `define OP_WIDTH 4

    // ALU commands
    `define ADD      4'h0
    `define SUB      4'h1
    `define COMP     4'h2
    `define INC      4'h3
    `define DEC      4'h4
    `define NOT      4'h5
    `define AND      4'h6
    `define OR       4'h7
    `define XOR      4'h8
    `define SLL      4'h9
    `define SRL      4'hA

`endif