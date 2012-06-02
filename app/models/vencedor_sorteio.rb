class VencedorSorteio < ActiveRecord::Base
  belongs_to :sorteio
  belongs_to :concorrente
end
