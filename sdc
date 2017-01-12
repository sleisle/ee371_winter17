#! /usr/local/Cellar/icarus-verilog/10.0/bin/vvp
:ivl_version "10.0 (stable)" "(v10_0)";
:ivl_delay_selection "TYPICAL";
:vpi_time_precision + 0;
:vpi_module "system";
:vpi_module "vhdl_sys";
:vpi_module "v2005_math";
:vpi_module "va_math";
S_0x7fa1c7e17ab0 .scope module, "SynchronousDownCounterTestBench" "SynchronousDownCounterTestBench" 2 5;
 .timescale 0 0;
v0x7fa1c7e25580_0 .net "clk", 0 0, v0x7fa1c7d00fb0_0;  1 drivers
v0x7fa1c7e25610_0 .net "out", 3 0, L_0x7fa1c7e27700;  1 drivers
v0x7fa1c7e256e0_0 .net "rst", 0 0, v0x7fa1c7e21e40_0;  1 drivers
S_0x7fa1c7d00ce0 .scope module, "aTester" "Tester" 2 11, 2 21 0, S_0x7fa1c7e17ab0;
 .timescale 0 0;
    .port_info 0 /OUTPUT 1 "clk"
    .port_info 1 /OUTPUT 1 "rst"
    .port_info 2 /INPUT 4 "out"
P_0x7fa1c7d00e40 .param/l "stimDelay" 0 2 26, +C4<00000000000000000000000000001010>;
v0x7fa1c7d00fb0_0 .var "clk", 0 0;
v0x7fa1c7e21ce0_0 .var/i "i", 31 0;
v0x7fa1c7e21da0_0 .net "out", 3 0, L_0x7fa1c7e27700;  alias, 1 drivers
v0x7fa1c7e21e40_0 .var "rst", 0 0;
S_0x7fa1c7e21f30 .scope module, "dut" "SynchronousDownCounter" 2 9, 3 8 0, S_0x7fa1c7e17ab0;
 .timescale 0 0;
    .port_info 0 /OUTPUT 4 "out"
    .port_info 1 /INPUT 1 "clk"
    .port_info 2 /INPUT 1 "rst"
