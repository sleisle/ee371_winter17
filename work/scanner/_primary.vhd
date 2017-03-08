library verilog;
use verilog.vl_types.all;
entity scanner is
    generic(
        IDLE            : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        ACTIVE          : vl_logic_vector(0 to 1) := (Hi0, Hi1);
        STANDBY         : vl_logic_vector(0 to 1) := (Hi1, Hi0);
        TRANSFER        : vl_logic_vector(0 to 1) := (Hi1, Hi1)
    );
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        readyForTransferIn: in     vl_logic;
        localTransferInput: in     vl_logic_vector(1 downto 0);
        clkOut          : out    vl_logic;
        dataOut         : out    vl_logic;
        dataBuffer      : out    vl_logic_vector(3 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of IDLE : constant is 1;
    attribute mti_svvh_generic_type of ACTIVE : constant is 1;
    attribute mti_svvh_generic_type of STANDBY : constant is 1;
    attribute mti_svvh_generic_type of TRANSFER : constant is 1;
end scanner;
