class AddBulianoToChoice < ActiveRecord::Migration[5.1]
  def change
    add_column :choices, :buliano, :boolean
  end
end
