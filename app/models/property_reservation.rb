class PropertyReservation < ApplicationRecord
  belongs_to :property
  belongs_to :user

  before_save :calculate_total_value

  private

  def calculate_total_value
    self.total_value = (end_date - start_date).to_i * property.daily_rate
  end
end
