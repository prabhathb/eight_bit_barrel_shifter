library ieee;
use ieee.std_logic_1164.all;


entity eight_bit_barrel_shifter_tb is
--emoty
end entity;

architecture tb of eight_bit_barrel_shifter_tb is

--declare a constant for the input bit pattern
	signal bit_pattern : std_logic_vector(7 downto 0) := "00000001";

--declare the component 'eight_bit_barrel_shifter' to be tested

	component eight_bit_barrel_shifter is
		port
		(
			input: IN std_logic_vector(7 downto 0);		--data inputs
			command: IN std_logic_vector(2 downto 0);	--command inputs
			output: OUT std_logic_vector(7 downto 0);	--data outputs
			carry_in: IN std_logic;				--carry input
			carry_out: OUT std_logic			--carry output
		);
	end component;

-- bind the component 'eight_bit_barrel_shifter' to be tested
	for all: eight_bit_barrel_shifter use entity work.eight_bit_barrel_shifter(behavioural);

--declare signals used to test the component 'eight_bit_barrel_shifter'
	signal input_tb: std_logic_vector(7 downto 0) := bit_pattern;
	signal command_tb: std_logic_vector(2 downto 0) := "000";
	signal carry_in_tb: std_logic := '0';
	signal carry_out_tb: std_logic := '0';
	signal output_tb: std_logic_vector(7 downto 0) := "00000000";
begin

--instantiate the component 'eight_bit_barrel_shifter' to test
	u0: eight_bit_barrel_shifter port map(input_tb,command_tb,output_tb,carry_in_tb,carry_out_tb);

-- generate the test inputs
-- input bit pattern is given by the constant 'bit_pattern'
-- selection bits vary from "000" to "111" step by step in 10 ps intervals
	process
	begin

		input_tb <= bit_pattern; command_tb <= "000"; carry_in_tb <= '0';
		wait for 10 ps;
		input_tb <= bit_pattern; command_tb <= "001"; carry_in_tb <= '0';
		wait for 10 ps;
		input_tb <= bit_pattern; command_tb <= "010"; carry_in_tb <= '0';
		wait for 10 ps;
		input_tb <= bit_pattern; command_tb <= "011"; carry_in_tb <= '0';
		wait for 10 ps;
		input_tb <= bit_pattern; command_tb <= "100"; carry_in_tb <= '0';
		wait for 10 ps;
		input_tb <= bit_pattern; command_tb <= "101"; carry_in_tb <= '0';
		wait for 10 ps;
		input_tb <= bit_pattern; command_tb <= "110"; carry_in_tb <= '0';
		wait for 10 ps;
		input_tb <= bit_pattern; command_tb <= "111"; carry_in_tb <= '0';
		wait for 10 ps;
		wait;
	end process;
end architecture;
