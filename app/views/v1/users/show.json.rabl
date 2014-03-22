object @user => :user

attributes :id, :first_name, :last_name, :email, :username, :phone_no, :admin

node :created_at do |object|
  object.created_at.to_time.to_i
end

node :updated_at do |object|
  object.updated_at.to_time.to_i
end