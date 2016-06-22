class CreatePaysWaters < ActiveRecord::Migration
  def change
    create_table :pays_waters do |t|
      t.string :number
      t.string :unit
      t.string :name
      t.string :address
      t.decimal :balance, default: 10.00
      t.boolean :deleted, default: false

      t.timestamps null: false
    end
  end
end
