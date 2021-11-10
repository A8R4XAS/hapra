-- from the ieee libary we use std_logic_1164
-- defines a standard for logic values used in electronic design
-- for more info check the std_logic_1164.vhdl file in ghdl/libraries/ieee
-- ieee libary also defines operators and keywords
library ieee;
use ieee.std_logic_1164.all;
-- define signal (fundamental unit in vhdl) of type std_logic, called xnor_gate
-- xnor_gate gets assigned "input1 xnor input2"
--
--signal xnor_gate: std_logic;
--xnor_gate <= input1 xnor input2;

-- inputs and outputs of a file (xnorgate.vhdl) are defined in entities (black boxes)
-- entity has port that defines all inputs and outputs of file
-- like a header file (.h)
-- std_logic can have 9 different values, it is part of std_logic_1164 package
-- you can think of it as a single bit
entity xnorgate is
  port (
    input1 : in std_logic;
    input2 : in std_logic;
    xnor_result : out std_logic
  );
end xnorgate;

-- architecture describes functionality of particular entity
-- like .c implementation of a function
-- actually describes the "internal wiring" of block
architecture rtl of xnorgate is
  -- interconnection signdals, constants, or other components
  signal or1 : std_logic;
  signal or2 : std_logic;
  signal or3 : std_logic;
  signal or4 : std_logic;
  signal nor1 : std_logic;
  signal nor2 : std_logic;
  signal nor3 : std_logic;
  signal xnor_gate : std_logic;

begin
  or1 <= input1 or input2;
  nor1 <= NOT or1;

  or2 <= input1 or nor1; 
  or3 <= input2 or nor1;

  nor2 <= not or2;
  nor3 <= not or3;

  or4 <= nor2 or nor3;

  xnor_gate <= not or4;
  xnor_result <= xnor_gate;
end rtl;
