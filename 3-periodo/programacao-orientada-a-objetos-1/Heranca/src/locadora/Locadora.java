package locadora;

import java.util.Scanner;

/**
 *
 * @author lucasmc64
 */

public class Locadora {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        Video[] videos = new Video[5];
        int qtdVideos = 0;
        
        Audio[] audios = new Audio[5];
        int qtdAudios = 0;
        
        FitaVHS[] fitasVHS = new FitaVHS[5];
        int qtdFitasVHS = 0;
        
        int opcao;
        
        do {
            System.out.print("\n\n-+- MENU -+-\n\n");
            System.out.println("1) Inserir DVD");
            System.out.println("2) Consultar dados do DVD");
            System.out.println("3) Inserir CD");
            System.out.println("4) Consultar dados do CD");
            System.out.println("5) Inserir fita VHS");
            System.out.println("6) Consultar dados da fita VHS");
            System.out.println("7) Rebobinar fita VHS");
            System.out.println("8) Encerrar programa");
            System.out.print("\n> ");
            opcao = scanner.nextInt();
            
            int posicao;
            
            String nome;
            String tipo;
            String genero;
            String anoLancamento;
            int qtdCopias;
            float preco;
            
            switch(opcao) {
                case 1:
                    if(qtdVideos >= 5) {
                        System.out.println("Quantidade máxima de DVDs atingida.");
                        continue;
                    }
                    
                    String[] atores;
                    String diretor;
                    String duracao;
                    String faixaEtaria;
                    
                    System.out.print("Nome: ");
                    nome = scanner.next();
                    System.out.print("Tipo: ");
                    tipo = scanner.next();
                    System.out.print("Gênero: ");
                    genero = scanner.next();
                    System.out.print("Ano de lançamento: ");
                    anoLancamento = scanner.next();
                    System.out.print("Quantidade de cópias: ");
                    qtdCopias = scanner.nextInt();
                    System.out.print("Preço: ");
                    preco = scanner.nextFloat();
                    
                    System.out.print("Quantos atores possui? ");
                    int qtdAtores = scanner.nextInt();
                    int numAtores = 0;
                    
                    atores = new String[qtdAtores];
                    
                    String ator;
                    
                    do {
                        System.out.print("Ator: ");
                        ator = scanner.next();
                        
                        if(ator == "") continue;
                        
                        atores[numAtores] = ator;
                        numAtores++;
                    } while(numAtores < qtdAtores);

                    System.out.print("Diretor: ");
                    diretor = scanner.next();
                    System.out.print("Duração: ");
                    duracao = scanner.next();
                    System.out.print("Faixa etária: ");
                    faixaEtaria = scanner.next();

                    videos[qtdVideos] = new Video(nome, tipo, genero, anoLancamento, qtdCopias, preco, atores, diretor, duracao, faixaEtaria);
                    qtdVideos++;
                    
                    break;
                case 2:
                    System.out.print("Posição do DVD: "); // Posição no array
                    posicao = scanner.nextInt();
                    
                    if(posicao < 0 || posicao >= qtdVideos) {
                        System.out.println("Posição inválida.");
                        continue;
                    }
                    
                    atores = videos[posicao].getAtores();
                    
                    String atoresStr = "";
                    
                    for(int i = 0; i < atores.length - 1; i++) {
                       atoresStr += atores[i] + ", ";
                    }
                    
                    atoresStr += atores[atores.length - 1];

                    System.out.printf("\nNome: %s\nTipo: %s\nGênero: %s\nAno de lançamento: %s\nQuantidade de cópias: %d\nPreço: R$ %.2f\nAtores: %s\nDiretor: %s\nDuração: %s\nFaixa etária: %s", videos[posicao].getNome(), videos[posicao].getTipo(), videos[posicao].getGenero(), videos[posicao].getAnoLancamento(), videos[posicao].getQtdCopias(), videos[posicao].getPreco(), atoresStr, videos[posicao].getDiretor(), videos[posicao].getDuracao(), videos[posicao].getFaixaEtaria());
                    
                    break;
                case 3:
                    if(qtdAudios >= 5) {
                        System.out.println("Quantidade máxima de CDs atingida.");
                        continue;
                    }
                    
                    String cantor;
                    int qtdMusicas;
                    
                    System.out.print("Nome: ");
                    nome = scanner.next();
                    System.out.print("Tipo: ");
                    tipo = scanner.next();
                    System.out.print("Gênero: ");
                    genero = scanner.next();
                    System.out.print("Ano de lançamento: ");
                    anoLancamento = scanner.next();
                    System.out.print("Quantidade de cópias: ");
                    qtdCopias = scanner.nextInt();
                    System.out.print("Preço: ");
                    preco = scanner.nextFloat();
                    System.out.print("Cantor: ");
                    cantor = scanner.next();
                    System.out.print("Quantidade de músicas: ");
                    qtdMusicas = scanner.nextInt();
                    
                    audios[qtdAudios] = new Audio(nome, tipo, genero, anoLancamento, qtdCopias, preco, cantor, qtdMusicas);
                    qtdAudios++;
                    
                    break;    
                case 4:
                    System.out.print("Posição do CD: "); // Posição no array
                    posicao = scanner.nextInt();
                    
                    if(posicao < 0 || posicao >= qtdAudios) {
                        System.out.println("Posição inválida.");
                        continue;
                    }
                    
                    System.out.printf("\nNome: %s\nTipo: %s\nGênero: %s\nAno de lançamento: %s\nQuantidade de cópias: %d\nPreço: %s\nCantor: %s\nQuantidade de músicas: %d", audios[posicao].getNome(), audios[posicao].getTipo(), audios[posicao].getGenero(), audios[posicao].getAnoLancamento(), audios[posicao].getQtdCopias(), audios[posicao].getPreco(), audios[posicao].getCantor(), audios[posicao].getQtdMusicas());
                    
                    break;
                case 5:
                    if(qtdFitasVHS >= 5) {
                        System.out.println("Quantidade máxima de fitas VHS atingida.");
                        continue;
                    }
                    
                    boolean rebobinada;
                    
                    System.out.print("Nome: ");
                    nome = scanner.next();
                    System.out.print("Tipo: ");
                    tipo = scanner.next();
                    System.out.print("Gênero: ");
                    genero = scanner.next();
                    System.out.print("Ano de lançamento: ");
                    anoLancamento = scanner.next();
                    System.out.print("Quantidade de cópias: ");
                    qtdCopias = scanner.nextInt();
                    System.out.print("Preço: ");
                    preco = scanner.nextFloat();
                    System.out.print("Rebobinada? ");
                    rebobinada = scanner.nextBoolean();
                    
                    fitasVHS[qtdFitasVHS] = new FitaVHS(nome, tipo, genero, anoLancamento, qtdCopias, preco, rebobinada);
                    qtdFitasVHS++;
                    
                    break;
                case 6:
                    System.out.print("Posição da fita VHS: "); // Posição no array
                    posicao = scanner.nextInt();
                    
                    if(posicao < 0 || posicao >= qtdFitasVHS) {
                        System.out.println("Posição inválida.");
                        continue;
                    }
                    
                    System.out.printf("\nNome: %s\nTipo: %s\nGênero: %s\nAno de lançamento: %s\nQuantidade de cópias: %d\nPreço: R$ %.2f\nRebobinada? %b", fitasVHS[posicao].getNome(), fitasVHS[posicao].getTipo(), fitasVHS[posicao].getGenero(), fitasVHS[posicao].getAnoLancamento(), fitasVHS[posicao].getQtdCopias(), fitasVHS[posicao].getPreco(), fitasVHS[posicao].isRebobinada());
                    
                    break;
                case 7:
                    System.out.print("Posição da fita VHS: "); // Posição no array
                    posicao = scanner.nextInt();
                    
                    if(posicao < 0 || posicao >= qtdFitasVHS) {
                        System.out.println("Posição inválida.");
                        continue;
                    }
                    
                    fitasVHS[posicao].rebobinar();
                    
                    System.out.println("Fita rebobinada com sucesso!");
                    
                    break;
            }
        } while(opcao != 8);
    }
}
