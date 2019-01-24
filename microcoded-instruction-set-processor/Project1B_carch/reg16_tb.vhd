----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.03.2018 17:51:17
-- Design Name: 
-- Module Name: reg16_tb - Behavioral
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
 
ENTITY reg16_TB IS
END reg16_TB;
 
ARCHITECTURE behavior OF reg16_TB IS 
 
    COMPONENT reg16
    PORT(
         D : IN  std_logic_vector(15 downto 0);
         load1 : IN  std_logic;
         load2 : IN  std_logic;
         Clk : IN  std_logic;
         Q : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    
   signal D : std_logic_vector(15 downto 0) := (others => '0');
   signal load1 : std_logic := '0';
   signal load2 : std_logic := '0';
   signal Clk : std_logic := '0';

   signal Q : std_logic_vector(15 downto 0);
   constant Clk_period : time := 10 ns;
 
BEGIN
 
	uut: reg16 PORT MAP (
          D => D,
          load1 => load1,
          load2 => load2,
          Clk => Clk,
          Q => Q
        );

   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 
   stim_proc: process
   begin		
		D <= x"FFFF";
		load1 <= '1';
		load2 <= '1';
		
		wait for 20ns;
		D <= x"AAAA";
		load1 <= '0';
		
		wait for 10ns;
		load2 <= '0';
		
		wait for 10ns;
		load1 <= '1';
		load2 <= '1';
		
		wait;
   end process;

END;