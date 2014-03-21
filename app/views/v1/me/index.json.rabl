object @current_user => :me

attributes :id, :first_name, :last_name, :email, :username, :phone_no, :admin

node :avatar do |user|
  user.avatar.url
end

node :avatar_thumb do |user|
  user.avatar.thumb.url
end

node :created_at do |object|
  object.created_at.to_time.to_i
end

node :updates_at do |object|
  object.created_at.to_time.to_i
end