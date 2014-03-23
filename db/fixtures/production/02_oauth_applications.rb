web_application = Doorkeeper::Application.new(
    :name => 'Web Application',
    :redirect_uri => 'urn:ietf:wg:oauth:2.0:oob:fleetonrails-api'
)

android_application = Doorkeeper::Application.new(
    :name => 'Android Application',
    :redirect_uri => 'urn:ietf:wg:oauth:2.0:oob:fleetonrails-api'
)

if web_application.valid? && android_application.valid?
  web_application.save!
  android_application.save!

  puts %q[
OAuth applications created
]
end
