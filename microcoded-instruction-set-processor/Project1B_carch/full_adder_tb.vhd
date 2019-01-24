----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.03.2018 15:28:17
-- Design Name: 
-- Module Name: full_adder_tb - Behavioral
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
ENTITY full_adder_TB IS
END full_adder_TB;
 
ARCHITECTURE behavior OF full_adder_TB IS 
 
    COMPONENT full_adder
    PORT(
         X : IN  std_logic;
         Y : IN  std_logic;
         Cin : IN  std_logic;
         Cout : OUT  std_logic;
         S : OUT  std_logic
        );
    END COMPONENT;
   signal X : std_logic := '0';
   signal Y : std_logic := '0';
   signal Cin : std_logic := '0';
   signal Cout : std_logic;
   signal S : std_logic;
 
BEGIN
   uut: full_adder PORT MAP (
          X => X,
          Y => Y,
          Cin => Cin,
          Cout => Cout,
          S => S
        );
   stim_proc: process
   begin		
		wait for 15ns;
		X <= '1';
		
		wait for 15ns;
		X <= '0';
		Y <= '1';
		
		wait for 15ns;
		X <= '1';
		
		wait for 15ns;
		Cin <= '1';
		
		wait for 15ns;
		Y <= '0';
		
		wait for 15ns;
		X <= '0';

      wait;
   end process;

END;