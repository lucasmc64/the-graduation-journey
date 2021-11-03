package cartoes;

/**
 *
 * @author lucasmc64
 */

public class DiaDosNamorados extends CartaoWeb {
    private String namorado1;
    private String namorado2;
    private int anosDeNamoro = 1;
    
    public DiaDosNamorados(String namorado1, String namorado2, int anosDeNamoro, String destinatario) {
        super(destinatario);
        
        this.namorado1 = namorado1;
        this.namorado2 = namorado2;
        this.anosDeNamoro = anosDeNamoro;
    }
    
    @Override
    public void showMessage() {
        System.out.printf("");
    }
}
