set :stage, :production

set :deploy_to, '/home/fleet_production/'
set :tmp_dir, '/home/fleet_production/tmp'

set :scm, :git
set :branch, 'development'
set :repo_url, 'git@git.raven.com:fleetonrails/fleet-api.git'

set :linked_files, %w{config/database.yml}

set :keep_releases, 5

server 'fleet_production@app.raven.com',
       user: 'fleet_production',
       roles: %w{web app db},
       ssh_options: {
           user: 'fleet_production',
           forward_agent: true,
           keys: %w(~/.ssh/id_rsa),
           auth_methods: %w(publickey)
       }
