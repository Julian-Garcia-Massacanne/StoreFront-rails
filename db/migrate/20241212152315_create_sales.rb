class CreateSales < ActiveRecord::Migration[8.0]
  def change
    create_table :sales do |t|
      t.datetime :date, null: false
      t.decimal :total, precision: 10, scale: 2, null: false
      t.references :user, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.string :state, default: "activa", null: false

      t.timestamps
    end
  end
end
