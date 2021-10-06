class PropertyReservation < ApplicationRecord
  belongs_to :property
  belongs_to :user
end
