----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.03.2018 17:54:18
-- Design Name: 
-- Module Name: Proj_1b_tb - Behavioral
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
 
ENTITY Proj_1b_TB IS
END Proj_1b_TB;
 
ARCHITECTURE behavior OF Proj_1b_TB IS 
 
    COMPONENT Proj1b
    PORT(
         data_in : IN  std_logic_vector(15 downto 0);
         constant_in : IN  std_logic_vector(15 downto 0);
         control_word : IN  std_logic_vector(16 downto 0);
         Clk_sig : IN  std_logic;
         data_out : OUT  std_logic_vector(15 downto 0);
         address_out : OUT  std_logic_vector(15 downto 0);
         N_out : OUT  std_logic;
         Z_out : OUT  std_logic;
         C_out : OUT  std_logic;
         V_out : OUT  std_logic
        );
    END COMPONENT;
   signal data_in : std_logic_vector(15 downto 0) := (others => '0');
   signal constant_in : std_logic_vector(15 downto 0) := (others => '0');
   signal control_word : std_logic_vector(16 downto 0) := (others => '0');
   signal Clk_sig : std_logic := '0';
   signal data_out : std_logic_vector(15 downto 0);
   signal address_out : std_logic_vector(15 downto 0);
   signal N_out : std_logic;
   signal Z_out : std_logic;
   signal C_out : std_logic;
   signal V_out : std_logic;
   constant Clk_sig_period : time := 10 ns;
 
BEGIN
   uut: Proj1b PORT MAP (
          data_in => data_in,
          constant_in => constant_in,
          control_word => control_word,
          Clk_sig => Clk_sig,
          data_out => data_out,
          address_out => address_out,
          N_out => N_out,
          Z_out => Z_out,
          C_out => C_out,
          V_out => V_out
        );
   Clk_sig_process :process
   begin
		Clk_sig <= '0';
		wait for Clk_sig_period/2;
		Clk_sig <= '1';
		wait for Clk_sig_period/2;
   end process;
   stim_proc: process
   begin		
		data_in <= x"FFFF";
		constant_in <= x"0000";
		control_word <= "00000000100000011";
		
		wait for 40ns;
		data_in <= x"AAAA";
		control_word <= "00100000100000011";
		
		wait for 40ns;
		control_word <= "01000000100110001";
		
		wait for 40ns;
		control_word <= "01001001001000000";
		
		wait;
   end process;

END;