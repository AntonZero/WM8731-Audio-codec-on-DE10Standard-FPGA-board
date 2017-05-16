	pll u0 (
		.clk_clk                           (<connected-to-clk_clk>),                           //                     clk.clk
		.clock_12_clk                      (<connected-to-clock_12_clk>),                      //                clock_12.clk
		.onchip_memory2_0_reset1_reset     (<connected-to-onchip_memory2_0_reset1_reset>),     // onchip_memory2_0_reset1.reset
		.onchip_memory2_0_reset1_reset_req (<connected-to-onchip_memory2_0_reset1_reset_req>), //                        .reset_req
		.onchip_memory2_0_s1_address       (<connected-to-onchip_memory2_0_s1_address>),       //     onchip_memory2_0_s1.address
		.onchip_memory2_0_s1_debugaccess   (<connected-to-onchip_memory2_0_s1_debugaccess>),   //                        .debugaccess
		.onchip_memory2_0_s1_clken         (<connected-to-onchip_memory2_0_s1_clken>),         //                        .clken
		.onchip_memory2_0_s1_chipselect    (<connected-to-onchip_memory2_0_s1_chipselect>),    //                        .chipselect
		.onchip_memory2_0_s1_write         (<connected-to-onchip_memory2_0_s1_write>),         //                        .write
		.onchip_memory2_0_s1_readdata      (<connected-to-onchip_memory2_0_s1_readdata>),      //                        .readdata
		.onchip_memory2_0_s1_writedata     (<connected-to-onchip_memory2_0_s1_writedata>),     //                        .writedata
		.onchip_memory2_0_s1_byteenable    (<connected-to-onchip_memory2_0_s1_byteenable>),    //                        .byteenable
		.reset_reset_n                     (<connected-to-reset_reset_n>)                      //                   reset.reset_n
	);

