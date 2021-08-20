package locadora;

/**
 *
 * @author lucasmc64
 */

public class Audio extends Midia {
    protected String cantor;
    protected int qtdMusicas;
    
    public Audio(String nome, String tipo, String genero, String anoLancamento, int qtdCopias, float preco, String cantor, int qtdMusicas) {
        super(nome, tipo, genero, anoLancamento, qtdCopias, preco);
        
        this.setCantor(cantor);
        this.setQtdMusicas(qtdMusicas);
    }

    public String getCantor() {
        return this.cantor;
    }

    public int getQtdMusicas() {
        return this.qtdMusicas;
    }

    protected void setCantor(String cantor) {
        this.cantor = cantor;
    }

    protected void setQtdMusicas(int qtdMusicas) {
        this.qtdMusicas = qtdMusicas;
    }
}
