

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity my_alu is
Port( clk :in std_logic;
A,B,opcode :in  std_logic_vector( 3 downto 0 );
output :out  std_logic_vector( 3 downto 0));
end my_alu;


architecture Behavioral of my_alu is
begin
alu : process(clk)
begin
    if rising_edge(clk) then
        case Opcode is
when "0000" => output <= std_logic_vector(unsigned(A) + unsigned(B));
when "0001" => output <= std_logic_vector(unsigned(A) - unsigned(B));
when "0010" => output <= std_logic_vector(unsigned(A) + 1);
when "0011" => output <= std_logic_vector(unsigned(A) - 1);
when "0100" => output <= std_logic_vector(0 - unsigned(A));
           
when "0101" => if (A > B) then
    output <= "0001";
    else
    output <= "0000";
    end if;
                            
                                                     
when "0110" => output <= A(2 downto 0) & '0';
when "0111" => output <= '0' & A(3 downto 1);
when "1000" => output <= A(3) & A(3 downto 1);
when "1001" => output <= not(A);
when "1010" => output <= A and B;
when "1011" => output <= A or B;
when "1100" => output <= A xor B;
when "1101" => output <= A xnor B;
when "1110" => output <= A nand B;
when "1111" => output <= A nor B;
when others => output <= (others => '0');
end case;
end if;
end process alu;







end Behavioral;
