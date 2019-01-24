----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.02.2018 14:57:54
-- Design Name: 
-- Module Name: multiplexer_tb - Behavioral
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
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
----------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY multiplexer_tb IS
END multiplexer_tb;
 
ARCHITECTURE behavior OF multiplexer_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT multiplexer
    PORT(
         s1: IN  std_logic;
         s2: IN  std_logic;
         s3: IN  std_logic;
         in1 : IN  std_logic_vector(15 downto 0);
         in2 : IN  std_logic_vector(15 downto 0);
         in3 : IN  std_logic_vector(15 downto 0);
         in4 : IN  std_logic_vector(15 downto 0);
         in5 : IN  std_logic_vector(15 downto 0);
         in6 : IN  std_logic_vector(15 downto 0);
         in7 : IN  std_logic_vector(15 downto 0);
         in8 : IN  std_logic_vector(15 downto 0);
         z : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    
   --Inputs
   signal s1 : std_logic := '0';
   signal s2 : std_logic := '0';
   signal s3 : std_logic := '0';
   signal in1 : std_logic_vector(15 downto 0) := (others => '0');
   signal in2 : std_logic_vector(15 downto 0) := (others => '0');
   signal in3 : std_logic_vector(15 downto 0) := (others => '0');
   signal in4 : std_logic_vector(15 downto 0) := (others => '0');
   signal in5 : std_logic_vector(15 downto 0) := (others => '0');
   signal in6 : std_logic_vector(15 downto 0) := (others => '0');
   signal in7 : std_logic_vector(15 downto 0) := (others => '0');
   signal in8 : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal z : std_logic_vector(15 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 --   constant Clk_period : time := 10 ns;
 BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: multiplexer PORT MAP (
          s1 => s1,s2 => s2,s3 => s3,
          in1 => in1,in2 => in2,in3 => in3,in4 => in4,in5 => in5,in6 => in6,in7 => in7,in8 => in8,
          z => z
        );

   stim_proc: process
   begin
		in1 <= x"FFFF";
		in2 <= x"EEEE";
		in3 <= x"DDDD";
		in4 <= x"CCCC";
		in5 <= x"BBBB";
		in6 <= x"AAAA";
		in7 <= x"9999";
		in8 <= x"8888";
		
		wait for 10ns;
		s1 <= '1';s2 <= '0';s3 <= '0';
		
		wait for 10ns;
		s1 <= '0';s2 <= '1';s3 <= '0';
		
		wait for 10ns;
		s1 <= '1';s2 <= '1';s3 <= '0';
		
		wait for 10ns;
		s1 <= '0';s2 <= '0';s3 <= '1';
		
		wait for 10ns;
		s1 <= '1';s2 <= '0';s3 <= '1';
		
		wait for 10ns;
		s1 <= '0';s2 <= '1';s3 <= '1';
		
		wait for 10ns;
		s1 <= '1';s2 <= '1';s3 <= '1';
   end process;

END;
