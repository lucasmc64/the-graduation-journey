#include <stdio.h>
#include <stdlib.h>
#include "ALL.h"
#define Ordem 5

/*
    Grupo ALL
    Integrantes:
    Alana Soares Reis - 11911BCC055
    Lucas Marçal Coutinho - 11911BCC012
    Lucas Mattos Vieira - 11911BCC015
*/

// Segue-se o conceito de Knuth, que diz qua a ordem da árvore é a quantidade de filhos que os nós podem ter (quantidade de chaves + 1)

struct NO {
    int total_chaves;

    int chaves[Ordem - 1];

    struct NO *filha[Ordem];
};


ArvB *cria_ArvB() {
    ArvB *raiz = (ArvB *) malloc(sizeof(ArvB));

    if(raiz != NULL) {
        *raiz = NULL;
    }

    return raiz;
}


void libera_NO(ArvB no) {
    if(no == NULL) {
        return;
    }

    int i;
    for(i = 0; i < Ordem; i++) {
        libera_NO(no->filha[i]); // Libera recursivamente todas as páginas filhas
    }

    free(no);
    no = NULL; // É ideal apontar os ponteiros para NULL depois de liberá-los
}


void libera_ArvB(ArvB *raiz) {
    if(raiz == NULL) {
        return;
    }

    libera_NO(*raiz); // Libera cada página
    free(raiz); // Libera a raiz
}


int ehVazia_ArvB(ArvB *raiz) {
    if (raiz == NULL || *raiz == NULL) {
        return 1;
    } else {
        return 0;
    }
}


