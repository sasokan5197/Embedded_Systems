
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fancy is
    port(clk, clk_en,dir,en,ld,rst,updn : in std_logic;
        val: in std_logic_vector(3 downto 0);
         CNT : inout std_logic_vector(3 downto 0));
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