object @gps_statistic => :gps_statistic

attributes :id, :kmh

node :location do |gps_statistic|
  partial('v1/gps_statistics/location', :object => gps_statistic.location)
end
