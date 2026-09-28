Algoritmo "Atividade_7  "
// Disciplina  : Algoritmo e Lógica de Programação
// Professor   : André Olímpio 
// Autor(a)    : Isabella Oliveira Assis
// Data atual  : 15/09/2026
Var
   matriz: vetor [1..3, 1..3] de inteiro
   i, j: inteiro

Inicio

   para i de 1 ate 3 faca
      para j de 1 ate 3 faca
         escreva("Digite o valor [", i, ",", j, "]: ")
         leia(matriz[i,j])
      fimpara
   fimpara
   escreval()
   escreval("===== MATRIZ =====")

   para i de 1 ate 3 faca
      para j de 1 ate 3 faca
         escreva(matriz[i,j])
      fimpara
      escreval()
   fimpara
   escreval()
   escreval("=== DIAGONAL PRINCIPAL ===")

   para i de 1 ate 3 faca
      escreva(matriz[i,i])
   fimpara

Fimalgoritmo