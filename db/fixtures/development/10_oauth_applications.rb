web_application = Doorkeeper::Application.new(
    :name => 'Web Application',
    :uid => '7236d09f6fd8210ea98914b603cbf4b3b10f6ef3ad8ad308e9f24b4a326cabb4',
    :secret => '6080523131ac5b51fd73bd1bfe073658de7684b1d497cff6c789d0b8adf17a82',
    :redirect_uri => 'urn:ietf:wg:oauth:2.0:oob:fleetonrails-api'
)

android_application = Doorkeeper::Application.new(
    :name => 'Android Application',
    :uid => 'bb44bd52efb7af50e9b12a14ab9b5059f9650ed0fad04f29e1dc0838a3655492',
    :secret => '25ad5c1ecb760bb859fb96def8a72e506b9e73fb040b7208c88292e16cbb2a70',
    :redirect_uri => 'urn:ietf:wg:oauth:2.0:oob:fleetonrails-api'
)

if web_application.valid? && android_application.valid?
  web_application.save!
  android_application.save!

  puts %q[
OAuth applications created
]
end
