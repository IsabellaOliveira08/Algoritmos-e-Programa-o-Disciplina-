Algoritmo "Atividade_9  "
// Disciplina  : Algoritmo e Lógica de Programação
// Professor   : André Olímpio
// Autor(a)    : Isabella Oliveira Assis
// Data atual  : 27/09/2026
Var
   matriz: vetor [1..2, 1..3] de inteiro
   i, j, maior: inteiro

Inicio

   para i de 1 ate 2 faca
      para j de 1 ate 3 faca
         escreva("Digite o valor [", i, ",", j, "]: ")
         leia(matriz[i,j])
      fimpara
   fimpara

   maior <- 0

   para i de 1 ate 2 faca
      para j de 1 ate 3 faca
         se matriz[i,j] > maior entao
            maior <- matriz[i,j]
         fimse
      fimpara
   fimpara

   escreval()
   escreval("===== MATRIZ =====")

   para i de 1 ate 2 faca
      para j de 1 ate 3 faca
         escreva(matriz[i,j]:4)
      fimpara
      escreval()
   fimpara

   escreval()
   escreval("Maior elemento da matriz: ", maior)

Fimalgoritmo