require "capistrano/ext/multistage"

## Stage settings.
set :stages, ["staging", "production"]
set :default_stage, "staging"

## Application settings.
set :application, "portal"
set :app_symlinks, ["cache", "sites", "analytics.config.php", "configuration.php"]

# Server user settings.
set :user, "deploy"
set :port, 9999
set :use_sudo, false

# Deployment settings.
set :deploy_to, "/var/www/lokalepolitie.be/capistrano"
set :deploy_via, :copy
set :copy_via, :scp
set :copy_exclude, [".git"]
set :keep_releases, 3

# Repository settings.
set :repository, "git@git.assembla.com:timble-police.git"
set :scm, :git
set :scm_username, "deploy@timble.net"

namespace :deploy do
    # Overwrite :finalize_update to prevent unrelevant command executions.
    task :finalize_update, :roles => :app, :except => { :no_release => true } do
        run "chmod -R g+w #{release_path}" if fetch(:group_writable, true)
    end
    
    # Create symbolic links for shared directories.
    task :symlink_shared, :roles => :app do
        if app_symlinks
            app_symlinks.each do |link|
                run "ln -fns #{shared_path}/#{link} #{release_path}/code/#{link}"
            end
        end
    end
    
    desc "Restart the application."
    task :restart do
        run "curl -vs -o /dev/null http://localhost/apc_clear.php > /dev/null 2>&1"
    end
    
    # Do nothing in these tasks.
    task :migrate do; end
    task :migrations do; end
    task :cold do; end
    task :start do; end
    task :stop do; end
end

# Hook into default tasks.
after "deploy:update_code", "deploy:symlink_shared"
after "deploy:update", "deploy:cleanup"