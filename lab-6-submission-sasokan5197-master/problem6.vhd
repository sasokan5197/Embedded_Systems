library IEEE;
use IEEE.std_logic_1164.all;


entity problem6 is
port ( X, CLK : in std_logic;
       Z1, Z2 : out std_logic;
       Y : out std_logic_vector(1 downto 0));
end problem6;



architecture behavioral of problem6 is

type state_type is (ST0,ST1,ST2,ST3);
signal PS,NS : state_type;


begin
sync_proc: process(CLK,NS)
begin
if (rising_edge(CLK)) then
    PS <= NS;
end if;
end process sync_proc;

comb_proc: process(PS,X)
begin
Z1 <= '0'; 
Z2 <= '0';
case PS is
when ST0 => Z1 <= '1';
if ( X = '0') then NS <= ST3; Z2 <= '0';
        else 
             NS <= ST0;  Z2 <= '0';
        end if;
when ST1 => Z1 <= '0'; 
if (X = '0') then NS <= ST2; Z2 <= '0';
        else 
            NS <= ST1; Z2 <= '0';
        end if;
when ST2 => Z1 <= '1'; 
if (X = '0') then NS <= ST0; Z2 <= '0';
        else 
             NS <= ST1;Z2 <= '0';
        end if;
when ST3 => Z1 <= '0'; 
if (X = '0') then  NS <= ST1;Z2 <= '1';
        else 
              NS <= ST0; Z2 <= '0';
        end if;

when others => Z1 <= '0';Z2 <= '0'; NS <= ST0;
end case;
end process comb_proc;

with PS select
Y <= "00" when ST0,"01" when ST1,"11" when ST2,"10" when ST3,"00" when others;

end behavioral;
