
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fancy_counter is
end fancy_counter;
 
 
 
 
 
 
architecture fancy_tb of fancy_counter is
component fancy_counter
    port(
        clk, clk_en, dir, en, ld, rst, updn: in std_logic;
        val : in std_logic_vector(3 downto 0);
        CNT: out std_logic_vector(3 downto 0));
end component;
 
 
 
 
 
signal tb_clk: std_logic := '0';
signal  tb_en, dir, en, ld, rst, updn : std_logic := '0';
signal val, CNT : std_logic_vector(3 downto 0);
 
begin
    clk: process
    begin
        wait for 4 ns;
        tb_clk <= '1';      
        wait for 4 ns;
        tb_clk <= '0'; 
    end process clk;
    
    dut: fancy_counter port map ( clk => tb_clk, clk_en => tb_en, dir => dir, en => en, ld => ld, rst => rst, updn => updn, val=> val, CNT => CNT); 

 end fancy_tb;