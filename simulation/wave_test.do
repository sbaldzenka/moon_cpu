-- project     : moon_cpu
-- version     : 1.0
-- data        : 04.11.2026
-- author      : siarhei baldzenka
-- e-mail      : sbaldzenka@proton.me
-- description : .do-file with waves list for questasim/modelsim

-- waves
add wave -noupdate -divider testbench
add wave -noupdate -format Logic -radix HEXADECIMAL -group {testbench} /moon_cpu_tb/*

add wave -noupdate -divider dut
add wave -noupdate -format Logic -radix HEXADECIMAL -group {moon_cpu_top} /moon_cpu_tb/dut_inst/*

-- toggle leaf names command
config wave -signalnamewidth 1