----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.02.2018 19:32:59
-- Design Name: 
-- Module Name: decoder_tb - Behavioral
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
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity decoder_tb is
end;

architecture behavior of decoder_tb is

  component decoder
      port(A1, A2, A3: in std_logic;
           D1, D2, D3, D4, D5, D6, D7, D8: out std_logic);
  end component;

  signal A1, A2, A3: std_logic;
  signal D1, D2, D3, D4, D5, D6, D7, D8: std_logic;

begin

  uut: decoder port map ( A1 => A1,A2 => A2, A3 => A3,
                          D1 => D1,D2 => D2,D3 => D3,D4 => D4,D5 => D5,D6 => D6,D7 => D7,D8 => D8
                         );

  stimulus: process
  begin
          wait for 10ns;
          A1 <= '0';A2 <= '0';A3 <= '0';
          wait for 10ns;
          A1 <= '0';A2 <= '0';A3 <= '1';
          wait for 10ns;
          A1 <= '0';A2 <= '1';A3 <= '0';
          wait for 10ns;
          A1 <= '0';A2 <= '1';A3 <= '1';
          wait for 10ns;
          A1 <= '1';A2 <= '0';A3 <= '0';
          wait for 10ns;
          A1 <= '1';A2 <= '0';A3 <= '1';
          wait for 10ns;
          A1 <= '1';A2 <= '1';A3 <= '0';
          wait for 10ns;
          A1 <= '1';A2 <= '1';A3 <= '1';
          
    wait;
  end process;


end;