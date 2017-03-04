library verilog;
use verilog.vl_types.all;
entity DFlipFlop is
    port(
        q               : out    vl_logic;
        qBar            : out    vl_logic;
        D               : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic
    );
end DFlipFlop;
