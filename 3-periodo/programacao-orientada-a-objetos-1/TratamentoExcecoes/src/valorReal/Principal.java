package valorReal;

import java.util.InputMismatchException;
import java.util.Scanner;

/**
 *
 * @author lucasmc64
 */

public class Principal {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int qtdErrors = 0;
        
        do {
            try {
                System.out.print("Digite um valor em ponto flutuante: ");
                float valor = scanner.nextFloat();
                System.out.println("Valor válido. Conversão para o tipo `float` realizada com sucesso!");
                
                break;
            } catch(InputMismatchException error) {
                System.out.println("Valor inserido não pôde ser convertido para o tipo `float`. Insira um valor válido.");
                scanner.nextLine();
                qtdErrors++;
            } catch(Exception error) {
                System.out.println("Erro não identificado.\n" + error.getMessage());
                qtdErrors++;
            }
        } while(qtdErrors < 3);
        
        if(qtdErrors >= 3)
            System.out.println("Você excedeu o limite de tentativas.");
    }
}
