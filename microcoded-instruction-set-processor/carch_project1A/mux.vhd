----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.02.2018 20:28:10
-- Design Name: 
-- Module Name: mux - Behavioral
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
entity mux is
    Port(
			s : in STD_LOGIC;
			in1, in2 : in STD_LOGIC_VECTOR(15 downto 0);
			z : out STD_LOGIC_VECTOR(15 downto 0)
    	);
end mux;

architecture Behavioral of mux is

begin
	z <= 	in1 after 5ns when s = '0' else
			in2 after 5ns when s = '1' else
			x"0000" after 5ns;

end Behavioral;