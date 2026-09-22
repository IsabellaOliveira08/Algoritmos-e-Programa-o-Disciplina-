Algoritmo "atividade_17"
// Disciplina  : Algoritmo e Lógica de Programação
// Professor   : André Olímpio 
// Autor(a)    : Isabella
// Data atual  : 18/08/2026
Var
numero,x,resp,par,impar: inteiro

Inicio

para x de 1 ate 10 faca
     escreva("Digite o",x," inteiro:")
     leia(numero)
     resp <- numero % 2
     se (resp = 0) entao
         par <- par + 1
     senao
          impar <- impar + 1
     fimse
fimpara
escreval("Quantidade de números pares:",par)
escreval("Quantidade de números impares:",impar)

Fimalgoritmo