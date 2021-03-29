library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity Mux_2_way_3_bit is
    Port ( JMP : in STD_LOGIC;
           Add_adder : in STD_LOGIC_VECTOR (2 downto 0);
           Add_JMP : in STD_LOGIC_VECTOR (2 downto 0);
           Add_Out : out STD_LOGIC_VECTOR (2 downto 0));
           
end Mux_2_way_3_bit;

architecture Behavioral of Mux_2_way_3_bit is

SIGNAL X, Y, Z : STD_LOGIC_VECTOR(2 DOWNTO 0);

begin

X(0) <= Add_adder(0) AND (NOT JMP);
X(1) <= Add_adder(1) AND (NOT JMP);
X(2) <= Add_adder(2) AND (NOT JMP);

Y(0) <= Add_JMP(0) AND JMP;
Y(1) <= Add_JMP(1) AND JMP;
Y(2) <= Add_JMP(2) AND JMP;

Z(0) <= X(0) OR Y(0);
Z(1) <= X(1) OR Y(1);
Z(2) <= X(2) OR Y(2);
Add_out <= Z;

end Behavioral;
