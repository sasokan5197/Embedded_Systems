library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;



entity entire is
Port ( TXD,clk : in STD_LOGIC;
btn : in STD_LOGIC_VECTOR (1 downto 0);
RXD,CTS,RTS : out STD_LOGIC);
end entire;

architecture Structural of entire is
component uart_tx
port (en,clk,rst,rx,send : in std_logic;
charSend: in std_logic_vector (7 downto 0);
ready, tx, newChar: out std_logic;
charRec: out std_logic_vector (7 downto 0));
end component;
    
component debounce
Port ( clk : in STD_LOGIC;
btn : in STD_LOGIC;
dbnce : out STD_LOGIC);
end component;
    
component clockdivider
Port (clk : in STD_LOGIC;
output : out STD_LOGIC);
end component;
    
component sender
Port ( rst,clk,en,btn,ready : in STD_LOGIC;
send : out STD_LOGIC;
char : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal char: std_logic_vector(7 downto 0);    
signal reset, button: std_logic;
signal div, snd, ready : std_logic;
    
begin


u1: clockdivider
    port map(clk=> clk, output =>div);
    
u2:debounce
    port map(clk => clk,btn => btn(0),dbnce => reset);
    
u3:debounce
    port map(clk => clk,btn => btn(1),dbnce => button);
    
u4: sender
    port map(clk => clk,btn => button,en => div,ready => ready,rst => reset,send => snd,char => char);
    
u5: uart_tx
    port map(clk => clk,en => div,send => snd,rx => TXD,rst => reset,charSend => char,ready => ready, tx => RXD);
    
RTS <= '0'; CTS <= '0';   

    
end Structural;