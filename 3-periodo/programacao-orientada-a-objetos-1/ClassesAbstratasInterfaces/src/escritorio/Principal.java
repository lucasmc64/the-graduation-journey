package escritorio;

import java.util.Scanner;

/**
 *
 * @author lucasmc64
 */

public class Principal {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        Funcionario[] funcionarios = new Funcionario[5];
        
        int opcao;
        
        do {
            System.out.print("\n\n-+- MENU -+-\n\n");
            System.out.println("1) Inserir funcionário");
            System.out.println("2) Calcular folha salarial");
            System.out.println("3) Calcular média salarial");
            System.out.println("4) Encerrar programa");
            System.out.print("\n> ");
            opcao = scanner.nextInt();
            
            int posicao;
            
            switch(opcao) {
                case 1:
                    System.out.print("\n\n-+- MENU -+-\n\n");
                    System.out.println("1) Inserir gerente");
                    System.out.println("2) Inserir assistente");
                    System.out.println("3) Inserir vendedor");
                    System.out.println("4) Voltar ao menu principal");
                    System.out.print("\n> ");

                    int novoFuncOpcao = scanner.nextInt();
                    
                    if(novoFuncOpcao == 4) continue;

                    Funcionario f = null;

                    String nome;
                    String matricula;
                    String inserirSalarioBase;
                    double salario_base = 0;

                    System.out.print("Nome: ");
                    nome = scanner.next();
                    System.out.print("Matrícula: ");
                    matricula = scanner.next();

                    System.out.printf("Deseja alterar o salário base? O valor atual é R$%.2f [y/n] ", Funcionario.salario_base);
                    inserirSalarioBase = scanner.next();

                    if(inserirSalarioBase.equalsIgnoreCase("y")) {
                        System.out.print("Salário base: ");
                        salario_base = scanner.nextDouble();
                    }

                    switch(novoFuncOpcao) {
                        case 1:
                            f = salario_base == 0 ? new Gerente(nome, matricula) : new Gerente(nome, matricula, salario_base);
                            break;
                        case 2:
                            f = salario_base == 0 ? new Assistente(nome, matricula) : new Assistente(nome, matricula, salario_base);
                            break;
                        case 3:
                            System.out.print("Comissão: ");
                            double comissao = scanner.nextDouble();

                            f = salario_base == 0 ? new Vendedor(nome, matricula, comissao) : new Vendedor(nome, matricula, comissao, salario_base);
                            break;
                    }

                    funcionarios[Funcionario.qtdFuncionarios - 1] = f;
                    
                    break;
                case 2:
                    System.out.print("\n\n-+- MENU -+-\n\n");
                    System.out.println("1) Calcular folha salarial dos gerentes");
                    System.out.println("2) Calcular folha salarial dos assistentes");
                    System.out.println("3) Calcular folha salarial dos vendedores");
                    System.out.println("4) Voltar ao menu principal");
                    System.out.print("\n> ");

                    int calcFolhaSalOpcao = scanner.nextInt();
                    
                    if(calcFolhaSalOpcao == 4) continue;
                    
                    double folhaSalarial = 0;
                    
                    for(int i = 0; i < Funcionario.qtdFuncionarios; i++) {
                        if(calcFolhaSalOpcao == 1 && funcionarios[i] instanceof Gerente) {
                            folhaSalarial += funcionarios[i].calculaSalario();
                        } else if(calcFolhaSalOpcao == 2 && funcionarios[i] instanceof Assistente) {
                            folhaSalarial += funcionarios[i].calculaSalario();
                        } else if(calcFolhaSalOpcao == 3 && funcionarios[i] instanceof Vendedor) {
                            folhaSalarial += funcionarios[i].calculaSalario();
                        }
                    }
                    
                    System.out.printf("\nFolha salarial = R$%.2f", folhaSalarial);
                    
                    break;
                case 3:
                    System.out.print("\n\n-+- MENU -+-\n\n");
                    System.out.println("1) Calcular média salarial dos gerentes");
                    System.out.println("2) Calcular média salarial dos assistentes");
                    System.out.println("3) Calcular média salarial dos vendedores");
                    System.out.println("4) Voltar ao menu principal");
                    System.out.print("\n> ");

                    int calcMediaSalOpcao = scanner.nextInt();
                    
                    if(calcMediaSalOpcao == 4) continue;
                    
                    double totalSalario = 0;
                    int qtdFunc = 0;
                    
                    for(int i = 0; i < Funcionario.qtdFuncionarios; i++) {
                        if(calcMediaSalOpcao == 1 && funcionarios[i] instanceof Gerente) {
                            totalSalario += funcionarios[i].calculaSalario();
                            qtdFunc++;
                        } else if(calcMediaSalOpcao == 2 && funcionarios[i] instanceof Assistente) {
                            totalSalario += funcionarios[i].calculaSalario();
                            qtdFunc++;
                        } else if(calcMediaSalOpcao == 3 && funcionarios[i] instanceof Vendedor) {
                            totalSalario += funcionarios[i].calculaSalario();
                            qtdFunc++;
                        }
                    }
                    
                    System.out.printf("\nMédia salarial = R$%.2f", totalSalario / qtdFunc);
                    
                    break;
            }
            
        } while(opcao != 4);
    }
}
