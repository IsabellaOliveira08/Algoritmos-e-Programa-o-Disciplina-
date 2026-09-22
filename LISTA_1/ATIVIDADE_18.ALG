Algoritmo "atividade_18"
// Disciplina  : Algoritmo e Lógica de Programação
// Professor   : André Olímpio 
// Autor(a)    : Isabella
// Data atual  : 18/08/2026
Var
idade,soma,media,maior: real
nome_maior, nome : caractere
x: inteiro

Inicio

para x de 1 ate 5 faca
     escreva("Digite o",x," nome da primeira pessoa:")
     leia(nome)
     escreva("Digite o",x," idade da primeira pessoa:")
     leia(idade)
     soma <- soma + idade
     SE (idade >= maior) entao
        maior <- idade
        nome_maior <- nome
        
     fimse

fimpara
media <- soma / 5
escreval("O nome da pessoa mais velha é:",nome_maior)
escreval("A idade da pessoa mais velha é:",maior)
escreval("A media das idades é",media)

Fimalgoritmo