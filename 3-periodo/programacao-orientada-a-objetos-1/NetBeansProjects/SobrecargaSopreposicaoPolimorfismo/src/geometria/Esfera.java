package geometria;

/**
 *
 * @author lucasmc64
 */

public class Esfera extends FormaTridimensional {
    protected float raio;
    
    public Esfera (String cor, float raio, float x, float y, float z) {
        super(cor, x, y, z);
        
        this.raio = raio;
    }
    
    @Override
    public void printDetalhes() {
        super.printDetalhes();
        System.out.printf("\nForma: Esfera");
        System.out.printf("\nVolume: %f", this.obterVolume());
    }
    
    public double obterVolume() {
        return (4 * Math.PI * Math.pow(this.getRaio(), 3)) / 3;
    }
    
    public static boolean colisao(Esfera e1, Esfera e2) {
        double distanciaX = Math.abs(e1.getX() - e2.getX());
        double distanciaY = Math.abs(e1.getY() - e2.getY());
        double distanciaZ = Math.abs(e1.getZ() - e2.getZ());
        double distancia = Math.sqrt(Math.pow(distanciaX, 2) + Math.pow(distanciaY, 2) + Math.pow(distanciaZ, 2));
        double distanciaMinima = e1.getRaio() + e2.getRaio();

        return (distancia < distanciaMinima);
    }

    public float getRaio() {
        return raio;
    }

    public void setRaio(float raio) {
        this.raio = raio;
    }
}
