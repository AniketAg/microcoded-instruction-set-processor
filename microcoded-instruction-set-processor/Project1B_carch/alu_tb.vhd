----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.03.2018 15:30:44
-- Design Name: 
-- Module Name: alu_tb - Behavioral
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
 
ENTITY ALU_TB IS
END ALU_TB;
 
ARCHITECTURE behavior OF ALU_TB IS 
 
    COMPONENT alu_unit
    PORT(
         a_in : IN  std_logic_vector(15 downto 0);
         b_in : IN  std_logic_vector(15 downto 0);
         G_select : IN  std_logic_vector(3 downto 0);
         V : OUT  std_logic;
         C : OUT  std_logic;
         G : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
   signal a_in : std_logic_vector(15 downto 0) := (others => '0');
   signal b_in : std_logic_vector(15 downto 0) := (others => '0');
   signal G_select : std_logic_vector(3 downto 0) := (others => '0');
   signal V : std_logic;
   signal C : std_logic;
   signal G : std_logic_vector(15 downto 0);
 
BEGIN
 
	uut: alu_unit PORT MAP (
          a_in => a_in,
          b_in => b_in,
          G_select => G_select,
          V => V,
          C => C,
          G => G
        );

   stim_proc: process
   begin		
        a_in <= x"FFFF";
		b_in <= x"0F0F";
		G_select <= "0000";
		
		wait for 100ns;
		G_select <= "0001";
		
		wait for 100ns;
		G_select <= "0010";

		wait for 100ns;
		G_select <= "0011";
		
		wait for 100ns;
		G_select <= "0100";
		
		wait for 100ns;
		G_select <= "0101";
		
		wait for 100ns;
		G_select <= "0110";
		
		wait for 100ns;
		G_select <= "0111";
      wait;
   end process;
END;