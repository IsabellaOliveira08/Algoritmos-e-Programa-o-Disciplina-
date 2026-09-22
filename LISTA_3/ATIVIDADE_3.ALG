Algoritmo "Atividade_3"
// Disciplina  : Algoritmo e Lógica de Programação
// Professor   : André Olímpio 
// Autor(a)    : Isabella Oliveira Assis
// Data atual  : 08/09/2026
Var
vetorA: vetor [1..8] de inteiro
x,maior,menor: inteiro

Inicio

para x de 1 ate 8 faca
     escreva("Digite o ", x, "º numero:")
     leia(vetorA[x])
fimpara

maior <- vetorA[1]
menor <- vetorA[1]

para x de 2 ate 8 faca
     se maior >= vetorA[x] entao
        maior <- vetorA[x]
     fimse
     se menor <= vetorA[x] entao
        menor <- vetorA[x]
     fimse
fimpara
        
escreval("O maior número é:", maior)
escreval("O menor número é:", menor)


Fimalgoritmo