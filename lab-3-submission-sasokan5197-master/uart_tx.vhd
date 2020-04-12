library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;




entity uart_tx is
    Port ( clk,en,send,rst : in STD_LOGIC;
           char : in STD_LOGIC_VECTOR (7 downto 0);
           ready,tx : out STD_LOGIC);  
end uart_tx;

architecture Behavioral of uart_tx is
type status_state is (idle,start,data);
signal current : status_state := idle;
signal D: std_logic_vector(7 downto 0):=(others => '0');
signal count : std_logic_vector(3 downto 0);


begin
FSM: process(clk)

begin
if(rising_edge(clk)) then
if(rst='1') then
D <=(others => '0');
ready<= '1';
tx<='1';
current<= idle;


elsif( en = '1') then
case current is
when idle =>
tx <='1';
ready <='1';
    if send ='1' then
    current <= start;
    end if;
 
when start =>
ready <= '0';
tx <='0';
current <= data;

when data =>
       if unsigned(count) < 8 then
          tx <= d(to_integer(unsigned(count)));    
          count <= std_logic_vector(unsigned(count) + 1);             
          current <= data;
else
           ready <= '1';
           current <= idle;
           count <= "0";
           tx <= '1';

       end if;
end case;
end if;
end if;
end process;    
end Behavioral;