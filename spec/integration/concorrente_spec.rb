# encoding: UTF-8
require 'integration_helper'

describe 'Concorrente' do
  before do
    page.driver.header("User-Agent", "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/535.11 (KHTML, like Gecko) Chrome/17.0.963.56 Safari/535.11")
  end

  describe "Cadastro de concorrente" do
    it "fluxo completo de cadastro" do
      FactoryGirl.create(:sorteio, :nome => 'Livro de SCRUM')
      
      visit "/sorteios"
      click_link('☉')
      page.should have_content("Concorrentes:")
      click_link('+')
      fill_in('Nome', :with => 'Jonh Lennon')
      click_button('Novo')
      page.should have_content("Concorrente criado.")
      page.should have_content("Livro de SCRUM")
    end
  end
end
