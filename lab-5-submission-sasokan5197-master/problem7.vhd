

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity problem7 is
 Port (SEL         :   in std_logic_vector(2 downto 0);
output     :   out std_logic_vector(7 downto 0) );
end problem7;

architecture Behavioral of problem7 is
begin
   decoder: process(SEL) is
    begin
if (SEL = "111") then output <= "01111111";
elsif (SEL = "110") then output <= "10111111";
elsif (SEL = "101") then output <= "11011111";
elsif (SEL = "100") then output <= "11101111";
elsif (SEL = "011") then output <= "11110111";
elsif (SEL = "010") then output <= "11111011";
elsif (SEL = "001") then output <= "11111101";
elsif (SEL = "000") then output <= "11111110";
else output <= "11111111";
end if;
    end process decoder;
end Behavioral;