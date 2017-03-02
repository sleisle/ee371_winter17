onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /scannerTest/dut/clk
add wave -noupdate /scannerTest/rst
add wave -noupdate /scannerTest/dut/slowClk
add wave -noupdate /scannerTest/dut/ps
add wave -noupdate /scannerTest/dut/dataOut
add wave -noupdate /scannerTest/dut/setOutClk
add wave -noupdate /scannerTest/dut/clkOut
add wave -noupdate /scannerTest/dut/localTransferInput
add wave -noupdate /scannerTest/dut/dataBuffer
add wave -noupdate /scannerTest/dut/dataBitCounter
add wave -noupdate /scannerTest/dut/outputBuffer
add wave -noupdate /scannerTest/dut/outputDataBuffer
add wave -noupdate /scannerTest/dut/readyToOutput
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {137 ps} 0}
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
WaveRestoreZoom {0 ps} {864 ps}
