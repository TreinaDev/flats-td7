class PropertyReservation < ApplicationRecord
  belongs_to :property
  belongs_to :user

  before_save :calculate_total_value
  validate :end_date_greater_than_start_date
  validate :start_date_in_the_future

  enum status: { pending: 5, accepted: 10, rejected: 20 }

  private

  def calculate_total_value
    self.total_value = (end_date - start_date).to_i * property.daily_rate
  end

  def end_date_greater_than_start_date
    errors.add(:end_date, 'deve ser maior que a data início') if start_date >= end_date
  end

  def start_date_in_the_future
    errors.add(:start_date, 'não pode ser em datas passadas') if start_date < Date.today
  end
end
