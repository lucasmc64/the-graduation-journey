package loja;

/**
 *
 * @author lucasmc64
 */

public class Administrador extends Funcionario {
    protected float horasExtras;
    
    public Administrador(String nome, String rg, double salarioBase) {
        super(nome, rg, salarioBase);
        
        this.setHorasExtras(0);
    }

    public float getHorasExtras() {
        return this.horasExtras;
    }
    
    protected void setHorasExtras(float horasExtras) {
        this.horasExtras = horasExtras;
    }
    
    public void addHorasExtras(float horasExtras) {
        this.horasExtras += horasExtras;
    }

    public double getSalarioTotal() {
        double salarioTotal = this.getSalarioBase() +  this.getHorasExtras() * (0.01 * this.getSalarioBase());
        
        this.setHorasExtras(0);
        
        return salarioTotal;
    }
}
