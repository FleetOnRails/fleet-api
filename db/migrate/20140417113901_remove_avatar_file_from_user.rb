class RemoveAvatarFileFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :avatar_file
  end
end
