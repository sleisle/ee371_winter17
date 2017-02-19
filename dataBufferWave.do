onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /dataBufferTestBench/clk
add wave -noupdate /dataBufferTestBench/rst
add wave -noupdate -childformat {{{/dataBufferTestBench/dut/buffer[9]} -radix decimal} {{/dataBufferTestBench/dut/buffer[8]} -radix decimal} {{/dataBufferTestBench/dut/buffer[7]} -radix decimal} {{/dataBufferTestBench/dut/buffer[6]} -radix decimal} {{/dataBufferTestBench/dut/buffer[5]} -radix decimal} {{/dataBufferTestBench/dut/buffer[4]} -radix decimal} {{/dataBufferTestBench/dut/buffer[3]} -radix decimal} {{/dataBufferTestBench/dut/buffer[2]} -radix decimal} {{/dataBufferTestBench/dut/buffer[1]} -radix decimal} {{/dataBufferTestBench/dut/buffer[0]} -radix decimal}} -expand -subitemconfig {{/dataBufferTestBench/dut/buffer[9]} {-radix decimal} {/dataBufferTestBench/dut/buffer[8]} {-radix decimal} {/dataBufferTestBench/dut/buffer[7]} {-radix decimal} {/dataBufferTestBench/dut/buffer[6]} {-radix decimal} {/dataBufferTestBench/dut/buffer[5]} {-radix decimal} {/dataBufferTestBench/dut/buffer[4]} {-radix decimal} {/dataBufferTestBench/dut/buffer[3]} {-radix decimal} {/dataBufferTestBench/dut/buffer[2]} {-radix decimal} {/dataBufferTestBench/dut/buffer[1]} {-radix decimal} {/dataBufferTestBench/dut/buffer[0]} {-radix decimal}} /dataBufferTestBench/dut/buffer
add wave -noupdate -radix decimal /dataBufferTestBench/dataOut
add wave -noupdate /dataBufferTestBench/writeEnable
add wave -noupdate -radix unsigned /dataBufferTestBench/addressWrite
add wave -noupdate -radix unsigned /dataBufferTestBench/addressRead
add wave -noupdate -radix decimal /dataBufferTestBench/dataIn
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {65 ps} 0}
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
WaveRestoreZoom {0 ps} {150 ps}
