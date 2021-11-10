library ieee;
use ieee.std_logic_1164.all;

entity rca_tb is
end rca_tb;

architecture test of rca_tb is
  component rca
    port (
      a : in std_logic_vector(7 downto 0);
      b : in std_logic_vector(7 downto 0);
      cin : in std_logic;
      cout : out std_logic;
      sum : out std_logic_vector(7 downto 0)
    );
  end component;
  
--Inputs
signal a : std_logic_vector(7 downto 0);
signal b : std_logic_vector(7 downto 0);
signal cin : std_logic;
 
--Outputs
signal sum : std_logic_vector(7 downto 0);
signal cout : std_logic;

begin
  rca_adder: rca port map( a => a, b => b, cin => cin, cout => cout, sum => sum );
  
 
  process begin
    a <= "00000001";
    b <= "00000000";
    cin <= '1';
    
    wait for 10 ns;
    
    a <= "00000001";
    b <= "00000000";
    cin <= '0';
    wait for 10 ns;
    
    a <= "00001001";
    b <= "00000001";
    cin <= '1';
    wait for 10 ns;
    
    a <= "00001001";
    b <= "00000001";
    cin <= '0';
    wait for 10 ns;
    
    a <= "00001010";
    b <= "00001001";
    cin <= '1';
    wait for 10 ns;
    
    a <= "00001010";
    b <= "00001001";
    cin <= '0';
    wait for 10 ns;
    
    a <= "11111111";
    b <= "00000001";
    cin <= '1';
    wait for 10 ns;
    
    a <= "11111111";
    b <= "00000001";
    cin <= '0';
    wait for 10 ns;
    
    assert false report "End of test";
    
    wait;
  end process;
end test;