int insereAcima_ArvB(ArvB *raiz, ArvB *no_atual, ArvB *nova_ramificacao, int valor) {
    int i, j;

    ArvB atual = *raiz;
    ArvB ant = NULL;

    if(atual == *no_atual) { // Verificamos aqui se o nó que dividimos era a raiz
        ArvB novo_no = (ArvB) malloc(sizeof(struct NO));

        if(novo_no == NULL) {
            return 0;
        }

        novo_no->chaves[0] = valor; // Valor que subiu
        novo_no->total_chaves = 1;
        novo_no->filha[0] = *no_atual;
        novo_no->filha[1] = *nova_ramificacao;

        *raiz = novo_no;
        return 1;
    }

    while(1) { // Como não é a raiz, temos que procurar pelo pai do nó que dividimos
        for(i = 0; i < atual->total_chaves; i++) {
            if((*no_atual)->chaves[0] <= atual->chaves[i]) { // Se achar um elemento, achou o nó pois não há elementos repetidos
                break;
            }
        }

        if((*no_atual)->chaves[0] == atual->chaves[i]) {
            break;
        }

        ant = atual;

        atual = atual->filha[i];
    }

    atual = ant;

    int no;
    if(valor < atual->chaves[atual->total_chaves / 2]) { // Verifica se o valor deve ser inserido no nó atual ou no que será criado
        no = 1;
    } else {
        no = 2;
    }

    if(atual->total_chaves != Ordem - 1) { // Verifica se há espaço no nó para inserir sem ter que dividi-lo
        for(j = 0; j < atual->total_chaves; j++) {
            if(valor < atual->chaves[j]) {
                break;
            }
        }

        for(i = atual->total_chaves; j < i ; i--) {
            atual->chaves[i] = atual->chaves[i - 1]; // Move-se os valores de j em diante para dar espaço
            atual->filha[i + 1] = atual->filha[i]; // Move-se os ponteiros de j + 1 em diante para dar espaço
        }

        atual->chaves[j] = valor;
        atual->filha[j + 1] = *nova_ramificacao;
        atual->total_chaves++;

        return 1;
    } else { // Entramos aqui caso não tenha espaço para a inserção, então esse nó terá que ser dividido
        ArvB novo_no = (ArvB) malloc(sizeof(struct NO));

        if(novo_no == NULL) {
            return 0;
        }

        novo_no->total_chaves = 0;
        j = 0;
        for(i = atual->total_chaves / 2; i < Ordem - 1; i++) { // O novo_no recebe a segunda metade das chaves e ponteiros do nó atual, porém há um detalhe quanto ao filha[0] do novo_no
            novo_no->chaves[j] = atual->chaves[i];

            if(i == atual->total_chaves / 2) { // O filha[0]  do novo_no sempre recebe NULL, essa posição será preenchida mais adiante de acordo em qual dos nós eu devo inserir o valor que subiu
                novo_no->filha[j] = NULL;
            } else { // Move todos os outros ponteiros
                novo_no->filha[j] = atual->filha[i];
                atual->filha[i] = NULL;
            }

            atual->total_chaves--;
            novo_no->total_chaves++;
            j++;
        }
        novo_no->filha[j] = atual->filha[i]; // Último ponteiro da direita
        atual->filha[i] = NULL;

        int valor_que_sobe;

        if(no == 1) { // Insere o novo valor no nó atual
            for(j = 0; j < atual->total_chaves; j++) { // Procura pela posição certa para a inserção do novo valor
                if(valor < atual->chaves[j]) {
                    break;
                }
            }

            for(i = atual->total_chaves; j < i ; i--) {
                atual->chaves[i] = atual->chaves[i - 1]; // Move-se os valores de j em diante para dar espaço
                atual->filha[i + 1] = atual->filha[i]; // Move-se os ponteiros de j + 1 em diante para dar espaço
            }

            atual->chaves[j] = valor;
            atual->filha[j + 1] = *nova_ramificacao;

            /*
                Repare que quando inserimos o novo valor não incrementamos o valor de total de chaves
                    1 -
                    Isso significa que o maior valor, o último valor do nó, está ficando de fora
                    Isso se deve que temos inserir ele no nó acima para ter ponteiros o suficiente para apontar também para o novo nó que foi criado
                    2 -
                    Também adicionamos um novo ponteiro, se um valor vai subir não há espaço para apontar para o ponteiro mais a direita
                    Mas lembra que deixamos o filha[0] do novo_no nulo? Ele que deverá apontar para esse nó agora
            */
            novo_no->filha[0] = atual->filha[atual->total_chaves + 1];
            atual->filha[atual->total_chaves + 1] = NULL;
            valor_que_sobe = atual->chaves[atual->total_chaves];
        } else { // Insere o novo valor no novo nó
            for(j = 0; j < novo_no->total_chaves; j++) { // Procura pela posição certa para a inserção do novo valor
                /*
                    Lembra que deixamos o filha[0] nulo?
                    A medida que percorremos entre 0 e a quatidade de chaves para achar a posição ideal para a inserção do novo valor, movemos todos os ponteiros da frente uma casa para trás
                    Isso serve para ocupar essa posição nula e achar a posição ideal da inserção do nó filho que não foi ligado a árvore ainda
                */
                novo_no->filha[j] = novo_no->filha[j + 1];
                if(valor < novo_no->chaves[j]) {
                    break;
                }
            }

            for(i = novo_no->total_chaves; j < i ; i--) { // Como os ponteiro já foram movidos, move-se os valores de j em diante para dar espaço ao valor que subiu
                novo_no->chaves[i] = novo_no->chaves[i - 1];
            }

            novo_no->total_chaves++;
            novo_no->chaves[j] = valor;
            novo_no->filha[j] = *nova_ramificacao;

            /*
                Como a inserção foi no novo_no, o valor que sobe é o menor valor do nó
                Então retiramos esse valor e movemos as chaves uma posição para trás
                Não é necessário mover os ponteiros pois na divisão de elementos ele ficou com desfalque de um ponteiro, o filha[0]
                Quando inserimos o novo ponteiro e e nova chave ele continuou com desfalque em um ponteiro
                Ao removermos uma chave o nó passa a ter a quantidade mínima de ponteiros
            */
            valor_que_sobe = novo_no->chaves[0];

            for(i = 0; i <= j ; i++) { // Como retiramos o primeiro elemento, movemos as chaves uma posição para trás
                novo_no->chaves[i] = novo_no->chaves[i + 1];
            }

            /*
                Okay, mas por que não dá problema fazer isso? Os ponteiro podem apontar para o que não deveriam?
                Não dá problema pelo seguinte:
                Repare que caso a variavel no == 1 iriamos inserir o ponteiro a direita do valor que adicionado e passaríamos o ponteiro mais a direita para o filha[0] do novo_no
                Aqui, com a variavel no == 2, inserimos o ponteiro a esquerda do valor adicionado, isso por que os valores no nó para o qual esse ponteiro aponta são menores que o valor que estamos inserindo
                E, dessa forma, repare que tudo está sendo inserido ende deveria estar (eu acho kkkkk (rindo de desespero))
            */

            novo_no->total_chaves--;
        }

        int resp;
        resp = insereAcima_ArvB(raiz, &(atual), &(novo_no), valor_que_sobe); // Chamamos recursivamente a função para inserir o valor que tem que subir em seu nó pai, caso necessário
        return resp; // Se tudo foi inserido corretamente, retorna 1, senão 0
    }
    return 0;
}


