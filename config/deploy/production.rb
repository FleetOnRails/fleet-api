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

namespace :deploy do
  desc 'load the database with seed data'
  task :seed do
    on roles(:db), in: :sequence, wait: 5 do
      with rails_env: fetch(:rails_env) do
        execute "cd #{current_path}; bundle exec rake db:seed_fu RAILS_ENV=production"
      end
    end
  end
end
