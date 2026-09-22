Algoritmo "Atividade_1"
// Disciplina  : Algoritmo e Lógica de Programação
// Professor   : André Olímpio 
// Autor(a)    : Isabella Oliveira Assis
// Data atual  : 08/09/2026
Var
vetorA: vetor [1..10] de inteiro
x: inteiro

Inicio

para x de 1 ate 10 faca
     escreva("Digite o ", x, "º número:")
     leia(vetorA[x])
fimpara

escreval("Números na ordem inversa:")

para x de 10 ate 1 passo -1 faca
     escreva(vetorA[x]," ")
fimpara

Fimalgoritmo