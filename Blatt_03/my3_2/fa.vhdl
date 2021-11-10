library ieee;
use ieee.std_logic_1164.all;

entity fa is
  port (
    a     : in std_logic;
    b     : in std_logic;
    cin   : in std_logic;
    cout  : out std_logic;
    sum   : out std_logic
  );
end fa;

architecture rtl of fa is
  signal o1 : std_logic;
  signal c1 : std_logic;
  signal o2 : std_logic;
  signal c2 : std_logic;
begin
  --ha1
  o1 <= a xor b;
  c1 <= a and b;
  
  --ha2
  o2 <= cin xor o1;
  c2 <= cin and o1;

  cout  <= c1 or c2;
  sum   <= o2; 
end rtl;
