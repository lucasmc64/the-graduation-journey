package geometria;

/**
 *
 * @author lucasmc64
 */

public class Tetraedro extends FormaTridimensional {
    protected float base;
    protected float alturaBase;
    protected float altura;
    
    public Tetraedro(String cor, float base, float alturaBase, float altura, float x, float y, float z) {
        super(cor, x, y, z);
        
        this.base = base;
        this.alturaBase = alturaBase;
        this.altura = altura;
    }
    
    @Override
    public void printDetalhes() {
        super.printDetalhes();
        System.out.printf("\nForma: Tetraedro");
        System.out.printf("\nVolume: %f", this.obterVolume());
    }
    
    public double obterVolume() {
        return ((this.base * this.alturaBase) * this.altura) / 3;
    }
}
