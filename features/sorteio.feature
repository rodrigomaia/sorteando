# language: pt
Funcionalidade: Sorteio
  Cenário: A pagina inicial do Sistema deverá apontar para listagem de sorteios
    Dado que estou na página "/"
    Então devo ver o texto "Sorteios"
    E devo ver o texto "+"
      
  Cenário: Cadastrando um sorteio
    Dado que estou na página "/sorteios"
    Quando clicar no link "+"
    Então devo mudar a pagina
    Quando preencher o campo "Nome" com "Livro de Testes Automatizados"
    E preencher o campo "Qtd de Premios" com "1"
    E clicar no botao "Novo"
    Então devo mudar a pagina
    Então devo ver o texto "Sorteio criado."
    E devo ver o texto "Livro de Testes Automatizados"
    E devo ver o texto "Concorrentes: +"

  Cenário: Editando um sorteio
    Dado que tenho um "sorteio" com "nome" igual a "Livro de SCRUM"
    E que estou na página "/sorteios"
    Então devo ver o texto "Livro de SCRUM"
    Quando clicar no link "✎"
    Então devo mudar a pagina  
    Quando preencher o campo "Nome" com "Livro de XP, atualizado"
    E preencher o campo "Qtd de Premios" com "1"      
    E clicar no botao "Editar"
    Então devo mudar a pagina      
    E devo ver o texto "Sorteio atualizado."
    Mas não devo ver o texto "Livro de SCRUM"
    E devo ver o texto "Livro de XP"
    E devo ver o texto "Concorrentes: +"      

  Cenário: Removendo um sorteio
    Dado que tenho um "sorteio" com "nome" igual a "Livro de SCRUM"
    E que estou na página "/sorteios"
    Então devo ver o texto "Livro de SCRUM"
    Quando clicar no link "✄"
    Dado com confirmei o confirm
    Então devo mudar a pagina      
    E devo ver o texto "Sorteio removido."
    Mas não devo ver o texto "Livro de SCRUM"

  Cenário: Sorteio
    Dado que tenho um "sorteio" com campos "nome" igual a "Livro de SCRUM" e com "qtd_premios" igual a "2"
    E que tenho um "concorrente" com "nome" igual a "Jonh" no Sorteio cadastrado
    E que tenho um "concorrente" com "nome" igual a "Paul" no Sorteio cadastrado
    E que tenho um "concorrente" com "nome" igual a "George" no Sorteio cadastrado
    E que tenho um "concorrente" com "nome" igual a "Ringo" no Sorteio cadastrado
    E que estou na página "/sorteios"      
    Quando clicar no link "☉"
    Então devo mudar a pagina      
    Quando clicar no link "⌘ Sortear"
    Então devo ver o texto "Sorteio realizado."