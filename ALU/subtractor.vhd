library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity subtractor is
    port (
        a, b: in std_logic_vector(15 downto 0);
        res: out std_logic_vector(15 downto 0);
        c_out: out std_logic
    );
end subtractor;
architecture dataflow of subtractor is
begin
    res <= a + b;
    c_out <= '1' when conv_integer(a) > conv_integer(b) else '0';
end dataflow;
