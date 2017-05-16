	component pll is
		port (
			clk_clk                           : in  std_logic                     := 'X';             -- clk
			clock_12_clk                      : out std_logic;                                        -- clk
			onchip_memory2_0_reset1_reset     : in  std_logic                     := 'X';             -- reset
			onchip_memory2_0_reset1_reset_req : in  std_logic                     := 'X';             -- reset_req
			onchip_memory2_0_s1_address       : in  std_logic_vector(17 downto 0) := (others => 'X'); -- address
			onchip_memory2_0_s1_debugaccess   : in  std_logic                     := 'X';             -- debugaccess
			onchip_memory2_0_s1_clken         : in  std_logic                     := 'X';             -- clken
			onchip_memory2_0_s1_chipselect    : in  std_logic                     := 'X';             -- chipselect
			onchip_memory2_0_s1_write         : in  std_logic                     := 'X';             -- write
			onchip_memory2_0_s1_readdata      : out std_logic_vector(15 downto 0);                    -- readdata
			onchip_memory2_0_s1_writedata     : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			onchip_memory2_0_s1_byteenable    : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- byteenable
			reset_reset_n                     : in  std_logic                     := 'X'              -- reset_n
		);
	end component pll;

	u0 : component pll
		port map (
			clk_clk                           => CONNECTED_TO_clk_clk,                           --                     clk.clk
			clock_12_clk                      => CONNECTED_TO_clock_12_clk,                      --                clock_12.clk
			onchip_memory2_0_reset1_reset     => CONNECTED_TO_onchip_memory2_0_reset1_reset,     -- onchip_memory2_0_reset1.reset
			onchip_memory2_0_reset1_reset_req => CONNECTED_TO_onchip_memory2_0_reset1_reset_req, --                        .reset_req
			onchip_memory2_0_s1_address       => CONNECTED_TO_onchip_memory2_0_s1_address,       --     onchip_memory2_0_s1.address
			onchip_memory2_0_s1_debugaccess   => CONNECTED_TO_onchip_memory2_0_s1_debugaccess,   --                        .debugaccess
			onchip_memory2_0_s1_clken         => CONNECTED_TO_onchip_memory2_0_s1_clken,         --                        .clken
			onchip_memory2_0_s1_chipselect    => CONNECTED_TO_onchip_memory2_0_s1_chipselect,    --                        .chipselect
			onchip_memory2_0_s1_write         => CONNECTED_TO_onchip_memory2_0_s1_write,         --                        .write
			onchip_memory2_0_s1_readdata      => CONNECTED_TO_onchip_memory2_0_s1_readdata,      --                        .readdata
			onchip_memory2_0_s1_writedata     => CONNECTED_TO_onchip_memory2_0_s1_writedata,     --                        .writedata
			onchip_memory2_0_s1_byteenable    => CONNECTED_TO_onchip_memory2_0_s1_byteenable,    --                        .byteenable
			reset_reset_n                     => CONNECTED_TO_reset_reset_n                      --                   reset.reset_n
		);

