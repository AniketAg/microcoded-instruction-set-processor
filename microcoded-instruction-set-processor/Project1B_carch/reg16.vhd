----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.03.2018 15:22:30
-- Design Name: 
-- Module Name: reg16 - Behavioral
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
entity reg16 is
	Port(
		D : in STD_LOGIC_VECTOR(15 downto 0);
		load1, load2, Clk : in STD_LOGIC;
		Q : out STD_LOGIC_VECTOR(15 downto 0)
		);
end reg16;
architecture Behavioral of reg16 is

begin 
	process (Clk)
		begin
			if(rising_edge(Clk)) then
				if((load1 =  '1') and (load2 = '1')) then
					Q <= D after 5ns;
				end if;
			end if;
	end process;
end Behavioral;