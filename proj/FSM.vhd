library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FSM is
port (reset 		: in 	std_logic;
		p1 			: in 	std_logic;
		p2				: in  std_logic;
		p3				: in 	std_logic;
		start_stop  : in 	std_logic;
		clock 		: in 	std_logic;
		NewTime 		: out std_logic_vector(3 downto 0);
		TimeValue 	: out std_logic_vector(3 downto 0);
		TimeEnable 	: out std_logic;
		ledr	 		: out std_logic;
	   water_valve : out std_logic;
		rinse			: out std_logic;
		water_pump	: out std_logic;
		spin			: out std_logic);
end statemachine;

architecture Behav of FSM is

TYPE Tstate is (inicial, parado, meter_agua, enxaguar, tirar_agua, spin, acabou);
signal s_State: Tstate;
signal retorno: inicial;
signal voltas : std_logic_vector(1 downto 0);
begin
	process(clock)
	begin
		if (rising_edge(clock)) then 
			case(s_State) is
			
			when inicial => 
				water_valve <= '0';
				water_pump 	<= '0';
				rinse			<= '0';
				spin			<= '0';
				if	(start_stop = '0') then
					-- display "P"
				elsif (p1 = '1') then
					voltas <= "00";
					ledr 	 <= '1';
					s_State <= meter_agua;
				elsif (p2 = '1') then
					voltas <= "00";
					ledr 	 <= '1';
					s_State <= meter_agua;
				elsif (p3 = '1') then
					voltas <= "00";
					ledr 	 <= '1';
					s_State <= spin;
				end if;
			
			when parado => 
				if (reset='1') then
					s_State <= inicial;
				elsif (start_stop = '1') then
					s_State <= retorno;
				end if;
				
			when meter_agua =>
				water_valve <= '1';
				water_pump 	<= '0';
				rinse			<= '0';
				spin			<= '0';
				if (start_stop = '1') then
					retorno <= meter_agua;
					s_State <= parado;
				end if;
			when enxaguar =>
				water_valve <= '0';
				water_pump 	<= '0';
				rinse			<= '1';
				spin			<= '0';
				if (start_stop = '1') then
					retorno <= enxaguar;
					s_State <= parado;
				end if;
			when tirar_agua =>
				water_valve <= '0';
				water_pump 	<= '1';
				rinse			<= '0';
				spin			<= '0';
				if (start_stop = '1') then
					retorno <= tirar_agua;
					s_State <= parado;
				end if;
			when spin =>
				water_valve <= '0';
				water_pump 	<= '0';
				rinse			<= '0';
				spin			<= '1';
				if (start_stop = '1') then
					retorno <= spin;
					s_State <= parado;
				end if;
			when acabou =>
				
			
			end case;
		end if;	
	end process;	
end Behav;	
			
			
			
			
			
				