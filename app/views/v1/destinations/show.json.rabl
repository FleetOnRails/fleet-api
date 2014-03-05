object @destination => :destination

attributes :id, :name

node :location do |destination|
  partial('v1/destinations/location', :object => destination.location)
end