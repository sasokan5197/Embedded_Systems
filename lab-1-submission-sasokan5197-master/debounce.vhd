library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity button is
    port(btn,CLK :in std_logic;
         output : out std_logic);
end button;

architecture CNT of button is
    signal count: std_logic_vector(25 downto 0):=(others => '0');
     
begin
    process (CLK)
    begin
        if rising_edge(CLK) then 
            if(btn = '1') then
          
          if(count ="1001100010010110100000") then
           output <= '1';
           count <= (others => '0');
           
           else
           output <= '0';
           
           end if;
           end if;
           end if;
           end process; 

end CNT;