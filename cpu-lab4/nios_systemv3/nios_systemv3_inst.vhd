	component nios_systemv3 is
		port (
			clk_clk                : in  std_logic                    := 'X';             -- clk
			readytotransfer_export : out std_logic_vector(7 downto 0);                    -- export
			reset_reset_n          : in  std_logic                    := 'X';             -- reset_n
			startscanning_export   : out std_logic_vector(7 downto 0);                    -- export
			transfer_export        : in  std_logic_vector(7 downto 0) := (others => 'X')  -- export
		);
	end component nios_systemv3;

	u0 : component nios_systemv3
		port map (
			clk_clk                => CONNECTED_TO_clk_clk,                --             clk.clk
			readytotransfer_export => CONNECTED_TO_readytotransfer_export, -- readytotransfer.export
			reset_reset_n          => CONNECTED_TO_reset_reset_n,          --           reset.reset_n
			startscanning_export   => CONNECTED_TO_startscanning_export,   --   startscanning.export
			transfer_export        => CONNECTED_TO_transfer_export         --        transfer.export
		);

