class AddFileSizeToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :file_size, :float
  end
end
