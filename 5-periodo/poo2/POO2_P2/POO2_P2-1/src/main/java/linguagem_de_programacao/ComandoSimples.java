package linguagem_de_programacao;

public class ComandoSimples implements Comando {
    private String nome;
    
    public ComandoSimples(String nome) {
        this.nome = nome;
    }

    @Override
    public void execute() {
        System.out.println(this.nome);
    }
}
