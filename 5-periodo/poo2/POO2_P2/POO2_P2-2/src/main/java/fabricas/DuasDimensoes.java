package fabricas;

import copos.*;
import garrafas.*;
import pratos.*;

public class DuasDimensoes implements Graficos {
    @Override
    public Copo fabricarCopo() {
        return new Copo2D();
    }

    @Override
    public Prato fabricarPrato() {
        return new Prato2D();
    }

    @Override
    public Garrafa fabricarGarrafa() {
        return new Garrafa2D();
    }
}
