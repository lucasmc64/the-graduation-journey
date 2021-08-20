package comandosbasicos;

import java.util.Scanner;

/**
 *
 * @author lucasmc64
 */

public class PrincipalCliente {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        Cliente c = new Cliente();
        
        System.out.println("-+- Inserindo Cliente -+-");
        System.out.print("Nome: ");
        String nome = scanner.next();
        System.out.print("CPF: ");
        String cpf = scanner.next();
        System.out.print("Idade: ");
        int idade = scanner.nextInt();
        System.out.print("Telefone: ");
        String telefone = scanner.next();
        c.CadastrarCliente(nome, cpf, idade, telefone);
        c.MostrarDadosCLiente();
    }
}
