package estruturadedados;

public class ListaSimples {

    private No prim;
    private No ult;
    private int quantNos;
//construtor da classe

    public ListaSimples() {
        limpaLista(this);
    }

    public int getQuantNos() {
        return this.quantNos;
    }

    public No getPrim() {
        return this.prim;
    }

    public No getUlt() {
        return this.ult;
    }

    public void setQuantNos(int novoValor) {
        this.quantNos = novoValor;
    }

    public void setPrim(No novoNo) {
        this.prim = novoNo;
    }

    public void setUlt(No novoNo) {
        this.ult = novoNo;
    }

    public boolean eVazia() {
        return (this.prim == null);
    }

//insere um novo nó no final da lista ou se a lista estiver vazia, insere o primeiro nó na lista
    public void inserirUltimo(Item elem) {
        No novoNo = new No(elem);
        if (this.eVazia()) {
            this.prim = novoNo;
        } else {
            this.ult.setProx(novoNo);
        }
        this.ult = novoNo;
        this.quantNos++;
    }
//retorna o endereço do nó que está contendo o valor a ser procurado.

    public No pesquisarNo(int chave) {
        No atual = this.prim;
        while ((atual != null) && (atual.getInfo().getChave() != chave)) {
            atual = atual.getProx();
        }
        return atual;
    }
//remove um determinado nó em qualquer posição na lista.

    public boolean removerNo(int chave) {
        No atual = this.prim;
        No ant = null;
        if (eVazia()) {
            return false;
        } else {
            while ((atual != null) && (atual.getInfo().getChave() != chave)) {
                ant = atual;
                atual = atual.getProx();
            }
            if (atual == null) {
                return false;
            } else {
                if (atual == this.prim) {
                    if (this.prim == this.ult) {
                        this.ult = null;
                    }
                    this.prim = this.prim.getProx();
                } else {
                    if (atual == this.ult) {
                        this.ult = ant;
                    }
                    ant.setProx(atual.getProx());
                }
                this.quantNos--;
                return true;
            }

        }
    }
//outra forma de escrever o método para remover determinado Nó

    public boolean removerNó(int x) {
        if (this.eVazia()) {
            return false;
        } else {
            if (this.prim.getInfo().getChave() == x) {
                if (this.prim.getProx() == null) {//se for único nó da lista
                    this.ult = null;
                }
//remover o primeiro nó da lista
                this.prim = this.prim.getProx();
            } else {
                No atual = this.prim;
                while ((atual.getProx() != null)
                        && (atual.getProx().getInfo().getChave() != x)) {
                    atual = atual.getProx();
                }
                if (atual.getProx() == null) {//não achou o valor na lista
                    return false;
                } else {
                    if (atual.getProx() == this.ult) {//se for o último nó
                        atual.setProx(null);
                        this.ult = atual;
                    } else { //remove o nó no meio da lista
                        atual.setProx(atual.getProx().getProx());
                    }
                }
            }
            this.quantNos--;
            return true;
        }
    }

    public void concatenarListas(ListaSimples lista2) {
        ListaSimples[] listas = {this, lista2};

        if (this.eVazia() && !lista2.eVazia()) {
            System.out.println("Lista 1 está vazia.\nLista 2 está cheia.");
            System.out.println("Lista 1: \n" + this.toString());
            System.out.println("Lista 2: \n" + lista2.toString());

            this.prim = lista2.prim;
            this.ult = lista2.ult;
            this.quantNos = lista2.quantNos;
        } else if (!lista2.eVazia()) {
            System.out.println("As listas estão cheias.");
            System.out.println("Lista 1: \n" + this.toString());
            System.out.println("Lista 2: \n" + lista2.toString());

            this.ult.setProx(lista2.prim);
            this.ult = lista2.ult;
            this.quantNos += lista2.quantNos;
        }

        limpaLista(lista2);

        System.out.println("\n\nLista 2 foi transferida para lista 1");

        exibeListas(listas);
    }

//mostra todo o conteúdo da lista
    @Override
    public String toString() {
        String msg = "";
        No atual = this.prim;
        while (atual != null) {
            msg += atual.getInfo().getChave() + "\n";
            atual = atual.getProx();
        }
        return msg;
    }

    //Método para limpar lista
    public final void limpaLista(ListaSimples lista) {
        lista.prim = null;
        lista.ult = null;
        lista.quantNos = 0;
    }

    public final void exibeListas(ListaSimples[] listas) {
        for (int j = 1; j <= listas.length; j++) {
            if (listas[j].eVazia()) {
                System.out.println("Lista " + j + ": Vazia!");
            } else {
                for (int i = 1; i <= listas.length; i++) {
                    //if(listas[i].eVazia()) {
                    //System.out.println("Lista " + i + ": Vazia!");
                    //} else {
                    System.out.println("Lista " + i + ": \n" + listas[i - 1].toString());
                }
            }
        }

        /*if () {
            for (int i = 0; i < listas.length; i++) {
                System.out.println("Lista 1: " + this.toString());
                System.out.println("Lista 2: Vazia!");
            }
        }*/
    }
}
