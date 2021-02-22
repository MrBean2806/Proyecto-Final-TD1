transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {Dosificador-Tintometrico.vo}

vlog -vlog01compat -work work +incdir+C:/Users/facun/Desktop/Proyecto-Final-TD1/Quartus/simulation/modelsim {C:/Users/facun/Desktop/Proyecto-Final-TD1/Quartus/simulation/modelsim/Drv_display_tb.v}

vsim -t 1ps +transport_int_delays +transport_path_delays -L cycloneii_ver -L gate_work -L work -voptargs="+acc"  Drv_display_tb

add wave *
view structure
view signals
run -all
