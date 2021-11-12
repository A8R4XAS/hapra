LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY demux18 IS
    PORT (
        y : IN std_logic_vector(2 DOWNTO 0);
        s : IN std_logic_vector(2 DOWNTO 0);
		y0 : OUT std_logic_vector(2 DOWNTO 0);
        y1 : OUT std_logic_vector(2 DOWNTO 0);
        y2 : OUT std_logic_vector(2 DOWNTO 0);
        y3 : OUT std_logic_vector(2 DOWNTO 0);
		y4 : OUT std_logic_vector(2 DOWNTO 0);
        y5 : OUT std_logic_vector(2 DOWNTO 0);
        y6 : OUT std_logic_vector(2 DOWNTO 0);
        y7 : OUT std_logic_vector(2 DOWNTO 0)
    );
END demux18;

ARCHITECTURE rtl OF demux18 IS
	COMPONENT demux14 IS
        PORT (
            y : IN std_logic_vector(2 DOWNTO 0); 
			sel : IN std_logic_vector(1 DOWNTO 0); 
			y0 : OUT std_logic_vector(2 DOWNTO 0);
			y1 : OUT std_logic_vector(2 DOWNTO 0);
			y2 : OUT std_logic_vector(2 DOWNTO 0);
			y3 : OUT std_logic_vector(2 DOWNTO 0)
        );
    END COMPONENT;
	COMPONENT andgate IS
        PORT (input1 : IN std_logic;
            input2 : IN std_logic;
			and_result: OUT std_logic);
    END COMPONENT;
     COMPONENT notgate IS
		PORT(
			input : in std_logic;
			not_result : out std_logic
		  );
    END COMPONENT;
	signal a_out0:  std_logic_vector(2 DOWNTO 0);
	signal a_out1:  std_logic_vector(2 DOWNTO 0);
	signal sel:  std_logic_vector(1 DOWNTO 0);
	signal sel_2_neg: std_logic;
BEGIN
	not_output0: notgate port map(input => s(2), not_result => sel_2_neg);
	and_gate_assignment : for i in 0 to 2 generate
		and_output0: andgate port map(input1 => y(i), input2 => sel_2_neg, and_result => a_out0(i));
		and_output1: andgate port map(input1 => y(i), input2 => s(2), and_result => a_out1(i));
	end generate and_gate_assignment;
	sel(1) <= s(1);
	sel(0) <= s(0);
	demux14_0: demux14 port map(y => a_out0, sel => sel, y0 => y0, y1 => y1, y2 => y2, y3 => y3);
	demux14_1: demux14 port map(y => a_out1, sel => sel, y0 => y4, y1 => y5, y2 => y6, y3 => y7);
	
end rtl;
