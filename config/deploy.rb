set :application, 'bluemoonharmonicas'
set :repo_url, 'git@github.com:chrislerum/bluemoonharmonicas.git'
set :deploy_to, '/home/deployer/sites/bluemoonharmonicas'
set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}
#set :assets_roles, [:app]

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :deploy, 'deploy:restart'
  after :finishing, 'deploy:cleanup'

end
