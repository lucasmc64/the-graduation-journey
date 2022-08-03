package automatos;

import estados.*;

public abstract class Automato {
    private Estado estado;
    private String string;
    
    public Automato() {
        setEstado(new S1(this));
        setString("");
    }
    
    public void leituraDeCaractere(char letra) throws Exception {
        estado.leituraDeCaractere(letra);
    }
    
    public boolean verificaValidadeDaCadeia() {
        return estado.isEstadoFinal();
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }

    public String getString() {
        return string;
    }

    public void setString(String string) {
        this.string = string;
    }
}
