package fabricas;

import copos.*;
import garrafas.*;
import pratos.*;

public interface Graficos {
    public abstract Copo fabricarCopo();
    public abstract Prato fabricarPrato();
    public abstract Garrafa fabricarGarrafa();
}
