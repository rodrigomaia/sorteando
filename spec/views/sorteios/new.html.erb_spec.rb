# encoding: UTF-8
require "spec_helper"

describe "sorteios/new" do
  it "verifica campos da tela" do
    assign :sorteio, FactoryGirl.create(:sorteio)
    render
    rendered.should have_selector("form") do |form|
      form.should have_selector("input", :type => 'text', :name => 'sorteio[nome]')
      form.should have_selector("input", :type => 'text', :name => 'sorteio[qtd_premios]')
      form.should have_selector("input", :type => 'submit', :value => 'Novo')
    end
  end
end

