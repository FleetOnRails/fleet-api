set :application, 'fleet-api'
set :stages, %w(production development)
set :default_stage, 'development'

set :deploy_to, '/home/fleet/api/'
set :tmp_dir, '/home/fleet/api/tmp'

set :scm, :git
set :branch, 'development'
set :repo_url, 'git@git.raven.com:fleetonrails/fleet-api.git'

set :linked_files, %w{config/database.yml}

set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute "mkdir #{current_path}/tmp"
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  desc 'reload the database with seed data'
  task :seed do
    run "cd #{current_path}; bundle exec rake db:seed RAILS_ENV=#{development}"
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do

    end
  end

  after :finishing, 'deploy:cleanup'
end
