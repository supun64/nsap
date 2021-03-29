library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Mux_2_way_4_bit is
    Port ( load_slct : in STD_LOGIC;
           im_val : in STD_LOGIC_VECTOR (3 downto 0);
           res_val : in STD_LOGIC_VECTOR (3 downto 0);
           out_val : out STD_LOGIC_VECTOR (3 downto 0));
end Mux_2_way_4_bit;

architecture Behavioral of Mux_2_way_4_bit is

SIGNAL X, Y, Z : STD_LOGIC_VECTOR(3 DOWNTO 0);

begin

X(0) <= res_val(0) AND (NOT load_slct);
X(1) <= res_val(1) AND (NOT load_slct);
X(2) <= res_val(2) AND (NOT load_slct);
X(3) <= res_val(3) AND (NOT load_slct);

Y(0) <= im_val(0) AND load_slct;
Y(1) <= im_val(1) AND load_slct;
Y(2) <= im_val(2) AND load_slct;
Y(3) <= im_val(3) AND load_slct;

Z(0) <= X(0) OR Y(0);
Z(1) <= X(1) OR Y(1);
Z(2) <= X(2) OR Y(2);
Z(3) <= X(3) OR Y(3);

out_val <= Z;

end Behavioral;
