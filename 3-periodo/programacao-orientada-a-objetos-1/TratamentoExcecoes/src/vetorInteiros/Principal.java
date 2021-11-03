package vetorInteiros;

import java.util.InputMismatchException;
import java.util.Scanner;

/**
 *
 * @author lucasmc64
 */

public class Principal {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int[] vetor = new int[10];
        int opcao = 0;
        
        do {
            try {
                System.out.print("\n\n-+- MENU -+-\n\n");
                System.out.println("1) Inserir valor no vetor");
                System.out.println("2) Ver vetor");
                System.out.println("-1) Encerrar programa");
                System.out.print("\n> ");
                opcao = scanner.nextInt();
                
                switch(opcao) {
                    case 1:
                        System.out.print("Posição no vetor: ");
                        int posicao = scanner.nextInt();
                        System.out.print("Valor: ");
                        int valor = scanner.nextInt();

                        try {
                            vetor[posicao] = valor;
                        } catch(ArrayIndexOutOfBoundsException error) {
                            System.out.println("Posição inexistente no array. Tente novamente.");
                        }

                        break;
                    case 2:
                        for(int i = 0; i < 10; i++)
                            System.out.printf("vetor[%d] = %d\n", i, vetor[i]);
                        break;
                }
                
            } catch(InputMismatchException error) {
                System.out.println("Valor inserido não corresponde ao tipo esperado.");
                scanner.nextLine();
            } catch(Exception error) {
                System.out.println("Erro não identificado.\n" + error);
            }
        } while(opcao != -1);
    }
}
