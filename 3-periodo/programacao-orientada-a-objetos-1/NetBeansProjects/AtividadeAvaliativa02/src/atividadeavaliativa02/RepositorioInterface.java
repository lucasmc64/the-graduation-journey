package atividadeavaliativa02;

/**
 *
 * @author lucasmc64
 */

public interface RepositorioInterface {
    public void inserePessoa(String nome, String cpf);
    public PessoaClasse getPorCpf(String cpf);
    public PessoaClasse getPrimeiraPessoa();
    public PessoaClasse getProximaPessoa();
}
