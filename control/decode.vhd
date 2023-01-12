library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity decodeur is
generic (
n : positive := 3; -- nombre de signaux d'entrée
valeurActive : std_logic := '1'
);
port(
A : in std_logic_vector(n - 1 downto 0);
F: out std_logic_vector(2 ** n - 1 downto 0)
);
end decodeur;
architecture comportementale of decodeur is
begin
process(A)
begin
F <= (others => not(valeurActive));
F(to_integer(unsigned(A))) <= valeurActive;
end process;
end comportementale;
