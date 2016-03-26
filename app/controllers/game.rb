get '/games/:id' do
  @deck = Deck.find(params[:id])
  @cards = @deck.cards
  session[:indexes] = []
  @cards.each do |card|
    session[:indexes] << card.id
  end
  session[:indexes].shuffle!
  @card = Card.find(session[:indexes].first)
  @game = Game.create(user_id: session[:user_id], deck_id: @deck.id)
  session[:game_id] = @game.id
  erb :'games/show'
end

post '/games/:id' do
  @deck = Deck.find(params[:id])
  idx = session[:indexes].first
  @card = Card.find(idx)
  @game = Game.find_by(user_id: session[:user_id])
  @guess = Guess.create(card_id: @card.id, game_id: session[:game_id])
  if session[:indexes].any?
    if @card.answer == params[:answer]
      @guess.guess_count += 1
      session[:indexes].shift
      redirect "/games/#{@deck.id}"
    else
      @guess.guess_count += 1
      erb :'games/show'
    end
  else
    redirect "/users/#{session[:user_id]}"
  end
  erb :'games/show'
end



