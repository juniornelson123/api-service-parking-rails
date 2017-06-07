class AddColumnDateExpireToPayments < ActiveRecord::Migration[5.1]
  def change
    add_column :payments, :date_expire, :Date
  end
end
