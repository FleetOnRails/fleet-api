set :stage, :development

set :deploy_to, '/home/fleet/api/'
set :tmp_dir, '/home/fleet/api/tmp'

set :scm, :git
set :branch, 'development'
set :repo_url, 'git@git.raven.com:fleetonrails/fleet-api.git'

set :linked_files, %w{config/database.yml}

set :keep_releases, 5

server 'fleet@app.raven.com',
       user: 'fleet',
       roles: %w{web app db},
       ssh_options: {
           user: 'fleet',
           forward_agent: true,
           keys: %w(~/.ssh/id_rsa),
           auth_methods: %w(publickey)
       }
