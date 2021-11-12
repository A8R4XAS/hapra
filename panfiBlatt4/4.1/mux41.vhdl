LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
--the 4:1 multiplexer to be designed consists of four 3-bit inputs, i.e., i1, i2, i3 and i4.
--sel is a 2-bit select signal.
--y is the output
ENTITY mux41 IS
    PORT (
        i1 : IN std_logic_vector(2 DOWNTO 0); 
        i2 : IN std_logic_vector(2 DOWNTO 0);
        i3 : IN std_logic_vector(2 DOWNTO 0);
        i4 : IN std_logic_vector(2 DOWNTO 0);
        sel : IN std_logic_vector(1 DOWNTO 0); 
        y : OUT std_logic_vector(2 DOWNTO 0)
        );
END mux41;

ARCHITECTURE rtl OF mux41 IS
--you can add more components you need
--you can also increase the number of inputs, e.g., the "and" gate blow is extended to a 3-input gate.

    COMPONENT andgate3 IS
        PORT (input1 : IN std_logic;
            input2 : IN std_logic;
            input3: IN std_logic;
			and_result: OUT std_logic);
    END COMPONENT;
     COMPONENT notgate IS
		PORT(
			input : in std_logic;
			not_result : out std_logic
		  );
    END COMPONENT;
     COMPONENT orgate4 IS
      port (
		input1 : in std_logic;
		input2 : in std_logic;
		input3 : in std_logic;
		input4: in std_logic;
		or_result : out std_logic
	  );
	END COMPONENT;
--you can define more signals here if you need, e.g.,:
    signal not_sel : std_logic_vector(1 DOWNTO 0); 
	signal a_out1: std_logic_vector(2 DOWNTO 0);
	signal a_out2: std_logic_vector(2 DOWNTO 0);
	signal a_out3: std_logic_vector(2 DOWNTO 0);
	signal a_out4: std_logic_vector(2 DOWNTO 0);
	signal o_out: std_logic_vector(2 DOWNTO 0);
BEGIN
not_output0: notgate port map(input => sel(0), not_result => not_sel(0));
not_output1: notgate port map(input => sel(1), not_result => not_sel(1));

--bitwise operation for each logic gate because the input signals are multilple-bit signals.
--please complete the implementation based on the schema you designed.
    and_gate_assignment : for i in 0 to 2 generate
        and_output1: andgate3 port map(input1 => not_sel(1),  input2 => not_sel(0), input3 => i1(i), and_result => a_out1(i));
        and_output2: andgate3 port map(input1 => not_sel(1), input2 => sel(0),  input3 => i2(i), and_result => a_out2(i));
        and_output3: andgate3 port map(input1 => sel(1),  input2 => not_sel(0), input3 => i3(i), and_result => a_out3(i));
        and_output4: andgate3 port map(input1 => sel(1), input2 => sel(0), input3 => i4(i), and_result => a_out4(i));
    end generate and_gate_assignment;
    
	or_gate_assignment : for i in 0 to 2 generate
		or_output: orgate4 port map(input1 => a_out1(i), input2 => a_out2(i), input3 => a_out3(i), input4 => a_out4(i), or_result  => y(i));
	end generate or_gate_assignment;
END rtl;
