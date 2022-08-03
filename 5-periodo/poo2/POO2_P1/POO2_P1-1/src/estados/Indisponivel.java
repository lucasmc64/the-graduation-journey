package estados;

import produtos.*;

public class Indisponivel extends Estoque {
    public Indisponivel(Produto produto) {
        super(produto);
    }

    @Override
    protected void setLimites() {
        this.setLimiteInferior(0);
        this.setLimiteSuperior(0);
    }

    @Override
    protected void verificaDisponibilidade() {
        if(this.getProduto().getQuantidade() > this.getLimiteSuperior()) {
            this.getProduto().setEstoque(new Critico(this.getProduto())).verificaDisponibilidade();
        } 
    }
}
