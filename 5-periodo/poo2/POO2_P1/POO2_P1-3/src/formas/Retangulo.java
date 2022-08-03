package formas;

public class Retangulo extends Forma {
    private int altura;
    private int largura;

    public Retangulo(int altura, int largura) {
        setAltura(altura);
        setLargura(largura);
        setDescricao("Retângulo");
    }
    
    public long getArea() {
        return this.getAltura() * this.getLargura();
    }

    public int getAltura() {
        return altura;
    }

    public void setAltura(int altura) {
        this.altura = altura;
    }

    public int getLargura() {
        return largura;
    }

    public void setLargura(int largura) {
        this.largura = largura;
    }
}