int insere_ArvB(ArvB *raiz, int valor) {
    int i, j;

    if(raiz == NULL) {
        return 0;
    }

    if(*raiz == NULL) { // Verifica se a árvore não tem raiz, caso não tenha é necessário criá-la
        ArvB novo_no = (ArvB) malloc(sizeof(struct NO));
        if(novo_no == NULL) {
            return 0;
        }

        novo_no->chaves[0] = valor;
        novo_no->total_chaves = 1;
        novo_no->filha[0] = NULL;
        novo_no->filha[1] = NULL;

        *raiz = novo_no;
        return 1;
    } else { // Caso a raiz da árvore exista é preciso fazer algumas verificações
        ArvB atual = *raiz;
        ArvB ant = NULL;

        while(1) { // Esse é while é basicamente o mesmo usado na função de busca, porém com 2 diferenças
            for(i = 0; i < atual->total_chaves; i++) {
                if(valor == atual->chaves[i]) { // Caso o valor que queremos inserir já esteja na árvore ele não deixa inserir novamente e para a função
                    return 0;
                } else if(valor < atual->chaves[i]) {
                    break;
                }
            }

            if(atual->filha[0] == NULL) {
                /*
                    Obs.: O atual poderia estar apontando para qualquer uma de suas filhas (dentro da quantidade possível em relação ao número de chaves), é apenas para verificar se é um nó folha
                    Se entrar nesse if estamos em um nó/página folha e não há mais para onde descer
                    Então interrompemos o while antes que o ponteiro auxiliar se torne nulo
                */
                break;
            }

            ant = atual;

            atual = atual->filha[i];
        }

        /*
            O seguinte if verifica se o valor deve ser inserido no nó ou no que será criado
            Ou seja, como está tudo inserdo de forma ordenada basicamente se o valor que queremos inserir for menor que o valor do meio do nó ele deve ser inserido nele
            Caso contrário deve ser inserido no novo nó que será criado
        */

        int no;
        if(valor < atual->chaves[atual->total_chaves / 2]) {
            no = 1;
        } else {
            no = 2;
        }

        if(atual->total_chaves != Ordem - 1) { // Aqui é verificado se há espaço no nó para inserir o novo valor
            for(j = 0; j < atual->total_chaves; j++) { // Procura pela posição certa para a inserção do novo valor
                if(valor < atual->chaves[j]) {
                    break;
                }
            }

            // j agora vale o indice da posição correta para o novo valor

            for(i = atual->total_chaves; j <= i ; i--) { // Move-se os valores da posição j em diante para dar espaço ao novo valor
                atual->chaves[i] = atual->chaves[i - 1];
            }

            atual->chaves[j] = valor;
            atual->filha[atual->total_chaves] = NULL; // Adicionou um elemento, aumenta um ponteiro
            atual->total_chaves++;

            // Obs.: Como é um nó folha não há preocupação de mover ponteiros das filhas pois todas apontam para NULL

            return 1;
        } else { // Entramos aqui caso não tenha espaço para a inserção no nó folha... Temos que fazer mais algumas verificações
            ArvB novo_no = (ArvB) malloc(sizeof(struct NO)); // O nó atual está cheio, é necessário dividi-lo em 2 para inserir o novo elemento

            if(novo_no == NULL) {
                return 0;
            }

            novo_no->total_chaves = 0;
            j = 0;
            for(i = atual->total_chaves / 2; i < Ordem - 1; i++) { // O novo_no recebe a segunda metade das chaves (e ponteiros... mas todos nulos) do nó atual
                novo_no->chaves[j] = atual->chaves[i];
                novo_no->filha[j] = atual->filha[i];
                atual->total_chaves--;
                novo_no->total_chaves++;
                j++;
            }
            novo_no->filha[j] = atual->filha[i]; // Último ponteiro da direita

            int valor_que_sobe;

            if(no == 1) { // Insere o novo valor no nó atual
                for(j = 0; j < atual->total_chaves; j++) { // Procura pela posição certa para a inserção do novo valor
                    if(valor < atual->chaves[j]) {
                        break;
                    }
                }

                for(i = atual->total_chaves; j < i ; i--) { // Move-se os valores da posição j em diante para dar espaço ao novo valor
                    atual->chaves[i] = atual->chaves[i - 1];
                }

                atual->chaves[j] = valor;
                atual->filha[atual->total_chaves] = NULL; // Como disse antes, não há preocupação de movimentação de ponteiro pois não nulos
                valor_que_sobe = atual->chaves[atual->total_chaves];
                /*
                    Repare que quando inserimos o novo valor não incrementamos o valor de total de chaves
                    Isso significa que o maior valor, o último valor do nó, está ficando de fora
                    Isso se deve que temos inserir ele no nó acima para ter ponteiros o suficiente para apontar também para o novo nó que foi criado
                */
            } else { // Insere o novo valor no novo nó
                for(j = 0; j < novo_no->total_chaves; j++) { // Procura pela posição certa para a inserção do novo valor
                    if(valor < novo_no->chaves[j]) {
                        break;
                    }
                }

                for(i = novo_no->total_chaves; j < i ; i--) { // Move-se os valores da posição j em diante para dar espaço ao novo valor
                    novo_no->chaves[i] = novo_no->chaves[i - 1];
                }

                novo_no->total_chaves++;
                novo_no->chaves[j] = valor;
                novo_no->filha[novo_no->total_chaves] = NULL;

                valor_que_sobe = novo_no->chaves[0];
                /*
                    A inserção no novo_no é um pouco diferente, não é o maior valor que sobe, mas sim o menor, ou seja, o valor que está na primeira posição do array de chaves
                    Porém o motivo é o mesmo: temos inserir ele no nó acima para ter ponteiros o suficiente para apontar também para o novo nó que foi criado (esse nó)
                */

                for(i = 0; i <= j ; i++) {
                    novo_no->chaves[i] = novo_no->chaves[i + 1]; // Voltamos uma casa pra cada chave para sobrescrever o elemento que foi tirado
                }

                novo_no->total_chaves--;
            }

            /*
                Não podemos chamar essa mesma função para inserir o valor no nó acima por que essa função sempre vai chegar em um nó folha pra inserir
                Então foi preciso criar uma função auxiliar para fazer isso e há alguns detalhes para se esclarescer aí:
                    1 -
                    Se reparar, o ponteiro auxiliar ant está apontando para o nó em que temos que inserir o valor_que_sobe
                    Não podemos simplesmente mandar inserir nele pois se ele estiver cheio, deverá ocorrer uma divisão de nós também e não teríamos quem está apontando para ant para mandar inserir lá
                    2 -
                    Por isso a insereAcima recebe a raiz e o nó atual: ela vai procurar por ele e parar no seu nó pai e fazer o que tiver que faazer com o novo_no e o valor_que_sobe
            */

            int resp;
            resp = insereAcima_ArvB(raiz, &(atual), &(novo_no), valor_que_sobe);
            return resp; // Se tudo foi inserido corretamente, retorna 1, senão 0
        }
    }

    return 0;
}


