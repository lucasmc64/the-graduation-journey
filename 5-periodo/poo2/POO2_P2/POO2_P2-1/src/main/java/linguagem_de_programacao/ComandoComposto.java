package linguagem_de_programacao;

import java.util.ArrayList;

public class ComandoComposto implements Comando {
    private ArrayList<Comando> comandos;
    
    public ComandoComposto() {
        this.comandos = new ArrayList();
    }
    
    public ComandoComposto(ArrayList<Comando> comandos) {
        this.comandos = comandos;
    }
    
    public ComandoComposto(Comando[] comandos) {
        this.comandos = new ArrayList();
        this.addComandos(comandos);
    }
    
    public ComandoComposto(Comando comando) {
        this.comandos = new ArrayList();
        this.addComando(comando);
    }
    
    public void addComandos(Comando[] comandos) {
        for(Comando comando : comandos) {
            this.addComando(comando);
        }
    }

    public void addComando(Comando comando) {
        this.comandos.add(comando);
    }
    
    public void rmComandos(Comando[] comandos) {
        for(Comando comando : comandos) {
            this.rmComando(comando);
        }
    }
    
    public void rmComando(Comando comando) {
        this.comandos.remove(comando);
    }
    
    public void getComando(int i) {
        this.comandos.get(i);
    }
    
    @Override
    public void execute() {
        this.comandos.forEach((comando) -> comando.execute());
    }
}
