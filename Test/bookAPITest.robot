*** Settings ***
Documentation      SWAGGER API: https://fakerestapi.azurewebsites.net/index.html
...                Executar testes no endPoint GET  ->  /api/v1/Books
...                Executar testes no endPoint GET  ->  /api/v1/Books/{id}
Resource           ../Conect/conectAPI.robot
Resource           ../Service/bookServiceAPI.robot
Suite Setup        Conect API

*** Variables ***
#Status Code    
${CODE_200}    200

#Variáveis
${ID_BOOK}     89

*** Test Cases ***
bookServiceAPI_GET: Listar todos os livros
    [Tags]   GET_todos_os_livros
    Dado que faço uma busca por todos os livros cadastrado chamando o endpoint books
    Então recebo o status code de 200     ${CODE_200}

bookServiceAPI_GET: Listar apenas um livro
    [Tags]    GET_apenas_um_livro
    Dado que faço a chamada para o endpoint books/id e trago um livro cadastrado     ${ID_BOOK}
    Então recebo o status code de 200     ${CODE_200}

bookServiceAPI_GET: Listar numero de autores
    [Tags]    GET_numero_de_autores
    Dado que faço a chamada para o serviço books/id para validar numero de autores   ${ID_BOOK}
    Então recebo o status code de 200     ${CODE_200}



