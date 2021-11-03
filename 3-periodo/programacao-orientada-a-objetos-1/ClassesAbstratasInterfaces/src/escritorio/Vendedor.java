package escritorio;

/**
 *
 * @author lucasmc64
 */

public class Vendedor extends Funcionario {
    private double comissao = 0;
    
    public Vendedor(String nome, String matricula, double comissao) {
        super(nome, matricula);
        
        this.setComissao(comissao);
    }
    
    public Vendedor(String nome, String matricula, double comissao, double salario_base) {
        super(nome, matricula, salario_base);
        
        this.setComissao(comissao);
    }
    
    @Override
    public double calculaSalario() {
        return this.getSalario_base() + this.getComissao();
    }

    public double getComissao() {
        return comissao;
    }

    public void setComissao(double comissao) {
        this.comissao = comissao;
    }
}
