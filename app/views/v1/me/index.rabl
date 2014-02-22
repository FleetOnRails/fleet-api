object @current_user => :me

attributes :id, :first_name, :last_name, :email, :username, :phone_no, :admin

node :cars do |user|
  partial('v1/me/car', :object => user.cars)
end

node :groups do |user|
  partial('v1/me/group', :object => user.groups)
end