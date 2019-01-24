----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.03.2018 17:49:01
-- Design Name: 
-- Module Name: reg2_tb - Behavioral
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
 
ENTITY reg2_TB IS
END reg2_TB;
 
ARCHITECTURE behavior OF reg2_TB IS 
 
    COMPONENT reg2
    PORT(
         des_D : IN  std_logic_vector(2 downto 0);
         add_a : IN  std_logic_vector(2 downto 0);
         add_b : IN  std_logic_vector(2 downto 0);
         Clk : IN  std_logic;
         load_in : IN  std_logic;
         data : IN  std_logic_vector(15 downto 0);
         out_data_a : OUT  std_logic_vector(15 downto 0);
         out_data_b : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
   signal des_D : std_logic_vector(2 downto 0) := (others => '0');
   signal add_a : std_logic_vector(2 downto 0) := (others => '0');
   signal add_b : std_logic_vector(2 downto 0) := (others => '0');
   signal Clk : std_logic := '0';
   signal load_in : std_logic := '0';
   signal data : std_logic_vector(15 downto 0) := (others => '0');

   signal out_data_a : std_logic_vector(15 downto 0);
   signal out_data_b : std_logic_vector(15 downto 0);
   constant Clk_period : time := 10ns;
 
BEGIN
 
   uut: reg2 PORT MAP (
          des_D => des_D,
          add_a => add_a,
          add_b => add_b,
          Clk => Clk,
          load_in => load_in,
          data => data,
          out_data_a => out_data_a,
          out_data_b => out_data_b
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
		
   end process;

END;