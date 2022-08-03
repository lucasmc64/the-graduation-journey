package produtos;

import estados.*;

public abstract class Produto {
    private int quantidade;
    private Estoque estoque;
    
    public Produto(int quantidade) throws Exception {
        this.setEstoque(new Disponivel(this));
        estoque.compra(quantidade);
    }
    
    public void compra(int quantidade) throws Exception {
        estoque.compra(quantidade);
    }
    
    public void venda(int quantidade) throws Exception {
        estoque.venda(quantidade);
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) throws Exception {
        if(quantidade >= 0) {
            this.quantidade = quantidade;
        } else {
            throw new Exception("Não há unidades o suficiente do produto para a venda ser possível.");
        }
    }

    public Estoque getEstoque() {
        return estoque;
    }

    public Estoque setEstoque(Estoque estoque) {
        this.estoque = estoque;
        return this.getEstoque();
    }
}
