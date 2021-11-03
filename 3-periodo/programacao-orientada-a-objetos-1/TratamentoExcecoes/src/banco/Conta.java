package banco;

/**
 *
 * @author lucasmc64
 */

public class Conta {
    private String nome;
    private double saldo;
    private double numero;
    private static int qtdContas = 0;
    
    public Conta(String nome, double numero) {
        this.nome = nome;
        this.numero = numero;
        this.saldo = 0;
        Conta.qtdContas++;
    }
        
    public Conta(String nome, double numero, double saldo) {
        this(nome, numero);
        
        if(saldo >= 0)
            this.saldo = saldo;
    }
    
    public boolean sacar(double valor) {
        if(valor > this.getSaldo()) {
            System.out.println("Impossível sacar valor maior que disponível na conta.");
            return false;
        } else if(valor <= 0) {
            System.out.println("Impossível sacar valor negativo ou nulo.");
            return false;
        }
        
        this.setSaldo(this.getSaldo() - valor);
        return true;
    }
    
    public boolean depositar(double valor) {
        if(valor <= 0) {
            System.out.println("Impossível depositar valor negativo ou nulo.");
            return false;
        }
        
        this.setSaldo(this.getSaldo() + valor);
        return true;
    }
    
    public boolean mostrarSaldo() {
        System.out.printf("SALDO: R$%.2f\n", this.getSaldo());
        return true;
    }

    public String getNome() {
        return this.nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public double getSaldo() {
        return this.saldo;
    }

    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }

    public double getNumero() {
        return this.numero;
    }

    public static int getQtdContas() {
        return Conta.qtdContas;
    }
}
