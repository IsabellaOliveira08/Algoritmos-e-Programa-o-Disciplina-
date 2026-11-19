# Comandos utilizados no código:
# 1. strip() remove espaços em branco no início e no final da string.
# 2. break é usado para sair do loop while quando a entrada do usuário é válida
# 3. (-=) Significa que o valor da variável à esquerda será subtraído pelo valor à direita e o resultado será atribuído à variável à esquerda. Por exemplo, x -= 1 é equivalente a x = x - 1.
# 4. (+=) Significa que o valor da variável à esquerda será somado pelo valor à direita e o resultado será atribuído à variável à esquerda. Por exemplo, x += 1 é equivalente a x = x + 1.
# 5. match-case é uma estrutura de controle de fluxo que permite comparar o valor de uma variável com diferentes padrões e executar blocos de código correspondentes. É semelhante a uma instrução switch em outras linguagens de programação.
#6. {'Código':<10} : O '<' indica que o texto deve ser alinhado à esquerda, e o número 10 especifica a largura mínima do campo. Se o texto for menor que 10 caracteres, espaços em branco serão adicionados à direita para preencher a largura mínima. Se o texto for maior que 10 caracteres, ele será exibido normalmente sem truncamento.
#7. values() é um método de dicionários em Python que retorna uma visão (view) dos valores contidos no dicionário. Essa visão é iterável, permitindo percorrer os valores do dicionário em um loop for, por exemplo. No código fornecido, values() é usado para iterar sobre os livros e usuários cadastrados, permitindo acessar suas informações e exibi-las de forma organizada.
#8. case _ é um caso coringa que captura qualquer valor que não corresponda aos casos anteriores. Nesse caso, ele é usado para tratar opções inválidas no menu.

# -> Funções auxiliares para o sistema de biblioteca <- 
# exibir_menu() - Exibe o menu principal e solicita a opção do usuário.
# cadastrar_livros(livros) - Cadastra livros no sistema.
# cadastrar_usuarios(usuarios) - Cadastra usuários no sistema.
# buscar_livros(livros, codigo) - Busca livros no sistema.
# buscar_usuarios(usuarios, codigo) - Busca usuários no sistema.
# realizar_emprestimo(livros, usuarios, emprestimos) - Realiza empréstimos de livros.
# realizar_devolucao(livros, usuarios, emprestimos, devolucoes) - Realiza devoluções de livros.
# consultar_livros(livros) - Consulta a situação de um livro.
# resumo_biblioteca(livros, usuarios, emprestimos) - Consulta o resumo da biblioteca.


# Função para exibir o menu principal e solicitar a opção do usuário.
def exibir_menu():
    print("\n------ MENU PRINCIPAL ------")
    print("[1] Cadastrar livro")
    print("[2] Cadastrar usuário")
    print("[3] Listar livros")
    print("[4] Listar usuários")
    print("[5] Realizar empréstimos")
    print("[6] Realizar devolução")
    print("[7] Consultar situação de um livro")
    print("[8] Consultar resumo da biblioteca")
    print("[0] Sair")

    # Solicita a opção do usuário e valida a entrada.
    while True:
        try:
            # Obriga o usuário a digitar um número inteiro de 0 a 8.
            return int(input(" -> Informe a opção desejada: "))
        except ValueError:
            # Solicita novamente a entrada caso não seja um número inteiro ou diferente de 0 a 8.
            print("⚠ Digite um número inteiro de 0 a 8.")

