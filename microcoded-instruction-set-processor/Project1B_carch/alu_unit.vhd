library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity alu_unit is
	Port(
		a_in, b_in : in STD_LOGIC_VECTOR(15 downto 0);
		G_select : in STD_LOGIC_VECTOR(3 downto 0);
		V, C : out STD_LOGIC; -- flags
		G : out STD_LOGIC_VECTOR(15 downto 0)
	);

end alu_unit;
architecture Behavioral of alu_unit is
	Component ripple_adder
		Port(
			A, B : in STD_LOGIC_VECTOR(15 downto 0);
			Cin : in STD_LOGIC;
			Cout, V_out : out STD_LOGIC;
			G_out : out STD_LOGIC_VECTOR(15 downto 0)
		);
	End Component;
	Component bus_a_b
		Port(
			a_logic_in, b_logic_in : in STD_LOGIC_VECTOR(15 downto 0);
			select_in : in STD_LOGIC_VECTOR(1 downto 0);
			logic_output_a_b : out STD_LOGIC_VECTOR(15 downto 0)
		);
	End Component;
	Component bus_b
		Port(
			B : in STD_LOGIC_VECTOR(15 downto 0);
			S_in : in STD_LOGIC_VECTOR(1 downto 0);
			Y_out : out STD_LOGIC_VECTOR(15 downto 0)
		);
	End Component;
	Component mux
		Port(
			in1, in2 : in STD_LOGIC_VECTOR(15 downto 0);
			s : in STD_LOGIC;
			z : out STD_LOGIC_VECTOR(15 downto 0)
		);
	End Component;
	signal logic_out, logic_output_a_b, ripple_out : STD_LOGIC_VECTOR(15 downto 0);
	
begin
	r_adder: ripple_adder PORT MAP(
			A => a_in,
			B => b_in,
			Cin => G_select(0),
			Cout => C,
			V_out => V,
			G_out => ripple_out
	);
	logic_circuit_a_b: bus_a_b PORT MAP(
			a_logic_in => a_in,
			b_logic_in => b_in,
			select_in => G_select(2 downto 1),
			logic_output_a_b => logic_output_a_b
	);
	logic_circuit_b : bus_b PORT MAP(
			B => b_in,
			S_in => G_select(2 downto 1),
			Y_out => logic_out
	);
	mux_2_16: mux PORT MAP(
			in1 => ripple_out,
			in2 => logic_output_a_b,
			s => G_select(3),
			z => G
	);
end Behavioral;