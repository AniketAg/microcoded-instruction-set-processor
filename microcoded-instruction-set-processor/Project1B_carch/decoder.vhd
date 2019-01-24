----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.02.2018 17:50:19
-- Design Name: 
-- Module Name: decoder - Behavioral
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
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity decoder is
    port(A1, A2, A3: in std_logic;
         D1, D2, D3, D4, D5, D6, D7, D8: out std_logic);
end decoder;

architecture Behavioral of decoder is

begin
D1<=((not A1) and (not A2) and (not A3)) after 10ns ;
D2<=((not A1) and (not A2) and (A3)) after 10ns ;
D3<=((not A1) and (A2) and (not A3)) after 10ns ;
D4<=((not A1) and (A2) and (A3)) after 10ns ;
D5<=((A1) and (not A2) and (not A3)) after 10ns ;
D6<=((A1) and (not A2) and (A3)) after 10ns ;
D7<=((A1) and (A2) and (not A3)) after 10ns ;
D8<=((A1) and (A2) and (A3)) after 10ns ;
  
end Behavioral;