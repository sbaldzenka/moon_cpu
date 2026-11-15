-- project     : moon_cpu
-- version     : 1.0
-- data        : 04.11.2026
-- author      : siarhei baldzenka
-- e-mail      : sbaldzenka@proton.me
-- description : .do-file with .hdl-files list for questasim/modelsim

vlib work
vmap work work

vlog ../tb/moon_cpu_tb_param.vh
vlog ../tb/moon_cpu_tb.v

vlog ../src/periph/sp_bram/sp_bram_verilog/hdl/sp_bram.v

vlog ../src/cpu/moon_cpu.v
vlog ../src/cpu/pc.v
vlog ../src/cpu/controller.v
vlog ../src/cpu/data_mux.v
vlog ../src/cpu/register_file.v
vlog ../src/cpu/alu/alu_defs.vh
vlog ../src/cpu/alu/alu.v
vlog ../src/cpu/alu/arithmetic/adder.v
vlog ../src/cpu/alu/arithmetic/subtractor.v
vlog ../src/cpu/alu/arithmetic/comparator.v
vlog ../src/cpu/alu/arithmetic/incrementer.v
vlog ../src/cpu/alu/arithmetic/decrementer.v

vsim -t 1ps -voptargs=+acc=lprn -lib work -L work moon_cpu_tb

do wave_test.do 
view wave
run 100 us