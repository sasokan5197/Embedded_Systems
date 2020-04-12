library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity sender is

port( rst,clk,en,btn,ready : in std_logic;
send : out std_logic;
char : out std_logic_vector(7 downto 0));
end sender;

architecture Behavioral of sender is

type characters is array (0 to 5) of std_logic_vector(7 downto 0);
signal netID :characters := (x"73", x"61", x"31", x"31", x"37", x"34"); 
-- net id sa1174 in hex
type status_state is (idle, busyA, busyB, busyC);
signal state : status_state := idle;
signal i : std_logic_vector(2 downto 0) := (others => '0');


begin

    process(clk)
    begin
        if(rising_edge(clk))then  
        
if (en = '1') then 
if(rst = '1') then
            send <= '0';
            char <= (others => '0');
            i <= (others => '0');
            state <= idle;
end if;
        
case state is
when idle =>
    if(ready = '1' and btn = '1') then
    if(to_integer(unsigned(i)) < 6) then
                    send <= '1';
                    char <= netID(to_integer(unsigned(i)));
                    i <= std_logic_vector(unsigned(i) + 1);
                    state <= busyA;
    elsif(to_integer(unsigned(i)) = 6) then
                    i <= (others => '0');
                    state <= idle;
    end if;
    end if;
when busyA => state <= busyB;
when busyB => send <= '0';state <= busyC;
when busyC =>
    if(ready = '1' and btn = '0') then
    state <= idle;
                else
    state <= busyC;
end if;
   
   
          
when others => state <= idle;
end case;
end if;
end if;
end process;



end Behavioral;


   



