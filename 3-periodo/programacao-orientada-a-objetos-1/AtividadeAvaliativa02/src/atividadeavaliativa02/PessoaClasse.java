package atividadeavaliativa02;

/**
 *
 * @author lucasmc64
 */

public class PessoaClasse implements PessoaInterface {
    private String nome;
    private String cpf;
    
    public PessoaClasse(String nome, String cpf) {
        this.nome = nome;
        this.cpf = cpf;
    }
    
    @Override
    public String getNome() {
        return this.nome;
    }

    @Override
    public String getCpf() {
        return this.cpf;
    }
}
