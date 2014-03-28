web_application = Doorkeeper::Application.new(
    :name => 'Web Application',
    :uid => '73bb593a38b4dc659c189ec6749fc1fd323330b12d86f1f25f4e2d3575c8d1ac',
    :secret => 'cbbbf066762f56a4b97f7f85791156d6f1a0bb2b0901fa4dae6285179faa13bd',
    :redirect_uri => 'urn:ietf:wg:oauth:2.0:oob:fleetonrails-api'
)

android_application = Doorkeeper::Application.new(
    :name => 'Android Application',
    :uid => 'fafd692a4a7415ef0095eb92591550aff5c14e751302a34e9d1ec6a8f7b621f9',
    :secret => '8ad41adce09596458f6fedb5df101454c9a3470073ac49196135cc81cf89d21e',
    :redirect_uri => 'urn:ietf:wg:oauth:2.0:oob:fleetonrails-api'
)

if web_application.valid? && android_application.valid?
  web_application.save!
  android_application.save!

  puts %q[
OAuth applications created
]
end
