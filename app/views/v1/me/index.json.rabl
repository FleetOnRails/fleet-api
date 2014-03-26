object @current_user => :me

attributes :id, :first_name, :last_name, :email, :username, :phone_no, :admin,
           :sign_in_count, :failed_attempts, :last_sign_in_ip, :current_sign_in_ip

node :avatar do |user|
  user.avatar.url
end

node :current_sign_in_at do |object|
  object.current_sign_in_at.to_time.to_i
end

node :last_sign_in_at do |object|
  object.last_sign_in_at.to_time.to_i
end

node :created_at do |object|
  object.created_at.to_time.to_i
end

node :updated_at do |object|
  object.updated_at.to_time.to_i
end