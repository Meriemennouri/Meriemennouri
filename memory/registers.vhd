library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity registers is
    port ( clk : in  std_logic;
           io : in  std_logic; -- 0 : read, 1 : write
           reg : in  std_logic_vector(1 downto 0); -- 00 ac 01 ir 10 pc
           reg_in : in std_logic_vector(15 downto 0);
           reg_out : out std_logic_vector(15 downto 0));
end registers;
architecture behavioral of registers is
    type reg_array is array (0 to 2) of std_logic_vector(15 downto 0);
    signal regs : reg_array;
begin
process(clk)
begin
    if rising_edge(clk) then
        if io = '1' then
            regs(conv_integer(reg)) <= reg_in;
        end if;
    end if;
end process;
reg_out <= regs(conv_integer(reg));
end behavioral;
