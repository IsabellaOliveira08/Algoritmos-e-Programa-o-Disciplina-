Algoritmo "atividade_5"
// Disciplina  : Algoritmo e Lógica de Programação
// Professor   : André Olímpio 
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Isabella Oliveira Assis
// Data atual  : 11/08/2026
Var
num: inteiro
rest: real
Inicio

escreva("|Digite um número:")
leia(num)
rest <-num % 2
SE (rest = 0) então
   escreval("Número par")
senao
     escreval("Número Impar")
fimse

Fimalgoritmo