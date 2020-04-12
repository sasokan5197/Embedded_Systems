
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity problem3 is
Port(A_1,A_2,B_1,B_2,D_1: in std_logic;
E_out: out std_logic);
end problem3;

architecture Behavioral of problem3 is

begin
E_out <=(A_1 and A_2) or (B_1 and B_2) or (B_2 and not(D_1));

end Behavioral;
