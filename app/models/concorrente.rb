# encoding: UTF-8
class Concorrente < ActiveRecord::Base
  validates_presence_of :nome, :message => "é um campo obrigatório"
  belongs_to :sorteio
  
  def eh_vencedor?
    VencedorSorteio.where(:concorrente_id => self).exists?
  end
end
