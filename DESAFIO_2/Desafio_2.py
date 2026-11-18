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

    while True:
        try:
            return int(input(" -> Informe a opção desejada: "))
        except ValueError:
            print("⚠ Digite um número inteiro de 0 a 8.")


def cadastrar_livros(livros):
    codigo = input("|Código do livro: ").strip()

    while codigo in livros:
        print("⚠ Esse código já está cadastrado. Digite outro.")
        codigo = input("|Código do livro: ").strip()

    titulo = input("|Título da obra: ").strip()
    while not titulo:
        print("⚠ O título é obrigatório.")
        titulo = input("|Título da obra: ").strip()

    autor = input("|Nome do autor: ").strip()
    while not autor:
        print("⚠ O nome do autor é obrigatório.")
        autor = input("|Nome do autor: ").strip()

    categoria = input("|Categoria da obra: ").strip()
    while not categoria:
        print("⚠ A categoria é obrigatória.")
        categoria = input("|Categoria da obra: ").strip()

    while True:
        try:
            quantidade = int(input("|Quantidade total de exemplares: "))
        except ValueError:
            print("⚠ Digite um número inteiro.")
            continue

        if quantidade > 0:
            break

        print("⚠ A quantidade de exemplares deve ser maior que zero.")

    return {
        "codigo": codigo,
        "titulo": titulo,
        "autor": autor,
        "categoria": categoria,
        "quantidade": quantidade,
        "disponiveis": quantidade
    }


def cadastrar_usuarios(usuarios):
    codigo = input("|Código do usuário: ").strip()

    while codigo in usuarios:
        print("⚠ Este código já existe.")
        codigo = input("|Informe outro código: ").strip()

    nome = input("|Nome completo: ").strip()
    while not nome:
        print("⚠ O nome é obrigatório.")
        nome = input("|Nome completo: ").strip()

    pergunta = "|Tipo de usuário [1] Estudante [2] Professor [3] Funcionário: "
    tipo = input(pergunta).strip()

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
        "Emprestimos_realizados" : 0
    }
def buscar_livros(livros, codigo):
    return livros.get(codigo, None)

def buscar_usuarios(usuarios, codigo):
    return usuarios.get(codigo, None)

def realizar_emprestimo(livros, usuarios, emprestimos):
    if not usuarios or not livros:
        print("⚠ Cadastre pelo menos um usuário e um livro antes de fazer um empréstimo.")
        return

    codigo_usuario = input("|Código do usuário: ").strip()
    usuario = buscar_usuarios(usuarios, codigo_usuario)
    while not usuario:
        print("⚠ Usuário não encontrado.")
        codigo_usuario = input("|Código do usuário: ").strip()
        usuario = buscar_usuarios(usuarios, codigo_usuario)

    codigo_livro = input("|Código do livro: ").strip()
    livro = buscar_livros(livros, codigo_livro)

    if livros is None:
        print("⚠ Livro não encontrado no sistema.")
        return
    
    while not livro:
        print("⚠ Livro não encontrado.")
        codigo_livro = input("|Código do livro: ").strip()
        livro = buscar_livros(livros, codigo_livro)

    if livro["disponiveis"] <= 0:
        print("⚠ Não há exemplares disponíveis para empréstimo.")
        return

    while True:
        try:
            dias_emprestimo = int(
                input("|Informe a quantidade de dias para o empréstimo: ")
            )
        except ValueError:
            print("⚠ Digite um número inteiro.")
            continue

        if dias_emprestimo > 0:
            break

        print("⚠ A quantidade de dias deve ser maior que zero.")

    emprestimo = {
        "codigo_usuario": codigo_usuario,
        "codigo_livro": codigo_livro,
        "dias_emprestimo": dias_emprestimo
    }

    emprestimos.append(emprestimo)
    livro["disponiveis"] -= 1
    usuarios[codigo_usuario]["Emprestimos_realizados"] += 1

    nome_usuario = usuarios[codigo_usuario]["Nome Completo"]

    print(
        f"[Empréstimo realizado com sucesso ✔] "
        f"-> '{livro['titulo']}' foi emprestado para {nome_usuario} "
        f"por {dias_emprestimo} dias."
    )

def realizar_devolucao(livros, usuarios, emprestimos, devolucoes):

    if not emprestimos:
        print("⚠ Não há empréstimos registrados.")
        return

    codigo_usuario = input("|Código do usuário: ").strip()
    usuario = buscar_usuarios(usuarios, codigo_usuario)
    while not usuario:
        print("⚠ Usuário não encontrado.")
        codigo_usuario = input("|Código do usuário: ").strip()
        usuario = buscar_usuarios(usuarios, codigo_usuario)

    codigo_livro = input("|Código do livro: ").strip()
    livro = buscar_livros(livros, codigo_livro)
    while not livro:
        print("⚠ Livro não encontrado.")
        codigo_livro = input("|Código do livro: ").strip()
        livro = buscar_livros(livros, codigo_livro)

    emprestimo_encontrado = None
    for emprestimo in emprestimos:
        if (
            emprestimo["codigo_usuario"] == codigo_usuario and
            emprestimo["codigo_livro"] == codigo_livro
        ):
            emprestimo_encontrado = emprestimo
            break

    if not emprestimo_encontrado:
        print("⚠ Empréstimo não encontrado para este usuário e livro.")
        return

    emprestimos.remove(emprestimo_encontrado)
    livros[codigo_livro]["disponiveis"] += 1
    devolucoes.append(emprestimo_encontrado)
    usuarios[codigo_usuario]["Emprestimos_realizados"] -= 1
    nome_usuario = usuarios[codigo_usuario]["Nome Completo"]
    titulo_livro = livros[codigo_livro]["titulo"]

    print(
        f"[Devolução realizada com sucesso ✔] "
        f"-> '{titulo_livro}' foi devolvido por {nome_usuario}."
    )
    devolucoes.append(emprestimo_encontrado)


