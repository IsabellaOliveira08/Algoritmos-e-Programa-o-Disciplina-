Algoritmo "Atividade_10  "
// Disciplina  : Algoritmo e Lógica de Programação
// Professor   : André Olímpio
// Autor(a)    : Isabella Oliveira Assis
// Data atual  : 27/09/2026
Var
   matriz: vetor [1..4, 1..4] de inteiro
   i, j, pares: inteiro

Inicio

   pares <- 0

   para i de 1 ate 4 faca
      para j de 1 ate 4 faca
         escreva("Digite o valor [", i, ",", j, "]: ")
         leia(matriz[i,j])
         
         se matriz[i,j] mod 2 = 0 entao
            pares <- pares + 1
         fimse
      fimpara
   fimpara

   escreval()
   escreval("===== MATRIZ =====")

   para i de 1 ate 4 faca
      para j de 1 ate 4 faca
         escreva(matriz[i,j]:4)
      fimpara
      escreval()
   fimpara

   escreval()
   escreval("Quantidade de números pares: ", pares)

Fimalgoritmo