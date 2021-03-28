library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Decoder_3_to_8 is
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end Decoder_3_to_8;

architecture Behavioral of Decoder_3_to_8 is
	component Decoder_2_to_4
	port(
	I : in std_logic_vector(1 downto 0);
	EN : in std_logic;
	Y: out std_logic_vector(3 downto 0));
	end component;
	
	signal Y0, Y1 : std_logic_vector(3 downto 0);

begin
	Decoder_2_to_4_0 : Decoder_2_to_4
		port map(
		I(1 downto 0) => I(1 downto 0),
		EN => EN,
		Y(3 downto 0) => Y0(3 downto 0)
		);
		
	Decoder_2_to_4_1 : Decoder_2_to_4
		port map(
		I(1 downto 0) => I(1 downto 0),
		EN => EN,
		Y(3 downto 0) => Y1(3 downto 0)
		);
		
		Y(0) <= Y0(0) and (not I(2));
		Y(1) <= Y0(1) and (not I(2));
		Y(2) <= Y0(2) and (not I(2));
		Y(3) <= Y0(3) and (not I(2));
		Y(4) <= Y1(0) and (I(2));
		Y(5) <= Y1(1) and (I(2));
		Y(6) <= Y1(2) and (I(2));
		Y(7) <= Y1(3) and (I(2));


end Behavioral;

-- Look up table 3 to 8 decoder

-- 000 => 00000001 -> y(0)
-- 001 => 00000010 -> y(1)
-- 010 => 00000100 -> y(2)
-- 011 => 00001000 -> y(3)
-- 100 => 00010000 -> y(4)
-- 101 => 00100000 -> y(5)
-- 110 => 01000000 -> y(6)
-- 111 => 10000000 -> y(7)
