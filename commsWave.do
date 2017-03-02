onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /commsTestBench/dut/clk
add wave -noupdate /commsTestBench/dut/rst
add wave -noupdate /commsTestBench/dut/readyForSend
add wave -noupdate /commsTestBench/dut/readyForReceive
add wave -noupdate /commsTestBench/dut/startTransfer
add wave -noupdate /commsTestBench/dut/transfer
add wave -noupdate /commsTestBench/dut/dataIn
add wave -noupdate /commsTestBench/dut/clkIn
add wave -noupdate /commsTestBench/dut/dataOut
add wave -noupdate /commsTestBench/dut/clkOut
add wave -noupdate /commsTestBench/dut/dataBitCounter
add wave -noupdate /commsTestBench/dut/sendBuffer
add wave -noupdate /commsTestBench/dut/dataInCounter
add wave -noupdate -expand /commsTestBench/dut/receiveBuffer
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {30 ps} 0}
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
