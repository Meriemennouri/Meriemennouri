library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity regram is
    port (
        clk, exec, io: in std_logic; --0 : on lit dans la ram, 1 : on lit dans un registre
    	select_reg : in std_logic_vector(1 downto 0);
    	operand: in std_logic_vector(11 downto 0)
    );
end regram;

architecture behavioral of regram is
	component ram_16k is
		    port ( clk_ram, io_ram : in std_logic;
		           address_ram, ram_in : in std_logic_vector(15 downto 0);
		    	   ram_out : out  std_logic_vector(15 downto 0));
	end component;
	component registers is
		port (
			clk_reg, reg_io : in std_logic;
           		reg : in  std_logic_vector(1 downto 0); -- 00 ac 01 ir 10 pc
           		reg_in : in std_logic_vector(15 downto 0);
           		reg_out : out std_logic_vector(15 downto 0));
	end component;
	signal op_ram, op_reg : std_logic;
	signal readed, to_write : std_logic_vector(15 downto 0);
	signal s_reg : std_logic_vector(1 downto 0);
begin
	ram: ram_16k port map (clk_ram => clk, address_ram => operand, io_ram => op_ram, ram_out => readed, ram_in => to_write);
	reg: registers port map (clk_reg => clk, reg_io => op_reg, reg => s_reg, reg_in => readed, reg_out => to_write);

	process(clk, exec)
	begin
		if clk'event and exec='1' then
			op_ram <= io;
			op_reg <= not io;
			s_reg <= select_reg;
		else
			op_ram <= '0';
			op_reg <= '0';
			s_reg <= "00";
		end if;
	end process;

end behavioral;

