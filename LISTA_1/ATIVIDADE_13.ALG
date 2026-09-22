Algoritmo "atividade_13"
// Disciplina  : Algoritmo e Lógica de Programação
// Professor   : André Olímpio 
// Autor(a)    : Isabella
// Data atual  : 18/08/2026
Var
altura,peso,imc: real

Inicio

escreva("Digite sua altura em metros:")
leia(altura)
escreva("Digite seu peso em kg:")
leia(peso)
imc <- peso / (altura * altura)
se (imc < 18.5)entao
   escreva("Abaixo do peso")
senao
     se (imc >= 18.5) e (imc <= 24.9) entao
        escreva("Peso normal")
     senao
          se (imc >= 25.0) e (imc <= 29.9) entao
             escreva("Sobrepeso")
          senao
               se(imc >= 30.0) e (imc <= 34.9) entao
                      escreva("Obesidade Grau 1")
               senao
                    escreva("Obesidade Grau 2")
               fimse
          fimse
     fimse
fimse
     
Fimalgoritmo