L_0x7fa1c7e25a30 .functor XOR 1, L_0x7fa1c7e25810, L_0x7fa1c7e258d0, C4<0>, C4<0>;
L_0x7fa1c7e25b20 .functor NOT 1, L_0x7fa1c7e25a30, C4<0>, C4<0>, C4<0>;
L_0x7fa1c7e25de0 .functor OR 1, L_0x7fa1c7e25c70, L_0x7fa1c7e25d40, C4<0>, C4<0>;
L_0x7fa1c7e25f10 .functor AND 1, L_0x7fa1c7e25bd0, L_0x7fa1c7e25de0, C4<1>, C4<1>;
L_0x7fa1c7e26350 .functor AND 1, L_0x7fa1c7e26140, L_0x7fa1c7e261e0, C4<1>, C4<1>;
L_0x7fa1c7e26430 .functor AND 1, L_0x7fa1c7e26020, L_0x7fa1c7e26350, C4<1>, C4<1>;
L_0x7fa1c7e26520 .functor OR 1, L_0x7fa1c7e25f10, L_0x7fa1c7e26430, C4<0>, C4<0>;
L_0x7fa1c7e26af0 .functor OR 1, L_0x7fa1c7e269b0, L_0x7fa1c7e26a50, C4<0>, C4<0>;
L_0x7fa1c7e26c00 .functor OR 1, L_0x7fa1c7e26af0, L_0x7fa1c7e26b60, C4<0>, C4<0>;
L_0x7fa1c7e26d40 .functor AND 1, L_0x7fa1c7e267b0, L_0x7fa1c7e26c00, C4<1>, C4<1>;
L_0x7fa1c7e27080 .functor AND 1, L_0x7fa1c7e26e90, L_0x7fa1c7e26f30, C4<1>, C4<1>;
L_0x7fa1c7e27330 .functor AND 1, L_0x7fa1c7e27080, L_0x7fa1c7e27190, C4<1>, C4<1>;
L_0x7fa1c7e273a0 .functor AND 1, L_0x7fa1c7e26df0, L_0x7fa1c7e27330, C4<1>, C4<1>;
L_0x7fa1c7e27500 .functor OR 1, L_0x7fa1c7e26d40, L_0x7fa1c7e273a0, C4<0>, C4<0>;
v0x7fa1c7e23ae0_0 .net *"_s10", 0 0, L_0x7fa1c7e25a30;  1 drivers
v0x7fa1c7e23b70_0 .net *"_s12", 0 0, L_0x7fa1c7e25b20;  1 drivers
v0x7fa1c7e23c00_0 .net *"_s17", 0 0, L_0x7fa1c7e25bd0;  1 drivers
v0x7fa1c7e23ca0_0 .net *"_s19", 0 0, L_0x7fa1c7e25c70;  1 drivers
v0x7fa1c7e23d50_0 .net *"_s21", 0 0, L_0x7fa1c7e25d40;  1 drivers
v0x7fa1c7e23e40_0 .net *"_s22", 0 0, L_0x7fa1c7e25de0;  1 drivers
v0x7fa1c7e23ef0_0 .net *"_s24", 0 0, L_0x7fa1c7e25f10;  1 drivers
v0x7fa1c7e23fa0_0 .net *"_s27", 0 0, L_0x7fa1c7e26020;  1 drivers
v0x7fa1c7e24050_0 .net *"_s29", 0 0, L_0x7fa1c7e26140;  1 drivers
v0x7fa1c7e24160_0 .net *"_s3", 0 0, L_0x7fa1c7e25770;  1 drivers
v0x7fa1c7e24210_0 .net *"_s31", 0 0, L_0x7fa1c7e261e0;  1 drivers
v0x7fa1c7e242c0_0 .net *"_s32", 0 0, L_0x7fa1c7e26350;  1 drivers
v0x7fa1c7e24370_0 .net *"_s34", 0 0, L_0x7fa1c7e26430;  1 drivers
v0x7fa1c7e24420_0 .net *"_s36", 0 0, L_0x7fa1c7e26520;  1 drivers
v0x7fa1c7e244d0_0 .net *"_s42", 0 0, L_0x7fa1c7e267b0;  1 drivers
v0x7fa1c7e24580_0 .net *"_s44", 0 0, L_0x7fa1c7e269b0;  1 drivers
v0x7fa1c7e24630_0 .net *"_s46", 0 0, L_0x7fa1c7e26a50;  1 drivers
v0x7fa1c7e247c0_0 .net *"_s47", 0 0, L_0x7fa1c7e26af0;  1 drivers
v0x7fa1c7e24850_0 .net *"_s50", 0 0, L_0x7fa1c7e26b60;  1 drivers
v0x7fa1c7e24900_0 .net *"_s51", 0 0, L_0x7fa1c7e26c00;  1 drivers
v0x7fa1c7e249b0_0 .net *"_s53", 0 0, L_0x7fa1c7e26d40;  1 drivers
v0x7fa1c7e24a60_0 .net *"_s56", 0 0, L_0x7fa1c7e26df0;  1 drivers
v0x7fa1c7e24b10_0 .net *"_s58", 0 0, L_0x7fa1c7e26e90;  1 drivers
v0x7fa1c7e24bc0_0 .net *"_s60", 0 0, L_0x7fa1c7e26f30;  1 drivers
v0x7fa1c7e24c70_0 .net *"_s61", 0 0, L_0x7fa1c7e27080;  1 drivers
v0x7fa1c7e24d20_0 .net *"_s64", 0 0, L_0x7fa1c7e27190;  1 drivers
v0x7fa1c7e24dd0_0 .net *"_s65", 0 0, L_0x7fa1c7e27330;  1 drivers
v0x7fa1c7e24e80_0 .net *"_s67", 0 0, L_0x7fa1c7e273a0;  1 drivers
v0x7fa1c7e24f30_0 .net *"_s69", 0 0, L_0x7fa1c7e27500;  1 drivers
v0x7fa1c7e24fe0_0 .net *"_s7", 0 0, L_0x7fa1c7e25810;  1 drivers
v0x7fa1c7e25090_0 .net *"_s9", 0 0, L_0x7fa1c7e258d0;  1 drivers
v0x7fa1c7e25140_0 .net "clk", 0 0, v0x7fa1c7d00fb0_0;  alias, 1 drivers
v0x7fa1c7e251d0_0 .net "nVal", 3 0, L_0x7fa1c7e26650;  1 drivers
v0x7fa1c7e246e0_0 .net "out", 3 0, L_0x7fa1c7e27700;  alias, 1 drivers
v0x7fa1c7e25460_0 .net "qBar", 3 0, L_0x7fa1c7e27c60;  1 drivers
v0x7fa1c7e254f0_0 .net "rst", 0 0, v0x7fa1c7e21e40_0;  alias, 1 drivers
L_0x7fa1c7e25770 .part L_0x7fa1c7e27c60, 0, 1;
L_0x7fa1c7e25810 .part L_0x7fa1c7e27700, 0, 1;
L_0x7fa1c7e258d0 .part L_0x7fa1c7e27700, 1, 1;
L_0x7fa1c7e25bd0 .part L_0x7fa1c7e27700, 2, 1;
L_0x7fa1c7e25c70 .part L_0x7fa1c7e27700, 0, 1;
L_0x7fa1c7e25d40 .part L_0x7fa1c7e27700, 1, 1;
L_0x7fa1c7e26020 .part L_0x7fa1c7e27c60, 2, 1;
L_0x7fa1c7e26140 .part L_0x7fa1c7e27c60, 0, 1;
L_0x7fa1c7e261e0 .part L_0x7fa1c7e27c60, 1, 1;
L_0x7fa1c7e26650 .concat8 [ 1 1 1 1], L_0x7fa1c7e25770, L_0x7fa1c7e25b20, L_0x7fa1c7e26520, L_0x7fa1c7e27500;
L_0x7fa1c7e267b0 .part L_0x7fa1c7e27700, 3, 1;
L_0x7fa1c7e269b0 .part L_0x7fa1c7e27700, 0, 1;
L_0x7fa1c7e26a50 .part L_0x7fa1c7e27700, 1, 1;
L_0x7fa1c7e26b60 .part L_0x7fa1c7e27700, 2, 1;
L_0x7fa1c7e26df0 .part L_0x7fa1c7e27c60, 3, 1;
L_0x7fa1c7e26e90 .part L_0x7fa1c7e27c60, 0, 1;
L_0x7fa1c7e26f30 .part L_0x7fa1c7e27c60, 1, 1;
L_0x7fa1c7e27190 .part L_0x7fa1c7e27c60, 2, 1;
L_0x7fa1c7e27620 .part L_0x7fa1c7e26650, 0, 1;
L_0x7fa1c7e27810 .part L_0x7fa1c7e26650, 1, 1;
L_0x7fa1c7e278d0 .part L_0x7fa1c7e26650, 2, 1;
L_0x7fa1c7e27700 .concat8 [ 1 1 1 1], v0x7fa1c7e22590_0, v0x7fa1c7e22bc0_0, v0x7fa1c7e231c0_0, v0x7fa1c7e23830_0;
L_0x7fa1c7e27c60 .concat8 [ 1 1 1 1], L_0x7fa1c7e275b0, L_0x7fa1c7e277a0, L_0x7fa1c7e26ff0, L_0x7fa1c7e27ac0;
L_0x7fa1c7e27ec0 .part L_0x7fa1c7e26650, 3, 1;
S_0x7fa1c7e22160 .scope module, "qBar0" "DFlipFlop" 3 19, 4 1 0, S_0x7fa1c7e21f30;
 .timescale 0 0;
    .port_info 0 /OUTPUT 1 "q"
    .port_info 1 /OUTPUT 1 "qBar"
    .port_info 2 /INPUT 1 "D"
    .port_info 3 /INPUT 1 "clk"
    .port_info 4 /INPUT 1 "rst"
