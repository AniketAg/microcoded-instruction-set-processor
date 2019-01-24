----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.03.2018 14:25:05
-- Design Name: 
-- Module Name: bus_b - Behavioral
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
entity bus_b is
	Port(
		B : in STD_LOGIC_VECTOR(15 downto 0);
		S_in : in STD_LOGIC_VECTOR(1 downto 0);
		Y_out : out STD_LOGIC_VECTOR(15 downto 0)
	);
end bus_b;

architecture Behavioral of bus_b is
	Component mux_2_1
	Port(
		B_i, S1, S2 : in STD_LOGIC;
		Y_i : out STD_LOGIC
	);
	End Component;

begin
	mux1: mux_2_1 PORT MAP(
		B_i => B(0),
		S1 => S_in(0),
		S2 => S_in(1),
		Y_i => Y_out(0)
	);
	
	mux2: mux_2_1 PORT MAP(
		B_i => B(1),
		S1 => S_in(0),
		S2 => S_in(1),
		Y_i => Y_out(1)
	);
	
	mux3: mux_2_1 PORT MAP(
		B_i => B(2),
		S1 => S_in(0),
		S2 => S_in(1),
		Y_i => Y_out(2)
	);
	
	mux4: mux_2_1 PORT MAP(
		B_i => B(3),
		S1 => S_in(0),
		S2 => S_in(1),
		Y_i => Y_out(3)
	);
	
	mux5: mux_2_1 PORT MAP(
		B_i => B(4),
		S1 => S_in(0),
		S2 => S_in(1),
		Y_i => Y_out(4)
	);
	
	mux6: mux_2_1 PORT MAP(
		B_i => B(5),
		S1 => S_in(0),
		S2 => S_in(1),
		Y_i => Y_out(5)
	);
	
	mux7: mux_2_1 PORT MAP(
		B_i => B(6),
		S1 => S_in(0),
		S2 => S_in(1),
		Y_i => Y_out(6)
	);
	
	mux8: mux_2_1 PORT MAP(
		B_i => B(7),
		S1 => S_in(0),
		S2 => S_in(1),
		Y_i => Y_out(7)
	);
	
	mux9: mux_2_1 PORT MAP(
		B_i => B(8),
		S1 => S_in(0),
		S2 => S_in(1),
		Y_i => Y_out(8)
	);
	
	mux10: mux_2_1 PORT MAP(
		B_i => B(9),
		S1 => S_in(0),
		S2 => S_in(1),
		Y_i => Y_out(9)
	);
	
	mux11: mux_2_1 PORT MAP(
		B_i => B(10),
		S1 => S_in(0),
		S2 => S_in(1),
		Y_i => Y_out(10)
	);

end Behavioral;