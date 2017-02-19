onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /scannerTestBench/dut/clk
add wave -noupdate /scannerTestBench/dut/rst
add wave -noupdate /scannerTestBench/dut/processerIn
add wave -noupdate /scannerTestBench/dut/processerOut
add wave -noupdate /scannerTestBench/dut/clkOut
add wave -noupdate /scannerTestBench/dut/dataOutWire
add wave -noupdate -radix unsigned /scannerTestBench/dut/dataBitCounter
add wave -noupdate -radix unsigned /scannerTestBench/dut/ps
add wave -noupdate -radix unsigned /scannerTestBench/dut/ns
add wave -noupdate /scannerTestBench/dut/writeEnable
add wave -noupdate -radix unsigned /scannerTestBench/dut/addressWrite
add wave -noupdate -radix unsigned /scannerTestBench/dut/addressRead
add wave -noupdate -radix unsigned /scannerTestBench/dut/dataOut
add wave -noupdate -radix unsigned /scannerTestBench/dut/dataIn
add wave -noupdate -radix unsigned /scannerTestBench/dut/scanningCounter
add wave -noupdate -radix unsigned /scannerTestBench/dut/buffer/buffer
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ps} {478 ps}
