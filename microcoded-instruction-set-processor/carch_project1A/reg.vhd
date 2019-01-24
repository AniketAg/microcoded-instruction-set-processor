----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.02.2018 20:49:59
-- Design Name: 
-- Module Name: registor - Behavioral
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

entity reg is
	Port(
			D : in STD_LOGIC_VECTOR(15 downto 0);
			load, clk : in STD_LOGIC;
			Q : out STD_LOGIC_VECTOR(15 downto 0)
		 );
end reg;

architecture Behavioral of reg is
begin	process(clk)
	begin
		if(rising_edge(clk)) then
			if(load = '1') then
				Q <= D after 5ns;
			end if;
		end if;
	end process;
end Behavioral;