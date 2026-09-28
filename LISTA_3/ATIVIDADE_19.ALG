Algoritmo "Atividade_19  "
// Disciplina  : Algoritmo e Lógica de Programação
// Professor   : André Olímpio
// Autor(a)    : Isabella Oliveira Assis
// Data atual  : 27/09/2026

Funcao fatorial(n: inteiro): inteiro
Inicio

   se n = 0 entao
      retorne 1
   senao
      retorne n * fatorial(n - 1)
   fimse

FimFuncao

Var
   numero, resultado: inteiro

Inicio

   escreva("Digite um número: ")
   leia(numero)

   resultado <- fatorial(numero)

   escreval()
   escreval("===== FATORIAL =====")
   escreval(numero, "! = ", resultado)

Fimalgoritmo