class ChangeDailyRateToDecimal < ActiveRecord::Migration[6.1]
  def change
    change_column :properties, :daily_rate, :decimal
  end
end
