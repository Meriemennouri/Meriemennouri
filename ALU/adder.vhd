library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity adder is
    port (
        a, b: in std_logic_vector(15 downto 0);
        res : out std_logic_vector(15 downto 0);
        c_out: out std_logic
    );
end adder;

architecture dataflow of adder is
begin
    res <= a + b;
    c_out <= '1' when res(15) = '1' else '0';
end dataflow;

