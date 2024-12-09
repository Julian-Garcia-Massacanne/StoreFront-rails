class AddFieldsToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :username, :string
    add_index :users, :username, unique: true
    add_column :users, :phone, :string
    add_column :users, :entry_date, :date
  end
end
