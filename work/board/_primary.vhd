library verilog;
use verilog.vl_types.all;
entity board is
    generic(
        WHITE           : integer := 16777215;
        BLACK           : vl_logic_vector(0 to 23) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        RED             : integer := 16711680;
        GREEN           : integer := 65280
    );
    port(
        boardBuffer     : in     vl_logic_vector(255 downto 0);
        x               : in     vl_logic_vector(9 downto 0);
        y               : in     vl_logic_vector(8 downto 0);
        r               : out    vl_logic_vector(7 downto 0);
        g               : out    vl_logic_vector(7 downto 0);
        b               : out    vl_logic_vector(7 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WHITE : constant is 1;
    attribute mti_svvh_generic_type of BLACK : constant is 1;
    attribute mti_svvh_generic_type of RED : constant is 1;
    attribute mti_svvh_generic_type of GREEN : constant is 1;
end board;
