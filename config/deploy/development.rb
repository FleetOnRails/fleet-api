set :stage, :development

set :deploy_to, '/home/fleet/api/'
set :tmp_dir, '/home/fleet/api/tmp'

set :branch, 'development'

server 'fleet@app.raven.com',
       user: 'fleet',
       roles: %w{web app db},
       ssh_options: {
           user: 'fleet',
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
        execute "cd #{current_path}; bundle exec rake db:seed_fu RAILS_ENV=development"
      end
    end
  end

  desc 'link shared directories'
  task :link_shared_directories do
    run "ln -s #{shared_path}/uploads #{release_path}/public/uploads"
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do

    end
  end

  after 'deploy:update_code', :link_shared_directories
  after :finishing, 'deploy:cleanup'
end
