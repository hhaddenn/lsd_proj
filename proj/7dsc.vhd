library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;


entity b7dsc is
 
Port(
prog : in std_logic_vector(1 downto 0);
timereal: in std_logic_vector (3 downto 0);
progr: out std_logic_vector(6 downto 0);
P : out std_logic_vector(6 downto 0);
dec:out std_logic_vector (6 downto 0));
end b7dsc;


architecture Behavioral of b7dsc is

  
 begin
	case timereal  is
	when "0000" => 
	dec <= "0000001"; 
	when "0001" =>  
	dec <= "1001111"; 
	when "0010" =>  
	dec <= "0010010"; 
	when "0011" =>
	dec <= "0000110"; 
	when "0100" => 
	dec <= "1001100"; 
	when "0101" =>
	dec <= "0100100"; 
	when "0110" =>
	dec <= "0100000";
	when "0111" =>
	dec <= "0001111"; 
	when "1000" =>
	dec <= "0000000"; 
	when "1001" =>
	dec <= "0000100"; 
	when others => 
	dec <= "1111111";
	end case;
	
	case prog is 
	when "00" =>
	p <="0000000";
	when "01"=>
	p <= "1001111";
	when "10"=>
	p <= "0010010";
	when "11"=>
	p <= "0000110";
	end case;
	
	progr<="0011000";
	
	count <= std_logic_vector(s_count);
	end Behavioral;	
	
	
	
