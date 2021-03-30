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
           add_sub_sel : out STD_LOGIC;
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
    
    -- decoder component
    Decoder_2_to_4_opcode : Decoder_2_to_4
        port map(
            -- TODO: check whether the spliting is working
            I(1 downto 0) => InstBus(11 downto 10), 
            EN => '1',
            Y(3 downto 0) => circuit_sel(3 downto 0)); 

    -- activate movl r, d

    process (InstBus)
    begin
    
        if(circuit_sel = "0001") then
            reg_en <= InstBus(9 downto 7);
            load_sel <= '0';
            immediate_val <= InstBus(3 downto 0);
        
        end if;

    end process;

end Behavioral;

-- look up table for instructions
-- 00 => movl r, d
-- 01 => add ra, rb
-- 10 => neg r
-- 11 => jzr r,d


-- look up table for load select
-- 0 => imediate value
-- 1 => add sub unit result
