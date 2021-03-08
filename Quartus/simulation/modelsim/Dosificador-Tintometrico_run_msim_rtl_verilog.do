transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/User/Desktop/Proyecto-Final-TD1/Quartus {C:/Users/User/Desktop/Proyecto-Final-TD1/Quartus/Top.v}
vlog -vlog01compat -work work +incdir+C:/Users/User/Desktop/Proyecto-Final-TD1/Quartus {C:/Users/User/Desktop/Proyecto-Final-TD1/Quartus/BCD_7segmentos.v}
vlog -vlog01compat -work work +incdir+C:/Users/User/Desktop/Proyecto-Final-TD1/Quartus {C:/Users/User/Desktop/Proyecto-Final-TD1/Quartus/Drv_display.v}
vlog -vlog01compat -work work +incdir+C:/Users/User/Desktop/Proyecto-Final-TD1/Quartus {C:/Users/User/Desktop/Proyecto-Final-TD1/Quartus/Driver_teclado.v}
vlog -vlog01compat -work work +incdir+C:/Users/User/Desktop/Proyecto-Final-TD1/Quartus {C:/Users/User/Desktop/Proyecto-Final-TD1/Quartus/FSM.v}
vlog -vlog01compat -work work +incdir+C:/Users/User/Desktop/Proyecto-Final-TD1/Quartus {C:/Users/User/Desktop/Proyecto-Final-TD1/Quartus/Memoria_RGB.v}
vlog -vlog01compat -work work +incdir+C:/Users/User/Desktop/Proyecto-Final-TD1/Quartus {C:/Users/User/Desktop/Proyecto-Final-TD1/Quartus/Temporizador.v}

vlog -vlog01compat -work work +incdir+C:/Users/User/Desktop/Proyecto-Final-TD1/Quartus/simulation/modelsim {C:/Users/User/Desktop/Proyecto-Final-TD1/Quartus/simulation/modelsim/Drv_display_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneii_ver -L rtl_work -L work -voptargs="+acc"  Drv_display_tb

add wave *
view structure
view signals
run -all
