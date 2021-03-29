library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_RCA_3 is
--  Port ( );
end TB_RCA_3;

architecture Behavioral of TB_RCA_3 is

COMPONENT RCA_3
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
       B : in STD_LOGIC_VECTOR (2 downto 0);
       C_in : in STD_LOGIC;
       S : out STD_LOGIC_VECTOR (2 downto 0);
       C_out : out STD_LOGIC);
END COMPONENT;

SIGNAL A,B,S : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL C_in, C_out : STD_LOGIC;

begin

UUT: RCA_3 PORT MAP(
    A => A,
    B => B,
    C_in => C_in,
    S => S,
    C_out => C_out);

PROCESS

BEGIN

    A <= "000";
    B <= "000";
    C_in <= '0';
    WAIT FOR 100ns;
    
    A <= "001";
    B <= "001";
    WAIT FOR 100ns;
    
    A <= "101";
    B <= "100";
    WAIT FOR 100ns;
    
    A <= "011";
    B <= "100";
    WAIT FOR 100ns;
    
    A <= "100";
    B <= "100";
    WAIT FOR 100ns;
    
    A <= "111";
    B <= "111";
    
    WAIT;

END PROCESS;

end Behavioral;