# Função para cadastrar livros no sistema.
def cadastrar_livros(livros):
    codigo = input("|Código do livro: ").strip()

    # Valida se o código do livro já está cadastrado.
    while codigo in livros:
        print("⚠ Esse código já está cadastrado. Digite outro.")
        # Solicita novamente o código do livro caso já exista / Obriga o usuário a digitar um código único para o livro.
        codigo = input("|Código do livro: ").strip()

    titulo = input("|Título da obra: ").strip()
    # Valida se o título do livro foi informado.
    while not titulo:
        print("⚠ O título é obrigatório.")
        # Solicita novamente o título do livro caso não tenha sido informado / Obriga o usuário a digitar um título para o livro.
        titulo = input("|Título da obra: ").strip()

    autor = input("|Nome do autor: ").strip()
    # Valida se o nome do autor foi informado.
    while not autor:
        print("⚠ O nome do autor é obrigatório.")
        # Solicita novamente o nome do autor caso não tenha sido informado / Obriga o usuário a digitar um nome para o autor.
        autor = input("|Nome do autor: ").strip()

    categoria = input("|Categoria da obra: ").strip()
    # Valida se a categoria do livro foi informada.
    while not categoria:
        # Solicita novamente a categoria do livro caso não tenha sido informada / Obriga o usuário a digitar uma categoria para o livro.
        print("⚠ A categoria é obrigatória.")
        categoria = input("|Categoria da obra: ").strip()

    # Valida se a quantidade de exemplares é um número inteiro maior que zero.
    while True:
        try:
            # Solicita a quantidade de exemplares do livro e valida a entrada.
            quantidade = int(input("|Quantidade total de exemplares: "))
        except ValueError:
            # Solicita novamente a entrada caso não seja um número inteiro.
            print("⚠ Digite um número inteiro.")
            continue
        # Valida se a quantidade de exemplares é maior que zero.
        while not quantidade > 0:
            # Solicita novamente a entrada caso a quantidade seja menor ou igual a zero / Obriga o usuário a digitar uma quantidade maior que zero.
            print("⚠ A quantidade de exemplares deve ser maior que zero.")
            quantidade = int(input("|Quantidade total de exemplares: "))
        else:
            #Finaliza o loop caso a quantidade seja válida.
            break

    # Retorna um dicionário com as informações do livro cadastrado.
    return {
        "codigo": codigo,
        "titulo": titulo,
        "autor": autor,
        "categoria": categoria,
        "quantidade": quantidade,
        "disponiveis": quantidade,
    }
# Função para cadastrar usuários no sistema.
def cadastrar_usuarios(usuarios):
    codigo = input("|Código do usuário: ").strip()
    # Valida se o código do usuário já está cadastrado.
    while codigo in usuarios:
        # Solicita novamente o código do usuário caso já exista / Obriga o usuário a digitar um código único para o usuário.
        print("⚠ Este código já existe.")
        codigo = input("|Informe outro código: ").strip()

    # Solicita o nome completo do usuário e valida a entrada.
    nome = input("|Nome completo: ").strip()
    while not nome:
        # Solicita novamente o nome completo do usuário caso não tenha sido informado / Obriga o usuário a digitar um nome completo.
        print("⚠ O nome é obrigatório.")
        nome = input("|Nome completo: ").strip()
    # Solicita o tipo de usuário e valida a entrada.
    pergunta = "|Tipo de usuário [1] Estudante [2] Professor [3] Funcionário: "
    tipo = input(pergunta).strip()
    # Valida se o tipo de usuário é válido (1, 2 ou 3).
    #strip() remove espaços em branco no início e no final da string.

    while tipo not in ("1", "2", "3"):
        print("⚠ Opção inválida. Digite 1, 2 ou 3.")
        tipo = input(pergunta).strip()

    curso = input("|Curso ou setor ao qual está vinculado: ").strip()
    while not curso:
        print("⚠ O curso ou setor é obrigatório.")
        curso = input("|Curso ou setor ao qual está vinculado: ").strip()

    return {
        "codigo": codigo,
        "Nome Completo": nome,
        "Tipo de usuário": tipo,
        "Curso": curso,
        "Emprestimos_realizados": 0,
    }

# Função para buscar livros no sistema.
def buscar_livros(livros, codigo):
    # Retorna o livro correspondente ao código informado, ou None se não encontrado.
    return livros.get(codigo, None)

# Função para buscar usuários no sistema.
def buscar_usuarios(usuarios, codigo):
    # Retorna o usuário correspondente ao código informado, ou None se não encontrado.
    return usuarios.get(codigo, None)

