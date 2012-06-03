# encoding: UTF-8
require 'spec_helper'

describe ConcorrentesController do
  
  describe "GET new" do    
    before do
      Sorteio.stub(:find)
    end
    
    it "envia para tela new.html" do
      get :new, :sorteio_id => 1
      response.should be_success
      response.should render_template("concorrentes/new")
    end
    
    it "busca o sorteio pelo id" do
      Sorteio.should_receive(:find).once().with("1")
      get :new, :sorteio_id => 1
    end
    
    it "cria um concorrente e envia para a tela" do
      get :new, :sorteio_id => 1
      assigns[:concorrente].should_not be_nil
    end
    
    it "seta o sorteio encontrado no concorrente" do
      concorrente_mock = mock('Concorrente')
      Concorrente.stub(:new).and_return(concorrente_mock)
      sorteio_mock = mock('Sorteio')
      Sorteio.stub(:find).and_return(sorteio_mock)
      
      concorrente_mock.should_receive(:sorteio=).once().with(sorteio_mock)
      get :new, :sorteio_id => 1
    end
  end
  
  describe "POST create" do    
    before do
      @concorrente_mock = mock('Concorrente', :id=>1, :sorteio_id=>1)
      Concorrente.stub(:new).and_return(@concorrente_mock)
    end
    
    it "salva um concorrente" do
      @concorrente_mock.should_receive(:save)
      post :create, :sorteio_id => 1
    end
    
    context "se concorrente for salvo com sucesso" do
      before do
        @concorrente_mock.stub(:save).and_return(true)
      end
      
      it "deve enviar pra tela de apresentação do sorteio deste concorrente" do
        post :create, :sorteio_id => 1
        response.should redirect_to sorteio_path(1)
      end
      
      it "deve enviar uma notificação de Concorrente criado." do
        post :create, :sorteio_id => 1
        flash[:notice].should == "Concorrente criado."
      end
    end
    
    context "se concorrente não for salvo" do
      before do
        @concorrente_mock.stub(:save).and_return(false)
      end
      
      it "deve enviar pra tela de apresentação do sorteio deste concorrente" do
        post :create, :sorteio_id => 1
        response.should redirect_to sorteio_path(1)
      end
        
      it "deve enviar uma notificação de Houve um erro na criação do Concorrente." do
        post :create, :sorteio_id => 1
        flash[:notice].should == "Houve um erro na criação do Concorrente."
      end
    end
  end
  
  describe "DELETE destroy" do    
    before do
      @concorrente_mock = mock('Concorrente', :id=>1, :sorteio_id=>1)
      Concorrente.stub(:find).and_return(@concorrente_mock)
      @concorrente_mock.stub(:destroy)
    end
    
    it "deve apagar concorrente informado" do
      @concorrente_mock.should_receive(:destroy)
      delete :destroy, :sorteio_id => 1, :id => 1
    end
    
    it "deve enviar pra tela de apresentação do sorteio deste concorrente" do
      delete :destroy, :sorteio_id => 1, :id => 1
      response.should redirect_to sorteio_path(1)
    end
  end
  
end