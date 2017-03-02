library verilog;
use verilog.vl_types.all;
entity comms is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        clkIn           : in     vl_logic;
        dataIn          : in     vl_logic;
        clkOut          : out    vl_logic;
        dataOut         : out    vl_logic;
        readyToTransferIn: in     vl_logic;
        readyToTransferOut: out    vl_logic;
        sendBuffer      : in     vl_logic_vector(255 downto 0);
        receiveBuffer   : in     vl_logic_vector(255 downto 0);
        startTransfer   : in     vl_logic
    );
end comms;
