require 'bundler/capistrano'

set :stages, %w(staging production)
set :default_stage, "production"
set :deploy_via, :remote_cache
require 'capistrano/ext/multistage'

set :application, "beilabs.com"
default_run_options[:pty] = true

set :user, "jonathan"
set :scm, "git"
set :branch, "master"
set :repository,  "git@github.com:beilabs/www.beilabs.com.git"
set :port, 22

role :web, "beilabs.com"                          # Your HTTP server, Apache/etc
role :app, "beilabs.com"                          # This may be the same as your `Web` server
role :db,  "beilabs.com", :primary => true        # This is where Rails migrations will run

after "deploy:symbolic_links"

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  desc "Make symlink for database yaml"
  task :symbolic_links do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "rm #{release_path}/app/views/shared/_analytics.html.erb"
    run "ln -nfs #{shared_path}/config/_analytics.html.erb #{release_path}/app/views/shared/_analytics.html.erb"
    run "rm #{release_path}/config/config.yml"
    run "ln -nfs #{shared_path}/config/config.yml #{release_path}/config/config.yml"

  end
end

