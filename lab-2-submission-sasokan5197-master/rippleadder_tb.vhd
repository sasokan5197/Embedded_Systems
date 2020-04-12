

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ripple_addertb is
end ripple_addertb;

architecture Behavioral of ripple_addertb is
    signal C_intb      : std_logic;
    signal A_tb, B_tb   : std_logic_vector(3 downto 0);
    signal C_outb     : std_logic;
    signal S_tb         : std_logic_vector(3 downto 0);
    
    component ripple_adder
    Port (A, B: in std_logic_vector(3 downto 0);
    C_in: in std_logic;
    S: out std_logic_vector(3 downto 0);
    C_output: out std_logic);
    
    end component;
    
    
    begin
        rippleadder: ripple_adder port map (A=>A_tb, B=>B_tb, S=>S_tb, C_in=>C_intb, C_output=>C_outb);
        process begin
            A_tb <= "0010";
            C_intb <= '1';
            wait for 20 ms;
            B_tb <= "1011";
            wait for 20 ms;
            B_tb <= "0011";
            C_intb <= '0';
            wait for 20 ms;
            A_tb <= "1001";
            C_intb <= '1';
            wait for 20 ms;
            B_tb<="1100";
        end process;
    end Behavioral;
    
    
    
