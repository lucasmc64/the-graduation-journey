package geometria;

/**
 *
 * @author lucasmc64
 */

public class Cubo extends FormaTridimensional {
    protected float lado;
    
    public Cubo(String cor, float lado, float x, float y, float z) {
        super(cor, x, y, z);
        
        this.lado = lado;
    }
    
    @Override
    public void printDetalhes() {
        super.printDetalhes();
        System.out.printf("\nForma: Cubo");
        System.out.printf("\nVolume: %f", this.obterVolume());
    }
    
    public double obterVolume() {
        return Math.pow(this.lado, 3);
    }
}
