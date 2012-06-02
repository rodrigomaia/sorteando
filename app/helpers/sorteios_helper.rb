module SorteiosHelper
  def sorteio_encerrado?(sorteio)
    sorteio.vencedores.any?
  end

end
