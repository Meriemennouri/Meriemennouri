library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity load is
    port (
        clk: in std_logic;
    	operand: in std_logic_vector(11 downto 0);
    );
end load;

architecture dataflow of load is
	component ram_16k is
		    port ( clk_ram, io_ram : in std_logic;
		           address_ram, ram_in : in std_logic_vector(15 downto 0);
		    	   ram_out : out  std_logic_vector(15 downto 0));
	end component;
	component registers is
		port (
			clk_reg : in std_logic;
		        reg_io : in  std_logic; -- 0 : read, 1 : write
           		reg : in  std_logic_vector(1 downto 0); -- 00 ac 01 ir 10 pc
           		reg_in : in std_logic_vector(15 downto 0);
           		reg_out : out std_logic_vector(15 downto 0););
	end component;
	component alu is 
		port (
		        clk_alu: in std_logic;
		        A, B: in std_logic_vector(15 downto 0);
        		op_alu: in std_logic; 
        		result_alu: out std_logic_vector (15 downto 0);
        		c_out: out std_logic 
		     );
	end component;
	signal 
begin
	ram: ram_16k port map (clk_ram => clk, io_ram=>sig_ioram, address_
end dataflow;

