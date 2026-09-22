Algoritmo "atividade_11"
// Disciplina  : Algoritmo e Lógica de Programação
// Professor   : André Olímpio 
// Autor(a)    : Isabella Oliveira Assis
// Data atual  : 18/08/2026
Var
num: inteiro

Inicio
escreva("Digite um número inteiro de 1 a 12: ")
   leia(num)
   se (num = 1) entao
      escreva("Janeiro")
   senao
      se (num = 2) entao
         escreva("Fevereiro")
      senao
         se (num = 3) entao
            escreva("Março")
         senao
            se (num = 4) entao
               escreva("Abril")
            senao
               se (num = 5) entao
                  escreva("Maio")
               senao
                  se (num = 6) entao
                     escreva("Junho")
                  senao
                     se (num = 7) entao
                        escreva("Julho")
                     senao
                          se (num = 8) entao
                             escreva("Agosto")
                          senao
                               se (num = 9) entao
                                  escreva("Setembro")
                               senao
                                    se (num = 10) entao
                                       escreva("Outubro")
                                    senao
                                         se(num = 11) entao
                                            escreva("Novembro")
                                         senao
                                              se (num = 12) entao
                                               escreva("Dezembro")
                                              senao
                                                   escreva("Número inválido!")
                                              fimse
                                         fimse
                                    fimse
                               fimse
                          fimse
                     fimse
                  fimse
               fimse
            fimse
         fimse
      fimse
   fimse
Fimalgoritmo