transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {Dosificador-Tintometrico.vo}

vlog -vlog01compat -work work +incdir+C:/Users/User/Desktop/Proyecto-Final-TD1/Quartus/simulation/modelsim {C:/Users/User/Desktop/Proyecto-Final-TD1/Quartus/simulation/modelsim/Filtro_Rebote_tb.v}

vsim -t 1ps +transport_int_delays +transport_path_delays -L cycloneii_ver -L gate_work -L work -voptargs="+acc"  Filtro_Rebote_tb

add wave *
view structure
view signals
run -all
