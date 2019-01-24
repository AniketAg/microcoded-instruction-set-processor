----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.03.2018 17:42:59
-- Design Name: 
-- Module Name: shifter_tb - Behavioral
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
 
ENTITY shifter_tb IS
END shifter_tb;
 
ARCHITECTURE behavior OF shifter_tb IS 
 
    COMPONENT shifter
    PORT(
         B : IN  std_logic_vector(15 downto 0);
         S : IN  std_logic_vector(1 downto 0);
         IL : IN  std_logic;
         IR : IN  std_logic;
         H : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    
   signal B : std_logic_vector(15 downto 0) := (others => '0');
   signal S : std_logic_vector(1 downto 0) := (others => '0');
   signal IL : std_logic := '0';
   signal IR : std_logic := '0';
   signal H : std_logic_vector(15 downto 0);
 
BEGIN
   uut: shifter PORT MAP (
          B => B,
          S => S,
          IL => IL,
          IR => IR,
          H => H
        ); 

   stim_proc: process
   begin		
      wait for 10ns;
		B <= x"FFFF";
		S <= "00";
		
		wait for 10ns;
		S <= "01";
		
		wait for 10ns;
		S <= "11";
		
		wait for 10ns;
		
		B <= H;
		S <= "10";

      wait;
   end process;

END;