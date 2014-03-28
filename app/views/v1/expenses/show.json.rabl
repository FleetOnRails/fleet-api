object @expense => :expense

attributes :id, :date, :odometer, :price, :expense_type, :description, :created_at, :updated_at

node :location do |object|
  partial('v1/locations/location', :object => object.location)
end
