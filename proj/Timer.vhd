library ieee;
use ieee.std_logic_1164.all;

entity Timer is
	port(	NewTime 		: in 	std_logic_vector(downto 0);
			TimeValue	: in 	std_logic_vector(downto 0);
			TimeEnable	: in 	std_logic;
			clock			: in 	std_logic;
			reset			: in 	std_logic;
			TimeExp		: out	std_logic_vector(downto 0);
			TimeReal		: out std_logic_vector(downto 0));
end Timer;

architecture Behav of Timer is
begin
	fsm: work.statemachine(behavioral) port map(	reset => reset,
																clk	=> clock,
																NewTime	=> NewTime,
																TimeValue	=> TimeValue,
																TimeEnable	=> TimeEnable,
																TimeExp		=> TimeExp
																);
end Behav;