library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_reg_bank is
--  Port ( );
end TB_reg_bank;

architecture Behavioral of TB_reg_bank is

    COMPONENT Reg_bank
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
    END COMPONENT;

SIGNAL Clk,Reg_bank_res : STD_LOGIC;
SIGNAL Reg_EN : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL Value,Reg0_out, Reg1_out, Reg2_out, Reg3_out, Reg4_out, Reg5_out, Reg6_out, Reg7_out : STD_LOGIC_VECTOR(3 DOWNTO 0);
CONSTANT clock_period : time := 10ns;

begin

UUT: Reg_bank
    PORT MAP(
              Reg_EN => Reg_EN,
              Value => Value,
              Clk => Clk,
              Reg_bank_res => Reg_bank_res,
              Reg0_out => Reg0_out,
              Reg1_out => Reg1_out,
              Reg2_out => Reg2_out,
              Reg3_out => Reg3_out,
              Reg4_out => Reg4_out,
              Reg5_out => Reg5_out,
              Reg6_out => Reg6_out,
              Reg7_out => Reg7_out);
              
clock_process: process
                   begin
                   Clk <= '0';
                   wait for clock_period/2;
                   Clk <= '1';
                   wait for clock_period/2;
                  end process;
                  
sim : process

begin   
            
            Reg_bank_res <= '1';
            Reg_EN <= "001";
            Value <= "1100";
            wait for 100 ns;
            
            Reg_bank_res <= '0';
            Reg_EN <= "001";
            Value <= "1100";
            
            
            wait;
            
   
end process;     
              
              
end Behavioral;

