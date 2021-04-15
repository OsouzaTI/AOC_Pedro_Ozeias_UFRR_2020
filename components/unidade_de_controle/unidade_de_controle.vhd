library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity controle is
    port(
        clock       : in std_logic;
        opcode      : in std_logic_vector(3 downto 0);
        reg_dst     : in std_logic;
        jump        : in std_logic;
        branch      : in std_logic;
        memRead     : in std_logic;
        memToReg    : in std_logic;
        ALUOp       : in std_logic_vector(3 downto 0);
        memWrite    : in std_logic;
        AluSrc      : in std_logic;
        RegWrite    : in std_logic      
    );
end entity;


-- 0000 -> Soma					| Tipo R
-- 0001 -> Soma imediata		| Tipo I
-- 0010 -> Subtração			| Tipo R
-- 0011 -> Subtração Imediata	| Tipo I
-- 0100 -> multiplicação		| Tipo R
-- 0101 -> Load Word			| Tipo I
-- 0110 -> Store Word			| Tipo I
-- 0111 -> Load Imediato		| Tipo I
-- 1000 -> BEQ					| Tipo J
-- 1001 -> BNE					| Tipo J
-- 1010 -> J					| Tipo J
-- To be Continued

architecture logic of controle is
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
    
    begin

        case opcode is 
            when c_add =>
                ALUOp       <= c_add;
                RegWrite    <= '1';
                reg_dst     <= '0';
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
                reg_dst     <= '0';
                jump        <= '0';
                branch      <= '0';
                memRead     <= '0';
                memToReg    <= '0';                
                memWrite    <= '0';                                
            when c_sub =>
                ALUOp       <= c_sub;                
                RegWrite    <= '1';
                reg_dst     <= '0';
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
                reg_dst     <= '0';
                jump        <= '0';
                branch      <= '0';
                memRead     <= '0';
                memToReg    <= '0';                
                memWrite    <= '0';                                
            when c_mul =>
                ALUOp       <= c_mul;                
                RegWrite    <= '1';
                reg_dst     <= '0';
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
                reg_dst     <= '0';
                jump        <= '0';
                branch      <= '0';                                
                memWrite    <= '0';
                AluSrc      <= '0';
                
            when c_sw =>
                ALUOp       <= c_sw;
                memWrite    <= '1';
                reg_dst     <= '0';
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
                reg_dst     <= '0';
                jump        <= '0';
                branch      <= '0';
                memRead     <= '0';
                memToReg    <= '0';                
                memWrite    <= '0';                                
            when c_beq =>
                ALUOp       <= c_beq;
                branch      <= '1';
                reg_dst     <= '0';
                jump        <= '0';  
                memRead     <= '0';              
                memToReg    <= '0';                
                memWrite    <= '0';
                AluSrc      <= '0';
                RegWrite    <= '0';
            when c_bne =>
                ALUOp       <= c_bne;
                branch      <= '1';
                reg_dst     <= '0';
                jump        <= '0';
                memRead     <= '0';                
                memToReg    <= '0';                
                memWrite    <= '0';
                AluSrc      <= '0';
                RegWrite    <= '0';
            when c_j =>
                ALUOp       <= c_j;
                jump        <= '1';
                reg_dst     <= '0';                
                branch      <= '0';
                memRead     <= '0';
                memToReg    <= '0';                
                memWrite    <= '0';
                AluSrc      <= '0';
                RegWrite    <= '0';
            when others => 
                ALUOp       <= "1111";
                reg_dst     <= '0';
                jump        <= '0';
                branch      <= '0';
                memRead     <= '0';
                memToReg    <= '0';                
                memWrite    <= '0';
                AluSrc      <= '0';
                RegWrite    <= '0';
            end case;
            
        -- when "1011" -- 11
        -- when "1100" -- 12
        -- when "1110" -- 13
        -- when "1111" -- 14
        -- when "0000" -- 15            
    end process;
end;