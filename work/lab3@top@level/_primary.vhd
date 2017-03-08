library verilog;
use verilog.vl_types.all;
entity lab3TopLevel is
    generic(
        whichClock      : integer := 23
    );
    port(
        CLOCK_50        : in     vl_logic;
        HEX0            : out    vl_logic_vector(6 downto 0);
        HEX1            : out    vl_logic_vector(6 downto 0);
        HEX2            : out    vl_logic_vector(6 downto 0);
        HEX3            : out    vl_logic_vector(6 downto 0);
        HEX4            : out    vl_logic_vector(6 downto 0);
        HEX5            : out    vl_logic_vector(6 downto 0);
        KEY             : in     vl_logic_vector(3 downto 0);
        LEDR            : out    vl_logic_vector(9 downto 0);
        SW              : in     vl_logic_vector(9 downto 0);
        GPIO_0          : inout  vl_logic_vector(31 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of whichClock : constant is 1;
end lab3TopLevel;
