library verilog;
use verilog.vl_types.all;
entity lab3TopLevelTest is
    generic(
        ClockDelay      : integer := 10
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ClockDelay : constant is 1;
end lab3TopLevelTest;
