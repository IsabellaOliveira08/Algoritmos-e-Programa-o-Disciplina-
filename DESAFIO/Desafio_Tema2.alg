Algoritmo "Desafio_Tema2"
// Disciplina  : Algoritmo e Lógica de Programação
// Professor   : André Olímpio
// Descrição   : MedControl – Sistema de Gerenciamento de Atendimentos de uma Clínica Médica
// Autor(a)    : Isabella Oliveira Assis
// Data atual  : 11/10/2026
// Portugol estruturado: exige interpretador com Const, Tipo, Registro
// e passagem de vetores de registros por parâmetro.
// Compatibilidade com o VisuAlg da disciplina ainda não verificada.

Const
   MAX_PACIENTES = 30
   EMERGENCIA = 1
   MUITO_URGENTE = 2
   URGENTE = 3
   POUCO_URGENTE = 4
   AGUARDANDO = 0
   ATENDIDO = 1
   TODOS = -1
   NAO_ENCONTRADO = 0
   CADASTRADOS = 1
   COL_AGUARDANDO = 2
   COL_ATENDIDOS = 3
   TOTAL_COLUNAS = 3
   ENCERRAR = 9
   MAX_INTEIRO = 2147483647
   // Limites didáticos de entrada, sem classificação médica.
   MAX_IDADE = 130
   MAX_PRESSAO = 999
   MAX_TEMPERATURA = 99

Tipo
   Paciente = registro
      codigo: inteiro
      nome: caractere
      idade: inteiro
      sexo: caractere
      prioridade: inteiro
      sistolica: inteiro
      diastolica: inteiro
      temperatura: real
      status: inteiro
   fimregistro
   VetorPacientes = vetor[1..MAX_PACIENTES] de Paciente
   MatrizEstatisticas = vetor[1..POUCO_URGENTE, 1..TOTAL_COLUNAS] de inteiro

Var
// Seção de Declarações das variáveis
   pacientes: VetorPacientes
   estatisticas: MatrizEstatisticas
   quantidade, opcao: inteiro

// Lê como texto para impedir que letras sejam aceitas como números.
// Aceita ponto ou vírgula nos campos reais. Não aceita sinal negativo.
Funcao LerNumero(mensagem: caractere; somenteInteiro: logico; minimo, maximo: real): real
Var
   entrada, letra: caractere
   i, d, digito, quantidadeDigitos: inteiro
   valor, divisor: real
   valido, decimal: logico
Inicio
   repita
      escreva(mensagem)
      leia(entrada)
      valor <- 0
      divisor <- 1
      quantidadeDigitos <- 0
      decimal <- falso
      valido <- compr(entrada) > 0

      para i de 1 ate compr(entrada) faca
         letra <- copia(entrada, i, 1)
         se (letra = ".") ou (letra = ",") entao
            se somenteInteiro ou decimal entao
               valido <- falso
            senao
               decimal <- verdadeiro
            fimse
         senao
            digito <- -1
            para d de 0 ate 9 faca
               se letra = copia("0123456789", d + 1, 1) entao
                  digito <- d
               fimse
            fimpara
            se digito = -1 entao
               valido <- falso
            senao
               quantidadeDigitos <- quantidadeDigitos + 1
               se decimal entao
                  divisor <- divisor * 10
                  valor <- valor + digito / divisor
               senao
                  // Não deixa o acumulador crescer indefinidamente.
                  se valor <= maximo entao
                     valor <- valor * 10 + digito
                  senao
                     valido <- falso
                  fimse
               fimse
            fimse
         fimse
      fimpara

      valido <- valido e (quantidadeDigitos > 0) e (valor >= minimo) e (valor <= maximo)
      se nao valido entao
         escreval("Entrada inválida. Informe um número entre ", minimo, " e ", maximo, ".")
      fimse
   ate valido
   retorne valor
Fimfuncao

Funcao LocalizarPaciente(dados: VetorPacientes; codigo, total: inteiro): inteiro
Var
   i: inteiro
Inicio
   para i de 1 ate total faca
      se dados[i].codigo = codigo entao
         retorne i
      fimse
   fimpara
   retorne NAO_ENCONTRADO
Fimfuncao

Funcao BuscarRecursivo(dados: VetorPacientes; codigo, posicao, total: inteiro): inteiro
Inicio
   // Caso-base: já verificou todos os pacientes.
   se posicao > total entao
      retorne NAO_ENCONTRADO
   senao
      // Caso-base: encontrou o código procurado.
      se dados[posicao].codigo = codigo entao
         retorne posicao
      senao
         // Passo recursivo: verifica a próxima posição.
         retorne BuscarRecursivo(dados, codigo, posicao + 1, total)
      fimse
   fimse
Fimfuncao

