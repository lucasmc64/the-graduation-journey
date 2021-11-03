package empresa;

/**
 *
 * @author lucasmc64
 */

public class FuncionarioNoturno extends Funcionario {
    protected int noitesTrabalhadas;
    protected float adicionalNoturno;
    
    public FuncionarioNoturno(String nome, String cpf, char sexo, int idade) {
        super(nome, cpf, sexo, idade);
    }
    
    public FuncionarioNoturno(String nome, String cpf, char sexo, int idade, float salarioBase) {
        this(nome, cpf, sexo, idade);
        
        Funcionario.salarioBase = salarioBase;
    }
    
    @Override
    public double calculaSalario() {
        return Funcionario.getSalarioBase() + this.noitesTrabalhadas * this.adicionalNoturno;
    }
}
