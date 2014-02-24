object @group => :group

attributes :id, :name

node :members do |group|
  partial('v1/groups/user', :object => group.users)
end