*** Settings ***
Documentation      SWAGGER API: https://fakerestapi.azurewebsites.net/index.html
...                Executar testes no endPoint GET  ->  /api/v1/Books
...                Executar testes no endPoint GET  ->  /api/v1/Books/{id}
Library            RequestsLibrary
Library            Collections

*** Variables ***
# NOME API
${FAKER_API}              fakerAPI

# ESTRUTURA E ENDPOINT
${ENDPOINT_BOOKS}         Books
${ENDPOINT_BOOKS_ID}      Books/89
${AUTHORS_BOOKS}          /api/v1/Authors/authors/books
${BARRA}                  /             

*** Keywords ***
Dado que faço uma busca por todos os livros cadastrado chamando o endpoint books
    ${res}=            GET On Session    
    ...                ${FAKER_API}    
    ...                ${ENDPOINT_BOOKS}  
    Set Test Variable  ${res}
    log                ${res.text}
    [Return]    ${res}

Dado que faço a chamada para o endpoint books/id e trago um livro cadastrado
    [arguments]        ${ID_BOOK}
    ${res}=            GET On Session    
    ...                ${FAKER_API}
    ...                ${ENDPOINT_BOOKS_ID}
    ...                ${ID_BOOK}  
    Set Test Variable  ${res}
    log                ${res.text}
    [Return]    ${res}

Dado que faço a chamada para o serviço books/id para validar numero de autores
    [arguments]        ${ID_BOOK}
    ${res}=            GET On Session    
    ...                ${FAKER_API}      
    ...                ${AUTHORS_BOOKS} 
    ...                ${ID_BOOK}
    Set Test Variable  ${res}
    log                ${res.text}

Então recebo o status code de 200
    [arguments]                   ${CODE_200}
    Should Be Equal As Strings    ${res.status_code}    ${CODE_200}












