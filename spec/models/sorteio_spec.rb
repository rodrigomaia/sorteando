# encoding: UTF-8
require 'spec_helper'

describe Sorteio do
  describe "Validations" do
    it { should validate_presence_of(:nome).with_message(/é um campo obrigatório/) }
    it { should validate_presence_of(:qtd_premios).with_message(/é um campo obrigatório/) }
  end
  
  describe "#sortear" do    
    before do
      @sorteio = FactoryGirl.create(:sorteio, :qtd_premios => 2)
      conc1 = FactoryGirl.create(:concorrente, :sorteio => @sorteio)
      conc2 = FactoryGirl.create(:concorrente, :sorteio => @sorteio)
      conc3 = FactoryGirl.create(:concorrente, :sorteio => @sorteio)
    end
    
    it "quando sortear, gravar os vencedores" do
      concorrentes = Concorrente.where(:sorteio_id => @sorteio.id)
      @sorteio.sortear
      
      @sorteio.vencedores.each do |vencedor|
        concorrentes.map(&:id).should include(vencedor.id)
      end
    end
    
    it "sortear somente a quantidade de prêmios" do
      @sorteio.sortear
      @sorteio.vencedores.should have(@sorteio.qtd_premios).vencedores  
    end
    
    it "sortear com quantidade menor que a quantidade de prêmios" do
      sorteio = FactoryGirl.create(:sorteio, :qtd_premios => 3)
      conc1 = FactoryGirl.create(:concorrente, :sorteio => sorteio)
      conc2 = FactoryGirl.create(:concorrente, :sorteio => sorteio)
      
      sorteio.sortear
      sorteio.vencedores.should have(2).vencedores  
    end
    
    it "se apagar o sorteio, devem ser apagados os concorrentes" do
      sorteio = FactoryGirl.create(:sorteio)
      conc1 = FactoryGirl.create(:concorrente, :sorteio => sorteio)
      conc2 = FactoryGirl.create(:concorrente, :sorteio => sorteio)
   
      Concorrente.where(:sorteio_id => sorteio.id).should have(2).concorrentes
      sorteio.destroy
      Concorrente.where(:sorteio_id => sorteio.id).should have(:no).concorrentes      
    end
    
    it "se apagar o sorteio, devem ser apagados os vencedores" do
      sorteio = FactoryGirl.create(:sorteio, :qtd_premios => 2)
      conc1 = FactoryGirl.create(:concorrente, :sorteio => sorteio)
      conc2 = FactoryGirl.create(:concorrente, :sorteio => sorteio)
      
      sorteio.sortear
      
      VencedorSorteio.where(:sorteio_id => sorteio.id).should have(2).vencedores
      sorteio.destroy
      VencedorSorteio.where(:sorteio_id => sorteio.id).should have(:no).concorrentes      
   end   
  end
  
end