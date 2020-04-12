library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counters_1 is
    port(clk :in std_logic;
         output : out std_logic);
end counters_1;

architecture countb of counters_1 is
    signal count: std_logic_vector(25 downto 0):=(others => '0');
     
begin
    process (clk)
    begin
        if rising_edge(clk) then count <= std_logic_vector(unsigned(count) +1);
          
          if(count ="11101110011010110010100000") then
           output <= '1';
           count <= (others => '0');
           
           else
           output <= '0';
           
           end if;
           end if;
           end process; 

end countb;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity button is
    port(btn,clk :in std_logic;
         output : out std_logic);
end button;

architecture archi of button is
    signal count: std_logic_vector(25 downto 0):=(others => '0');
     
begin
    process (clk)
    begin
        if rising_edge(clk) then 
            if(btn = '1') then
          
          if(count ="1001100010010110100000") then
           output <= '1';
           count <= (others => '0');
           
           else
           output <= '0';
           
           end if;
           end if;
           end if;
           end process; 

end archi;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fancy is
    port(clk, clk_en,dir,en,ld,rst,updn : in std_logic;
        val: in std_logic_vector(3 downto 0);
         cnt : inout std_logic_vector(3 downto 0));
end fancy;

architecture archi of fancy is
    signal tmp: std_logic;


begin
        process(clk)
        begin
    if (en = '1') then
    if(rising_edge(clk)) then
    if (rst = '0') then
    if (clk_en = '1') then
    if (updn ='1') then
    tmp <= dir;
        end if;
    if (ld = '1') then
    CNT <= val;
        else if (tmp = '1') then
    if (CNT = val) then
    CNT <= "0000";
        else
    CNT <= std_logic_vector (unsigned(cnt) + 1);
        end if;
        else if( tmp = '0') then
    if (CNT = "0000") then
    CNT <= val;
        else
    CNT <= std_logic_vector (unsigned(cnt) - 1);
                            end if;
                            end if;
                            end if;
                            end if;
                            end if;
                    else if (rst = '1') then
                    cnt <= "0000";
                    if (clk_en = '1') then
                    if (updn = '1') then
                    tmp <= dir;
                        end if;
                        end if;
                        end if;
                        end if;
                        end if;
                        end if;
                        end process;
    end archi;
    
 library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;
   
   entity counter_top is
      Port ( 
            btn: in std_logic_vector(3 downto 0);
            clk: in std_logic;
            sw: in std_logic_vector(3 downto 0);
            led: inout std_logic_vector(3 downto 0));
    end counter_top;
    
    architecture archi of counter_top is
    component counters_1
        port(clk : in std_logic;
        output : out std_logic);
    end component;
    component button
        Port ( btn: in std_logic;
            clk: in std_logic;
            output: out std_logic);
    end component;
    component fancy
        port (
        clk, clk_en, dir, en, ld, rst, updn: in std_logic;
            val : in std_logic_vector(3 downto 0);
            cnt: inout std_logic_vector(3 downto 0));
    end component;
    
    
    
    signal but1, but2, but3, but4, clockout : std_logic;
    begin
    u1: button port map( btn => btn(0),clk => clk,output => but1);
    u2: button port map( btn => btn(1),clk => clk,output => but2);
    u3: button port map( btn => btn(2), clk => clk, output => but3);
    u4: button port map(  btn => btn(3),  clk => clk,  output => but4);
    u5: counters_1 port map(  clk => clk,  output => clockout);
    u6: fancy port map(  clk => clk,  clk_en => clockout,  dir => sw(0), rst => but1, en => but2,updn => but3,ld => but4,val => sw, cnt => led);
    
    end archi; 
    
    
    
    
    
    
    
    
    
    
    
    
    
