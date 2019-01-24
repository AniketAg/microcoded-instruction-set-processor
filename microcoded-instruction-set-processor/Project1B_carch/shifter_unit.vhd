----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.03.2018 14:39:20
-- Design Name: 
-- Module Name: shifter_unit - Behavioral
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
entity shifter is
	Port(
		B : in STD_LOGIC_VECTOR(15 downto 0);
		S : in STD_LOGIC_VECTOR(1 downto 0);
		IL, IR : in STD_LOGIC;
		H : out STD_LOGIC_VECTOR(15 downto 0)
	);
end shifter;

architecture Behavioral of shifter is

	Component mux_3_1
		Port(
			in1, in2, in3, s1, s2 : in STD_LOGIC;
			z : out STD_LOGIC
		);
	End Component;

begin
	mux1: mux_3_1 PORT MAP(
		in1 => B(0),
		in2 => B(1),
		in3 => IL,
		s1 => S(0),
		s2 => S(1),
		z => H(0)
	);
	
	mux2: mux_3_1 PORT MAP(
		in1 => B(1),
		in2 => B(2),
		in3 => B(0),
		s1 => S(0),
		s2 => S(1),
		z => H(1)
	);
	
	mux3: mux_3_1 PORT MAP(
		in1 => B(2),
		in2 => B(3),
		in3 => B(1),
		s1 => S(0),
		s2 => S(1),
		z => H(2)
	);
	
	mux4: mux_3_1 PORT MAP(
		in1 => B(3),
		in2 => B(4),
		in3 => B(2),
		s1 => S(0),
		s2 => S(1),
		z => H(3)
	);
	
	mux5: mux_3_1 PORT MAP(
		in1 => B(4),
		in2 => B(5),
		in3 => B(3),
		s1 => S(0),
		s2 => S(1),
		z => H(4)
	);
	
	mux6: mux_3_1 PORT MAP(
		in1 => B(5),
		in2 => B(6),
		in3 => B(4),
		s1 => S(0),
		s2 => S(1),
		z => H(5)
	);
	
	mux7: mux_3_1 PORT MAP(
		in1 => B(6),
		in2 => B(7),
		in3 => B(5),
		s1 => S(0),
		s2 => S(1),
		z => H(6)
	);
	
	mux8: mux_3_1 PORT MAP(
		in1 => B(7),
		in2 => B(8),
		in3 => B(6),
		s1 => S(0),
		s2 => S(1),
		z => H(7)
	);
	
	mux9: mux_3_1 PORT MAP(
		in1 => B(8),
		in2 => B(9),
		in3 => B(7),
		s1 => S(0),
		s2 => S(1),
		z => H(8)
	);
	
	mux10: mux_3_1 PORT MAP(
		in1 => B(9),
		in2 => B(10),
		in3 => B(8),
		s1 => S(0),
		s2 => S(1),
		z => H(9)
	);
	
	mux11: mux_3_1 PORT MAP(
		in1 => B(10),
		in2 => B(11),
		in3 => B(9),
		s1 => S(0),
		s2 => S(1),
		z => H(10)
	);
	
	mux12: mux_3_1 PORT MAP(
		in1 => B(11),
		in2 => B(12),
		in3 => B(10),
		s1 => S(0),
		s2 => S(1),
		z => H(11)
	);
	
	mux13: mux_3_1 PORT MAP(
		in1 => B(12),
		in2 => B(13),
		in3 => B(11),
		s1 => S(0),
		s2 => S(1),
		z => H(12)
	);
	
	mux14: mux_3_1 PORT MAP(
		in1 => B(13),
		in2 => B(14),
		in3 => B(12),
		s1 => S(0),
		s2 => S(1),
		z => H(13)
	);
	
	mux15: mux_3_1 PORT MAP(
		in1 => B(14),
		in2 => B(15),
		in3 => B(13),
		s1 => S(0),
		s2 => S(1),
		z => H(14)
	);
	
	mux16: mux_3_1 PORT MAP(
		in1 => B(15),
		in2 => IR,
		in3 => B(14),
		s1 => S(0),
		s2 => S(1),
		z => H(15)
	);

end Behavioral;