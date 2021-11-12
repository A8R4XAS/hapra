library ieee;
use ieee.std_logic_1164.all;

entity demux14_tb is
end demux14_tb;

architecture testbench of demux14_tb is
    component demux14 
        port (
            y0 : IN std_logic_vector(2 DOWNTO 0); 
            sel : IN std_logic_vector(1 DOWNTO 0); 
            i0 : OUT std_logic_vector(2 DOWNTO 0);
            i1 : OUT std_logic_vector(2 DOWNTO 0);
            i2 : OUT std_logic_vector(2 DOWNTO 0);
            i3 : OUT std_logic_vector(2 DOWNTO 0)
        );
    end component;

    signal y0, i0, i1, i2, i3 : std_logic_vector(2 DOWNTO 0);
    signal sel : std_logic_vector(1 DOWNTO 0);

    begin
        demultiplex: demux14 port map (
            y0  => y0,
            sel => sel,
            i0  => i0,
            i1  => i1,
            i2  => i2,
            i3  => i3
        );

        process begin
            y0 <= "111";

            sel <= "00";
            wait for 10 ns;
            sel <= "01";
            wait for 10 ns;
            sel <= "10";
            wait for 10 ns;
            sel <= "11";
            wait for 10 ns;
            wait;
        end process;

end testbench;