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
            sel : IN std_logic_vector(1 DOWNTO 0); 
            y : OUT std_logic_vector(2 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT andgate_2 IS
        PORT (
              input1     : IN std_logic;
              input2     : IN std_logic;
              and_2_result : OUT std_logic
        );
    END COMPONENT;

    
    COMPONENT orgate_2 is
        PORT (
              input1    : IN std_logic;
              input2    : IN std_logic;
              or_2_result : OUT std_logic
        );
    END COMPONENT;


    COMPONENT notgate is
        PORT (
              input1     : IN std_logic;
              not_result : OUT std_logic
        );
    END COMPONENT;

    --signals
    signal not_sel2 : std_logic;
    signal sel41    : std_logic_vector(1 DOWNTO 0);

    signal mux_out1 : std_logic_vector(2 DOWNTO 0);
    signal mux_out2 : std_logic_vector(2 DOWNTO 0);

    signal and_out1 : std_logic_vector(2 DOWNTO 0);
    signal and_out2 : std_logic_vector(2 DOWNTO 0);
    signal or_out   : std_logic_vector(2 DOWNTO 0);

BEGIN

    sel41(0) <= sel_81(0);
    sel41(1) <= sel_81(1);

    tmp : notgate port map(input1 => sel_81(2), not_result => not_sel2);

    mux_output1 : mux41 port map(i1 => i1_81, i2 => i2_81, i3 => i3_81, i4 => i4_81, sel => sel41, y => mux_out1);

    mux_output2 : mux41 port map(i1 => i5_81, i2 => i6_81, i3 => i7_81, i4 => i8_81, sel => sel41, y => mux_out2);

    and_or_gate_assignment : for i in 0 to 2 generate

        and_output1 : andgate_2 port map (input1 => mux_out1(i), input2 => not_sel2,  and_2_result => and_out1(i));
        and_output2 : andgate_2 port map (input1 => mux_out2(i), input2 => sel_81(2), and_2_result => and_out2(i));

        or_output : orgate_2 port map (input1 => and_out1(i), input2 => and_out2(i), or_2_result => or_out(i));

    end generate and_or_gate_assignment;
    
    y_81 <= or_out;

END rtl;