# Função para realizar empréstimos de livros.
def realizar_emprestimo(livros, usuarios, emprestimos):
    # Valida se há usuários e livros cadastrados antes de realizar o empréstimo.
    #if not usuarios or not livros: (objetivo: verificar se há usuários e livros cadastrados antes de realizar o empréstimo)
    if not usuarios or not livros:
        print(
            "⚠ Cadastre pelo menos um usuário e um livro antes de fazer um empréstimo."
        )
        return
    
    # Solicita o código do usuário e busca o usuário correspondente.
    codigo_usuario = input("|Código do usuário: ").strip()
    # Valida se o usuário existe no sistema.
    usuario = buscar_usuarios(usuarios, codigo_usuario)
    while not usuario:
        print("⚠ Usuário não encontrado.")
        # Solicita novamente o código do usuário caso não exista / Obriga o usuário a digitar um código válido para o usuário.
        codigo_usuario = input("|Código do usuário: ").strip()
        # Chamada da função buscar_usuarios para verificar se o usuário existe no sistema.
        usuario = buscar_usuarios(usuarios, codigo_usuario)

    # Solicita o código do livro e busca o livro correspondente.
    codigo_livro = input("|Código do livro: ").strip()
    # Valida se o livro existe no sistema.
    # Chama a função buscar_livros para verificar se o livro existe no sistema.
    livro = buscar_livros(livros, codigo_livro)

    if livros is None:
        # Valida se o livro existe no sistema.
        print("⚠ Livro não encontrado no sistema.")
        return
    # Valida se o livro está disponível para empréstimo.
    while not livro:
        print("⚠ Livro não encontrado.")
        # Solicita novamente o código do livro caso não exista / Obriga o usuário a digitar um código válido para o livro.
        codigo_livro = input("|Código do livro: ").strip()
        livro = buscar_livros(livros, codigo_livro)
    #Valida se há exemplares disponíveis para empréstimo.
    if livro["disponiveis"] <= 0:
        # Valida se há exemplares disponíveis para empréstimo.
        print("⚠ Não há exemplares disponíveis para empréstimo.")
        return

    while True:
        try:
            # Solicita a quantidade de dias para o empréstimo e valida a entrada.
            dias_emprestimo = int(
                input("|Informe a quantidade de dias para o empréstimo: ")
            )
        # Valida se a quantidade de dias é um número inteiro maior que zero.
        except ValueError:
            # Solicita novamente a entrada caso não seja um número inteiro.
            print("⚠ Digite um número inteiro.")
            continue
        # Valida se a quantidade de dias é maior que zero.
        while dias_emprestimo <= 0:
            print("⚠ A quantidade de dias deve ser maior que zero.")
            dias_emprestimo = int(input("|Informe a quantidade de dias para o empréstimo: "))
        else:
            # Finaliza o loop caso a quantidade de dias seja válida.
            break

    # Cria um dicionário com as informações do empréstimo e adiciona à lista de empréstimos.
    emprestimo = {
        "codigo_usuario": codigo_usuario,
        "codigo_livro": codigo_livro,
        "dias_emprestimo": dias_emprestimo,
    }

    # Adiciona o empréstimo à lista de empréstimos, atualiza a quantidade de exemplares disponíveis e incrementa o contador de empréstimos realizados pelo usuário.

    emprestimos.append(emprestimo)
    # Atualiza a quantidade de exemplares disponíveis do livro.
    livro["disponiveis"] -= 1

    # Incrementa o contador de empréstimos realizados pelo usuário.
    usuarios[codigo_usuario]["Emprestimos_realizados"] += 1

    # Obtém o nome completo do usuário para exibir na mensagem de sucesso.
    nome_usuario = usuarios[codigo_usuario]["Nome Completo"]

    # Exibe uma mensagem de sucesso informando que o empréstimo foi realizado com sucesso.
    print(
        f"[Empréstimo realizado com sucesso ✔] "
        f"-> '{livro['titulo']}' foi emprestado para {nome_usuario} "
        f"por {dias_emprestimo} dias."
    )

