----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.03.2018 14:56:21
-- Design Name: 
-- Module Name: reg2 - Behavioral
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

entity reg2 is
	Port(
			des_D, add_a, add_b : in STD_LOGIC_VECTOR(2 downto 0);
			Clk, load_in : in STD_LOGIC;
			data : in STD_LOGIC_VECTOR(15 downto 0);
			out_data_a, out_data_b : out STD_LOGIC_VECTOR(15 downto 0)
		);
end reg2;

architecture Behavioral of reg2 is

	Component reg16
		Port(
			D : in STD_LOGIC_VECTOR(15 downto 0); 
			load1, load2, Clk : in STD_LOGIC;
			Q : out STD_LOGIC_VECTOR(15 downto 0)
		);
	end Component;
	Component decoder
		Port(
			A1, A2, A3 : in STD_LOGIC;
			D1, D2, D3, D4, D5, D6, D7, D8 : out STD_LOGIC
		);
	End Component;
	Component mux
		Port(
			in1, in2 : STD_LOGIC_VECTOR(15 downto 0);
			s : STD_LOGIC;
			z : out STD_LOGIC_VECTOR(15 downto 0)
		);
	End Component;
	Component multiplexer
		Port(
			in1, in2, in3, in4, in5, in6, in7, in8 : in STD_LOGIC_VECTOR(15 downto 0);
			s1, s2, s3 : in STD_LOGIC;
			z : out STD_LOGIC_VECTOR(15 downto 0)
		);
	End Component;
	
	signal load_r1, load_r2, load_r3, load_r4, load_r5, load_r6, load_r7, load_r8 : STD_LOGIC;
	signal r1_q, r2_q, r3_q, r4_q, r5_q, r6_q, r7_q, r8_q, data_src_mux_out, src_reg, out_sig_a, out_sig_b : STD_LOGIC_VECTOR(15 downto 0);

begin
	Reg1: reg16 PORT MAP(
			D => data,
			load1 => load_r1,
			load2 => load_in,
			Clk => Clk,
			Q => r1_q
		);
	Reg2: reg16 PORT MAP(
			D => data,
			load1 => load_r2,
			load2 => load_in,
			Clk => Clk,
			Q => r2_q
		);
	Reg3: reg16 PORT MAP(
			D => data,
			load1 => load_r3,
			load2 => load_in,
			Clk => Clk,
			Q => r3_q
		);
	Reg4: reg16 PORT MAP(
			D => data,
			load1 => load_r4,
			load2 => load_in,
			Clk => Clk,
			Q => r4_q
		);
	Reg5: reg16 PORT MAP(
			D => data,
			load1 => load_r5,
			load2 => load_in,
			Clk => Clk,
			Q => r5_q
		);
	Reg6: reg16 PORT MAP(
			D => data,
			load1 => load_r6,
			load2 => load_in,
			Clk => Clk,
			Q => r6_q
		);
	Reg7: reg16 PORT MAP(
			D => data,
			load1 => load_r7,
			load2 => load_in,
			Clk => Clk,
			Q => r7_q
		);
	Reg8: reg16 PORT MAP(
			D => data,
			load1 => load_r8,
			load2 => load_in,
			Clk => Clk,
			Q => r8_q
		);	
	des_decoder_3_8: decoder PORT MAP(
			A1 => des_D(0),
			A2 => des_D(1),
			A3 => des_D(2),
			D1 => load_r1,
			D2 => load_r2,
			D3 => load_r3,
			D4 => load_r4,
			D5 => load_r5,
			D6 => load_r6,
			D7 => load_r7,
			D8 => load_r8
		);
	A_8_1_mux: multiplexer PORT MAP(
			in1 => r1_q,
			in2 => r2_q,
			in3 => r3_q,
			in4 => r4_q,
			in5 => r5_q,
			in6 => r6_q,
			in7 => r7_q,
			in8 => r8_q,
			s1 => add_a(0),
			s2 => add_a(1),
			s3 => add_a(2),
			z => out_sig_a
		);
	B_8_1_mux: multiplexer PORT MAP(
			in1 => r1_q,
			in2 => r2_q,
			in3 => r3_q,
			in4 => r4_q,
			in5 => r5_q,
			in6 => r6_q,
			in7 => r7_q,
			in8 => r8_q,
			s1 => add_b(0),
			s2 => add_b(1),
			s3 => add_b(2),
			z => out_sig_b
		);
		
		out_data_a <= out_sig_a;
		out_data_b <= out_sig_b;

end Behavioral;