----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.03.2018 15:13:21
-- Design Name: 
-- Module Name: mux_n_tb - Behavioral
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
ENTITY mux_n_TB IS
END mux_n_TB;
 
ARCHITECTURE behavior OF mux_n_TB IS 
    COMPONENT mux_2_1
    PORT(
         B_i : IN  std_logic;
         S1 : IN  std_logic;
         S2 : IN  std_logic;
         Y_i : OUT  std_logic
        );
    END COMPONENT;
    
   signal B_i : std_logic := '0';
   signal S1 : std_logic := '0';
   signal S2 : std_logic := '0';
   signal Y_i : std_logic;
 
BEGIN
   uut: mux_2_1 PORT MAP (
          B_i => B_i,
          S1 => S1,
          S2 => S2,
          Y_i => Y_i
        );
   stim_proc: process
   begin		
		S1 <= '1';
		S2 <= '0';
		
		wait for 5ns;
		B_i <= '1';
		
		wait for 5ns;
		B_i <= '0';

      wait;
   end process;

END;