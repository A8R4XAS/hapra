library ieee;
use ieee.std_logic_1164.all;

-- create testbench for and_gate
-- can be left empty, since test bench (this file) has no inputs or outputs
entity signals_tb is
end signals_tb;

architecture test of signals_tb is
  -- component declaration, so that it can be instantiated later
  -- must have same name and port list as the entity
-- define the signals that will be used in test
  signal 
    a01, o01, 
    a0L, o0L, 
    a0H, o0H, 
    a0X, o0X, 
    a0W, o0W, 
    a0Z, o0Z,
    a1L, o1L,
    a1H, o1H : std_logic;
-- begin test code
begin
  -- creates an instance of andgate
  process begin
    a01 <= '0' and '1'; -- 0
    o01 <= '0' or '1';  -- 1

    a0L <= '0' and 'L'; -- 0
    o0L <= '0' or 'L';  -- 0

    a0H <= '0' and 'H'; -- 0
    o0H <= '0' or 'H';  -- 1 

    a0X <= '0' and 'X'; -- 0
    o0X <= '0' or 'X';  -- x

    a0W <= '0' and 'W'; -- 0
    o0W <= '0' or 'W';  -- x
    
    a0Z <= '0' and 'Z'; -- 0
    o0Z <= '0' or 'Z';  -- x

    a1L <= '1' and 'L'; -- 0
    o1L <= '1' or 'L';  -- 1

    a1H <= '1' and 'H'; -- 1
    o1H <= '1' or 'H';  -- 1

    wait for 10 ns;
    assert false report "End of test";
    wait;
  end process;
end test;
