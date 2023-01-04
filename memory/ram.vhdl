library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity ram_16k is
    Port ( clk : in  std_logic;
           io : in  std_logic; -- 
           address : in  std_logic_vector(15 downto 0);
           din : in  std_logic_vector(15 downto 0);
           dout : out  std_logic_vector(15 downto 0));
end ram_16k;

architecture behavioral of ram_16k is
    type RAM_ARRAY is array (0 to 8191) of std_logic_vector(15 downto 0);
    signal ram : RAM_ARRAY;
begin

process(clk)
begin
    if rising_edge(clk) then
        if io = '1' then
            ram(conv_integer(address)) <= din;
        end if;
    end if;
end process;

dout <= ram(conv_integer(address));

end behavioral;
