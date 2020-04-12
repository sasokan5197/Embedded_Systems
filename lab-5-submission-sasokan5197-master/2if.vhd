----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2019 02:22:45 PM
-- Design Name: 
-- Module Name: 2if - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity problem2 is
Port(A_1,A_2,B_1,B_2,D_1 : in std_logic;
     E_out   : out std_logic);
end problem2;

architecture Behavioral of problem2 is
begin 
proc1: process(A_1,A_2,B_1,B_2,D_1) 
   
begin
if( A_1='1' and A_2='1') or (B_1='1' or B_2='1') or (B_2='1' AND NOT (D_1)='1') THEN
E_out <='1';
else
E_out<='0';
end if;
end process proc1;


end Behavioral;
