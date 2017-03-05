onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /transferCenterTest/dut/clk
add wave -noupdate /transferCenterTest/dut/rst
add wave -noupdate -expand -group Old /transferCenterTest/dut/localScannerOut
add wave -noupdate -expand -group Old /transferCenterTest/dut/readyForTransferIn
add wave -noupdate -expand -group Old /transferCenterTest/dut/readyForTransferOut
add wave -noupdate -expand -group Old /transferCenterTest/dut/dataIn
add wave -noupdate /transferCenterTest/dut/dataBuffer
add wave -noupdate /transferCenterTest/dut/bitCounter
add wave -noupdate /transferCenterTest/dut/shiftReg
add wave -noupdate /transferCenterTest/dataBuffer
add wave -noupdate /transferCenterTest/localScannerOut
add wave -noupdate /transferCenterTest/commandBuffer
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {110 ps} 0}
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
WaveRestoreZoom {0 ps} {346 ps}
