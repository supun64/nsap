library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Slow_Clk_Sim is
end Slow_Clk_Sim;

architecture Behavioral of Slow_Clk_Sim is

component Slow_Clk
    port (
        Clk_in : in std_logic;
        Clk_out : out std_logic);
end component;

signal Clk_in, Clk_out : std_logic;
constant clock_period: time := 10ns;

begin

UUT: Slow_Clk port map(
    Clk_in => Clk_in,
    Clk_out => Clk_out
);

clock_process: process
  begin
    Clk_in <= '0';
  wait for clock_period/2;
    Clk_in <= '1';
  wait for clock_period/2;
end process;

sim: process
  begin
    wait;
end process;
end Behavioral;