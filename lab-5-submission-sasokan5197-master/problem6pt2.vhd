

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity problem6case is
 Port (Data_in      :   in std_logic_vector(7 downto 0);
SEL         :   in std_logic_vector(2 downto 0);
mux_output     :   out std_logic );
end problem6case;

architecture Behavioral of problem6case is

begin
    mux: process(data_in, sel) is
    begin
case(SEL) is
when "111" => mux_output <= Data_in(7);
when "110" => mux_output <= Data_in(6);
when "101" => mux_output <= Data_in(5);
when "100" => mux_output <= Data_in(4);
when "011" => mux_output <= Data_in(3);
when "010" => mux_output <= Data_in(2);
when "001" => mux_output <= Data_in(1);
when "000" => mux_output <= Data_in(0);
when others => mux_output <= '0';
end case;
end process mux;
end Behavioral;