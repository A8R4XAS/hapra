library ieee;
use ieee.std_logic_1164.all;

entity demux18_tb is
end demux18_tb;

architecture testbench of demux18_tb is
component demux18
  PORT (
        y : IN std_logic_vector(2 DOWNTO 0);
        s : IN std_logic_vector(2 DOWNTO 0);
		y0 : OUT std_logic_vector(2 DOWNTO 0);
        y1 : OUT std_logic_vector(2 DOWNTO 0);
        y2 : OUT std_logic_vector(2 DOWNTO 0);
        y3 : OUT std_logic_vector(2 DOWNTO 0);
		y4 : OUT std_logic_vector(2 DOWNTO 0);
        y5 : OUT std_logic_vector(2 DOWNTO 0);
        y6 : OUT std_logic_vector(2 DOWNTO 0);
        y7 : OUT std_logic_vector(2 DOWNTO 0)
    );
end component;
	signal y : std_logic_vector(2 DOWNTO 0); 
	signal sel: std_logic_vector(2 DOWNTO 0);
	signal y0 : std_logic_vector(2 DOWNTO 0);
	signal y1: std_logic_vector(2 DOWNTO 0);
	signal y2: std_logic_vector(2 DOWNTO 0);
	signal y3: std_logic_vector(2 DOWNTO 0);
	signal y4: std_logic_vector(2 DOWNTO 0);
	signal y5: std_logic_vector(2 DOWNTO 0);
	signal y6 :std_logic_vector(2 DOWNTO 0); 
	signal y7: std_logic_vector(2 DOWNTO 0);
begin
	y <= "111";
	demux: demux18 port map(y => y, s => sel, y0 => y0, y1 => y1, y2 => y2, y3 => y3, y4 => y4, y5 => y5, y6 => y6, y7 => y7);
    process begin
        sel <= "000";
        wait for 10 ns;
        sel <= "010";
        wait for 10 ns;
        sel <= "001";
        wait for 10 ns;
        sel <= "011";
        wait for 10 ns;
        sel <= "100";
        wait for 10 ns;
        sel <= "110";
        wait for 10 ns;
        sel <= "101";
        wait for 10 ns;
        sel <= "111";
        wait for 10 ns;
        wait;
    end process;
end testbench;
