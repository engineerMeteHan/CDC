@echo off
set xv_path=D:\\Xilinx_Vivado\\Vivado\\2016.1\\bin
call %xv_path%/xsim tb_cdc_flag_behav -key {Behavioral:sim_1:Functional:tb_cdc_flag} -tclbatch tb_cdc_flag.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
