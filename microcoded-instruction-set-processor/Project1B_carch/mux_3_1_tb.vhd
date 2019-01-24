----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.03.2018 19:26:29
-- Design Name: 
-- Module Name: mux_3_1_tb - Behavioral
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
 
ENTITY mux_3_1_TB IS
END mux_3_1_TB;
 
ARCHITECTURE behavior OF mux_3_1_TB IS 
 
    COMPONENT mux_3_1
    PORT(
         In1 : IN  std_logic;
         In2 : IN  std_logic;
         In3 : IN  std_logic;
         S1 : IN  std_logic;
         S2 : IN  std_logic;
         Z : OUT  std_logic
        );
    END COMPONENT;

   signal In1 : std_logic := '0';
   signal In2 : std_logic := '0';
   signal In3 : std_logic := '0';
   signal S1 : std_logic := '0';
   signal S2 : std_logic := '0';

   signal Z : std_logic;
 
BEGIN
 
   uut: mux_3_1 PORT MAP (
          In1 => In1,
          In2 => In2,
          In3 => In3,
          S1 => S1,
          S2 => S2,
          Z => Z
        );

   stim_proc: process
   begin	
		wait for 5ns;	
		In1 <= '1';
		In2 <= '0';
		In3 <= '1';
		
		wait for 5ns;
		S1 <= '0';
		S2 <= '1';
		
		wait for 5ns;
		S1 <= '1';
		S2 <= '0';
		
		wait for 5ns;
		S1 <= '1';
		S2 <= '1';

      wait;
   end process;

END;