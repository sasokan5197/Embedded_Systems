library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--entity declaration reg1
entity reg1 is
port(C,CE :in std_logic;
     Q : out std_logic);
end reg1;

--architecture declaration reg1
architecture register_arc of reg1 is
signal D : std_logic;

begin
reg_prc: process(C) 
    begin 
    if (rising_edge(C)) then
    if (D ='1') then
    Q <= CE;
end if;
end if;
end process reg_prc;
    end register_arc;    
    
--entity clock div
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counters_1 is
    port(CLK :in std_logic;
         output : out std_logic);
end counters_1;
--arch clock div
architecture CNT of counters_1 is
    signal count: std_logic_vector(25 downto 0):=(others => '0');
     
begin
    process (CLK)
    begin
        if rising_edge(CLK) then count <= std_logic_vector(unsigned(count) +1);
          
          if(count ="11101110011010110010100000") then
           output <= '1';
           count <= (others => '0');
           
           else
           output <= '0';
           
           end if;
           end if;
           end process; 

end CNT;

 
 --entity declaration for re circuit
library IEEE;
 use IEEE.STD_LOGIC_1164.ALL; 
entity entire is
port( C : in std_logic;
 Q: out std_logic);
end entire;

architecture entire_circuit of entire is

-- component declaration for seperate parts
component reg1 is
port( C,CE :in std_logic;    
     Q : out std_logic);
end component;

component counters_1 is
port(CLK :in std_logic;
output : out std_logic);
    
end component;


signal d: std_logic;
signal CE: std_logic;

begin
  U1: counters_1
  port map (output => CE,
          CLK => C);
          
  led_reg: process(C)
              begin
              if(rising_edge(C)) then
              if (CE ='1') then
                 Q <= not(d);
                 end if;
                 end if;
                 end process;
                 
Q <= d;

end entire_circuit;




