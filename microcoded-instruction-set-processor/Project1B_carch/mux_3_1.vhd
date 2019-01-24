library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity mux_3_1 is
	Port(
		in1, in2, in3 : in STD_LOGIC;
		s1, s2 : in STD_LOGIC;
		z : out STD_LOGIC
		);
end mux_3_1;

architecture Behavioral of mux_3_1 is

begin
	z <= 	in1 after 1ns when s1 = '0' and s2 = '0' else
			in2 after 1ns when s1 = '0' and s2 = '1' else
			in3 after 1ns when s1 = '1' and s2 = '0' else
			'0' after 1ns;

end Behavioral;

