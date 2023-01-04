library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity adder is
    port (
        aa, ba: in std_logic_vector(15 downto 0);
        sum: out std_logic_vector(15 downto 0);
        ca: out std_logic
    );
end adder;

architecture dataflow of adder is
begin
    sum <= aa + ba;
    ca <= '1' when aa+ba > 65535 else '0';
end dataflow;

