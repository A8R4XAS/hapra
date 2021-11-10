library ieee;
use ieee.std_logic_1164.all;

entity rca_tb is
end rca_tb;

architecture test of rca_tb is
  component rca
    port (
      a     : in std_logic_vector(7 downto 0);
      b     : in std_logic_vector(7 downto 0);
      cout  : out std_logic;
      sum   : out std_logic_vector(7 downto 0)
    );
  end component;

signal a    : std_logic_vector(7 downto 0);
signal b    : std_logic_vector(7 downto 0);
signal cout : std_logic;
signal sum  : std_logic_vector(7 downto 0);
begin
  rc_adder: rca port map(a => a, b => b, cout => cout, sum => sum);

  process begin
    a <= "00001111";
    b <= "00001111";
    wait for 1 ns;

    a <= "00000001";
    b <= "00000001";
    wait for 1 ns;

    a <= "01010101";
    b <= "10101010";
    wait for 1 ns;
    wait;
  end process;
end test;
