class AddColumnHourToPrices < ActiveRecord::Migration[5.1]
  def change
    add_column :prices, :hour, :float
    add_column :prices, :price, :float
  end
end
