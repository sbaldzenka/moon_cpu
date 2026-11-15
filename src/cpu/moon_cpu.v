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
description : moon_cpu top file

---------------------------------------------------------------------------------------
*/

`timescale 1ns/100ps

`include "moon_cpu_defs.vh"
`include "alu/alu_defs.vh"

module moon_cpu
(
    // global signals
    input  wire                       i_clk,
    input  wire                       i_resetn,
    // memory interface
    output wire                       o_mem_we,
    output wire [`MEM_ADDR_WIDTH-1:0] o_mem_addr,
    output wire [`MEM_DATA_WIDTH-1:0] o_mem_data,
    input  wire [`MEM_DATA_WIDTH-1:0] i_mem_data
);

    // parameters
    parameter REG_ADDR_WIDTH = $clog2(`REG_NUM);

    // signals
    wire                       mem_addr_wr;
    wire [`MEM_DATA_WIDTH-1:0] mem_addr_data;

    wire                       reg_wr_strb;
    wire [REG_ADDR_WIDTH-1:0]  reg_addr;
    wire [    `REG_WIDTH-1:0]  reg_data;
    wire                       reg_rd_a_strb;
    wire [REG_ADDR_WIDTH-1:0]  reg_addr_a;
    wire [    `REG_WIDTH-1:0]  reg_data_a;
    wire                       reg_rd_b_strb;
    wire [REG_ADDR_WIDTH-1:0]  reg_addr_b;
    wire [    `REG_WIDTH-1:0]  reg_data_b;

    wire [      `OP_WIDTH-1:0] alu_control;
    wire [    `REG_WIDTH-1:0]  alu_data;

    wire [               1:0]  mux_selector;
    wire [    `REG_WIDTH-1:0]  mux_data;

    //
    assign o_mem_we   = 1'b0;
    assign o_mem_data = {`MEM_DATA_WIDTH{1'b0}};

    //
    defparam pc_inst.PC_WIDTH = `MEM_ADDR_WIDTH;

    pc pc_inst
    (
        .i_clk       ( i_clk         ),
        .i_resetn    ( i_resetn      ),
        .i_addr_wr   ( mem_addr_wr   ),
        .i_addr_data ( mem_addr_data ),
        .o_pc        ( o_mem_addr    )
    );

    //
    defparam controller_inst.REG_ADDR_WIDTH = REG_ADDR_WIDTH;

    controller controller_inst
    (
        .i_resetn        ( i_resetn      ),
        .i_instruction   ( i_mem_data    ),
        .o_new_addr_wr   ( mem_addr_wr   ),
        .o_new_addr_data ( mem_addr_data ),
        .o_mux_sel       ( mux_selector  ),
        .o_reg_wr_strb   ( o_reg_wr_strb ),
        .o_reg_addr      ( reg_addr      ),
        .o_reg_data      ( reg_data      ),
        .o_reg_a_rd_strb ( reg_rd_a_strb ),
        .o_reg_a_addr    ( reg_addr_a    ),
        .o_reg_b_rd_strb ( reg_rd_b_strb ),
        .o_reg_b_addr    ( reg_addr_b    ),
        .o_alu_control   ( alu_control   )
    );

    //
    defparam data_mux_inst.DATA_WIDTH = `REG_WIDTH;

    data_mux data_mux_inst
    (
        .i_selector ( mux_selector ),
        .i_data_0   ( reg_data     ),
        .i_data_1   ( alu_data     ),
        .i_data_2   ( ),
        .o_data     ( mux_data     )
    );

    //
    defparam register_file_inst.REG_ADDR_WIDTH = REG_ADDR_WIDTH;
    defparam register_file_inst.DATA_WIDTH     = `REG_WIDTH;

    register_file register_file_inst
    (
        .i_reg_valid_wr   ( o_reg_wr_strb  ),
        .i_reg_addr_wr    ( reg_addr       ),
        .i_reg_data_wr    ( mux_data       ),
        .i_reg_valid_a_rd ( reg_rd_a_strb  ),
        .i_reg_addr_a_rd  ( reg_addr_a     ),
        .o_reg_data_a     ( reg_data_a     ),
        .i_reg_valid_b_rd ( reg_rd_b_strb  ),
        .i_reg_addr_b_rd  ( reg_addr_b     ),
        .o_reg_data_b     ( reg_data_b     )
    );

    //
    defparam alu_inst.DATA_WIDTH = 8;

    alu alu_inst
    (
        .i_operation  ( alu_control ),
        .i_operator_a ( reg_data_a  ),
        .i_operator_b ( reg_data_b  ),
        .i_carry_flag ( 1'b0 ),
        .o_result     ( alu_data    ),
        .o_carry_flag (),
        .o_zero_flag  ()
    );

endmodule