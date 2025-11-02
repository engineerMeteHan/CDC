@echo off
set xv_path=D:\\Xilinx_Vivado\\Vivado\\2016.1\\bin
call %xv_path%/xelab  -wto 7ed3e1c6053349a3a8715dbbc5f98464 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot tb_cdc_flag_behav xil_defaultlib.tb_cdc_flag -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
