class RemoveColumnDateExpireToPayments < ActiveRecord::Migration[5.1]
  def change
    remove_column :payments, :date_expire, :string
  end
end
