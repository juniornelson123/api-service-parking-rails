class CreatePrices < ActiveRecord::Migration[5.1]
  def change
    create_table :prices do |t|
      t.string :hour
      t.string :price
      t.references :parking, foreign_key: true

      t.timestamps
    end
  end
end
