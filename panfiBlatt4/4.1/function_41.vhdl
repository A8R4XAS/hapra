LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY function_41 IS
    PORT (
		abc: IN std_logic_vector(2 DOWNTO 0); -- a and b are control signals
		y: OUT std_logic
    );
END function_41;

ARCHITECTURE rtl OF function_41 IS

    component mux41 is 
       PORT (
        i1 : IN std_logic_vector(2 DOWNTO 0); 
        i2 : IN std_logic_vector(2 DOWNTO 0);
        i3 : IN std_logic_vector(2 DOWNTO 0);
        i4 : IN std_logic_vector(2 DOWNTO 0);
        sel : IN std_logic_vector(1 DOWNTO 0); 
        y : OUT std_logic_vector(2 DOWNTO 0)
        );
    end component mux41;
	signal sel: std_logic_vector(1 DOWNTO 0);
	signal i3: std_logic_vector(2 DOWNTO 0);
	signal unused: std_logic_vector(1 DOWNTO 0); -- to display only one bit as output
begin
    sel(0) <= abc(1);
    sel(1) <= abc(2);
    i3(0) <= abc(0);
    i3(1) <= '0';
    i3(2) <= '0';
    multiplex: mux41 port map(i1 => "000", i2 => "000", i3 => i3, i4 => "111", sel => sel, y(0) => y, y(2 downto 1) => unused);
end rtl;
