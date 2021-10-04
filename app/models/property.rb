class Property < ApplicationRecord
  belongs_to :property_type
  belongs_to :property_owner

  validates :title, :description, :rooms, :bathrooms, :daily_rate,
            presence: true
end


