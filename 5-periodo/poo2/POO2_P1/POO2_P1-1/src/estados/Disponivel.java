package estados;

import produtos.*;

public class Disponivel extends Estoque {
    public Disponivel(Produto produto) {
        super(produto);
    }

    @Override
    protected void setLimites() {
        this.setLimiteInferior(10);
        this.setLimiteSuperior(Integer.MAX_VALUE);
    }

    @Override
    protected void verificaDisponibilidade() {
        if(this.getProduto().getQuantidade() < this.getLimiteInferior()) {
            this.getProduto().setEstoque(new Critico(this.getProduto())).verificaDisponibilidade();
        } 
    }
}
