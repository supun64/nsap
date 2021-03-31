library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity InstructionDecoder is
    Port ( InstBus : in STD_LOGIC_VECTOR (11 downto 0);
           reg_chk_4_jump : in STD_LOGIC_VECTOR (3 downto 0);
           reg_en : out STD_LOGIC_VECTOR (2 downto 0);
           load_sel : out STD_LOGIC;
           immediate_val : out STD_LOGIC_VECTOR (3 downto 0);
           reg_sel_0 : out STD_LOGIC_VECTOR (2 downto 0);
           reg_sel_1 : out STD_LOGIC_VECTOR (2 downto 0);
           add_sub_sel : out STD_LOGIC; -- connected to ctrl in 4bitRCA
           jump_flag : out STD_LOGIC;
           jump_address : out STD_LOGIC_VECTOR(2 downto 0));
end InstructionDecoder;

architecture Behavioral of InstructionDecoder is
    component Decoder_2_to_4
    port(
        I : in STD_LOGIC_VECTOR (1 downto 0);
        EN : in STD_LOGIC;
        Y : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    signal circuit_sel : std_logic_vector(3 downto 0);

begin

-- opcode - c c Ra Ra Ra Rb Rb Rb L L L L
    
    
    -- decoder component
    Decoder_2_to_4_opcode : Decoder_2_to_4
        port map(
            -- TODO: check whether the spliting is working
            I(1 downto 0) => InstBus(11 downto 10), 
            EN => '1',
            Y(3 downto 0) => circuit_sel(3 downto 0)); 


    --TODO: try to arrenge the fetching and writing 
    process(circuit_sel)
        begin

            jump_flag <= '0'; -- to prevent jumping when not needed

            reg_en <= InstBus(9 downto 7);

            reg_sel_0 <= InstBus(9 downto 7);
            reg_sel_1 <= InstBus(6 downto 4);

            immediate_val <= InstBus(3 downto 0); 
            -- This is no use puting this here rather than putting it inside the Mov inst but 
            -- it will ensure this will not raise unneed bugs

            -- Moving
            if(circuit_sel = "0100") then       
                load_sel <= '0';
                  
            -- Adding
            elsif (circuit_sel = "0001") then
                load_sel <= '1'; -- This will prevent fetching immediate value to reg_0
                add_sub_sel <= '0';

            -- Negetion
            elsif (circuit_sel = "0010") then
                load_sel <= '1';
                add_sub_sel <= '1'; -- substraction

                -- calculate the negation
                -- 0 - R = - R
                reg_sel_1 <= InstBus(9 downto 7);
                reg_sel_0 <= "000";
            

            -- Jumping
            elsif (circuit_sel = "1000") then
                reg_en <= "000"; -- to prevent storing jump address

                -- Check whether jumping condition is satisfied
                if (reg_chk_4_jump = "0000") then
                    jump_flag <= '1';
                    jump_address <= InstBus(2 downto 0);
                
                end if;

            end if;


    
    end process;


    

end Behavioral;

-- look up table for instructions
-- 10 => movl r, d
-- 00 => add ra, rb
-- 01 => neg r
-- 11 => jzr r,d


-- look up table for load select
-- 0 => imediate value
-- 1 => add sub unit result

-- look up table for jump
-- 0 => jump disable
-- 1 => jump to the jump address

-- we have used 000 register to prevent storing values of the RCA or Imidiate values into the registers


-- To learn
-- indexing system
-- a = "111100001111"

-- first five bits
-- b = a(11 downto 7);

-- sixth bit
-- c = a(5)
