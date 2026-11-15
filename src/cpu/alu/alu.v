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
description : ALU top file

---------------------------------------------------------------------------------------
*/

`timescale 1ns/100ps

`include "alu_defs.vh"

module alu
#(
    parameter DATA_WIDTH = 8
)
(
    // input operands
    input  wire [ `OP_WIDTH-1:0] i_operation,
    input  wire [DATA_WIDTH-1:0] i_operator_a,
    input  wire [DATA_WIDTH-1:0] i_operator_b,
    input  wire                  i_carry_flag,
    // result
    output reg  [DATA_WIDTH-1:0] o_result,
    output wire                  o_carry_flag,
    output wire                  o_zero_flag
);

    wire [DATA_WIDTH-1:0] adder_result;
    wire [DATA_WIDTH-1:0] subtractor_result;

    wire                  add_carry_flag;
    wire                  inc_carry_flag;

    always @(*) begin
        case (i_operation)
            `ADD: o_result = adder_result;
            `SUB: o_result = subtractor_result;

            `COMP: begin
                
            end

            `INC: begin
                
            end

            `DEC: begin
                
            end

            `NOT: begin
                
            end

            `AND: begin
                
            end

            `OR: begin
                
            end

            `XOR: begin
                
            end

            `SLL: begin
                
            end

            `SRL: begin
                
            end
        endcase
    end

    defparam adder_inst.DATA_WIDTH = DATA_WIDTH;

    adder adder_inst
    (
        .i_a          ( i_operator_a   ),
        .i_b          ( i_operator_b   ),
        .i_carry_flag ( i_carry_flag   ),
        .o_result     ( adder_result   ),
        .o_carry_flag ( add_carry_flag )
    );

    defparam subtractor_inst.DATA_WIDTH = DATA_WIDTH;

    subtractor subtractor_inst
    (
        .i_a      ( i_operator_a      ),
        .i_b      ( i_operator_b      ),
        .o_result ( subtractor_result )
    );

    defparam comparator_inst.DATA_WIDTH = DATA_WIDTH;

    comparator comparator_inst
    (
        .i_a   ( i_operator_a ),
        .i_b   ( i_operator_b ),
        .o_eq  (),
        .o_neq (),
        .o_lt  (),
        .o_lte (),
        .o_gt  (),
        .o_gte ()
    );

    defparam incrementer_inst.DATA_WIDTH = DATA_WIDTH;

    incrementer incrementer_inst
    (
        .i_a          ( i_operator_a   ),
        .i_carry_flag ( i_carry_flag   ),
        .o_result     (),
        .o_carry_flag ( inc_carry_flag )
    );

    defparam decrementer_inst.DATA_WIDTH = DATA_WIDTH;

    decrementer decrementer_inst
    (
        .i_a          ( i_operator_a ),
        .o_result     ()
    );

    assign o_carry_flag = add_carry_flag || inc_carry_flag;

endmodule