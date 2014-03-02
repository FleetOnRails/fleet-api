object @service_record => :service_record

attributes :id, :odometer_reading, :technician, :description

node :location do |gps_statistic|
  partial('v1/service_records/location', :object => gps_statistic.location)
end