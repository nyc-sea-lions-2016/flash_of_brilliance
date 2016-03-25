get '/deck' do
	@decks = Deck.all
	
	erb :deck
end

get '/user/:id' do
	redirect 'users/:id'
end

get '/deck/:id' do

	erb :'/game'
end



