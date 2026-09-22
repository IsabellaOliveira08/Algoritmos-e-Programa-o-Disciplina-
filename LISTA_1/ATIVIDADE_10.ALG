Algoritmo "atividade_10"
// Disciplina  : Algoritmo e Lógica de Programação
// Professor   : André Olímpio 
// Autor(a)    : Isabella Oliveira Assis
// Data atual  : 18/08/2026
Var
num: inteiro

Inicio
escreva("Digite um número inteiro de 1 a 7: ")
   leia(num)
   se (num = 1) entao
      escreva("Domingo")
   senao
      se (num = 2) entao
         escreva("Segunda-feira")
      senao
         se (num = 3) entao
            escreva("Terça-feira")
         senao
            se (num = 4) entao
               escreva("Quarta-feira")
            senao
               se (num = 5) entao
                  escreva("Quinta-feira")
               senao
                  se (num = 6) entao
                     escreva("Sexta-feira")
                  senao
                     se (num = 7) entao
                        escreva("Sábado")
                     senao
                        escreva("Número inválido!")
                     fimse
                  fimse
               fimse
            fimse
         fimse
      fimse
   fimse

Fimalgoritmo