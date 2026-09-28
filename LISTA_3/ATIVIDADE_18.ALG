Algoritmo "Atividade_18  "
// Disciplina  : Algoritmo e Lógica de Programação
// Professor   : André Olímpio
// Autor(a)    : Isabella Oliveira Assis
// Data atual  : 27/09/2026

Var
   notas: vetor [1..5] de real
   i, j: inteiro
   aux: real

Inicio

   para i de 1 ate 5 faca
      escreva("Digite a nota do ", i, "º aluno: ")
      leia(notas[i])
   fimpara

   para i de 1 ate 4 faca
      para j de 1 ate 4 faca
         se notas[j] > notas[j+1] entao
            aux <- notas[j]
            notas[j] <- notas[j+1]
            notas[j+1] <- aux
         fimse
      fimpara
   fimpara

   escreval()
   escreval("===== NOTAS EM ORDEM CRESCENTE =====")

   para i de 1 ate 5 faca
      escreva(notas[i]:4:2)
   fimpara

Fimalgoritmo