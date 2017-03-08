library verilog;
use verilog.vl_types.all;
entity boardTestBench is
    generic(
        d               : integer := 10
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of d : constant is 1;
end boardTestBench;
