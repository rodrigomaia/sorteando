# language: pt
Funcionalidade: Concorrente
  Cenário: Cadastrando um concorrente
    Dado que tenho um "sorteio" com "nome" igual a "Livro de SCRUM"
    E que estou na página "/sorteios"
    Quando clicar no link "☉"
    Então devo mudar a pagina
    Então devo ver o texto "Concorrentes:"
    Quando clicar no link "+"
    Então devo mudar a pagina
    Quando preencher o campo "Nome" com "Jonh Lennon"
    E clicar no botao "Novo"
    Então devo mudar a pagina
    Então devo ver o texto "Concorrente criado."
    E devo ver o texto "Livro de SCRUM"