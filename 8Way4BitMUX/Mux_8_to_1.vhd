library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Mux_8_to_1 is
	port(
	S : in std_logic_vector(2 downto 0);
	D : in std_logic_vector(7 downto 0);
	EN : in std_logic;
	Y : out std_logic);
    
end Mux_8_to_1;

architecture Behavioral of Mux_8_to_1 is
	component Decoder_3_to_8
	port(
	I : in std_logic_vector(2 downto 0);
	EN : in std_logic;
	Y : out std_logic_vector(7 downto 0));
	end component;

	signal Y_dec : std_logic_vector(7 downto 0);
	signal Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7 : std_logic;
	
begin

	Decoder_3_to_8_0 : Decoder_3_to_8
        port map(
        I(2 downto 0) => S(2 downto 0),
        EN => EN,
        Y(7 downto 0) => Y_dec(7 downto 0));
	
	Y0 <= Y_dec(0) and d(0);
	Y1 <= Y_dec(1) and d(1);
	Y2 <= Y_dec(2) and d(2);
	Y3 <= Y_dec(3) and d(3);
	Y4 <= Y_dec(4) and d(4);
	Y5 <= Y_dec(5) and d(5);
	Y6 <= Y_dec(6) and d(6);
	Y7 <= Y_dec(7) and d(7);
	
	Y <= Y0 or Y1 or Y2 or Y3 or Y4 or Y5 or Y6 or Y7;
	


end Behavioral;


-- TODO: take and value with each and every bit of the inputs 
-- Y0(0) <= D0(0) and Y_dec(0) 
-- Y0(1) <= D0(1) and Y_dec(0)
-- 
-- Y1(0) <= D1(0) and Y_dec(1)
-- Y1(1) <= D1(1) and Y_dec(1)


-- TODO: Then take or with corresponding bit with every YX value
-- Y(0) <= Y1(0) or Y2(0) or Y3(0) or Y4(0) or Y5(0) or Y6(0) or Y7(0) 
