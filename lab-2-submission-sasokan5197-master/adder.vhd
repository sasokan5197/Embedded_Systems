
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder is
Port (A, B, C_in : in std_logic;
 S, C_out: out std_logic);
end adder;

architecture Behavioral of adder is

begin

S <= C_in xor (A xor B); C_out <= (C_in and (A xor B)) or (A and B);

end Behavioral;