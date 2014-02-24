object @group => :group

attributes :id, :name

node :group_members do |group|
  partial('v1/groups/member', :object => group.users)
end

node :group_cars do |group|
  partial('v1/groups/car', :object => group.cars)
end