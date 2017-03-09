	component nios_system_checkersv4 is
		port (
			clk_clk             : in  std_logic                     := 'X';             -- clk
			reset_reset_n       : in  std_logic                     := 'X';             -- reset_n
			sendstate_export    : out std_logic_vector(7 downto 0);                     -- export
			receivestate_export : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- export
			newdata_export      : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- export
			row8out_export      : out std_logic_vector(31 downto 0);                    -- export
			row7out_export      : out std_logic_vector(31 downto 0);                    -- export
			row6out_export      : out std_logic_vector(31 downto 0);                    -- export
			row5out_export      : out std_logic_vector(31 downto 0);                    -- export
			row4out_export      : out std_logic_vector(31 downto 0);                    -- export
			row3out_export      : out std_logic_vector(31 downto 0);                    -- export
			row2out_export      : out std_logic_vector(31 downto 0);                    -- export
			row1out_export      : out std_logic_vector(31 downto 0);                    -- export
			row8in_export       : in  std_logic_vector(31 downto 0) := (others => 'X'); -- export
			row7in_export       : in  std_logic_vector(31 downto 0) := (others => 'X'); -- export
			row6in_export       : in  std_logic_vector(31 downto 0) := (others => 'X'); -- export
			row5in_export       : in  std_logic_vector(31 downto 0) := (others => 'X'); -- export
			row4in_export       : in  std_logic_vector(31 downto 0) := (others => 'X'); -- export
			row3in_export       : in  std_logic_vector(31 downto 0) := (others => 'X'); -- export
			row2in_export       : in  std_logic_vector(31 downto 0) := (others => 'X'); -- export
			row1in_export       : in  std_logic_vector(31 downto 0) := (others => 'X')  -- export
		);
	end component nios_system_checkersv4;

	u0 : component nios_system_checkersv4
		port map (
			clk_clk             => CONNECTED_TO_clk_clk,             --          clk.clk
			reset_reset_n       => CONNECTED_TO_reset_reset_n,       --        reset.reset_n
			sendstate_export    => CONNECTED_TO_sendstate_export,    --    sendstate.export
			receivestate_export => CONNECTED_TO_receivestate_export, -- receivestate.export
			newdata_export      => CONNECTED_TO_newdata_export,      --      newdata.export
			row8out_export      => CONNECTED_TO_row8out_export,      --      row8out.export
			row7out_export      => CONNECTED_TO_row7out_export,      --      row7out.export
			row6out_export      => CONNECTED_TO_row6out_export,      --      row6out.export
			row5out_export      => CONNECTED_TO_row5out_export,      --      row5out.export
			row4out_export      => CONNECTED_TO_row4out_export,      --      row4out.export
			row3out_export      => CONNECTED_TO_row3out_export,      --      row3out.export
			row2out_export      => CONNECTED_TO_row2out_export,      --      row2out.export
			row1out_export      => CONNECTED_TO_row1out_export,      --      row1out.export
			row8in_export       => CONNECTED_TO_row8in_export,       --       row8in.export
			row7in_export       => CONNECTED_TO_row7in_export,       --       row7in.export
			row6in_export       => CONNECTED_TO_row6in_export,       --       row6in.export
			row5in_export       => CONNECTED_TO_row5in_export,       --       row5in.export
			row4in_export       => CONNECTED_TO_row4in_export,       --       row4in.export
			row3in_export       => CONNECTED_TO_row3in_export,       --       row3in.export
			row2in_export       => CONNECTED_TO_row2in_export,       --       row2in.export
			row1in_export       => CONNECTED_TO_row1in_export        --       row1in.export
		);

