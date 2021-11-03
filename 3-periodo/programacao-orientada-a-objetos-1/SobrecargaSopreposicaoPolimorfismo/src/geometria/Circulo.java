package geometria;

/**
 *
 * @author lucasmc64
 */

public class Circulo extends FormaBidimensional {
    protected float raio;
    
    public Circulo(String cor, float raio, float x, float y) {
        super(cor, x, y);
        
        this.raio = raio;
    }
    
    @Override
    public void printDetalhes() {
        super.printDetalhes();
        System.out.printf("\nForma: Círculo");
        System.out.printf("\nÁrea: %f", this.obterArea());
    }
    
    public double obterArea() {
        return Math.PI * Math.pow(this.getRaio(), 2);
    }
    
    public static boolean colisao(Circulo c1, Circulo c2) {
        double distanciaX = Math.abs(c1.getX() - c2.getX());
        double distanciaY = Math.abs(c1.getY() - c2.getY());
        double distancia = Math.sqrt(Math.pow(distanciaX, 2) + Math.pow(distanciaY, 2));
        double distanciaMinima = c1.getRaio() + c2.getRaio();

        return (distancia < distanciaMinima);
    }

    public float getRaio() {
        return raio;
    }

    public void setRaio(float raio) {
        this.raio = raio;
    }
}
