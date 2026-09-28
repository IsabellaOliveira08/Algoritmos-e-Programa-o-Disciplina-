Algoritmo "Atividade_20  "
// Disciplina  : Algoritmo e Lógica de Programação
// Professor   : André Olímpio
// Autor(a)    : Isabella Oliveira Assis
// Data atual  : 27/09/2026

Funcao fibonacci(n: inteiro): inteiro
Inicio

   se n = 0 entao
      retorne 0
   senao
      se n = 1 entao
         retorne 1
      senao
         retorne fibonacci(n - 1) + fibonacci(n - 2)
      fimse
   fimse

FimFuncao

Var
   numero, resultado: inteiro

Inicio

   escreva("Digite a posição do termo de Fibonacci: ")
   leia(numero)

   resultado <- fibonacci(numero)

   escreval()
   escreval("===== FIBONACCI =====")
   escreval("O ", numero, "º termo da sequência é: ", resultado)

Fimalgoritmo