class AddColumnParkingIdToVagancies < ActiveRecord::Migration[5.1]
  def change
    add_reference :vagances, :parking, foreign_key: true
  end
end
