set :stage, :production

set :deploy_to, "/home/#{user}/"
set :tmp_dir, "/home/#{user}/tmp/"

set :scm, :git
set :branch, 'development'
set :repo_url, 'git@git.raven.com:fleetonrails/fleet-api.git'

set :linked_files, %w{config/database.yml}

set :keep_releases, 5

server 'fapi001@app.raven.com',
       user: 'fapi001',
       roles: %w{web app db},
       ssh_options: {
           user: 'fapi001',
           forward_agent: true,
           keys: %w(~/.ssh/id_rsa),
           auth_methods: %w(publickey)
       }

server 'fapi002@app.raven.com',
       user: 'fapi002',
       roles: %w{web app db},
       ssh_options: {
           user: 'fapi002',
           forward_agent: true,
           keys: %w(~/.ssh/id_rsa),
           auth_methods: %w(publickey)
       }
