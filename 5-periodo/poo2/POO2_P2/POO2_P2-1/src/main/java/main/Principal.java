package main;

import linguagem_de_programacao.*;

public class Principal {
    public static void main(String[] args) {
        Comando sum = new ComandoSimples("sum");
        Comando sub = new ComandoSimples("sub");
        Comando div = new ComandoSimples("div");
        Comando mul = new ComandoSimples("mul");
        
        Comando log = new ComandoSimples("log");
        Comando exp = new ComandoSimples("exp");
        Comando sqrt = new ComandoSimples("sqrt");
        Comando mod = new ComandoSimples("mod");
        
        Comando open = new ComandoSimples("open");
        Comando read = new ComandoSimples("read");
        Comando write = new ComandoSimples("write");
        Comando close = new ComandoSimples("close");
        
        Comando print = new ComandoSimples("print");
        Comando input = new ComandoSimples("input");
        Comando exit = new ComandoSimples("exit");
        
        Comando file = new ComandoComposto(new Comando[] { open, read, write, close });
        Comando mathBasic = new ComandoComposto(new Comando[] { sum, sub, div, mul });
        Comando mathAdvanced = new ComandoComposto(new Comando[] { log, exp, sqrt, mod });
        Comando math = new ComandoComposto(new Comando[] { mathBasic, mathAdvanced });
        Comando system = new ComandoComposto(new Comando[] { print, input, file, math, exit });
        
        system.execute();
    }
}
