----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.03.2018 17:44:37
-- Design Name: 
-- Module Name: ripple_adder_tb - Behavioral
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
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY ripple_adder_TB IS
END ripple_adder_TB;
 
ARCHITECTURE behavior OF ripple_adder_TB IS 
 
    COMPONENT ripple_adder
    PORT(
         A : IN  std_logic_vector(15 downto 0);
         B : IN  std_logic_vector(15 downto 0);
         Cin : IN  std_logic;
         Cout : OUT  std_logic;
         V_out : OUT  std_logic;
         G_out : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    
   signal A : std_logic_vector(15 downto 0) := (others => '0');
   signal B : std_logic_vector(15 downto 0) := (others => '0');
   signal Cin : std_logic := '0';
   signal Cout : std_logic;
   signal V_out : std_logic;
   signal G_out : std_logic_vector(15 downto 0);
 
BEGIN
   uut: ripple_adder PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          Cout => Cout,
          V_out => V_out,
          G_out => G_out
        ); 
   stim_proc: process
   begin		
		A <= x"AAAA";
		B <= x"FBAA";
		Cin <= '1';
		
		wait for 80ns;
		
		A <= x"FFFF";
		B <= x"0000";
		Cin <= '1';
	
      wait;
   end process;

END;