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
date        : 10.11.2026
author      : siarhei baldzenka
e-mail      : sbaldzenka@proton.me
description : incrementer module for ALU

---------------------------------------------------------------------------------------
*/

`timescale 1ns/100ps

module incrementer
#(
    parameter DATA_WIDTH = 8
)
(
    // signals input
    input  wire [DATA_WIDTH-1:0] i_a,
    input  wire                  i_carry_flag,
    // signals output
    output wire [DATA_WIDTH-1:0] o_result,
    output wire                  o_carry_flag
);

    assign {o_carry_flag, o_result} = i_a + 1'b1 + i_carry_flag;

endmodule