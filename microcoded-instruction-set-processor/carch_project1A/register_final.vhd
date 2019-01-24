----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.02.2018 00:23:53
-- Design Name: 
-- Module Name: register_final - Behavioral
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
entity register_final is
	Port(
        src_s1, src_s2, src_s3     : in STD_LOGIC;
        des_a1, des_a2, des_a3     : in STD_LOGIC;
        data_load, clk : in STD_LOGIC;
        data           : in STD_LOGIC_VECTOR(15 downto 0);
        Q              : out STD_LOGIC_VECTOR(15 downto 0);
        r1, r2, r3, r4, r5, r6, r7, r8 : out STD_LOGIC_VECTOR(15 downto 0)
        );
end register_final;

architecture Behavioral of register_final is
--register component
	Component reg
		Port(
				load, clk 	: in 	STD_LOGIC;
				D 			: in 	STD_LOGIC_VECTOR(15 downto 0);
				Q			: out STD_LOGIC_VECTOR(15 downto 0)
			 );
	End Component;
--decoder 3 to 8 bit
	Component decoder
		Port(
				a1, a2, a3 : in STD_LOGIC;
				D1, D2, D3, D4, D5, D6, D7, D8 : out STD_LOGIC 
			 );
	End Component;
--mux 2 to 16 bit
	Component mux
		Port(
				in1, in2 : in STD_LOGIC_VECTOR(15 downto 0);
				s : in STD_LOGIC;
				z : out STD_LOGIC_VECTOR(15 downto 0)
			 );
	End Component;
--mux 8 to 16 bit
	Component multiplexer
		Port(
				in1, in2, in3, in4, in5, in6, in7, in8 : in STD_LOGIC_VECTOR(15 downto 0);
				s1, s2, s3 : STD_LOGIC;
				z : out STD_LOGIC_VECTOR(15 downto 0)
			 );
	End Component;
--inter-component signals
        --load in for each register's load
        signal load_r1, load_r2, load_r3, load_r4, load_r5, load_r6, load_r7, load_r8  : STD_LOGIC;
        --output load for each register
        signal q_r1, q_r2, q_r3, q_r4, q_r5, q_r6, q_r7, q_r8 : STD_LOGIC_VECTOR(15 downto 0);
        signal data_src_mux_out, src_r : STD_LOGIC_VECTOR(15 downto 0);
        
--port mapping for each individual component within the schema
begin
	reg1 : reg PORT MAP(
			                 load 	=>		load_r1,
			                 clk 	=>		clk,
                        	 D 		=>		data_src_mux_out,
			                 Q 		=>		q_r1
	                       );
	reg2 : reg PORT MAP(
                             load    =>     load_r2,
                             clk     =>     clk,
                             D       =>     data_src_mux_out,
                             Q       =>     q_r2
                        );
	reg3 : reg PORT MAP(
                             load     =>    load_r3,
                             clk      =>    clk,
                             D        =>    data_src_mux_out,
                             Q        =>    q_r3
                           );
    reg4 : reg PORT MAP(
                              load    =>    load_r4,
                              clk     =>    clk,
                              D       =>    data_src_mux_out,
                              Q       =>    q_r4
                        );
	reg5 : reg PORT MAP(
                              load    =>    load_r5,
                              clk     =>    clk,
                              D       =>    data_src_mux_out,
                              Q       =>    q_r5
                        );
    reg6 : reg PORT MAP(
                              load    =>    load_r6,
                              clk     =>    clk,
                              D       =>    data_src_mux_out,
                              Q       =>    q_r6
                        );
    reg7 : reg PORT MAP(
                              load     =>   load_r7,
                              clk      =>   clk,
                              D        =>   data_src_mux_out,
                              Q        =>   q_r7
                        );
    reg8 : reg PORT MAP(
                              load    =>    load_r8,
                              clk     =>    clk,
                              D       =>    data_src_mux_out,
                              Q       =>    q_r8
                        );
 	decoder_3_8 : decoder PORT MAP(
                            			a1 	=>	des_a1,
			                            a2 	=>	des_a2,
			                            a3 	=>	des_a3,
			                            D1 	=>	load_r1,
                            			D2 	=>	load_r2,
                               			D3 	=>	load_r3,
                            			D4 	=>	load_r4,
                            			D5 	=>	load_r5,
                            			D6 	=>	load_r6,
			                            D7 	=>	load_r7,
                            			D8  =>  load_r8
	                              );
	
	mux_2_16 : mux PORT MAP(
                        			in1	=>	data,
		                          	in2	=>	src_r,
			                        s	=>	data_load,
		                          	z	=>	data_src_mux_out
	                        );
	
	mux_8_16 : multiplexer PORT MAP(
                              			in1	=>	q_r1,
			                            in2	=>	q_r2,
	                               		in3	=>	q_r3,
			                            in4	=>	q_r4,
			                            in5	=>	q_r5,
                            			in6	=>	q_r6,
			                            in7	=>	q_r7,
		                              	in8	=>	q_r8,
			                            s1	=>	src_s1,
			                            s2	=>	src_s2,
			                            s3	=>	src_s3,
		                              	z	=>	src_r
	                                );
--register instantiation
	r1 <= q_r1;
	r2 <= q_r2;
	r3 <= q_r3;
	r4 <= q_r4;
	r5 <= q_r5;
	r6 <= q_r6;
	r7 <= q_r7;
	r8 <= q_r8;
	
end Behavioral;