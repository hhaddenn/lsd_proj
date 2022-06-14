library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity statemachine is
port (
			 reset : in std_logic;
programSelector : in std_logic;
		 starstop : in std_logic;
				clk : in std_logic;
		--  NewTime : out std_logic_vector;
	--	TimeValue : out std_logic_vector;
   --  TimeEnable : out std_logic_vector;
	--		LedRed : out std_logic_vector(1 downto 0);
	  WaterValve : out std_logic);
end statemachine;

architecture behavioral of statemachine is

TYPE Tstate is (menu,idle, Prog1, Prog2, Prog3,finish);
signal s_State:Tstate;


	begin
	
    process(clk)
	  begin
		if (rising_edge(clk)) then 
			case(s_State) is
			when Menu => 
					if(reset='0') then
					--	display="P";
						s_State<=idle;
					end if;
		
			when idle => 
				if(reset='1') then
					s_State<=Menu;
				end if;
				if(programSelector='1') then
					s_State<=Prog1;
					starstop<='0';
				
				end if;
			
			when  Prog1 =>
				--display Prog1
				if(reset='1') then
					s_State<=Menu;
					
				end if;
				if(programSelector='1') then
					s_State<=Prog2;
					starstop<='0';
				end if;
				if(starstop='1') then
					WaterValve<='1';
					--counterdone
					s_State<=finish;
				end if;
				
			when Prog2 =>
				--display Prog2
				if(reset='1') then
						s_State<=Menu;
				end if;
				if(programSelector='1') then
					s_State<=Prog3;
					starstop<='0';
				end if;
				if(starstop='1') then
					WaterValve<='1';
				--counterdone
					s_State<=finish;
				end if;
				
			when Prog3 =>
				--display Prog3
				
				if(reset='1') then
					s_State<=Menu;
				end if;
				if(programSelector='1') then
					s_State<=idle;
				end if;
				if(starstop='1') then
					WaterValve<='1';
				--counterdone
					s_State<=finish;
					starstop<='0';
				end if;
			
			when finish =>
				if(reset='1') then
					s_State<=menu;
				else	
					s_State<=idle;
				end if;
				
			 
			 end case;
			 
			 end if;
				
			end process;
			
		end behavioral;	
			
			
			
			
			
				