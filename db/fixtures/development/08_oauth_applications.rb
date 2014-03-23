web_application = Doorkeeper::Application.new(
    :name => 'Web Application',
    :uid => '0a53466ed458c313ba5ee4d555b3e5a8ab76c36a66adbfcd3af54bd3ed1cec02',
    :secret => '86438505b551e5ee6882449041ba74c4e00cb2ad2107ad0eddfce7838993136e',
    :redirect_uri => 'urn:ietf:wg:oauth:2.0:oob:fleetonrails-api'
)

android_application = Doorkeeper::Application.new(
    :name => 'Android Application',
    :uid => '6580560f202f0293c502921483f9f4d53471cbbebd558e5627aeaedae245d0ff',
    :secret => 'cfbf7aea1377edc7fa2cdf780ae199b626f9812e36ef012e0641cecd3f93c21b',
    :redirect_uri => 'urn:ietf:wg:oauth:2.0:oob:fleetonrails-api'
)

if web_application.valid? && android_application.valid?
  web_application.save!
  android_application.save!

  puts %q[
OAuth applications created
]
end
