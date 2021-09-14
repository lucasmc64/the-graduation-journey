package escritorio;

/**
 *
 * @author lucasmc64
 */

public abstract class Funcionario {
    protected String nome;
    protected String matricula;
    protected static double salario_base = 0;
    protected static int qtdFuncionarios = 0;

    public Funcionario(String nome, String matricula) {
        this.setNome(nome);
        this.setMatricula(matricula);
        
        this.qtdFuncionarios++;
    }
    
    public Funcionario(String nome, String matricula, double salario_base) {
        this(nome, matricula);
        
        this.setSalario_base(salario_base);
    }
    
    public abstract double calculaSalario();

    public String getNome() {
        return this.nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getMatricula() {
        return this.matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public double getSalario_base() {
        return this.salario_base;
    }

    public void setSalario_base(double salario_base) {
        this.salario_base = salario_base;
    }

    public int getQtdFuncionarios() {
        return qtdFuncionarios;
    }
}
