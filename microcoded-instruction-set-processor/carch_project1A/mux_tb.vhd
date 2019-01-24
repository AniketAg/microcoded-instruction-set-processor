----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.02.2018 20:36:41
-- Design Name: 
-- Module Name: mux_tb - Behavioral
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY mux_tb IS
END mux_tb;
 
ARCHITECTURE behavior OF mux_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux
    PORT(
         in1 : IN  std_logic_vector(15 downto 0);
         in2 : IN  std_logic_vector(15 downto 0);
         s : IN  std_logic;
         z : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal in1 : std_logic_vector(15 downto 0) := (others => '0');
   signal in2 : std_logic_vector(15 downto 0) := (others => '0');
   signal s : std_logic := '0';

 	--Outputs
   signal z : std_logic_vector(15 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   mux_2_16: mux PORT MAP (
          in1 => in1,
          in2 => in2,
          s => s,
          z => z
        ); 

   -- Stimulus process
   stim_proc: process
   begin		
		wait for 10ns;
		in1 <= x"FFFF";
		in2 <= x"AAAA";
		
		wait for 10ns;
		s <= '1';
		
		
		wait for 10ns;
		s <= '0';
		
		wait for 10ns;
		s <= '1';
	
   end process;

END;