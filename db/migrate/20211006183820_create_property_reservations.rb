class CreatePropertyReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :property_reservations do |t|
      t.date :start_date
      t.date :end_date
      t.integer :guests
      t.decimal :total_value
      t.references :property, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
