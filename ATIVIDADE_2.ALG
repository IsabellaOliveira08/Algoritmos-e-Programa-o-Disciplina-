Algoritmo "Atividade_2"
// Disciplina  : Algoritmo e Lógica de Programação
// Professor   : André Olímpio 
// Autor(a)    : Isabella Oliveira Assis
// Data atual  : 08/09/2026
Var
vetorA: vetor [1..5] de real
x: inteiro
soma: real
media: real

Inicio

para x de 1 ate 5 faca
     escreva("Digite o ", x, "º nota:")
     leia(vetorA[x])
     soma <- soma + vetorA[x]
fimpara

media <- soma / 5

escreval("A média dos alunos é:", media)


Fimalgoritmo