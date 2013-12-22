Apipie.configure do |config|
  config.app_name                = 'FleetOnRails Api'
  config.copyright               = "&copy; #{Time.now.year} FleetOnRails"
  config.default_version         = 'v1'
  config.api_base_url            = '/api'
  config.doc_base_url            = '/docs'
  config.validate                = false
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/api/v1/*.rb"
  config.app_info                = 'FleetOnRails API v1. Your Fleet On Rails.'
end
