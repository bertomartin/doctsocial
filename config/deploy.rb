set :application, "doctsocial.com"
role :app, application
role :web, application
role :db, application, :primary => true

set :user, "deploy"
set :deploy_to, "/srv/www/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "git@github.com:bertomartin/doctsocial.git"
set :branch, "master"


namespace :deploy do
  desc "Tell Passenger to restart the app"
  task :restart do 
    run "touch #{current_path}/tmp/restart.txt"
  end
  
  desc "Symlink to shared config and files not in repository"
  task :symlink_shared do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end

#after 'deploy:update_code', 'deploy:symlink_shared'







# default_run_options[:pty] = true
# set :scm_passphrase, "deploy"
# set :branch, "master"
# ssh_options[:forward_agent] = true
# 
# set :application, "savorylist.com"
# set :user, "deploy"
# #set :repository,  "git@github.com:bertomartin/savorylist.git"
# set :repository,  "git@github.com:bertomartin/sample_app.git"
# set :deploy_to, "/srv/www/savorylist.com/"
# 
# set :location, "savorylist.com"
# set :runner, user
# 
# role :app, application
# role :web, application
# role :db,  application, :primary => true
# 
# 
# set :scm, :git
# 
# 

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

#role :web, "your web-server here"                          # Your HTTP server, Apache/etc
#role :app, "your app-server here"                          # This may be the same as your `Web` server

#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end