package geometria;

/**
 *
 * @author lucasmc64
 */

public class Forma {
    protected int id;
    protected String cor;
    protected float x;
    protected float y;
    protected static int qtdFormas = 0;
    
    public Forma(String cor, float x, float y) {
        this.id = this.qtdFormas;
        this.cor = cor;
        this.x = x;
        this.y = y;
        
        this.qtdFormas++;
    }
    
    protected void printTitulo(String titulo) {
        System.out.printf("=+=+= %s =+=+=", titulo.toUpperCase());
    }
    
    public void printDetalhes() {
        System.out.printf("\nCor: %s \nX: %f \nY: %f \nId: %d", this.getCor(), this.getX(), this.getY(), this.getId());
    }

    public int getId() {
        return id;
    }

    public String getCor() {
        return cor;
    }

    public void setCor(String cor) {
        this.cor = cor;
    }

    public float getX() {
        return x;
    }

    public void setX(float x) {
        this.x = x;
    }

    public float getY() {
        return y;
    }

    public void setY(float y) {
        this.y = y;
    }

    public static int getQtdFormas() {
        return qtdFormas;
    }
}
