package atividadeavaliativa01;

/**
 *
 * @author lucasmc64
 */

public class AtividadeAvaliativa01 {
    public static void main(String[] args) {
        // Os testes abaixo inserem o grafo usado como exemplo no próprio arquivo que descreve a atividade. 
        
        Grafo g = new Grafo(5);
        
        /*
            Por mim não seria necessário a implementação da inserção de vértices.
            Eles poderiam usados de acordo com a quantidade informada de vértices na criação do grafo.
            Sendo assim, cada vértice seria obrigatóriamente representado por um número.
        */
        
        g.setVertice('a');
        g.setVertice('b');
        g.setVertice('c');
        g.setVertice('d');
        g.setVertice('e');
        g.setVertice('f'); // Erro: grafo cheio
        
        g.listarVertices();
        
        g.setAresta('a', 'b');
        g.setAresta('a', 'e');
        g.setAresta('b', 'c');
        g.setAresta('b', 'd');
        g.setAresta('b', 'e');
        g.setAresta('c', 'd');
        g.setAresta('d', 'e');
        g.setAresta('d', 'f'); // Erro: aresta inválida
        
        g.exibirMatrizAdj();
        
        if(g.saoVizinhos('a', 'b')) 
            System.out.printf("Os vértices a e b são vizinhos!");
        else
            System.out.printf("Os vértices a e b NÃO são vizinhos!");
        
        if(g.saoVizinhos('a', 'd')) 
            System.out.printf("Os vértices a e b são vizinhos!");
        else
            System.out.printf("Os vértices a e b NÃO são vizinhos!");
        
        if(g.saoVizinhos('a', 'f')) // Erro: vértice inexistente
            System.out.printf("Os vértices a e b são vizinhos!");
        else
            System.out.printf("Os vértices a e b NÃO são vizinhos!");
        
        g.listarVizinhos('a');
        g.listarVizinhos('f'); // Erro: vértice inexistente
        
        Grafo h = new Grafo(-1); // Grafo nulo por padrão
        
        h.setVertice('k'); // Erro: número máximo de vértices atingido
        h.exibirMatrizAdj();
        
        Grafo k = new Grafo(2);
        
        k.setVertice('x');
        k.setVertice('z');
        
        k.exibirMatrizAdj();
        
        // Fim
        System.out.print("\n");  
    }
}
