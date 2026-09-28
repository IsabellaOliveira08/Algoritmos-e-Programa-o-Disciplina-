Algoritmo "Atividade_13  "
// Disciplina  : Algoritmo e Lógica de Programação
// Professor   : André Olímpio
// Autor(a)    : Isabella Oliveira Assis
// Data atual  : 27/09/2026

Tipo
   produto = registro
      nome: caractere
      preco: real
      quantidade: inteiro
   fimregistro

Var
   produtos: vetor [1..4] de produto
   i: inteiro
   total: real

Inicio

   total <- 0

   para i de 1 ate 4 faca
      escreval()
      escreval("===== PRODUTO ", i, " =====")
      escreva("Digite o nome: ")
      leia(produtos[i].nome)
      escreva("Digite o preço: ")
      leia(produtos[i].preco)
      escreva("Digite a quantidade: ")
      leia(produtos[i].quantidade)
      
      total <- total + (produtos[i].preco * produtos[i].quantidade)
   fimpara

   escreval()
   escreval("===== VALOR TOTAL EM ESTOQUE =====")
   escreval("Valor total: R$ ", total:2:2)

Fimalgoritmo