object @vendor => :vendor

attributes :id, :name, :type

node :location do |vendor|
  partial('v1/vendors/location', :object => vendor.location)
end
