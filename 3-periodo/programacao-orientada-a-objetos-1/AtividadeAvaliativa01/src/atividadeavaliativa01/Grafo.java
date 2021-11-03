package atividadeavaliativa01;

/**
 *
 * @author lucasmc64
 */

public class Grafo {
    private int numMaxVertices; // Número máximo de vértices que o grafo suportará
    private int qtdVertices = 0; // Quantidade de vétices já inseridos no grafo
    private char[] vertices; // Array de vértices
    private int[][] arestas; // Matriz de adjacências
    
    public Grafo(int nV) {
        printMsg("CRIANDO GRAFO");
        
        if(nV >= 0) {
            numMaxVertices = nV;
            System.out.print("Grafo criado com sucesso!");
        } else {
            nV = 0;
            System.out.print("AVISO: Impossível criar grafo com número negativo de arestas. Grafo nulo criado por padrão.");
        }
        
        vertices = new char[numMaxVertices];
        arestas = new int[numMaxVertices][numMaxVertices];
    } 
    
    public void setVertice(char v) {
        printMsg("INSERINDO VÉRTICE");
        
        if(qtdVertices < numMaxVertices) {
            vertices[qtdVertices] = v;
            qtdVertices++;
            
            System.out.print("Vértice inserido com sucesso!");
        } else {
            System.out.println("ERRO: Número máximo de vértices atingido!");
        }
    }
    
    public void setAresta(char v1, char v2) {
        printMsg("INSERINDO ARESTA");
        
        int posV1 = getPosicaoVertice(v1);
        
        if(posV1 == -1) {
            System.out.printf("ERRO: Impossível inserir aresta, vértice %c não existe!", v1);
            return;
        }
        
        int posV2 = getPosicaoVertice(v2);        
        
        if(posV2 == -1) {
            System.out.printf("ERRO: Impossível inserir aresta, o vértice %c não existe!", v2);
            return;
        }
        
        arestas[posV1][posV2] = 1;
        arestas[posV2][posV1] = 1;
        
        System.out.print("Aresta inserida com sucesso!");
    }
    
    public boolean saoVizinhos(char v1, char v2) {
        printMsg("SÃO VIZINHOS?");
        
        int posV1 = getPosicaoVertice(v1);
        
        if(posV1 == -1) {
            System.out.printf("ERRO: Impossível verificar vizinhança, vértice %c não existe!", v1);
            return false;
        }
        
        int posV2 = getPosicaoVertice(v2);        
        
        if(posV2 == -1) {
            System.out.printf("ERRO: Impossível verificar vizinhança, o vértice %c não existe!", v2);
            return false;
        }
        
        return arestas[posV1][posV2] == arestas[posV2][posV1] && arestas[posV2][posV1] == 1; // A primeira parte da expressão não é necessária, só está aí pra lógica ser mais compreensível
    }
    
    public void listarVizinhos(char v) {
        printMsg("LISTANDO VIZINHOS");
        
        int posV = getPosicaoVertice(v);
        
        if(posV == -1) {
            System.out.printf("ERRO: Impossível verificar vizinhança, vértice %c não existe!", v);
            return;
        }
        
        int contViz = 0;
        
        for(int j = 0; j < qtdVertices; j++)
            if(arestas[posV][j] == 1)
                contViz++;
        
        if(contViz == 0) {
            System.out.printf("Não existem vértices vizinhos ao vértice %c!", v);
            return;
        }
        
        System.out.printf("Vértices vizinhos do vértice %c: ", v);
        
        int newContViz = 0;
        
        for(int j = 0; j < qtdVertices; j++) {
            if(arestas[posV][j] == 1) {
                System.out.print(vertices[j]);
                
                newContViz++;
                
                if(newContViz == contViz) break;
                
                System.out.print(", ");
            }
        }
        
        System.out.print(".");   
    }
    
    public void listarVertices() {
        printMsg("LISTANDO VÉRTICES");
        
        for(int i = 0; i < qtdVertices - 1; i++)
            System.out.printf("Vértice %d: %c\n", i, vertices[i]);
        
        System.out.printf("Vértice %d: %c", qtdVertices - 1, vertices[qtdVertices - 1]); // Listado fora do loop apenas para não haver o "pulo de linha", pra ficar tudo bonitinho no console
    }
    
    public void exibirMatrizAdj() {
        printMsg("EXIBINDO MATRIZ DE ADJACÊNCIAS");
        
        if(qtdVertices == 0) {
            System.out.print("Não há vértices inseridos nesse grafo!");
        }
        
        System.out.printf("  ");
        
        for(int i = 0; i < qtdVertices; i++) {
            System.out.printf("%c\t", vertices[i]);
        }
        
        System.out.printf("\n");
        
        for(int i = 0; i < qtdVertices; i++) {
            System.out.printf("%c ", vertices[i]);
            
            for(int j = 0; j < qtdVertices; j++) {
                System.out.printf("%d\t", arestas[i][j]);
            }
            
            if(i + 1 < qtdVertices)
                System.out.print("\n");
        }
    }
    
    private void printMsg(String msg) {
        System.out.printf("\n\n\n+-+-+ %s +-+-+\n\n", msg);
    }
    
    private int getPosicaoVertice(char v) {
        for(int i = 0; i < qtdVertices; i++) {
            if(vertices[i] == v) return i;
        }
        
        return -1;
    }
}
