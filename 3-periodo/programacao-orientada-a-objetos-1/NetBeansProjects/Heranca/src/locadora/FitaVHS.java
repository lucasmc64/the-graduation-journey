package locadora;

/**
 *
 * @author lucasmc64
 */

public class FitaVHS extends Midia {
    protected boolean rebobinada;
    
    public FitaVHS(String nome, String tipo, String genero, String anoLancamento, int qtdCopias, float preco, boolean rebobinada) {
        super(nome, tipo, genero, anoLancamento, qtdCopias, preco);
        
        this.rebobinada = rebobinada;
    }

    public boolean isRebobinada() {
        return this.rebobinada;
    }

    public void rebobinar() {
        this.setRebobinada(true);
    }

    public void setRebobinada(boolean rebobinada) {
        this.rebobinada = rebobinada;
    }
}
