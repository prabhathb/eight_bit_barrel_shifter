The design of an eight bit barrel shifter is presented here. A Bottom-up design approach is followed with the bottom most entity being a two input multiplexer and the top most entity being an eight bit barrel shifter. 

The two input muiltiplexer is instantiated six times to create the eight input multiplexer in a heirarchical manner.

The disgned eight bit barrel shifter supports the follwoing operations. Selection inputs of the muxes are assgined as follows for the operations.

--	000 = transfer							                              (MOV)

--	001 = logical shift left					                        (LSL)

--	010 = logical shift right					                        (LSR)

--	011 = airthmetic shift right (with sign bit duplicated)		(ASR)

--	100 = rotate left						                              (ROL)

--	101 = rotate left through carry					                  (ROLC)

--	110 = rotate right						                            (ROR)

--	111 = rotate right through carry				                  (RORC)

Snap shots of the test results are also provided.

Test benched was simulated on ModelSim starter edition 2020.1 by Mentor Graphics.
