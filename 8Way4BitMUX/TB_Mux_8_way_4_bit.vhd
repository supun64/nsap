library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Mux_8_way_4_bit is
end TB_Mux_8_way_4_bit;

architecture Behavioral of TB_Mux_8_way_4_bit is
    component Mux_8_way_4_bit
    port(
    S : in std_logic_vector(2 downto 0);
	
	D0 : in std_logic_vector(3 downto 0);
	D1 : in std_logic_vector(3 downto 0);
	D2 : in std_logic_vector(3 downto 0);
	D3 : in std_logic_vector(3 downto 0);
	D4 : in std_logic_vector(3 downto 0);
	D5 : in std_logic_vector(3 downto 0);
	D6 : in std_logic_vector(3 downto 0);
	D7 : in std_logic_vector(3 downto 0);

	EN : in std_logic;
	
	Y  : out std_logic_vector(3 downto 0));
    
    end component;
    
    --Input
    signal S : std_logic_vector(2 downto 0);
	signal D0, D1, D2, D3, D4, D5, D6, D7 : std_logic_vector(3 downto 0);
	signal EN : std_logic;
	
	--Out
	signal Y: std_logic_vector(3 downto 0);

begin
	utt: Mux_8_way_4_bit port map(
		S => S,
		
		D0 => D0,
		D1 => D1,
		D2 => D2,
		D3 => D3,
		D4 => D4,
		D5 => D5,
		D6 => D6,
		D7 => D7,

		EN => EN,
		
		Y => Y
	);
	
	simulation_process: process
	begin
	
	-- Values for the MUX
		D0 <= "1000";
		D1 <= "1010";
		D2 <= "1110";
		D3 <= "1011";
		D4 <= "1111";
		D5 <= "0000";
		D6 <= "0010";
		D7 <= "1100";
	
	    
	    -- selecting D0 => 1000
	    S <= "000";
	    EN <= '0'; -- Initial value for EN
	    wait for 50 ns;
	    
	    EN <= not EN;
	    wait for 50 ns;
	    

	    -- selecting d1
	    S <= "001";
	    EN <= not EN;
	    wait for 50 ns;
	    
	    EN <= not EN;
	    wait for 50 ns;
	    

		-- selecting d2
	    S <= "010";
	    EN <= not EN;
	    wait for 50 ns;
	    
	    EN <= not EN;
	    wait for 50 ns;
	    

	    -- selecting d3
	    S <= "011";
	    EN <= not EN;
	    wait for 50 ns;
	    
	    EN <= not EN;
	    wait for 50 ns;
	    

	    -- selecting d4
	    S <= "100";
	    EN <= not EN;
	    wait for 50 ns;
	    
	    EN <= not EN;
	    wait for 50 ns;

	    
	    -- selecting d5
	    S <= "101";
	    EN <= not EN;
	    wait for 50 ns;
	    

	    EN <= not EN;
	    wait for 50 ns;
	    

		-- selecting d6
	    S <= "110";
	    EN <= not EN;
	    wait for 50 ns;
	    
	    EN <= not EN;
	    wait for 50 ns;
	    
	    -- selecting d7
	    S <= "111";
	    EN <= not EN;
	    wait for 50 ns;
	    
	    EN <= not EN;
	    wait for 50 ns;
	    
	    
	    wait;

    end process;
end Behavioral;

