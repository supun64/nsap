library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg_with_reset is
    Port ( Reg_in : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_out : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_en : in STD_LOGIC;
           Reg_res : in STD_LOGIC;
           Clk : in STD_LOGIC);
end Reg_with_reset;

architecture Behavioral of Reg_with_reset is

begin

process (Clk) begin
    if (rising_edge(Clk)) then -- respond when clock rises
    
        if Reg_res = '1' then  -- reset 
            Reg_out <= "0000";
          
        else
        
            if Reg_en = '1' then -- Enable should be set
                Reg_out <= Reg_in;
            end if;
        end if;
    end if;
    
end process;


end Behavioral;
