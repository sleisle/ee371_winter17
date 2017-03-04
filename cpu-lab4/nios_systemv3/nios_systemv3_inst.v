	nios_systemv3 u0 (
		.clk_clk                (<connected-to-clk_clk>),                //             clk.clk
		.readytotransfer_export (<connected-to-readytotransfer_export>), // readytotransfer.export
		.reset_reset_n          (<connected-to-reset_reset_n>),          //           reset.reset_n
		.startscanning_export   (<connected-to-startscanning_export>),   //   startscanning.export
		.transfer_export        (<connected-to-transfer_export>)         //        transfer.export
	);

