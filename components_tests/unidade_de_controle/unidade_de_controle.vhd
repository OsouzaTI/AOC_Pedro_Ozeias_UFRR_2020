library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity unidade_de_controle is
    port(
        clock       : in std_logic;
        opcode      : in std_logic_vector(3 downto 0);
        jump        : out std_logic;
        branch      : out std_logic;
        memRead     : out std_logic;
        memToReg    : out std_logic;
        ALUOp       : out std_logic_vector(3 downto 0);
        memWrite    : out std_logic;
        AluSrc      : out std_logic;
        RegWrite    : out std_logic
    );
end entity;


-- 0000 -> Soma					| Tipo R
-- 0001 -> Soma imediata		| Tipo I
-- 0010 -> Subtração				| Tipo R
-- 0011 -> Subtração Imediata	| Tipo I
-- 0100 -> multiplicação		| Tipo R
-- 0101 -> Load Word				| Tipo I
-- 0110 -> Store Word			| Tipo I
-- 0111 -> Load Imediato		| Tipo I
-- 1000 -> BEQ						| Tipo J
-- 1001 -> BNE						| Tipo J
-- 1010 -> J						| Tipo J
-- To be Continued

architecture logic of unidade_de_controle is
begin
    
    process(clock, opcode)
    -- iniciando todas as constantes
    constant c_add    : std_logic_vector(3 downto 0) := "0000";
    constant c_addi   : std_logic_vector(3 downto 0) := "0001";
    constant c_sub    : std_logic_vector(3 downto 0) := "0010";
    constant c_subi   : std_logic_vector(3 downto 0) := "0011";
    constant c_mul    : std_logic_vector(3 downto 0) := "0100";
    constant c_lw     : std_logic_vector(3 downto 0) := "0101";
    constant c_sw     : std_logic_vector(3 downto 0) := "0110";
    constant c_li     : std_logic_vector(3 downto 0) := "0111";
    constant c_beq    : std_logic_vector(3 downto 0) := "1000";
    constant c_bne    : std_logic_vector(3 downto 0) := "1001";
    constant c_j      : std_logic_vector(3 downto 0) := "1010";
    constant c_cond   : std_logic_vector(3 downto 0) := "1011";
    begin

        case opcode is 
            when c_add =>
                ALUOp       <= c_add;
                RegWrite    <= '1';
                jump        <= '0';
                branch      <= '0';
                memRead     <= '0';
                memToReg    <= '0';                
                memWrite    <= '0';
                AluSrc      <= '0'; 			 
            when c_addi =>
                ALUOp       <= c_addi;
                AluSrc      <= '1';
                RegWrite    <= '1';
                jump        <= '0';
                branch      <= '0';
                memRead     <= '0';
                memToReg    <= '0';                
                memWrite    <= '0';   		 
            when c_sub =>
                ALUOp       <= c_sub;                
                RegWrite    <= '1';
                jump        <= '0';
                branch      <= '0';
                memRead     <= '0';
                memToReg    <= '0';                
                memWrite    <= '0';
                AluSrc      <= '0'; 				 
            when c_subi =>
                ALUOp       <= c_subi;
                AluSrc      <= '1';
                RegWrite    <= '1';
                jump        <= '0';
                branch      <= '0';
                memRead     <= '0';
                memToReg    <= '0';                
                memWrite    <= '0'; 
            when c_mul =>
                ALUOp       <= c_mul;                
                RegWrite    <= '1';
                jump        <= '0';
                branch      <= '0';
                memRead     <= '0';
                memToReg    <= '0';                
                memWrite    <= '0';
                AluSrc      <= '0';  			 
            when c_lw =>
                ALUOp       <= c_lw;
                memRead     <= '1';
                memToReg    <= '1';
                RegWrite    <= '1';
                jump        <= '0';
                branch      <= '0';                                
                memWrite    <= '0';
                AluSrc      <= '0';                
            when c_sw =>
                ALUOp       <= c_sw;
                memWrite    <= '1';
                jump        <= '0';
                branch      <= '0';
                memRead     <= '0';
                memToReg    <= '0';                                
                AluSrc      <= '0';
                RegWrite    <= '0';
            when c_li =>
                ALUOp       <= c_li;
                AluSrc      <= '1';
                RegWrite    <= '1';
                jump        <= '0';
                branch      <= '0';
                memRead     <= '0';
                memToReg    <= '0';                
                memWrite    <= '0';  			 
            when c_beq =>
                ALUOp       <= c_beq;
                branch      <= '1';
                jump        <= '0';  
                memRead     <= '0';              
                memToReg    <= '0';                
                memWrite    <= '0';
                AluSrc      <= '0';
                RegWrite    <= '0';
            when c_bne =>
                ALUOp       <= c_bne;
                branch      <= '1';
                jump        <= '0';
                memRead     <= '0';                
                memToReg    <= '0';                
                memWrite    <= '0';
                AluSrc      <= '0';
                RegWrite    <= '0';
            when c_j =>
                ALUOp       <= c_j;
                jump        <= '1';
                branch      <= '0';
                memRead     <= '0';
                memToReg    <= '0';                
                memWrite    <= '0';
                AluSrc      <= '0';
                RegWrite    <= '0';
				 when c_cond =>
                ALUOp       <= c_cond;
                jump        <= '0';
                branch      <= '0';
                memRead     <= '0';
                memToReg    <= '0';                
                memWrite    <= '0';
                AluSrc      <= '0';
                RegWrite    <= '0';
            when others => 
                ALUOp       <= c_j;
                jump        <= '0';
                branch      <= '0';
                memRead     <= '0';
                memToReg    <= '0';                
                memWrite    <= '0';
                AluSrc      <= '0';
                RegWrite    <= '0';
            end case;           
    end process;
end;