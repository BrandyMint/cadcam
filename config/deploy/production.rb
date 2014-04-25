set :stage, :production
server 'cadcam.chebytoday.ru', user: 'wwwcadcam', port: 238, roles: %w{web app db}
set :rails_env, :production
set :branch, ENV['BRANCH'] || 'master'
fetch(:default_env).merge!(rails_env: :production)
