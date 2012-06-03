# encoding: UTF-8
require 'spec_helper'

describe Concorrente do
  describe "Validations" do
    it { should validate_presence_of(:nome).with_message(/é um campo obrigatório/) }
  end
  
  describe "#eh_vencedor?" do
    it "Se não venceu o sorteio, retorna verdadeiro" do
      sorteio = FactoryGirl.create(:sorteio)
      concorrente = FactoryGirl.create(:concorrente, :sorteio => sorteio)
    
      concorrente.eh_vencedor?.should == false
    end
    
    it "Se venceu o sorteio, retorna verdadeiro" do
      sorteio = FactoryGirl.create(:sorteio)
      concorrente = FactoryGirl.create(:concorrente, :sorteio => sorteio)
      sorteio.vencedores << concorrente
      sorteio.save
    
      concorrente.eh_vencedor?.should == true
    end
  end
end