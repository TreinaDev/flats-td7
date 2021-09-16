class AddParkingAreaToProperty < ActiveRecord::Migration[6.1]
  def change
    add_column :properties, :parking_slot, :boolean
  end
end
