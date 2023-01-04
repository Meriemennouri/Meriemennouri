library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity subtractor is
    port (
        as, bs: in std_logic_vector(15 downto 0);
        ress: out std_logic_vector(15 downto 0);
        cb: out std_logic
    );
end subtractor;
architecture dataflow of subtractor is
begin
    ress <= as - bs;
    cb <= '1' when conv_integer(as) < conv_integer(bs) else '0';
end dataflow;
