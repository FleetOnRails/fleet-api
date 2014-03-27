object @destination => :destination

attributes :id, :name, :created_at, :updated_at

node :location do |object|
  partial('v1/locations/location', :object => object.location)
end
