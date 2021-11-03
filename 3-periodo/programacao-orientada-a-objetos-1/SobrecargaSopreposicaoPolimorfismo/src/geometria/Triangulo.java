package geometria;

/**
 *
 * @author lucasmc64
 */

public class Triangulo extends FormaBidimensional {
    protected float base;
    protected float altura;
    
    public Triangulo(String cor, float base, float altura, float x, float y) {
        super(cor, x, y);
        
        this.base = base;
        this.altura = altura;
    }
    
    @Override
    public void printDetalhes() {
        super.printDetalhes();
        System.out.printf("\nForma: Triângulo");
        System.out.printf("\nÁrea: %f", this.obterArea());
    }
    
    public double obterArea() {
        return (this.base * this.altura) / 2;
    }
}
