----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.03.2018 19:19:40
-- Design Name: 
-- Module Name: bus_b_tb - Behavioral
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
 
ENTITY bus_b_tb IS
END bus_b_tb;
 
ARCHITECTURE behavior OF bus_b_tb IS 
 
    COMPONENT bus_b
    PORT(
         B : IN  std_logic_vector(15 downto 0);
         S_in : IN  std_logic_vector(1 downto 0);
         Y_out : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
   signal B : std_logic_vector(15 downto 0) := (others => '0');
   signal S_in : std_logic_vector(1 downto 0) := (others => '0');
   signal Y_out : std_logic_vector(15 downto 0);
 
BEGIN
   uut: bus_b PORT MAP (
          B => B,
          S_in => S_in,
          Y_out => Y_out
        );
    stim_proc: process
   begin		
		B <= x"AAAA";
		S_in <= "00";
		
		wait for 10ns;
		S_in <= "01";
		
		wait for 10ns;
		S_in <= "10";
		
		wait for 10ns;
		S_in <= "11";

      wait;
   end process;

END;