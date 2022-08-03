package main;

import produtos.*;

public class Main {
    public static void main(String[] args) throws Exception {
        Produto produto = new PikachuDePelucia(20);
        
        System.out.printf("%d - %s\n", produto.getQuantidade(), produto.getEstoque().getClass().getName());

        try {
            produto.compra(5);
        } catch(Exception error) {
            System.out.println(error.getMessage());
        }

        System.out.printf("%d - %s\n", produto.getQuantidade(), produto.getEstoque().getClass().getName());

        try {
            produto.venda(20);
        } catch(Exception error) {
            System.out.println(error.getMessage());
        }

        System.out.printf("%d - %s\n", produto.getQuantidade(), produto.getEstoque().getClass().getName());

        try {
            produto.compra(20);
        } catch(Exception error) {
            System.out.println(error.getMessage());
        }

        System.out.printf("%d - %s\n", produto.getQuantidade(), produto.getEstoque().getClass().getName());

        try {
            produto.venda(20);
        } catch(Exception error) {
            System.out.println(error.getMessage());
        }

        System.out.printf("%d - %s\n", produto.getQuantidade(), produto.getEstoque().getClass().getName());

        try {
            produto.venda(10);
        } catch(Exception error) {
            System.out.println(error.getMessage());
        }

        System.out.printf("%d - %s\n", produto.getQuantidade(), produto.getEstoque().getClass().getName());
    }
}
