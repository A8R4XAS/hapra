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
--missing
END rtl;