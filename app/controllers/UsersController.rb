get '/' do
  "redirect to login"
end


get '/users/:id' do
  # may implement helper methods for current user
  # @user = User.find_by(id: session[:id])
  @user = User.find_by(id: session[:user_id])
  @games = Game.where('user_id = ?', session[:user_id])
  erb :'users/show'
end


