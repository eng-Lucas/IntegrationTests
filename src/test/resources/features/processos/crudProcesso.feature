#language: pt

@run
Funcionalidade: CRUD de um processo

  Contexto:
    Dado que o usuário gostaria de salvar seu registro
    E o usuário informar "vara" com valor igual a "Osasco"
    E o usuário informar "numero_processo" com valor igual a "12345"
    E o usuário informar "natureza" com valor igual a "Guarda"
    E o usuário informar "partes" com valor igual a "Lucas x Mirella"
    E o usuário informar "urgente" com valor igual a "N"
    E o usuário informar "arbitramento" com valor igual a "S"
    E o usuário informar "assistente_social" com valor igual a "Aline"
    E o usuário informar "data_entrada" com valor igual a "17/12/2020"
    E o usuário informar "data_saida" com valor igual a ""
    E o usuário informar "data_agendamento" com valor igual a ""
    E o usuário informar "status" com valor igual a "Aguardando"
    E o usuário informar "observacao" com valor igual a ""

  Cenário: Criação de um novo processo - POST
    Quando o usuário clicar no botão salvar
    Então o usuário deveria ver a mensagem "salvo com sucesso"

  Cenário: Pegar o último processo que foi criado - GET
    Dado que o usuário queira ver o último processo criado
    Quando o usuário clicar em mostrar
    Então o usuário deveria ver a mensagem "sucesso"

  Cenário: Criar, alterar e mostrar o processo - POST, PUT e GET
    Dado o usuário clicar no botão salvar

    Quando alterar o campo "status" para o valor "Finalizado"
    E o usuário clicar em editar
    Então o usuário deveria ver a mensagem "sucesso"

    Quando o usuário clicar em mostrar
    Então o usuário visualiza o campo "vara" com valor igual a "Osasco"
    E o usuário visualiza o campo "numero_processo" com valor igual a "12345"
    E o usuário visualiza o campo "natureza" com valor igual a "Guarda"
    E o usuário visualiza o campo "partes" com valor igual a "Lucas x Mirella"
    E o usuário visualiza o campo "urgente" com valor igual a "N"
    E o usuário visualiza o campo "arbitramento" com valor igual a "S"
    E o usuário visualiza o campo "assistente_social" com valor igual a "Aline"
    E o usuário visualiza o campo "data_entrada" com valor igual a "2020-12-17"
    E o usuário visualiza o campo "data_saida" com valor igual a ""
    E o usuário visualiza o campo "data_agendamento" com valor igual a ""
    E o usuário visualiza o campo "status" com valor igual a "Finalizado"
    E o usuário visualiza o campo "observacao" com valor igual a ""

  Cenário: Criar, deletar o processo e validar se foi deletado - POST, DELETE e GET
    Dado o usuário clicar no botão salvar
    Quando o usuário clicar em deletar
    Então o usuário deveria ver a mensagem "sem conteúdo"

    Quando o usuário clicar em mostrar
    Então o usuário deveria ver a mensagem "não encontrado"

  Esquema do Cenário: Validação do post com esquema de cenário. Vara = <vara>, Número do processo = <numero_processo>, Natureza = <natureza>, Partes = <partes>, Data de entrada = <data_entrada> e Status = <status>
    Dado que o usuário gostaria de salvar seu registro
    E o usuário informar "vara" com valor igual a "<vara>"
    E o usuário informar "numero_processo" com valor igual a "<numero_processo>"
    E o usuário informar "natureza" com valor igual a "<natureza>"
    E o usuário informar "partes" com valor igual a "<partes>"
    E o usuário informar "urgente" com valor igual a "N"
    E o usuário informar "arbitramento" com valor igual a "S"
    E o usuário informar "assistente_social" com valor igual a ""
    E o usuário informar "data_entrada" com valor igual a "<data_entrada>"
    E o usuário informar "data_saida" com valor igual a ""
    E o usuário informar "data_agendamento" com valor igual a ""
    E o usuário informar "status" com valor igual a "<status>"
    E o usuário informar "observacao" com valor igual a ""
    Quando o usuário clicar no botão salvar
    Então o usuário deveria ver a mensagem "<mensagem>"

    Exemplos:
      | vara   | numero_processo | natureza | partes          | data_entrada | status     | mensagem                |
      | Osasco | 1234            | Guarda   | Lucas x Mirella | 17/12/2020   | Aguardando | salvo com sucesso       |
      |        |                 |          |                 |              |            | entidade não processada |
      | Osasco | 1234            | Guarda   | Lucas x Mirella | 17/12/2020   |            | entidade não processada |
      | Osasco | 1234            | Guarda   | Lucas x Mirella |              | Aguardando | entidade não processada |
      | Osasco | 1234            | Guarda   |                 | 17/12/2020   | Aguardando | entidade não processada |
      | Osasco | 1234            |          | Lucas x Mirella | 17/12/2020   | Aguardando | entidade não processada |
      | Osasco |                 | Guarda   | Lucas x Mirella | 17/12/2020   | Aguardando | entidade não processada |
      |        | 1234            | Guarda   | Lucas x Mirella | 17/12/2020   | Aguardando | entidade não processada |
      | Osasco | 1234            | Guarda   | Lucas x Mirella | Invalida     | Aguardando | entidade não processada |
