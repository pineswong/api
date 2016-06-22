class CreatePaysUsers < ActiveRecord::Migration
  def change
    create_table :pays_users do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.string :phone
      t.string :remember_digest
      t.string :authentication_token
      t.boolean :deleted, default: false
      t.boolean :admin, default: false

      t.timestamps null: false
    end
  end
end
