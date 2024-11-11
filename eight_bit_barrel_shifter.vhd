library ieee;
use ieee.std_logic_1164.all;

entity eight_bit_barrel_shifter is
	port
	(
		input: IN std_logic_vector(7 downto 0);		--data inputs
		command: IN std_logic_vector(2 downto 0);	--command inputs
		output: OUT std_logic_vector(7 downto 0);	--data outputs
		carry_in: IN std_logic;				--carry input
		carry_out: OUT std_logic			--carry output
	);
end entity;

architecture behavioural of eight_bit_barrel_shifter is

--daclare the component 'eighttoonemux' used in 'eight_bit_barrel_shifter' project
	component eight_to_one_mux is
		port
		(
			input: IN std_logic_vector(7 downto 0);	--inputs
			sel: IN std_logic_vector(2 downto 0);	--selection inputs
			output: OUT std_logic			--output
		);
	end component;

--bind the component 'eighttoonemux' used in 'eight_bit_barrel_shifter' project
	for all: eight_to_one_mux use entity work.eight_to_one_mux(structural);

--declare and define signals to be used 
	signal pattern0: std_logic_vector(7 downto 0) := "00000000";	--mux0
	signal pattern1: std_logic_vector(7 downto 0) := "00000000";	--mux1
	signal pattern2: std_logic_vector(7 downto 0) := "00000000";	--mux2
	signal pattern3: std_logic_vector(7 downto 0) := "00000000";	--mux3
	signal pattern4: std_logic_vector(7 downto 0) := "00000000";	--mux4
	signal pattern5: std_logic_vector(7 downto 0) := "00000000";	--mux5
	signal pattern6: std_logic_vector(7 downto 0) := "00000000";	--mux6
	signal pattern7: std_logic_vector(7 downto 0) := "00000000";	--mux7
	signal pattern8: std_logic_vector(7 downto 0) := "00000000";	--mux8 for carry_out


begin

--	selection inputs of the muxes are assgined as follows for the operations
--	000 = transfer							(MOV)
--	001 = logical shift left					(LSL)
--	010 = logical shift right					(LSR)
--	011 = airthmetic shift right (with sign bit duplicated)		(ASR)
--	100 = rotate left						(ROL)
--	101 = rotate left through carry					(ROLC)
--	110 = rotate right						(ROR)
--	111 = rotate right through carry				(RORC)
--                        111     110       101      100      011      010      001      000
	pattern0 <= (input(1)&input(1)&carry_in&input(7)&input(1)&input(1)&     '0'&input(0));
	pattern1 <= (input(2)&input(2)&input(0)&input(0)&input(2)&input(2)&input(0)&input(1));
	pattern2 <= (input(3)&input(3)&input(1)&input(1)&input(3)&input(3)&input(1)&input(2));
	pattern3 <= (input(4)&input(4)&input(2)&input(2)&input(4)&input(4)&input(2)&input(3));
	pattern4 <= (input(5)&input(5)&input(3)&input(3)&input(5)&input(5)&input(3)&input(4));
	pattern5 <= (input(6)&input(6)&input(4)&input(4)&input(6)&input(6)&input(4)&input(5));
	pattern6 <= (input(7)&input(7)&input(5)&input(5)&input(7)&input(7)&input(5)&input(6));
	pattern7 <= (carry_in&input(0)&input(6)&input(6)&input(7)&     '0'&input(6)&input(7));
	pattern8 <= (input(0)&input(0)&input(7)&input(7)&input(0)&input(0)&input(7)&carry_in);

--instantiate 8 'eighttoonemux' components to build up 'eight_bit_barrel_shifter'
	u0:eight_to_one_mux port map (pattern0,command,output(0));
	u1:eight_to_one_mux port map (pattern1,command,output(1));
	u2:eight_to_one_mux port map (pattern2,command,output(2));
	u3:eight_to_one_mux port map (pattern3,command,output(3));
	u4:eight_to_one_mux port map (pattern4,command,output(4));
	u5:eight_to_one_mux port map (pattern5,command,output(5));
	u6:eight_to_one_mux port map (pattern6,command,output(6));
	u7:eight_to_one_mux port map (pattern7,command,output(7));
	u8:eight_to_one_mux port map (pattern8,command,carry_out);


end architecture;
