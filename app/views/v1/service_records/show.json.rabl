object @service_record => :service_record

attributes :id, :odometer_reading, :technician, :description, :created_at, :updated_at

node :location do |object|
  partial('v1/locations/location', :object => object.location)
end
