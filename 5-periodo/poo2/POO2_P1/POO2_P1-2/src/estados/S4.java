package estados;

import automatos.*;

public class S4 extends Estado {
    public S4(Automato automato) {
        super(automato);
        setEstadoFinal(true);
    }

        @Override
    protected void verificaTransicoes(char letra) throws Exception {
        if(letra == 'd') {
            this.getAutomato().setEstado(new S3(this.getAutomato()));
        } else {
            throw new Exception("Transição não aceita neste autômato. A palavra analizada não pertence à linguagem.");
        }
    }
}
