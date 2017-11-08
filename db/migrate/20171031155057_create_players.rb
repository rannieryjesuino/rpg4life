class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :nome
      t.string :personagem

      t.timestamps
    end
  end
end
