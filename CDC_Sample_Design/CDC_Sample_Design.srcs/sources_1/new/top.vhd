----------------------------------------------------------------------------------
-- Company: EmbeddedTech Solutions -- Great Engineering
-- Engineer: Metehan GENCER 
-- 
-- Create Date: 02.11.2025 16:59:36
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
    generic (N : integer := 2       -- shift register depth 
    );
    Port ( 
        clka : in std_logic;
        clkb : in std_logic;
        en_i : in std_logic;
        number2_i : in std_logic_vector(7 downto 0);        
        number1_i : in std_logic_vector(7 downto 0);        
        rdy_o : out std_logic;
        sum_o : out std_logic_vector(8 downto 0));
end top;

architecture Behavioral of top is

    -- COMPONENT DECLARATIONS -----------------------------------------------------
    component cdc_flag is
        generic (
            N : integer := 2        -- shift register depth 
            );
      Port ( 
        clka    : in std_logic ;
        flaga_i : in std_logic;
        clkb    : in std_logic;
        flagb_o : out std_logic );
    end component;

    component sys2 is
      Port (
        clkb      : in std_logic;
        flagb_i   : in std_logic;
        number1_i : in std_logic_vector(7 downto 0);
        number2_i : in std_logic_vector(7 downto 0);
        sum_o     : out std_logic_vector(8 downto 0);
        flagb_o   : out std_logic);
    end component;
    
    component sys1 is
        Port ( 
            clka        : in std_logic;
            en_i        : in std_logic;
            flaga_i     : in std_logic;
            number1_i   : in std_logic_vector(7 downto 0);
            number2_i   : in std_logic_vector(7 downto 0);
            sum_i       : in std_logic_vector(8 downto 0);
            rdy_o       : out std_logic;
            number1_o   : out std_logic_vector(7 downto 0);
            number2_o   : out std_logic_vector(7 downto 0);
            sum_o       : out std_logic_vector(8 downto 0);
            flaga_o     : out std_logic);
    end component;
    -- END COMPONENT DECLARATIONS ---------------------------------------------------------------
    
    signal flaga_o : std_logic := '0';
    signal flagb_o : std_logic := '0';
    signal flaga_i : std_logic := '0';
    signal flagb_i : std_logic := '0';
    signal sum     : std_logic_vector(8 downto 0);
    signal number1 : std_logic_vector(7 downto 0);  
    signal number2 : std_logic_vector(7 downto 0);

begin

    -- COMPONENT INSTANTOATIONS 
    I_CDC_A2B : cdc_flag        -- from A domain to B domain
        generic map (
            N => N
        )
        port map (
            clka      => clka,   
            flaga_i   => flaga_o,
            clkb      => clkb,   
            flagb_o   => flagb_i);
        
    I_CDC_B2A : cdc_flag        -- from B Domain to A domain 
        generic map (
            N => N
        )
        port map(
            clka      => clkb    ,
            flaga_i   => flagb_o ,
            clkb      => clka    , 
            flagb_o   => flaga_i);
    
    I_SYS1 : sys1
        port map (
            clka           => clka,
            en_i           => en_i,
            flaga_i        => flaga_i,
            number1_i      => number1_i,
            number2_i      => number2_i,
            sum_i          => sum,
            rdy_o          => rdy_o,
            number1_o      => number1,
            number2_o      => number2,
            sum_o          => sum_o,
            flaga_o        => flaga_o);
            
    I_SYS2 : sys2 
        port map(
            clkb                => clkb,     
            flagb_i             => flagb_i,  
            number1_i           => number1,
            number2_i           => number2,
            sum_o               => sum,    
            flagb_o             => flagb_o);        
end Behavioral;



-- Hey, I am Mete 









































