# # encoding: UTF-8
# require 'spec_helper'
# 
# describe SorteiosController do
#   
#   describe "GET sortear" do
#     before do
#       @sorteio = mock('Sorteio')
#       @sorteio.stub(:sortear)
#       Sorteio.stub(:find).and_return(@sorteio)
#     end
#     
#     it "deve direcionar para a apresentação do sorteio" do
#       get :sortear, :id => 1
#       response.should redirect_to(sorteio_path(1))
#     end    
# 
#     it "deve mostrar mensagem de sorteio realizado" do
#       get :sortear, :id => 1
#       flash[:notice].should == "Sorteio realizado."
#     end
#     
#     it "deve realizar o sorteio" do
#       @sorteio.should_receive(:sortear)
#       get :sortear, :id => 1
#     end
#   end
#   
#   describe "GET index" do        
#     before do
#       Sorteio.stub(:all).and_return([])
#     end
#     
#     it "envia para tela index.html" do
#       get :index
#       response.should be_success
#       response.should render_template("sorteios/index")
#     end
#     
#     it "cria um sorteio para enviar para tela" do
#       get :index
#       assigns[:sorteios].should_not be_nil
#     end
# 
#     it "popula sorteio com todos os sorteios" do
#       sorteios = [mock('Sorteio'), mock('Sorteio')]
#       Sorteio.should_receive(:all).and_return(sorteios)
#       get :index
#       assigns[:sorteios].should == sorteios
#     end
#   end
# 
#   describe "GET show" do        
#     before do
#       Sorteio.stub(:find).and_return(mock)
#     end
#     
#     it "envia para tela show.html" do
#       get :show, :id => 1
#       response.should be_success
#       response.should render_template("sorteios/show")
#     end
#     
#     it "cria um sorteio para enviar para tela" do
#       get :show, :id => 1
#       assigns[:sorteio].should_not be_nil
#     end
# 
#     it "popula sorteio com o sorteio enviado" do
#       sorteio = mock('Sorteio')
#       Sorteio.should_receive(:find).with('1').and_return(sorteio)
#       get :show, :id => 1
#       assigns[:sorteio].should == sorteio
#     end
#   end
#   
#   describe "GET new" do        
#     before do
#       Sorteio.stub(:new).and_return(mock)
#     end
#     
#     it "envia para tela new.html" do
#       get :new
#       response.should be_success
#       response.should render_template("sorteios/new")
#     end
#     
#     it "cria um sorteio para enviar para tela" do
#       get :new
#       assigns[:sorteio].should_not be_nil
#     end
#   end
# 
#   describe "GET edit" do        
#     before do
#       Sorteio.stub(:find).and_return(mock)
#     end
#     
#     it "envia para tela edit.html" do
#       get :edit, :id => 1
#       response.should be_success
#       response.should render_template("sorteios/edit")
#     end
#     
#     it "cria um sorteio para enviar para tela" do
#       get :edit, :id => 1
#       assigns[:sorteio].should_not be_nil
#     end
# 
#     it "popula sorteio com o sorteio enviado" do
#       sorteio = mock('Sorteio')
#       Sorteio.should_receive(:find).with('1').and_return(sorteio)
#       get :edit, :id => 1
#       assigns[:sorteio].should == sorteio
#     end
#   end
# 
#   describe "POST create" do    
#         
#     it "salva um sorteio" do
#       Sorteio.any_instance.should_receive(:save).and_return(true)
#       post :create, :id => 1
#     end
#     
#     context "se sorteio for salvo com sucesso" do
#       before do
#         Sorteio.any_instance.stub(:save).and_return(true)
#       end
#       
#       it "deve enviar pra tela de sorteios" do
#         post :create, :id => 1
#         response.should redirect_to sorteios_path
#       end
#       
#       it "deve enviar uma notificação de Sorteio criado." do
#         post :create, :id => 1
#         flash[:notice].should == "Sorteio criado."
#       end
#     end
#     
#     context "se sorteio não for salvo" do
#       before do
#         Sorteio.any_instance.stub(:save).and_return(false)
#       end
#       
#       it "deve enviar pra tela de novo sorteio" do
#         post :create, :id => 1
#         response.should render_template("sorteios/new")
#       end
#     end
#   end
# 
#   describe "PUT update" do    
#     before do
#       @sorteio = Sorteio.new
#       Sorteio.stub(:find).and_return(@sorteio)
#     end
#         
#     it "atualiza um sorteio" do
#       @sorteio.should_receive(:update_attributes).and_return(true)
#       put :update, :id => 1
#     end
#     
#     context "se sorteio for atualizado com sucesso" do
#       before do
#         @sorteio.stub(:update_attributes).and_return(true)
#       end
#       
#       it "deve enviar pra tela de sorteios" do
#         post :update, :id => 1
#         response.should redirect_to sorteios_path
#       end
#       
#       it "deve enviar uma notificação de Sorteio atualizado." do
#         post :update, :id => 1
#         flash[:notice].should == "Sorteio atualizado."
#       end
#     end
#     
#     context "se sorteio não for atualizado" do
#       before do
#         @sorteio.stub(:update_attributes).and_return(false)
#       end
#       
#       it "deve enviar pra tela de edição do sorteio" do
#         post :update, :id => 1
#         response.should render_template("sorteios/edit")
#       end
#     end
#   end
#   
#   describe "DELETE destroy" do    
#     before do
#       @sorteio = mock('Sorteio', :id=>1)
#       Sorteio.stub(:find).and_return(@sorteio)
#       @sorteio.stub(:destroy)
#     end
#     
#     it "deve apagar sorteio informado" do
#       @sorteio.should_receive(:destroy)
#       delete :destroy, :id => 1
#     end
#     
#     it "deve enviar pra tela de listagem de sorteios" do
#       delete :destroy, :id => 1
#       response.should redirect_to(sorteios_url)
#     end
#   end
#   
# end