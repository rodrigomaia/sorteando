class CreateSorteios < ActiveRecord::Migration
  def change
    create_table :sorteios do |t|
      t.string :nome
      t.integer :qtd_premios
      t.timestamps
    end
  end
end
