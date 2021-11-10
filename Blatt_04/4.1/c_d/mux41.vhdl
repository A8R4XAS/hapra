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

    COMPONENT andgate IS
        PORT (
              input1     : IN std_logic; --s_0
              input2     : IN std_logic; --s_1
		      input3     : IN std_logic; --e_n signal
              and_result : OUT std_logic
        );
    END COMPONENT;

    
    COMPONENT orgate is
        PORT (
              input1 : IN std_logic;
              input2 : IN std_logic;
              input3 : IN std_logic;
              input4 : IN std_logic;
              or_result : OUT std_logic
        );
    END COMPONENT;


    COMPONENT notgate is
        PORT (
              input1 : IN std_logic;
              not_result : OUT std_logic
        );
    END COMPONENT;


--you can define more signals here if you need, e.g.,:
    signal not_sel : std_logic_vector(1 DOWNTO 0);

    signal and_out1 : std_logic_vector(2 downto 0);
    signal and_out2 : std_logic_vector(2 downto 0);
    signal and_out3 : std_logic_vector(2 downto 0);
    signal and_out4 : std_logic_vector(2 downto 0);

    signal or_out : std_logic_vector(2 downto 0);
    

BEGIN

    tmp1 : notgate port map(input1 => sel(0), not_result => not_sel(0));
    tmp2 : notgate port map(input1 => sel(1), not_result => not_sel(1));

--bitwise operation for each logic gate because the input signals are multilple-bit signals.
--please complete the implementation based on the schema you designed.
    and_gate_assignment : for i in 0 to 2 generate
        and_output1: andgate port map(input1 => not_sel(0), input2 => not_sel(1), input3 => i1(i), and_result => and_out1(i));
        and_output2: andgate port map(input1 =>     sel(0), input2 => not_sel(1), input3 => i2(i), and_result => and_out2(i));
        and_output3: andgate port map(input1 => not_sel(0), input2 =>     sel(1), input3 => i3(i), and_result => and_out3(i));
        and_output4: andgate port map(input1 =>     sel(0), input2 =>     sel(1), input3 => i4(i), and_result => and_out4(i));

        or_output : orgate port map(input1 => and_out1(i), input2 => and_out2(i), input3 => and_out3(i), input4 => and_out4(i), or_result => or_out(i));
    
    end generate and_gate_assignment;
	y <= or_out;
END rtl;