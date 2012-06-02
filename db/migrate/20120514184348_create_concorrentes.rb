class CreateConcorrentes < ActiveRecord::Migration
  def change
    create_table :concorrentes do |t|
      t.string :nome
      t.string :email
      t.integer :sorteio_id
      t.timestamps
    end
  end
end
