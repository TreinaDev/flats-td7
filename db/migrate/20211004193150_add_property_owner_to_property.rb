class AddPropertyOwnerToProperty < ActiveRecord::Migration[6.1]
  def change
    add_reference :properties, :property_owner, null: false, foreign_key: true
  end
end
