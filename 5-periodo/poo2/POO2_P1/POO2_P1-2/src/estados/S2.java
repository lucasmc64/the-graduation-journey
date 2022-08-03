package estados;

import automatos.*;

public class S2 extends Estado {
    public S2(Automato automato) {
        super(automato);
    }

    @Override
    protected void verificaTransicoes(char letra) throws Exception {
        if(letra == 'a') {
            this.getAutomato().setEstado(new S2(this.getAutomato()));
        } else if(letra == 'b') {
            this.getAutomato().setEstado(new S1(this.getAutomato()));
        } else if(letra == 'c') {
            this.getAutomato().setEstado(new S4(this.getAutomato()));
        } else {
            throw new Exception("Transição não aceita neste autômato. A palavra analizada não pertence à linguagem.");
        }
    }
}
