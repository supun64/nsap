library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity TB_Decoder_2_to_4 is
end TB_Decoder_2_to_4;

architecture Behavioral of TB_Decoder_2_to_4 is
	component Decoder_2_to_4
	port(
		I : in std_logic_vector(1 downto 0);
		EN : in std_logic;
		Y : out std_logic_vector(3 downto 0));
	end component;
	
	--Inputs
	signal I: std_logic_vector(1 downto 0);
	signal EN: std_logic := '0';
	
	--output
	signal Y: std_logic_vector(3 downto 0);

begin

	utt: Decoder_2_to_4 port map(
		I => I,
		EN => EN,
		
		Y => Y
	);
	
	simulate_process: process
	begin
	
		I <= "00";
		EN <= '0';
	   
	
		wait for 125 ns;
		EN <= not EN;
		
		Wait for 125 ns;
		I <= "01";
		EN <= not EN;
		
		wait for 125 ns;
		EN <= not EN;
		
		Wait for 125 ns;
		I <= "10";
		EN <= not EN;
		
		wait for 125 ns;
		EN <= not EN;
		
		Wait for 125 ns;
		I <= "11";
		EN <= not EN;
		
		wait for 125 ns;
		EN <= not EN;
		
		wait;
		
	end process;


end Behavioral;
