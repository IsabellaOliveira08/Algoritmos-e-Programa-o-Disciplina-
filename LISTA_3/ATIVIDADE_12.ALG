Algoritmo "Atividade_12  "
// Disciplina  : Algoritmo e Lógica de Programação
// Professor   : André Olímpio
// Autor(a)    : Isabella Oliveira Assis
// Data atual  : 27/09/2026

Tipo
   funcionario = registro
      nome: caractere
      cargo: caractere
      salario: real
   fimregistro

Var
   funcionarios: vetor [1..3] de funcionario
   i: inteiro
   maior: real
   nomeMaior: caractere

Inicio

   para i de 1 ate 3 faca
      escreval()
      escreval("===== FUNCIONÁRIO ", i, " =====")
      escreva("Digite o nome: ")
      leia(funcionarios[i].nome)
      escreva("Digite o cargo: ")
      leia(funcionarios[i].cargo)
      escreva("Digite o salário: ")
      leia(funcionarios[i].salario)
   fimpara

   maior <- 0

   para i de 1 ate 3 faca
      se funcionarios[i].salario > maior entao
         maior <- funcionarios[i].salario
         nomeMaior <- funcionarios[i].nome
      fimse
   fimpara

   escreval()
   escreval("===== MAIOR SALÁRIO =====")
   escreval("Funcionário: ", nomeMaior)
   escreval("Salário: R$ ", maior:2:2)

Fimalgoritmo