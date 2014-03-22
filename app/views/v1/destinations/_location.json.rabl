object @location

attributes :id, :latitude, :longitude, :address, :city, :county, :country

node :created_at do |object|
  object.created_at.to_time.to_i
end

node :updated_at do |object|
  object.updated_at.to_time.to_i
end