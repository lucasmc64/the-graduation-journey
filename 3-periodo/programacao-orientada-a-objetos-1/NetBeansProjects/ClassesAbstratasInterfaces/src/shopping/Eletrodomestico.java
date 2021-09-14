package shopping;

/**
 *
 * @author lucasmc64
 */

public class Eletrodomestico extends ProdutoClasse implements ProdutoInterface {
    public Eletrodomestico(int id, int anoDeProducao, String unidadeDeVenda, String categoria, double preco) {
        super(id, anoDeProducao, unidadeDeVenda, categoria, preco);
    }
    
    @Override
    public void mostraId() {}
    
    @Override
    public void mostraAnoDeProducao() {}
    
    @Override
    public void mostraUnidadeDeVenda() {}
    
    @Override
    public void mostraCategoria() {}
    
    @Override
    public void mostraPreco() {}
}
