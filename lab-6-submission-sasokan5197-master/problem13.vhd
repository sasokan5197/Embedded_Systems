library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity problem13 is
  Port ( X1, X2,CLK: in std_logic;
        CS, RD: out std_logic;
        Y: out std_logic_vector(2 downto 0));
end problem13;

architecture behavioral of problem13 is
type state is (S0,S1,S2);
signal PS,NS: state;

begin
sync_process: process(CLK,NS)
begin
    if rising_edge(CLK) then
        PS <= NS;
    end if;
end process sync_process;
    
comb_process: process(PS,X1,X2)
begin
CS <= '0';
RD <= '0';
Y <= (others => '0');
case PS is
when S0 =>
            if X1 = '0' then CS <= '0';RD <= '1';NS <= S1;
            else
            CS <= '1';RD <= '0';NS <= S2;
            end if;
when S1 => CS <= '1';RD <= '1'; NS <= S2;
when S2 =>
            if X2 = '0' then CS <= '0'; RD <= '0';NS <= S0;
            else
            CS <= '0';RD <= '1'; NS <= S2;
           end if;
when others =>
            CS <= '0';RD <= '0';NS <= S0;
end case;
end process comb_process;
    
with PS select
Y <= "001" when S0,"010" when S1,"100" when S2, "001" when others;    
            

end behavioral;