package banco;

import java.util.InputMismatchException;
import java.util.Scanner;

/**
 *
 * @author lucasmc64
 */

public class Principal {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        Conta[] contas = new Conta[5];
        int opcao = 0;
        
        do {
            try {
                System.out.print("\n\n-+- MENU -+-\n\n");
                System.out.println("1) Criar conta");
                System.out.println("2) Sacar");
                System.out.println("3) Depositar");
                System.out.println("4) Ver saldo");
                System.out.println("5) Encerrar programa");
                System.out.print("\n> ");
                opcao = scanner.nextInt();
                
                int numeroConta;
                double valor;
                Conta conta;
                
                switch(opcao) {
                    case 1:
                        if(Conta.getQtdContas() >= 5){
                            System.out.println("Limite de contas atingido. Voltando ao menu principal.");
                            break;
                        }
                        
                        System.out.print("Nome: ");
                        String nome = scanner.next();
                        
                        System.out.print("Número da conta: ");
                        numeroConta = scanner.nextInt();
                        
                        boolean contaExiste = false;
                        
                        for(int i = 0; i < Conta.getQtdContas(); i++) {
                            contaExiste = numeroConta == contas[i].getNumero();
                            if(contaExiste)
                                break;
                        }
                        
                        if(contaExiste) {
                            System.out.println("Número de conta já existente. Voltando ao menu principal.");
                            break;
                        } 
                        
                        System.out.print("Possui saldo inicial? [s/N] ");
                        String temSaldo = scanner.next();
                        
                        if(temSaldo.equalsIgnoreCase("s") || temSaldo.equalsIgnoreCase("sim")) {
                            System.out.print("Saldo: ");
                            valor = scanner.nextDouble();
                            contas[Conta.getQtdContas()] = new Conta(nome, numeroConta, valor);
                        } else if(temSaldo.equalsIgnoreCase("n") || temSaldo.equalsIgnoreCase("nao") || temSaldo.equalsIgnoreCase("não")) {
                            contas[Conta.getQtdContas()] = new Conta(nome, numeroConta);
                        } else {
                            System.out.println("Falha na confirmação. Voltando ao menu principal.");
                        }
                        
                        break;
                    case 2:
                        System.out.print("Número da conta: ");
                        numeroConta = scanner.nextInt();
                        
                        conta = null;
                        for(int i = 0; i < Conta.getQtdContas(); i++)
                            if(contas[i].getNumero() == numeroConta)
                                conta = contas[i];
                        
                        System.out.print("Valor de saque: ");
                        valor = scanner.nextDouble();
                        
                        if(conta == null) {
                            System.out.println("Conta inexistente, impossível sacar. Voltando ao menu principal.");
                        } else {
                            boolean sacou = conta.sacar(valor);
                            
                            if(!sacou)
                                System.out.println("Voltando ao menu principal.");
                        }
                        
                        break;
                    case 3:
                        System.out.print("Número da conta: ");
                        numeroConta = scanner.nextInt();
                        
                        conta = null;
                        for(int i = 0; i < Conta.getQtdContas(); i++)
                            if(contas[i].getNumero() == numeroConta)
                                conta = contas[i];
                        
                        System.out.print("Valor de depósito: ");
                        valor = scanner.nextDouble();
                        
                        if(conta == null) {
                            System.out.println("Conta inexistente, impossível depositar. Voltando ao menu principal.");
                        } else {
                            boolean depositou = conta.depositar(valor);
                            
                            if(!depositou)
                                System.out.println("Voltando ao menu principal.");
                        }
                        
                        break;
                    case 4:
                        System.out.print("Número da conta: ");
                        numeroConta = scanner.nextInt();
                        
                        conta = null;
                        for(int i = 0; i < Conta.getQtdContas(); i++)
                            if(contas[i].getNumero() == numeroConta)
                                conta = contas[i];
                        
                        if(conta == null) {
                            System.out.println("Conta inexistente, impossível depositar. Voltando ao menu principal.");
                        }
                        
                        conta.mostrarSaldo();
                        
                        break;
                }
            } catch(InputMismatchException error) {
                System.out.println("Valor inserido não corresponde ao tipo esperado. Voltando ao menu principal.");
                scanner.nextLine();
            } catch(Exception error) {
                System.out.println("Erro não identificado.\n" + error.getMessage());
            }
        } while(opcao != 5);
    }
}
