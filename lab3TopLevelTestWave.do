onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group Lab3 /lab3TopLevelTest/dut/CLOCK_50
add wave -noupdate -expand -group Lab3 /lab3TopLevelTest/dut/rst
add wave -noupdate -expand -group Lab3 /lab3TopLevelTest/dut/dataBufferScanner
add wave -noupdate -expand -group Lab3 /lab3TopLevelTest/dut/dataBufferTransfer
add wave -noupdate -expand -group Scanner /lab3TopLevelTest/dut/localScanner/clk
add wave -noupdate -expand -group Scanner /lab3TopLevelTest/dut/localScanner/localTransferInput
add wave -noupdate -expand -group Scanner /lab3TopLevelTest/dut/localScanner/ps
add wave -noupdate -expand -group Scanner /lab3TopLevelTest/dut/localScanner/dataOut
add wave -noupdate -expand -group Scanner /lab3TopLevelTest/dut/localScanner/clkOut
add wave -noupdate -expand -group Scanner /lab3TopLevelTest/dut/localScanner/dataBuffer
add wave -noupdate -expand -group Scanner /lab3TopLevelTest/dut/localScanner/outputBuffer
add wave -noupdate -expand -group Scanner /lab3TopLevelTest/dut/localScanner/readyForTransferIn
add wave -noupdate -expand -group {Transfer Center} /lab3TopLevelTest/dut/localTransfer/clk
add wave -noupdate -expand -group {Transfer Center} /lab3TopLevelTest/dut/localTransfer/dataIn
add wave -noupdate -expand -group {Transfer Center} /lab3TopLevelTest/dut/localTransfer/dataBuffer
add wave -noupdate -expand -group {Transfer Center} /lab3TopLevelTest/dut/localTransfer/byteIn
add wave -noupdate -expand -group {Transfer Center} /lab3TopLevelTest/dut/localTransfer/readData
add wave -noupdate /lab3TopLevelTest/dut/localTransfer/readyForTransferOut
add wave -noupdate /lab3TopLevelTest/dut/localTransfer/byteCounter
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {820 ps} 0}
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
WaveRestoreZoom {555 ps} {1025 ps}
