package loja;

/**
 *
 * @author lucasmc64
 */

public class Vendedor extends Funcionario {
    protected double totalVendas;
    
    public Vendedor(String nome, String rg, double salarioBase) {
        super(nome, rg, salarioBase);
        
        this.totalVendas = 0;
    }
    
    public double getTotalVendas() {
        return this.totalVendas;
    }

    protected void setTotalVendas(double totalVendas) {
        this.totalVendas = totalVendas;
    }
    
    public void addVenda(double venda) {
        this.setTotalVendas(this.getTotalVendas() + venda);
    }
    
    public double getSalarioTotal() {
        double salarioTotal = this.getSalarioBase() + 0.05 * this.getTotalVendas();
        
        this.setTotalVendas(0);
        
        return salarioTotal;
    }
}