int juntaIrmaEsq(ArvB *raiz, ArvB *no_atual) {
    ArvB atual = *raiz;
    ArvB ant = NULL;
    int i = 0, j = 0, pointer_position;

    while(1) { // Como não é a raiz, temos que procurar pelo pai do nó que dividimos
        for(i = 0; i < atual->total_chaves; i++) {
            if((*no_atual)->chaves[0] <= atual->chaves[i]) { // Se achar um elemento, achou o nó pois não há elementos repetidos
                break;
            }
        }

        if((*no_atual)->chaves[0] == atual->chaves[i]) {
            break;
        }

        ant = atual;
        pointer_position = i;
        atual = atual->filha[i];
    }

    int resp = 0, ehRaiz = 0;

    if(atual->total_chaves < (Ordem - 1) / 2) {
        if(pointer_position - 1 >= 0 && ant->filha[pointer_position - 1]->total_chaves - 1 >= (Ordem - 1) / 2){
            ArvB irmaEsq = ant->filha[pointer_position - 1];

            for(i = atual->total_chaves; 0 <= i ; i--) { // Sobrescreve o valor
                atual->chaves[i] = atual->chaves[i - 1];
            }

            atual->chaves[0] = ant->chaves[pointer_position]; // Recebe o valor do nó pai
            atual->total_chaves++;
            ant->chaves[pointer_position] = irmaEsq->chaves[irmaEsq->total_chaves - 1]; // Nó pai recebe o maior valor da irmã da esquerda
            irmaEsq->total_chaves--;
            return 1;
        } else if(pointer_position - 1 >= 0) {
            if(ant == *raiz && ant->total_chaves == 1) ehRaiz = 1;
            ArvB irmaEsq = ant->filha[pointer_position - 1];

            irmaEsq->chaves[irmaEsq->total_chaves] = ant->chaves[pointer_position - 1]; // Desce o valor do nó pai

            irmaEsq->total_chaves++;

            for(i = 0; i < atual->total_chaves ; i++) { // Move todos os valores do nó atual pra irmã esquerda, exeto o que se quer remover
                irmaEsq->chaves[irmaEsq->total_chaves] = atual->chaves[i];
                irmaEsq->filha[irmaEsq->total_chaves] = atual->filha[i];
                irmaEsq->total_chaves++;
            }
            irmaEsq->filha[irmaEsq->total_chaves] = atual->filha[i];

            for(i = pointer_position - 1; i < ant->total_chaves; i++) { // Move-se tudo no nó pai por causa da exclusão de um valor e um ponteiro seu
                ant->chaves[i] = ant->chaves[i + 1];
                ant->filha[i + 1] = ant->filha[i + 2];
            }
            ant->filha[ant->total_chaves + 1] = NULL; // É interessante apontar os ponteiros que não vamos mais usar por enquanto pra NULL
            ant->total_chaves--;
            free(atual);

            if(ehRaiz){
                atual = *raiz;
                *raiz = irmaEsq;
                free(atual);
            } else {
                juntaIrmaEsq(raiz, &(ant));
            }

            return 1;
        } else {
            resp = juntaIrmaDir(raiz, &(atual));
        }
    }

    return 0;
}


