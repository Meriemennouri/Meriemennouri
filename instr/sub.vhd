library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity sub is
    port (
        clk1: in std_logic;
    	exec1 : in std_logic;
    	operand1: in std_logic_vector(11 downto 0)
    );
end sub;

architecture structural of sub is
	component ram_16k is
    	port ( clk : in  std_logic;
           io : in  std_logic; -- 0 : read, 1 : write 
           address : in  std_logic_vector(11 downto 0);
           ram_in : in  std_logic_vector(15 downto 0);
           ram_out : out  std_logic_vector(15 downto 0));
	end component;
	component registers is
    	port ( clk : in  std_logic;
           io : in  std_logic; -- 0 : read, 1 : write
           reg : in  std_logic_vector(1 downto 0); -- 00 ac 01 ir 10 pc
           reg_in : in std_logic_vector(15 downto 0);
           reg_out : out std_logic_vector(15 downto 0));
	end component;
	component alu is
        port (
	    clk: in std_logic;
            A, B: in std_logic_vector(15 downto 0);
	    op: in std_logic; --0=addition, 1=soustraction
	    result: out std_logic_vector (15 downto 0);
            c_out: out std_logic --retenue
        );
	end component;
	component store is
	    port (
        	clk: in std_logic;
        	exec : in std_logic;
        	operand: in std_logic_vector(11 downto 0)
    	);
        end component;
	signal to_add1, to_add2, to_store, df : std_logic_vector(15 downto 0);
	signal opreg, df_ : std_logic;
begin	
	ram : ram_16k port map (clk => clk1, io => '0', address=>operand1, ram_in=>df, ram_out=>to_add1);
	reg : registers port map (clk =>clk1, io => opreg, reg => "00", reg_in => to_store, reg_out =>to_add2);
	alu_ : alu port map (clk=>clk1, A => to_add1, B => to_add2, op => '1', result => to_store, c_out => df_);

	process(clk1, exec1)
	begin
		if clk1'event and exec1 = '1' then
			opreg <= '0';
			if clk1'event then
				opreg <= '1';
			end if;
		else
			opreg <= '0';
		end if;
	end process;
end structural;

