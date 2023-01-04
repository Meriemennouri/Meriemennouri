library ieee;
use ieee.std_logic_1164.all;

entity tb_alu is
end tb_alu;

architecture tb of tb_alu is

    component alu
        port (clk    : in std_logic;
              A      : in std_logic_vector (15 downto 0);
              B      : in std_logic_vector (15 downto 0);
              op     : in std_logic;
              result : out std_logic_vector (15 downto 0);
              c_out  : out std_logic);
    end component;

    signal clk    : std_logic;
    signal A      : std_logic_vector (15 downto 0);
    signal B      : std_logic_vector (15 downto 0);
    signal op     : std_logic;
    signal result : std_logic_vector (15 downto 0);
    signal c_out  : std_logic;

    constant TbPeriod : time := 1000 ns; 
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin
    dut : alu
    port map (clk    => clk,
              A      => A,
              B      => B,
              op     => op,
              result => result,
              c_out  => c_out);
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';
    clk <= TbClock;
    stimuli : process
    begin
        A <= (others => '0');
        B <= (others => '0');
        op <= '0';

        wait for 100 ns;

	A <= "0000000000000011";
	B <= "0000000000000010";
	op <= '0';
        -- EDIT Add stimuli here
        wait for 100 * TbPeriod;

        TbSimEnded <= '1';
        wait;
    end process;

end tb;

configuration cfg_tb_alu of tb_alu is
    for tb
    end for;
end cfg_tb_alu;
