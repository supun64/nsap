library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Reg_bank is
    Port ( Reg_EN : in STD_LOGIC_VECTOR (2 downto 0); -- enable switch for regs
           Value : in STD_LOGIC_VECTOR (3 downto 0); -- input value for bank
           Clk : in STD_LOGIC; -- original clock
           Reg_bank_res : in STD_LOGIC; -- reset button for registors
           Reg0_out : out STD_LOGIC_VECTOR (3 downto 0); -- reg 0 out
           Reg1_out : out STD_LOGIC_VECTOR (3 downto 0); -- reg 1 out
           Reg2_out : out STD_LOGIC_VECTOR (3 downto 0); -- reg 2 out
           Reg3_out : out STD_LOGIC_VECTOR (3 downto 0); -- reg 3 out
           Reg4_out : out STD_LOGIC_VECTOR (3 downto 0); -- reg 4 out
           Reg5_out : out STD_LOGIC_VECTOR (3 downto 0); -- reg 5 out
           Reg6_out : out STD_LOGIC_VECTOR (3 downto 0); -- reg 6 out
           Reg7_out : out STD_LOGIC_VECTOR (3 downto 0)); -- reg 7 out
end Reg_bank;

architecture Behavioral of Reg_bank is

-- Decoder
COMPONENT Decoder_3_to_8
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0); -- reg_en goes for this
       EN : in STD_LOGIC; -- always true
       Y : out STD_LOGIC_VECTOR (7 downto 0)); -- decoded values
END COMPONENT;

-- 4 bit register
COMPONENT Reg_with_reset
    Port ( Reg_in : in STD_LOGIC_VECTOR (3 downto 0); -- input for register
       Reg_out : out STD_LOGIC_VECTOR (3 downto 0); -- output for register
       Reg_en : in STD_LOGIC; -- enable switch out of the decoder is set for here
       Reg_res : in STD_LOGIC; -- reset for register bank is set here
       Clk : in STD_LOGIC); -- slow clock is set here
    
END COMPONENT;

-- slow clock component
COMPONENT Slow_Clk
    Port ( Clk_in : in STD_LOGIC; -- clock value given for the register bank set here
       Clk_out : out STD_LOGIC); -- register bank uses this clock (2Hz to 1Hz default)
END COMPONENT;       

SIGNAL Clk_slow, Dec_EN: STD_LOGIC;
SIGNAL Slct_Reg : STD_LOGIC_VECTOR(7 DOWNTO 0); -- fetching registry select vector


begin

Dec_EN <= '1';

Slow_Clock0 : Slow_Clk
    PORT MAP(
    Clk_in => Clk,
    Clk_out => Clk_slow);

Decoder : Decoder_3_to_8
    PORT MAP(
    I => Reg_EN,
    EN => Dec_EN,
    Y => Slct_Reg);
    
-- always uses as 0000
Reg_0 : Reg_with_reset
    PORT MAP(
    Reg_in => "0000",
    Reg_out => Reg0_out,
    Reg_en => Slct_Reg(0),
    Reg_res => Reg_bank_res,
    Clk =>  Clk_slow); 

Reg_1 : Reg_with_reset
    PORT MAP(
    Reg_in => Value,
    Reg_out => Reg1_out,
    Reg_en => Slct_Reg(1),
    Reg_res => Reg_bank_res,
    Clk =>  Clk_slow);
    
Reg_2 : Reg_with_reset
        PORT MAP(
        Reg_in => Value,
        Reg_out => Reg2_out,
        Reg_en => Slct_Reg(2),
        Reg_res => Reg_bank_res,
        Clk =>  Clk_slow);

Reg_3 : Reg_with_reset
    PORT MAP(
    Reg_in => Value,
    Reg_out => Reg3_out,
    Reg_en => Slct_Reg(3),
    Reg_res => Reg_bank_res,
    Clk =>  Clk_slow);

Reg_4 : Reg_with_reset
    PORT MAP(
    Reg_in => Value,
    Reg_out => Reg4_out,
    Reg_en => Slct_Reg(4),
    Reg_res => Reg_bank_res,
    Clk =>  Clk_slow);

Reg_5 : Reg_with_reset
    PORT MAP(
    Reg_in => Value,
    Reg_out => Reg5_out,
    Reg_en => Slct_Reg(5),
    Reg_res => Reg_bank_res,
    Clk =>  Clk_slow);

Reg_6 : Reg_with_reset
    PORT MAP(
    Reg_in => Value,
    Reg_out => Reg6_out,
    Reg_en => Slct_Reg(6),
    Reg_res => Reg_bank_res,
    Clk =>  Clk_slow);

Reg_7 : Reg_with_reset
    PORT MAP(
    Reg_in => Value,
    Reg_out => Reg7_out,
    Reg_en => Slct_Reg(7),
    Reg_res => Reg_bank_res,
    Clk =>  Clk_slow);
    
end Behavioral;
