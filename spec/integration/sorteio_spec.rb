# encoding: UTF-8
require 'integration_helper'

describe 'Sorteio' do
  before do
    page.driver.header("User-Agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11")
  end

  describe "Pagina inicial" do
    it "Direcionar para Listagem de Sorteios no #home" do
      visit "/"
      page.should have_content("Sorteios")
      page.should have_content("+")
    end
  end
  
  describe "CRUD de Sorteio" do
    it "fluxo completo de cadastro" do
      visit "/sorteios"
      click_link('+')
      fill_in('Nome',           :with => 'Livro de Testes Automatizados')
      fill_in('Qtd de Premios', :with => '1')
      click_button('Novo')
      page.should have_content("Sorteio criado.")
      page.should have_content("Livro de Testes Automatizados")
      page.should have_content("Concorrentes: +")
    end

    it "fluxo completo de edição" do
      FactoryGirl.create(:sorteio, :nome => 'Livro de SCRUM')
      
      visit "/sorteios"
      page.should have_content("Livro de SCRUM")
      click_link('✎')
      fill_in('Nome',           :with => 'Livro de XP, atualizado')
      fill_in('Qtd de Premios', :with => '1')
      click_button('Editar')
      page.should have_content("Sorteio atualizado.")
      page.should_not have_content("Livro de SCRUM")
      page.should have_content("Livro de XP")
      page.should have_content("Concorrentes: +")
    end

    it "fluxo completo de remoção", :js => true do
      FactoryGirl.create(:sorteio, :nome => 'Livro de SCRUM')
      
      visit "/sorteios"
      page.should have_content("Livro de SCRUM")
      click_link('✄')
      page.evaluate_script('window.confirm = function() { return true; }')
      page.should have_content("Sorteio removido.")
      page.should_not have_content("Livro de SCRUM")
    end
  end
  
  describe "fluxo do Sorteio" do
    it "deveria sortear" do
      sorteio = FactoryGirl.create(:sorteio, :nome => 'Livro de SCRUM', :qtd_premios => 2)
      FactoryGirl.create(:concorrente, :nome => 'Jonh',   :sorteio => sorteio)
      FactoryGirl.create(:concorrente, :nome => 'Paul',   :sorteio => sorteio)
      FactoryGirl.create(:concorrente, :nome => 'George', :sorteio => sorteio)
      FactoryGirl.create(:concorrente, :nome => 'Ringo',  :sorteio => sorteio)
      
      visit "/sorteios"
      click_link('☉')
      click_link('⌘ Sortear')
      page.should have_content("Sorteio realizado.")
    end
  end
end
