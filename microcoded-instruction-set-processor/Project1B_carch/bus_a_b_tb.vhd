----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.03.2018 19:22:32
-- Design Name: 
-- Module Name: bus_a_b_tb - Behavioral
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
 
ENTITY bus_a_b_tb IS
END bus_a_b_tb;
 
ARCHITECTURE behavior OF bus_a_b_tb IS 
 
    COMPONENT bus_a_b
    PORT(
         a_logic_in : IN  std_logic_vector(15 downto 0);
         b_logic_in : IN  std_logic_vector(15 downto 0);
         select_in : IN  std_logic_vector(1 downto 0);
         logic_output_a_b : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
   signal a_logic_in : std_logic_vector(15 downto 0) := (others => '0');
   signal b_logic_in : std_logic_vector(15 downto 0) := (others => '0');
   signal select_in : std_logic_vector(1 downto 0) := (others => '0');
   signal logic_output_a_b : std_logic_vector(15 downto 0);
 
BEGIN
   uut: bus_a_b PORT MAP (
          a_logic_in => a_logic_in,
          b_logic_in => b_logic_in,
          select_in => select_in,
          logic_output_a_b => logic_output_a_b
        ); 
   stim_proc: process
   begin		
		
		a_logic_in <= x"FFFF";
		b_logic_in <= x"9999";
		wait for 10ns;
		select_in <= "00";
		
		wait for 10ns;
		select_in <= "01";
		
		wait for 10ns;
		select_in <= "10";
		
		wait for 10ns;
		select_in <= "11";

      wait;
   end process;

END;