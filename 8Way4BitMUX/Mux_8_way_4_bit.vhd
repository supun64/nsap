library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Mux_8_way_4_bit is
	port(
	S  : in std_logic_vector(2 downto 0);

	-- input vectors
	D0 : in std_logic_vector(3 downto 0);
	D1 : in std_logic_vector(3 downto 0);
	D2 : in std_logic_vector(3 downto 0);
	D3 : in std_logic_vector(3 downto 0);
	D4 : in std_logic_vector(3 downto 0);
	D5 : in std_logic_vector(3 downto 0);
	D6 : in std_logic_vector(3 downto 0);
	D7 : in std_logic_vector(3 downto 0);

	-- enable switch
	EN : in std_logic;

	-- output vector
	Y  : out std_logic_vector(3 downto 0));
    
end Mux_8_way_4_bit;

architecture Behavioral of Mux_8_way_4_bit is
	component Decoder_3_to_8
	port(
	I : in std_logic_vector(2 downto 0);
	EN : in std_logic;
	Y : out std_logic_vector(7 downto 0));
	end component;

	signal Y_dec : std_logic_vector(7 downto 0);
	signal Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7 : std_logic_vector(3 downto 0);
	
begin

	-- Decoder component
	Decoder_3_to_8_0 : Decoder_3_to_8
        port map(
        I(2 downto 0) => S(2 downto 0),
        EN => EN,
        Y(7 downto 0) => Y_dec(7 downto 0));


	-- extract only the needed YX value using the decoder
	Y0(0) <= Y_dec(0) and D0(0);
	Y0(1) <= Y_dec(0) and D0(1);
	Y0(2) <= Y_dec(0) and D0(2);
	Y0(3) <= Y_dec(0) and D0(3);

	Y1(0) <= Y_dec(1) and D1(0);
	Y1(1) <= Y_dec(1) and D1(1);
	Y1(2) <= Y_dec(1) and D1(2);
	Y1(3) <= Y_dec(1) and D1(3);

	Y2(0) <= Y_dec(2) and D2(0);
	Y2(1) <= Y_dec(2) and D2(1);
	Y2(2) <= Y_dec(2) and D2(2);
	Y2(3) <= Y_dec(2) and D2(3);

	Y3(0) <= Y_dec(3) and D3(0);
	Y3(1) <= Y_dec(3) and D3(1);
	Y3(2) <= Y_dec(3) and D3(2);
	Y3(3) <= Y_dec(3) and D3(3);

	Y4(0) <= Y_dec(4) and D4(0);
	Y4(1) <= Y_dec(4) and D4(1);
	Y4(2) <= Y_dec(4) and D4(2);
	Y4(3) <= Y_dec(4) and D4(3);

	Y5(0) <= Y_dec(5) and D5(0);
	Y5(1) <= Y_dec(5) and D5(1);
	Y5(2) <= Y_dec(5) and D5(2);
	Y5(3) <= Y_dec(5) and D5(3);

	Y6(0) <= Y_dec(6) and D6(0);
	Y6(1) <= Y_dec(6) and D6(1);
	Y6(2) <= Y_dec(6) and D6(2);
	Y6(3) <= Y_dec(6) and D6(3);
	
	Y7(0) <= Y_dec(7) and D7(0);
	Y7(1) <= Y_dec(7) and D7(1);
	Y7(2) <= Y_dec(7) and D7(2);
	Y7(3) <= Y_dec(7) and D7(3);


	-- Getting the final output
	Y(0) <= Y0(0) or Y1(0) or Y2(0) or Y3(0) or Y4(0) or Y5(0) or Y6(0) or Y7(0);
	Y(1) <= Y0(1) or Y1(1) or Y2(1) or Y3(1) or Y4(1) or Y5(1) or Y6(1) or Y7(1);
	Y(2) <= Y0(2) or Y1(2) or Y2(2) or Y3(2) or Y4(2) or Y5(2) or Y6(2) or Y7(2);
	Y(3) <= Y0(3) or Y1(3) or Y2(3) or Y3(3) or Y4(3) or Y5(3) or Y6(3) or Y7(3);
	


end Behavioral;



