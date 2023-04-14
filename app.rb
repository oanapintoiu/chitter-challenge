require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep_repository'
    also_reload 'lib/user_repository'
  end


get '/' do
return erb(:homepage)
end

get '/peeps' do
  repo = PeepRepository.new
  @peeps = repo.sort_by_rev_time
  return erb(:peeps)
end



end
























# post '/new_user' do
#   if invalid_request_params
#     status 400
#     return ''
#   end
#   repo = UserRepository.new
#   user = User.new
#   user.full_name = params[:full_name]
#   user.username = params[:username]
#   user.password = params[:password]
#   user.email = params[:email]

#   repo.create(user)
# end