# Função para realizar devoluções de livros.
def realizar_devolucao(livros, usuarios, emprestimos, devolucoes):

    # Valida se há empréstimos registrados antes de realizar a devolução.
    if not emprestimos:
        print("⚠ Não há empréstimos registrados.")
        return
    
    # Solicita o código do usuário e busca o usuário correspondente.
    codigo_usuario = input("|Código do usuário: ").strip()
    # Valida se o usuário existe no sistema.
    usuario = buscar_usuarios(usuarios, codigo_usuario)
    while not usuario:
        print("⚠ Usuário não encontrado.")

        # Solicita novamente o código do usuário caso não exista / Obriga o usuário a digitar um código válido para o usuário.
        codigo_usuario = input("|Código do usuário: ").strip()
        usuario = buscar_usuarios(usuarios, codigo_usuario)

    # Solicita o código do livro e busca o livro correspondente.
    codigo_livro = input("|Código do livro: ").strip()
    livro = buscar_livros(livros, codigo_livro)
    while not livro:
        print("⚠ Livro não encontrado.")
        # Solicita novamente o código do livro caso não exista / Obriga o usuário a digitar um código válido para o livro.
        codigo_livro = input("|Código do livro: ").strip()
        livro = buscar_livros(livros, codigo_livro)

    # Procura o empréstimo correspondente ao usuário e livro informados.
    emprestimo_encontrado = None
    for emprestimo in emprestimos:
        if (
            # Verifica se o código do usuário e do livro correspondem ao empréstimo atual.
            emprestimo["codigo_usuario"] == codigo_usuario
            and emprestimo["codigo_livro"] == codigo_livro
        ):
            # Se encontrado, armazena o empréstimo na variável emprestimo_encontrado e sai do loop.
            emprestimo_encontrado = emprestimo
            break

    # Valida se o empréstimo foi encontrado para o usuário e livro informados.
    if not emprestimo_encontrado:
        print("⚠ Empréstimo não encontrado para este usuário e livro.")
        return
    
    # Remove o empréstimo da lista de empréstimos, atualiza a quantidade de exemplares disponíveis do livro, adiciona o empréstimo à lista de devoluções e decrementa o contador de empréstimos realizados pelo usuário.
    emprestimos.remove(emprestimo_encontrado)

    # Atualiza a quantidade de exemplares disponíveis do livro.
    livros[codigo_livro]["disponiveis"] += 1

    # Adiciona o empréstimo à lista de devoluções.
    devolucoes.append(emprestimo_encontrado)

    # Decrementa o contador de empréstimos realizados pelo usuário.
    usuarios[codigo_usuario]["Emprestimos_realizados"] -= 1

    # Obtém o nome completo do usuário e o título do livro para exibir na mensagem de sucesso.
    nome_usuario = usuarios[codigo_usuario]["Nome Completo"]

    # Obtém o título do livro para exibir na mensagem de sucesso.
    titulo_livro = livros[codigo_livro]["titulo"]

    # Exibe uma mensagem de sucesso informando que a devolução foi realizada com sucesso.
    print(
        f"[Devolução realizada com sucesso ✔] "
        f"-> '{titulo_livro}' foi devolvido por {nome_usuario}."
    )

    # Adiciona o empréstimo à lista de devoluções.
    devolucoes.append(emprestimo_encontrado)

# Função para consultar a situação de um livro.
def consultar_livros(livros):

    # Valida se há livros cadastrados antes de realizar a consulta.
    if not livros:
        print("⚠ Nenhum livro cadastrado.")
        return

    # Solicita o código do livro e valida a entrada.
    codigo_livro = input("|Código do livro: ").strip()

    # Valida se o livro existe no sistema.
    while codigo_livro not in livros:
        print("⚠ Livro não encontrado no sistema.")
        # Solicita novamente o código do livro caso não exista / Obriga o usuário a digitar um código válido para o livro.
        codigo_livro = input("|Código do livro: ").strip()
    
    # Obtém as informações do livro correspondente ao código informado. (codigo_livro) e calcula a quantidade de exemplares emprestados.
    livro = livros[codigo_livro]
    total = livro["quantidade"]
    disponiveis = livro["disponiveis"]
    emprestados = total - disponiveis

    # Exibe as informações do livro, incluindo código, título, autor, categoria, total de exemplares, exemplares disponíveis e exemplares emprestados.
    print("------ SITUAÇÃO DO LIVRO ------")
    print(f"Código: {codigo_livro}")
    print(f"Título: {livro['titulo']}")
    print(f"Autor: {livro['autor']}")
    print(f"Categoria: {livro['categoria']}")
    print(f"Total de exemplares: {total}")
    print(f"Exemplares disponíveis: {disponiveis}")
    print(f"Exemplares emprestados: {emprestados}")

