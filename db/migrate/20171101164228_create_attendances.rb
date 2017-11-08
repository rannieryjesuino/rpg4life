class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.boolean :presenca
      t.string :justificativa
      t.integer :session_id

      t.timestamps
    end
  end
end
