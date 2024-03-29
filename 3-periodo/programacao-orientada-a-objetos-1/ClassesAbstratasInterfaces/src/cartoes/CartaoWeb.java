package cartoes;

/**
 *
 * @author lucasmc64
 */

public abstract class CartaoWeb {
    private String destinatario;
    
    public CartaoWeb(String destinatario) {
        this.setDestinatario(destinatario);
    }
    
    public abstract void showMessage();

    public String getDestinatario() {
        return destinatario;
    }

    public void setDestinatario(String destinatario) {
        this.destinatario = destinatario;
    }
}
