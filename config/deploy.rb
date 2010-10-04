
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

after "deploy:update_code", "bundler:bundle_new_release", "deploy:symbolic_links"

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  desc "Make symlink for database yaml"
  task :symbolic_links do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end

namespace :bundler do
  task :create_symlink, :roles => :app do
    shared_dir = File.join(shared_path, 'bundle')
    release_dir = File.join(current_release, '.bundle')
    run("mkdir -p #{shared_dir}")
    run "ln -nfs #{shared_path}/bundle #{release_path}/.bundle"
    run "ln -nfs #{shared_path}/bundler_gems #{release_path}/vendor/bundler_gems"
    run "rm #{release_path}/app/views/shared/_analytics.html.erb"
    run "ln -nfs #{shared_path}/config/_analytics.html.erb #{release_path}/app/views/shared/_analytics.html.erb"
  end

  task :bundle_new_release, :roles => :app do
    puts "Installing bundler gems"
    bundler.create_symlink
    run "cd #{release_path} && bundle install vendor/bundler_gems"
  end

  task :after_update_code, :roles => [:app, :db, :web] do
    run "cd #{release_path} && script/runner Meta.last_commit"
    run "cd #{release_path} && rake asset:packager:build_all"
    run "for file in $(find #{release_path}/public/javascripts \\
      -name '*.js'); do gzip $file -f -c > $file.gz; done"
    run "for file in $(find #{release_path}/public/stylesheets \\
      -name '*.css'); do gzip $file -f -c > $file.gz; done"
  end
end
