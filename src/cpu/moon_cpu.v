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
description : top file

---------------------------------------------------------------------------------------
*/

`timescale 1ns/100ps

`include "moon_cpu_defs.vh"

module moon_cpu
(
    // global signals
    input  wire                       i_clk,
    input  wire                       i_resetn,
    // memory interface
    output wire                       o_mem_we,
    output wire [`MEM_ADDR_WIDTH-1:0] o_mem_addr,
    output wire [`MEM_DATA_WIDTH-1:0] o_mem_data,
    output wire [`MEM_DATA_WIDTH-1:0] i_mem_data
);

    assign o_mem_we   = 1'b0;
    assign o_mem_data = {`MEM_DATA_WIDTH{1'b0}};

    defparam pc_inst.PC_WIDTH = `MEM_ADDR_WIDTH;

    pc pc_inst
    (
        .i_clk    ( i_clk      ),
        .i_resetn ( i_resetn   ),
        .o_pc     ( o_mem_addr )
    );
/*
    defparam alu_inst.OP_WIDTH   = 3;
    defparam alu_inst.DATA_WIDTH = 8;

    alu alu_inst
    (
        .i_clk        ( i_clk    ),
        .i_resetn     ( i_resetn ),
        .i_operation  (),
        .i_operator_a (),
        .i_operator_b (),
        .i_carry_flag (),
        .o_result     (),
        .o_carry_flag ()
    );
*/
endmodule