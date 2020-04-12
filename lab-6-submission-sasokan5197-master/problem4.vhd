library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity problem4 is
  Port (
        X1, X2,CLK,INIT: in std_logic;
        Z1, Z2: out std_logic);
end problem4;

architecture behavioral of problem4 is
type state is (ST0,ST1,ST2);
signal PS, NS: state;

begin
sync_process: process(CLK,NS,INIT)
    begin
        if INIT = '1' then
            PS <= ST0;
        elsif rising_edge(CLK) then
            PS <= NS;
        end if;
end process sync_process;
    
comb_process: process(PS,X1,X2)
begin
    Z1 <= '0';
    Z2 <= '0';
    case PS is
when ST0 =>  Z1<= '0';
            if X1 = '0' then  Z2 <= '0';  NS <= ST2;
            else
                Z2 <= '1'; NS <= ST1;
            end if;
when ST1 =>   Z1 <= '1';
            if X2 = '0' then Z2 <= '1'; NS <= ST2;
            else
                Z2 <= '0';NS <= ST0;
            end if;
when ST2 => Z1 <= '1';
            if X1 = '0' then Z2 <= '1'; NS <= ST0;
            else
                Z2 <= '1'; NS <= ST1;
            end if;
when others => Z1 <= '0';Z2 <= '0';NS <= ST0;
end case;
end process comb_process;
end behavioral;