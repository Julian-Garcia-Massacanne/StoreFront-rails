class CreateClients < ActiveRecord::Migration[8.0]
  def change
    create_table :clients do |t|
      t.string :name, null: false
      t.string :lastname, null: false
      t.string :dni, null: false
      t.string :phone, null: false

      t.timestamps
    end

    add_index :clients, :dni, unique: true
  end
end
