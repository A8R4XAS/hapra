LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY function_81 IS
    PORT (
		abc: in std_logic_vector(2 downto 0);
		y: out std_logic
    );
END function_81;

ARCHITECTURE rtl OF function_81 IS

    component mux81 is 
        PORT (
        i1_81 : IN std_logic_vector(2 DOWNTO 0); 
        i2_81 : IN std_logic_vector(2 DOWNTO 0);
        i3_81 : IN std_logic_vector(2 DOWNTO 0);
        i4_81 : IN std_logic_vector(2 DOWNTO 0);
        i5_81 : IN std_logic_vector(2 DOWNTO 0);
        i6_81 : IN std_logic_vector(2 DOWNTO 0);
        i7_81 : IN std_logic_vector(2 DOWNTO 0);
        i8_81 : IN std_logic_vector(2 DOWNTO 0);
        sel_81 : IN std_logic_vector(2 DOWNTO 0); 
        y_81 : OUT std_logic_vector(2 DOWNTO 0));
    end component mux81;
    signal i1_81 : std_logic_vector(2 DOWNTO 0); 
	signal i2_81 : std_logic_vector(2 DOWNTO 0);
	signal i3_81 : std_logic_vector(2 DOWNTO 0);
	signal i4_81 : std_logic_vector(2 DOWNTO 0);
	signal i5_81 : std_logic_vector(2 DOWNTO 0);
	signal i6_81 : std_logic_vector(2 DOWNTO 0);
	signal i7_81 : std_logic_vector(2 DOWNTO 0);
	signal i8_81 : std_logic_vector(2 DOWNTO 0);
	signal unused: std_logic_vector(1 DOWNTO 0); -- to display only one bit as output
begin
	i1_81 <= "000";
	i2_81 <= "000";
	i3_81 <= "000";
	i4_81 <= "000";
	i5_81 <= "000";
	i6_81 <= "111";
	i7_81 <= "111";
	i8_81 <= "111";
    multiplex: mux81 port map(i1_81 => i1_81, i2_81 => i2_81, i3_81 => i3_81, i4_81 => i4_81, i5_81 => i5_81, i6_81 => i6_81, i7_81 => i7_81, i8_81 => i8_81, sel_81 => abc, y_81(0) => y, y_81(2 downto 1) => unused);
end rtl;
