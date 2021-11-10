-- from the ieee libary we use std_logic_1164
-- defines a standard for logic values used in electronic design
-- for more info check the std_logic_1164.vhdl file in ghdl/libraries/ieee
-- ieee libary also defines operators and keywords
library ieee;
use ieee.std_logic_1164.all;
-- define signal (fundamental unit in vhdl) of type std_logic, called and_gate
-- and_gate gets assigned "input1 and input2"
--
--signal and_gate: std_logic;
--and_gate <= input1 and input2;

-- inputs and outputs of a file (andgate.vhdl) are defined in entities (black boxes)
-- entity has port that defines all inputs and outputs of file
-- like a header file (.h)
-- std_logic can have 9 different values, it is part of std_logic_1164 package
-- you can think of it as a single bit
entity andgate is
  port (
    input1 : in std_logic;
    input2 : in std_logic;
    input3 : in std_logic;
    and_result : out std_logic
  );
end andgate;

-- architecture describes functionality of particular entity
-- like .c implementation of a function
-- actually describes the "internal wiring" of block
architecture rtl of andgate is
  -- interconnection signals, constants, or other components
  signal and_gate : std_logic;
  signal dInput1 : std_logic;
  signal dInput2 : std_logic;
  signal dInput3 : std_logic;
begin
  dInput1 <= input1 after 10 ns;
  dInput2 <= input2 after 10 ns;
  dInput3 <= input3 after 10 ns;
  and_gate <= dInput1 and dInput2 and dInput3;
  and_result <= and_gate;
end rtl;
