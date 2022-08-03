package efeitos;

import formas.*;

public abstract class Efeito extends Forma {
    private Forma forma;
    
    public Efeito(Forma forma) {
        this.forma = forma;
    }
    
    public long getArea() {
        return this.forma.getArea();
    }
    
    public String getDescricao() {
        return forma.getDescricao() + ", " + super.getDescricao();
    }
}
