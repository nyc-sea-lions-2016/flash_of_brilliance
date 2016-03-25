get '/login' do
  erb :login
end

post '/login' do
  user = User.find_by(user_name:params[:user][:user_name])
  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    @errors = ["Wrong email or password"]
    erb :login
  end
end

get '/users/new' do
  erb :new
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    @errors = ["Email is already taken"]
    erb :'users/new'
  end
end


