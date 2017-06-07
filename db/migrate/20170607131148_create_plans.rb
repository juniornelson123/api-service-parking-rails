class CreatePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :plans do |t|
      t.string :name
      t.float :value
      t.string :description

      t.timestamps
    end
  end
end
