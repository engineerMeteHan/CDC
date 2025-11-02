----------------------------------------------------------------------------------
-- Company: EmbeddedTech Solutions -- Great Engineering
-- Engineer: Metehan GENCER 
-- 
-- Create Date: 02.11.2025 16:54:11
-- Design Name: 
-- Module Name: sys2 - Behavioral
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
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity sys2 is
  Port (
    clkb      : in std_logic;
    flagb_i   : in std_logic;
    number1_i : in std_logic_vector(7 downto 0);
    number2_i : in std_logic_vector(7 downto 0);
    sum_o     : out std_logic_vector(8 downto 0);
    flagb_o   : out std_logic);
end sys2;

architecture Behavioral of sys2 is

begin
    
    process (clkb) begin 
        if rising_edge(clkb) then 
            flagb_o <= '0';
            
            if (flagb_i = '1') then 
                sum_o <= ('0' & number1_i) + ('0' & number2_i);
                flagb_o <= '1';
                
            end if;
        end if; 
    end process; 

end Behavioral;
