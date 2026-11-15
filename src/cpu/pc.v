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
date        : 31.10.2026
author      : siarhei baldzenka
e-mail      : sbaldzenka@proton.me
description : program counter

---------------------------------------------------------------------------------------
*/

`timescale 1ns/100ps

module pc
#(
    parameter PC_WIDTH = 8
)
(
    // global signals
    input  wire                i_clk,
    input  wire                i_resetn,
    // input address
    input  wire                i_addr_wr,
    input  wire [PC_WIDTH-1:0] i_addr_data,
    // ouput address
    output wire [PC_WIDTH-1:0] o_pc
);

    reg [PC_WIDTH-1:0] pc_next_counter;

    assign o_pc = pc_next_counter;

    always @(posedge i_clk or i_addr_wr or negedge i_resetn) begin
        if (!i_resetn) begin
            pc_next_counter <= {PC_WIDTH{1'b1}};
        end else if (i_addr_wr) begin
            pc_next_counter <= i_addr_data;
        end else begin
            pc_next_counter <= pc_next_counter + 1'b1;
        end
    end

endmodule