----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.03.2018 19:17:03
-- Design Name: 
-- Module Name: function_unit_tb - Behavioral
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
 
ENTITY function_unit_tb IS
END function_unit_tb;
 
ARCHITECTURE behavior OF function_unit_tb IS 
 
    COMPONENT function_unit
    PORT(
         FunctionSelect : IN  std_logic_vector(4 downto 0);
         a_in : IN  std_logic_vector(15 downto 0);
         b_in : IN  std_logic_vector(15 downto 0);
         N_fu : OUT  std_logic;
         Z_fu : OUT  std_logic;
         V_fu : OUT  std_logic;
         C_fu : OUT  std_logic;
         F : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
   signal FunctionSelect : std_logic_vector(4 downto 0) := (others => '0');
   signal a_in : std_logic_vector(15 downto 0) := (others => '0');
   signal b_in : std_logic_vector(15 downto 0) := (others => '0');
   signal N_fu : std_logic;
   signal Z_fu : std_logic;
   signal V_fu : std_logic;
   signal C_fu : std_logic;
   signal F : std_logic_vector(15 downto 0);
BEGIN
   uut: function_unit PORT MAP (
          FunctionSelect => FunctionSelect,
          a_in => a_in,
          b_in => b_in,
          N_fu => N_fu,
          Z_fu => Z_fu,
          V_fu => V_fu,
          C_fu => C_fu,
          F => F
        ); 
   stim_proc: process
   begin		
		a_in <= x"AAAA";
		b_in <= x"BBBB";
		
		wait for 10ns;
		FunctionSelect <= "00000";
		
		wait for 10ns;
		FunctionSelect <= "00001";
		
		wait for 10ns;
		FunctionSelect <= "00010";
		
		wait for 10ns;
		FunctionSelect <= "00011";
		
		wait for 10ns;
		FunctionSelect <= "00100";
		
		wait for 10ns;
		FunctionSelect <= "00101";
		
		wait for 10ns;
		FunctionSelect <= "00110";
		
		wait for 10ns;
		FunctionSelect <= "00111";
		
		wait for 10ns;
		FunctionSelect <= "01000";
		
		wait for 10ns;
		FunctionSelect <= "01010";
		
		wait for 10ns;
		FunctionSelect <= "01100";
		
		wait for 10ns;
		FunctionSelect <= "01110";
		
		wait for 10ns;
		FunctionSelect <= "10000";
		
		wait for 10ns;
		FunctionSelect <= "10100";
		
		wait for 10ns;
		FunctionSelect <= "11000";
		
		wait;
   end process;

END;