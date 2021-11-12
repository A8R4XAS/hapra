library ieee;
use ieee.std_logic_1164.all;

entity function_41_tb is
end function_41_tb;

architecture testbench of function_41_tb is
    component function_41 
     port (
		abc: in std_logic_vector(2 downto 0);
		y: OUT std_logic
    );
	end component function_41;
	signal abc: std_logic_vector(2 downto 0);
    signal y: std_logic;
begin

f81: function_41 port map(abc => abc, y => y);
    process begin
        abc <= "000";
		wait for 10 ns;
		abc <= "111";
		wait for 10 ns;
		abc <= "110";
		wait for 10 ns;
		abc <= "101";
		wait for 10 ns;
        wait;
    end process;
end testbench;
