object @vendor => :vendor

attributes :id, :name, :supplies

node :location do |vendor|
  partial('v1/vendors/location', :object => vendor.location)
end

node :created_at do |object|
  object.created_at.to_time.to_i
end

node :updates_at do |object|
  object.created_at.to_time.to_i
end
