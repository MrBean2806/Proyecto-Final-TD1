onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label Filas /Top_tb/fila
add wave -noupdate -label Motores /Top_tb/Motores
add wave -noupdate -label Segmentos /Top_tb/segmentos
add wave -noupdate -label Columnas /Top_tb/col
add wave -noupdate -label Enter /Top_tb/enter
add wave -noupdate -label Clock /Top_tb/clk
add wave -noupdate -label Enable /Top_tb/enable
add wave -noupdate -label Reset /Top_tb/reset
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5699160 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {309446 ps}
