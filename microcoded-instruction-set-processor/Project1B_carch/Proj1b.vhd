----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.03.2018 14:44:47
-- Design Name: 
-- Module Name: Proj1b - Behavioral
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
entity Proj1b is
	Port(
		data_in, constant_in : in STD_LOGIC_VECTOR(15 downto 0);
		control_word : in STD_LOGIC_VECTOR(16 downto 0);
		Clk_sig : in STD_LOGIC;
		data_out, address_out : out STD_LOGIC_VECTOR(15 downto 0);
		N_out, Z_out, C_out, V_out : out STD_LOGIC
	);
end Proj1b;

architecture Behavioral of Proj1b is
	
	Component reg2
		Port(
			des_D, add_a, add_b : in STD_LOGIC_VECTOR(2 downto 0);
			Clk, load_in : in STD_LOGIC;
			data : in STD_LOGIC_VECTOR(15 downto 0);
			out_data_a, out_data_b : out STD_LOGIC_VECTOR(15 downto 0)
		);
	End Component;
	Component mux
		Port(
			in1, in2 : in STD_LOGIC_VECTOR(15 downto 0);
			s : in STD_LOGIC;
			z : out STD_LOGIC_VECTOR(15 downto 0)
		);
	End Component;
	Component function_unit
		Port(
			FunctionSelect : in STD_LOGIC_VECTOR(4 downto 0); -- 5 input
			a_in, b_in : in STD_LOGIC_VECTOR(15 downto 0);
			N_fu, Z_fu, V_fu, C_fu : out STD_LOGIC;
			F : out STD_LOGIC_VECTOR(15 downto 0)
		);
	End Component;
	signal mux_b_out, mux_d_out, reg_file_out_a, reg_file_out_b, function_unit_out : STD_LOGIC_VECTOR(15 downto 0);
begin
    mux_b: mux PORT MAP(
		in1 => constant_in,
		in2 => reg_file_out_b,
		s => control_word(7),
		z => mux_b_out
	);
	
	mux_d: mux PORT MAP(
		in1 => function_unit_out,
		in2 => data_in,
		s => control_word(1),
		z => mux_d_out
	);
	
	reg1: reg2 PORT MAP(
		des_D => control_word(16 downto 14),
		add_a => control_word(13 downto 11),
		add_b => control_word(10 downto 8),
		Clk => Clk_sig,
		load_in => control_word(0),
		data => mux_d_out,
		out_data_a => reg_file_out_a,
		out_data_b => reg_file_out_b
	);
	
	data_out <= mux_b_out;
	address_out <= reg_file_out_a;
	
	function_unit1: function_unit PORT MAP(
		FunctionSelect => control_word(6 downto 2),
		A_in => reg_file_out_a,
		B_in => mux_b_out,
		N_fu => N_out,
		Z_fu => Z_out,
		C_fu => C_out,
		V_fu => V_out,
		F => function_unit_out
	);

end Behavioral;