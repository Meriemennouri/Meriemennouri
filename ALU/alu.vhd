library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity alu is
    port (
        clk: in std_logic;
        A, B: in std_logic_vector(15 downto 0);
        op: in std_logic; --0=addition, 1=soustraction
    	result: out std_logic_vector (15 downto 0);
        c_out: out std_logic --retenue
    );
end alu;

architecture dataflow of alu is
	component adder is
		    port (
		    aa, ba: in std_logic_vector(15 downto 0);
		    sum: out std_logic_vector(15 downto 0);
		    ca: out std_logic
	    );
	end component;
	component subtractor is
		port (
        	as, bs: in std_logic_vector(15 downto 0);
        	ress : out std_logic_vector(15 downto 0);
        	cb: out std_logic
    	    );
	end component;

	signal add_a, add_b, sub_a, sub_b, add_r, sub_r : std_logic_vector(15 downto 0);
	signal carry_add, carry_sub : std_logic;
begin
    add: adder port map (aa => add_a, ba => add_b, ca => carry_add, sum => add_r);
    sub: subtractor port map (as => sub_a, bs => sub_b, cb => carry_sub, ress => sub_r);
    
    process(clk)
    begin
	    if clk'event and op = '0' then
		    add_a <= A; add_b <= B; c_out <= carry_add; result <= add_r;
	    elsif clk'event and op = '1' then
		    sub_a <= A; sub_b <= B; c_out <= carry_sub; result <= sub_r;
	    end if;
    end process;
end dataflow;

