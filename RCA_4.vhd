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
		   Ctrl : in std_logic; -- This is used to ctrl the signal for addition and substraction
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
	signal FA0_S, FA0_C, FA1_S, FA1_C, FA2_S, FA2_C, FA3_S, FA3_C, CTRLB0 ,CTRLB1 ,CTRLB2 ,CTRLB3 : std_logic;

    

begin

	-- These are the logic created to implement the substraction of the adder
	CTRLB0 <= B0 xor Ctrl;
	CTRLB1 <= B1 xor Ctrl;
	CTRLB2 <= B2 xor Ctrl;
	CTRLB3 <= B3 xor Ctrl;

	-- Full adder to add the first two bits
	FA_0 : FA
		port map (
			A => A0,
			B => CTRLB0, -- to impliment the substraction
			C_in => Ctrl,
			S => S0,
			C_out => FA0_C);
			
	-- Full adder to add second two bits and carry of FA_0
		FA_1 : FA
			port map (
				A => A1,
				B => CTRLB1, -- to impliment the substraction
				C_in => FA0_C,
				S => S1,
				C_out => FA1_C);
				
	-- Full adder to add the third bits and carry of FA_1
		FA_2 : FA
			port map (
				A => A2,
				B => CTRLB2, -- to impliment the substraction
				C_in => FA1_C,
				S => S2,
				C_out => FA2_C);
				
	-- Full adder to add the fourth bits and carry of FA_2
		FA_3 : FA
			port map (
				A => A3,
				B => CTRLB3, -- to impliment the substraction
				C_in => FA2_C,
				S => S3,
				C_out => C_out);

end Behavioral;
