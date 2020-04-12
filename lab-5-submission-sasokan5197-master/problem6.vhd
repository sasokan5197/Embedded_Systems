

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity problem6 is
 Port (Data_in      :   in std_logic_vector(7 downto 0);
SEL         :   in std_logic_vector(2 downto 0);
mux_output     :   out std_logic );
end problem6;

architecture Behavioral of problem6 is
begin
   mux: process(Data_in,SEL) is
    begin
if (SEL = "111") then mux_output <= Data_in(7);
elsif (SEL = "110") then mux_output <= Data_in(6);
elsif (SEL = "101") then mux_output <= Data_in(5);
elsif (SEL = "100") then mux_output <= Data_in(4);
elsif (SEL = "011") then mux_output <= Data_in(3);
elsif (SEL = "010") then mux_output <= Data_in(2);
elsif (SEL = "001") then mux_output <= Data_in(1);
elsif (SEL = "000") then mux_output <= Data_in(0);
else mux_output <= '0';
end if;
end process mux;
end Behavioral;