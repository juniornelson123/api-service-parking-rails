class AddStatusToParkings < ActiveRecord::Migration[5.1]
  def change
    add_column :parkings, :status, :integer
  end
end
