# encoding: UTF-8

Dado /^que estou na página "(.*?)"$/ do |pagina|
  visit pagina
end

Então /^devo ver o texto "(.*?)"$/ do |texto|
  page.should have_content(texto)
end

Então /^não devo ver o texto "(.*?)"$/ do |texto|
  page.should_not have_content(texto)
end

Quando /^clicar no link "(.*?)"$/ do |link|
  click_link(link)
end

Quando /^clicar no botao "(.*?)"$/ do |botao|
  click_button(botao)
end
 
Quando /^preencher o campo "(.*?)" com "(.*?)"$/ do |campo, valor|
  fill_in(campo, :with => valor)
end

Dado /^que tenho um "(.*?)" com "(.*?)" igual a "(.*?)"$/ do |entidade, campo, valor|
  FactoryGirl.create(entidade.to_sym, campo.to_sym => valor)
end

Dado /^que tenho um "(.*?)" com campos "(.*?)" igual a "(.*?)" e com "(.*?)" igual a "(.*?)"$/ do |entidade, campo1, valor1, campo2, valor2|
  FactoryGirl.create(entidade.to_sym, campo1.to_sym => valor1, campo2.to_sym => valor2)
end

Dado /^que tenho um "(.*?)" com "(.*?)" igual a "(.*?)" no Sorteio cadastrado$/ do |entidade, campo, valor|
  FactoryGirl.create(entidade.to_sym, campo.to_sym => valor, :sorteio => Sorteio.first)
end

Dado /^com confirmei o confirm$/ do
  page.evaluate_script('window.confirm = function() { return true; }')  
end

Então /^devo mudar a pagina$/ do
  true
end
