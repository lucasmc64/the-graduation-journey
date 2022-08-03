package estados;

import produtos.Produto;

public abstract class Estoque {
    private Produto produto;
    
    private double limiteInferior;
    private double limiteSuperior;
    
    public Estoque(Produto produto) {
        setProduto(produto);
        setLimites();
    }
    
    protected abstract void setLimites();
    protected abstract void verificaDisponibilidade();
    
    public void compra(int quantidade) throws Exception {
        this.produto.setQuantidade(this.produto.getQuantidade() + quantidade);
        this.verificaDisponibilidade();
    }
    
    public void venda(int quantidade) throws Exception {
        int novaQuantidade = this.produto.getQuantidade() - quantidade;
        
        this.produto.setQuantidade(this.produto.getQuantidade() - quantidade);
        this.verificaDisponibilidade();        
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    public double getLimiteInferior() {
        return limiteInferior;
    }

    public void setLimiteInferior(double limiteInferior) {
        this.limiteInferior = limiteInferior;
    }

    public double getLimiteSuperior() {
        return limiteSuperior;
    }

    public void setLimiteSuperior(double limiteSuperior) {
        this.limiteSuperior = limiteSuperior;
    }
}
