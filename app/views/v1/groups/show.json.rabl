object @group => :group

attributes :id, :name, :created_at, :updated_at

node :avatar_url do |group|
  group.avatar.url
end

node :location do |object|
  partial('v1/locations/location', :object => object.location)
end