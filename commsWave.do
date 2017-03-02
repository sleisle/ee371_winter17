onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /commsTestBench/clk
add wave -noupdate /commsTestBench/rst
add wave -noupdate /commsTestBench/dataIn
add wave -noupdate /commsTestBench/clkIn
add wave -noupdate /commsTestBench/readyToTransferIn
add wave -noupdate /commsTestBench/startTransfer
add wave -noupdate /commsTestBench/dataOut
add wave -noupdate /commsTestBench/readyToTransferOut
add wave -noupdate /commsTestBench/clkOut
add wave -noupdate /commsTestBench/dut/transfer
add wave -noupdate /commsTestBench/dut/dataBitCounter
add wave -noupdate /commsTestBench/receiveBuffer
add wave -noupdate /commsTestBench/sendBuffer
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {7 ps} 0}
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
WaveRestoreZoom {0 ps} {1 ns}
