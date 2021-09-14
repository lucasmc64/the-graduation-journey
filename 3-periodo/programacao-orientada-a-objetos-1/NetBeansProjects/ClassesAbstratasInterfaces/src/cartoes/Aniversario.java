package cartoes;

/**
 *
 * @author lucasmc64
 */

public class Aniversario extends CartaoWeb {
    private String dataAniversario;
    
    public Aniversario(String dataAniversario, String destinatario) {
        super(destinatario);
        
        this.dataAniversario = dataAniversario;
    }
    
    @Override
    public void showMessage() {
        System.out.printf("");
    } 
    
}
