get '/login' do
  erb :login
end

post '/login' do
  user = User.find_by(user_name:params[:user][:user_name])
  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.user_name
    redirect "/deck/#{user.id}"
  else
    @log_in_errors = ["Wrong email or password"]
    erb :login
  end
end

get '/users/new' do
  erb :new
end

post '/users' do


end
