class RemoveColumnHourToPrices < ActiveRecord::Migration[5.1]
  def change
    remove_column :prices, :hour, :string
    remove_column :prices, :price, :string
  end
end
