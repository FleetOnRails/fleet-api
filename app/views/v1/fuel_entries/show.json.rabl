object @fuel_entry => :fuel_entry

attributes :id, :odometer, :liters, :price, :fuel_type, :date, :filling_station,
           :filled_tank, :comment, :created_at, :updated_at

node :location do |object|
  partial('v1/locations/location', :object => object.location)
end
