package estados;

import automatos.*;

public class S1 extends Estado {
    public S1(Automato automato) {
        super(automato);
    }

    @Override
    protected void verificaTransicoes(char letra) throws Exception {
        if(letra == 'a') {
            this.getAutomato().setEstado(new S2(this.getAutomato()));
        } else {
            throw new Exception("Transição não aceita neste autômato. A palavra analizada não pertence à linguagem.");
        }
    }
}
