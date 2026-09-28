Algoritmo "Atividade_15  "
// Disciplina  : Algoritmo e Lógica de Programação
// Professor   : André Olímpio
// Autor(a)    : Isabella Oliveira Assis
// Data atual  : 27/09/2026

Tipo
   livro = registro
      titulo: caractere
      autor: caractere
      ano: inteiro
   fimregistro

Var
   livros: vetor [1..5] de livro
   i: inteiro

Inicio

   para i de 1 ate 5 faca
      escreval()
      escreval("===== LIVRO ", i, " =====")
      escreva("Digite o título: ")
      leia(livros[i].titulo)
      escreva("Digite o autor: ")
      leia(livros[i].autor)
      escreva("Digite o ano de publicação: ")
      leia(livros[i].ano)
   fimpara

   escreval()
   escreval("===== LIVROS PUBLICADOS APÓS 2000 =====")

   para i de 1 ate 5 faca
      se livros[i].ano > 2000 entao
         escreval("Título: ", livros[i].titulo)
         escreval("Autor: ", livros[i].autor)
         escreval("Ano de publicação: ", livros[i].ano)
         escreval()
      fimse
   fimpara

Fimalgoritmo