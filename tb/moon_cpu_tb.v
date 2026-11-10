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
description : testbench file

---------------------------------------------------------------------------------------
*/

`timescale 1ns/100ps


`include "moon_cpu_tb_param.vh"

module moon_cpu_tb
#(
    parameter PERIOD_CLK      = `PERIOD_CLK,
    parameter MEM_ADDR_WIDTH  = `MEM_SIZE,
    parameter MEM_DATA_WIDTH  = `MEM_WIDTH
);

    reg                       system_clk;
    reg                       system_resetn;

    wire                      mem_we;
    wire [MEM_ADDR_WIDTH-1:0] mem_addr;
    wire [MEM_DATA_WIDTH-1:0] mem_data_in;
    wire [MEM_DATA_WIDTH-1:0] mem_data_out;

    initial begin
        #0   system_clk    = 1'b0;
             system_resetn = 1'b0;
        #200 system_resetn = 1'b1;
    end

    always #(PERIOD_CLK / 2) system_clk = ~system_clk;

    moon_cpu dut_inst
    (
        .i_clk      ( system_clk    ),
        .i_resetn   ( system_resetn ),
        .o_mem_we   ( mem_we        ),
        .o_mem_addr ( mem_addr      ),
        .o_mem_data ( mem_data_out  ),
        .i_mem_data ( mem_data_in   )
    );

    defparam instruction_mem_inst.ADDR_WIDTH = MEM_ADDR_WIDTH;
    defparam instruction_mem_inst.DATA_WIDTH = MEM_DATA_WIDTH;
    defparam instruction_mem_inst.MEM_FILE   = ""; //"path_to_mem_file/file.mem"

    sp_bram instruction_mem_inst
    (
        .i_clk  ( system_clk   ),
        .i_we   ( mem_we       ),
        .i_addr ( mem_addr     ),
        .i_data ( mem_data_out ),
        .o_data ( mem_data_in  )
    );

endmodule