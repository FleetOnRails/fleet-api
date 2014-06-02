class UpdateGravatarsForUsers < ActiveRecord::Migration
  def self.up
    User.all.each do |user|
      user.gravatar_hash = Digest::MD5.hexdigest(user.email)
      puts "updated gravatar for #{user.first_name} #{user.last_name} #{user.gravatar_hash}"
      user.save!
    end
  end

  def self.down
  end
end
