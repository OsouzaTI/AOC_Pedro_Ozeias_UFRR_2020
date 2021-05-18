-----------------------------------------------------
-- title       : Memoria ROM
-- project     : Processador X
-- file        : rom.vhd
-- author      : Ozeias Souza
-----------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;

entity rom is
    port(
        clock : in std_logic;       -- clock
        in_A      : in std_logic_vector(7 downto 0); -- valor        
        S_out     : out std_logic_vector(7 downto 0) -- saida
    );
end entity;

architecture logic of rom is
    -- array de 8 posições contendo vetores lógicos de 8bits
    type mem_t is array (0 to 255) of std_logic_vector(7 downto 0);
    -- carregando arquivo para a memória usando o algoritmo acima
    constant mem : mem_t := (

        -- Teste addi, add, subi, li e jump
        --0 => "01110010", -- addi S0 2 -- S0 == 2
        --1 => "01110111", -- addi S1 3 -- S1 == 3
        --2 => "00000001", -- add S0 S1 -- S0 == 5
		--0 => "01110010",
		--1 => "01110110",
		--2 => "00000001",
		-- fatorial
--		0 => "00010101", -- addi $1 1
--		1 => "00010001", -- addi $0 1
--		2 => "01000100", -- mult $1 $0 -- jump aqui
--		3 => "00010001", -- addi $0 1
--		4 => "10100010", -- jump 0010

		   -- Teste beq..
--		 0 => "01110010", -- li S0 2
--		 1 => "01110110", -- li S1 2
--		 2 => "10110001", -- if S0 == S1
--		 3 => "10000110", -- beq S0 == S1 jump 0110
--		 4 => "00010011", -- addi S0 3
--		 5 => "00010011", -- addi S0 3
--		 6 => "00000001", -- add S0 S1
--		 7 => "01110000", -- li S0 0
--		 8 => "01110100", -- li S1 0
--		 9 => "10100000", -- jump 0000
		
		-- fibonacci
		-- primeiros passos
--		0 => "00010000",  -- adiciono 0 em reg(00)
--		1 => "01100000",  -- guardo na ram a constante de reg(00)
--		2 => "00010001",  -- addi $0 1
--		3 => "00010101",  -- addi $1 1
--		4 => "01011100",  -- pego da ram(00) a constante 0
--		5 => "00001101",  -- add $3 $1				
--		6 => "00000100",  -- add $2 $1
--		7 => "01010000",  -- pega da ram(00) a constante 0
--		8 => "00000011",  -- add $0 $3
--		9 => "10100100", -- j 0100
		
--		0 => "00010000",  -- adiciono 0 em reg(00)
--		1 => "01100000",  -- guardo na ram a constante de reg(00)
--		2 => "00010001",  -- addi $0 1
--		3 => "00010101",  -- addi $1 1
--		4 => "01011100",  -- pego da ram(00) a constante 0
--		5 => "00001101",  -- add $3 $1				
--		6 => "00000100",  -- add $2 $1
--		7 => "10110001",  -- print ?		
--		8 =>  "01010000",  -- pega da ram(00) a constante 0
--		9 => "00000011",  -- add $0 $3
--		10 => "10100100", -- j 0100

-- fatorial com beq
0 => "01111011", 
1 => "00011011",
2 => "01110001",
3 => "01110101",
4 => "01000100",
5 => "00010001",
6 => "10110010",
7 => "10001010",
8 => "10100100",
others => "00000000"

    );
    
begin

    process(clock)
    begin
        S_out <= mem(conv_integer(unsigned(in_A)));
    end process;

end;