L_0x7fa1c7e275b0 .functor NOT 1, v0x7fa1c7e22590_0, C4<0>, C4<0>, C4<0>;
v0x7fa1c7e22420_0 .net "D", 0 0, L_0x7fa1c7e27620;  1 drivers
v0x7fa1c7e224d0_0 .net "clk", 0 0, v0x7fa1c7d00fb0_0;  alias, 1 drivers
v0x7fa1c7e22590_0 .var "q", 0 0;
v0x7fa1c7e22640_0 .net "qBar", 0 0, L_0x7fa1c7e275b0;  1 drivers
v0x7fa1c7e226d0_0 .net "rst", 0 0, v0x7fa1c7e21e40_0;  alias, 1 drivers
E_0x7fa1c7e223d0/0 .event negedge, v0x7fa1c7e21e40_0;
E_0x7fa1c7e223d0/1 .event posedge, v0x7fa1c7d00fb0_0;
E_0x7fa1c7e223d0 .event/or E_0x7fa1c7e223d0/0, E_0x7fa1c7e223d0/1;
S_0x7fa1c7e22800 .scope module, "qBar1" "DFlipFlop" 3 20, 4 1 0, S_0x7fa1c7e21f30;
 .timescale 0 0;
    .port_info 0 /OUTPUT 1 "q"
    .port_info 1 /OUTPUT 1 "qBar"
    .port_info 2 /INPUT 1 "D"
    .port_info 3 /INPUT 1 "clk"
    .port_info 4 /INPUT 1 "rst"
