library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_InstructionDecoder is
end TB_InstructionDecoder;

architecture Behavioral of TB_InstructionDecoder is
    component InstructionDecoder
    port(
    InstBus : in STD_LOGIC_VECTOR (11 downto 0);
    reg_chk_4_jump : in STD_LOGIC_VECTOR (3 downto 0);
    reg_en : out STD_LOGIC_VECTOR (2 downto 0);
    load_sel : out STD_LOGIC;
    immediate_val : out STD_LOGIC_VECTOR (3 downto 0);
    reg_sel_0 : out STD_LOGIC_VECTOR (2 downto 0);
    reg_sel_1 : out STD_LOGIC_VECTOR (2 downto 0);
    add_sub_sel : out STD_LOGIC;
    jump_flag : out STD_LOGIC;
    jump_address : out STD_LOGIC_VECTOR(2 downto 0));

    end component;

    signal load_sel, add_sub_sel, jump_flag : std_logic;
    signal InstBus : std_logic_vector(11 downto 0);
    signal jump_address, reg_sel_0, reg_sel_1, reg_en : std_logic_vector(2 downto 0);
    signal immediate_val, reg_chk_4_jump : std_logic_vector(3 downto 0);

begin

    UUT: InstructionDecoder
        port map(
            InstBus => InstBus,
            reg_chk_4_jump => reg_chk_4_jump,
            reg_en => reg_en,
            load_sel => load_sel,
            immediate_val => immediate_val,
            reg_sel_0 => reg_sel_0,
            reg_sel_1 => reg_sel_1,
            add_sub_sel => add_sub_sel,
            jump_flag => jump_flag,
            jump_address => jump_address
        );

    sim: process
    begin
        InstBus <= "000010001001";
        wait;
    end process;

end Behavioral;
