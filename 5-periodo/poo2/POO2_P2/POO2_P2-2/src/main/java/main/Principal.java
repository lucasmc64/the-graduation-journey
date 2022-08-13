package main;

import copos.*;
import fabricas.*;
import garrafas.*;
import pratos.*;

public class Principal {
    public static void main(String[] args) {
        Graficos graficos;
        
        // Teste 2D
        
        graficos = new DuasDimensoes();
        
        Copo c;
        Prato p;
        Garrafa g;
                
        c = graficos.fabricarCopo();
        p = graficos.fabricarPrato();
        g = graficos.fabricarGarrafa();
        
        c.desenha();
        p.desenha();
        g.desenha();
        
        // Teste 3D
        
        graficos = new TresDimensoes();
        
        c = graficos.fabricarCopo();
        p = graficos.fabricarPrato();
        g = graficos.fabricarGarrafa();
        
        c.desenha();
        p.desenha();
        g.desenha();
    }
}
