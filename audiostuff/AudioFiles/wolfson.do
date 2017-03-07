# Set this flag to compile the Altera simulation libraries.
set COMPILE_LIBS 0
# Set the path to the simulation models for the basic Altera elements.
set qpath "C:/altera/14.0/quartus/eda/sim_lib"
# Point to DSP Builder install path off of qpath
set base_dir "$qpath/../../dspba/Libraries/vhdl"
#
# Create work library
#
vlib work
#
# Compile Altera primitive libraries
#
if {$COMPILE_LIBS} {
vlog $qpath/altera_mf.v
vlog $qpath/altera_primitives.v
vlog $qpath/altera_lnsim.sv
vlog $qpath/220model.v
vlib lpm
vmap lpm lpm
vcom -work lpm $qpath/220pack.vhd
vcom -work lpm $qpath/220model.vhd
vlib altera_mf
vmap altera_mf altera_mf
vcom -work altera_mf $qpath/altera_mf_components.vhd
vcom -work altera_mf $qpath/altera_mf.vhd
#vcom ${base_dir}/base/dspba_library_package.vhd
#vcom ${base_dir}/base/dspba_library.vhd
#vcom -quiet -93 ${base_dir}/fpc/hcc_package.vhd
#vcom -quiet -93 ${base_dir}/fpc/math_package.vhd
#vcom -quiet -93 ${base_dir}/fpc/hcc_implementation.vhd
#vcom -quiet -93 ${base_dir}/fpc/math_implementation.vhd
#vcom -quiet -93 ${base_dir}/fpc/fpc_library_package.vhd
#vcom -quiet -93 ${base_dir}/fpc/fpc_library.vhd
}
#
# Compile Verilog
#
#
# Global Units
#
set BLA 0
if {$BLA} {
vlog "../../../AlteraDesign/LZMAdefines.sv" +incdir+../../../AlteraDesign
}


# Compile Verilog
#     All Verilog files that are part of this design should have
#     their own "vlog" line below.
vlog "./wolfson.v"
vlog "./example.sv"
vlog "./starterkit/xck_generator.v"
vlog "./starterkit/xck_generator/xck_generator_0002.v"
vlog "./starterkit/Altera_UP_Audio_Bit_Counter.v"
vlog "./starterkit/Altera_UP_Audio_In_Deserializer.v"
vlog "./starterkit/Altera_UP_Audio_Out_Serializer.v"
vlog "./starterkit/Altera_UP_Clock_Edge.v"
vlog "./starterkit/Altera_UP_I2C.v"
vlog "./starterkit/Altera_UP_I2C_AV_Auto_Initialize.v"
vlog "./starterkit/Altera_UP_I2C_DC_Auto_Initialize.v"
vlog "./starterkit/Altera_UP_I2C_LCM_Auto_Initialize.v"
vlog "./starterkit/Altera_UP_Slow_Clock_Generator.v"
vlog "./starterkit/Altera_UP_SYNC_FIFO.v"
vlog "./starterkit/audio_and_video_config.v"
vlog "./starterkit/audio_codec.v"
vlog "./starterkit/audio_driver.sv"

# Call vsim to invoke simulator
#     Make sure the last item on the line is the name of the
#     testbench module you want to execute.
vsim -voptargs="+acc" -t 1ps -lib work wolfson_testbench

# Source the wave do file
#     This should be the file that sets up the signal window for
#     the module you are testing.
do wolfson_wave.do

# Set the window types
view wave
view structure
view signals

# Run the simulation
run -all

# End
