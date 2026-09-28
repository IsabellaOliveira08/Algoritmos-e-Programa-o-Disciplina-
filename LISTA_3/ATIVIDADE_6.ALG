Algoritmo "Atividade_6  "
// Disciplina  : Algoritmo e Lógica de Programação
// Professor   : André Olímpio 
// Autor(a)    : Isabella Oliveira Assis
// Data atual  : 15/09/2026
Var
matriz: vetor [1..2,1..2] de inteiro
x,y,z,soma : inteiro
Inicio
z <- 1
para x de 1 ate 2 faca
     para y de 1 ate 2 faca
          escreva("Digite o ", z, "º numero:")
           leia(matriz[x,y])
           z <- z + 1
           soma <- soma + matriz[x,y]
fimpara
       fimpara
escreva("A soma de todos os elementos é:",soma)


Fimalgoritmo