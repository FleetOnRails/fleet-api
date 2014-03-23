set :application, 'fleet-api'
set :stages, %w(production development)
set :default_stage, 'development'

set :scm, :git
set :repo_url, 'git@git.raven.com:fleetonrails/fleet-api.git'
set :linked_files, %w{config/database.yml}
set :keep_releases, 5
