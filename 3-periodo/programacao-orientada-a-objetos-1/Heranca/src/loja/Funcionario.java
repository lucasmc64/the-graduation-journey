package loja;

/**
 *
 * @author lucasmc64
 */

public class Funcionario {
    protected String nome;
    protected String rg;
    protected double salarioBase;
    
    public Funcionario(String nome, String rg, double salarioBase) {
        this.setNome(nome);
        this.setRg(rg);
        this.setSalarioBase(salarioBase);
    }

    public String getNome() {
        return nome;
    }

    protected void setNome(String nome) {
        this.nome = nome;
    }

    public String getRg() {
        return rg;
    }

    protected void setRg(String rg) {
        this.rg = rg;
    }

    public double getSalarioBase() {
        return salarioBase;
    }
    
    protected void setSalarioBase(double salarioBase) {
        this.salarioBase = salarioBase;
    }    
}
