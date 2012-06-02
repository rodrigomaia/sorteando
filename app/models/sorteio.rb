# encoding: UTF-8
class Sorteio < ActiveRecord::Base
  validates_presence_of :nome, :message => "é um campo obrigatório"
  validates_presence_of :qtd_premios, :message => "é um campo obrigatório"
  
  has_many :concorrentes, :dependent => :destroy
  has_many :vencedores_sorteios, :class_name => 'VencedorSorteio', :dependent => :destroy
  has_many :vencedores, :through => :vencedores_sorteios, :source => :concorrente

  def sortear
    concorrentes = Concorrente.where(:sorteio_id => self.id).map{|x| x.id}
    [self.qtd_premios, concorrentes.size].min.times do
      vencedor = concorrentes.sample
      concorrentes.delete(vencedor)
      self.vencedores << Concorrente.find(vencedor)
    end
    self.save!
  end
end
