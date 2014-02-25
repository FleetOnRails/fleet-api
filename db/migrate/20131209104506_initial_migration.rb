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
      t.string :avatar

      t.timestamps
    end

    create_table :groups do |t|
      t.string :name

      t.timestamps
    end

    create_table :cars do |t|
      t.string :make
      t.string :model
      t.string :registration
      t.integer :owner_id
      t.string  :owner_type

      t.timestamps
    end

    create_table :diagnostic_statistics do |t|
      t.float :mph
      t.float :rpm
      t.float :mpg
      t.belongs_to :car

      t.timestamps
    end

    create_table :diagnostic_problems do |t|
      t.string :fault_code
      t.belongs_to :car

      t.timestamps
    end

    create_table :documents do |t|
      t.string :name
      t.string :documentable_id
      t.string :documentable_type

      t.timestamps
    end

    create_table :user_groups do |t|
      t.belongs_to :group
      t.belongs_to :user

      t.timestamps
    end

  end
end
