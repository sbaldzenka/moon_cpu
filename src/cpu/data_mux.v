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
description : 3x1 data multiplexer

---------------------------------------------------------------------------------------
*/

`timescale 1ns/100ps

module data_mux
#(
    parameter DATA_WIDTH = 8
)
(
    input  wire [           1:0] i_selector,
    input  wire [DATA_WIDTH-1:0] i_data_0,
    input  wire [DATA_WIDTH-1:0] i_data_1,
    input  wire [DATA_WIDTH-1:0] i_data_2,
    output wire [DATA_WIDTH-1:0] o_data
);

    assign o_data = i_selector == 2'b00 ? i_data_0 :
                    i_selector == 2'b01 ? i_data_1 : i_data_2;

endmodule