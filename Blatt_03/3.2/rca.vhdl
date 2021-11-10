library ieee;
use ieee.std_logic_1164.all;

entity rca is
  port (
    a : in std_logic_vector(7 downto 0);
    b : in std_logic_vector(7 downto 0);
    cin : in std_logic;
    cout : out std_logic;
    sum : out std_logic_vector(7 downto 0)
  );
end rca;

architecture rtl of rca is
  component fa
    port (
      a : in std_logic;
      b : in std_logic;
      cin : in std_logic;
      cout : out std_logic;
      sum : out std_logic
    );
  end component;
  signal wire_1 : std_logic;
  signal wire_2 : std_logic;
  signal wire_3 : std_logic;
  signal wire_4 : std_logic;
  signal wire_5 : std_logic;
  signal wire_6 : std_logic;
  signal wire_7 : std_logic;
  signal wire_8 : std_logic;
  signal a1,b1:std_logic_vector(8 downto 0);
  signal overflow : std_logic;
begin
  process (cin)
    begin
    -- Subtraktion, mithilfe Zweierkomplement
    if (cin = '1') then
      b1(0) <= not b(0);
      b1(1) <= not b(1);
      b1(2) <= not b(2);
      b1(3) <= not b(3);
      b1(4) <= not b(4);
      b1(5) <= not b(5);
      b1(6) <= not b(6);
      b1(7) <= not b(7);
    else
    -- Addition
     b1(0) <= b(0);
     b1(1) <= b(1);
     b1(2) <= b(2);
     b1(3) <= b(3);
     b1(4) <= b(4);
     b1(5) <= b(5);
     b1(6) <= b(6);
     b1(7) <= b(7);
    end if;
  end process;
  add0 : fa port map(a => a(0), b => b1(0), cin => cin, cout => wire_1, sum => sum(0));
  add1 : fa port map(a => a(1), b => b1(1), cin => wire_1, cout => wire_2, sum => sum(1));
  add2 : fa port map(a => a(2), b => b1(2), cin => wire_2, cout => wire_3, sum => sum(2));
  add3 : fa port map(a => a(3), b => b1(3), cin => wire_3, cout => wire_4, sum => sum(3));
  add4 : fa port map(a => a(4), b => b1(4), cin => wire_4, cout => wire_5, sum => sum(4));
  add5 : fa port map(a => a(5), b => b1(5), cin => wire_5, cout => wire_6, sum => sum(5));
  add6 : fa port map(a => a(6), b => b1(6), cin => wire_6, cout => wire_7, sum => sum(6));
  add7 : fa port map(a => a(7), b => b1(7), cin => wire_7, sum => sum(7));
  
  process (cin)
    begin
    if(cin = '1') then
      -- wegen Zweierkomplement gibt es overflow, das Ergebnis ist falsch, dann overflow weglassen.
      cout <= '0';
    else
      cout <= (a(7) and b(7)) or (wire_7 and (a(7) xor b(7))) ;
    end if;
  end process;
end rtl;
