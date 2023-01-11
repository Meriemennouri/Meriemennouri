library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity store is
    port (
        clk1: in std_logic;
    	exec1 : in std_logic;
    	operand1: in std_logic_vector(11 downto 0)
    );
end store;

architecture structural of store is
	component regram is
		port (clk, exec, io: in std_logic;
		select_reg : in std_logic_vector(1 downto 0);
		operand: in std_logic_vector(11 downto 0)
	);
	end component;
begin
	interface: regram port map (clk => clk1, exec => exec1, io => '1', select_reg => "00", operand => operand1);
end structural;

