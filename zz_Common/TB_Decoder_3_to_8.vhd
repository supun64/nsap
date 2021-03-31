library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Decoder_3_to_8 is
end TB_Decoder_3_to_8;

architecture Behavioral of TB_Decoder_3_to_8 is
	component Decoder_3_to_8
	port(
	    I : in STD_LOGIC_VECTOR (2 downto 0);
        EN : in STD_LOGIC;
        Y : out STD_LOGIC_VECTOR (7 downto 0)
		);
	end component;
	
	--Input
	signal I: std_logic_vector(2 downto 0);
	signal EN: std_logic;
	
	--output
	signal Y: std_logic_vector(7 downto 0);

begin
	utt: Decoder_3_to_8 port map(
	I => I,
	EN => EN,
	Y => Y);
	
	
	
	simulate_Process: process
	begin
	-- Index Number 190375K
	    -- First input
	    I <= "111";
	    EN <= '0'; -- Initial value for EN
	    wait for 100 ns;
	    
	    EN <= not EN;
	    wait for 100 ns;
	    
	    -- Second Input
	    I <= "100";
	    EN <= not EN;
	    wait for 100 ns;
	    
	    EN <= not EN;
	    wait for 100 ns;
	    
	    -- Third Input
	    I <= "110";
	    EN <= not EN;
	    wait for 100 ns;
	    
	    EN <= not EN;
	    wait for 100 ns;
	    
	    -- Fourth input
	    I <= "011";
	    EN <= not EN;
	    wait for 100 ns;
	    
	    EN <= not EN;
	    wait for 100 ns;
	    
	    wait;
	    
	    
	end process;
	
		


end Behavioral;
