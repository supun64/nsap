library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_PC is
--  Port ( );
end TB_PC;

architecture Behavioral of TB_PC is

COMPONENT Program_Counter
    PORT ( Clk : in STD_LOGIC;
       Res : in STD_LOGIC;
       Nxt_ins : in STD_LOGIC_VECTOR (2 downto 0);
       Cur_ins : out STD_LOGIC_VECTOR (2 downto 0));
END COMPONENT;

SIGNAL Clk, Res : STD_LOGIC;
SIGNAL Nxt_ins, Cur_ins : STD_LOGIC_VECTOR(2 DOWNTO 0);
CONSTANT clock_period : time := 10ns;

begin

UUT: Program_Counter
    PORT MAP(
    Clk => Clk,
    Res => Res,
    Nxt_ins => Nxt_ins,
    Cur_ins => Cur_ins);
    
clock_process: process
     begin
     Clk <= '0';
     wait for clock_period/2;
     Clk <= '1';
     wait for clock_period/2;
    end process;
    
sim : process

begin
    Res <= '0';
    
    Nxt_ins <= "000";
    WAIT FOR 100 ns;

    Nxt_ins <= "001";
    WAIT FOR 100 ns;
    
    Nxt_ins <= "011";
    WAIT FOR 100 ns;

    Nxt_ins <= "100";
    WAIT FOR 100 ns;

     Res <= '1';

    Nxt_ins <= "110";
    WAIT;
    
end process;
    

end Behavioral;
