class RemoveColumnLatToAddresses < ActiveRecord::Migration[5.1]
  def change
    remove_column :addresses, :lat, :string
    remove_column :addresses, :lng, :string
  end
end
