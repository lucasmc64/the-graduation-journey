package loja;

import java.util.Scanner;

/**
 *
 * @author lucasmc64
 */

public class Loja {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        Vendedor[] vendedores = new Vendedor[5];
        int qtdVendedores = 0;
        
        Administrador[] administradores = new Administrador[5];
        int qtdAdministradores = 0;
        
        int opcao;
        
        do {
            System.out.print("\n\n-+- MENU -+-\n\n");
            System.out.println("1) Inserir vendedor");
            System.out.println("2) Adicionar venda");
            System.out.println("3) Ver dados do vendedor");
            System.out.println("4) Inserir administrador");
            System.out.println("5) Adicionar hora extra");
            System.out.println("6) Ver dados do administrador");
            System.out.println("7) Encerrar programa");
            System.out.print("\n> ");
            opcao = scanner.nextInt();
            
            String nome;
            String rg;
            double salarioBase;
            int posicao;
            
            switch(opcao) {
                case 1:
                    if(qtdVendedores >= 5) {
                        System.out.println("Quantidade máxima de vendedores atingida.");
                        continue;
                    }
                    
                    System.out.print("Nome: ");
                    nome = scanner.next();
                    System.out.print("RG: ");
                    rg = scanner.next();
                    System.out.print("Salário base: ");
                    salarioBase = scanner.nextDouble();

                    vendedores[qtdVendedores] = new Vendedor(nome, rg, salarioBase);
                    qtdVendedores++;
                    
                    break;
                case 2:
                    System.out.print("Posição do vendedor: "); // Posição no array
                    posicao = scanner.nextInt();
                    
                    if(posicao < 0 || posicao >= qtdVendedores) {
                        System.out.println("Posição inválida.");
                        continue;
                    }
                    
                    System.out.print("Valor da venda: ");
                    double venda = scanner.nextDouble();

                    vendedores[posicao].addVenda(venda);
                    
                    break;
                case 3:
                    System.out.print("Posição do vendedor: "); // Posição no array
                    posicao = scanner.nextInt();
                    
                    if(posicao < 0 || posicao >= qtdVendedores) {
                        System.out.println("Posição inválida.");
                        continue;
                    }
                    
                    System.out.printf("\nNome: %s\nRG: %s\nSalário base: R$ %.2f\nTotal em vendas: R$ %.2f\nSalário: R$ %.2f\n", vendedores[posicao].getNome(), vendedores[posicao].getRg(), vendedores[posicao].getSalarioBase(), vendedores[posicao].getTotalVendas(), vendedores[posicao].getSalarioTotal());
                    break;
                case 4:
                    if(qtdAdministradores >= 5) {
                        System.out.println("Quantidade máxima de administradores atingida.");
                        continue;
                    }
                    
                    System.out.print("Nome: ");
                    nome = scanner.next();
                    System.out.print("RG: ");
                    rg = scanner.next();
                    System.out.print("Salário base: ");
                    salarioBase = scanner.nextDouble();

                    administradores[qtdAdministradores] = new Administrador(nome, rg, salarioBase);
                    qtdAdministradores++;
                    
                    break;
                case 5:
                    System.out.print("Posição do administrador: "); // Posição no array
                    posicao = scanner.nextInt();
                    
                    if(posicao < 0 || posicao >= qtdAdministradores) {
                        System.out.println("Posição inválida.");
                        continue;
                    }
                    
                    System.out.print("Horas extras: ");
                    float horasExtras = scanner.nextFloat();

                    administradores[posicao].addHorasExtras(horasExtras);
                    
                    break;
                case 6:
                    System.out.print("Posição do vendedor: "); // Posição no array
                    posicao = scanner.nextInt();
                    
                    if(posicao < 0 || posicao >= qtdAdministradores) {
                        System.out.println("Posição inválida.");
                        continue;
                    }
                    
                    System.out.printf("\nNome: %s\nRG: %s\nSalário base: R$ %.2f\nHoras extras: %.2fh\nSalário: R$ %.2f\n", administradores[posicao].getNome(), administradores[posicao].getRg(), administradores[posicao].getSalarioBase(), administradores[posicao].getHorasExtras(), administradores[posicao].getSalarioTotal());
                    
                    break;
            }
        } while(opcao != 7);
    }
}
