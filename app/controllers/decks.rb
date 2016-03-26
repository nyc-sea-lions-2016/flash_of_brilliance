get '/decks' do
	@decks = Deck.all

	erb :'decks/index'
end

get '/user/:id' do
	@user = User.find(params[:id])
  erb :'users/:id'
end

get '/decks/:id' do
	redirect '/games/show'
end



