library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Reg_bank is
    Port ( Reg_EN : in STD_LOGIC_VECTOR (2 downto 0);
           Value : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           Reg_bank_res : in STD_LOGIC;
           Reg0_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg1_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg2_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg3_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg4_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg5_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg6_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg7_out : out STD_LOGIC_VECTOR (3 downto 0));
end Reg_bank;

architecture Behavioral of Reg_bank is

COMPONENT Decoder_3_to_8
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
       EN : in STD_LOGIC;
       Y : out STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT;


COMPONENT Reg_with_reset
    Port ( Reg_in : in STD_LOGIC_VECTOR (3 downto 0);
       Reg_out : out STD_LOGIC_VECTOR (3 downto 0);
       Reg_en : in STD_LOGIC;
       Reg_res : in STD_LOGIC;
       Clk : in STD_LOGIC);
    
END COMPONENT;

COMPONENT Slow_Clk
    Port ( Clk_in : in STD_LOGIC;
       Clk_out : out STD_LOGIC);
END COMPONENT;       

SIGNAL Clk_slow, Dec_EN: STD_LOGIC;
SIGNAL Slct_Reg : STD_LOGIC_VECTOR(7 DOWNTO 0);


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
