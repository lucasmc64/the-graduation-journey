package locadora;

/**
 *
 * @author lucasmc64
 */

public class Video extends Midia {
    protected String[] atores;
    protected String diretor;
    protected String duracao;
    protected String faixaEtaria;
    
    public Video(String nome, String tipo, String genero, String anoLancamento, int qtdCopias, float preco, String[] atores, String diretor, String duracao, String faixaEtaria) {
        super(nome, tipo, genero, anoLancamento, qtdCopias, preco);
        
        this.setAtores(atores);
        this.setDiretor(diretor);
        this.setDuracao(duracao);
        this.setFaixaEtaria(faixaEtaria);
    }

    protected void setAtores(String[] atores) {
        this.atores = atores;
    }

    protected void setDiretor(String diretor) {
        this.diretor = diretor;
    }

    protected void setDuracao(String duracao) {
        this.duracao = duracao;
    }

    protected void setFaixaEtaria(String faixaEtaria) {
        this.faixaEtaria = faixaEtaria;
    }

    public String[] getAtores() {
        return this.atores;
    }

    public String getDiretor() {
        return this.diretor;
    }

    public String getDuracao() {
        return this.duracao;
    }

    public String getFaixaEtaria() {
        return this.faixaEtaria;
    }
}
