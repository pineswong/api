class CreateShortensShortens < ActiveRecord::Migration
  def change
    create_table :shortens_shortens do |t|
      t.string :short
      t.string :url
      t.integer :count, default: 0

      t.timestamps null: false
    end
  end
end
