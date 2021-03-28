
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity TB_4_RCA is
end TB_4_RCA;

architecture Behavioral of TB_4_RCA is
	component RCA_4
		port(
		A0 : in std_logic;
		B0 : in std_logic;
		A1 : in std_logic;
		B1 : in std_logic;
		A2 : in std_logic;
		B2 : in std_logic;
		A3 : in std_logic;
		B3 : in std_logic;
		Ctrl : in std_logic;
		S0 : out std_logic;
		S1 : out std_logic;
		S2 : out std_logic;
		S3 : out std_logic;
		C_out : out std_logic);
	end component;
	
	-- inputs - index number : 190375K (0111 + 1010)
	signal a0 : std_logic := '1';
	signal b0 : std_logic := '0';
	signal a1 : std_logic := '1';
	signal b1 : std_logic := '1';
	signal a2 : std_logic := '1';
	signal b2 : std_logic := '0';
	signal a3 : std_logic := '0';
	signal b3 : std_logic := '1';
	signal Ctrl : std_logic := '1';
	
	--outputs
	signal s0: std_logic;
	signal s1: std_logic;
	signal s2: std_logic;
	signal s3: std_logic;
	signal c_out: std_logic;
	
begin

	utt: RCA_4 port map(
	A0 => a0,
	B0 => b0,
	A1 => a1,
	B1 => b1,
	A2 => a2,
	B2 => b2,
	A3 => a3,
	B3 => b3,
	Ctrl => Ctrl,
	S0 => s0,
	S1 => s1,
	S2 => s2,
	S3 => s3,
	C_out => c_out);
	
	-- Main
	main_process : process
	begin
		-- adding 0111 + 1010
		wait for 100 ns;
		
		-- adding 0111 + 1110 a -> 0111, b -> 1110
		a0 <= '1';
		a1 <= '1';
		a2 <= '1';
		a3 <= '0';
		
		b0 <= '0';
		b1 <= '1';
		b2 <= '1';
		b3 <= '1';
		wait for 100 ns;
		
		-- adding 1011 + 1001 a->1001 , b-> 1011
		a0 <= '1';
		a1 <= '0';
		a2 <= '0';
		a3 <= '1';
		
		b0 <= '1';
		b1 <= '1';
		b2 <= '0';
		b3 <= '1';
		wait for 100 ns;
		
		-- adding 1111 + 0001
		a0 <= '1';
		a1 <= '1';
		a2 <= '1';
		a3 <= '1';
		
		b0 <= '1';
		b1 <= '0';
		b2 <= '0';
		b3 <= '0';
		wait for 100 ns;
		
		-- adding 1010 + 0101
		a0 <= '0';
		a1 <= '1';
		a2 <= '0';
		a3 <= '1';
		
		b0 <= '1';
		b1 <= '0';
		b2 <= '1';
		b3 <= '0';
		wait for 100 ns;
		
		-- adding 1000 + 0111
		a0 <= '1';
		a1 <= '1';
		a2 <= '1';
		a3 <= '0';
		
		b0 <= '0';
		b1 <= '0';
		b2 <= '0';
		b3 <= '1';
		wait for 100 ns;
		
		-- adding 1011 + 0001
		a0 <= '1';
		a1 <= '1';
		a2 <= '0';
		a3 <= '1';
		
		b0 <= '1';
		b1 <= '0';
		b2 <= '0';
		b3 <= '0';
		wait for 100 ns;
		
		--Ending the simulation
		
		a0 <= '0';
		a1 <= '0';
		a2 <= '0';
		a3 <= '0';
		
		b0 <= '0';
		b1 <= '0';
		b2 <= '0';
		b3 <= '0';
		
		
		wait;
		
	end process;
		


end Behavioral;
