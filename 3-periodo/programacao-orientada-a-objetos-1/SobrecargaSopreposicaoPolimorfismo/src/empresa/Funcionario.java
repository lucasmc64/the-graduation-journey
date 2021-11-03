package empresa;

/**
 *
 * @author lucasmc64
 */

public class Funcionario {
    protected String nome;
    protected String cpf;
    protected char sexo;
    protected int idade;
    protected static float salarioBase = 0;
    protected static int qtdFuncionarios = 0;
    
    public Funcionario(String nome, String cpf, char sexo, int idade) {
        this.nome = nome;
        this.cpf = cpf;
        this.sexo = sexo;
        this.idade = idade;
    }
    
    public Funcionario(String nome, String cpf, char sexo, int idade, float salarioBase) {
        this(nome, cpf, sexo, idade);
        Funcionario.salarioBase = salarioBase;
    }

    public double calculaSalario() {
        return Funcionario.getSalarioBase();
    }
    
    public static void setSatarioBase(float salarioBase) {
        Funcionario.salarioBase = salarioBase;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public char getSexo() {
        return sexo;
    }

    public int getIdade() {
        return idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }

    public static float getSalarioBase() {
        return salarioBase;
    }

    public static int getQtdFuncionarios() {
        return qtdFuncionarios;
    }
}
