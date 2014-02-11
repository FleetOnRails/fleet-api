set :stage, :development

# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary
# server in each group is considered to be the first
# unless any hosts have the primary property set.
#role :app, %w{fleet@app.raven.com}
#role :web, %w{fleet@app.raven.com}
#role :db, %w{fleet@app.raven.com}

server 'fleet@app.raven.com',
       user: 'fleet',
       roles: %w{web app db},
       ssh_options: {
           user: 'fleet', # overrides user setting above
           forward_agent: true,
           auth_methods: %w(password),
           password: '?K?3wKP-asz^BrZ'
       }
#server 'iefapi002.fleetonrails.eu',
#       user: 'iefapi002',
#       roles: %w{web app},
#       ssh_options: {
#           user: 'iefapi002', # overrides user setting above
#           #     keys: %w(/home/user_name/.ssh/id_rsa),
#           forward_agent: true,
#           auth_methods: %w(publickey password),
#           password: 'Fleetdeploy2013'
#       }

# setting per server overrides global ssh_options

# fetch(:default_env).merge!(rails_env: :development)
