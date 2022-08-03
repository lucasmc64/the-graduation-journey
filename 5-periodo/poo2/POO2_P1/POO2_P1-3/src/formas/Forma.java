package formas;

public abstract class Forma {
    private String descricao; 
    
    public abstract long getArea();
    
    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
}
