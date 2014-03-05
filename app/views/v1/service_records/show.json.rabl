object @service_record => :service_record

attributes :id, :odometer_reading, :technician, :description

node :location do |service_record|
  partial('v1/service_records/location', :object => service_record.location)
end