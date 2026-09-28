Algoritmo "Atividade_11  "
// Disciplina  : Algoritmo e Lógica de Programação
// Professor   : André Olímpio
// Autor(a)    : Isabella Oliveira Assis
// Data atual  : 27/09/2026

Tipo
   aluno = registro
      nome: caractere
      idade: inteiro
      nota: real
   fimregistro

Var
   alunos: vetor [1..5] de aluno
   i: inteiro

Inicio

   para i de 1 ate 5 faca
      escreval()
      escreval("===== ALUNO ", i, " =====")
      escreva("Digite o nome: ")
      leia(alunos[i].nome)
      escreva("Digite a idade: ")
      leia(alunos[i].idade)
      escreva("Digite a nota final: ")
      leia(alunos[i].nota)
   fimpara

   escreval()
   escreval("===== ALUNOS APROVADOS =====")

   para i de 1 ate 5 faca
      se alunos[i].nota >= 6 entao
         escreval(alunos[i].nome)
      fimse
   fimpara

Fimalgoritmo