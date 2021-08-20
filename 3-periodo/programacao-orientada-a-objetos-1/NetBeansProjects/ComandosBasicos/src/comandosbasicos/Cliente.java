package comandosbasicos;

/**
 *
 * @author lucasmc64
 */

public class Cliente {
    private String nome;
    private String cpf;
    private int idade;
    private String telefone;
    
    public void CadastrarCliente(String newNome, String newCpf, int newIdade, String newTelefone) {
        nome = newNome;
        cpf = newCpf;
        idade = newIdade;
        telefone = newTelefone;
    }
    
    public void MostrarDadosCLiente() {
        System.out.printf("\n\nNome: %s\nCPF: %s\nIdade: %d\nTelefone: %s\n", nome, cpf, idade, telefone);
    }
}
