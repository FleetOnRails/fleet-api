set :stage, :production

set :deploy_to, '/home/fleet_production/'
set :tmp_dir, '/home/fleet_production/tmp'

set :branch do
  default_tag = `git tag`.split("\n").last

  tag = Capistrano::CLI.ui.ask "Tag to deploy (make sure to push the tag first): [#{default_tag}] "
  tag = default_tag if tag.empty?
  tag
end

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

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute "mkdir #{current_path}/tmp"
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  desc 'load the database with seed data'
  task :seed do
    on roles(:db), in: :sequence, wait: 5 do
      with rails_env: fetch(:rails_env) do
        execute "cd #{current_path}; bundle exec rake db:seed_fu RAILS_ENV=production"
      end
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do

    end
  end

  after :finishing, 'deploy:cleanup'
end
