library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity Store is 
   port(clk:in std-logique;
        operand : in std_logic_vector(11 downto 0);
 );
end Store;
  

architecture dataflow of load is
	component ram_16k is
		    port ( clk_ram, io_ram : in std_logic;
		           address_ram, ram_in : in std_logic_vector(15 downto 0);
		    	   ram_out : out  std_logic_vector(15 downto 0));
	end component;
       
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
 signal clk,sig_ioram, operande,zero,one, ac, writer;
begin
	ram: ram_16k port map (clk_ram => clk, io_ram=>sig_ioram, address_ram=>operand,ioram=>zero);
  reg: registers port map(clk_reg=>clk, reg_io=> one , reg=> ac ,reg_in=>writer  );  

  
end dataflow;

