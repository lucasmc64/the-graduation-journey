package atividadeavaliativa02;

import java.util.ArrayList;

/**
 *
 * @author lucasmc64
 */

public class RepositorioClasse implements RepositorioInterface {
    private ArrayList<PessoaClasse> pessoas;
    private int indexProxima;
    
    public RepositorioClasse(){
        this.pessoas = new ArrayList();
        this.indexProxima = 0;
    }
    
    @Override
    public void inserePessoa(String nome, String cpf) {
        pessoas.add(new PessoaClasse(nome, cpf));
    }
    
    public void inserePessoa(PessoaClasse pessoa) {
        pessoas.add(pessoa);
    }

    @Override
    public PessoaClasse getPorCpf(String cpf) {
        for(int i = 0; i < pessoas.size(); i++) {
            if(pessoas.get(i).getCpf().equals(cpf))
                return pessoas.get(i);
        }
        
        return null;
    }

    @Override
    public PessoaClasse getPrimeiraPessoa() {
        if(pessoas.size() > 0)
            return pessoas.get(0);
        
        return null;
    }

    @Override
    public PessoaClasse getProximaPessoa() {
        if(pessoas.size() == 0)
            return null;
        
        if(this.indexProxima >= pessoas.size()) {
            System.out.println("Fim do array! Voltando ao início...");
            indexProxima = 0; // Volta para o início do array
        }
        
        return pessoas.get(indexProxima++);
    }
    
    public void printDados() {
        for(int i = 0; i < pessoas.size(); i++) {
            System.out.println("Nome: " + pessoas.get(i).getNome());
            System.out.println("CPF: " + pessoas.get(i).getCpf());
            
            if(i + 1 != pessoas.size()) System.out.println("----- + -----");
        }
    }
    
    public PessoaClasse getPorNome(String nome) {
        for(int i = 0; i < pessoas.size(); i++) {
            if(pessoas.get(i).getNome().equals(nome))
                return pessoas.get(i);
        }
        
        return null;
    }
    
    public boolean clearRepositorio() {
        pessoas.clear();
        indexProxima = 0;
        return true;
    }
    
    public RepositorioClasse duplicaRepositorio() {
        RepositorioClasse repoDuplicado = new RepositorioClasse();
        
        for(int i = 0; i < pessoas.size(); i++)
            repoDuplicado.inserePessoa(pessoas.get(i));
        
        return repoDuplicado;
    }
    
    public RepositorioClasse duplicaESubtraiRepositorio(RepositorioClasse repoSub) {
        RepositorioClasse repoDuplicado = new RepositorioClasse();
        
        for(int i = 0; i < pessoas.size(); i++)
            if(repoSub.getPorCpf(pessoas.get(i).getCpf()) == null)
                repoDuplicado.inserePessoa(pessoas.get(i));
        
        return repoDuplicado;
    }
}
