library ieee;
use ieee.std_logic_1164.all;

entity mux41_tb is
end mux41_tb;

architecture testbench of mux41_tb is
  component mux41
    port (
            i1 : IN  std_logic_vector(2 DOWNTO 0); 
            i2 : IN  std_logic_vector(2 DOWNTO 0);
            i3 : IN  std_logic_vector(2 DOWNTO 0);
            i4 : IN  std_logic_vector(2 DOWNTO 0);
            sel : IN std_logic_vector(1 DOWNTO 0);
            y  : OUT std_logic_vector(2 DOWNTO 0)  
    );
  end component;

  signal s : std_logic_vector(1 DOWNTO 0);
  signal a, b, c, d, e : std_logic_vector(2 DOWNTO 0);

begin
    multiplex: mux41 port map(i1 => a, i2 => b, i3 => c, i4 => d, sel => s, y => e);

    process begin
        a <= "000";
        b <= "001";
        c <= "010";
        d <= "011";
        wait for 5 ns;
        s <= "00";
        wait for 10 ns;
        s <= "01";
        wait for 10 ns;
        s <= "10";
        wait for 10 ns;
        s <= "11";
        wait for 10 ns;
        wait;
    end process;
end testbench;