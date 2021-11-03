package comandosbasicos;

import java.util.Scanner;

/**
 *
 * @author lucasmc64
 */

public class Soma2 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.println("-+- Soma 2 números inteitos -+-");
        System.out.print("Digite o primeiro número: ");
        int num1 = scanner.nextInt();
        System.out.print("Digite o segundo número: ");
        int num2 = scanner.nextInt();
        System.out.printf("%d + %d = %d\n", num1, num2, num1 + num2);
    }
}
