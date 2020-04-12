

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ripple_adder is
Port (A, B: in std_logic_vector(3 downto 0);
C_in: in std_logic;
S: out std_logic_vector(3 downto 0);
C_output: out std_logic);
end ripple_adder;

architecture Behavioral of ripple_adder is

component adder is
Port (A, B, C_in : in std_logic;
S, C_out: out std_logic);
end component;

signal A1,A2,A3: std_logic;
 
begin
Adder0: adder port map(A => A(0),B => B(0),C_in => C_in,C_out => A1, S => S(0));                
Adder1: adder port map(A => A(1),B => B(1),C_in => A1,C_out => A2,S => S(1));  
Adder2: adder port map(A => A(2),B => B(2),C_in => A2,C_out => A3,S => S(2));  
Adder3: adder port map(A => A(3),B => B(3),C_in => A3,C_out => C_output,S => S(3));  

end Behavioral;