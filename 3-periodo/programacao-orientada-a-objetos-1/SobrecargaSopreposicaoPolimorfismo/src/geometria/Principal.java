package geometria;

import java.util.Scanner;

/**
 *
 * @author lucasmc64
 */

public class Principal {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        Forma[] formas = new Forma[12];
        
        Circulo c = new Circulo("#7159c1", 2, 0, 0);
        c.printDetalhes();
        
        int opcao;
        
        do {
            System.out.print("\n\n-+- MENU -+-\n\n");
            System.out.println("1) Inserir círculo");
            System.out.println("2) Inserir quadrado");
            System.out.println("3) Inserir triângulo");
            System.out.println("4) Inserir esfera");
            System.out.println("5) Inserir cubo");
            System.out.println("6) Inserir tetraedro");
            System.out.println("7) Consultar dados de uma forma geométrica");
            System.out.println("8) Há a colisão de algum círculo no array?");
            System.out.println("9) Há a colisão de alguma esfera no array?");
            System.out.println("10) Encerrar programa");
            System.out.print("\n> ");
            opcao = scanner.nextInt();
            
            int posicao;
            
            String cor;
            float x;
            float y;
            
            Forma f;
            
            switch(opcao) {
                case 8:
                    for(int i = 0; i < Forma.getQtdFormas(); i++) {
                        if(formas[i] instanceof Circulo) {
                            for(int j = i + 1; j < Forma.getQtdFormas(); j++) {
                                if(formas[i] instanceof Circulo) {
                                    if(Circulo.colisao((Circulo) formas[i], (Circulo) formas[j])) {
                                        System.out.printf("\nOs círculos nas posições %d e %d colidiram\n", i, j);
                                        break;
                                    }
                                }
                            }
                        }
                    }
                    break;
                case 9:
                    for(int i = 0; i < Forma.getQtdFormas(); i++) {
                        if(formas[i] instanceof Esfera) {
                            for(int j = i + 1; j < Forma.getQtdFormas(); j++) {
                                if(formas[i] instanceof Esfera) {
                                    if(Esfera.colisao((Esfera) formas[i], (Esfera) formas[j])) {
                                        System.out.printf("\nAs esferas nas posições %d e %d colidiram\n", i, j);
                                        break;
                                    }
                                }
                            }
                        }
                    }
                    break;
            }
            
        } while(opcao != 10);
    }
}