def consultar_livros(livros):
    if not livros:
        print("⚠ Nenhum livro cadastrado.")
        return

    codigo_livro = input("|Código do livro: ").strip()

    if codigo_livro not in livros:
        print("⚠ Livro não encontrado no sistema.")
        return

    livro = livros[codigo_livro]
    total = livro["quantidade"]
    disponiveis = livro["disponiveis"]
    emprestados = total - disponiveis

    print("------ SITUAÇÃO DO LIVRO ------")
    print(f"Código: {codigo_livro}")
    print(f"Título: {livro['titulo']}")
    print(f"Autor: {livro['autor']}")
    print(f"Categoria: {livro['categoria']}")
    print(f"Total de exemplares: {total}")
    print(f"Exemplares disponíveis: {disponiveis}")
    print(f"Exemplares emprestados: {emprestados}")

def resumo_biblioteca(livros, usuarios, emprestimos):
    total_livros = len(livros)
    total_usuarios = len(usuarios)
    emprestimos_ativos = len(emprestimos)
    total_disponiveis = sum(livro["disponiveis"] for livro in livros.values())
    total_exemplares = sum(livro["quantidade"] for livro in livros.values())
    total_emprestimos = total_exemplares - total_disponiveis

    print("------ RESUMO DA BIBLIOTECA ------")
    print(f"|Livros cadastrados: {total_livros}")
    print(f"|Usuários cadastrados: {total_usuarios}")
    print(f"|Empréstimos ativos: {emprestimos_ativos}")
    print(f"|Exemplares disponíveis: {total_disponiveis}")
    print(f"|Exemplares emprestados: {total_emprestimos}")

# Programa principal
livros = {}
usuarios = {}
emprestimos = []
devolucoes = []

print("---- SEJA BEM-VINDA À BIBLIOPY ----")

while True:
    num = exibir_menu()

    match num:
        case 1:
            livro = cadastrar_livros(livros)
            livros[livro["codigo"]] = livro
            print("[Livro cadastrado com sucesso ✔]")
        case 2:
            usuario = cadastrar_usuarios(usuarios)
            usuarios[usuario["codigo"]] = usuario
            print("[Usuário cadastrado com sucesso ✔]")
        case 3:
            if not livros:
                print("Nenhum livro cadastrado.")
            else:
                print("------ LIVROS CADASTRADOS ------")
                cabecalho = ("Código", "Título", "Autor", "Categoria", "Total", "Disponíveis")
                linhas = [cabecalho]

                for livro in livros.values():
                    linhas.append((
                        livro["codigo"],
                        livro["titulo"],
                        livro["autor"],
                        livro["categoria"],
                        str(livro["quantidade"]),
                        str(livro["disponiveis"])
                    ))

                larguras = [max(len(valor) for valor in coluna) for coluna in zip(*linhas)]

                for linha in linhas:
                    celulas = []
                    for indice, valor in enumerate(linha):
                        largura = larguras[indice]
                        if indice >=4: 
                            celulas.append(valor.rjust(largura))
                        else:
                            celulas.append(valor.ljust(largura))
                    print(" | ".join(celulas))
        case 4:
            if not usuarios:
                print("Nenhum usuário cadastrado.")
            else:
                print("------ USUÁRIOS CADASTRADOS ------")

                tipos = {
                    "1": "Estudante",
                    "2": "Professor",
                    "3": "Funcionário"
                }

                print(
                    f"{'Código':<10} | {'Nome completo':<30} | "
                    f"{'Tipo':<12} | {'Curso ou setor':<20}"
                )

                for usuario in usuarios.values():
                    tipo = tipos[usuario["Tipo de usuário"]]

                    print(
                        f"{usuario['codigo']:<10} | "
                        f"{usuario['Nome Completo']:<30} | "
                        f"{tipo:<12} | {usuario['Curso']}"
                    )
        case 5:
            realizar_emprestimo(livros, usuarios, emprestimos)
        case 6:
            realizar_devolucao(livros, usuarios, emprestimos, devolucoes)
        case 7:
            consultar_livros(livros)
        case 8:
            resumo_biblioteca(livros, usuarios, emprestimos)
        case 0:
            print("Finalizando programa.")
            break
        case _:
            print("⚠ Opção inválida. Escolha um número de 0 a 8.")
