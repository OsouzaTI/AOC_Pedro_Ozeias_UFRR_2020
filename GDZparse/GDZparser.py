import sys
from constants import *
  
class GDZparser:    
    # modo de transpilação
    PARSE_MODE = NULL
    def __init__(self, args):
        argIndex = 1
        for arg in args:
            self.PARSE_MODE = self.commandLine(arg)
            if self.PARSE_MODE == PARSE_BINARY:
                self.GDZPARSE(args[argIndex+1])
            elif self.PARSE_MODE == PARSE_QUARTUS:
                self.GDZPARSE(args[argIndex+1])
            elif self.PARSE_MODE == HELPER:
                self.helper()

    def GDZPARSE(self, fileName):
        self.openFile(fileName)

    def commandLine(self, c):
        try:
            return COMMANDS_TYPE[c]        
        except:
            return NULL

    def openFile(self, fileName):
        f = open(fileName, "r")
        self.parser(f.read(), fileName)
        f.close()

    def fileName(self, str):
        prefix = self.PARSE_MODE.lower()
        return prefix + "_" + str + "." + FILE_EXTENSION

    def parser(self, strFile, fileName):
        final = ""
        line  = 0 
        for letter in strFile.split():            
            if letter.isdigit() and len(letter) == 1:
                final += TABLE_BINARY_NUMBERS[int(letter)]
            elif letter.isdigit() and len(letter) > 1:
                final += letter
            else:
                try:
                    value = COMMANDS_PARSE[letter]
                    final += value
                    if(value == '\n'):                        
                        line += 1
                except KeyError:
                    self.error(line, letter)

        self.log("Transpilado em modo : " + self.PARSE_MODE)
        # processamento do modo : mode_quartus
        if self.PARSE_MODE == PARSE_QUARTUS:
            indexLine = 0
            finalModeQuartus = ""
            for line in final.split():
                finalModeQuartus += str(indexLine) +" => "+'"'+ line +'"'+",\n"
                indexLine += 1 
            finalModeQuartus += 'others => "00000000"' 
            final = finalModeQuartus
        finalFileName = self.fileName(fileName)
        self.log("Arquivo "+ finalFileName  + " criado com sucesso")
        self.log("\n linhas: "+ str(line))
        self.log("\n tamanho(bytes): "+ str(len(final))+" b")
        f = open(finalFileName, "w")
        f.write(final)
        f.close()

    def error(self, line, command):
        self.log("Error in line "+ str(line)+" -> '"+ str(command)+"'?")

    def log(self, msg):
        print("[LOG] "+ msg, end='\n')

    def helper(self):
        print("-c [file name] :: traduz o arquivo em formato MIPS_GDZ para binario", end='\n')

if __name__ == '__main__':
    parser = GDZparser(sys.argv)