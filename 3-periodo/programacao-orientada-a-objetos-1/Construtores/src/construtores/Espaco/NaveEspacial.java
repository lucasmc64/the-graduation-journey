package construtores.Espaco;

/**
 *
 * @author lucasmc64
 */

public class NaveEspacial {
    
    private String nome;
    private int velocidade;
    static int qtdNaves = 0;
    
    public NaveEspacial(String s) {
        if(qtdNaves < 3) {
            nome = s;
            velocidade = (int) Math.floor(Math.random() * (10 - 5 + 1) + 5);
        } else {
            nome = "Nave com defeito";
            velocidade = 0;
        }
        
        qtdNaves++;
    }
    
    public void mostrarNave() {
        if(velocidade == 0)
            System.out.println("Nave inoperante");
        else
            System.out.println(nome);
    }
    
    public boolean naveMaisRapida(NaveEspacial n) {
        return n.velocidade > velocidade;
    }
    
}
