package estruturadedados;

import java.util.Scanner;

public class MenuSimples {

    static Scanner scan = new Scanner(System.in);

    public static void main(String[] args) {
        //instancia a lista vazia
        ListaSimples lista1 = new ListaSimples();
        ListaSimples lista2 = new ListaSimples();
        char opcao;
        int valor;
        Item item;
        
        do {
            System.out.println("escolha uma opção:\n"
                    + "1. inserir nó no final da lista\n"
                    + "2. pesquisar se um determinado valor\n"
                    + "3. remover um determinado nó da lista\n"
                    + "4. concatenar listas\n"
                    + "5. sair do programa");
            opcao = scan.next().charAt(0);

            switch (opcao) {
                case '1':
                    /*System.out.println("digite um valor inteiro:");
                    valor = scan.nextInt();
                    item = new Item(valor);
                    lista1.inserirUltimo(item);*/
                    lista1.inserirUltimo(new Item(10));
                    lista1.inserirUltimo(new Item(20));
                    lista1.inserirUltimo(new Item(30));
                    lista2.inserirUltimo(new Item(40));
                    lista2.inserirUltimo(new Item(50));
                    lista2.inserirUltimo(new Item(60));
                    System.out.println("operação realizada com sucesso!");
                    break;
                case '2':
                    System.out.println("digite o valor inteiro a"
                            + " ser procurado na lista:");
                    valor = scan.nextInt();
                    if (lista1.pesquisarNo(valor) != null) {
                        System.out.println("o valor está na lista");
                    } else {
                        System.out.println("o valor não está na lista");
                    }
                    break;
                case '3':
                    System.out.println("digite o valor inteiro a"
                            + " ser removido da lista:");
                    valor = scan.nextInt();
                    if (lista1.removerNó(valor)) {
                        System.out.println("o valor foi removido com sucesso!");
                    } else {
                        System.out.println("o valor não está na lista");
                    }
                    break;
                case '4': 
                    lista1.concatenarListas(lista2);
                    break;
                case '5':
                    System.out.println("fim");
                    break;
                default:
                    System.out.println("opção inválida");
            }
        } while (opcao != '4');
    }
}
