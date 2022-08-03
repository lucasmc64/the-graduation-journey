package estados;

import automatos.*;
import java.util.HashMap;
import java.util.Map;

public abstract class Estado {
    private Automato automato;
    private Map<Character, Class<? extends Estado>> transicoes;
    private boolean estadoFinal;

    public Estado(Automato automato) {
        this.estadoFinal = false;
        this.transicoes = new HashMap<Character, Class<? extends Estado>>();
        
        setAutomato(automato);
    }
    
    public Estado(Automato automato, boolean estadoFinal) {
        setEstadoFinal(estadoFinal);
        setAutomato(automato);
    }
    
    protected abstract void verificaTransicoes(char letra) throws Exception;
    
    public void leituraDeCaractere(char letra) throws Exception {
        verificaTransicoes(letra);
        this.getAutomato().setString(this.getAutomato().getString() + letra);
    }

    public Automato getAutomato() {
        return automato;
    }

    public void setAutomato(Automato automato) {
        this.automato = automato;
    }

    public boolean isEstadoFinal() {
        return estadoFinal;
    }

    public void setEstadoFinal(boolean estadoFinal) {
        this.estadoFinal = estadoFinal;
    }

    public Map<Character, Class<? extends Estado>> getTransicoes() {
        return transicoes;
    }
}
