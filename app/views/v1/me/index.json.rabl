object @current_user => :me

attributes :id, :first_name, :last_name, :email, :username, :phone_no, :admin

node :avatar do |user|
  user.avatar.media.url
end

node :avatar_thumb do |user|
  user.avatar.media.thumb.url
end
