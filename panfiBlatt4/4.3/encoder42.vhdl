library ieee;
use ieee.std_logic_1164.all;

entity encoder42 is 
	port (
		i : in  std_logic_vector(3 downto 0);
		y : out std_logic_vector(1 downto 0)
		);
end encoder42;

architecture rtl of encoder42 is
	component andgate is
        port (input1 : in std_logic;
            input2 : in std_logic;
			and_result: out std_logic);
    end component;
	component notgate is
		port(
			input : in std_logic;
			not_result : out std_logic
		  );
	end component;
	component orgate is
	  port (
		input1 : in std_logic;
		input2 : in std_logic;
		or_result : out std_logic
	  );
	end component; 
	signal not_i2: std_logic;
	signal and_out: std_logic;
	begin

		not_output: notgate port map(input => i(2), not_result => not_i2);
		and_output: andgate port map(input1 => not_i2,  input2 => i(1), and_result => and_out);
		or_output0:  orgate port map(input1 => and_out, input2 => i(3), or_result => y(0));
		or_output1:  orgate port map(input1 => i(3), input2 => i(2), or_result =>  y(1));
end rtl;
