Algoritmo "atividade_16"
// Disciplina  : Algoritmo e Lógica de Programação
// Professor   : André Olímpio 
// Autor(a)    : Isabella
// Data atual  : 18/08/2026
Var
numero,x,resp: inteiro

Inicio
resp <- 1
escreva("Digite um número inteiro:")
leia(numero)

escreva(numero,"!=")

para x de 1 ate numero faca
     resp <- resp * x
fimpara

escreva(resp)
Fimalgoritmo