

get '/games/:id' do
  @game = Game.find(params[:id])
  @deck = @game.deck
  @cards = @deck.cards
  session[:indexes] = []
  @cards.each do |card|
    session[:indexes] << card.id
  end
  session[:indexes].shuffle!
  erb :'games/show'
end


post '/games' do
  @deck = Deck.find(params[:deck_id])
  @game = Game.create(user_id: session[:user_id], deck_id: @deck.id)

  redirect "/games/#{@game.id}"
end


post '/games/:id' do
  @user = User.find(session[:user_id])
  @deck = Deck.find(params[:id])
  idx = session[:indexes].first
  if !session[:indexes].empty?
    @card = Card.find(idx)
    @game = Game.find(session[:game_id])
    @guess = Guess.create(card_id: @card.id, game_id: session[:game_id])
    # @game.increment!(:total_guesses)
      if @card.answer == params[:answer]
        session[:indexes].shift
        # @guess.increment!(:guess_count)
        # @game.increment!(:num_correct)

        # if @guess.guess_count < 2
        #   # @game.increment!(:first_try_count)
        # end

        erb :"games/show"
      else
        # @guess.increment!(:guess_count)
        # @game.increment!(:num_incorrect)


        erb :"games/show"
      end

  else
    redirect "/users/#{session[:user_id]}"
  end
  # erb :'games/show'
end




