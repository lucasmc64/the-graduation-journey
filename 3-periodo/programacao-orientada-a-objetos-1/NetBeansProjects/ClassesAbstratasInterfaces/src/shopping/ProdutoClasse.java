package shopping;

/**
 *
 * @author lucasmc64
 */

public abstract class ProdutoClasse {
    private int id;
    private int anoDeProducao;
    private String unidadeDeVenda;
    private String categoria;
    private double preco;
    
    public ProdutoClasse(int id, int anoDeProducao, String unidadeDeVenda, String categoria, double preco) {
        this.setId(id);
        this.setAnoDeProducao(anoDeProducao);
        this.setUnidadeDeVenda(unidadeDeVenda);
        this.setCategoria(categoria);
        this.setPreco(preco);
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAnoDeProducao() {
        return anoDeProducao;
    }

    public void setAnoDeProducao(int anoDeProducao) {
        this.anoDeProducao = anoDeProducao;
    }

    public String getUnidadeDeVenda() {
        return unidadeDeVenda;
    }

    public void setUnidadeDeVenda(String unidadeDeVenda) {
        this.unidadeDeVenda = unidadeDeVenda;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }
}
