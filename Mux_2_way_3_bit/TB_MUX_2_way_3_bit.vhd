library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity TB_MUX_2_way_3_bit is
--  Port ( );
end TB_MUX_2_way_3_bit;

architecture Behavioral of TB_MUX_2_way_3_bit is

COMPONENT Mux_2_way_3_bit
    PORT ( JMP : in STD_LOGIC;
       Add_adder : in STD_LOGIC_VECTOR (2 downto 0);
       Add_JMP : in STD_LOGIC_VECTOR (2 downto 0);
       Add_Out : out STD_LOGIC_VECTOR (2 downto 0));
END COMPONENT;

SIGNAL JMP:STD_LOGIC;
SIGNAL Add_adder, Add_JMP, Add_Out: STD_LOGIC_VECTOR(2 DOWNTO 0);

begin

UUT: Mux_2_way_3_bit
   PORT MAP(
   JMP => JMP,
   Add_adder => Add_adder,
   Add_JMP => Add_JMP,
   Add_Out => Add_Out);

process

begin

    JMP <= '0';
    
    Add_adder <= "001";
    Add_JMP <= "000";
    wait for 100 ns;
    
    Add_adder <= "011";
    Add_JMP <= "010";
    wait for 100 ns;

    Add_adder <= "101";
    Add_JMP <= "100";
    wait for 100 ns;

    JMP <= '1';

    Add_adder <= "001";
    Add_JMP <= "000";
    wait for 100 ns;
    
    Add_adder <= "011";
    Add_JMP <= "010";
    wait for 100 ns;

    Add_adder <= "101";
    Add_JMP <= "100";
    wait ;

end process;

end Behavioral;
