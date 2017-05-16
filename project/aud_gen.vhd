library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity  aud_gen is
port (
	aud_clock_12: in std_logic;
	aud_bk: out std_logic;
	aud_dalr: out std_logic;
	aud_dadat: out std_logic;
	aud_data_in: in std_logic_vector(31 downto 0)
	
);
end aud_gen;

architecture main of aud_gen is

signal sample_flag: std_logic:='0';
signal data_index: integer range 0 to 31:=0;
signal da_data :std_logic_vector(15 downto 0):=(others=>'0');
signal da_data_out: std_logic_vector(31 downto 0):=(others=>'0');
signal aud_prscl: integer range 0 to 300:=0;
signal clk_en: std_logic:='0';
begin

aud_bk<=aud_clock_12;

process(aud_clock_12)
begin

if falling_edge(aud_clock_12) then

	aud_dalr<=clk_en;

	if(aud_prscl<250)then------48k sample rate
		aud_prscl<=aud_prscl+1;
		clk_en<='0';
		else
		aud_prscl<=0;
		da_data_out<=aud_data_in;--get sample
		clk_en<='1';
	end if;
	

	
	if(clk_en='1')then-------send new sample
	sample_flag<='1';
	data_index<=31;
	end if;

	if(sample_flag='1')then
	
		if(data_index>0)then
			aud_dadat<=da_data_out(data_index);
			data_index<=data_index-1;
			else 
			aud_dadat<=da_data_out(data_index);
			sample_flag<='0';
		end if;
		
	end if;
end if;

end process;
end main;