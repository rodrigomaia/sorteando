# encoding: UTF-8
require "spec_helper"

describe "sorteios/show" do
  context 'se não houverem vencedores' do
    it "mostrar botão '⌘ Sortear'" do
      assign :sorteio, mock("Sorteio", :nome => 'mega sena', :concorrentes => [], :vencedores => [])
      render
      rendered.should have_content("⌘ Sortear")
    end
  end

  context 'se houverem vencedores' do
    it "não mostrar botão '⌘ Sortear'" do
      assign :sorteio, mock("Sorteio", :nome => 'mega sena', :concorrentes => [], :vencedores => [mock('Vencedor', :nome => 'Jonh Lennon'), mock('Vencedor', :nome => 'Ringo Star')])
      render
      rendered.should_not have_content("⌘ Sortear")
    end
  end

end

