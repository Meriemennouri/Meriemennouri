-- dans la partie déclarative de l’architecture
type memoireDonnees_type is array(0 to 2 ** Md - 1) of signed(Wd - 1 downto 0);
signal memoireDonnees : memoireDonnees_type;
signal sortieMemoireDonnees : signed(Wd - 1 downto 0);
signal adresseMemoireDonnees : integer range 0 to 2 ** Md - 1;
signal lectureEcritureN : std_logic;
-- dans le corps de l’architecture
-- mémoire des données
process (CLK)
begin
if rising_edge(CLK) then
if lectureEcritureN = '0' then
memoireDonnees(adresseMemoireDonnees) <= B;
end if;
end if;
end process;
sortieMemoireDonnees <= memoireDonnees(adresseMemoireDonnees);
