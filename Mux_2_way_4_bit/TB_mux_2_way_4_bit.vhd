library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_mux_2_way_4_bit is
--  Port ( );
end TB_mux_2_way_4_bit;

architecture Behavioral of TB_mux_2_way_4_bit is

COMPONENT Mux_2_way_4_bit
    Port ( load_slct : in STD_LOGIC;
       im_val : in STD_LOGIC_VECTOR (3 downto 0);
       res_val : in STD_LOGIC_VECTOR (3 downto 0);
       out_val : out STD_LOGIC_VECTOR (3 downto 0));

END COMPONENT;

SIGNAL load_slct: STD_LOGIC;
SIGNAL im_val, res_val, out_val: STD_LOGIC_VECTOR(3 DOWNTO 0);

begin

UUT : Mux_2_way_4_bit
    PORT MAP(
    load_slct => load_slct,
    im_val => im_val,
    res_val => res_val,
    out_val => out_val);

PROCESS

BEGIN

    load_slct <= '0';
    
    res_val <= "0001";
    im_val <= "0000";
    wait for 100 ns;
    
    res_val <= "1101";
    im_val <= "0010";
    wait for 100 ns;
    
    res_val <= "1001";
    im_val <= "0110";
    wait for 100 ns;

    res_val <= "1111";
    im_val <= "0011";
    wait for 100 ns;

    load_slct <= '1';

    res_val <= "0001";
    im_val <= "0000";
    wait for 100 ns;
    
    res_val <= "1101";
    im_val <= "0010";
    wait for 100 ns;
    
    res_val <= "1001";
    im_val <= "0110";
    wait for 100 ns;

    res_val <= "1111";
    im_val <= "0011";
    wait;
    
END PROCESS;    

end Behavioral;
