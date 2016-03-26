 post '/games/:id/guesses' do
  @user = User.find(session[:user_id])
  @game = Game.find(params[:id])
  idx = session[:indexes].first
  @card = Card.find(idx)
  @guess = Guess.create(card_id: @card.id, game_id: @game.id)
  if @card.answer == params[:answer]
    session[:indexes].shift
  else
    #guess counter stuff
  end
  if session[:indexes].empty?
    redirect "/users/#{@user.id}"
  else
    redirect "/games/#{@game.id}"
  end

 end

    # @game.increment!(:total_guesses)

        # @guess.increment!(:guess_count)
        # @game.increment!(:num_correct)

        # if @guess.guess_count < 2
        #   # @game.increment!(:first_try_count)
        # end


       # @guess.increment!(:guess_count)
        # @game.increment!(:num_incorrect)

  # erb :'games/show'
