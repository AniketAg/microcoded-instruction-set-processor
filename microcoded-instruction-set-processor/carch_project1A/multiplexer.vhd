----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.02.2018 14:36:21
-- Design Name: 
-- Module Name: multiplexer - Behavioral
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplexer is
    Port ( s1, s2, s3 : in  STD_LOGIC;
           in1, in2, in3, in4, in5, in6, in7, in8 : in  STD_LOGIC_VECTOR (15 downto 0);
           z : out  STD_LOGIC_VECTOR (15 downto 0));
end multiplexer;

architecture Behavioral of multiplexer is

begin
   z <= in1 after 5ns when s1 = '0' and s2 = '0' and s3 = '0' else
        in2 after 5ns when s1 = '0' and s2 = '0' and s3 = '1' else
        in3 after 5ns when s1 = '0' and s2 = '1' and s3 = '0' else
        in4 after 5ns when s1 = '0' and s2 = '1' and s3 = '1' else
        in5 after 5ns when s1 = '1' and s2 = '0' and s3 = '0' else
        in6 after 5ns when s1 = '1' and s2 = '0' and s3 = '1' else
        in7 after 5ns when s1 = '1' and s2 = '1' and s3 = '0' else
        in8 after 5ns when s1 = '1' and s2 = '1' and s3 = '1' else
        x"0000" after 5ns;
end Behavioral;