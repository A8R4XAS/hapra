LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY demux14 IS
    PORT (
        y : IN std_logic_vector(2 DOWNTO 0); 
        sel : IN std_logic_vector(1 DOWNTO 0); 
        y0 : OUT std_logic_vector(2 DOWNTO 0);
        y1 : OUT std_logic_vector(2 DOWNTO 0);
        y2 : OUT std_logic_vector(2 DOWNTO 0);
        y3 : OUT std_logic_vector(2 DOWNTO 0)
        );
END demux14;
  
ARCHITECTURE rtl OF demux14 IS
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
	signal not_sel : std_logic_vector(1 DOWNTO 0); 
	
BEGIN
	not_output0: notgate port map(input => sel(0), not_result => not_sel(0));
	not_output1: notgate port map(input => sel(1), not_result => not_sel(1));
	and_gate_assignment : for i in 0 to 2 generate
        and_output1: andgate3 port map(input1 => not_sel(1),  input2 => not_sel(0), input3 => y(i), and_result => y0(i));
        and_output2: andgate3 port map(input1 => not_sel(1), input2 => sel(0),  input3 => y(i), and_result => y1(i));
        and_output3: andgate3 port map(input1 => sel(1),  input2 => not_sel(0), input3 => y(i), and_result => y2(i));
        and_output4: andgate3 port map(input1 => sel(1), input2 => sel(0), input3 => y(i), and_result => y3(i));
    end generate and_gate_assignment;

END rtl;
