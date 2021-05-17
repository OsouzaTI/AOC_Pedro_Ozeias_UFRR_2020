# prefix do arquivo
FILE_EXTENSION  = "gdz"

# flags do parser
PARSE_BINARY   = "PARSE_BINARY"
PARSE_QUARTUS  = "PARSE_QUARTUS"
HELPER         = "HELPER"
NULL           = "NULL"

# comandos do processador GDZ
COMP_ADD  = "0000"
COMP_ADDI = "0001"
COMP_SUB  = "0010"
COMP_SUBI = "0011"
COMP_MUL  = "0100"
COMP_LW   = "0101"
COMP_SW   = "0110"
COMP_LI   = "0111"
COMP_BEQ  = "1000"
COMP_BNE  = "1001"
COMP_JUMP = "1010"
COMP_IF   = "1011"

# identificador de quebra de linha
BREAK_LINE = "-"

# comandos aceitos pelo terminal
COMMANDS_TYPE = {
    "-c"    : PARSE_BINARY,
    "-cq"   : PARSE_QUARTUS,
    "-h"    : HELPER
}

# tabela de numeros para processos imediatos
TABLE_BINARY_NUMBERS = {
    0 : "00",
    1 : "01",
    2 : "10",
    3 : "11",
}


COMMANDS_PARSE = {
    BREAK_LINE  : "\n",
    "add"       : COMP_ADD,
    "addi"      : COMP_ADDI,
    "sub"       : COMP_SUB,
    "subi"      : COMP_SUBI,
    "mul"       : COMP_MUL,
    "lw"        : COMP_LW,
    "sw"        : COMP_SW,
    "li"        : COMP_LI,
    "beq"       : COMP_BEQ,
    "bne"       : COMP_BNE,
    "j"         : COMP_JUMP,
    "if"        : COMP_IF,
    "$0"        : TABLE_BINARY_NUMBERS[0],
    "$1"        : TABLE_BINARY_NUMBERS[1],
    "$2"        : TABLE_BINARY_NUMBERS[2],
    "$3"        : TABLE_BINARY_NUMBERS[3],
}