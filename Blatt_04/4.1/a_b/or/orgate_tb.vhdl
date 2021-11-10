library ieee;
use ieee.std_logic_1164.all;

-- create testbench for or_gate
-- can be left empty, since test bench (this file) has no inputs or outputs
entity orgate_tb is
end orgate_tb;

architecture test of orgate_tb is
  -- component declaration, so that it can be instantiated later
  -- must have same name and port list as the entity
  component orgate
      port (
        input1 : in std_logic;
        input2 : in std_logic;
        input3 : in std_logic;
        or_result : out std_logic
      );
  end component;
-- define the signals that will be used in test
  signal a, b, c, d, e : std_logic;
-- begin test code
begin
  -- creates an instance of orgate
  or_g: orgate port map(input1 => a, input2 => b, input3 => c, input4 => d, or_result => e );

  process begin
    a <= '0';
    b <= '0';
    c <= '0';
    wait for 10 ns;
    a <= '0';
    b <= '0';
    c <= '1';
    wait for 10 ns;
    a <= '0';
    b <= '1';
    c <= '0';
    wait for 10 ns;
    a <= '1';
    b <= '0';
    c <= '0';
    wait for 10 ns;
    a <= '1';
    b <= '0';
    c <= '1';
    wait for 10 ns;
    a <= '1';
    b <= '1';
    c <= '0';
    wait for 10 ns;
    a <= '1';
    b <= '1';
    c <= '1';
    wait for 10 ns;
    assert false report "End of test";
    wait;
  end process;
end test;
