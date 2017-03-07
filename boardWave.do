onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /boardTestBench/dut/boardBuffer
add wave -noupdate -radix unsigned /boardTestBench/dut/x
add wave -noupdate -radix unsigned /boardTestBench/dut/y
add wave -noupdate -radix unsigned /boardTestBench/dut/r
add wave -noupdate -radix unsigned /boardTestBench/dut/g
add wave -noupdate -radix unsigned /boardTestBench/dut/b
add wave -noupdate -radix hexadecimal -radixenum numeric /boardTestBench/dut/color
add wave -noupdate -radix unsigned /boardTestBench/dut/xBoard
add wave -noupdate -radix unsigned /boardTestBench/dut/yBoard
add wave -noupdate /boardTestBench/dut/drawWhite
add wave -noupdate -radix unsigned /boardTestBench/dut/bufferStartPoint
add wave -noupdate -radix unsigned /boardTestBench/dut/xAdjusted
add wave -noupdate -radix unsigned /boardTestBench/dut/yAdjusted
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 83
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {105 ps}
