object @fuel_entry => :fuel_entry

attributes :id, :odometer, :liters, :price, :fuel_type, :filling_station, :filled_tank, :comment

node :location do |fuel_entry|
  partial('v1/fuel_entries/location', :object => fuel_entry.location)
end
