

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity alu_tester is
Port( clk: in std_logic;
btn,sw : in std_logic_vector(3 downto 0);
led : out std_logic_vector(3 downto 0));
end alu_tester;

architecture Behavioral of alu_tester is
component button
Port( btn,clk: in std_logic;
dbnc: out std_logic);
end component;

component my_alu
Port( clk :in std_logic;
A,B,opcode :in  std_logic_vector( 3 downto 0 );
output :out  std_logic_vector( 3 downto 0));
end component;

signal but1,but2,but3,but4 :  std_logic;
signal A_1,B_1,Opcode1 : std_logic_vector( 3 downto 0);
signal clockout : std_logic_vector(3 downto 0);






begin
b0: button port map(clk => clk,btn => btn(0),dbnc => but1);
b1: button port map(clk => clk,btn => btn(1),dbnc => but2);
b2: button port map(clk => clk,btn => btn(2),dbnc => but3);
b3: button port map(clk => clk, btn => btn(3),dbnc => but4);   
alu: my_alu port map(clk => clk,A => A_1,B => B_1,opcode => opcode1,output => led);




process(clk)
begin
if rising_edge(clk) then
        if but1 = '1' then a_1 <= sw;
        elsif but2 = '1' then B_1 <= sw;
        elsif but3 = '1' then Opcode1 <= sw;
        elsif but4 = '1' then
            a_1 <= (others => '0');
            B_1 <= (others => '0');
            Opcode1 <= (others => '0');
    end if;
    end if;

end process;
 
end Behavioral;
