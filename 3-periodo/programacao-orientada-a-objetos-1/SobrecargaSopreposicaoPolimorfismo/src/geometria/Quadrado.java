package geometria;

/**
 *
 * @author lucasmc64
 */

public class Quadrado extends FormaBidimensional {
    protected float lado;
    
    public Quadrado(String cor, float lado, float x, float y) {
        super(cor, x, y);
        
        this.lado = lado;
    }
    
    @Override
    public void printDetalhes() {
        
        super.printDetalhes();
        System.out.printf("\nForma: Quadrado");
        System.out.printf("\nÁrea: %f", this.obterArea());
    }
    
    public double obterArea() {
        return Math.pow(this.lado, 2);
    }
}