Funcao ContarAguardando(dados: VetorPacientes; posicao, total: inteiro): inteiro
Inicio
   se posicao > total entao
      retorne 0
   senao
      se dados[posicao].status = AGUARDANDO entao
         retorne 1 + ContarAguardando(dados, posicao + 1, total)
      senao
         retorne ContarAguardando(dados, posicao + 1, total)
      fimse
   fimse
Fimfuncao

Procedimento AtualizarEstatisticas(dados: VetorPacientes; total: inteiro; var matriz: MatrizEstatisticas)
Var
   i, linha, coluna: inteiro
Inicio
   // Linhas: prioridades. Colunas: cadastrados, aguardando, atendidos.
   para linha de EMERGENCIA ate POUCO_URGENTE faca
      para coluna de CADASTRADOS ate TOTAL_COLUNAS faca
         matriz[linha, coluna] <- 0
      fimpara
   fimpara
   para i de 1 ate total faca
      linha <- dados[i].prioridade
      matriz[linha, CADASTRADOS] <- matriz[linha, CADASTRADOS] + 1
      se dados[i].status = AGUARDANDO entao
         matriz[linha, COL_AGUARDANDO] <- matriz[linha, COL_AGUARDANDO] + 1
      senao
         matriz[linha, COL_ATENDIDOS] <- matriz[linha, COL_ATENDIDOS] + 1
      fimse
   fimpara
Fimprocedimento

Procedimento MostrarPaciente(pessoa: Paciente)
Inicio
   escreval("----------------------------------------")
   escreval("Código: ", pessoa.codigo)
   escreval("Nome: ", pessoa.nome)
   escreval("Idade: ", pessoa.idade)
   escreval("Sexo: ", pessoa.sexo)
   escreval("Prioridade: ", pessoa.prioridade)
   escreval("Pressão: ", pessoa.sistolica, "/", pessoa.diastolica, " mmHg")
   escreval("Temperatura: ", pessoa.temperatura:6:2, " graus Celsius")
   se pessoa.status = AGUARDANDO entao
      escreval("Status: aguardando atendimento")
   senao
      escreval("Status: atendido")
   fimse
Fimprocedimento

Procedimento CadastrarPaciente(var dados: VetorPacientes; var total: inteiro; var matriz: MatrizEstatisticas)
Var
   novo: Paciente
   posicao: inteiro
Inicio
   se total >= MAX_PACIENTES entao
      escreval("Capacidade máxima de pacientes atingida.")
   senao
      repita
         novo.codigo <- int(LerNumero("Código: ", verdadeiro, 1, MAX_INTEIRO))
         posicao <- LocalizarPaciente(dados, novo.codigo, total)
         se posicao <> NAO_ENCONTRADO entao
            escreval("Código já cadastrado. Informe outro código.")
         fimse
      ate posicao = NAO_ENCONTRADO

      repita
         escreva("Nome: ")
         leia(novo.nome)
         se novo.nome = "" entao
            escreval("O nome não pode ficar vazio.")
         fimse
      ate novo.nome <> ""

      novo.idade <- int(LerNumero("Idade (0 a 130 anos): ", verdadeiro, 0, MAX_IDADE))
      repita
         escreva("Sexo (F, M ou O): ")
         leia(novo.sexo)
         novo.sexo <- maiusc(novo.sexo)
         se (novo.sexo <> "F") e (novo.sexo <> "M") e (novo.sexo <> "O") entao
            escreval("Informe F, M ou O (outro/não informado).")
         fimse
      ate (novo.sexo = "F") ou (novo.sexo = "M") ou (novo.sexo = "O")

      escreval("1 - Emergência | 2 - Muito urgente")
      escreval("3 - Urgente    | 4 - Pouco urgente")
      novo.prioridade <- int(LerNumero("Prioridade: ", verdadeiro, EMERGENCIA, POUCO_URGENTE))
      novo.sistolica <- int(LerNumero("Pressão sistólica (mmHg): ", verdadeiro, 1, MAX_PRESSAO))
      novo.diastolica <- int(LerNumero("Pressão diastólica (mmHg): ", verdadeiro, 1, MAX_PRESSAO))
      novo.temperatura <- LerNumero("Temperatura (graus Celsius): ", falso, 0.1, MAX_TEMPERATURA)
      // O status inicial é fixo, conforme a regra do cadastro.
      novo.status <- AGUARDANDO
      total <- total + 1
      dados[total] <- novo
      AtualizarEstatisticas(dados, total, matriz)
      escreval("Paciente cadastrado. Status: aguardando atendimento.")
   fimse
Fimprocedimento

Procedimento ListarPacientes(dados: VetorPacientes; total, filtro: inteiro)
Var
   i, exibidos: inteiro
