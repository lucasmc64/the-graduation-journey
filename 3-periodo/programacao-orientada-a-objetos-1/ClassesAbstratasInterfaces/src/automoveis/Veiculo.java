package automoveis;

/**
 *
 * @author lucasmc64
 */

public interface Veiculo {
    public abstract String marca();
    public abstract String modelo();
    public abstract String cor();
    public abstract float potencia();
    public abstract void mostraDados();
}
