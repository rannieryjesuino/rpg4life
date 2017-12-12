class CreateChoices < ActiveRecord::Migration[5.1]
  def change
    create_table :choices do |t|
      t.string :opcao

      t.timestamps
    end
  end
end
