package main;

import automatos.*;

public class Main {
    public static void main(String[] args) {
        String[] strings = {"aaacdb", "ababacdaaac", "abcdb", "acda", "acdbdb"}; 
        
        for(String string: strings) {
            
            Automato automato = new ReconhecePalavraEstranha();

            System.out.printf("\n\nEstado atual: %s\n", automato.getEstado().getClass().getName());

            for(char letra : string.toCharArray()) {
                try {
                    automato.leituraDeCaractere(letra);
                } catch(Exception error) {
                    System.out.println(error.getMessage());
                    break;
                }

                System.out.printf("Estado atual: %s\n", automato.getEstado().getClass().getName());
            }

            if(automato.verificaValidadeDaCadeia()) {
                System.out.printf("\nCADEIA \"%s\" PERTENCE À LINGUAGEM!\n", string);
            } else {
                System.out.printf("\nCADEIA \"%s\" NÃO PERTENCE À LINGUAGEM!\n", string);
            }
            
            System.out.printf("\n=---------+()+----------+()+----------+()+---------=");
        }
    }
}
