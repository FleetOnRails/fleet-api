object @vendor => :vendor

attributes :id, :name, :supplies

node :location do |vendor|
  partial('v1/vendors/location', :object => vendor.location)
end
