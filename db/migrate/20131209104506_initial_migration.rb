class InitialMigration < ActiveRecord::Migration
  def change
    ###
    # Models
    ###
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :phone_no
      t.boolean :admin
      t.string :avatar_file
      t.text :avatar, limit: 100.kilobytes

      ## Database authenticatable
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string :current_sign_in_ip
      t.string :last_sign_in_ip

      ## Lockable
      t.integer :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      t.string :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at

      t.timestamps
    end

    create_table :groups do |t|
      t.string :name
      t.string :avatar_file
      t.text :avatar, limit: 100.kilobytes

      t.timestamps
    end

    create_table :diagnostic_statistics do |t|
      t.float :kmh
      t.float :rpm
      t.float 'l/100km'
      t.belongs_to :car

      t.timestamps
    end

    create_table :diagnostic_faults do |t|
      t.string :fault_code
      t.boolean :status
      t.belongs_to :car

      t.timestamps
    end

    create_table :expenses do |t|
      t.timestamp :date
      t.float :odometer
      t.float :price
      t.string :expense_type
      t.text :description
      t.belongs_to :car

      t.timestamps
    end

    create_table :reminders do |t|
      t.timestamp :date
      t.float :odometer
      t.string :reminder_type
      t.text :description
      t.belongs_to :car

      t.timestamps
    end

    create_table :gps_statistics do |t|
      t.float :kmh
      t.belongs_to :car

      t.timestamps
    end

    create_table :fuel_entries do |t|
      t.float :odometer
      t.float :liters
      t.float :price
      t.string :fuel_type
      t.string :filling_station
      t.boolean :filled_tank
      t.text :comment
      t.belongs_to :car

      t.timestamps
    end

    ###
    # Polymorphic Models
    ###
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.string :registration
      t.string :avatar_file
      t.text :avatar, limit: 100.kilobytes
      t.references :owner, polymorphic: true

      t.timestamps
    end

    create_table :destinations do |t|
      t.string :name
      t.references :destinationable, polymorphic: true

      t.timestamps
    end

    create_table :documents do |t|
      t.string :title
      t.string :file
      t.text :data, limit: 16.megabytes
      t.references :documentable, polymorphic: true

      t.timestamps
    end

    create_table :locations do |t|
      t.float :latitude
      t.float :longitude
      t.string :address
      t.string :city
      t.string :county
      t.string :country
      t.references :locationable, polymorphic: true

      t.timestamps
    end

    create_table :vendors do |t|
      t.string :name
      t.string :supplies
      t.references :venderable, polymorphic: true

      t.timestamps
    end

    create_table :products do |t|
      t.string :name
      t.float :price
      t.string :part_no
      t.references :productable, polymorphic: true

      t.timestamps
    end

    ###
    # Join Models
    ###
    create_table :user_groups do |t|
      t.integer :group_access
      t.belongs_to :group
      t.belongs_to :user

      t.timestamps
    end

    ###
    # Indexes
    ###
    add_index :users, :email, unique: true, using: :btree
    add_index :users, :reset_password_token, unique: true, using: :btree
    add_index :users, :unlock_token, unique: true, using: :btree
    add_index :diagnostic_statistics, :car_id, name: :diagnostic_statistics_ix, using: :btree
    add_index :diagnostic_faults, :car_id, name: :diagnostics_fault_ix, using: :btree
    add_index :expenses, :car_id, name: :expenses_ix, using: :btree
    add_index :reminders, :car_id, name: :reminders_ix, using: :btree
    add_index :gps_statistics, :car_id, name: :gps_statistics_ix, using: :btree
    add_index :fuel_entries, :car_id, name: :fuel_entries_ix, using: :btree

    add_index :cars, [:owner_id, :owner_type], name: :cars_ix, using: :btree
    add_index :destinations, [:destinationable_id, :destinationable_type], name: :destinations_ix, using: :btree
    add_index :documents, [:documentable_id, :documentable_type], name: :documents_ix, using: :btree
    add_index :locations, [:locationable_id, :locationable_type], name: :locations_ix, using: :btree
    add_index :vendors, [:venderable_id, :venderable_type], name: :vendors_ix, using: :btree
    add_index :products, [:productable_id, :productable_type], name: :products_ix, using: :btree

    add_index :user_groups, [:group_id, :user_id], name: :user_groups_ix, using: :btree
  end
end
