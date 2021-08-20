package locadora;

/**
 *
 * @author lucasmc64
 */

public class Midia {
    protected String nome;
    protected String tipo;
    protected String genero;
    protected String anoLancamento;
    protected int qtdCopias;
    protected float preco;
    
    public Midia(String nome, String tipo, String genero, String anoLancamento, int qtdCopias, float preco) {
        this.setNome(nome);
        this.setTipo(tipo);
        this.setGenero(genero);
        this.setAnoLancamento(anoLancamento);
        this.setQtdCopias(qtdCopias);
        this.setPreco(preco);
    }

    public String getNome() {
        return this.nome;
    }

    public String getTipo() {
        return this.tipo;
    }

    public String getGenero() {
        return this.genero;
    }

    public String getAnoLancamento() {
        return this.anoLancamento;
    }

    public int getQtdCopias() {
        return this.qtdCopias;
    }

    public float getPreco() {
        return this.preco;
    }

    protected void setNome(String nome) {
        this.nome = nome;
    }

    protected void setTipo(String tipo) {
        this.tipo = tipo;
    }

    protected void setGenero(String genero) {
        this.genero = genero;
    }

    protected void setAnoLancamento(String anoLancamento) {
        this.anoLancamento = anoLancamento;
    }

    protected void setQtdCopias(int qtdCopias) {
        this.qtdCopias = qtdCopias;
    }

    protected void setPreco(float preco) {
        this.preco = preco;
    }
}
