library ieee;
use ieee.std_logic_1164.all;

entity eight_to_one_mux is
	port
		(
		input: IN std_logic_vector(7 downto 0);	--inputs
		sel: IN std_logic_vector(2 downto 0);	--selection inputs
		output: OUT std_logic	--output
		);
end entity;

architecture structural of eight_to_one_mux is

--declare the component 'twotoonemux' used in 'eighttoonemux' project
	component two_to_one_mux is
		port
			(
			input0: IN std_logic;	--input pin zero
			input1: IN std_logic;	--input pin one
			sel: IN std_logic;	--selection input pin
			output: OUT std_logic	--output pin
			);
	end component;

--bind the componenet 'twotoonemux' used in 'eighttoonemux' project
	for all: two_to_one_mux use entity work.two_to_one_mux(behavioural_02);

--declare and intermediate signals used to cascade signals
	signal level0: std_logic_vector(3 downto 0) := "0000";
	signal level1: std_logic_vector(1 downto 0) := "00";

begin
--instantiate 7 'twotonemux' componenets used to build up 'eighttoonemux'
	u0:two_to_one_mux port map (input(0),input(1), sel(0),level0(0));
	u1:two_to_one_mux port map (input(2),input(3), sel(0),level0(1));
	u2:two_to_one_mux port map (input(4),input(5), sel(0),level0(2));
	u3:two_to_one_mux port map (input(6),input(7), sel(0),level0(3));
	u4:two_to_one_mux port map (level0(0),level0(1), sel(1),level1(0));
	u5:two_to_one_mux port map (level0(2),level0(3), sel(1),level1(1));
	u6:two_to_one_mux port map (level1(0),level1(1), sel(2),output);

end architecture;
