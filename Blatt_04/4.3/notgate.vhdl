library ieee;
use ieee.std_logic_1164.all;

entity notgate is
	port(
		input : in std_logic;
		not_result : out std_logic
	  );
end notgate;

architecture rtl of notgate is
signal not_gate : std_logic;
begin
	not_gate <= NOT input;
	not_result <= not_gate;
end rtl;
