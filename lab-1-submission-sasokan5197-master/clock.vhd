library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counters_1 is
    port(CLK :in std_logic;
         output : out std_logic);
end counters_1;

architecture CNT of counters_1 is
    signal count: std_logic_vector(25 downto 0):=(others => '0');
     
begin
    process (CLK)
    begin
        if rising_edge(CLK) then count <= std_logic_vector(unsigned(count) +1);
          
          if(count ="11101110011010110010100000") then
           output <= '1';
           count <= (others => '0');
           
           else
           output <= '0';
           
           end if;
           end if;
           end process; 

end CNT;