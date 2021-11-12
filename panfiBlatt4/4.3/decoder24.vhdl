library ieee;
use ieee.std_logic_1164.all;

entity decoder24 is 
	port (
		i : in  std_logic_vector(1 downto 0);
		y : out std_logic_vector(3 downto 0)
		);
end decoder24;

architecture rtl of decoder24 is
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
	signal not_i : std_logic_vector(1 DOWNTO 0); 
	signal a_out1: std_logic_vector(2 DOWNTO 0);
	signal a_out2: std_logic_vector(2 DOWNTO 0);
	signal a_out3: std_logic_vector(2 DOWNTO 0);
	signal a_out4: std_logic_vector(2 DOWNTO 0);
	begin
		not_output0: notgate port map(input => i(0), not_result => not_i(0));
		not_output1: notgate port map(input => i(1), not_result => not_i(1));
			
		and_output1: andgate port map(input1 => not_i(1),  input2 => not_i(0), and_result =>y(0) );
		and_output2: andgate port map(input1 => not_i(1), input2 => i(0), and_result => y(1));
		and_output3: andgate port map(input1 => i(1),  input2 => not_i(0), and_result => y(2));
		and_output4: andgate port map(input1 => i(1), input2 => i(0), and_result => y(3));

end rtl;
