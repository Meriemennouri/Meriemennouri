library ieee;
use ieee.std_logic_1164.all;
entity decodeur38 is
port(
A : in std_logic_vector(3 downto 0);
F: out std_logic_vector(11 downto 0)
);
end decodeur4_12;
architecture flotDeDonnees of decodeur 4_12 is
begin
with A select F <=
"000000001" when "0000",
"000000010" when "0001",
"000000100" when "0010",
"000001000" when "0011",
"000010000" when "0100",
"000100000" when "0101",
"001000000" when "0110",
"010000000" when "0111",
"110000000" when "1111",
(others => 'X') when others;
end flotDeDonnees;

