class CreateVencedoresSorteios < ActiveRecord::Migration
  def change
    create_table :vencedores_sorteios do |t|
      t.integer :concorrente_id
      t.integer :sorteio_id
      t.timestamps
    end
  end
end