int juntaIrmaDir(ArvB *raiz, ArvB *no_atual) {
    ArvB atual = *raiz;
    ArvB ant = NULL;
    int i = 0, j = 0, pointer_position;

    while(1) { // Como não é a raiz, temos que procurar pelo pai do nó que dividimos
        for(i = 0; i < atual->total_chaves; i++) {
            if((*no_atual)->chaves[0] <= atual->chaves[i]) { // Se achar um elemento, achou o nó pois não há elementos repetidos
                break;
            }
        }

        if((*no_atual)->chaves[0] == atual->chaves[i]) {
            break;
        }

        ant = atual;
        pointer_position = i;
        atual = atual->filha[i];
    }

    int resp, ehRaiz = 0;

    if(atual->total_chaves < (Ordem - 1) / 2) {
        if(pointer_position + 1 < ant->total_chaves + 1 && ant->filha[pointer_position + 1]->total_chaves - 1 >= (Ordem - 1) / 2) { // Verifica se o nó atual tem irmã a direita e se ela tem uma chave para ceder
            ArvB irmaDir = ant->filha[pointer_position + 1];

            atual->chaves[atual->total_chaves] = ant->chaves[pointer_position]; // Recebe o valor do nó pai
            ant->chaves[pointer_position] = irmaDir->chaves[0]; // Nó pai recebe o menor valor da irmã da direita

            for(i = 0; i < irmaDir->total_chaves ; i++) { // Sobrecrevemos o valor que subiu da irmão da direita
                irmaDir->chaves[i] = irmaDir->chaves[i + 1];
            }

            irmaDir->total_chaves--;
            return 1;
        } else if(pointer_position + 1 <= atual->total_chaves + 1) {
            if(ant == *raiz && ant->total_chaves == 1) ehRaiz = 1;
            ArvB irmaDir = ant->filha[pointer_position + 1];

            int c = irmaDir->total_chaves;
            for(i = atual->total_chaves + irmaDir->total_chaves; atual->total_chaves <= i ; i--) {
                irmaDir->chaves[i] = irmaDir->chaves[c - 1];
                irmaDir->filha[i + 1] = irmaDir->filha[c];
                c--;
            }
            irmaDir->filha[i + 1] = irmaDir->filha[c];

            irmaDir->chaves[atual->total_chaves] = ant->chaves[pointer_position]; // Desce o valor do nó pai
            irmaDir->total_chaves++;
            for(i = 0; i < atual->total_chaves ; i++) { // Move todos os valores do nó atual pra irmã esquerda, exeto o que se quer remover
                irmaDir->chaves[i] = atual->chaves[i];
                irmaDir->filha[i] = atual->filha[i];
                irmaDir->total_chaves++;
            }
            irmaDir->filha[i] = atual->filha[i];

            for(i = pointer_position; i < ant->total_chaves; i++) { // Move-se tudo no nó pai por causa da exclusão de um valor e um ponteiro seu
                ant->chaves[i] = ant->chaves[i + 1];
                ant->filha[i] = ant->filha[i + 1];
            }
            ant->filha[i] = ant->filha[i + 1];
            ant->filha[ant->total_chaves + 1] = NULL; // É interessante apontar os ponteiros que não vamos mais usar por enquanto pra NULL
            ant->total_chaves--;
            free(atual);

            if(ehRaiz){
                atual = *raiz;
                *raiz = irmaDir;
                free(atual);
            } else {
                juntaIrmaDir(raiz, &(ant));
            }

            return 1;
        } else {
            resp = juntaIrmaEsq(raiz, &(atual));

            return resp;
        }
    }
}


