class BringFileSizesUpToDate < ActiveRecord::Migration
  def self.up
    Document.all.each do |document|
      document.file_size = File.size("#{Rails.root}/public#{document.document.url}")
      puts document.file_size
      document.save!
    end
  end

  def self.down
  end
end
