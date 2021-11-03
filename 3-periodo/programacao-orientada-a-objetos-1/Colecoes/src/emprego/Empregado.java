package emprego;

/**
 *
 * @author lucasmc64
 */

public class Empregado {
    private String cpf;
    private int idade;
    private double salario;
    
    public Empregado(String cpf, int idade, double salario) {
        this.setCpf(cpf);
        this.setIdade(idade);
        this.setSalario(salario);
    }

    public String getCpf() {
        return this.cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public int getIdade() {
        return this.idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }

    public double getSalario() {
        return this.salario;
    }

    public void setSalario(double salario) {
        this.salario = salario;
    }
}
