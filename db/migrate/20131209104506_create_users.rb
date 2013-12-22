class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.string :salt
      t.string :phone_no
      t.integer :group_id
      t.integer :permission_level
      t.string :username
      t.boolean :admin

      t.timestamps
    end
  end
end
