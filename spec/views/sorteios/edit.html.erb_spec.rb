# encoding: UTF-8
require "spec_helper"

describe "sorteios/edit/" do
  before do
    assign :sorteio, FactoryGirl.create(:sorteio, :id => 10)
    render
  end
  
  it "verifica campos da tela" do
    rendered.should have_selector("form") do |form|
      form.should have_selector("input", :type => 'text', :name => 'sorteio[nome]')
      form.should have_selector("input", :type => 'text', :name => 'sorteio[qtd_premios]')
      form.should have_selector("input", :type => 'submit', :value => 'Editar')
    end
  end

  it "deve aparecer um link para ver o sorteio" do
    rendered.should have_selector("a", :href => '/sorteios/10')
  end
end

