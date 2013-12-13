Apipie.configure do |config|
  config.app_name                = 'FleetOnRails Api'
  config.app_info                = 'FleetOnRails API v1. Your Fleet On Rails.'
  config.doc_base_url            = '/apipie'
  config.api_base_url            = '/api_docs/v1'
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/api_docs/v1/*.rb"
end