L_0x7fa1c7e277a0 .functor NOT 1, v0x7fa1c7e22bc0_0, C4<0>, C4<0>, C4<0>;
v0x7fa1c7e22a40_0 .net "D", 0 0, L_0x7fa1c7e27810;  1 drivers
v0x7fa1c7e22ae0_0 .net "clk", 0 0, v0x7fa1c7d00fb0_0;  alias, 1 drivers
v0x7fa1c7e22bc0_0 .var "q", 0 0;
v0x7fa1c7e22c50_0 .net "qBar", 0 0, L_0x7fa1c7e277a0;  1 drivers
v0x7fa1c7e22ce0_0 .net "rst", 0 0, v0x7fa1c7e21e40_0;  alias, 1 drivers
S_0x7fa1c7e22e50 .scope module, "qBar2" "DFlipFlop" 3 21, 4 1 0, S_0x7fa1c7e21f30;
 .timescale 0 0;
    .port_info 0 /OUTPUT 1 "q"
    .port_info 1 /OUTPUT 1 "qBar"
    .port_info 2 /INPUT 1 "D"
    .port_info 3 /INPUT 1 "clk"
    .port_info 4 /INPUT 1 "rst"
L_0x7fa1c7e26ff0 .functor NOT 1, v0x7fa1c7e231c0_0, C4<0>, C4<0>, C4<0>;
v0x7fa1c7e23080_0 .net "D", 0 0, L_0x7fa1c7e278d0;  1 drivers
v0x7fa1c7e23120_0 .net "clk", 0 0, v0x7fa1c7d00fb0_0;  alias, 1 drivers
v0x7fa1c7e231c0_0 .var "q", 0 0;
v0x7fa1c7e23270_0 .net "qBar", 0 0, L_0x7fa1c7e26ff0;  1 drivers
v0x7fa1c7e23300_0 .net "rst", 0 0, v0x7fa1c7e21e40_0;  alias, 1 drivers
S_0x7fa1c7e23450 .scope module, "qBar3" "DFlipFlop" 3 22, 4 1 0, S_0x7fa1c7e21f30;
 .timescale 0 0;
    .port_info 0 /OUTPUT 1 "q"
    .port_info 1 /OUTPUT 1 "qBar"
    .port_info 2 /INPUT 1 "D"
    .port_info 3 /INPUT 1 "clk"
    .port_info 4 /INPUT 1 "rst"
L_0x7fa1c7e27ac0 .functor NOT 1, v0x7fa1c7e23830_0, C4<0>, C4<0>, C4<0>;
v0x7fa1c7e23680_0 .net "D", 0 0, L_0x7fa1c7e27ec0;  1 drivers
v0x7fa1c7e23710_0 .net "clk", 0 0, v0x7fa1c7d00fb0_0;  alias, 1 drivers
v0x7fa1c7e23830_0 .var "q", 0 0;
v0x7fa1c7e238e0_0 .net "qBar", 0 0, L_0x7fa1c7e27ac0;  1 drivers
v0x7fa1c7e23970_0 .net "rst", 0 0, v0x7fa1c7e21e40_0;  alias, 1 drivers
    .scope S_0x7fa1c7e22160;
T_0 ;
    %wait E_0x7fa1c7e223d0;
    %load/vec4 v0x7fa1c7e226d0_0;
    %nor/r;
    %flag_set/vec4 8;
    %jmp/0xz  T_0.0, 8;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x7fa1c7e22590_0, 0, 1;
    %jmp T_0.1;
