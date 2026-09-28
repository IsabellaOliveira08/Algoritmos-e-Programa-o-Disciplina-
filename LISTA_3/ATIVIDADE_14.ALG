Algoritmo "Atividade_14  "
// Disciplina  : Algoritmo e Lógica de Programação
// Professor   : André Olímpio
// Autor(a)    : Isabella Oliveira Assis
// Data atual  : 27/09/2026

Tipo
   cliente = registro
      nome: caractere
      idade: inteiro
      cidade: caractere
   fimregistro

Var
   clientes: vetor [1..3] de cliente
   i: inteiro
   cidadeEscolhida: caractere

Inicio

   para i de 1 ate 3 faca
      escreval()
      escreval("===== CLIENTE ", i, " =====")
      escreva("Digite o nome: ")
      leia(clientes[i].nome)
      escreva("Digite a idade: ")
      leia(clientes[i].idade)
      escreva("Digite a cidade: ")
      leia(clientes[i].cidade)
   fimpara

   escreval()
   escreva("Digite a cidade que deseja pesquisar: ")
   leia(cidadeEscolhida)

   escreval()
   escreval("===== CLIENTES DA CIDADE =====")

   para i de 1 ate 3 faca
      se clientes[i].cidade = cidadeEscolhida entao
         escreval("Nome: ", clientes[i].nome)
         escreval("Idade: ", clientes[i].idade)
         escreval("Cidade: ", clientes[i].cidade)
         escreval()
      fimse
   fimpara

Fimalgoritmo