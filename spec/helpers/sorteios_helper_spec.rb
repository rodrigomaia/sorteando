# encoding: UTF-8
require 'spec_helper'

describe SorteiosHelper do

	describe "#sorteio_encerrado?" do
    it "deveria retornar false quando não houverem vencedores" do
      sorteio = mock('Sorteio', :vencedores => [])
			sorteio_encerrado?(sorteio).should be_false
		end
    
		it "deveria retornar true quando houverem vencedores" do
      sorteio = mock('Sorteio', :vencedores => [1])
			sorteio_encerrado?(sorteio).should be_true
		end    
	end
  
end