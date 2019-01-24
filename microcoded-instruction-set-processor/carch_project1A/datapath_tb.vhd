----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.02.2018 01:43:45
-- Design Name: 
-- Module Name: datapath_tb - Behavioral
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
 
ENTITY datapath_tb IS
END datapath_tb;
 
ARCHITECTURE behavior OF datapath_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT register_final
    PORT(
         src_s1 : IN  std_logic;
         src_s2 : IN  std_logic;
         src_s3 : IN  std_logic;
         des_a1 : IN  std_logic;
         des_a2 : IN  std_logic;
         des_a3 : IN  std_logic;
         data_load : IN  std_logic;
         clk : IN  std_logic;
         data : IN  std_logic_vector(15 downto 0);
         Q : OUT  std_logic_vector(15 downto 0);
         r1 : OUT  std_logic_vector(15 downto 0);
         r2 : OUT  std_logic_vector(15 downto 0);
         r3 : OUT  std_logic_vector(15 downto 0);
         r4 : OUT  std_logic_vector(15 downto 0);
         r5 : OUT  std_logic_vector(15 downto 0);
         r6 : OUT  std_logic_vector(15 downto 0);
         r7 : OUT  std_logic_vector(15 downto 0);
         r8 : OUT  std_logic_vector(15 downto 0)
       );
    END COMPONENT;
    

   --Inputs
   signal src_s1 : std_logic := '0';
   signal src_s2 : std_logic := '0';
   signal src_s3 : std_logic := '0';
   signal des_a1 : std_logic := '0';
   signal des_a2 : std_logic := '0';
   signal des_a3 : std_logic := '0';
   signal data_load : std_logic := '0';
   signal clk : std_logic := '0';
   signal data : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal Q : std_logic_vector(15 downto 0);
   signal r1 : std_logic_vector(15 downto 0);
   signal r2 : std_logic_vector(15 downto 0);
   signal r3 : std_logic_vector(15 downto 0);
   signal r4 : std_logic_vector(15 downto 0);
   signal r5 : std_logic_vector(15 downto 0);
   signal r6 : std_logic_vector(15 downto 0);
   signal r7 : std_logic_vector(15 downto 0);
   signal r8 : std_logic_vector(15 downto 0);
      
   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: register_final PORT MAP (
          src_s1 => src_s1,
          src_s2 => src_s2,
          src_s3 => src_s3,
          des_a1 => des_a1,
          des_a2 => des_a2,
          des_a3 => des_a3,
          data_load => data_load,
          clk => clk,
          data => data,
          Q => Q,
          r1 => r1,
          r2 => r2,
          r3 => r3,
          r4 => r4,
          r5 => r5,
          r6 => r6,
          r7 => r7,
          r8 => r8
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		wait for 10ns;
		des_a1 <= '0';
		des_a2 <= '0';
		des_a3 <= '0';
        data <= x"FFFF";
		
		wait for 10ns;
		des_a1 <= '0';
		des_a2 <= '0';
		des_a3 <= '1';
		data <= x"EEEE";
		
		wait for 10ns;
		des_a1 <= '0';
		des_a2 <= '1';
		des_a3 <= '0';
		data <= x"DDDD";
		
		wait for 10ns;
		des_a1 <= '0';
		des_a2 <= '1';
		des_a3 <= '1';
		data <= x"CCCC";
		
		wait for 10ns;
		des_a1 <= '1';
		des_a2 <= '0';
		des_a3 <= '0';
		data <= x"BBBB";
		
		wait for 10ns;
		des_a1 <= '1';
		des_a2 <= '0';
		des_a3 <= '1';
		data <= x"AAAA";
		
		wait for 10ns;
		des_a1 <= '1';
		des_a2 <= '1';
		des_a3 <= '0';
		data <= x"9999";
		
		wait for 10ns;
		des_a1 <= '1';
		des_a2 <= '1';
		des_a3 <= '1';
		data <= x"8888";
   end process;

END;
