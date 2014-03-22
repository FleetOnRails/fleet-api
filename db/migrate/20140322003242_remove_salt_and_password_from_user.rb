class RemoveSaltAndPasswordFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :salt
    remove_column :users, :password
  end
end