# Função para consultar o resumo da biblioteca.
def resumo_biblioteca(livros, usuarios, emprestimos):
    # Calcula o total de livros, usuários, empréstimos ativos, exemplares disponíveis e exemplares emprestados.
    # sum(livro["disponiveis"] for livro in livros.values()) e livro["quantidade"] for livro in livros.values()) - Essas expressões utilizam a função sum() para calcular a soma dos valores de exemplares disponíveis e exemplares totais de todos os livros cadastrados na biblioteca.

    total_livros = len(livros)
    total_usuarios = len(usuarios)
    emprestimos_ativos = len(emprestimos)
    total_disponiveis = sum(livro["disponiveis"] for livro in livros.values())
    total_exemplares = sum(livro["quantidade"] for livro in livros.values())
    total_emprestimos = total_exemplares - total_disponiveis

    # Exibe o resumo da biblioteca, incluindo o total de livros cadastrados, usuários cadastrados, empréstimos ativos, exemplares disponíveis e exemplares emprestados.
    print("------ RESUMO DA BIBLIOTECA ------")
    print(f"|Livros cadastrados: {total_livros}")
    print(f"|Usuários cadastrados: {total_usuarios}")
    print(f"|Empréstimos ativos: {emprestimos_ativos}")
    print(f"|Exemplares disponíveis: {total_disponiveis}")
    print(f"|Exemplares emprestados: {total_emprestimos}")


# Programa principal 
# Dicionários para armazenar livros e usuários, e listas para armazenar empréstimos e devoluções.

livros = {}
usuarios = {}
emprestimos = []
devolucoes = []

print("---- SEJA BEM-VINDA À BIBLIOPY ----")

