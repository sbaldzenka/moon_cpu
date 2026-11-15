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
description : cpu controller

---------------------------------------------------------------------------------------
*/

`timescale 1ns/100ps

`include "moon_cpu_defs.vh"
`include "alu/alu_defs.vh"

module controller
#(
    parameter REG_ADDR_WIDTH = 4
)
(
    // global signal
    input  wire                       i_resetn,
    // instruction signal
    input  wire [`MEM_DATA_WIDTH-1:0] i_instruction,
    // new memory address load signals
    output reg                        o_new_addr_wr,
    output reg  [`MEM_DATA_WIDTH-1:0] o_new_addr_data,
    // register control signals
    output reg  [                2:0] o_mux_sel,
    output reg                        o_reg_wr_strb,
    output reg  [ REG_ADDR_WIDTH-1:0] o_reg_addr,
    output reg  [     `REG_WIDTH-1:0] o_reg_data,
    output reg  [ REG_ADDR_WIDTH-1:0] o_reg_a_rd_strb,
    output reg  [     `REG_WIDTH-1:0] o_reg_a_addr,
    output reg  [ REG_ADDR_WIDTH-1:0] o_reg_b_rd_strb,
    output reg  [     `REG_WIDTH-1:0] o_reg_b_addr,
    // alu control
    output reg  [      `OP_WIDTH-1:0] o_alu_control

);

    wire [`OPCODE_WIDTH-1:0] opcode;

    assign opcode = i_instruction[`MEM_DATA_WIDTH-1:`MEM_DATA_WIDTH-`OPCODE_WIDTH];

    always @(i_instruction, negedge i_resetn) begin
        if (!i_resetn) begin
            o_reg_wr_strb   = 1'b0;
            o_new_addr_wr   = 1'b0;
            o_reg_a_rd_strb = 1'b0;
            o_reg_b_rd_strb = 1'b0;
        end else begin
            o_reg_wr_strb   = 1'b0;
            o_new_addr_wr   = 1'b0;
            o_mux_sel       = 2'b00;
            o_reg_a_rd_strb = 1'b0;
            o_reg_b_rd_strb = 1'b0;

            case (opcode)
                `OP_NOP: begin

                end

                `OP_LDA: begin
                    o_mux_sel     = 2'b00;
                    o_reg_wr_strb = 1'b1;
                    o_reg_addr    = i_instruction[REG_ADDR_WIDTH-1:0];
                    o_reg_data    = i_instruction[`MEM_DATA_WIDTH-`OPCODE_WIDTH:REG_ADDR_WIDTH];
                end

                `OP_JMP: begin
                    o_new_addr_wr   = 1'b1;
                    o_new_addr_data = i_instruction[`MEM_DATA_WIDTH-1:0];
                end

                `OP_ADD: begin
                    o_alu_control   = `ADD;
                    o_reg_a_rd_strb = 1'b1;
                    o_reg_a_addr    = i_instruction[3*REG_ADDR_WIDTH-1:2*REG_ADDR_WIDTH];
                    o_reg_b_rd_strb = 1'b1;
                    o_reg_b_addr    = i_instruction[2*REG_ADDR_WIDTH-1:REG_ADDR_WIDTH];
                    o_mux_sel       = 2'b01;
                    o_reg_wr_strb   = 1'b1;
                    o_reg_addr      = i_instruction[REG_ADDR_WIDTH-1:0];
                end

                default: begin
                    o_reg_wr_strb = 1'b0;
                end
            endcase
        end
    end

endmodule