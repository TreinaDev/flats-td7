class AddCodeToPropertyReservation < ActiveRecord::Migration[6.1]
  def change
    add_column :property_reservations, :code, :string
    add_index :property_reservations, :code, unique: true
  end
end
