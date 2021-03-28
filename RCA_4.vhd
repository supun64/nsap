library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RCA_4 is
    Port ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           A3 : in STD_LOGIC;
           B0 : in STD_LOGIC;
           B1 : in STD_LOGIC;
           B2 : in STD_LOGIC;
           B3 : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S0 : out STD_LOGIC;
           S1 : out STD_LOGIC;
           S2 : out STD_LOGIC;
           S3 : out STD_LOGIC;
           C_out : out STD_LOGIC);
end RCA_4;

architecture Behavioral of RCA_4 is
	component FA
		port(
		A : in std_logic;
		B : in std_logic;
		C_in : in std_logic;
		S : out std_logic;
		C_out :out std_logic);
	end component;
	
	-- Wires used in the shemetic
	signal FA0_S, FA0_C, FA1_S, FA1_C, FA2_S, FA2_C, FA3_S, FA3_C : std_logic;

    

begin

	-- Full adder to add the first two bits
	FA_0 : FA
		port map (
			A => A0,
			B => B0,
			C_in => '0',
			S => S0,
			C_out => FA0_C);
			
	-- Full adder to add second two bits and carry of FA_0
		FA_1 : FA
			port map (
				A => A1,
				B => B1,
				C_in => FA0_C,
				S => S1,
				C_out => FA1_C);
				
	-- Full adder to add the third bits and carry of FA_1
		FA_2 : FA
			port map (
				A => A2,
				B => B2,
				C_in => FA1_C,
				S => S2,
				C_out => FA2_C);
				
	-- Full adder to add the fourth bits and carry of FA_2
		FA_3 : FA
			port map (
				A => A3,
				B => B3,
				C_in => FA2_C,
				S => S3,
				C_out => C_out);

end Behavioral;
