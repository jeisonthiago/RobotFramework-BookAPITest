*** Settings ***
Documentation      SWAGGER API: https://fakerestapi.azurewebsites.net/index.html
...                Executar testes no endPoint GET  ->  /api/v1/Books
...                Executar testes no endPoint GET  ->  /api/v1/Books/{id}
Library            RequestsLibrary    

*** Variables ***
${BASE_URL}        https://fakerestapi.azurewebsites.net/api/v1/

# NOME API
${FAKER_API}       fakerAPI

*** Keywords ***
Conect API
    Create Session      ${FAKER_API}    ${BASE_URL}
    