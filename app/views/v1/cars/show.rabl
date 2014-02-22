object @car => :cars

attributes :id, :make, :model, :registration

node :drivers do |car|
  partial('v1/cars/user', :object => car.users)
end