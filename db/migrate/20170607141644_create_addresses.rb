class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :cep
      t.string :district
      t.string :number
      t.string :complement
      t.string :lat
      t.string :lng
      t.integer :addressable_id
      t.string :addressable_type

      t.timestamps
    end
  end
end
