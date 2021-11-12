library ieee;
use ieee.std_logic_1164.all;

entity orgate4 is
  port (
    input1 : in std_logic;
    input2 : in std_logic;
    input3 : in std_logic;
    input4: in std_logic;
    or_result : out std_logic
  );
end orgate4;

architecture rtl of orgate4 is
  signal or_gate : std_logic;
begin
  or_gate <= input1 OR input2 OR input3 OR input4;
  or_result <= or_gate;
end rtl;
