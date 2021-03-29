library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- This will store given three bits 
-- TODO: adding is not implemented need to connect the out for a three bit adder
entity Program_Counter is
    Port ( Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Nxt_ins : in STD_LOGIC_VECTOR (2 downto 0);
           Cur_ins : out STD_LOGIC_VECTOR (2 downto 0));
end Program_Counter;

architecture Behavioral of Program_Counter is

COMPONENT D_FF
    PORT ( D : in STD_LOGIC;
       Res : in STD_LOGIC;
       Clk : in STD_LOGIC;
       Q : out STD_LOGIC;
       Qbar : out STD_LOGIC);
END COMPONENT;

COMPONENT Slow_Clk
    PORT (
    Clk_in : in STD_LOGIC;
    Clk_out: out STD_LOGIC);
END COMPONENT;

SIGNAL Clk_slow : std_logic; -- Internal clock

begin

Slow_Clk0 : Slow_Clk
PORT MAP(
    Clk_in => Clk,
    Clk_out => Clk_slow);

D_FF0 : D_FF
PORT MAP(
    D => Nxt_ins(0),
    Res => Res,
    Clk => Clk_slow,
    Q => Cur_ins(0));

D_FF1 : D_FF
PORT MAP(
    D => Nxt_ins(1),
    Res => Res,
    Clk => Clk_slow,
    Q => Cur_ins(1));
    
D_FF2 : D_FF
    PORT MAP(
        D => Nxt_ins(2),
        Res => Res,
        Clk => Clk_slow,
        Q => Cur_ins(2));


end Behavioral;
