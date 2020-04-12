
library IEEE;
use IEEE.std_logic_1164.all;


-- entity
entity problem2 is
port ( X1, X2, CLK : in std_logic;
        Y : out std_logic_vector(1 downto 0);
        Z : out std_logic);
end problem2;

architecture behavioral of problem2 is
type state_type is (ST0,ST1,ST2);
signal PS,NS : state_type;


begin
sync_proc: process(CLK,NS)
begin
if (rising_edge(CLK)) then
    PS <= NS;
end if;
end process sync_proc;

comb_proc: process(PS,X1,X2)
begin
    Z <= '0'; 
    case PS is
when ST0 => 
        if ( X1 = '0') then NS <= ST0; Z <= '0';
    else 
        NS <= ST2; Z <= '0';
    end if;
when ST1 => 
        if (X2 = '0') then  NS <= ST0; Z <= '1';
    else 
        NS <= ST1; Z <= '0';
    end if;
when ST2 => 
        if (X2 = '0') then  NS <= ST0; Z <= '1';
    else 
        NS <= ST1; Z <= '0';
    end if;
when others => Z <= '0'; NS <= ST0;
end case;
end process comb_proc;

with PS select
Y <= "10" when ST0,"01" when ST1,"11" when ST2,"10" when others;


end behavioral;
