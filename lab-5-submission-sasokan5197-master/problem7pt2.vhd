


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity problem7case is
 Port (SEL         :   in std_logic_vector(2 downto 0);
output     :   out std_logic_vector(7 downto 0) );
end problem7case;

architecture Behavioral of problem7case is
begin
mux :process(SEL) is
begin
case (SEL) is
when "111" => output <= "01111111";
when "110" => output <= "10111111";
when "101" => output <= "11011111";
when "100" => output <= "11101111";
when "011" => output <= "11110111";
when "010" => output <= "11111011";
when "001" => output <= "11111101";
when "000" => output <= "11111110";
when others => output <= "11111111";
end case;
end process mux;

end Behavioral;