Inicio
   se total = 0 entao
      escreval("Nenhum paciente cadastrado.")
   senao
      exibidos <- 0
      para i de 1 ate total faca
         se (filtro = TODOS) ou (dados[i].status = filtro) entao
            MostrarPaciente(dados[i])
            exibidos <- exibidos + 1
         fimse
      fimpara
      se exibidos = 0 entao
         escreval("Nenhum paciente com esse status.")
      fimse
   fimse
Fimprocedimento

Procedimento ConsultarPaciente(dados: VetorPacientes; total: inteiro; recursiva: logico)
Var
   codigo, posicao: inteiro
Inicio
   se total = 0 entao
      escreval("Nenhum paciente cadastrado.")
   senao
      codigo <- int(LerNumero("Código procurado: ", verdadeiro, 1, MAX_INTEIRO))
      se recursiva entao
         posicao <- BuscarRecursivo(dados, codigo, 1, total)
      senao
         posicao <- LocalizarPaciente(dados, codigo, total)
      fimse
      se posicao = NAO_ENCONTRADO entao
         escreval("Paciente não encontrado.")
      senao
         MostrarPaciente(dados[posicao])
      fimse
   fimse
Fimprocedimento

Procedimento OrdenarFila(dados: VetorPacientes; total: inteiro; var fila: VetorPacientes; var tamanho: inteiro)
Var
   i, j: inteiro
   auxiliar: Paciente
Inicio
   tamanho <- 0
   // Copia apenas quem aguarda, mantendo a ordem original de cadastro.
   para i de 1 ate total faca
      se dados[i].status = AGUARDANDO entao
         tamanho <- tamanho + 1
         fila[tamanho] <- dados[i]
      fimse
   fimpara

   // Bubble Sort: menor número de prioridade e maior idade primeiro.
   // Em empate completo não troca: preserva a ordem de cadastro.
   para i de 1 ate tamanho - 1 faca
      para j de 1 ate tamanho - i faca
         se (fila[j].prioridade > fila[j + 1].prioridade) ou ((fila[j].prioridade = fila[j + 1].prioridade) e (fila[j].idade < fila[j + 1].idade)) entao
            auxiliar <- fila[j]
            fila[j] <- fila[j + 1]
            fila[j + 1] <- auxiliar
         fimse
      fimpara
   fimpara
Fimprocedimento

Procedimento ExibirFila(dados: VetorPacientes; total: inteiro)
Var
   fila: VetorPacientes
   tamanho, i: inteiro
Inicio
   OrdenarFila(dados, total, fila, tamanho)
   se tamanho = 0 entao
      escreval("Não há pacientes aguardando atendimento.")
   senao
      para i de 1 ate tamanho faca
         escreval("Posição na fila: ", i)
         MostrarPaciente(fila[i])
      fimpara
   fimse
Fimprocedimento

Procedimento RealizarAtendimento(var dados: VetorPacientes; total: inteiro; var matriz: MatrizEstatisticas)
Var
   fila: VetorPacientes
   tamanho, posicao: inteiro
Inicio
   OrdenarFila(dados, total, fila, tamanho)
   se tamanho = 0 entao
      escreval("Não há pacientes aguardando atendimento.")
   senao
      posicao <- LocalizarPaciente(dados, fila[1].codigo, total)
      se posicao = NAO_ENCONTRADO entao
         escreval("Paciente não encontrado.")
      senao
         se dados[posicao].status = ATENDIDO entao
            escreval("Esse paciente já foi atendido.")
         senao
            dados[posicao].status <- ATENDIDO
            AtualizarEstatisticas(dados, total, matriz)
            escreval("Atendimento registrado para o primeiro paciente da fila:")
            MostrarPaciente(dados[posicao])
         fimse
      fimse
   fimse
Fimprocedimento

Procedimento ExibirEstatisticas(dados: VetorPacientes; total: inteiro; matriz: MatrizEstatisticas)
Var
   i, aguardando, atendidos, somaIdades, maiorIdade, menorIdade, prioridadesAltas: inteiro
   somaTemperaturas: real
