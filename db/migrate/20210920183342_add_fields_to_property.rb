class AddFieldsToProperty < ActiveRecord::Migration[6.1]
  def change
    add_column :properties, :pets, :boolean
    add_column :properties, :daily_rate, :integer
  end
end
