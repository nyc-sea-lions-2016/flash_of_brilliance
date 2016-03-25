get '/deck' do
	@decks = Deck.all

	erb :deck
end

get '/deck/:id' do

	erb :'/game'
end



