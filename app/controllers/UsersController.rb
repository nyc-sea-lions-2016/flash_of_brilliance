get '/' do
  "redirect to login"
end


get '/users/:id' do
  # may implement helper methods for current user
  # @user = User.find_by(id: session[:id])
  @user = User.find_by(id: 1)

  erb :'users/show'
end
