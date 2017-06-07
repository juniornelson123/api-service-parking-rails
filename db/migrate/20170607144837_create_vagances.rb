class CreateVagances < ActiveRecord::Migration[5.1]
  def change
    create_table :vagances do |t|
      t.integer :status
      t.integer :number

      t.timestamps
    end
  end
end
