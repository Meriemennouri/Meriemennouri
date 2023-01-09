library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity store is
    port (
        clk: in std_logic;
    	exec : in std_logic;
    	operand: in std_logic_vector(11 downto 0)
    );
end store;

architecture behavioral of store is
	component ram_16k is
		    port ( clk_ram, io_ram : in std_logic;
		           address_ram, ram_in : in std_logic_vector(15 downto 0);
		    	   ram_out : out  std_logic_vector(15 downto 0));
	end component;
	component registers is
		port (
			clk_reg : in std_logic;
		        reg_io : in  std_logic; -- 1: read, 0 : write
           		reg : in  std_logic_vector(1 downto 0); -- 00 ac 01 ir 10 pc
           		reg_in : in std_logic_vector(15 downto 0);
           		reg_out : out std_logic_vector(15 downto 0));
	end component;
	signal read_ram, write_reg : std_logic;
	signal writer, readed_sig, df : std_logic_vector(15 downto 0);
	signal ac : std_logic_vector(1 downto 0);
begin
	ram: ram_16k port map (clk_ram => clk, address_ram => operand, io_ram => read_ram, ram_out => writer, ram_in => df);
	reg: registers port map (clk_reg => clk, reg_io => write_reg, reg => ac, reg_in => readed, reg_out => df);
	process(clk)
	begin
		if clk'event and exec = '1' then
			read_ram <= '1';
			write_reg <= '0';
		elsif clk'event and exec = '0' then
			write_reg <= '0';
		end if;
	end process;
end behavioral;


