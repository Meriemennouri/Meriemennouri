library ieee;
use ieee.std_logic_1164.all;
entity decodeur38 is
port(
A : in std_logic_vector(3 downto 0);
F: out std_logic_vector(11 downto 0)
);
end decodeur38;
architecture flotDeDonnees of decodeur38 is
begin
with A select F <=
"00000001" when "000",
"00000010" when "001",
"00000100" when "010",
"00001000" when "011",
"00010000" when "100",
"00100000" when "101",
"01000000" when "110",
"10000000" when "111",
(others => 'X') when others;
end flotDeDonnees;

