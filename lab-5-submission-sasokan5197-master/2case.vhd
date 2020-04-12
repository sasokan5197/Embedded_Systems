


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity problem2pt2 is
  Port (A_1, A_2, B_1, B_2, D_1 :   in std_logic;
        E_out                   :   out std_logic);
end problem2pt2;

architecture Behavioral of problem2pt2 is
signal output: std_logic_vector(4 downto 0);
begin
 output <= A_1 & A_2 & B_1 & B_2 & D_1;
 prob2: process(output)
 begin
 case(output) is
 when "11--" => E_out <= '1';
 when "--1-" => E_out <= '1';
 when "---1" => E_out <= '1';
 when others => E_out <= '0';
        
end case;
end process prob2;
end Behavioral;
