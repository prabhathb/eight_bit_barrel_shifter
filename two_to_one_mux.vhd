library ieee;
use ieee.std_logic_1164.all;

entity two_to_one_mux is
	port(
		input0: IN std_logic;	--input pin zero
		input1: IN std_logic;	--input pin one
		sel: IN std_logic;	--selection input pin
		output: OUT std_logic	--output pin
        );
end entity;

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
architecture behavioural_01 of two_to_one_mux is

begin
	output <= input0 when sel = '0' else input1;
end architecture;

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
architecture behavioural_02 of two_to_one_mux is

begin
	process (sel,input0,input1)
	begin
		if (sel = '0') then
			output <= input0;
		elsif (sel = '1') then
			output <= input1;
		end if;
	end process;

end architecture;

------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------
architecture dataflow of two_to_one_mux is

begin
	output <= (input0 AND ( NOT sel)) OR (input1 AND sel);
end architecture;
