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

vlog ../src/cpu/moon_cpu.v

vsim -t 1ps -voptargs=+acc=lprn -lib work -L work moon_cpu_tb

do wave_test.do 
view wave
run 100 us