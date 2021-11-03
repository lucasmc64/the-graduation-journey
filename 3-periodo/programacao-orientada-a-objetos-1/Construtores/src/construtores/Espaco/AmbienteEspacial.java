package construtores.Espaco;

import java.util.Scanner;

/**
 *
 * @author lucasmc64
 */

public class AmbienteEspacial {
    
    public static void main(String[] args) {
        
        Scanner scanner = new Scanner(System.in);
        NaveEspacial[] nes = new NaveEspacial[5];
        int opcao;
    
        do {
    
            System.out.print("\n\n-+- MENU -+-\n\n");
            if(NaveEspacial.qtdNaves >= 3)
                System.out.print("CUIDADO: Superpopulação de naves!\n");
            System.out.println("1) Criar nova nave");
            System.out.println("2) Mostrar naves existentes");
            System.out.println("3) Encerrar programa");
            System.out.print("\n> ");
            opcao = scanner.nextInt();
            
            switch(opcao) {
                case 1:
                    if(NaveEspacial.qtdNaves < 5) {
                        System.out.print("Qual é o nome da nave? ");
                        String nomeNave = scanner.next();
                        nes[NaveEspacial.qtdNaves] = new NaveEspacial(nomeNave);
                    } else {
                        System.out.print("\nO espaço é infinito... mas nesse momento só cabem 5 naves!\n");
                    }
                    
                    break;
                case 2:
                    System.out.print("\nNaves cadastradas:\n");
                    for(int i = 0; i < NaveEspacial.qtdNaves; i++) {
                        nes[i].mostrarNave();
                    }
                    
                    break;
            }
    
        } while(opcao != 3);
        
        if(NaveEspacial.qtdNaves > 1) {
            System.out.println(nes[0].naveMaisRapida(nes[1]));
        }
        
    }
    
}
