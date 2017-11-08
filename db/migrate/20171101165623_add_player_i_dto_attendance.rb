class AddPlayerIDtoAttendance < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :player_id, :integer 
  end
end
