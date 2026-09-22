Algoritmo "atividade_6"
// Disciplina  : Algoritmo e Lógica de Programação
// Professor   : André Olímpio 
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Isabella Oliveira Assis
// Data atual  : 11/08/2026
Var
   n1, n2, n3, n4, n5: real
   maior: real

Inicio

   escreva("Digite o 1º número: ")
   leia(n1)
   escreva("Digite o 2º número: ")
   leia(n2)
   escreva("Digite o 3º número: ")
   leia(n3)
   escreva("Digite o 4º número: ")
   leia(n4)
   escreva("Digite o 5º número: ")
   leia(n5)


   se (n1 >= n2) e (n1 >= n3) e (n1 >= n4) e (n1 >= n5) entao
      maior <- n1
   fimse

   se (n2 >= n1) e (n2 >= n3) e (n2 >= n4) e (n2 >= n5) entao
      maior <- n2
   fimse

   se (n3 >= n1) e (n3 >= n2) e (n3 >= n4) e (n3 >= n5) entao
      maior <- n3
   fimse

   se (n4 >= n1) e (n4 >= n2) e (n4 >= n3) e (n4 >= n5) entao
      maior <- n4
   fimse

   se (n5 >= n1) e (n5 >= n2) e (n5 >= n3) e (n5 >= n4) entao
      maior <- n5
   fimse

   escreval("O maior número digitado foi: ", maior)

Fimalgoritmo