int remove_ArvB(ArvB *raiz, int valor) {
    if(ehVazia_ArvB(raiz)) {
        return 0;
    }

    if((*raiz)->total_chaves == 1 && (*raiz)->filha[0] == NULL) { //Caso em que a árvore só possui um elemento
        if((*raiz)->chaves[0] == valor) {
            ArvB atual = *raiz;
            *raiz = NULL;
            free(atual);
            return 1;
        } else {
            return 0;
        }
    }

    ArvB atual = *raiz;
    ArvB ant = NULL;
    int i, j, pointer_position = 0;

    while(1) { // Procura pelo valor a ser removido
        for(i = 0; i < atual->total_chaves; i++) {
            if(valor == atual->chaves[i]) { // Quebra o loop caso ache o valor
                break;
            } else if(valor < atual->chaves[i]) { // Quebra loop porque achou a posição onde o valor deveria estar
                break;
            }
        }

        if(valor < atual->chaves[i] && atual->filha[0] == NULL) { // Se achar a posição onde o valor deveria estar mas nã tiver mais filhas pra procurar, o valor não existe na árvore
            return 0;
        } else if(valor == atual->chaves[i]) {
            break;
        }

        ant = atual; // Pai do próximo nó
        pointer_position = i; // Posição da filha pela qual vai descer
        atual = atual->filha[i]; // Muda o atual para a proxima filha para procurar nela
    }

    if(atual->filha[0] == NULL) { // O valor a ser removido está em um nó folha
        if(atual->total_chaves - 1 >= (Ordem - 1) / 2) { // Executa se ao remover o elemento a quantidade de chaves não ficar abaixo da metade da capacidade de chaves

            for(j = 0; j < atual->total_chaves; j++) { // Procura a posição do valor para remover
                if(valor == atual->chaves[j]) {
                    break;
                }
            }

            for(i = j; i < atual->total_chaves ; i++) { // Sobrescreve o valor
                atual->chaves[i] = atual->chaves[i + 1];
            }
            atual->total_chaves--; // Valor removido
        } else { // Ao remover uma chave o nó fica abaixo da metade da capacidade de chaves
            for(j = 0; j < atual->total_chaves; j++) { // Procura a posição do valor para remover
                if(valor == atual->chaves[j]) {
                    break;
                }
            }

            for(i = j; i < atual->total_chaves ; i++) { // Sobrescreve o valor
                atual->chaves[i] = atual->chaves[i + 1];
            }
            atual->total_chaves--;

            juntaIrmaEsq(raiz, &(atual));
        }
        return 1;

    } else { // O valor a ser removido está em um nó interno ou na raiz

        for(j = 0; j < atual->total_chaves; j++) { // Procura a posição do valor para remover
            if(valor == atual->chaves[j]) {
                break;
            }
        }

        ArvB aux = atual;
        int substituto, resp;

        while(aux->filha[0] != NULL) { // Procura pelo valor a ser removido
            aux = aux->filha[aux->total_chaves]; // Muda o atual para a proxima filha
        }

        substituto = aux->chaves[aux->total_chaves - 1];

        resp = remove_ArvB(raiz, substituto);

        if(resp == 1) {
            while(1) { // Procura pelo valor a ser removido
                for(i = 0; i < atual->total_chaves; i++) {
                    if(valor == atual->chaves[i]) { // Quebra o loop caso ache o valor
                        break;
                    } else if(valor < atual->chaves[i]) { // Quebra loop porque achou a posição onde o valor deveria estar
                        break;
                    }
                }

                if(valor < atual->chaves[i] && atual->filha[0] == NULL) { // Se achar a posição onde o valor deveria estar mas nã tiver mais filhas pra procurar, o valor não existe na árvore
                    return 0;
                } else if(valor == atual->chaves[i]) {
                    break;
                }

                ant = atual; // Pai do próximo nó
                pointer_position = i; // Posição da filha pela qual vai descer
                atual = atual->filha[i]; // Muda o atual para a proxima filha para procurar nela
            }

            for(j = 0; j < atual->total_chaves; j++) { // Procura a posição do valor para remover
                if(valor == atual->chaves[j]) {
                    break;
                }
            }

            atual->chaves[j] = substituto;
            return 1;
        } else {
            return 0;
        }
    }
    return 0;
}