# Loop principal do programa, que exibe o menu e executa as opções escolhidas pelo usuário.
while True:
    # Exibe o menu principal e solicita a opção do usuário.
    num = exibir_menu()

    # Executa a ação correspondente à opção escolhida pelo usuário, utilizando a estrutura match-case.
    match num:
        # Cada case corresponde a uma opção do menu, e as funções auxiliares são chamadas para realizar as operações desejadas.
        #Case 1: Cadastrar livro, Case 2: Cadastrar usuário, Case 3: Listar livros, Case 4: Listar usuários, Case 5: Realizar empréstimos, Case 6: Realizar devolução, Case 7: Consultar situação de um livro, Case 8: Consultar resumo da biblioteca, Case 0: Sair do programa.

        case 1:
            # Solicita o cadastro de um livro e adiciona ao dicionário de livros.
            livro = cadastrar_livros(livros)
            livros[livro["codigo"]] = livro
            print("[Livro cadastrado com sucesso ✔]")

        case 2:
            # Solicita o cadastro de um usuário e adiciona ao dicionário de usuários.
            usuario = cadastrar_usuarios(usuarios)
            usuarios[usuario["codigo"]] = usuario
            print("[Usuário cadastrado com sucesso ✔]")

        case 3:
            # Lista os livros cadastrados no sistema, exibindo suas informações de forma organizada.
            if not livros:
                # Valida se há livros cadastrados antes de listar. / Se não houver livros cadastrados, exibe uma mensagem informando que não há livros cadastrados.
                print("Nenhum livro cadastrado.")
            else:
                print("------ LIVROS CADASTRADOS ------")
                # Define o cabeçalho da tabela de livros cadastrados, contendo os títulos das colunas.
                cabecalho = (
                    "Código",
                    "Título",
                    "Autor",
                    "Categoria",
                    "Total",
                    "Disponíveis",
                )
                linhas = [cabecalho]
                # Adiciona as informações de cada livro ao final da lista de linhas, formatando os valores para exibição.
                for livro in livros.values():
                    linhas.append(
                        (
                            livro["codigo"],
                            livro["titulo"],
                            livro["autor"],
                            livro["categoria"],
                            str(livro["quantidade"]),
                            str(livro["disponiveis"]),
                        )
                    )
                # Calcula a largura máxima de cada coluna, considerando o tamanho dos valores em cada linha.
                larguras = [
                    max(len(valor) for valor in coluna) for coluna in zip(*linhas)
                ]

                # Exibe as informações dos livros cadastrados em formato de tabela, alinhando os valores de acordo com a largura máxima de cada coluna.
                # Essa estrutura de repetição percorre cada linha da lista de linhas, e para cada linha, percorre cada valor e o alinha à esquerda ou à direita, dependendo do índice da coluna. Em seguida, os valores são unidos com " | " e exibidos na tela.

                for linha in linhas:
                    celulas = []
                    for indice, valor in enumerate(linha):
                        largura = larguras[indice]
                        if indice >= 4:
                            celulas.append(valor.rjust(largura))
                        else:
                            celulas.append(valor.ljust(largura))
                    print(" | ".join(celulas))

        case 4:
            # Lista os usuários cadastrados no sistema, exibindo suas informações de forma organizada.
            if not usuarios:
                # Valida se há usuários cadastrados antes de listar. / Se não houver usuários cadastrados, exibe uma mensagem informando que não há usuários cadastrados.
                print("Nenhum usuário cadastrado.")
            else:
                # Define o cabeçalho da tabela de usuários cadastrados, contendo os títulos das colunas.
                print("------ USUÁRIOS CADASTRADOS ------")

                # Define um dicionário para mapear os tipos de usuário (1, 2, 3) para suas respectivas descrições ("Estudante", "Professor", "Funcionário").
                tipos = {"1": "Estudante", "2": "Professor", "3": "Funcionário"}

                print(
                    f"{'Código':<10} | {'Nome completo':<30} | "
                    f"{'Tipo':<12} | {'Curso ou setor':<20}"
                )
                # Exibe as informações dos usuários cadastrados em formato de tabela, alinhando os valores de acordo com a largura máxima de cada coluna.
                for usuario in usuarios.values():
                    tipo = tipos[usuario["Tipo de usuário"]]
                    # Exibe as informações do usuário, incluindo código, nome completo, tipo de usuário e curso ou setor ao qual está vinculado.
                    print(
                        f"{usuario['codigo']:<10} | "
                        f"{usuario['Nome Completo']:<30} | "
                        f"{tipo:<12} | {usuario['Curso']}"
                    )

        case 5:
            # Solicita a realização de um empréstimo de livro, chamando a função realizar_emprestimo() e passando os dicionários de livros, usuários e a lista de empréstimos como argumentos.
            realizar_emprestimo(livros, usuarios, emprestimos)

        case 6:
            # Solicita a realização de uma devolução de livro, chamando a função realizar_devolucao() e passando os dicionários de livros, usuários, a lista de empréstimos e a lista de devoluções como argumentos.
            realizar_devolucao(livros, usuarios, emprestimos, devolucoes)

        case 7:
            # Solicita a consulta da situação de um livro, chamando a função consultar_livros() e passando o dicionário de livros como argumento.
            consultar_livros(livros)

        case 8:
            # Solicita a consulta do resumo da biblioteca, chamando a função resumo_biblioteca() e passando os dicionários de livros, usuários e a lista de empréstimos como argumentos.
            resumo_biblioteca(livros, usuarios, emprestimos)

        case 0:
            # Finaliza o programa, exibindo uma mensagem de encerramento e saindo do loop principal.
            print("Finalizando programa.")
            break
        case _:
            # Caso o usuário digite uma opção inválida, exibe uma mensagem de aviso e solicita novamente a entrada.
            print("⚠ Opção inválida. Escolha um número de 0 a 8.")
