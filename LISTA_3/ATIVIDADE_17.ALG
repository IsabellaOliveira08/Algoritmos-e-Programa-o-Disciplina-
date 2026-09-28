Algoritmo "Atividade_17  "
// Disciplina  : Algoritmo e Lógica de Programação
// Professor   : André Olímpio
// Autor(a)    : Isabella Oliveira Assis
// Data atual  : 27/09/2026

Var
   vetor: vetor [1..8] de inteiro
   i, j, aux: inteiro

Inicio

   para i de 1 ate 8 faca
      escreva("Digite o ", i, "º número: ")
      leia(vetor[i])
   fimpara

   para i de 1 ate 7 faca
      para j de 1 ate 7 faca
         se vetor[j] < vetor[j+1] entao
            aux <- vetor[j]
            vetor[j] <- vetor[j+1]
            vetor[j+1] <- aux
         fimse
      fimpara
   fimpara

   escreval()
   escreval("===== VETOR ORDENADO =====")

   para i de 1 ate 8 faca
      escreva(vetor[i]:4)
   fimpara

Fimalgoritmo