int busca_ArvB(ArvB *raiz, int valor) {
    if(raiz == NULL) {
        return 0;
    }

    ArvB atual = *raiz;

    while(atual != NULL) { // Se o ponteiro auxiliar apontar para NULL (chegou ao "fim" da árvore), para
        int i;
        for(i = 0; i < atual->total_chaves; i++) { // Percorre todas as chaves da página atual
            if(valor == atual->chaves[i]) { // Se achar o elemento, para e retorna que achou
                return 1;
            } else if(valor < atual->chaves[i]) { // Verifica se essa é a posição que o valor deveria estar inserido
                break;
            }
        }

        /*
            Caso o valor pelo qual procuramos seja menor que uma das chaves ele para com o i valendo o indice exato da filha em que ele tem que procurar agora
            Caso ele percorra todos os elementos e não a posição que o valor deveria estar inserido, o i é incrementado parando o loop e valendo o index da filha mais a direita da página na qual ele tem que procurar agora
        */

        atual = atual->filha[i];
    }

    return 0;
}


int totalNO_ArvB(ArvB *raiz) {
    if(ehVazia_ArvB(raiz)){
        return 0;
    }

    int i;
    int total = 1;
    for(i = 0; i < (*raiz)->total_chaves + 1; i++){
        total = total + totalNO_ArvB(&((*raiz)->filha[i])); // A cada nó que a função encontra ecursivamente ela soma 1 no contador
    }

    return total;
}


void emOrdem_ArvB(ArvB *raiz) {
    if(raiz == NULL) {
        return;
    }

    int i;

    if(*raiz != NULL) {
        for(i = 0; i < (*raiz)->total_chaves + 1; i++) { // Executa o mesmo número de vezes para abranger todos as filhas
            emOrdem_ArvB(&((*raiz)->filha[i]));
            if(i < (*raiz)->total_chaves) printf("%d\n", (*raiz)->chaves[i]); // Como o número de filhas é uma a mais que a quantidade de elementos da raiz esse if limita a impressão a quantidade de elementos que a página tem
        }
    }
}


