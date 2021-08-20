package construtores.Tempo;

/**
 *
 * @author lucasmc64
 */

public class PrincipalTempo {
    
    public static void main(String[] args) {
        Tempo t1 = new Tempo(23, 59, 24);
        
        System.out.println("T1:");
        
        System.out.printf("Agora são %s\n", t1.getHora12());
        System.out.printf("Agora são %s\n", t1.getHora24());
        
        t1.incMinuto();
        t1.incMinuto();
        
        System.out.printf("Agora são %s\n", t1.getHora24());
        
        
        Tempo t2 = new Tempo(1, 1, 24);
        
        System.out.println("T2:");
        
        System.out.printf("Agora são %s\n", t2.getHora24());
        
        t2.decMinuto();
        t2.decMinuto();
        
        System.out.printf("Agora são %s\n", t2.getHora24());
    }
    
}
