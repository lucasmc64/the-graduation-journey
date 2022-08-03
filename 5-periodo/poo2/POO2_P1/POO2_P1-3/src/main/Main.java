package main;

import efeitos.*;
import formas.*;

public class Main {
    public static void main(String[] args) {
        Forma retangulo = new Retangulo(24, 69);
        
        System.out.println(retangulo.getDescricao());
        
        retangulo = new Sombra(retangulo);
        
        System.out.println(retangulo.getDescricao());
        
        retangulo = new Textura(retangulo);
        
        System.out.println(retangulo.getDescricao());
        
    }
}
