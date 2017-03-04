library verilog;
use verilog.vl_types.all;
entity commsTestBench is
    generic(
        ClockDelay      : integer := 5
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ClockDelay : constant is 1;
end commsTestBench;
