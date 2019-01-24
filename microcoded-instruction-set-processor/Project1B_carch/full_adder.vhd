library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity full_adder is
	Port(
			X, Y, Cin : in STD_LOGIC;
			Cout, S : out STD_LOGIC
		);
end full_adder;

architecture Behavioral of full_adder is
	signal S1, S2, S3 : STD_LOGIC;
begin
	S1 <= (X xor Y) after 1ns;
	S2 <= (Cin and S1) after 1ns;
	S3 <= (X and Y) after 1ns;
	S <= (S1 xor Cin) after 1ns;
	Cout <= (S2 or S3) after 1ns;

end Behavioral;