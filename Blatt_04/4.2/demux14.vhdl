LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY demux14 IS
    PORT (
        y0 : IN std_logic_vector(2 DOWNTO 0); 
        sel : IN std_logic_vector(1 DOWNTO 0); 
        i0 : OUT std_logic_vector(2 DOWNTO 0);
        i1 : OUT std_logic_vector(2 DOWNTO 0);
        i2 : OUT std_logic_vector(2 DOWNTO 0);
        i3 : OUT std_logic_vector(2 DOWNTO 0)
        );
END demux14;

ARCHITECTURE rtl OF demux14 IS

COMPONENT andgate IS
    PORT (
          input1     : IN std_logic; --s_0
          input2     : IN std_logic; --s_1
          input3     : IN std_logic; --e_n signal
          and_result : OUT std_logic
    );
END COMPONENT;

COMPONENT notgate is
    PORT (
          input1 : IN std_logic;
          not_result : OUT std_logic
    );
END COMPONENT;

    signal not_sel : std_logic_vector(1 DOWNTO 0);
    signal and_out1 : std_logic_vector(2 DOWNTO 0);
    signal and_out2 : std_logic_vector(2 DOWNTO 0);
    signal and_out3 : std_logic_vector(2 DOWNTO 0);
    signal and_out4 : std_logic_vector(2 DOWNTO 0);

BEGIN

    tmp1 : notgate port map(input1 => sel(0), not_result => not_sel(0));
    tmp2 : notgate port map(input1 => sel(1), not_result => not_sel(1));

    and_gate_assignment : for i in 0 to 2 generate

        and_output1: andgate port map (input1 => not_sel(0), input2 => not_sel(1), input3 => y0(i), and_result => and_out1(i));
        and_output2: andgate port map (input1 => not_sel(0), input2 =>     sel(1), input3 => y0(i), and_result => and_out2(i));
        and_output3: andgate port map (input1 =>     sel(0), input2 => not_sel(1), input3 => y0(i), and_result => and_out3(i));
        and_output4: andgate port map (input1 =>     sel(0), input2 =>     sel(1), input3 => y0(i), and_result => and_out4(i));

    end generate and_gate_assignment;

    i0 <= and_out1;
    i1 <= and_out2;
    i2 <= and_out3;
    i3 <= and_out4;

END rtl;