library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity i2c is
port(
i2c_busy: out std_logic;
i2c_scl: out std_logic;
i2c_send_flag: in std_logic;
i2c_sda: inout std_logic;
i2c_addr: in std_logic_vector(7 downto 0);
i2c_done: out std_logic;
i2c_data: in std_logic_vector(15 downto 0);
i2c_clock_50: in std_logic
);
end i2c;


architecture main of i2c is

signal i2c_clk_en: std_logic:='0';
signal clk_prs: integer range 0 to 300:=0;
signal clk_en: std_logic:='0';
signal ack_en: std_logic:='0';
signal clk_i2c: std_logic:='0';
signal get_ack: std_logic:='0';
signal data_index: integer range 0 to 15:=0;
type fsm is (st0,st1,st2,st3,st4,st5,st6,st7,st8);
signal i2c_fsm:fsm:=st0;
begin


------generate two clocks for i2c and data transitions
process(i2c_clock_50)
begin

if rising_edge(i2c_clock_50) then

	if(clk_prs<250)then
	clk_prs<=clk_prs+1;
	else
	clk_prs<=0;
	end if;
	
	if(clk_prs<125)then ---50 % duty cylce clock for i2c
	clk_i2c<='1';
	else
	clk_i2c<='0';
	end if;
	
	---- clock for ack  on SCL=HIGH
	if(clk_prs=62)then 
	ack_en<='1';
	else
	ack_en<='0';
	end if;
	
	
	---- clock for data on SCL=LOW
	if(clk_prs=187)then 
	clk_en<='1';
	else
	clk_en<='0';
	end if;
	
end if;

if rising_edge(i2c_clock_50) then


	if(i2c_clk_en='1')then
		i2c_scl<=clk_i2c;
	else 
		i2c_scl<='1';
	end if;

	
	----ack on SCL=HIGH
	if(ack_en='1')then
		case i2c_fsm is
		when st3=> ---- get ack
		
				if(i2c_sda='0')then
					i2c_fsm<=st4;---ack
					data_index<=15;			
					else
					i2c_clk_en<='0';
					i2c_fsm<=st0;---nack
				end if;
				
		when st5=> --- get ack
		
				if(i2c_sda='0')then
					i2c_fsm<=st6;---ack
					data_index<=7;			

					else
					i2c_fsm<=st0;---nack
					i2c_clk_en<='0';
				end if;
				
		when st7 => ----get ack
		
				if(i2c_sda='0')then
					i2c_fsm<=st8;---ack
					else
					i2c_fsm<=st0;---nack
					i2c_clk_en<='0';
				end if;	
				
	   when others=>NULL;
		end case;
	end if;
	
	
	
	-----data tranfer on SCL=LOW
	if(clk_en='1')then
		case i2c_fsm is
			when st0=> ----------stand by
				i2c_sda<='1';
				i2c_busy<='0';
				i2c_done<='0';
				if(i2c_send_flag='1')then
				i2c_fsm<=st1;
				i2c_busy<='1';
				end if;
				
			when st1=> -------start condition
				i2c_sda<='0';
				i2c_fsm<=st2;
				data_index<=7;
			when st2=> -------send addr
			   i2c_clk_en<='1';---start clocking i2c_scl
				
				if(data_index>0) then
					data_index<=data_index-1;
					i2c_sda<=i2c_addr(data_index);
					else
					i2c_sda<=i2c_addr(data_index);
					get_ack<='1';
				end if;
				
				if(get_ack='1')then
					get_ack<='0';
					i2c_fsm<=st3;
					i2c_sda<='Z';
				end if;
				
			when st4=> ---- send 1st 8 bit
			
				if(data_index>8) then
					data_index<=data_index-1;
					i2c_sda<=i2c_data(data_index);
					else
					i2c_sda<=i2c_data(data_index);
					get_ack<='1';
				end if;
				
				if(get_ack='1')then
					get_ack<='0';
					i2c_fsm<=st5;
					i2c_sda<='Z';				
				end if;
				
			when st6 => ---send 2nd 8 bit
			
				if(data_index>0) then
					data_index<=data_index-1;
					i2c_sda<=i2c_data(data_index);
					else
					i2c_sda<=i2c_data(data_index);
					get_ack<='1';
				end if;
				
				if(get_ack='1')then
					get_ack<='0';
					i2c_fsm<=st7;
					i2c_sda<='Z';
				end if;
				
			when st8 => --stop condition
				i2c_clk_en<='0';
				i2c_sda<='0';
				i2c_fsm<=st0;
				i2c_done<='1';
			when others=>NULL;
			end case;
	end if;

end if;
end process;
end main;