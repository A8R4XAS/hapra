library ieee;
use ieee.std_logic_1164.all;

entity mux81_tb is
end mux81_tb;

architecture testbench of mux81_tb is
  component mux81
    port (--missing);
  end component;

--missing

begin
    multiplex: mux81 port map(--missing);

    process begin
        sel_81 <= "000";
        wait for 10 ns;
        sel_81 <= "010";
        wait for 10 ns;
        sel_81 <= "001";
        wait for 10 ns;
        sel_81 <= "011";
        wait for 10 ns;
        sel_81 <= "100";
        wait for 10 ns;
        sel_81 <= "110";
        wait for 10 ns;
        sel_81 <= "101";
        wait for 10 ns;
        sel_81 <= "111";
        wait for 10 ns;
        wait;
    end process;
end testbench;