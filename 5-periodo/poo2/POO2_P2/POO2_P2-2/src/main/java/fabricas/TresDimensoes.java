package fabricas;

import copos.*;
import garrafas.*;
import pratos.*;

public class TresDimensoes implements Graficos {
    @Override
    public Copo fabricarCopo() {
        return new Copo3D();
    }

    @Override
    public Prato fabricarPrato() {
        return new Prato3D();
    }

    @Override
    public Garrafa fabricarGarrafa() {
        return new Garrafa3D();
    }
}
