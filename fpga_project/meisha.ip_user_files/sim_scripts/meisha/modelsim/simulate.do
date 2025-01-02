onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L xil_defaultlib -L xpm -L util_ds_buf_v2_01_a -L lib_cdc_v1_0_2 -L proc_sys_reset_v5_0_10 -L util_vector_logic_v2_0 -L axi_infrastructure_v1_1_0 -L fifo_generator_v13_1_3 -L axi_clock_converter_v2_1_10 -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.meisha xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {meisha.udo}

run -all

quit -force
