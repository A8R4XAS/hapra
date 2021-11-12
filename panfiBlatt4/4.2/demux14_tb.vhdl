library ieee;
use ieee.std_logic_1164.all;

entity demux14_tb is
end demux14_tb;

architecture testbench of demux14_tb is
component demux14
     PORT (
        y : IN std_logic_vector(2 DOWNTO 0); 
        sel : IN std_logic_vector(1 DOWNTO 0); 
        y0 : OUT std_logic_vector(2 DOWNTO 0);
        y1 : OUT std_logic_vector(2 DOWNTO 0);
        y2 : OUT std_logic_vector(2 DOWNTO 0);
        y3 : OUT std_logic_vector(2 DOWNTO 0)
        );
  end component;
  signal y : std_logic_vector(2 downto 0); 
  signal y0 : std_logic_vector(2 downto 0);
  signal y1 : std_logic_vector(2 downto 0);
  signal y2 : std_logic_vector(2 downto 0); 
  signal y3 : std_logic_vector(2 downto 0);
  signal sel : std_logic_vector(1 downto 0);

begin
   demux: demux14 port map(y => y, sel => sel, y0 => y0, y1 => y1, y2 => y2, y3 => y3);

    process begin
		y <= "011";
	
        sel <= "00";
        wait for 10 ns;
        sel <= "10";
        wait for 10 ns;
        sel <= "01";
        wait for 10 ns;
        sel <= "11";
        wait for 10 ns;

		
        wait;
    end process;
end testbench;
