class InitialMigration < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :phone_no
      t.string :password
      t.string :salt
      t.boolean :admin

      t.timestamps
    end

    create_table :groups do |t|
      t.string :name

      t.timestamps
    end

    create_table :groups_users do |t|
      t.integer :group_id
      t.integer :user_id
    end
  end
end
