library ieee;
use ieee.std_logic_1164.all;

entity mux41_tb is
end mux41_tb;

architecture testbench of mux41_tb is
  component mux41 
     port (
        i1 : in std_logic_vector(2 downto 0); 
        i2 : in std_logic_vector(2 downto 0);
        i3 : in std_logic_vector(2 downto 0);
        i4 : in std_logic_vector(2 DOWNTO 0);
        sel : in std_logic_vector(1 DOWNTO 0); 
        y : out std_logic_vector(2 downto 0)
        );
  end component;
  signal i1 : std_logic_vector(2 downto 0); 
  signal i2 : std_logic_vector(2 downto 0);
  signal i3 : std_logic_vector(2 downto 0);
  signal i4 : std_logic_vector(2 downto 0);
  signal sel : std_logic_vector(1 downto 0); 
  signal y : std_logic_vector(2 downto 0);
	
begin
	
    multiplex: mux41 port map(i1 => i1, i2 => i2, i3 => i3, i4 => i4, sel => sel, y => y);

    process begin
		i1 <= "000";
		i2 <= "001";
		i3 <= "010";
		i4 <= "011";
	
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
