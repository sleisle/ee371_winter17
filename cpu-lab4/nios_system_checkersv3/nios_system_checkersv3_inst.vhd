	component nios_system_checkersv3 is
		port (
			clk_clk             : in  std_logic                     := 'X';             -- clk
			newdata_export      : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- export
			receivestate_export : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- export
			reset_reset_n       : in  std_logic                     := 'X';             -- reset_n
			row1_in_port        : in  std_logic_vector(31 downto 0) := (others => 'X'); -- in_port
			row1_out_port       : out std_logic_vector(31 downto 0);                    -- out_port
			row2_in_port        : in  std_logic_vector(31 downto 0) := (others => 'X'); -- in_port
			row2_out_port       : out std_logic_vector(31 downto 0);                    -- out_port
			row3_in_port        : in  std_logic_vector(31 downto 0) := (others => 'X'); -- in_port
			row3_out_port       : out std_logic_vector(31 downto 0);                    -- out_port
			row4_in_port        : in  std_logic_vector(31 downto 0) := (others => 'X'); -- in_port
			row4_out_port       : out std_logic_vector(31 downto 0);                    -- out_port
			row5_in_port        : in  std_logic_vector(31 downto 0) := (others => 'X'); -- in_port
			row5_out_port       : out std_logic_vector(31 downto 0);                    -- out_port
			row6_in_port        : in  std_logic_vector(31 downto 0) := (others => 'X'); -- in_port
			row6_out_port       : out std_logic_vector(31 downto 0);                    -- out_port
			row7_in_port        : in  std_logic_vector(31 downto 0) := (others => 'X'); -- in_port
			row7_out_port       : out std_logic_vector(31 downto 0);                    -- out_port
			row8_in_port        : in  std_logic_vector(31 downto 0) := (others => 'X'); -- in_port
			row8_out_port       : out std_logic_vector(31 downto 0);                    -- out_port
			sendstate_export    : out std_logic_vector(7 downto 0)                      -- export
		);
	end component nios_system_checkersv3;

	u0 : component nios_system_checkersv3
		port map (
			clk_clk             => CONNECTED_TO_clk_clk,             --          clk.clk
			newdata_export      => CONNECTED_TO_newdata_export,      --      newdata.export
			receivestate_export => CONNECTED_TO_receivestate_export, -- receivestate.export
			reset_reset_n       => CONNECTED_TO_reset_reset_n,       --        reset.reset_n
			row1_in_port        => CONNECTED_TO_row1_in_port,        --         row1.in_port
			row1_out_port       => CONNECTED_TO_row1_out_port,       --             .out_port
			row2_in_port        => CONNECTED_TO_row2_in_port,        --         row2.in_port
			row2_out_port       => CONNECTED_TO_row2_out_port,       --             .out_port
			row3_in_port        => CONNECTED_TO_row3_in_port,        --         row3.in_port
			row3_out_port       => CONNECTED_TO_row3_out_port,       --             .out_port
			row4_in_port        => CONNECTED_TO_row4_in_port,        --         row4.in_port
			row4_out_port       => CONNECTED_TO_row4_out_port,       --             .out_port
			row5_in_port        => CONNECTED_TO_row5_in_port,        --         row5.in_port
			row5_out_port       => CONNECTED_TO_row5_out_port,       --             .out_port
			row6_in_port        => CONNECTED_TO_row6_in_port,        --         row6.in_port
			row6_out_port       => CONNECTED_TO_row6_out_port,       --             .out_port
			row7_in_port        => CONNECTED_TO_row7_in_port,        --         row7.in_port
			row7_out_port       => CONNECTED_TO_row7_out_port,       --             .out_port
			row8_in_port        => CONNECTED_TO_row8_in_port,        --         row8.in_port
			row8_out_port       => CONNECTED_TO_row8_out_port,       --             .out_port
			sendstate_export    => CONNECTED_TO_sendstate_export     --    sendstate.export
		);

