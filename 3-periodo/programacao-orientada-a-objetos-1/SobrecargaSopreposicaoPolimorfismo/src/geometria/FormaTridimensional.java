package geometria;

/**
 *
 * @author lucasmc64
 */

public class FormaTridimensional extends Forma {
    protected float z;
    
    public FormaTridimensional(String cor, float x, float y, float z) {
        super(cor, x, y);
        
        this.z = z;
    }
    
    @Override
    public void printDetalhes() {
        this.printTitulo("Detalhes da Forma Tridimensional");
        super.printDetalhes();
    }
    
    public float getZ() {
        return z;
    }

    public void setZ(float z) {
        this.z = z;
    }
}
