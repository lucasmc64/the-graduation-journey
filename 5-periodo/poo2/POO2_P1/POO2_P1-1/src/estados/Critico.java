package estados;

import produtos.*;

public class Critico extends Estoque {
    public Critico(Produto produto) {
        super(produto);
    }

    @Override
    protected void setLimites() {
        this.setLimiteInferior(0);
        this.setLimiteSuperior(10);
    }

    @Override
    protected void verificaDisponibilidade() {
        if(this.getProduto().getQuantidade() < this.getLimiteInferior()) {
            this.getProduto().setEstoque(new Indisponivel(this.getProduto())).verificaDisponibilidade();
        } else if(this.getProduto().getQuantidade() > this.getLimiteSuperior()) {
            this.getProduto().setEstoque(new Disponivel(this.getProduto())).verificaDisponibilidade();
        } else {
            System.out.printf("\n=---------=+=---------=         ATENÇÃO         =---------=+=---------=\n");
            System.out.printf("\nExistem somente %d produtos no estoque. Reponha-o assim que possível!\n\n", this.getProduto().getQuantidade());
            System.out.printf("=---------=+=---------=+=---------=+=---------=+=---------=+=---------=\n\n");

        }
    }
}