Inicio
   se total = 0 entao
      escreval("Nenhum paciente cadastrado. Total: 0.")
   senao
      somaIdades <- 0
      somaTemperaturas <- 0
      prioridadesAltas <- 0
      maiorIdade <- dados[1].idade
      menorIdade <- dados[1].idade

      para i de 1 ate total faca
         somaIdades <- somaIdades + dados[i].idade
         somaTemperaturas <- somaTemperaturas + dados[i].temperatura
         se dados[i].idade > maiorIdade entao
            maiorIdade <- dados[i].idade
         fimse
         se dados[i].idade < menorIdade entao
            menorIdade <- dados[i].idade
         fimse
         se (dados[i].prioridade = EMERGENCIA) ou (dados[i].prioridade = MUITO_URGENTE) entao
            prioridadesAltas <- prioridadesAltas + 1
         fimse
      fimpara

      aguardando <- ContarAguardando(dados, 1, total)
      atendidos <- total - aguardando
      escreval("Total de pacientes: ", total)
      escreval("Aguardando: ", aguardando)
      escreval("Atendidos: ", atendidos)
      escreval("Média de idade: ", (somaIdades / total):6:2)
      escreval("Média de temperatura: ", (somaTemperaturas / total):6:2)
      escreval("Maior idade: ", maiorIdade)
      escreval("Menor idade: ", menorIdade)
      escreval("Percentual de atendidos: ", (atendidos * 100 / total):6:2, "%")
      escreval("Percentual de aguardando: ", (aguardando * 100 / total):6:2, "%")
      escreval("Pacientes com prioridade 1 ou 2: ", prioridadesAltas)
      escreval("Prioridade | Cadastrados | Aguardando | Atendidos")
      para i de EMERGENCIA ate POUCO_URGENTE faca
         escreval(i:10, matriz[i, CADASTRADOS]:14, matriz[i, COL_AGUARDANDO]:13, matriz[i, COL_ATENDIDOS]:12)
      fimpara
   fimse
Fimprocedimento

Inicio
// Seção de Comandos, procedimento, funções, operadores, etc...
   quantidade <- 0
   AtualizarEstatisticas(pacientes, quantidade, estatisticas)
   repita
      escreval("")
      escreval("MEDCONTROL - GERENCIAMENTO DE ATENDIMENTOS")
      escreval("1. Cadastrar paciente")
      escreval("2. Listar pacientes")
      escreval("3. Consultar paciente")
      escreval("4. Exibir fila de atendimento")
      escreval("5. Realizar atendimento")
      escreval("6. Exibir pacientes atendidos")
      escreval("7. Exibir estatísticas")
      escreval("8. Executar consulta recursiva")
      escreval("9. Encerrar sistema")
      opcao <- int(LerNumero("Escolha uma opção: ", verdadeiro, 0, MAX_INTEIRO))
      escolha opcao
         caso 1
            CadastrarPaciente(pacientes, quantidade, estatisticas)
         caso 2
            ListarPacientes(pacientes, quantidade, TODOS)
         caso 3
            ConsultarPaciente(pacientes, quantidade, falso)
         caso 4
            ExibirFila(pacientes, quantidade)
         caso 5
            RealizarAtendimento(pacientes, quantidade, estatisticas)
         caso 6
            ListarPacientes(pacientes, quantidade, ATENDIDO)
         caso 7
            ExibirEstatisticas(pacientes, quantidade, estatisticas)
         caso 8
            ConsultarPaciente(pacientes, quantidade, verdadeiro)
         caso ENCERRAR
            escreval("Sistema encerrado.")
         outrocaso
            escreval("Opção inexistente. Escolha de 1 a 9.")
      fimescolha
   ate opcao = ENCERRAR
Fimalgoritmo

// ROTEIRO DE TESTES PARA EXECUTAR NO INTERPRETADOR DA DISCIPLINA:
// 1. Sem cadastros: consultar, listar, atender, estatísticas e busca recursiva.
// 2. Cadastrar (código, nome, idade, sexo, prioridade, sistólica, diastólica, temperatura):
//    101, Ana,   30, F, 3, 120, 80, 36.5
//    102, Bruno, 70, M, 2, 120, 80, 37.0
//    103, Carla, 60, F, 1, 120, 80, 38.0
//    104, Diego, 80, M, 2, 120, 80, 36.0
//    105, Eva,   80, F, 2, 120, 80, 37.5
//    106, Fabio, 25, M, 4, 120, 80, 36.0
// 3. Fila esperada: 103, 104, 105, 102, 101, 106.
// 4. Repetir o código 101: deve solicitar outro código.
// 5. Digitar idade -1, prioridade 5 e número abc: deve solicitar correção.
// 6. Consultar 999: não encontrado; consultar 103: encontrado.
// 7. Buscar recursivamente 105 e 999: encontrado e não encontrado.
// 8. Atender: 103 passa a ATENDIDO e sai da fila.
// 9. Atender novamente: próximo é 104; 103 não é atendido duas vezes.
// 10. Após um atendimento: total 6, aguardando 5, atendidos 1.
//     Média de idade 57.50; temperatura 36.83; maior 80; menor 25.
//     Atendidos 16.67%; aguardando 83.33%; prioridades 1 ou 2: 4.
//     Matriz: prioridade 1 = 1,0,1; 2 = 3,3,0; 3 = 1,1,0; 4 = 1,1,0.
// 11. Atender os seis e tentar novamente: fila vazia, sem novo atendimento.
// 12. Completar 30 cadastros e tentar o 31º: capacidade atingida.
// 13. Selecionar opção 10: opção inexistente. Selecionar 9: encerrar.
// Este roteiro contém resultados esperados; não é um registro de execução.
