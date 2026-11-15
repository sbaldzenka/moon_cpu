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
description : register file

---------------------------------------------------------------------------------------
*/

`timescale 1ns/100ps

`include "moon_cpu_defs.vh"

module register_file
#(
    parameter REG_ADDR_WIDTH = 4,
    parameter DATA_WIDTH     = 8
)
(
    // write register signals
    input  wire                      i_reg_valid_wr,
    input  wire [REG_ADDR_WIDTH-1:0] i_reg_addr_wr,
    input  wire [    DATA_WIDTH-1:0] i_reg_data_wr,
    // read register a signals
    input  wire                      i_reg_valid_a_rd,
    input  wire [REG_ADDR_WIDTH-1:0] i_reg_addr_a_rd,
    output reg  [    DATA_WIDTH-1:0] o_reg_data_a,
    // read register b signals
    input  wire                      i_reg_valid_b_rd,
    input  wire [REG_ADDR_WIDTH-1:0] i_reg_addr_b_rd,
    output reg  [    DATA_WIDTH-1:0] o_reg_data_b
);

    reg [DATA_WIDTH-1:0] register [REG_ADDR_WIDTH**2-1:0];

    always @(i_reg_valid_wr) begin
        register[i_reg_addr_wr] = i_reg_data_wr;
    end

    always @(i_reg_valid_a_rd) begin
        o_reg_data_a = register[i_reg_addr_a_rd];
    end

    always @(i_reg_valid_b_rd) begin
        o_reg_data_b = register[i_reg_addr_b_rd];
    end

endmodule