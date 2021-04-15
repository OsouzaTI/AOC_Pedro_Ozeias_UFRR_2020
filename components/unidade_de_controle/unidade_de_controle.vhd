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
        RegWrite    : in std_logic;      
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

    -- iniciando todas as trilhas
    reg_dst     <= '0';
    jump        <= '0';
    branch      <= '0';
    memToReg    <= '0';
    ALUOp       <= '0';
    memWrite    <= '0';
    AluSrc      <= '0';
    RegWrite    <= '0';

    process(clock, opcode)
    constant _add    : std_logic_vector(3 downto 0) := "0000";
    constant _addi   : std_logic_vector(3 downto 0) := "0001";
    constant _sub    : std_logic_vector(3 downto 0) := "0010";
    constant _subi   : std_logic_vector(3 downto 0) := "0011";
    constant _mul    : std_logic_vector(3 downto 0) := "0100";
    constant _lw     : std_logic_vector(3 downto 0) := "0101";
    constant _sw     : std_logic_vector(3 downto 0) := "0110";
    constant _li     : std_logic_vector(3 downto 0) := "0111";
    constant _beq    : std_logic_vector(3 downto 0) := "1000";
    constant _bne    : std_logic_vector(3 downto 0) := "1001";
    constant _j      : std_logic_vector(3 downto 0) := "1010";
    
    begin

        case opcode is 
            when _add =>
                opcode   <= _add;
                RegWrite <= '1';
            when _addi =>
                opcode   <= _addi;
                AluSrc   <= '1';
                RegWrite <= '1';
            when _sub =>
                opcode   <= _sub;                
                RegWrite <= '1';
            when _subi =>
                opcode   <= _subi;
                AluSrc   <= '1';
                RegWrite <= '1';
            when _mul =>
                opcode   <= mul;                
                RegWrite <= '1';
            when _lw =>
                opcode <= _lw;
                memRead  <= '1';
                memToReg <= '1';
                RegWrite <= '1';
            when _sw =>
                opcode <= _sw;
                memWrite <= '1';
            when _li =>
                opcode <= _li;
                AluSrc <= '1';
                RegWrite <= '1';
            when _beq =>
                opcode <= _beq;
                branch <= '1';
            when _bne =>
                opcode <= _bne;
                branch <= '1';
            when _j =>
                opcode <= _j;
                jump   <= '1';
            when others => 
                opcode      <= '1111';
                reg_dst     <= '0';
                jump        <= '0';
                branch      <= '0';
                memToReg    <= '0';
                ALUOp       <= '0';
                memWrite    <= '0';
                AluSrc      <= '0';
                RegWrite    <= '0';
            end case;
        end process;

            -- when "1011" -- 11
            -- when "1100" -- 12
            -- when "1110" -- 13
            -- when "1111" -- 14
            -- when "0000" -- 15            

    end;

end;