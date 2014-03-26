set :stage, :production

set :deploy_to, '/home/fleet_production/'
set :tmp_dir, '/home/fleet_production/tmp'

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

  desc 'Prompt for or tag'
  task tag_to_deploy: :'git:wrapper' do
    on roles(:all) do
      available_tags = `git fetch --tags && git tag`.split("\n")
      latest_tag = `git fetch --tags && git tag`.split("\n").last

      run_locally do
        tag_prompt = "Enter a tag to deploy, available tags are #{available_tags}, latest tag is #{latest_tag}"

        ask(:tag, tag_prompt)
        tag_target = fetch(:tag)

        execute "echo \"About to deploy tag '#{tag_target}'\""
        set(:branch, tag_target)
      end
    end
  end

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

  before 'deploy:starting', :tag_to_deploy

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
    end
  end

  after :finishing, 'deploy:cleanup'
end