T_0.0 ;
    %load/vec4 v0x7fa1c7e22420_0;
    %store/vec4 v0x7fa1c7e22590_0, 0, 1;
T_0.1 ;
    %jmp T_0;
    .thread T_0;
    .scope S_0x7fa1c7e22800;
T_1 ;
    %wait E_0x7fa1c7e223d0;
    %load/vec4 v0x7fa1c7e22ce0_0;
    %nor/r;
    %flag_set/vec4 8;
    %jmp/0xz  T_1.0, 8;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x7fa1c7e22bc0_0, 0, 1;
    %jmp T_1.1;
T_1.0 ;
    %load/vec4 v0x7fa1c7e22a40_0;
    %store/vec4 v0x7fa1c7e22bc0_0, 0, 1;
T_1.1 ;
    %jmp T_1;
    .thread T_1;
    .scope S_0x7fa1c7e22e50;
T_2 ;
    %wait E_0x7fa1c7e223d0;
    %load/vec4 v0x7fa1c7e23300_0;
    %nor/r;
    %flag_set/vec4 8;
    %jmp/0xz  T_2.0, 8;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x7fa1c7e231c0_0, 0, 1;
    %jmp T_2.1;
T_2.0 ;
    %load/vec4 v0x7fa1c7e23080_0;
    %store/vec4 v0x7fa1c7e231c0_0, 0, 1;
T_2.1 ;
    %jmp T_2;
    .thread T_2;
    .scope S_0x7fa1c7e23450;
T_3 ;
    %wait E_0x7fa1c7e223d0;
    %load/vec4 v0x7fa1c7e23970_0;
    %nor/r;
    %flag_set/vec4 8;
    %jmp/0xz  T_3.0, 8;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x7fa1c7e23830_0, 0, 1;
    %jmp T_3.1;
T_3.0 ;
    %load/vec4 v0x7fa1c7e23680_0;
    %store/vec4 v0x7fa1c7e23830_0, 0, 1;
T_3.1 ;
    %jmp T_3;
    .thread T_3;
    .scope S_0x7fa1c7d00ce0;
T_4 ;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x7fa1c7d00fb0_0, 0, 1;
    %delay 10, 0;
    %delay 10, 0;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x7fa1c7e21e40_0, 0, 1;
    %delay 10, 0;
    %pushi/vec4 1, 0, 1;
    %store/vec4 v0x7fa1c7e21e40_0, 0, 1;
    %pushi/vec4 0, 0, 32;
    %store/vec4 v0x7fa1c7e21ce0_0, 0, 32;
T_4.0 ;
    %load/vec4 v0x7fa1c7e21ce0_0;
    %cmpi/s 36, 0, 32;
    %jmp/0xz T_4.1, 5;
    %delay 10, 0;
    %load/vec4 v0x7fa1c7e21ce0_0;
    %addi 1, 0, 32;
    %store/vec4 v0x7fa1c7e21ce0_0, 0, 32;
    %jmp T_4.0;
T_4.1 ;
    %delay 10, 0;
    %pushi/vec4 0, 0, 1;
    %store/vec4 v0x7fa1c7e21e40_0, 0, 1;
    %delay 10, 0;
    %delay 10, 0;
    %vpi_call 2 41 "$finish" {0 0 0};
    %end;
    .thread T_4;
    .scope S_0x7fa1c7d00ce0;
T_5 ;
    %delay 10, 0;
    %load/vec4 v0x7fa1c7d00fb0_0;
    %inv;
    %store/vec4 v0x7fa1c7d00fb0_0, 0, 1;
    %jmp T_5;
    .thread T_5;
    .scope S_0x7fa1c7e17ab0;
T_6 ;
    %vpi_call 2 16 "$dumpfile", "SynchronousDownCounter.vcd" {0 0 0};
    %vpi_call 2 17 "$dumpvars", 32'sb00000000000000000000000000000001, S_0x7fa1c7e21f30 {0 0 0};
    %end;
    .thread T_6;
# The file index is used to find the file name in the following table.
:file_names 5;
    "N/A";
    "<interactive>";
    "SynchronousDownCounterTestBench.v";
    "./SynchronousDownCounter.v";
    "./DFlipFlop.v";
