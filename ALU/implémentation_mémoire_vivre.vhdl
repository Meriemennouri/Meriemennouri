entity RAMregistres is
Port ( add_r : in STD_LOGIC;
add_w : in STD_LOGIC;
write_enable : in STD_LOGIC;
H: in STD_LOGIC;
reset : in STD_LOGIC;
data_w : in STD_LOGIC_VECTOR (15 downto 0);
data_r : out STD_LOGIC_VECTOR (15 downto 0));
end RAM_2registres;

architecture Behavioral of RAMregistres is

signal mem0 : std_logic_vector(15 downto 0);
signal mem1 : std_logic_vector(15 downto 0);

begin

process(H)

begin

if (H'event and H='1') then
if (reset='1') then
mem0<=x"0000";
mem1<=x"0000";
data_r<=x"0000";
else

--lecture
if (add_r='0') then data_r<=mem0;
else data_r<=mem1;
end if;

--ecriture
if (write_enable='1') then
if (add_w='0') then mem0<=data_w;
else mem1<=data_w;
end if;
end if;

end if;
end if;

end process;


end Behavioral;
