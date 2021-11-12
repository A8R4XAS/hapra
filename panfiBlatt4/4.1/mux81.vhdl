LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY mux81 IS
    PORT (
        i1_81 : IN std_logic_vector(2 DOWNTO 0); 
        i2_81 : IN std_logic_vector(2 DOWNTO 0);
        i3_81 : IN std_logic_vector(2 DOWNTO 0);
        i4_81 : IN std_logic_vector(2 DOWNTO 0);
        i5_81 : IN std_logic_vector(2 DOWNTO 0);
        i6_81 : IN std_logic_vector(2 DOWNTO 0);
        i7_81 : IN std_logic_vector(2 DOWNTO 0);
        i8_81 : IN std_logic_vector(2 DOWNTO 0);
        sel_81 : IN std_logic_vector(2 DOWNTO 0); 
        y_81 : OUT std_logic_vector(2 DOWNTO 0));
END mux81;

ARCHITECTURE rtl OF mux81 IS

    COMPONENT mux41 IS
        PORT (
            i1 : IN std_logic_vector(2 DOWNTO 0); 
            i2 : IN std_logic_vector(2 DOWNTO 0);
            i3 : IN std_logic_vector(2 DOWNTO 0);
            i4 : IN std_logic_vector(2 DOWNTO 0);
            sel: IN std_logic_vector(1 DOWNTO 0); 
            y : OUT std_logic_vector(2 DOWNTO 0)
        );
    END COMPONENT;
      COMPONENT notgate IS
		PORT(
			input : in std_logic;
			not_result : out std_logic
		  );
    END COMPONENT;
     COMPONENT orgate IS
        port (
			input1 : in std_logic;
			input2 : in std_logic;
			or_result : out std_logic
		  );
	END COMPONENT;
	   COMPONENT andgate IS
        PORT (input1 : IN std_logic;
            input2 : IN std_logic;
			and_result: OUT std_logic);
    END COMPONENT;
	signal y_Mux0: std_logic_vector(2 DOWNTO 0);
	signal y_Mux1: std_logic_vector(2 DOWNTO 0);
	
	signal sel_Mux: std_logic_vector(1 DOWNTO 0);

	
	signal a_out0:  std_logic_vector(2 DOWNTO 0);
	signal a_out1:  std_logic_vector(2 DOWNTO 0);
	
	signal or_out:  std_logic_vector(2 DOWNTO 0);
	
	signal sel_2_neg: std_logic;
begin
	sel_Mux(0) <= sel_81(0);
	sel_Mux(1) <= sel_81(1);
	
	
	mux41_0: mux41 port map(i1 => i1_81, i2 => i2_81, i3 => i3_81, i4 => i4_81, sel => sel_Mux, y => y_Mux0);
	mux41_1: mux41 port map(i1 => i5_81, i2 => i6_81, i3 => i7_81, i4 => i8_81, sel => sel_Mux, y => y_Mux1);
	
	not_output0: notgate port map(input => sel_81(2), not_result => sel_2_neg);
		
	and_gate_assignment : for i in 0 to 2 generate
		and_output0: andgate port map(input1 => y_Mux0(i), input2 => sel_2_neg, and_result => a_out0(i));
		and_output1: andgate port map(input1 => y_Mux1(i), input2 => sel_81(2), and_result => a_out1(i));
	end generate and_gate_assignment;

   or_gate_assignment : for i in 0 to 2 generate
		or_output: orgate port map(input1 => a_out0(i), input2 => a_out1(i), or_result  => or_out(i));
   end generate or_gate_assignment;
   
   y_81 <= or_out;

end rtl; 
