Algoritmo "Atividade_4"
// Disciplina  : Algoritmo e Lógica de Programação
// Professor   : André Olímpio 
// Autor(a)    : Isabella Oliveira Assis
// Data atual  : 08/09/2026
Var
vetorA,pares: vetor [1..10] de inteiro
y,x,rest : inteiro
Inicio

y <- 1

para x de 1 ate 10 faca
     escreva("Digite o ", x, "º numero:")
     leia(vetorA[x])
     
     rest <- vetorA[x] % 2
     
     se rest = 0 entao
        pares[y] <- vetorA[x]
        y <- y + 1
     fimse
fimpara

para x de 1 ate y - 1 faca
     escreva(pares[x], " ")
fimpara

Fimalgoritmo