

get '/games/:id' do
  @game = Game.find(params[:id])
  @deck = @game.deck
  idx = session[:indexes].first
  @card = Card.find(idx)
  erb :'games/show'
end


post '/games' do
  @deck = Deck.find(params[:deck_id])
  @cards = @deck.cards
  @game = Game.create(user_id: session[:user_id], deck_id: @deck.id)
  session[:indexes] = []
  @cards.each do |card|
    session[:indexes] << card.id
  end
  session[:indexes].shuffle!

  redirect "/games/#{@game.id}"
end







