library ieee;
use ieee.std_logic_1164.all;

entity p_xor is
    port (
        in_port_a : in std_logic;
        in_port_b : in std_logic;
        out_port : out std_logic
    );
end p_xor;

architecture behavior of p_xor is

	component p_and is
		 port (
			  in_port_a : in std_logic;
			  in_port_b : in std_logic;
			  out_port : out std_logic
		 );
	end component;
	
	component p_or is
		 port (
			  in_port_a : in std_logic;
			  in_port_b : in std_logic;
			  out_port : out std_logic
		 );
	end component;
	
	component p_not is
		 port (
			  in_port_a : in std_logic;
			  out_port : out std_logic
		 );
	end component;
	
	signal not_a, not_b, out_and_1, out_and_2, out_or: std_logic;
	
begin
	
		n_a : p_not port map(in_port_a, not_a);
		n_b : p_not port map(in_port_b, not_b);
		
		p_an : p_and port map(not_a, in_port_b, out_and_1);
		p_bn : p_and port map(in_port_a, not_b, out_and_2);
		
		p_o : p_or port map(out_and_1, out_and_2, out_or);
		
		out_port <= out_or;
    
end behavior;