package geometria;

/**
 *
 * @author lucasmc64
 */

public class FormaBidimensional extends Forma {
    public FormaBidimensional(String cor, float x, float y) {
        super(cor, x, y);
    }
    
    @Override
    public void printDetalhes() {
        this.printTitulo("Detalhes da Forma Bidimensional");
        super.printDetalhes();
    }
}
