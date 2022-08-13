package linguagem_de_programacao;

public class ComandoCondicional implements Comando {
    private Comando comandoA;
    private Comando comandoB;
    
    public ComandoCondicional(Comando comandoA, Comando comandoB) {
        this.comandoA = comandoA;
        this.comandoB = comandoB;
    }

    @Override
    public void execute() {
        if(Math.random() < 0.5) {
            comandoA.execute();
        } else {
            comandoB.execute();
        }
    }
    
}
