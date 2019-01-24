library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2_1 is
	Port(
			B_i, S1, S2 : in STD_LOGIC;
			Y_i : out STD_LOGIC
		);
end mux_2_1;

architecture Behavioral of mux_2_1 is

begin
	Y_i <= 	S1 after 1ns when B_i = '1' else
			S2 after 1ns when B_i = '0' else
			'0' after 1ns;

end Behavioral;

