package atividadeavaliativa02;

import java.util.Scanner;

/**
 *
 * @author lucasmc64
 */

public class AtividadeAvaliativa02 {
    static Scanner scanner = new Scanner(System.in);
    
    public static boolean confirmChanges () throws InterruptedException {
        System.out.println("\n=> CUIDADO: O repositório que irá receber os dados será completamente apagado antes de receber os novos dados.");
        Thread.sleep(5000);

        System.out.print("Deseja mesmo continuar? [y/N] ");
        String confirm = scanner.next();

        return (confirm.equalsIgnoreCase("y") || confirm.equalsIgnoreCase("yes"));
    }
    
    public static void main(String[] args) throws InterruptedException {
        RepositorioClasse[] repos = new RepositorioClasse[4];
        
        // Inicialização dos repositórios
        for(int i = 0; i < repos.length; i++) {
            repos[i] = new RepositorioClasse();
        }
        
        int opcao;
        
        do {
            System.out.print("\n\n-+- MENU -+-\n\n");
            System.out.println("1) Inserir uma pessoa em um repositório");
            System.out.println("2) Exibir todas as pessoas em todos os repositórios");
            System.out.println("3) Pesquisar uma pessoa em todos os repositórios");
            System.out.println("4) Duplicar um repositório");
            System.out.println("5) Repositório diferença");
            System.out.println("6) Encerrar programa");
            System.out.print("\n> ");
            opcao = scanner.nextInt();
            
            int posicao;
            
            String nome;
            String cpf;
            
            switch(opcao) {
                case 1:
                    System.out.print("\nNúmero do repositório [0 a 3]: ");
                    int indexRepoInsere = scanner.nextInt();
                    if(indexRepoInsere < 0 || indexRepoInsere > 3){
                        System.out.println("Valor inválido. Voltando ao menu principal.");
                        break;
                    }
                    
                    System.out.print("Nome: ");
                    nome = scanner.next();
                    System.out.print("CPF: ");
                    cpf = scanner.next();
                    
                    repos[indexRepoInsere].inserePessoa(nome, cpf);
                    
                    System.out.println("Pessoa inserida com sucesso!");
                    
                    break;
                case 2:
                    for(int i = 0; i < repos.length; i++) {
                        System.out.printf("\nREPOSITÓRIO %d\n\n", i);
                        
                        repos[i].printDados();
                    }
                    
                    break;
                case 3:
                    System.out.print("\n\n-+- MENU -+-\n\n");
                    System.out.println("1) Pesquisar por nome");
                    System.out.println("2) Pesquisar por CPF");
                    System.out.println("3) Voltar ao menu principal");
                    System.out.print("\n> ");
                    int pesquisaOpcao = scanner.nextInt();
                    
                    switch(pesquisaOpcao) {
                        case 1:
                            System.out.println("\n=> CUIDADO: As verificações feitas não são 'case sensitive'.");
                            System.out.print("Nome: ");
                            nome = scanner.next();
                            
                            int qtdReposNome = 0;
                            System.out.println("Pessoa presente em:");
                            
                            for(int i = 0; i < repos.length; i++) {
                                if(repos[i].getPorNome(nome) != null) {
                                    System.out.printf("RESPOSITÓRIO %d\n", i);
                                    qtdReposNome++;
                                }
                            }
                            
                            if(qtdReposNome == 0)
                                System.out.println("NENHUM REPOSITÓRIO");
                            
                            break;
                        case 2:
                            System.out.print("CPF: ");
                            cpf = scanner.next();
                            
                            int qtdReposCpf = 0;
                            System.out.println("Pessoa presente em:");
                            
                            for(int i = 0; i < repos.length; i++) {
                                if(repos[i].getPorCpf(cpf) != null) {
                                    System.out.printf("RESPOSITÓRIO %d\n", i);
                                    qtdReposCpf++;
                                }
                            }
                            
                            if(qtdReposCpf == 0)
                                System.out.println("NENHUM REPOSITÓRIO");
                            
                            break; 
                        case 3:
                            break;
                        default:
                            System.out.println("Opção inválida. Voltando ao menu principal.");
                    }
                    break;
                case 4:
                    if(!confirmChanges()) {
                        System.out.println("Processo de duplicagem não confirmada. Voltando ao menu principal.");
                        break;
                    }
                    
                    System.out.print("Repositório a ser duplicado [0 a 3]: ");
                    int indexRepoDuplica = scanner.nextInt();
                    if(indexRepoDuplica < 0 || indexRepoDuplica > 3){
                        System.out.println("Valor inválido. Voltando ao menu principal.");
                        break;
                    }
                    
                    System.out.print("Repositório que receberá os dados [0 a 3]: ");
                    int indexRepoDestino = scanner.nextInt();
                    if(indexRepoDestino < 0 || indexRepoDestino > 3){
                        System.out.println("Valor inválido. Voltando ao menu principal.");
                        break;
                    }
                    
                    if(indexRepoDuplica == indexRepoDestino){
                        System.out.println("Impossível duplicar o repositório nele mesmo. Voltando ao menu principal.");
                        break;
                    }
                    
                    repos[indexRepoDestino] = repos[indexRepoDuplica].duplicaRepositorio();
                    
                    System.out.println("Repositório duplicado com sucesso!");
                    
                    break;
                case 5:
                    if(!confirmChanges()) {
                        System.out.println("Operação entre repositórios não confirmada. Voltando ao menu principal.");
                        break;
                    }
                    
                    System.out.print("Repositório A [0 a 3]: ");
                    int indexRepoA = scanner.nextInt();
                    if(indexRepoA < 0 || indexRepoA > 3){
                        System.out.println("Valor inválido. Voltando ao menu principal.");
                        break;
                    }
                    
                    System.out.print("Repositório B [0 a 3]: ");
                    int indexRepoB = scanner.nextInt();
                    if(indexRepoB < 0 || indexRepoB > 3){
                        System.out.println("Valor inválido. Voltando ao menu principal.");
                        break;
                    }
                    
                    if(indexRepoA == indexRepoB){
                        System.out.println("Isso resultaria em um repositório vazio. Se deseja mesmo isso use o método 'clearRepositorio' no repositório em questão. Voltando ao menu principal.");
                        break;
                    }
                    
                    System.out.print("Repositório C [0 a 3]: ");
                    int indexRepoC = scanner.nextInt();
                    if(indexRepoC < 0 || indexRepoC > 3){
                        System.out.println("Valor inválido. Voltando ao menu principal.");
                        break;
                    }
                    
                    repos[indexRepoC] = repos[indexRepoA].duplicaESubtraiRepositorio(repos[indexRepoB]);
                    
                    System.out.println("Operação realizada com sucesso!");
                    
                    break;
                case 6:
                    break;
                default:
                    System.out.println("\n Opção inválida.");
            }
            
        } while(opcao != 6);
        
        // Abaixo está um teste rápido para métodos não utilizados nas operações acima
        // Descomente caso queira testar e ver os resultados!
        
        /*
        System.out.println("Teste de métodos");
        
        RepositorioClasse repoTeste = new RepositorioClasse();
        
        repoTeste.inserePessoa("Jacinto", "1");
        repoTeste.inserePessoa("Heleno", "1");
        
        System.out.println("\ngetProximaPessoa()\n");
        System.out.printf("Pessoa 1: %s\n", repoTeste.getProximaPessoa().getNome());
        System.out.printf("Pessoa 2: %s\n", repoTeste.getProximaPessoa().getNome());
        System.out.printf("Pessoa 1: %s\n", repoTeste.getProximaPessoa().getNome()); // Voltou ao início
        
        System.out.println("\ngetPrimeiraPessoa()\n");
        System.out.printf("Pessoa 1: %s\n", repoTeste.getPrimeiraPessoa().getNome());
        
        System.out.println("\nclearRepositorio()\n");
        repoTeste.clearRepositorio();
        if(repoTeste.getPrimeiraPessoa() == null)
            System.out.println("Repositório limpo com sucesso!");
        else
            System.out.println("Houston... temos um problema");
        */
    }
}
