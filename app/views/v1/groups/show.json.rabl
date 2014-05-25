object @group => :group

attributes :id, :name, :description, :created_at, :updated_at, :avatar

node :location do |object|
  partial('v1/locations/location', :object => object.location)
end