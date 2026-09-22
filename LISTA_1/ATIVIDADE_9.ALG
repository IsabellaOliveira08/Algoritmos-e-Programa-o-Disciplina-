Algoritmo "atividade_9"
// Disciplina  : Algoritmo e Lógica de Programação
// Professor   : André Olímpio 
// Autor(a)    : Isabella Oliveira Assis
// Data atual  : 18/08/2026
Var
produto,desconto: real

Inicio
escreval("Digite o valor do produto:")
leia(produto)
desconto <- produto * 0.10
produto <- produto - desconto
escreva("Novo preço com desconto: R$ ", produto)

Fimalgoritmo