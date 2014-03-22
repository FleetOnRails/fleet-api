object @destination => :destination

attributes :id, :name

node :location do |destination|
  partial('v1/destinations/location', :object => destination.location)
end

node :created_at do |object|
  object.created_at.to_time.to_i
end

node :updated_at do |object|
  object.updated_at.to_time.to_i
end