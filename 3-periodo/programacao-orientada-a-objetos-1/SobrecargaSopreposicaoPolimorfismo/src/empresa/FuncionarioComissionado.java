package empresa;

/**
 *
 * @author lucasmc64
 */

public class FuncionarioComissionado extends Funcionario {
    protected float comissoes;
    
    public FuncionarioComissionado(String nome, String cpf, char sexo, int idade) {
        super(nome, cpf, sexo, idade);
    }
    
    public FuncionarioComissionado(String nome, String cpf, char sexo, int idade, float salarioBase) {
        this(nome, cpf, sexo, idade);
        
        Funcionario.salarioBase = salarioBase;
    }
 
    @Override
    public double calculaSalario() {
        return Funcionario.getSalarioBase() + this.comissoes;
    }
}
